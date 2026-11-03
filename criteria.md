# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same nine-point
standard, so a reader who trusts one can trust the rest. Here it
is, with the verification notes for this particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items: each
   chapter opens by naming the outcome it delivers, shows a check
   the reader can run to confirm they got it, and a reasonable
   reader finishes able to state what was done, what it means,
   and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader may
   be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows it,
   and the transcripts kept in the repository are the evidence.
   What could not be run is listed honestly below, never
   presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any particular
   reader or author's real life, network, or organisations.
   The lab's wiki belongs to an invented garden club, and its
   members are invented people.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help, it
   is pointed to once, by name, and the chapter still completes
   without it.
7. **Honest about limits.** Chapter 12 names what the tool
   cannot do: plain-file storage caps its scale; the permission
   rules bind the wiki program only, while page files stay
   readable to anyone with disk access; editing is one person
   at a time with conflicts refused, not merged; its syntax is
   its own dialect, not Markdown; and it is a group notebook,
   not a public website platform or an encrypted vault.
8. **The ethics rule is in the text, early.** A wiki
   concentrates a group's trust, so the README and chapter 1
   state this guide's line before any procedure depends on it:
   permissions are a promise to the group's members, so keep
   the promise small — nothing on a readable page that the
   group would mind showing a stranger, restrictions proven by
   testing as the refused reader, and no genuinely secret
   material in a tool that stores pages as plain files.
   Passwords are only ever handled as the hashes DokuWiki
   stores; the transcripts hide them.
9. **Builds clean.** The site builds with MkDocs in strict mode
   with no warnings, and a fresh reader following the chapters
   in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is a 2-CPU, 7.7 GB Ubuntu 24.04 sandbox,
shared with other work while the lab ran. DokuWiki
**2026-07-14c "Mort"** was downloaded from the project's
official download service (`download.dokuwiki.org`) as
`dokuwiki-stable.tgz`, SHA-256
`7e9b4dcb5ecb91a57f71b9b77dcec7bcf929959881464796611349ed1d183176`,
and run unmodified on PHP 8.3.6, served by PHP's built-in web
server on loopback port 18092. All transcripts live in
`dokuwiki-lab/transcripts/`; the lab's page texts are in
`dokuwiki-lab/fixtures/`, and its page-saving script is
`dokuwiki-lab/dw-edit.sh`.

The lab drove the wiki the way a browser does — with `curl`,
holding real login sessions in cookie jars and posting the
wiki's own forms (installer, edit form, user manager, media
manager, extension manager) — but it did not use a graphical
browser. Claims about what the pages *do* are therefore
measured from the served HTML and the files on disk; claims
about how they *look* are not made beyond the template's
ordinary appearance.

Run for real, with transcripts as evidence:

- Download, checksum, version file, and the release layout,
  including the bundled plugin set and the command-line tools
  in `bin/` (t00).
- Installation through `install.php`'s own POST endpoint with
  the form's real fields; the three files the installer
  writes (`local.php`, `users.auth.php`, `acl.auth.php`) read
  back, its starting rules quoted exactly (t01).
- Login as the installer-created admin; four pages saved
  through the edit form (a helper script replays the form's
  hidden tokens, as a browser does), their rendered titles
  read back, and the four matching page files listed (t02).
- A PNG created by the lab uploaded through the media
  manager's own form; the stored file listed in
  `data/media/garden/`; the file fetched back through
  `fetch.php` (200, `image/png`, same byte count), including
  the finding that path-style fetch addresses need URL
  rewriting while the `?media=` form works as shipped (t03).
- A syntax-tour page exercising headings, emphasis, lists,
  links (internal, external, interwiki), a table, an embedded
  resized image, code and file blocks, a quote, a footnote and
  a rule, each verified in the rendered HTML; a Markdown-style
  strikethrough (`~~text~~`) caught unrendered and corrected
  to DokuWiki's typed `<del>` tag (t04).
- A page file read whole, then edited directly on disk with
  the wiki running; the new sentence served on the next
  request with no import or restart; the `data/` subfolder
  census and the attic's compressed revision files (t05).
- A page created two namespaces deep; the matching folder
  tree on disk; the sitemap's entries; a link to a
  never-written page rendered with the `wikilink2` class
  (t06).
- Two users added through the User Manager (groups `user`,
  and `user,committee`); a committee page created; two ACL
  rules added to `acl.auth.php` and confirmed listed by the
  ACL manager screen; the page requested as anonymous, as an
  ordinary member (both "Permission Denied"), as a committee
  member and as admin (both served), and the refused member
  reading public pages normally (t07).
- Two further edits to one page; its Old Revisions list with
  dates and edit summaries; a two-version diff with the
  changed line shown both ways; full-text search returning
  three pages for `tomatoes` — after the shipped
  `bin/indexer.php` was run, because the index normally
  refreshes through a hidden tracker image the lab's fetches
  never loaded; Recent Changes listing the lab's pages and
  the media upload (t08).
- Configuration layering: the shipped default and the local
  value of the wiki title side by side; the title changed in
  `conf/local.php`, observed in every page head and in the
  Configuration Manager's own form, then changed back (t09).
- A bundled plugin (`popularity`) disabled and re-enabled
  through the Extension Manager, with the state line
  `$plugins['popularity'] = 0;` appearing in and disappearing
  from `conf/plugins.local.php`; `bin/plugin.php` opened and
  found to be a dispatcher for plugin-provided command-line
  tools, not a switchboard (t10).
- Failures, deliberately: an anonymous edit request receives
  no editor; a stale edit form's save refused with "A newer
  version exists"; a page deleted by emptying its text, its
  file gone and its versions remaining in the attic; one
  unclosed-quote line appended to `conf/local.php` producing
  HTTP 500 with an empty body and a parse error naming the
  file and line in the server log — after a few seconds of
  opcode-cache grace — and restoring the backup copy bringing
  the wiki straight back (t11).
- A complete backup archive of `data/` and `conf/` created
  and its listing checked for a page file, the user file and
  the rules file (t12).

Documented only — described from the project's documentation
or the release's own files, not run, and the text does not
claim otherwise:

- Serving the wiki behind Apache or nginx (including pretty
  URLs and path-style media addresses), TLS, and any
  production hardening; the lab's server is PHP's built-in
  one, on loopback.
- Sending mail from the wiki (password resets, change
  notifications, generated passwords by email) — no mail
  service existed in the lab.
- Community plugins from the public library: none installed.
  The neighbour tools of chapter 13 (BookStack, MediaWiki,
  Obsidian-style folders, hosted wikis) — characterised, not
  run.
- The Revert plugin's bulk undo, media deletion and the media
  attic, page renaming practice, and the upload-failure causes
  listed in chapter 14 (the lab's upload succeeded).
- Restoring a backup onto a fresh release (chapter 12's
  recipe) — the archive and its contents were verified; the
  restore itself was not performed.
- How the wiki looks and feels in a graphical browser,
  including the visual editor aids and drag-and-drop upload.

Fixtures are this guide's own and deliberately generic: an
invented community garden club ("Elm Street"), invented
members, `example.com` addresses, and a test picture drawn by
a script — no real people, organisations or events. The
passwords used in the lab were lab-only throwaways; the
transcripts show password hashes only in redacted form.
