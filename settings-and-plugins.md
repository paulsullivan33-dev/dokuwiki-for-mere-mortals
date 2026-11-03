# Settings and Plugins

By the end of this chapter you can
change how the wiki behaves — its name,
its language, who may register — and
extend or reduce what it can do by
switching plugins, knowing exactly
which file each change lands in.

## Settings: two layers and a screen

Chapter 2 introduced the layers; here
they earn their keep. `conf/dokuwiki.php`
ships every setting at its release
value — treat it as printed
documentation that happens to be code.
`conf/local.php` holds only your
changes, one `$conf[...]` line each,
and wins wherever the two disagree.
Transcript t09 demonstrates with the
setting every reader can see, the
wiki's title: default layer says
`'DokuWiki'`, local layer says the
garden club's name.

Change it in `local.php` —

```php
$conf['title'] = 'Garden Wiki (renamed in the lab)';
```

— and every page head on the site
renames itself at once, no restart,
because each request re-reads the
layered settings. The **Configuration
Manager** (Admin → Configuration
Settings) is the screen form of the
same file: it shows every setting with
its current value, and saving it writes
`local.php`. Transcript t09 checks the
renamed title *in the manager's own
form* — the same value, in the same
store, by whichever door you enter.
Use the screen for browsing what
exists; use the file when you need the
change scripted, repeated, or undone
by hand. Either way, keep a copy of
`local.php` before an experiment:
chapter 14 shows what one mistyped
line does to a wiki whose settings are
PHP code.

The settings a group meets first:
`title`; `lang`; `useacl` (the master
switch chapter 3 turned on);
`disableactions` for hiding actions
like registration; `useheading` and
friends for how page titles are drawn
from headings. Each is documented in
the file itself, beside its default.

## Plugins: the bundled shelf

A **plugin** is a folder in
`lib/plugins/` that adds a capability:
an admin screen, a piece of syntax, a
background task. The release bundles
the ones a wiki cannot run well without
— the user manager, ACL manager,
configuration manager and extension
manager of the earlier chapters are all
plugins — plus a supporting cast:
`revert` (chapter 10), `popularity`
(anonymous usage statistics, sent to
the DokuWiki project only if you leave
it on), `styling`, `logviewer`,
`safefnrecode`, and the authentication
back-ends (`authplain` is the one this
guide uses: users in the text file).

Switching is the **Extension Manager**'s
work (Admin → Extension Manager), and
its store is `conf/plugins.local.php`:
one line per *disabled* plugin, absence
meaning "on". Transcript t10 presses
Disable for the popularity plugin and
watches the file gain exactly one line —

```php
$plugins['popularity'] = 0;
```

— then presses Enable and watches the
line vanish and the manager report the
plugin enabled again. Installing
further plugins from the public library
is the same screen's other half —
search, install, done — and is
documented-only in this guide: the lab
installed none, because a fresh wiki
should learn what the bundled shelf
does before it shops. The release also
ships `bin/plugin.php`, which the lab
opened expecting a switchboard and
found something else: a dispatcher that
runs command-line tools *provided by*
plugins. It is noted here so the next
reader skips the lab's wrong turn.
