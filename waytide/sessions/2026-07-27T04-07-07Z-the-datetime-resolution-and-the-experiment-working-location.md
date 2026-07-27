# Session — The datetime resolution and the experiment working location (Sun Jul 26 2026 21:07)

The session began as a request to list the deferred queue and became the working-out of
three items in it. It settled the resolution of every datetime written into a file, gave
the experiment lifecycle a working location chosen at initiation, defined two triggers for
changing it, and added a session-start check that reports work left open. It then
designed, planned, and built a feature capability mirroring the experiment's. Publishing
that work found two component repositories carrying commits made directly to them; both
were adopted into this repository, and a check was added so the next one is found before a
publish fails rather than by it.

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

**The worktree's path was settled afterward:** a sibling of the repository directory,
named `<repository-name>-<subject>-experiment`. For this repository and an experiment
named `test-tree`:

```
projects/waytide/
├─ waytide                          ← the repository, on master
└─ waytide-test-tree-experiment     ← the worktree, on experiment/test-tree
```

The shared prefix and the sibling placement put the worktree in the same lexical vicinity
as its repository when the parent directory is listed, so the two are seen together —
which matters most for the experiment nobody has opened in a fortnight, the same failure
the session-start check answers from the other side. It also satisfies the constraint
that the path stay outside the repository working tree.

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

## 8. The queue's cross-references, reconciled

Resolving the worktree item stranded a reference to it. The **feature cycle** item —
named as the next one to be taken up — closed with "It interacts with the worktree
question. … see the deferred item on considering a git worktree for experiments," and
that file no longer exists.

Both the body bullet and the trailing Related line were corrected. The bullet now states
the settled answer and adds what it implies for features: the experiment's initiation
gate is affordable *because experiments are rare*, so copying it to features is a live
thing to **reject** — a per-feature working-location prompt would be paid on ordinary
work, which is the same objection that item already raises about branching features at
all. The Related line's reference was dropped, the front reference absorbing what it
pointed at.

**The general matter was deferred**, and searching for other instances found one that
long predated it. The ECIL item closes with
`Related: [[2026-07-19T05-22-32Z-pending-release-republish-all-seven-packages]]` — an
item carried out on **2026-07-20**, its file deleted, the link pointing at nothing ever
since. Six days stranded, found only by looking for it.

So the convention's resolution step — act, delete, log — produces stranded references by
construction, and nothing surfaces them. The new item
(`2026-07-27T06-40-06Z-resolving-a-deferred-item-leaves-references-to-it-stranded`) asks
four things: which artifacts are reconciled (live ones, not historical records — the same
line the no-slang rule draws between live prose and a quoted decision); what the
correction is (replacing a pointer to an open question with the answer it received, not
merely deleting it); whether a check can find them mechanically, since a `[[link]]` is
findable and a prose reference by title is not; and whether the deferred queue is the only
directory whose convention deletes rather than keeps. The ECIL link is deliberately left
broken until the form of the correction is settled.

## 9. The feature capability, designed

The **feature cycle** deferred item asks whether feature work should carry a lifecycle
mirroring the experiment's, and treats *none* as a real answer. Settled by decision: the
capability exists and mirrors it. What remained was which parts.

**What mirrors:** its own branch `feature/<subject>`, a recorded base and upstream branch,
a working location chosen at initiation, the same two triggers for changing it, declared
end states, recorded confirmations, conclusion in the main working tree, and reporting by
the session-start notice.

**Where the mirror breaks, each deliberately:**

- **No question, no forecast.** A feature has an intent. Nothing is predicted, so there is
  nothing to compare an outcome against — which is most of what an experiment record is.
- **No verdict states.** *Affirmed*, *refuted*, *inconclusive* judge a question. The
  feature states are derived from what becomes of a feature instead: **completed**,
  **abandoned**, **superseded**, **suspended**. (Settled as *delivered* and renamed to
  *completed* the same night; the superseded log entry stands, append-only.)
- **No post-merge gate.** Tests are verified before integrating. The merged result is a
  combination neither branch ran, so a feature whose commits all passed can still break
  the suite on integration — and that is ordinary, fixed from there rather than gated
  against.
- **No affirmation step.** A feature has no finding to promote into the decision log.

**Foundation owns it, with its own `waytide/features/` record** rather than the loop
record growing lifecycle fields. The dependency graph decides it: `design-by-efferent`
includes `foundation`, not the reverse, so a foundation rule requiring fields in
`waytide/loops/` would invert the package graph and make the feature lifecycle unavailable
to a project installing foundation alone. The cost is two files per feature — lifecycle in
one, hinges in the other, each naming its counterpart.

**The working location is gated at every feature initiation**, as with an experiment. The
contrary proposal — no gate, worktree by escalation only, since a prompt paid on every
feature is ceremony where an experiment's is paid rarely — was raised and rejected. The
design records that it was considered.

