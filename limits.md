# Limits

Chapter 12 in spirit, and plain about
what DokuWiki cannot do, or does at a
price. A tool whose limits are named is
a tool a group can plan around.

**No database cuts both ways.** Plain
files make the wiki inspectable and
portable; they also cap its scale.
DokuWiki serves groups of dozens of
editors and thousands of pages
comfortably — the shape this guide
builds — but it is not the tool for a
public encyclopaedia with millions of
pages and thousands of simultaneous
editors: there is no database engine
optimising the hot paths, and searches
and page lists grow heavier as the
folders grow. When a wiki outgrows
files, it has become MediaWiki's job
(chapter 13), not DokuWiki's failure.

**The lock is at the front door.** The
permission rules of chapter 9 govern
requests to the wiki program. The page
files themselves sit in `data/pages/`
readable by anyone with access to the
machine's disk or its backup archives —
including the committee's "private"
minutes. Keep genuinely secret material
out of a wiki whose machine or backups
are shared; permissions organise a
group's manners, they do not encrypt.

**Editing is one person at a time.**
There is no live co-editing: two people
in one page collide, and the second
save is refused with "A newer version
exists" (chapter 14 reproduces it). The
wiki's answer is social — edit
summaries, recent changes, short turns
— not technical merging.

**Its syntax is its own.** DokuWiki
syntax is not Markdown; the Markdown
habits a writer brings (`~~strike~~`,
`# headings`) fail quietly, exactly as
transcript t04 caught one failing.
Pages do not move losslessly to or
from other systems without conversion
work, and media embedded one way do not
rewrite themselves.

**It is a notebook, not a website
platform.** No built-in comments under
pages, no article workflow or
scheduling, no fine-grained design
control beyond templates and the
bundled styling plugin. Groups wanting
a public face usually put the wiki
beside a website, not instead of one.

**It needs a keeper.** Someone owns the
PHP version, the upgrades (a release
folder laid over the old one, with
`data/` and `conf/` preserved), the
backups of chapter 12's recipe, and
the occasional glance at Recent Changes
for spam on any wiki strangers can
register for. The work is small — this
guide is the size it is because the
tool is — but it is not zero, and a
wiki with no keeper quietly becomes an
archive.
