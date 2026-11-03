# Users and Permissions

By the end of this chapter the wiki has
members with names, one namespace is
locked to a committee, and the lock has
been tested as four different readers —
including the two who should not get
in. A group wiki earns its keep when
people sign their edits; it earns its
trust when private pages are actually
private.

## Accounts

The **User Manager** (Admin → User
Manager) adds, edits and removes
accounts: login name, password, real
name, email, and **groups**. Underneath,
it maintains the file chapter 2
promised — `conf/users.auth.php`, one
line per user, with the password stored
as a hash, never as readable text:

```text
priya:<password-hash>:Priya Nair:priya@example.com:user
sana:<password-hash>:Sana Iqbal:sana@example.com:user,committee
```

Transcript t07 adds two members this
way: Priya, in the group `user` like
every member, and Sana, additionally in
`committee`. Every account is in `user`
automatically in spirit — the
installer's starting rules key off that
group — and extra groups are how a wiki
says "these people, additionally". The
superuser sits above the system: the
account the installer created belongs
to the group named in the `superuser`
setting (by default `@admin`) and can
do everything, rules or no rules.

Self-registration is a setting, and the
lab left the installer's choice in
place; a closed group will usually
switch it off and let an administrator
add members by hand — chapter 12 has
the recipe.

## The permission ladder

Access is a number, and the numbers
build on each other:

| Level | Means |
| --- | --- |
| 0 | nothing — not even reading |
| 1 | read |
| 2 | edit existing pages |
| 4 | create new pages |
| 8 | upload media |
| 16 | delete pages |
| 255 | administer (only meaningful for the superuser setting) |

A rule names a scope — `*` for
everything, a namespace like
`committee:*`, or one page — then who
it applies to (`@ALL` for everyone,
`@user`, `@committee`, or one login
name), then the number. Rules live in
`conf/acl.auth.php`, one per line; the
**Access Control List manager** (Admin
→ ACL) is the screen that reads and
writes that file. The installer's
starting pair grants everyone reading
and members editing-and-uploading,
wiki-wide.

## Locking the committee's pages

The lab's committee keeps draft minutes
the wider group should not see until
the general meeting. The page is
`committee:minutes`; the lock is two
lines appended to `acl.auth.php` —
exactly the lines the ACL manager
itself writes when the same rules are
entered on its screen, and transcript
t07 shows the manager listing them
afterwards as proof the file is the
real store:

```text
committee:*    @ALL         0
committee:*    @committee   8
```

Read as English: in the committee
namespace, everyone gets nothing —
*unless* a more specific grant applies,
and committee members get 8 (read,
edit, create, upload). Then the test,
as four readers asking for the same
page:

```text
anonymous        -> Permission Denied
priya (member)   -> Permission Denied
sana (committee) -> the minutes, in full
admin            -> the minutes, in full
```

And Priya, refused there, reads the
public pages without friction — the
lock is a wall around one namespace,
not a change to her membership. Three
habits to take from this: test every
rule as the person it should refuse,
not only as the person it should
admit; keep rules few and ordered
widest-first in your head (specific
scopes beat general ones, and a grant
beats `@ALL`'s nothing within the same
scope); and remember chapter 12's
warning — these rules bind requests to
the wiki program, while the page files
themselves stay readable to anyone with
access to the machine's disk.