**Left open:** main-sequence drift has no restatement. If features branch, "the main
sequence" is no longer simply the upstream branch, and the clause needs terms that still
mean something, or needs dropping.

## 10. The feature capability, planned and built

A plan realizing the design — the first in `waytide/plans/` — sequenced seven tasks in
five phases, the first of them a decision rather than anything built.

**Task 1: does the feature rule tell you to watch for other work starting while a feature
is open? It does not.** The experiment rule gives that instruction because an experiment
is a side trip that can drift from the main line. During a feature, other work is normally
**another feature**, and starting one is ordinary rather than a problem — there is nothing
to detect. Being *forgotten* is still a real risk for a feature, and the session-start
notice already covers that. The rule states the absence and its reason rather than staying
silent, so a reader comparing the two lifecycles finds the gap explained.

Built in six further tasks:

- **`agent-features-convention`** — the record: intent, state line, branch topology,
  working location, confirmations, and its relationship to the same feature's loop record.
- **`feature-runs-on-its-own-branch`** — the lifecycle, mirroring the experiment's and
  departing at the four places the design named.
- **The session-start script** — the per-directory scan became one shell function taking
  the directory, its nouns, and its concluded state words, so both capabilities share an
  implementation instead of a copied block. Verified against experiments alone, features
  alone, both together, singular and plural nouns, a missing state line, and the quiet
  opt-out.
- **The foundation introduction** — the two lifecycles stated together, with where they
  differ, rather than each described alone.
- **The documentation** — a *Building features* section in the capability list, which
  renumbered it from six onward, and a `docs/features.md` page.
- **The deferred item** — carried out and removed. Six remain.

**A correction inside the work.** Task 7's completion note first claimed nothing
referenced the deleted item. The stranded-reference item cites it twice. Those are
citations of a past event rather than live pointers, so they were left in place — but the
note was false as written and was corrected.

**These rules govern this repository, not only projects that install foundation.** Its
history is direct-to-`master`; from the next feature onward, work here starts on a branch
and asks where it should be worked. The plan named that as the intent rather than a side
effect.

## 11. Two component repositories had diverged

Only `foundation` changed, so it was the one package to republish. The fast-forward guard
refused it: `waytide/foundation` carried a commit made directly to the component repo,
adding `record-title-date-format.md` — a rule existing nowhere in this composite.
`CONTRIBUTING.md` forbids committing downstream, and nothing detects it.

**It contradicted the night's own work.** That rule writes a record's title date as
`Mon Jan 1 2026 18:06` — 24-hour, minutes, explicitly no seconds — while
`a-time-value-carries-minutes-and-seconds`, written hours earlier, requires seconds on
every datetime written into a file. The general rule had been written against a repository
that did not contain the rule it contradicted.

**Settled: a record title is the one exception**, and the exception is argued, not
granted. The seconds rule exists because a **running history's** entries collide at a
coarse resolution — a footer's later line becomes indistinguishable from the one before it
and goes unwritten. A title appears **once** per file, so nothing can collide with it, and
the filename beside it already carries the same instant to the second in UTC. Both rules
now state the exception and its reason. The seconds rule had also cited a session record's
title as an example of a date carrying no time, which the adopted rule makes false;
corrected.

The four session-record titles were conformed, including one carrying a **date range**,
which the adopted rule forbids — this record's own title among them.

**A second direct commit, in `waytide/git`:** the *Package version form* correction to the
subject-first commit-message rule, whose own message said its upstream publishing was
deferred. Adopted verbatim, footer line included, since bringing it into the composite
changes nothing further.

**Both publishes required a force-push, and nothing was lost.** A commit made directly to
a component repo can never become an ancestor of a split, so adopting the change does not
make the publish fast-forward. The content was verified before each push — the foundation
rule intact with additions, the git rule byte-identical — so the commit objects were
replaced and their content survived, because it had been put in the composite first.

**Adopted from the episode:** `report-direct-commits.sh`, which walks back from each
component repo's head reporting commits this history does not contain. It lives in the
composite, not in `foundation` — a consuming project installs packages and never publishes
them. And `CONTRIBUTING.md`'s divergence guidance was corrected: it said "stop — do not
force," which is right about not discarding and wrong about the remedy. Adopt, verify,
then force.

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
- **A downstream commit is invisible until a publish fails.** Two of them sat in component
  repositories for days. Nothing announced either; both surfaced only because a publish was
  attempted. The check that now exists is four lines and could have been written at any
  point since the component repos were created.
- **Adopt before forcing.** A commit made directly to a component repository can never
  become an ancestor of a split, so the publish will need `--force` no matter what. What
  decides whether that is destructive is whether the content was brought into the composite
  first.
