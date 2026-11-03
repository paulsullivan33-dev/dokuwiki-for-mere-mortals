# What DokuWiki Is

A group keeps knowledge in scattered
places: one person's notebook, a chat
thread from March, a spreadsheet only
one member can open. A **wiki** is the
shared alternative — a small website
where every page carries an Edit
button, so the person who spots the
mistake can fix it on the spot, and the
fix is there for everyone from that
moment on. **DokuWiki** is a wiki
program, written in the PHP language,
that a group runs on its own machine or
its own hosting.

Its defining choice is what it leaves
out. Most web programs keep their
content in a **database** — a separate
program that stores tables and answers
queries. DokuWiki has none. A page is a
plain text file. A picture is an
ordinary image file. The list of users
is a text file with one line per
person, and the permission rules are a
text file with one line per rule. The
whole wiki is a folder tree you can
browse, copy, back up, and — chapter 7
proves it — edit with nothing but a
text editor when you feel like it.

That is worth pausing on, because it is
the reason the tool exists. DokuWiki
began in 2004 as a wiki for
documentation teams who wanted
something they could install on any web
hosting and carry away again without
ceremony. Twenty years on, the same
design still pays out daily: there is
no database to install, tune, dump or
restore; the backup is a folder copy;
and the answer to "where does *that*
live?" is always a path you can open.

## A first taste

After installing (chapter 3), a page is
one address and one form. The address
names the page:

```text
http://127.0.0.1:18092/doku.php?id=garden:watering-rota
```

Everything after `id=` is the page's
name — namespaces before the last
colon, page after it. Open it, press
**Edit this page**, write in the plain
writing system of chapter 5, and save.
What comes back is the finished page —
and on disk, in
`data/pages/garden/watering-rota.txt`,
the exact text you wrote. Chapter 4
walks the round trip; chapter 7 opens
the filing cabinet and checks.

## What it is not

DokuWiki is not a database-backed
publishing platform: there is no
article workflow, no scheduled posts,
no comment threads under pages — a wiki
page is a shared document, and the
conversation about it belongs
elsewhere. It is not a real-time
collaborative editor where several
cursors type at once; two people saving
the same page collide, and DokuWiki's
answer is an honest refusal this guide
reproduces in chapter 14, not a silent
merge. It is not a note-taking app for
one person's private thoughts — its
whole shape assumes readers plural —
and it is not a website builder for the
general public: it will serve a tidy,
readable site, but presentation is the
least of its ambitions. BookStack,
MediaWiki and friends take their turn
in chapter 13.

## Who it is for

The club that keeps its rotas, minutes
and hard-won know-how in one place its
members can fix. The small team
documenting its own systems on its own
server. The household that wants the
manual for the house — boiler settings,
paint colours, the wifi password's
*hiding place*, if not the password —
somewhere everyone can find and update
it. The common thread is a group, its
own machine, and knowledge that belongs
to all of them.

## The honest catch, up front

Plain files cut both ways, and this
guide says so where it matters: anyone
who can read the wiki's folder can read
every page in it, including the
"restricted" ones — the lock is at the
wiki's front door, not on the filing
cabinet (chapter 12 returns to this).
And a wiki is only as alive as its
gardeners: DokuWiki makes editing easy,
but it cannot make anyone edit. What it
can do — and what this guide sets out
to prove, page by page — is remove
every technical excuse.
