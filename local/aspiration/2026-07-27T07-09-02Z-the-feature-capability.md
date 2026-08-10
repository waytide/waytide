# The Feature Capability — Aspiration

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
  experiment-lifecycle rule and used here unchanged.
- **completed**, **abandoned**, **superseded**, **suspended** — the feature states, below.

## What mirrors the experiment capability

- **Always on a branch**, named `feature/<subject>` — dash-separated, lower-case, named
  literally for what is being built.
- **The base and the upstream branch are recorded**, not tagged. The upstream branch is
  not always `master`.
- **The working location is chosen at initiation** — put to the user through the selection
  interface at **every** initiation, with no standing default.

  **Reconciled 2026-08-02:** there are now **three** options, not two — branch only, branch and
  worktree, and **the current branch**, offered in that order. The third is **a feature's
  alone**: an experiment is a controlled deviation that must stay reversible until affirmed, so
  its branch is not optional, where a feature *is* the main line and a branch protects it
  against nothing already ordinary. So the phrase "exactly as for an experiment", written here
  when both had the same two options, no longer holds.
- **A worktree is a sibling of the repository directory**, named
  `<repository-name>-feature-<subject>`, so it groups lexically with its repository when
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
make the feature lifecycle **unavailable** to a project that installs `foundation` without
`design-by-efferent`.

**Reconciled 2026-07-31:** that unavailability is exactly the criterion since settled by the
`foundation` rule `a-citation-is-not-a-dependency` — a reference to another package becomes a
**dependency** only where the citing rule will not work without the cited package. This design
reached for that test in looser words ("would make foundation depend on a directory it does not
own"), which describes ownership rather than the test. The conclusion is unchanged and is
better supported than the original wording claimed: requiring the fields would make the rule
inapplicable without `design-by-efferent`, which is a dependency under the settled criterion,
and `foundation` may not take one. Naming the loop record in prose, as the feature record does,
is a **citation** and costs nothing.

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
  to the user at **every** feature initiation, ~~as with an experiment~~. The contrary
  proposal — no initiation gate, worktree by escalation only, on the grounds that a prompt
  paid on every feature is ceremony where an experiment's is paid rarely — was raised and
  rejected. **The "as with an experiment" clause is superseded 2026-08-02**: a feature gained a
  third option, the current branch, which an experiment does not get. The rest of the resolution
  stands — the choice is still put at every initiation, with no standing default.
- **2026-08-02** — A feature may be built on **the current branch**, a third working location
  offered after the two branching options. There is then no merge and no branch to delete:
  **completed** means the intent is built rather than integrated, and **abandoned** means the
  work is reverted rather than a branch left unmerged.
- **2026-08-02** — A second choice is put at initiation beside the working location: the
  **the human's level of participation**, attended or unattended, with attended the default. **DBE is in effect
  either way** — the cradle, the efferent-first actuation, and the solubility standard hold in
  both, and only the stopping changes. Both choices are recorded as confirmations.
- **2026-07-27** — The feature states are **completed**, **abandoned**, **superseded**,
  **suspended**.

## Out of Scope / Deferred

This section states what was open **when the design was written**. Items resolved since are
marked, per the reconciliation the work-sessions-convention prompts; the unmarked ones
are still open.

- **~~Main-sequence drift has no restatement yet.~~ Resolved 2026-07-31.** The design left open
  whether the experiment rule's watch for main-sequence work needed restating for features or
  dropping. `feature-lifecycle` **dropped it**, with a reason: during a feature,
  other work is normally another feature, and starting one is ordinary rather than a problem,
  so there is nothing to detect. A feature being forgotten is covered instead by the
  session-start notice.
- **The experiment rule's merge-gate wording.** It reads "gated on the experiment's tests
  passing," which is loose about whether the branch or the merged result is meant. Now
  that features have settled the same question explicitly, the experiment wording wants
  sharpening. **Still open** — the wording is unchanged as of 2026-07-31.
- **Whether a feature record and a loop record should cross-reference mechanically**, or
  by prose alone. **Answered in practice, not by decision:** both conventions say each record
  *names* the other, which is prose. Never settled explicitly.
- **~~The `waytide/local/features/` directory does not exist yet~~, and neither do the rules this
  design would be realized by. A plan sequences that build. Resolved 2026-07-31.** The
  directory exists and holds a feature record; `features-convention` and
  `feature-lifecycle` are written and published in `foundation`. The design has
  been realized.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 12:09:02 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:11:34 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:31:18 PM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 11:47:03 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 10:36:12 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:32:03 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:20:44 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
