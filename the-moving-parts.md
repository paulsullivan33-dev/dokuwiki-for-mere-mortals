# The Moving Parts

By the end of this chapter you can point
at any part of a DokuWiki installation
and say what it holds — which turns
every later surprise into a named
problem in a named folder. DokuWiki has
fewer moving parts than most web
programs, precisely because there is no
database among them.

## The program: PHP files that answer requests

DokuWiki is a set of PHP scripts. PHP is
a programming language for web servers:
a request arrives, a script runs, a
page of HTML comes back. Almost every
request to a wiki goes to one script,
`doku.php`, and the rest of the address
says what is wanted:

```text
doku.php?id=garden:plot-map        the page itself
doku.php?id=garden:plot-map&do=edit      its edit form
doku.php?id=garden:plot-map&do=revisions its old versions
doku.php?do=recent                 recent changes, wiki-wide
doku.php?do=search&q=tomatoes      full-text search
doku.php?do=admin                  the administration screens
```

The `do=` word is the *action*; leave it
off and you get the ordinary reading
view. Two smaller scripts stand beside
`doku.php`: `lib/exe/fetch.php`, which
hands out stored images and files, and
`install.php`, the one-time installer —
which the installer itself tells you to
delete once it has done its work.

## The wiki itself: the `data/` folder

Everything the wiki *contains* lives
under `data/`:

| Folder | What lives there |
| --- | --- |
| `data/pages/` | the pages, one text file each |
| `data/media/` | uploaded images and files |
| `data/attic/` | old versions of pages, compressed |
| `data/meta/` | each page's change log and notes |
| `data/index/` | the search index |
| `data/cache/` | rendered pages kept for speed |
| `data/locks/` | "someone is editing this" markers |
| `data/tmp/` | scratch space |

Namespaces are folders inside `pages/`:
the page `garden:beds:bed-1` is the file
`data/pages/garden/beds/bed-1.txt`.
Chapter 7 works in this folder directly.

## The steering: the `conf/` folder

Everything that says how the wiki
*behaves* lives under `conf/`, again as
readable files:

- `conf/dokuwiki.php` — every setting,
  with the value the release ships.
  Never edit this one; it is the
  reference copy.
- `conf/local.php` — *your* settings,
  only the ones you changed. The
  installer creates it; the admin
  screens write to it; it wins over the
  defaults. Chapter 11 changes the
  wiki's title in it and watches the
  whole site rename itself.
- `conf/users.auth.php` — one line per
  user: login name, password hash, real
  name, email, groups.
- `conf/acl.auth.php` — one line per
  permission rule: which pages, which
  people, how much access.
- `conf/plugins.local.php` — one line
  per switched-off plugin; a plugin
  with no line is on.

## The extensions: `lib/plugins/`

Plugins are small add-on programs, and
the release already bundles the
important ones: the user manager, the
permission manager, the configuration
manager, the extension manager, and
more. Chapter 11 switches one off and
on again. Hundreds more exist in the
public library at dokuwiki.org; this
guide uses only the bundled set, and
says so.

## Who does what, in one request

Someone asks for `garden:plot-map`.
`doku.php` checks the permission rules:
may this reader see it? It reads
`data/pages/garden/plot-map.txt`,
renders the writing into HTML (or
serves the cached copy from
`data/cache/` if nothing changed), and
answers. If the reader edits instead,
the old text moves to `data/attic/`,
the new text becomes the page file, the
change is noted in `data/meta/`, and
the search index learns the new words.
Nothing else is involved — no database,
no queue, no second program. When
something is wrong, it is wrong in one
of the folders above, and the
troubleshooting chapter hunts there.
