# Media — Images and Files

By the end of this chapter the wiki
holds a picture, serves it back on
demand, and shows it inside a page at
the size you chose. Pages are text, but
a group's knowledge is not only text: a
photo of the whiteboard, the sign for
the gate, a spreadsheet of last year's
yields. DokuWiki calls all of it
**media**, and files it by the same
rule as pages.

## Uploading

The media manager is the wiki's upload
screen — reached from a page's tools,
or while editing, where uploaded images
can be dropped straight into the text.
It asks three things: the file, the
namespace it belongs to, and the name
to store it under (the file's own name
if you say nothing). Transcript t03
uploads the lab's test picture — a
small green sign, drawn by a script so
the lab owed nobody a photo — through
the media manager's own form:

```text
$ ls -la data/media/garden/
-rw-r--r-- 1 root root 253 ... garden-sign.png
```

The stored file is the uploaded file,
byte for byte, in
`data/media/garden/` — the media twin
of the page folders. Namespaces apply
to media exactly as to pages, so
`garden:garden-sign.png` sits with the
garden's pages by name, and permissions
(chapter 9) can treat them together.

File types are governed by
`conf/mime.conf`, the shipped list of
what may be uploaded; the wiki refuses
what is not listed, which is a security
feature wearing a bureaucratic hat.
Files land with the *upload* permission
— level 8 on the ladder of chapter 9 —
so a group can let members read and
edit pages while reserving uploads to
fewer people.

## Getting a stored file back

Media are handed out by a small script
of their own, `lib/exe/fetch.php`, and
it can transform images on the way: ask
for a width and the answer is a resized
copy, made once and cached. The lab's
check fetched the sign twice — as
stored, and as embedded at 120 pixels
in the syntax-tour page, where the
renderer's `<img>` points at a fetch
address carrying `w=120`. One detail
the transcript records because it
surprises everyone once: the tidy
path-style address (`fetch.php/media/…`)
only works when URL rewriting is
switched on in the settings; the plain
form, `fetch.php?media=garden:garden-sign.png`,
always works.

## Embedding

Chapter 5 showed the syntax:

```text
{{garden:garden-sign.png?120|The garden sign}}
```

The address after `{{` is the media
ID — namespace and name — `?120` is the
width in pixels, and the words after
the bar are the caption and the
alternative text. Leave the size off
for the natural size; add alignment by
padding with spaces inside the braces.
A media file that is not an image — a
PDF, a spreadsheet — embeds as a link
with an icon, and the same fetch script
serves the download.

Deleting media mirrors deleting pages:
the file leaves `data/media/`, its
earlier versions are kept in a media
attic (`data/media_attic/`), and pages
that showed it display a broken-image
gap — the one genuinely untidy corner
of the filing system, and a reason to
rename media rarely and pages freely,
rather than the other way round.
