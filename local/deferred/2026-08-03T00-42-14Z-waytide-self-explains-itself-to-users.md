# Waytide self-explains itself to users, and the website is driven by the same content

Waytide explains itself to the people using it through **an interactive chat with the agent,
skewed toward explaining itself** — the developer asks, and the agent answers about the system
rather than about their project. **The website's content is driven by that same content**, not
a second explanation written and maintained alongside it. One source, two surfaces.

**The initial interaction design parameters come from the developer.** How the chat opens, what
it offers, how far it leads versus follows — those are given, not inferred, and the work starts
from them.

**The one-source constraint is the substance of the item.** Two separately-written
explanations of the same system drift, and the drifted one is discovered by a reader who
believed it. This repository already has that failure in miniature — the package READMEs are
hand-maintained descriptions of what the rules say, and three of them were corrected by hand
in a single session because the rules had moved underneath them. An explanation and a website
maintained apart would fail the same way at a larger scale and in public.

**What already exists, and what it does not cover:**

- **The package READMEs** explain one package each, are user-facing, and travel to a consuming
  project with the package. They are the closest thing to this that exists.
- **Nothing explains the system as a whole** — what the packages are together, which to install
  first, what depends on what, why it is shaped this way. A reader meeting Waytide has eight
  README files and no entry point.
- **`status-report-format`** reports a *project's* state, not what the system is. Different
  question.
- **The website drafts were removed on 2026-07-30** (`docs/capabilities.md`, `docs/features.md`,
  `docs/human-in-the-loop-design.md`, and others). So this decides whether they return, in what
  form, and from where they are produced.

**What has to be settled:**

- **Where the source content lives.** It has to reach a consuming project, and `git subtree`
  carries only package directories — so anything a user reads in their own project must live in
  a package. The READMEs already satisfy that constraint and may be the source, or part of it.
- **What the whole-system explanation is, and which package holds it.** No package's subject is
  "Waytide itself". `foundation` is the base every package builds on and is always installed,
  which is the same argument that put the consuming-project tooling there.
- **How the website is produced from it.** Generated at publish time from the packages,
  assembled by the site from the component repositories, or something else. The flow has to be
  one-way, as composite → component already is, or the drift returns by another route.
- **What the chat gives the user beyond the READMEs** — an entry path, a whole-system view, the
  reasoning behind the shape, or the ability to ask a question the READMEs do not anticipate,
  which is the thing a document cannot do at all.
- **What "the same content" is, given that one surface is a conversation.** A website cannot be
  a chat, so the two surfaces share a **source** rather than an output. Either the rules
  themselves are that source — the chat reads them and the site is generated from them — or
  there is an explanatory corpus the chat draws on and the site publishes. The first cannot
  drift and is different every time it is asked; the second is stable and is the thing that
  drifts. This is now the load-bearing question.
- **What the chat is skewed toward, concretely.** An agent in a consuming project answers about
  that project; this one answers about the system. What makes it lean that way — a command that
  opens it, a mode it stays in, a rule about which question it takes as asked — is part of the
  interaction design.

**Gated on:** the developer's initial interaction design parameters, which are to be provided.
Nothing else is in flight.

**Priority:** 2

**Why:** the system is only usable to someone who can find out what it is, and today that means
reading eight package READMEs and inferring the whole. The website is the surface where that
matters most, because it reaches people who have not installed anything — and a website written
separately from the system it describes is the drift problem in its most public form. Driving
both from one source is what makes the explanation trustworthy rather than merely present.

**How to apply:** take the interaction design parameters from the developer, then settle what
the chat and the website share as a source — the rules themselves, or a corpus written for the
purpose — and how the website is produced from it, keeping the flow one-way. Where the
explanation is written rather than generated, place it in a package so it reaches consuming
projects. Delete this file when it is carried out, and log that it was done. Related: the
foundation README (which states why consuming-project content must live in a package), the
`plan` design-document-format rule (this may warrant a design before a plan, given its size),
the status-report-format rule (the project-state report this is not), and the observation
*A design is reconciled against the records, not regenerated from them*, whose finding — that
the READMEs are a hand-maintained projection that drifts — is the same problem this item is
about.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 5:42:14 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:42:14 PM PT
