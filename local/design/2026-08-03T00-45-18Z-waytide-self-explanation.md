# Waytide's Self-Explanation — Design

## Premise

Waytide explains itself to the people using it through **an interactive chat with the agent,
skewed toward explaining the system** rather than the developer's project. **The website's
content is driven by that same content.** One source, two surfaces.

This is a premise rather than a summary because most of the design is not yet settled. What is
fixed is the form and the one-source constraint; the interaction design parameters come from
the developer, and the question of what the two surfaces actually share is open and is the
question the rest turns on.

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

## The two surfaces

**The chat** is interactive and agent-produced. Its distinctive capability is that it answers a
question the explanation's author did not anticipate — the thing no document can do.

**The website** is static and public. Its distinctive capability is reaching someone who has
installed nothing and is deciding whether to.

They are not the same artifact and cannot be. **A website cannot be a chat**, so what they
share is a **source**, not an output.

## The load-bearing question: what the source is

Two candidates, and the choice decides most of the remaining design.

**The rules themselves are the source.** The chat reads the installed rules and answers from
them; the site is generated from the same files. Nothing can drift, because there is nothing
between the rules and either surface. The cost is that the explanation is different every time
it is asked, and that the rules are written to *govern* rather than to *introduce* — a reader
meeting the system needs an entry path and a reason for the shape, which no individual rule
states.

**A written corpus is the source.** Prose written for the purpose of explaining, which the chat
draws on and the site publishes. It is stable, it can be written as an introduction rather than
a set of governing statements, and it can carry the reasoning behind the shape. The cost is
that it is exactly the kind of artifact that drifts — a hand-maintained description of what the
rules say, which is the README failure at a larger scale.

**Neither is obviously right, and a mixture may be.** The reasoning behind the shape is not
derivable from the rules and has to be written; what each package governs is derivable and
should not be. Settling this is the first work of the plan that realizes this design.

## The distribution constraint

Anything a user reads **in their own project** must live in a package: `git subtree` carries
only package directories, which is the same constraint that put the consuming-project tooling
in `foundation`. So a written source is not free to live anywhere — it goes in a package, and
`foundation` is the only one always installed.

A source consulted only by the website has no such constraint, but a source serving both does.

## Settled

- **2026-08-02** — Waytide explains itself through an **interactive chat with the agent**,
  skewed toward explaining the system rather than the developer's project.
- **2026-08-02** — **The website's content is driven by the same content** as the chat. One
  source, two surfaces; not two separately-maintained explanations.
- **2026-08-02** — **The initial interaction design parameters are the developer's** and are
  given rather than inferred. The work starts from them.
- **2026-08-03** — The two surfaces share a **source**, not an output, since a website cannot be
  a conversation.

## Out of Scope / Deferred

- **What the source is** — the rules, a written corpus, or a mixture. The load-bearing question
  above; unresolved here.
- **The interaction design parameters** — how the chat opens, what it offers, how far it leads
  versus follows. To be provided by the developer.
- **What makes the chat lean toward the system** — a command that opens it, a mode it stays in,
  or a rule about which question it takes as asked. Part of the interaction design.
- **Which package holds a written source, if there is one.** No package's subject is "Waytide
  itself"; `foundation` is the candidate on the always-installed argument alone.
- **How the website is produced** — generated at publish time from the packages, assembled by
  the site from the component repositories, or otherwise. The flow must be one-way, as
  composite → component already is.
- **Whether the removed website drafts return**, and in what form.
- **The plan that sequences this.** Not written; this design settles direction only.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 5:45:18 PM PT
