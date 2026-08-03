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

## The replay is a projection, not a transcript

**`constant`'s logs are not taken literally.** From them an **idealized log** is generated, and
from that the Waytide cycles and steps are synthesized. The demonstrative, performative
**replay** is a **projection** — in the sense the decision-log convention already uses, where a
summary "reads the record without destroying it". The record stays as written; the projection is
derived and can be regenerated.

**The pipeline:**

```
constant's real artifacts  →  an idealized log  →  cycles and steps synthesized
                           →  the replay (a projection)  →  a website script, sequenced
                           →  generated
```

**This dissolves the trade the literal reading carried.** Constant's six features were begun
before several conventions existed — the attended-or-unattended cadence, the current-branch
working location, the renaming of a loop traversal from *pass* to *cycle* — so its records show
the method **as it was**. A literal replay would teach an earlier form of the system. An
idealized log is free to show the method **as it is**, because it is synthesized rather than
quoted.

**And it replaces that trade with a different one, which is the thing to hold onto.** The
project's value was argued above as **evidence rather than illustration** — records written
because the conventions required them, not because anyone would read them. A projection is one
step removed from that: the underlying work is real, and the presentation is idealized. What it
becomes is **a demonstration grounded in evidence**, which is neither of the two things the
Upload design and the literal reading offered:

| | grounded in | shows the method |
|---|---|---|
| the Upload project | nothing yet built | as it is |
| `constant`, read literally | work that happened | as it was |
| `constant`, projected | work that happened | as it is |

**The honesty requirement follows from that.** A projection that presents as a transcript claims
the one property it gave up. Whatever the replay is called on the page, it must not be called a
session, a recording, or a transcript, and what it is derived from should be reachable — the
real records are the answer to the reader who asks whether any of this happened.

**The records themselves are not touched.** They say "Pass" and were written under an earlier
form of the method, and they stay that way: a projection is derived from a record, and
back-editing the record to suit the projection would destroy the thing that makes the projection
worth anything.

**It is a specialized domain.** Constant importing and inspection is narrower than the `Upload`
domain the rules illustrate with, and a reader meeting it has more to hold. The rules' `Upload`
snippets are unaffected and stay: eleven files in `testing` and `code/ruby` use them, and they
illustrate conventions rather than pointing at a project.

## Relationship to the self-explanation designs

**The home-page transcript is settled in the `website` project**, at
`waytide/local/design/2026-08-03T06-45-04Z-producing-and-presenting-waytide-self-explanation.md`
— a sibling repository of this one. It names `constant` as the **source material for the
transcript**, which makes the two designs draw on one body of artifacts from different angles:
the transcript shows a session, and this shows a project. Whether the home-page chat walks
through work recorded here is not settled in either design, and it is nearly one question rather
than two.

That design was divided from *Waytide's Self-Explanation — Design* on 2026-08-03, which stays in
this repository and keeps the reasoning — why Waytide explains itself, and the vocabulary both
designs use. The transcript, the home page, and the projection they rest on went to the
`website` project with the rest of the production and presentation material.

## Settled

- **2026-08-02** — **`constant` is the example project**, replacing the Upload example project,
  whose design is suspended rather than discarded.
- **2026-08-02** — The example is a **worked example** — its value is that the process is
  exhibited rather than described. Carried forward from the suspended design, which settled it
  on 2026-08-03.
- **2026-08-03** — The `Upload` domain **stays in the rules**. What was suspended is the plan to
  build a project around it, not the illustration.
- **2026-08-03** — **`constant`'s logs are not taken literally.** An **idealized log** is
  generated from them, the cycles and steps are synthesized from that, and the demonstrative
  replay is a **projection** — from which a website script is sequenced and generated.
- **2026-08-03** — **The records are not back-edited** to suit the projection. A projection is
  derived from a record; changing the record to fit it destroys what makes the projection worth
  anything.

## Out of Scope / Deferred

- **What is presented, and where.** `constant` exists; nothing yet says which of its artifacts a
  reader is pointed at, in what order, or through what surface.
- **What the replay is called**, given it must not present as a transcript, and how a reader
  reaches the real records from it.
- **What "idealized" is allowed to change** — which is the whole of the projection's honesty.
  Compressing a long cycle, omitting a false start, and inventing a decision nobody made are not
  the same act, and nothing yet says where the line falls.
- **Whether the home-page transcript walks through work recorded here** — see *Producing and
  Presenting Waytide's Self-Explanation — Design* in the `website` project, which holds the
  home page.
- **Whether `env-var`, the second consuming project, has a part in this.**
- **The plan that sequences any of it.** Not written; this design settles direction only.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 10:44:57 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 10:48:30 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:52:17 PM PT
