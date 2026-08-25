# Planning spans three artifacts across two packages, and nothing names the activity they share

- **State:** Stated
- **Tags:** [observation]

**The question that surfaced it:** does "implementation plan" cover all the elements of
planning? It does not, on two counts.

## There are at least two kinds of plan, named differently and governed separately

| Artifact | Directory | Package | What it sequences |
|---|---|---|---|
| **design** | `local/design/` | `foundation` | nothing — it settles direction |
| **implementation plan** | `local/plans/` | `foundation` | a build **inside** this repository |
| **migration record** | `local/migration/` | `foundation` | content **crossing out of** the repository |

The migration convention calls its artifacts *"execution plans for transitions of content across
a repository boundary"*. That is planning, and it is not an implementation plan. It lives in a
different directory, under a different package, with a different name and a different format.

**Nothing places the three beside each other.** The migration convention cites the plans and
design conventions; nothing runs the other way. **As of 2026-08-03 all three are in
`foundation`**, which removes the two-package split this section described but not the absence
it names — being in one package is not the same as being stated beside each other.

## The name understates its own document

An implementation plan's eight sections are **Goal, Source design, Supersedes, Architecture,
Tech Stack, Process notes, Commit policy, Tasks**.

Only **Tasks** is implementation. Architecture is structural, Process notes and Commit policy
govern how the work is conducted, Goal states what it achieves, and Source design points at the
direction it realizes. The name covers one section of eight.

That is not the same defect as "session record" was. *Session* was **ambiguous** — the reader
could supply a shell session or a parliamentary one. *Implementation plan* is unambiguous and
**narrow**: it names a real thing and understates what the document holds.

## What is not established

- **Whether the activity wants a name.** Design, implementation plan, and migration record are
  three artifacts that plan three different things. They may be correctly separate, in which case
  a covering term would be a word that earns nothing — the failure this system names most often.
- ~~**Whether the `plan` package's boundary is right.**~~ **Settled 2026-08-03: it was not.**
  The package governed the design and the implementation plan while `foundation` owned the
  directories both live in, so the citation ran both ways and the package's own README conceded
  its name understated it. It was folded into `foundation`, which now holds all three planning
  artifacts and the document formats for two of them.
- **Whether prose should say "implementation plan"** where it says "plan" — 10 uses against 115.
  That is the same shortening corrected in the work-session rules, and it is the smallest of the
  three questions.

**The reason to be careful.** The obvious move is to invent a covering term and place the three
under it. But the three differ in what they produce and when they are written, and a name that
spans them would have to be vague enough to fit all three — which is how a word that explains
nothing gets into a vocabulary that exists to prevent exactly that.

## A second observation approaches the same artifacts from another direction

**Design and planning are process-centric; aspiration and intention are their human-centric
corollaries** (2026-08-04) proposes a **mode**, chosen at a project's initiation, under which
design and plan are replaced by aspiration and intention. It reaches the same two artifacts
this observation is about, and it is a **parallel pair rather than an umbrella**, so the
warning above does not land on it directly — but the underlying test does, and both
observations turn on it: does a new word do work, or rename something already named.

It also touches this observation's remaining open question from the other side. If the
planning **activity** has two modes, the question of whether it wants a name is not the same
question in each.

## A deferred item now proposes the covering term this warns against

**The modes are normalized to a generalization** (2026-08-05) proposes stating the mode-dependent
artifacts once, as **planning directories** and **planning files**, rather than naming both pairs
in every rule that touches them. That is a covering term of the kind this observation cautions
about, proposed for a reason this observation did not anticipate: the cost of *not* having one,
counted at nine files with an obligation that recurs and is enforced by nothing.

The caution still applies and is recorded in that item. What may distinguish the case is scope —
the term there spans two pairs that are **deliberately identical in every obligation**, where this
observation's concern is a term spanning three artifacts that differ in what they produce and when
they are written. Whether `migration/` falls inside the proposed term is the point where the two
questions meet, and it is unsettled in both.

## Amended 2026-08-18 — the three artifacts are one record type

**The span this observation names has closed.** The artifacts it found scattered across two
packages are all ideas now, in `waytide/local/ideas/`, distinguished by tag rather than by
directory and rule set. The observation's question — what to call the activity they share — is
answered by there being one record and one word for it.

**What the observation was right about survives the consolidation.** That the artifacts shared an
activity nothing named is why one directory works. The question was a symptom of the split, and
removing the split removed it.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 6:43:29 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:52:00 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 1:12:40 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:21:39 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:25:14 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 5:31:14 PM PT