- **A gate is the right home for a situational trade-off.** The worktree item could not
  be settled as one answer for every experiment; it settled in an afternoon once posed as
  a choice made per experiment.
- **A mirrored capability is defined by where the mirror breaks.** The feature capability
  copies the experiment's branch, working location, states, and confirmations; what makes
  it a *feature* capability is the four places it refuses to copy — the forecast, the
  verdict states, the post-merge gate, and the affirmation step.
- **The package dependency graph can decide a record's shape.** One feature could have had
  one file instead of two, but only by making `foundation` depend on a directory
  `design-by-efferent` contributes. Which package owns a capability is not a filing
  question.
- **An absent instruction is worth stating.** The feature rule says it does *not* tell you
  to watch for other work, and why. Left silent, the gap against the experiment rule would
  read as an oversight rather than a decision.
- **A capability arrived design → plan → build in one sitting.** The deferred item had sat
  three days as a question with no answer; posing it as a design with dated resolutions,
  then a plan of seven tasks, carried it to done.
- **Deleting a resolved deferred item strands references to it.** The convention says to
  delete on resolution and is silent on what else points at the file. Two instances were
  found — one created and corrected today, one stranded six days and discovered only by
  searching. Neither surfaced on its own; the question is now deferred.

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
- **Scripts:** `framework/foundation/session-start.sh`, which now reports experiments and
  features that have not concluded, and `report-direct-commits.sh` at the repository root,
  which reports component repositories carrying commits this history does not contain.
- **Decision log:** thirty-one entries under `waytide/log/` — three for the datetime
  resolution, five for the experiment working location, three for the session-start check
  and the drift clause, one each for the second trigger, its name, and the worktree
  directory naming, five for the feature capability's design, seven for its plan and build,
  and five for the component-repository reconciliation.
- **Experiment record:** `waytide/experiments/2026-07-21T09-17-02Z-rules-files-flattening.md`,
  backfilled with its `**State:**` line and working location.
- **Design:** `waytide/design/2026-07-27T07-09-02Z-the-feature-capability.md`, the first
  design in this repo — `waytide/design/` did not exist.
- **Plan:** `waytide/plans/2026-07-27T07-17-24Z-the-feature-capability.md`, likewise the
  first, all seven tasks complete with inline notes.
- **Feature capability:** `framework/foundation/agent-features-convention.md` and
  `framework/foundation/feature-runs-on-its-own-branch.md` (both new),
  `framework/foundation/session-start.sh`, `framework/foundation/README.md`,
  `docs/capabilities.md`, and `docs/features.md` (new).
- **Deferred queue:** three items resolved and deleted, one added; **six remain**. The
  feature-cycle item was carried out in full — designed, planned, and built. The
  **feature cycle** item — named at the session's close as the next to be taken up — had
  its worktree cross-reference and its Related line corrected, the item it pointed at
  having been carried out. The item added is
  `2026-07-27T06-40-06Z-resolving-a-deferred-item-leaves-references-to-it-stranded`.
- **Documentation:** `docs/experiments.md`, conformed to the lifecycle change. The
  standing website-content review item still covers the page as a whole.
- **Adopted from the component repositories:**
  `framework/foundation/record-title-date-format.md` and the *Package version form*
  correction in `framework/git/subject-first-commit-messages.md`, both written directly
  downstream and brought here. `CONTRIBUTING.md` carries the corrected divergence remedy.
- **Component repositories:** `waytide/foundation` at `80558d8` and `waytide/git` at
  `e72d484`, both force-published after the adoption. The other five were already current.
- **Commits:** `1dd49e8` (four uncommitted deferred items), `729e097` (the datetime
  resolution), `9ad1b56` (the experiment working location), `5d99780` (the session-start
  check), `1f5b9b0` (the second trigger), `a18feeb` (escalated), `1464956` and `a2076a5`
  (the feature-cycle item's cross-references), `bf71eb2` (the stranded-reference question,
  deferred), `27c5312` (the worktree directory naming), `5749772` (the feature capability
  design), `7929550` (the *completed* state's name), `cae8a5c` and `dd84636` (the plan),
  `6860015` through `d568f3f` (its seven tasks), `f262a47` (a correction to the last
  task's note), `892a3b8` (the record-title format adopted and reconciled), `9a70204` (the
  git package's correction adopted), `2aae74e` (the direct-commit check), and `974e29e` / `11fc550` / `f9583da` / `21ce22f` / `4a85012` / `142d75f` /
  `47b4abc` / `5111a9d` (this record's earlier versions).

---

Authored by Scott Bellware on Sun Jul 26 2026 at 9:07:07 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:21:33 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:23:32 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:38:10 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:41:37 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:47:02 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:48:56 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:51:43 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:14:45 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:34:49 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:41:09 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:57:23 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:58:57 AM PT
