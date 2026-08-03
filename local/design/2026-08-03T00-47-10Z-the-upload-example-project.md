# The Upload Example Project — Design

## Summary

A fresh, buildable Ruby project that **builds up the `Upload` solution through DBE** — originated
hinge by hinge, test-first, with the design, plan, and loop artifacts accumulating as the build
proceeds. It is not an extension of an existing project and not a static drop of finished code.

It serves two purposes at once: it shows the conventions **composing** rather than being taught
rule by rule, and it gives the packages a **real consumer** that surfaces integration gaps the
isolated pull-proofs cannot.

## Background & Motivation

**The `Upload` domain in the rules is real, not invented for them.** It comes from
`dependencies-and-substitutes` — local at
`/Users/sbellware/projects/eventide/dependencies-and-substitutes`, hosted at
<https://github.com/eventide-examples/dependencies-and-substitutes> in the `eventide-examples`
org — where `Upload` appears as an evolving `demos/*.rb` series covering the dependency,
substitute, and mimic concepts. The snippets in the `testing` and `code/ruby` rules were drawn
from it.

So the domain exists twice today, and in neither place as a coherent project: in
`dependencies-and-substitutes` as **demos**, and in the rules as **scattered illustrations**.

**The rules are taught rule by rule, and nothing shows them composing.** A reader learns the
controls conventions, the test structure, the hinge cycle, and the artifact directories
separately. How they behave together — what a project looks like while being built this way —
is not demonstrated anywhere.

**The packages have no real consumer.** They are exercised by pull-proofs that install and
discard. A project that installs the packages and is genuinely built under them would surface
integration gaps nothing currently does.

## The build is the point, not the artifact

**The solution is originated, not copied.** `dependencies-and-substitutes` is the **reference
for what the `Upload` solution looks like** — the target domain, the useful-object shape, the
dependency and substitute concepts. It is read as source material and then set aside; the
solution is built from the efferent side through the hinges.

This is what separates the project from documentation. A finished codebase presented as an
example shows the destination. This shows the **method**, because the artifacts it accumulates —
the design, the plan, the loop records — are produced by actually running the method, and are
therefore the real thing rather than a depiction of it.

**Its `waytide/` tree is exercised in the act of building**, not staged: the packages installed
by subtree, and real `design/`, `plans/`, `loops/`, and possibly `experiments/` artifacts
produced as the solution is originated.

## Relationship to the self-explanation design

The self-explanation design settles that Waytide explains itself through an interactive chat
and a website driven from the same source. **This project is a different kind of explanation
and does not compete with it**: that one tells a reader what the system is, and this one shows
what working under it produces. A worked example is the one thing neither a chat nor a page can
be, because its value is that it was actually built.

Whether the two are connected — whether the website points at this project, or draws on its
artifacts as worked examples — is not settled here.

## Settled

- **2026-07-19** — The example project **starts fresh and builds up the `Upload` solution
  following DBE**. It is not an extension of `dependencies-and-substitutes` and not a static
  drop of finished code. The point is to exercise the method.
- **2026-07-19** — `dependencies-and-substitutes` is the **reference** for the target domain,
  read as source material, not the codebase that gets extended.
- **2026-07-19** — The project follows the `code/ruby` style and the `testing` conventions, and
  carries its own `waytide/` tree with real artifacts produced during the build.
- **2026-08-03** — It is a **worked example**, distinct from the self-explanation design's chat
  and website: those say what the system is, this shows what building under it produces.

## Out of Scope / Deferred

- **Scope and stopping point** — how much of the `Upload` solution to build: a single feature to
  its first verified test, or the fuller domain across several hinge cycles.
- **Home** — its own repository, and which org. `eventide-examples` alongside
  `dependencies-and-substitutes` is the obvious candidate and is not settled.
- **Whether the in-rule `Upload` snippets should point at this project** as the canonical source
  of the domain once it exists.
- **Whether the website draws on it** — see the self-explanation design.
- **The plan that sequences the build.** Not written; this design settles direction only.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 5:47:10 PM PT
