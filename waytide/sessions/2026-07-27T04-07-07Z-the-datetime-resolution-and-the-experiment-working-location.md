# Session — The datetime resolution and the experiment working location (2026-07-26)

The session began as a request to list the deferred queue and became the working-out of
two items in it. It settled the resolution of every datetime written into a file, gave
the experiment lifecycle a working location chosen at initiation, defined two triggers
for changing it, and added a session-start check that reports experiments left open.

*This is the communicable record — the guided tour. It is not the source of truth. The
durable records are the rules under `framework/`, the decision log under `waytide/log/`,
and the deferred queue under `waytide/deferred/`; this narrative points to them and
preserves the reasoning between them.*

## 1. The queue, listed

Eight items were parked: three chores from Jul 19, four methodology questions raised in
one sitting on Jul 24, and one investigation into test output and test running. Four of
the Jul 24 items had never been committed; they were committed as `1dd49e8` before
anything else proceeded.

## 2. A datetime carries its time to seconds

The deferred item **the provenance footer datetime records no minutes** was initiated,
and immediately broadened: the defect was not the footer's, it was any datetime whose
time is written without minutes and seconds.

The item's account of the defect is what made the broadening obvious. The footer's format
resolved only to the hour, so two edits an hour apart were indistinguishable — and an
edit made in the *same* hour as the previous one produced a `Changed by` line identical
to its predecessor. A duplicate-looking line reads as an error rather than as provenance,
so one had already gone **unwritten** rather than being questioned. A format that cannot
express its own instances is a defect, not merely a coarse choice.

**The hinge was where the general rule should live** — `foundation` as a new rule,
`language` as a new rule reaching conversation the way `no-slang` does, or the footer
rule broadened in place. Settled: a new `foundation` rule, its reach scoped to datetimes
written into files.

**Boundaries the rule states, each a real question:** a date-only convention gains no
time; a datetime already recorded coarsely is never revised, because the minutes of a
past event are not recoverable and supplying them would falsify the record; and the
ISO-8601-UTC filename prefix already satisfied it. Roughly a hundred existing footer
lines were left untouched, so the two forms now coexist in the same footers — a cost
accepted deliberately, and written into the footer rule so a reader meeting both does not
take the coarse ones for malformed.

Carried out: `a-time-value-carries-minutes-and-seconds.md` (new), with
`record-rule-authorship-in-a-footer` conformed to it and the foundation README's
cross-cutting conventions going from two to three. Three log entries; the deferred file
deleted. Committed as `729e097`.

## 3. The working location, chosen at initiation

The worktree question was already deferred, from Jul 24. One correction to its framing
governed everything after: a worktree is not an alternative to a branch. It is a second
**checkout of** a branch, and an experiment cannot use a detached one, because
affirmation merges the experiment into its upstream branch and a detached checkout gives
that merge nothing to name. The live choice is where the experiment is worked, not
whether it branches.

**The shape settled:** initiating an experiment offers **single tree** or **worktree**,
and the conclusion executes the git mechanics matching the choice. This resolved what the
deferred item could not. The item treated the question as having one answer and then
could not produce it, because the trade-off it laid out is **situational** — an
experiment resolving in a sitting favors the single tree, one that must coexist with
main-sequence work favors a worktree. A choice that depends on the experiment belongs at
a gate, not in a rule.

**Gated at every initiation.** No standing default, no project-level default: both
candidates are genuine, so the gate never has to manufacture an option to reach the
two-option floor.

## 4. Two recourses when main-sequence work arrives

The remaining question was what to do when main-sequence work arrives during a
single-tree experiment.

The cost argument settled it by collapsing. Suspending is: return the main tree to
upstream, mark the record suspended. Adding a worktree is: return the main tree to
upstream, `git worktree add`. They differ by one command. So suspension could not be the
sole recourse on grounds of the worktree being expensive — it had to rest on something
else, and there was one real thing: **suspension is a declared state, and it makes
dormancy legible.** An experiment left nominally active in a worktree, untouched for a
fortnight, is worse recorded than one marked suspended.

Which meant the question was not *which recourse*. **Both are recourses, distinguished by
intent** — stop working the experiment, or keep working it alongside — and naming either
the universal answer would mislabel the other.

## 5. Carried out

`experiment-runs-on-its-own-branch` gained the working-location bullet and the
change-of-location bullet, and had four existing ones made conditional on the choice:
conclusion, suspension, branch deletion, and drift. A new *Why* paragraph argues the gate
and the two recourses.

`agent-experiments-convention` records the working location beside the upstream branch,
the experiment branch, and the base, and states it as a short history rather than a
single fact: the record **gains a line**; the original is not rewritten.

`docs/experiments.md` and the foundation README were conformed. Five log entries; the
deferred file deleted. Committed as `9ad1b56`.

**Two calls made without asking, the direction being to settle it.** The options are
named **single tree** and **worktree**, not *Branch* and *Worktree* — calling one option
"Branch" implies the other does not branch. And worktree removal and branch deletion take
**one** confirmation: git refuses to delete a branch checked out in a worktree, so the
order is forced and they are one cleanup act.

## 6. The detection gap, and the session-start check

The drift clause said the agent watches for main-sequence work. Examined, that watch
rests on one mechanical signal — the branch name, HEAD on `experiment/<subject>`, which
the status line carries — and otherwise on a judgment of whether the work at hand answers
the experiment's recorded Question. A **missed detection produces nothing**: no alarm, no
artifact, just the divergence the clause exists to prevent.

