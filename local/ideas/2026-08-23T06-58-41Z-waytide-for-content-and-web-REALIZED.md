# Waytide for content and web

- **State:** Realized
- **Tags:** [design]

**Why this state:** what the idea describes exists. The engineer declared it done on 2026-08-24.

## Settled

- **2026-08-24 — the idea is realized**, through the Package Sets feature rather than through a new
  package. `content` is a named set of packages `install` places — `foundation`, `language`, `git`,
  `versioning`, and `journal` — and the website declares it.
- **2026-08-24 — the first question was answered by neither of its two candidates.** It asked
  whether content conventions and Hugo conventions are one package or two. The answer was a
  **set** of existing packages, which is a third shape the record did not consider: a content
  project is served by naming which of Waytide's packages apply to it.
- **2026-08-24 — no Hugo or Hextra conventions package exists.** The tool half of the first
  question is not built, and the realization did not require it.

## Premise

**As the engineer stated it:**

- Record ideas for content that will often be aimed at web, but could be education materials,
  slide decks, articles
- Probably will focus on hugo + hextra, at least as a first attempt

## What already exists to build on

**The `website` project is a consuming project and is already Hugo with Hextra.** Its `hugo.yaml`
declares `theme: hextra`, and it holds the ordinary Hugo layout — `content/`, `layouts/`,
`assets/`, `archetypes/`, `data/`, `i18n/`, `static/`. So the first attempt has a worked case
rather than a hypothetical one.

**`tools/` was established on 2026-08-21** and Hugo is a tool. The tool-specific packages section
of the root README says more are to come and that what the grouping admits is not settled, naming
a build system among the readings a tool might take. **This is the second member arriving**, and
it is the case that question gets settled against.

## The first question: one package or two

**Content conventions and Hugo conventions are not the same kind of rule**, and putting them in
one package would repeat the defect the `tools/` rename corrected.

- **How an article, a lesson, or a slide deck is written** is a domain concern. It holds whatever
  renders it, and it would still hold if the site moved off Hugo tomorrow. It is nearer to
  `language` than to a tool.
- **Where a Hugo page's front matter goes, what Hextra's shortcodes are, how a section is
  organized** is a tool concern, inert in a project that does not use Hugo.

**`code/ruby` held both kinds and that is why it read badly.** It carried prescriptive Ruby style,
which is the language, alongside `running-the-test-suite`, which is TestBench, and
`releasing-a-gem`, which is RubyGems. The `tool/` idea named exactly that as the reason `code/` was
the wrong grouping name.

**So the likely shape is two**: a content package that is not tool-specific, and `tools/hugo`
under the grouping. Neither is settled here.

## What is not settled

- **One package or two**, and if two, what the content one is called and whether it sits under a
  grouping at all.
- **Whether Hextra is separable from Hugo.** A theme's shortcodes and layout expectations are not
  the generator's. `tools/hugo` holding Hextra rules would be the same mixing at a smaller scale.
- **What "content" admits.** An article, a lesson, and a slide deck are different enough that one
  set of conventions may not reach all three. The engineer named all three, and whether they share
  rules is open.
- **Where it is authored.** `tools/ruby-lang` is authored in its own repository rather than split
  out of the composite. Whether that is the pattern for every tool package or a one-off is not
  settled either.
- **Whether the `website` project is the first consumer or the first author.** It is where the
  material is, and it is a sibling repository rather than part of this one.

## The feature started for it was renamed away from it

**2026-08-23 — *Feature — Content and Web* became *Feature — Package Sets*.** It was started to
realize this idea and produced two commits against it before a mechanism the system lacked took the
work. Nothing in it touches Hugo, Hextra, or what a content package holds.

**So this idea is not realized and awaits a feature of its own.** What it gained from the detour is
that the configuration it wants is now declarable: a content project can hold every package and run
five.

Related:

- *The grouping is `tool/`, not a language* — the grouping this would join, and the question it
  said would be settled by a second member
- *Waytide's Self-Explanation* and *A Generalized Description of Waytide* — the two aspirations
  that already reach the website, whose production and presentation live in that project
- the `tools/ruby-lang` package — the worked precedent for a tool package and for authoring one
  outside the composite

---

Authored by Scott Bellware on Sat Aug 22 2026 at 11:58:41 PM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:58:40 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:19:07 PM PT
