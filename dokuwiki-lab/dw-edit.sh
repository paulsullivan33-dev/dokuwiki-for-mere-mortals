#!/usr/bin/env bash
# dw-edit.sh JAR PAGEID TEXTFILE SUMMARY
# Saves TEXTFILE as the full content of PAGEID in the lab wiki, using the
# same requests a browser makes: GET the edit form, read its hidden fields
# (security token, change check), then POST them back with the new text.
set -eu
JAR=$1; ID=$2; TEXT=$3; SUMMARY=${4:-edit}
BASE=http://127.0.0.1:18092
FORM=$(curl -s -b "$JAR" -c "$JAR" "$BASE/doku.php?id=$ID&do=edit")
get() { printf '%s' "$FORM" | grep -oE "name=\"$1\" value=\"[^\"]*\"" | head -1 | sed -E 's/.*value="([^"]*)"/\1/'; }
curl -s -b "$JAR" -c "$JAR" -o /dev/null -w "save $ID -> HTTP %{http_code}\n" \
  -X POST "$BASE/doku.php" \
  --data-urlencode "id=$ID" \
  --data-urlencode "sectok=$(get sectok)" \
  --data-urlencode "rev=$(get rev)" \
  --data-urlencode "date=$(get date)" \
  --data-urlencode "prefix=$(get prefix)" \
  --data-urlencode "suffix=$(get suffix)" \
  --data-urlencode "changecheck=$(get changecheck)" \
  --data-urlencode "target=$(get target)" \
  --data-urlencode "wikitext@$TEXT" \
  --data-urlencode "summary=$SUMMARY" \
  --data-urlencode "do[save]=1"
