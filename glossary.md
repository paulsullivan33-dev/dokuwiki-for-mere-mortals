# Glossary

**ACL (access control list)** — the set
of permission rules deciding who may
read, edit, create, upload and delete.
In DokuWiki it is a readable file,
`conf/acl.auth.php`, edited through the
ACL manager screen.

**Attic** — the `data/attic/` folder,
holding every old version of every
page as a compressed text file. The
wiki's memory.

**Cache** — `data/cache/`, rendered
pages kept ready to serve again. Safe
to empty; it refills itself.

**Diff** — a side-by-side comparison of
two versions of a page, with changed
lines marked as removed or added.

**Edit summary** — the few words an
editor writes when saving, recorded in
the page's history beside their name.
The cheapest courtesy in a wiki.

**Fetch script** — `lib/exe/fetch.php`,
the small program that hands out stored
media, resizing images on request.

**Group** — a named set of users in the
user file (`user`, `committee`,
`admin`). Permission rules are usually
written against groups, not people.

**Index (search)** — the word lists in
`data/index/` that full-text search
looks up. Built from the pages, and
rebuildable at any time with
`bin/indexer.php`.

**Interwiki link** — a link written
with a short prefix the wiki knows,
like `[[wp>Compost]]`, which the wiki
expands into another site's long
address.

**Local settings** — `conf/local.php`,
the file of settings you have changed,
which overrides the shipped defaults
in `conf/dokuwiki.php`.

**Media** — uploaded images and files,
stored in `data/media/` under
namespaces of their own and embedded
with `{{...}}`.

**Namespace** — a folder-like division
in a page's name, written with colons:
`garden:beds:bed-1` is the page `bed-1`
in `beds` in `garden`. On disk it is
literally a folder.

**Page ID** — a page's full name,
namespaces and all. The `id=` in every
wiki address.

**Permission level** — a number from 0
(nothing) through 1 (read), 2 (edit),
4 (create), 8 (upload) to 16 (delete);
each includes the ones below it.

**Plugin** — an add-on package in
`lib/plugins/`. The release bundles the
managers for users, permissions,
settings and extensions, among others.

**Recent changes** — the wiki-wide list
of the latest edits (`do=recent`): the
group's morning heartbeat check.

**Revision** — one saved version of a
page. Every save makes a new one; Old
Revisions (`do=revisions`) lists them.

**Superuser** — the account (or group)
named in the `superuser` setting, which
may do everything regardless of the
permission rules. Created by the
installer.

**Syntax** — DokuWiki's writing system:
the plain-text marks (`======`,
`**bold**`, `[[links]]`) that the wiki
renders into a formatted page. It is
its own dialect, not Markdown.

**User manager** — the admin screen
that maintains `conf/users.auth.php`,
the one-line-per-person user file.
