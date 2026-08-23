# Feature — Content and Web

## Intent

**Waytide gains conventions for content**, which is often aimed at the web and may also be
education materials, slide decks, and articles. Hugo with the Hextra theme is the first attempt,
and the `website` project is the worked case — it already runs both.

The idea this realizes is *Waytide for content and web*, in `local/ideas/`, recorded 2026-08-23.
**That idea is `Open`**, and it is open on the shape rather than the direction: whether content
conventions and Hugo conventions are one package or two. **That was to have been a hinge.** It is not, because
Design By Efferent does not govern content work here — see the local rule of 2026-08-23.

- **Tags:** [feature]

## Setup

- **Upstream branch:** `master`
- **Implementation branch:** `feature/content-and-web`
- **Base:** `fd0f126f9056c7ce75e1e8d6f2d125954cf67a82`, from `master`
- **Working location:** branch only. This working tree switches back to `master` at the
  conclusion.

**No forecast is stated.** A feature is built to an intent rather than to a question, so there is
nothing to predict and nothing to compare a prediction against. See the implementations-convention.

## Confirmations

- **2026-08-23 — Working location: branch only.** Put through the selection interface at the
  start, with branch and worktree and the current branch offered beside it. The engineer selected
  branch only.
- **2026-08-23 — Participation: attended.** Put through the selection interface at the same gate,
  in the words the attended-or-unattended-is-chosen-at-the-start rule fixes. The engineer selected
  attended, which is the default. The loop waits at every hinge.

## The intent widened on 2026-08-23

**The feature builds the package set mechanism as well as the content conventions.** It was
started to give Waytide conventions for content. Three decisions the same day widened it, and the
record says so rather than being rewritten:

- **A package set is a named list of packages**, written down and installable by that name.
  `content` is the first one.
- **`install-all.sh` takes a list of names**, and a name is a package set or a package.
- **Design By Efferent does not govern this work**, by the local rule written at the start. So the
  five hinges below are not put, and no loop record is opened.

**So this feature realizes three ideas rather than one.** *Waytide for content and web*, *A
content project is a named package set*, and *The install takes a package set on the command line*.
The last two moved to `Active` when these were settled.

## What the idea leaves open

Named at the start from the idea's own account. These were to have been hinges; with DBE not
governing this work, they are settled as the work reaches them.

- **One package or two.** How an article or a lesson is written holds whatever renders it. Where
  Hugo front matter goes, and what Hextra's shortcodes are, is inert without Hugo. `code/ruby`
  held both kinds and that mixing is why `code/` was the wrong grouping name.
- **Whether Hextra is separable from Hugo.** A theme's shortcodes and layout expectations are not
  the generator's.
- **What "content" admits.** An article, a lesson, and a slide deck may not share one set of
  conventions.
- **Where it is authored.** `tools/ruby-lang` is authored in its own repository rather than split
  out of the composite, and whether that is the pattern or a one-off is unsettled.

## What this reaches, and one thing it collides with

- **`tools/`**, whose second member this is. The grouping's admission question — what counts as a
  tool — was left for the second member to settle, and this is it.
- **The `website` project**, a sibling repository, which is where the material is and which would
  be the first consumer.
- **The install approach.** *The install takes a package set on the command line* records that a
  tool package declares the whole system as its dependency and carries an installer of its own,
  and that a second tool package is what makes that fail to compose. **This feature is that second
  tool package**, and on 2026-08-23 it forced the question rather than waiting on it: the install
  mechanism is built here.

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:09:02 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:36:15 AM PT
