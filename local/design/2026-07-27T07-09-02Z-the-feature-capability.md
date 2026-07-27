# The Feature Capability — Design

## Summary

Feature work gets a lifecycle mirroring the experiment capability's: its own branch, a
working location chosen at initiation, a record under `waytide/local/features/`, declared end
states, and recorded confirmations. The mirror breaks in three places, each deliberately.
A feature has an **intent**, not a question — so there is no forecast and no verdict
states. Its tests are verified **before** integrating and there is no post-merge gate.
And main-sequence drift, which assumes the open work is a deviation, has to be restated
or dropped.

## Background & Motivation

An experiment has a full lifecycle: its own branch, a recorded base and upstream branch,
a record, six declared states, a merge gate, and confirmations recorded at each decision.
A feature has none of that. The *inside* of a feature is well governed — the five hinges
govern its design and the loop record captures each pass — but nothing says how a feature
begins, where it is worked, or that it ends in a named state. A feature currently starts
and stops without a declared state, which makes it hard to say what is in flight and what
concluded.

The asymmetry was registered as a deferred item on 2026-07-24, which treated *none* as a
live answer on the grounds that the experiment's machinery follows from an experiment
being a **deviation** from the main line, while a feature **is** the main line. That
question was settled by decision on 2026-07-26: the capability exists, and mirrors the
experiment's. What this design settles is which parts mirror and which do not.

## Vocabulary

- **feature** — a bounded unit of main-line work, designed through the five hinges and
  completed on the upstream branch. Distinguished from an experiment by having an
  **intent** rather than a question: nothing is being tested, so nothing is forecast and
  no verdict is reached.
- **working location** — where the branch is worked: the single working tree, or a
  worktree. The term and its mechanics are foundation's, defined in the
  experiment-runs-on-its-own-branch rule and used here unchanged.
- **completed**, **abandoned**, **superseded**, **suspended** — the feature states, below.

## What mirrors the experiment capability

- **Always on a branch**, named `feature/<subject>` — dash-separated, lower-case, named
  literally for what is being built.
- **The base and the upstream branch are recorded**, not tagged. The upstream branch is
  not always `master`.
- **The working location is chosen at initiation** — single working tree or worktree —
  put to the user through the selection interface at **every** initiation, with no
  standing default, exactly as for an experiment.
- **A worktree is a sibling of the repository directory**, named
  `<repository-name>-<subject>-feature`, so it groups lexically with its repository when
  the parent is listed, and sits outside the repository working tree.
- **The working location changes on the same two triggers** — an interruption the user
  intends to work alongside, or **escalation**, the feature judged to need more isolation
  than it was given. The record gains a line; the original is not rewritten.
- **The feature ends in a declared state.** It is never left silently open.
- **Every confirmation is recorded** in the feature record.
- **Conclusion returns the user to the upstream branch**, in the main working tree.
- **The session-start notice reports features that have not concluded**, as it now does
  for experiments, by reading the record's canonical `**State:**` line.

## What does not mirror it

- **No question, no forecast, no outcome-against-forecast.** These are what make an
  experiment an experiment. A feature is built to an intent; there is nothing to predict
  and nothing to compare a prediction against.
- **No verdict states.** *Affirmed*, *refuted*, and *inconclusive* judge a question. A
  feature is not proven or disproven, so its states are derived from what becomes of the
  feature instead.
- **No post-merge gate.** A feature's tests are verified **before** it is integrated. Once
  integrated, the suite may fail — the merged result is a combination neither side ran —
  and that is ordinary and is fixed from there rather than gated against.
- **No affirmation step.** An experiment is affirmed only on explicit user declaration,
  and affirmation copies its log into the project decision log. A feature has no finding
  to promote; completion is the conclusion.

## The feature states

Four, derived from what becomes of a feature rather than borrowed from the experiment's
verdict vocabulary:

- **Completed** — integrated into the upstream branch. The ordinary conclusion.
- **Abandoned** — dropped before completion. The branch is not merged; the record is kept.
- **Superseded** — replaced by a different design. Both records name the counterpart, as
  with experiments.
- **Suspended** — paused, not ended. The branch is kept; under a worktree, the worktree is
  kept in place and checked out.

## The record

`waytide/local/features/<iso-prefix>-<subject>.md`, carrying the intent, the branch topology
(upstream branch, feature branch, base), the working location, the canonical `**State:**`
line, and the confirmations the lifecycle required. It ends with a provenance footer like
every working-state artifact.

**It is a second file per feature, alongside the DBE loop record, and that is a cost
accepted for a structural reason.** The loop record lives in `waytide/local/loops/`, a directory
the `design-by-efferent` package contributes. `design-by-efferent` includes `foundation`,
not the reverse — so a foundation rule requiring lifecycle fields in the loop record would
make foundation depend on a directory it does not own, inverting the package graph. It
would also make the feature lifecycle unavailable to a project that installs `foundation`
without `design-by-efferent`.

The two records divide by concern: the feature record carries the **lifecycle** (where it
is worked, what state it is in, what was confirmed); the loop record carries the
**design** (each pass's hinge, options, and decision). Each names the other.

## Integration

A feature's tests are verified before it is integrated into the upstream branch — which
`run-suite-before-commit` already achieves, every commit on the branch having been
verified. Nothing further gates the merge.

Post-merge failure is expected behavior, not a defect in the process: the merged result
is a combination neither branch ran, so a feature whose commits all passed can still break
the suite on integration. The response is to fix it from there.

## Settled

- **2026-07-26** — Feature work gets a capability mirroring the experiment capability.
  *None* was a live answer and was rejected.
- **2026-07-26** — `foundation` owns the capability, with its own `waytide/local/features/`
  record, rather than `design-by-efferent` growing the loop record. The dependency graph
  decides it.
- **2026-07-26** — A feature's tests are verified before integrating; there is no
  post-merge gate. Post-merge failures are ordinary and are fixed from there.
- **2026-07-26** — A feature may be worked in a worktree, and the working location is put
  to the user at **every** feature initiation, as with an experiment. The contrary
  proposal — no initiation gate, worktree by escalation only, on the grounds that a prompt
  paid on every feature is ceremony where an experiment's is paid rarely — was raised and
  rejected.
- **2026-07-27** — The feature states are **completed**, **abandoned**, **superseded**,
  **suspended**.

## Out of Scope / Deferred

- **Main-sequence drift has no restatement yet.** The experiment rule asks the agent to
  watch for main-sequence work starting while an experiment is open. If features branch,
  "the main sequence" is no longer simply the upstream branch, and the protection needs
  terms that still mean something — or needs dropping. Unresolved here.
- **The experiment rule's merge-gate wording.** It reads "gated on the experiment's tests
  passing," which is loose about whether the branch or the merged result is meant. Now
  that features have settled the same question explicitly, the experiment wording wants
  sharpening. Not done here.
- **Whether a feature record and a loop record should cross-reference mechanically**, or
  by prose alone.
- **The `waytide/local/features/` directory does not exist yet**, and neither do the rules this
  design would be realized by. A plan sequences that build.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 12:09:02 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:11:34 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
