# Namespaces and Links

By the end of this chapter you can file
pages where they belong and read a
wiki's links at sight — including the
ones pointing at pages nobody has
written yet. A wiki with twelve pages
needs no organisation; a wiki with two
hundred needs exactly the light kind
DokuWiki offers.

## Namespaces: colons are folders

A page's full name — its **ID** — is a
path with colons: `garden:beds:bed-1`.
Each part before the last is a
**namespace**, and namespaces nest as
deep as you like. There is no namespace
to create first and no registry to
update: using the name creates the
structure, exactly as saving a file
into a new folder would. That is not a
metaphor here. Transcript t06 saves
`garden:beds:bed-1` and then lists what
is on disk:

```text
garden/beds/bed-1.txt
garden/plot-map.txt
garden/watering-rota.txt
```

Namespace, folder; page, file. The lab
used two sibling namespaces on purpose
— `garden:` for the shared spaces,
`gardening:` for the craft notes — to
show that names are just names: similar
is not the same, and the wiki will not
warn you. Choose few, choose clear,
and let the wiki's search forgive the
rest.

Inside a page, links can be relative to
where you stand: `[[watering-rota]]`
from another `garden:` page means
`garden:watering-rota`; a leading colon
(`[[:garden:watering-rota]]`) names the
page absolutely, from the root. The
guide's pages use absolute names so the
text means the same wherever it is
quoted.

## The two colours of a link

DokuWiki renders a link to an existing
page in one colour (class `wikilink1`
in the page's HTML) and a link to a
missing page in another (class
`wikilink2`), usually shown reddish.
Transcript t06 catches the plot map
linking to `garden:bed-list`, a page
the lab deliberately never wrote:

```html
<a href="/doku.php?id=garden:bed-list" class="wikilink2" ...>full bed list</a>
```

A red link is not an error. It is the
wiki keeping a promise: *this page
should exist*. Clicking it offers the
editor, and writing the page turns
every such link, everywhere, into the
ordinary colour. Groups use this as
their to-do list — a wiki full of red
links is a work plan wearing its
intentions on the outside.

## Seeing the whole shape

The sitemap (`doku.php?do=index`) lists
namespaces and pages as a tree; big
branches load as you open them.
Transcript t06 lists the lab wiki's
entries — `garden` and its pages,
`gardening` and its pages, the
`committee` pages — the same census as
the folder listing beside it, because
it could not be otherwise: the tree is
drawn from the folders. Media live in
namespaces too (chapter 8): the picture
at `garden:garden-sign.png` sits in
`data/media/garden/`, filed by the same
rule as the pages.

A naming rule worth adopting on day
one: page names are lowercase, words
joined by dashes or underscores, no
spaces. DokuWiki tidies what you give
it — capitals fold down, spaces become
underscores — but tidy names keep links
guessable, and a guessed address that
works is the wiki's party trick: any
member who knows the system can walk
straight to `garden:watering-rota`
without asking anyone where it lives.
