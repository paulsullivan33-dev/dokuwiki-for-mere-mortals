# Finding and Following Changes

By the end of this chapter you can find
a page by a word inside it, see what
changed anywhere in the wiki lately,
and read one page's history line by
line — who, when, what, and exactly
which words moved. A wiki that cannot
answer "where did we write that down?"
and "what did it say before?" is a
cupboard with no light; these are the
light switches.

## Search, and the index behind it

The search box (`doku.php?do=search`)
is a full-text search: it finds pages
by their words, not just their names.
The lab searched for `tomatoes` and got
three pages back — the watering rota,
the plot map, and the bed page —
transcript t08. Behind the box sits the
**index** in `data/index/`: a word list
the wiki builds from the pages, so a
search is a lookup, not a scan.

The lab also met the index's one
quirk, and it is worth meeting here
rather than in the troubleshooting
chapter: at first, the search found
*nothing at all*. DokuWiki refreshes a
page's index entry when the page is
viewed, using a tiny hidden tracker
image in the served page — and the
lab's scripts, which fetch pages
without loading images, had never
triggered it. Real readers never see
this; a browser loads the image without
being asked. For machines, the release
ships an indexer for the command line,
and transcript t08 runs it:

```bash
php bin/indexer.php
```

One run later, the same search returns
its three pages. The lesson generalises:
if a wiki's search seems deaf, suspect
a stale index before suspecting the
pages.

## Recent changes

`doku.php?do=recent` lists the latest
edits across the whole wiki, newest
first, each with its page, time,
author, and edit summary. Transcript
t08's list is the lab's own afternoon:
the committee minutes created, the bed
page, the uploaded picture (media
changes are listed too), the rota,
the notes, the syntax tour. For a group,
this page is the heartbeat — the
morning glance that shows the wiki is
alive and who has been tending it. An
RSS feed of the same list exists
(`feed.php`) for readers who follow
several sites that way.

## Old revisions and the diff

Every page keeps its past selves.
**Old Revisions** (`do=revisions`)
lists them; the lab's rota, after three
saves, reads:

```text
2026/11/03 01:27   wording tidy
2026/11/03 01:27   heat wave note
2026/11/03 01:25   rota created
```

— date, author, and the summary each
editor wrote at save time, which is why
chapter 4 nagged about summaries.
Choose any two versions and the wiki
shows a **diff**: the text side by side
with changed lines marked, deleted one
way, added the other. The lab's diff
between the two middle versions is one
line each way:

```text
before: Water early, before the heat. One full can per bed, ...
after:  Water early, before the heat of the day. One full can ...
```

Nothing about this history is
decorative. The attic files of chapter
7 *are* these versions; the revision
list is their index; and any version
can be brought back — open it, press
Edit, save — which turns "someone
ruined the page" from an incident into
a shrug. The bundled **Revert** plugin
extends the same idea to undoing a run
of vandalism in one pass; it is named
here from the bundled set, and the lab
did not need it.
