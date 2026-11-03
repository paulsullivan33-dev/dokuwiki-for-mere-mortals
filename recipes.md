# Recipes

Four jobs a group wiki asks for sooner
rather than later, each assembled from
parts the earlier chapters ran for
real.

## Back up the whole wiki into one archive

Chapter 7's inventory pays out: a wiki
is `data/` plus `conf/`, so a complete
backup is one archive of the wiki
folder's two working parts (transcript
t12):

```bash
tar czf garden-wiki-backup.tgz -C /path/to/dokuwiki data conf
```

The check is to list the archive and
find the things that matter — a page
file, the user list, the rules:

```text
data/pages/gardening/season-notes.txt
conf/users.auth.php
conf/acl.auth.php
```

Restoring is the same shape in reverse:
unpack a fresh release, lay the two
folders over it, serve. Keep the
archive somewhere that is not the same
disk as the wiki; a backup beside the
original is a copy, not a backup.

## Give a new member an account

Admin → User Manager → the add form:
login name, a password (or let the wiki
generate one and email it, where mail
is set up), real name, email, and the
group `user`. Then tell them the two
addresses worth memorising — the front
page and Recent Changes — and the one
habit worth copying: write an edit
summary every time. Transcript t07
added the lab's members exactly this
way. If the wiki should be closed to
strangers, also switch off
self-registration in the Configuration
Manager — the *Register* entry under
"Disable DokuWiki actions" — so
accounts only ever arrive by this door.
*(That one switch is described from the
settings file's own documentation; the
lab's registration stayed as the
installer left it.)*

## Retire a page properly

Open the page, Edit, delete *all* the
text, Save. An empty save is DokuWiki's
delete: the page file is removed, the
address goes back to "this page does
not exist yet" — transcript t11 did it
to a scratch page and confirmed the
file gone — and links to the page turn
the red colour of chapter 6, which is
how you find everything that still
points at it. The page is not beyond
recall: its last versions remain in
the attic, and restoring one (Old
Revisions → Edit → Save) brings the
page back. Delete in a wiki is a
filing decision, not a shredder.

## Check a whole wiki in one pass

Five minutes, five checks, all from
earlier chapters:

1. **Front door.** Log out, open the
   wiki, confirm public pages read and
   one restricted page refuses you
   (chapter 9's test, rerun).
2. **Heartbeat.** Recent Changes shows
   edits you recognise, by people you
   recognise (chapter 10).
3. **Search.** Search a word you know
   is on exactly one page; if it does
   not answer, think of the index
   before the pages (chapter 10).
4. **Disk.** Read `data/pages/` with
   fresh eyes — the filenames *are* the
   wiki's table of contents (chapter 7).
5. **Backup.** Make the archive from
   the first recipe, and check its
   listing for the same three files.

A wiki that passes all five is healthy
in every way its design lets you check
from outside a text editor.