Two situations give nothing at all. A **fresh session**, because the working directories
under `waytide/` are not read at session start. And a **worktree**, where the main
working tree stays on the upstream branch — so the configuration that isolates an
experiment best is the one that most easily loses track of it.

**Settled:** `session-start.sh` reads each record under `waytide/experiments/` and adds a
second line to the load notice for those not concluded — Suspended records, and records
carrying no state at all. When everything has concluded the line is absent, so the notice
grows only when something is open.

This required a **canonical `**State:**` line**, now mandated by the experiments
convention. The state words run all through a record's forecast and findings prose — the
one existing record says "affirmed" or "refuted" eight times before its actual conclusion
— so a record cannot be classified by grepping it. One line, in the setup block, the only
authoritative statement. The existing record was backfilled with its state and its
working location.

The drift clause was rewritten in the same pass to say what its watch rests on and that a
miss is silent. It had read as a guarantee. Committed as `5d99780`.

## 7. The second trigger, and its name

The rule permitted the working location to change on **one** trigger — main-sequence work
arriving — which had been derived from the drift conversation rather than from anything
arguing it was exclusive. But "the experiment needs more isolation than I gave it" is a
judgment that can arrive on its own: something begun ad hoc turns out larger than it was
taken for, and the main working tree should be clear of it for the remainder.

**Settled:** two triggers. One external to the experiment — an interruption. One internal
— the experiment **escalated**, judged to warrant the heavier apparatus. Suspension
remains the alternative to the external trigger alone; it answers an interruption and has
nothing to say about an experiment that outgrew its arrangement.

**Escalated** names the internal trigger only, defined once in the lifecycle rule. It
carries the sense a support ticket has when escalated to a more involved tier: what rises
is the handling, not the standing of the thing handled. Committed as `1f5b9b0` and
`a18feeb`.

## Takeaways

- **A datetime written into a file carries its time of day to seconds.** A format that
  cannot express its own instances is a defect; hour resolution had already suppressed an
  entry rather than merely blurring one.
- **The experiment working location is gated at every initiation**, with no default,
  because the trade-off is situational rather than general.
- **Main-sequence work arriving has two recourses, distinguished by intent**, because
  they cost nearly the same and mark genuinely different situations.
- **A worktree is added on two triggers** — an interruption, or escalation — and the
  record gains a line rather than having its original rewritten.
- **The session-start notice reports experiments that have not concluded**, because
  nothing else would: the working directories are not read at session start, and a
  worktree leaves no trace in the main working tree.
- **A rule should not claim more than it delivers.** "The agent watches for main-sequence
  drift" read as a guarantee; it rests on one mechanical signal and a judgment, and a
  miss is silent. The clause now says so.
- **A gate is the right home for a situational trade-off.** The worktree item could not
  be settled as one answer for every experiment; it settled in an afternoon once posed as
  a choice made per experiment.

## Glossary

- **working location** — where an experiment's branch is worked: the single working tree,
  or a worktree. Chosen at initiation, recorded with the branch topology, and what the
  conclusion's mechanics dispatch on.
- **worktree** — a second working tree attached to the same repository: one object
  database, one set of branch refs, but its own HEAD, index, and uncommitted changes. Not
  a clone, which copies the database and then diverges; not a copy of the branch, of
  which there is one.
- **checkout**, in "a second checkout of that same branch" — the **noun**: a materialized
  directory of files at some commit, not the verb `git checkout`.
- **escalated** — the judgment that an experiment warrants the heavier apparatus and so
  is given a worktree, having been begun ad hoc and turned out to need more isolation.
  What rises is the handling, not the standing. It names the internal trigger only; the
  external one is described literally, as *a worktree is added for an experiment already
  under way*. **Migration** and **promotion** were both rejected for this — nothing moves,
  and promotion imports a value ordering the rule denies while colliding with
  observation-to-rule promotion.
- **the `**State:**` line** — the canonical, single statement of an experiment's state, in
  its record's setup block. The only place in a record readable as the state, because the
  state words appear throughout its forecast and findings prose. A record without one is
  in flight.

## Where the durable records live

- **Rules:** `framework/foundation/a-time-value-carries-minutes-and-seconds.md` (new),
  `record-rule-authorship-in-a-footer.md`, `experiment-runs-on-its-own-branch.md`,
  `agent-experiments-convention.md`, `announce-waytide-at-session-start.md`, and the
  foundation `README.md`.
- **Script:** `framework/foundation/session-start.sh`, which now reports experiments that
  have not concluded.
- **Decision log:** twelve entries under `waytide/log/` — three for the datetime
  resolution, five for the experiment working location, three for the session-start check
  and the drift clause, and one each for the second trigger and its name.
- **Experiment record:** `waytide/experiments/2026-07-21T09-17-02Z-rules-files-flattening.md`,
  backfilled with its `**State:**` line and working location.
- **Deferred queue:** two items resolved and deleted; six remain.
- **Documentation:** `docs/experiments.md`, conformed to the lifecycle change. The
  standing website-content review item still covers the page as a whole.
- **Commits:** `1dd49e8` (four uncommitted deferred items), `729e097` (the datetime
  resolution), `9ad1b56` (the experiment working location), `974e29e` and `11fc550` (this
  record's earlier versions), `5d99780` (the session-start check), `1f5b9b0` (the second
  trigger), `a18feeb` (escalated).

---

Authored by Scott Bellware on Sun Jul 26 2026 at 9:07:07 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:21:33 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:23:32 PM PT
