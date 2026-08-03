# The Constant Example Project — Design

## Summary

**`constant` is the example project.** It is a real Eventide library — the published gem
`evt-constant` — that has been built under Waytide throughout, and its Waytide artifacts are the
record of that work. It is not a project built in order to demonstrate the method; it is a
project that was built, and the demonstration is a by-product.

It replaces the Upload example project, which would have been built fresh for the purpose. That
design is suspended, not discarded, under `local/suspended/`.

## Background & Motivation

**The rules are taught rule by rule, and nothing shows them composing.** A reader learns the
controls conventions, the test structure, the hinge cycle, and the artifact directories
separately. What they look like together — what a project looks like while being built this
way — is not demonstrated anywhere.

**The packages have no consumer that is read as one.** They are exercised by two consuming
projects, `constant` and `env-var`, and by pull-proofs that install and discard. Nothing
presents a project as a worked example.

**What `constant` already holds**, as of 2026-08-03:

| Artifact | Count |
|---|---|
| decision log entries | 206 |
| loop records | 19 |
| feature records | 6 |
| work-session records | 5 |
| observations | 11 |
| experiments, plans, designs | 2 each |
| its own local rules | 3 |

Three of its features carry **both** a feature record and a loop record — the lifecycle from one
and the design cycles from the other, which is the pair a reader needs to follow a piece of work
end to end.

## Demonstration against evidence

**This is the substance of the change from the Upload design.** That project would have been
built **in order to** demonstrate. Its artifacts would have been produced by someone who knew
they were the point, on a domain chosen for its legibility, at a pace set by what made a good
example.

`constant` was built to be a library. Its records were written because the conventions require
them, not because anyone would read them. What that buys is the one thing a demonstration cannot
have: **the artifacts are evidence rather than illustration.** A reader asking whether the
method is actually run has an answer that does not depend on trusting the example.

It also demonstrates what a purpose-built example never would have reached — a **published gem**
at `evt-constant` 2.2.0.0, which exercises the versioning conventions and the release, and
**three local rules of its own**, which show a project extending the system rather than only
consuming it.

## What it does not offer, and this is the trade

**Its records show the method as it was, not as it is.** All six features were begun before
several conventions existed — the attended-or-unattended gating cadence, the current-branch
working location, and the renaming of a loop traversal from *pass* to *cycle*. Its loop records
say "Pass", correctly, because that is what they were written under.

A reader following them sees real work under an earlier form of the method. Whether that is a
defect or a second demonstration — that the system's own conventions move, and its records are
kept as written rather than back-edited — is not settled here.

**It is a specialized domain.** Constant importing and inspection is narrower than the `Upload`
domain the rules illustrate with, and a reader meeting it has more to hold. The rules' `Upload`
snippets are unaffected and stay: eleven files in `testing` and `code/ruby` use them, and they
illustrate conventions rather than pointing at a project.

## Relationship to the self-explanation design

The self-explanation design names `constant` as the **source material for the home-page
transcript**. That makes the two designs draw on one body of artifacts from different angles:
the transcript shows a session, and this shows a project. Whether the home-page chat walks
through work recorded here is not settled in either design, and it is nearly one question rather
than two.

## Settled

- **2026-08-02** — **`constant` is the example project**, replacing the Upload example project,
  whose design is suspended rather than discarded.
- **2026-08-02** — The example is a **worked example** — its value is that the process is
  exhibited rather than described. Carried forward from the suspended design, which settled it
  on 2026-08-03.
- **2026-08-03** — The `Upload` domain **stays in the rules**. What was suspended is the plan to
  build a project around it, not the illustration.

## Out of Scope / Deferred

- **What is presented, and where.** `constant` exists; nothing yet says which of its artifacts a
  reader is pointed at, in what order, or through what surface.
- **Whether its records are brought up to current conventions.** They say "Pass" and were begun
  under an earlier form of the method. Leaving them is consistent with keeping historical records
  as written; changing them would falsify what was done.
- **Whether the home-page transcript walks through work recorded here** — see the
  self-explanation design.
- **Whether `env-var`, the second consuming project, has a part in this.**
- **The plan that sequences any of it.** Not written; this design settles direction only.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 10:44:57 PM PT
