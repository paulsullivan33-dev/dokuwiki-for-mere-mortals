# DokuWiki for Mere Mortals

Some knowledge belongs to a group, not
to one person's notebook: the watering
rota, the plot map, the notes about what
grew well last year. A **wiki** is a
small website the group itself can edit —
every page has an Edit button, and
changing the shared knowledge is as easy
as reading it. **DokuWiki** is a wiki
that keeps a deliberate promise: it needs
**no database**. Every page is a plain
text file in a folder, every old version
is a compressed file beside it, and the
whole wiki — pages, pictures, users,
settings — can be carried away in one
archive and read with ordinary tools.

That one decision shapes everything this
guide teaches. Installing DokuWiki is
unpacking a folder and answering a short
form. Backing it up is copying two
folders. Fixing a page with a text
editor works, because a page *is* a text
file. Permissions live in a readable
file too, and the guide proves each of
these claims in its lab rather than
asking you to believe them.

The lab behind this guide ran the real
thing: **DokuWiki 2026-07-14c "Mort"**,
the official release, served by PHP's
built-in web server on a small Linux
machine — the simplest honest setup, and
chapter 3 says plainly what a permanent
home would add. Against it the lab
installed the wiki through its own
installer, wrote pages through its own
edit form, built a small invented
garden-club wiki — a plot map, a
watering rota, a page that exists only
to show the writing system working —
added users, locked one namespace to a
committee, searched, diffed old
versions against new ones, changed
settings, switched a plugin off and on,
and broke things on purpose: an edit
conflict, a deleted page, and a single
mistyped line in the settings file that
took the whole wiki down until the
backup copy went back.

What the lab could not do, it did not
fake. Everything was driven with `curl`
against the wiki's own forms and
addresses, which is a faithful way to
test a web program but is not the same
as clicking through it in a browser; the
reading experience, the look of the
pages, is described, not graded.
Running DokuWiki behind Apache or nginx,
sending its notification emails, and
gathering plugins from the public
library are taught from the
documentation and labelled as such
wherever they appear. `criteria.md`
keeps the full ledger of what was run
and what was only read.

One rule belongs up front, because a
wiki concentrates a group's trust:
**permissions are a promise, so keep
the promise small.** A page anyone can
read should hold nothing the group
would mind showing a stranger, and the
restricted pages this guide builds are
restricted by tested rules, not by
hope. Chapter 9 makes those rules, and
then checks them as four different
readers — including the reader who
should *not* get in.

## What this guide covers

- [**What DokuWiki is**](what-dokuwiki-is.md) —
  the mental model: pages a group edits
  together, stored as plain files, with
  no database anywhere in the building
- [**The moving parts**](the-moving-parts.md) —
  the PHP program, the `data/` folder
  that is the wiki, the `conf/` folder
  that steers it, and the one address
  every request goes through
- [**Installing DokuWiki**](installing-dokuwiki.md) —
  the release download and its checksum,
  a simple web server, and the installer
  form that creates the first account
- [**Your first pages**](your-first-pages.md) —
  logging in, the edit–save round trip,
  and the outline of a small working
  wiki in one sitting
- [**Writing with DokuWiki syntax**](writing-with-dokuwiki-syntax.md) —
  headings, emphasis, lists, tables,
  links, pictures, footnotes and code,
  each shown rendered, not just written
- [**Namespaces and links**](namespaces-and-links.md) —
  colons that organise pages into
  folders, the two colours of a wiki
  link, and the sitemap
- [**Pages are just files**](pages-are-just-files.md) —
  the proof chapter: edit a page in a
  text editor and watch the wiki serve
  it; where history, media and the
  search index live
- [**Media — images and files**](media-images-and-files.md) —
  uploading through the media manager,
  how a stored file is fetched back,
  and embedding it on a page
- [**Users and permissions**](users-and-permissions.md) —
  accounts and groups, the permission
  numbers, and a namespace locked to a
  committee and tested as four readers
- [**Finding and following changes**](finding-and-following-changes.md) —
  full-text search and its index, recent
  changes, old revisions, and reading a
  diff
- [**Settings and plugins**](settings-and-plugins.md) —
  the layered settings files, the
  configuration manager, and switching
  a bundled plugin off and on
- [**Recipes**](recipes.md) — back the
  whole wiki up into one archive, give
  a new member an account, retire a
  page properly, and check a whole wiki
  in one pass
- [**The neighbours**](the-neighbours.md) —
  BookStack, MediaWiki, a folder of
  Markdown files, and the hosted wikis:
  what each does that DokuWiki doesn't,
  and vice versa
- [**Limits**](limits.md) — no database
  cuts both ways, plain files are plain
  to anyone with disk access, and the
  other honest edges
- [**Troubleshooting**](troubleshooting.md) —
  the settings typo that stops
  everything, the edit conflict, the
  search that finds nothing, and the
  traps this guide's lab fell into
- [**Glossary**](glossary.md) — the
  terms, collected in one place

## What it doesn't cover

Running DokuWiki as a public website
for strangers at scale — this guide's
wiki is a group's working notebook, and
its serving setup is the simple one,
with the production step (a real web
server in front) described, not run.
The hundreds of community plugins are
pointed at, not reviewed; the bundled
ones are the ones put through their
paces. Themes and visual design are
likewise named, not taught — this guide
is about the writing system and the
filing system underneath it.

## How to use this guide

Read chapter 1 for the model, and
chapter 2 before installing anything —
knowing which folder holds what turns
later confusion into a named problem.
Chapters 3 and 4 get you a running wiki
with real pages in the first sitting.
Chapter 7 is the one to read slowly: it
is the proof that the filing-system
story is true, and every later chapter
leans on it. The lab's transcripts live
in `dokuwiki-lab/transcripts/`; the
pages it wrote are in
`dokuwiki-lab/fixtures/`, and the small
script that saved pages the way a
browser does is `dokuwiki-lab/dw-edit.sh`.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [BookStack for Mere Mortals](https://paulsullivan33-dev.github.io/bookstack-for-mere-mortals/)
- [Obsidian for Mere Mortals](https://paulsullivan33-dev.github.io/obsidian-for-mere-mortals/)
- [HedgeDoc for Mere Mortals](https://paulsullivan33-dev.github.io/hedgedoc-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/dokuwiki-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/dokuwiki-for-mere-mortals/blob/main/LICENSE-CODE).
