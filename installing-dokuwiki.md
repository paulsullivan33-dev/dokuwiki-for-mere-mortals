# Installing DokuWiki

By the end of this chapter the wiki
answers at its address and has exactly
one account: yours, the administrator.
The install is three acts — download,
serve, answer the installer form — and
each has a check.

## What you need

A machine with **PHP** on it. DokuWiki
2026-07-14c asks for PHP 7.4 or newer;
the lab's PHP was 8.3.6, with the usual
companion modules (`mbstring`, `gd`,
`intl`, `openssl` among them) already
present. No database. No other program.
Check yours the same way the lab did:

```bash
php --version | head -1
```

## Download, and check the download

DokuWiki comes from the project's own
download service as one compressed
archive, `dokuwiki-stable.tgz`. The
lab's copy, recorded in transcript t00:

```text
$ sha256sum dokuwiki-stable.tgz
7e9b4dcb5ecb91a57f71b9b77dcec7bcf929959881464796611349ed1d183176  dokuwiki-stable.tgz
$ cat dokuwiki/VERSION
2026-07-14c "Mort"
```

Record the checksum of *your* download
the same way; it is the habit that
makes "did I get the real file?" a
question with an answer. Unpack it and
the wiki is a single folder —
`doku.php`, `install.php`, and the
`conf/`, `data/`, `lib/` folders of
chapter 2. Nothing is installed into
the system; the folder *is* the
installation, which is why moving a
wiki is copying a folder.

## Serve it

A permanent home puts Apache or nginx —
full-sized web servers — in front of
the wiki and lets them run its PHP.
That step is described from the
documentation in this guide, not run:
the lab used the simpler honest option,
PHP's own built-in web server, which is
part of PHP itself and entirely
adequate for a group wiki on a home
network:

```bash
php -S 127.0.0.1:18092 -t /path/to/dokuwiki
```

One address, one port, serving the
unpacked folder. The check that it
works: open the address and you are
forwarded to `install.php`, whose title
is "DokuWiki Installer".

## The installer form

The installer is a single web form. It
asks for:

- **Wiki title** — the name shown on
  every page. The lab used "Elm Street
  Community Garden Wiki", for an
  invented club whose pages fill this
  guide.
- **Enable ACL** — switch on the
  access-control system. Say yes: users
  and permissions (chapter 9) are half
  the point of a group wiki, and turning
  this on later is more work.
- **Superuser** — the administrator's
  login name, with their full name,
  email, and a password. This account
  can do everything, including things
  no rule restricts.
- **Initial ACL policy** — who may do
  what before you write rules of your
  own. The lab chose "public read,
  register to edit", then replaced it
  with hand-written rules in chapter 9.
- **License** for the wiki's content,
  chosen from a list; the lab picked
  CC BY-SA, matching this series.

Saving the form writes `conf/local.php`,
`conf/users.auth.php` and
`conf/acl.auth.php` — transcript t01
keeps installer output and all three
files. Its closing line is the check:
"The configuration was finished
successfully." The starting rules it
wrote are worth reading once:

```text
*    @ALL    1     everyone may read everything
*    @user   8     signed-in members may also edit and upload
```

The numbers are permission levels;
chapter 9 explains the whole ladder.
The installer also delivers the default
pages (`start`, a syntax reference, a
playground) so the wiki is never empty
on day one.

Two closing duties. First, **delete
`install.php`**, as the installer itself
instructs — a leftover installer is an
open door with your settings half
filled in. Second, visit the wiki and
log in with the superuser account: the
words "Logged in as" followed by your
name, at the top of the page, are the
proof the installation is alive and the
account works. Transcript t02 begins
with exactly that check.
