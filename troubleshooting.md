# Troubleshooting

The failures this guide's lab actually
met, plus the ones its design makes
predictable — each with the check that
names it. Transcript t11 keeps the
evidence for the first four.

## The whole wiki is a blank page (HTTP 500)

One mistyped line in `conf/local.php`
does this: the settings files are PHP
code, and a broken line — the lab's was
an unclosed quote — stops every request
with a parse error and an empty reply.
**Check:** the web server's error log
names the file and line ("syntax error…
in conf/local.php on line 12"). **Fix:**
restore the backup copy of `local.php`
you made before editing; the wiki
returns on the next request, no restart
needed. A wrinkle the lab saw: the
first request or two after the typo may
still succeed from PHP's opcode cache,
so the failure can look intermittent
for a few seconds before it is total.

## "A newer version exists" when saving

Someone saved the page after you opened
the editor — a colleague, or you in
another tab. The wiki refuses your stale
copy rather than overwriting theirs.
**Fix:** read the offered diff, copy
any of your changes that are still
missing into the current text, save
again. Nothing was lost; the collision
is the protection working.

## A deleted page that will not stay gone — or a delete you regret

Emptying a page's text and saving
deletes it (chapter 12), but its old
versions remain in `data/attic/`, so it
can reappear if anyone restores a
revision — a feature when the delete
was an accident, a surprise when it was
a purge. To truly retire content,
remove its attic files too, with the
wiki's own housekeeping in mind and a
backup made first.

## Search finds nothing, or misses a new page

Think index before content. The index
refreshes as pages are viewed (by way
of a hidden tracker image); pages added
by copying files in, or a wiki driven
only by scripts, can be invisible to
search until the index is rebuilt.
**Check:** run `php bin/indexer.php`
once, then search again — transcript
t08 is the before and after. If a
browser-driven wiki still misses words,
check the page is readable by the
searching user: search respects
permissions and hides pages the reader
may not see, which can look exactly
like an indexing fault.

## Someone cannot see a page everyone else can

Permissions, in this order: is the
person logged in as who they think
(the name at the top of the page)? Are
they in the group the rule names —
`conf/users.auth.php`, one line, tells
you? Does a more specific rule than you
remember cover that namespace —
`conf/acl.auth.php` is short enough to
read whole. Test as the refused person,
as chapter 9 did, not as the admin: the
superuser sees everything and proves
nothing.

## The picture that will not upload

Three usual causes: the file type is
not in `conf/mime.conf` (the wiki
refuses types it has not been told to
trust); the uploader's permission is
below 8 on that namespace (upload is a
higher rung than edit); or the file
exceeds PHP's own upload limits, which
belong to the server's PHP settings,
not to DokuWiki. The media manager's
message distinguishes the first two;
silence and a small file argue for the
third. *(These three are stated from
the configuration files and messages
the lab did read; the lab's own upload
succeeded first try.)*

## Upgrades are due and you are nervous

Back up `data/` and `conf/` (chapter
12's recipe), unpack the new release
over the old folder without touching
those two, delete the new copy's
`install.php` if present, and visit the
wiki. The design that makes backup
boring makes upgrades boring too.
