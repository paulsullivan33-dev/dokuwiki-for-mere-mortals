# Your First Pages

By the end of this chapter the wiki has
real pages of its own — a welcome page,
a plot map, a watering rota, a page of
season notes — written through the
wiki's own edit form, and you have seen
the round trip every later chapter
depends on: edit, save, read.

## The round trip

Reading a page and editing it are the
same address with a different action.
For the wiki's front page, `start`:

```text
doku.php?id=start            read it
doku.php?id=start&do=edit    edit it
```

Press **Edit this page** (or follow the
`do=edit` form of the address) and the
page's text opens in an editing box,
plain text with the writing marks of
chapter 5 visible. Change the text,
write a few words in the **Edit
summary** line — "welcome page
written" — and press **Save**. The wiki
answers by showing the finished page.

Three things happened behind that one
button, and each leaves evidence:

- The old text, if any, moved to the
  attic (`data/attic/`) — nothing is
  ever overwritten into oblivion.
- The new text became the page file
  (`data/pages/start.txt`).
- The change joined the page's history
  with your name, the time, and your
  summary — chapter 10 reads it back.

The lab made its edits with a small
script (`dokuwiki-lab/dw-edit.sh`) that
performs precisely these requests — it
fetches the edit form, reads the hidden
tokens the form carries, and posts the
form back with new text, the way a
browser does. Nothing in the results
depends on the script; it is in the lab
folder so any reader can repeat the
transcripts exactly.

## Creating a page that does not exist

A wiki page is born from a link or from
its address. Type an address for a page
nobody has written —

```text
doku.php?id=garden:watering-rota
```

— and instead of an error, the wiki
says the page does not exist yet and
offers to create it. Follow the offer,
and the same edit form opens, empty.
This is deliberate design, and it is
how wikis grow: write the link first,
in the page that needs it, and fill the
new page in when you reach it. The
welcome page the lab wrote links to
three pages that did not exist when it
was saved; each was created minutes
later by following its own link.

## The lab's first four pages

Transcript t02 keeps the whole session.
The wiki began as an invented garden
club's shared notebook:

- `start` — the welcome page, replacing
  the installer's default front page:
  what the wiki is for, and links onward.
- `garden:plot-map` — who tends which
  bed, in a small table.
- `garden:watering-rota` — the week's
  watering turns, as a list.
- `gardening:season-notes` — dated
  notes from the beds.

The checks at the end of the transcript
are the ones to copy for your own wiki:
ask for each page and read its title
back, then list the page files on disk
—

```text
data/pages/garden/plot-map.txt
data/pages/garden/watering-rota.txt
data/pages/gardening/season-notes.txt
data/pages/start.txt
```

Four pages written in a browser-shaped
session, four files in a folder, one
for one. Hold that correspondence in
mind; chapter 7 picks it up and pulls.
