# Pages Are Just Files

By the end of this chapter the guide's
central claim is no longer a claim: you
will have watched a page change because
its file changed, with no browser
involved. This is the chapter to read
slowly. Everything else DokuWiki does —
backup, repair, migration, trust — is
a consequence of what is proven here.

## The page file, whole

Ask the disk what the season-notes page
*is* (transcript t05):

```text
$ cat data/pages/gardening/season-notes.txt
====== Season Notes ======

Notes from the beds, newest first.
...
```

It is the text the editor held — the
same syntax marks, the same words. No
header, no record format, no encoding
beyond plain text. If you can read this
guide, you can read a DokuWiki page
file, and the day the wiki program
itself is unavailable, the knowledge is
still sitting there in sentences.

## The experiment: edit the file, not the page

Transcript t05 then appends one line to
that file with an ordinary shell
command —

```bash
printf '\nThe shed lock was oiled on Saturday; it turns freely now.\n' \
  >> data/pages/gardening/season-notes.txt
```

— and asks the wiki for the page again.
The new sentence is there, rendered
like any other line. The wiki noticed
the file's newer timestamp, set its
cached rendering aside, and re-read the
file. No import step, no cache-clearing
ceremony, no restart.

The same trick works in the other
direction and at scale: a folder of
text files dropped into `data/pages/`
*is* a set of wiki pages, which is how
a group can adopt DokuWiki with its
existing notes — write the files in
DokuWiki syntax, copy them in, and the
wiki serves them. Two cautions, both
seen in the lab's design rather than
its accidents: edits made on disk carry
no author's name into the page history
(they appear as external edits), and a
person editing a file while another
edits the same page in the browser can
still collide — the filing cabinet is
honest, not magical.

## The rest of the cabinet

While the folder is open, transcript
t05 counts what else `data/` holds.
The subfolders of chapter 2, with the
lab's numbers:

- `attic/` — every earlier version of
  every page, one compressed file per
  version, named with its timestamp:
  `season-notes.1793669103.txt.gz`.
  This folder is the reason Delete in a
  wiki is gentle (chapter 14) and the
  reason chapter 10's diffs exist.
- `meta/` — a small change log per
  page: who changed it, when, and the
  edit summaries from chapter 4.
- `media/` — uploaded files in their
  namespaces, byte for byte what was
  uploaded (chapter 8).
- `index/` — the search index: word
  lists, rebuilt from the pages
  themselves whenever needed.
- `cache/` — rendered pages kept for
  speed. Deleting the whole folder is
  safe; it refills.

Add `conf/` beside `data/` — settings,
the user list, the permission rules —
and you have the complete inventory of
a wiki. That inventory is short enough
to hold in your head, and it makes the
operations of chapter 12 almost
disappointingly simple: the backup is
an archive of two folders, the move to
a new machine is unpacking it there,
and the disaster-recovery plan is "keep
the archive somewhere else". Programs
with databases ask more of you because
they *are* more; a wiki made of files
asks less because it is less, on
purpose.
