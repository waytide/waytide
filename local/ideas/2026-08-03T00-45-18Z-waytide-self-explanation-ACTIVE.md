# Waytide's Self-Explanation — Aspiration

- **State:** Active
- **Tags:** [aspiration]

## Premise

Waytide explains itself to the people using it through **an interactive chat with the agent,
skewed toward explaining the system** rather than the developer's project. **The website's
content is driven by that same content.** One source, two surfaces.

**This design settles why Waytide explains itself and what that premise commits to. How the
explanation is produced and presented is settled in the `website` project**, at
`waytide/local/ideas/2026-08-03T06-45-04Z-producing-and-presenting-waytide-self-explanation.md`
— a sibling repository of this one. That design holds the two surfaces, the **projection** both
are produced from, the constraint distribution places on that source, the home page's shape, and
the points the website should make. It also carries the questions this design left open, all of
which concerned production and presentation.

The two were one artifact until 2026-08-03. The division, what moved and what stayed, and why,
are recorded in this repository's migration record *The website content moves to its own
project*, at `local/migration/2026-08-03T06-35-01Z-the-website-content-moves-to-its-own-project.md`.

## Background & Motivation

**The system is not currently explicable to someone meeting it.** A reader has eight package
`README.md` files, each explaining one package, and nothing explaining the set — which to
install first, what depends on what, why it is shaped as it is. The entry point does not exist.

**The website is where that matters most**, because it reaches people who have installed
nothing. Its drafts — `docs/capabilities.md`, `docs/features.md`,
`docs/human-in-the-loop-design.md` and others — were removed from this repository on
2026-07-30, so there is currently no public explanation at all.

**A website written separately from the system it describes is the drift problem in its most
public form.** The problem is not hypothetical here and does not need arguing from first
principles: the package READMEs are hand-maintained descriptions of what the rules say, and
**three of them were corrected by hand in a single session** because the rules had moved
underneath them. The same failure on a public site is discovered by a reader who believed it.

This design exists because that failure is avoidable by construction — if both surfaces are
driven from one source, neither can describe a system that no longer exists.

## Vocabulary

- **Surface** — a place a user meets the explanation. There are two: the interactive chat, and
  the website.
- **Source** — what both surfaces are produced from. Not itself a surface.
- **Skewed toward explaining itself** — the chat answers about **Waytide** rather than about the
  developer's project, which is what an agent in a consuming project ordinarily does.

## Settled

- **2026-08-02** — Waytide explains itself through an **interactive chat with the agent**,
  skewed toward explaining the system rather than the developer's project.
- **2026-08-02** — **The website's content is driven by the same content** as the chat. One
  source, two surfaces; not two separately-maintained explanations.
- **2026-08-03** — **This design keeps the reasoning; the `website` project takes production and
  presentation.** What stays here is why Waytide explains itself, what prompted it, and the
  vocabulary. What moved is the two surfaces, the projection, the distribution constraint, the
  home page, and the points the website should make. The alternative weighed was moving the
  design whole and leaving a stub here.

## Out of Scope / Deferred

**Every question this design left open concerned how the explanation is produced and presented,
and moved with that material** to the `website` project's design, where they are still open.
They are not restated here: two copies of an open question drift the same way two copies of an
answer do, which is the failure this design exists to prevent.

**One of them is also live in this repository**, reached from a different direction: **what
"idealized" is allowed to change** is in the Out of Scope section of *The Constant Example
Project — Design*, which stays here. Compressing a long cycle, omitting a false start, and
inventing a decision nobody made are not the same act, and nothing yet says where the line
falls.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 5:45:18 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:48:53 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:53:08 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:55:41 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:57:03 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 6:00:12 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:04:47 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:08:19 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:13:24 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:21:36 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:47:19 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 10:40:22 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 10:57:25 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:06:44 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:10:19 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:16:27 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:19:58 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:23:41 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:39:26 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:52:17 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:32:03 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
