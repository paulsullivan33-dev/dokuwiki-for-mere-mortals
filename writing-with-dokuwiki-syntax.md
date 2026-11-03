# Writing with DokuWiki Syntax

By the end of this chapter you can write
a page that looks like a document, not
a note: headings, emphasis, lists,
tables, links, a picture, code, a
footnote. DokuWiki's writing system —
its **syntax** — is plain text with
marks in it, its own dialect, *not*
Markdown. This chapter is built around
one page, `gardening:syntax-tour`, that
uses the whole set; transcript t04
keeps the page's rendered HTML as proof
for each feature named below. The full
text of the page is in
`dokuwiki-lab/fixtures/syntax-tour.txt`.

## Headings and paragraphs

Surround a line with equals signs; more
signs, smaller heading:

```text
====== Syntax Tour ======
===== Lists =====
==== A smaller heading ====
```

Blank lines separate paragraphs. A line
ending in two backslashes, `\\`, breaks
there instead of flowing on.

## Emphasis

```text
**bold**        //italic//        __underlined__
''monospace''   <del>struck through</del>
```

Note the last one, because it catches
every newcomer from Markdown: `~~text~~`
does nothing in DokuWiki. The lab wrote
it first, watched it come back
unrendered (transcript t04 keeps the
moment), and fixed it to the typed tag
`<del>text</del>` — the strikethrough
you write is a small piece of the HTML
you get. Subscript and superscript
follow the same pattern: `<sub>`,
`<sup>`.

## Lists

Two spaces, then `*` for a bulleted
item, `-` for a numbered one; indent
further to nest:

```text
  * a fork
  * a trowel
    * the small one for seedlings

  - unlock the shed
  - check the rain gauge
```

The rendered page shows a proper
unordered and ordered list — `<ul>`,
`<ol>` in the proof transcript.

## Links

```text
[[garden:watering-rota]]                  a page, named by its address
[[garden:watering-rota|the rota]]         the same, with your own words
[[https://www.example.com|an outside site]]
[[wp>Compost|composting, on Wikipedia]]   an interwiki link
```

An **interwiki** link uses a short
prefix the wiki knows (`wp>` for
Wikipedia) and lets the wiki build the
long address. A link to a page that
exists and one that does not render in
different colours — chapter 6 is about
that distinction, which is the wiki's
main tool for growing.

## Tables

Caret `^` marks a header cell, pipe `|`
an ordinary one:

```text
^ When     ^ Who   ^ Job        ^
| Monday   | Amara | Watering   |
| Saturday | All   | Big dig    |
```

## Pictures, code, and the rest

A picture already uploaded (chapter 8)
embeds with double braces, an optional
width, and a caption:

```text
{{garden:garden-sign.png?120|The garden sign}}
```

Code the reader may copy goes between
`<code>` tags; a whole downloadable
block uses `<file csv beds.csv>` and
keeps its lines exact. A quotation is a
line beginning `> `. A footnote is text
in double parentheses —
`((like this))` — lifted out of the
paragraph and collected, numbered, at
the foot of the page. Four dashes alone
on a line, `----`, draw a horizontal
rule. To show a mark without it acting,
wrap it: `%%**not bold**%%`.

Every one of those features appears on
the syntax-tour page, and transcript
t04 greps the rendered result for each:
the `<h1>` and `<h2>` headings, the
`<del>`, the table, the resized
`<img>` served through the media
fetcher, the ordered list, the footnote
marker, the blockquote, the rule. Write
the page, then check the page — that is
this guide's habit, and the syntax
chapter is where it is cheapest to
learn.
