# Session — Three deferred items, a feature capability, and two diverged repositories (Sun Jul 26 2026 21:07)

The session began as a request to list the deferred queue and became the working-out of
three items in it. It settled the resolution of every datetime written into a file, gave
the experiment lifecycle a working location chosen at initiation, defined two triggers for
changing it, and added a session-start check that reports work left open. It then
designed, planned, and built a feature capability mirroring the experiment's. Publishing
that work found two component repositories carrying commits made directly to them; both
were adopted into this repository, and a check was added so the next one is found before a
publish fails rather than by it. It ended by renaming the whole thing a **system** rather
than a framework, and moving the project's own work under `local/`, so `waytide/` holds
two directories instead of eleven.

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

## 12. Waytide is a system, not a framework

An applicative Ruby error rule was added first — an applicative error extends
`RuntimeError` directly, argued from what the parent class claims: `StandardError`'s
direct subclasses are the language's own failure categories, so extending it puts a
library's error among them. Then a directory-naming question opened a larger one.

The question began as whether the installed-packages directory should be marked apart
from its ten siblings — `.framework` or `_framework`. Both were rejected on the naming
standard: a dot prefix hides binding content from listings and from tools that skip
dot-directories, and an underscore is an opaque code borrowed from Jekyll and Sass, a
mapping the reader has to be taught. But the problem behind it was real, and it was the
tree rather than the name.

**Then the word itself failed inspection.** In software a **framework** is something you
build inside; it inverts control and calls your code. Waytide runs nothing — it is files
an agent reads, and the two shell scripts are harness hooks rather than a runtime. A
reader in a software context imports the wrong meaning first. **System**, in the sense a
*design system* carries, holds on every point: a shared, versioned body of guidance a
project adopts, distributed rather than executed, accreting, authored, governing how
work proceeds rather than how programs run — a current term of art in an adjacent
discipline rather than a metaphor.

Renamed everywhere: the directory, the session-start notice, the status line, the
generated bootstrap, the harness configuration, the READMEs, the docs, and the six rules
that named it. Two exclusions, both on rules already in play — **historical records keep
the original word**, including the log entry that named the directory `framework` in the
first place, and **"test framework"** in the testing package means TestBench.

A mistake inside it: the directory move made all hundred rule files look changed, so 88
provenance-footer lines were appended, some twice. Stripped, and re-applied to the nine
files whose content actually changed. A second: the blanket conversion rewrote
`CONTRIBUTING.md`'s account of the rename history to claim the path had always settled at
`system/`. Corrected to read root → `rules/` → `packages/` → `framework/` → `system/`,
with a note not to restate the earlier names.

## 13. The project's own work moves under `local/`

The eleven-sibling problem remained. `agent-rules-convention` already drew the line the
tree did not: rules on one side, working state on the other. The shape settled is
sharper than that — **what came from outside, and what the project wrote** — which puts
the project's own `rules/` inside `local/` rather than beside the packages:

```
waytide/
├── system/   installed, never edited in place
└── local/    rules/ + log, deferred, observations, design,
              plans, experiments, features, sessions, loops
```

The cost is that the bootstrap now names two paths in different branches of the tree.

**This repository drops the `waytide/` wrapper**, keeping `system/` and `local/` at the
root, for the same reason the packages were never nested under it: this *is* Waytide.
`AGENTS.md` states the mapping for reading a rule's consuming-project path here.

**The root `log/` went too.** It held fourteen files, of which one was a genuine one-line
decision entry, misfiled — that moved to `local/log/`. The other thirteen are the record
of the `constant` migration, and moved to `local/migration/`, which is what their own
README already called them. Two directories a character apart, holding different kinds of
thing, is now one.

**Publishing cost the most.** The split path changed, so every component repository's
history was replaced — all seven force-reset, the fourth such reset the project has had
and the one `CONTRIBUTING.md` warned about. Later changes fast-forwarded normally.

**A consuming project cannot pull its way across that**, because its installed subtree
shares no commits with the reset remote. So `migrate-to-system-and-local.sh` moves the
project's own directories, removes and re-adds the packages at the new prefix, rewrites
the harness configuration, and refuses to touch `AGENTS.md` — printing what to delete and
which command regenerates it. Two faults surfaced in testing: `git mv` refuses a directory
holding no tracked files, which an empty `deferred/` ordinarily is; and the clean-tree
precondition counted untracked files, so the script tripped over itself when downloaded
into the project root to be run.

## 14. What the initiation gate actually says

The working-location options were worded from where the work happens — *single tree* and
*worktree* — and the developer read one at a real gate and corrected it. Two faults, and
the second was not a wording matter.

**The label described a branch that did not exist.** "Switch this working tree to
`experiment/<subject>`" reads as though the branch were already there. At initiation it is
not; the option creates it.

**The rule's worktree command would have failed.** It gave
`git worktree add <path> experiment/<subject>`, which refuses a branch that does not
exist — verified. At initiation it takes `-b`. The plain form is right only when a
worktree is added to work already under way, where the branch is there to check out. The
wording fault and the broken command had one cause: both assumed a branch that the gate
is what creates.

**Settled: each option is named for what it creates.**

> **Branch only** — Create the branch `experiment/<subject>` and switch this working tree
> to it. At the conclusion this working tree switches back.
>
> **Branch and worktree** — Create the branch `experiment/<subject>` and check it out in a
> new worktree: a second working directory at `<path>`. This working tree stays on
> `<upstream branch>`.

This also retires *single tree*, settled earlier the same night against *Branch* and
*Worktree* on the grounds that calling one option "Branch" implies the other does not
branch. The new pair satisfies that and says more: both name a branch, and only one names
a working directory. What it cost was fourteen stale uses across both lifecycle rules,
both record conventions, the foundation README, and three documentation pages — found only
by grepping for them after the question "does the feature capability offer a worktree too?"
turned up a bullet my own edit had severed mid-sentence.

## 15. A worktree's name puts the kind before the subject

With both lifecycle rules in place the worktree naming came back as a sorting question.
A worktree is a sibling of the repository directory, and the name settled as
`<repository-name>-<kind>-<subject>` — the branch name with its slash written as a dash,
prefixed by the repository. For a repository at `…/projects/eventide/constant` and the
branch `feature/upload-retries`, that is `…/projects/eventide/constant-feature-upload-retries`.

**The kind comes before the subject** so that every feature sorts together under
`<repository>-feature-` and every experiment under `<repository>-experiment-`, rather
than the two interleaving by subject when the parent directory is listed. The shared
repository prefix keeps a worktree in the same lexical vicinity as the repository it
belongs to.

Sibling placement is not cosmetic: it keeps the path **outside the repository working
tree**, where it must be. A worktree created inside it appears as untracked content in
the feature's own `git status`.

Recorded in `local/log/2026-07-27T23-40-10Z-the-worktree-name-puts-the-kind-before-the-subject.md`.

## 16. Branch only says nothing about the working tree

The option pair settled in section 14 was read once more at the gate, and the
**branch only** label was still describing the wrong thing. It had been written as a
movement of the working tree — switch this tree to the branch — when what actually
distinguishes the two options is whether a *second working directory* is added.

Branch only adds none. So it is presented as the branch it creates and the return at the
conclusion, and the working tree is left out of its description entirely, being immaterial
to what the option decides. The distinction between the two options is carried by the one
thing that differs.

Recorded in `local/log/2026-07-27T23-50-10Z-branch-only-says-nothing-about-the-working-tree.md`.

## 17. The status line reports an uncommitted working tree

The status line gained a third segment, present only when git reports something not
committed:

```
waytide · master · uncommitted changes - Waytide system active (7 packages)
```

It counts modified tracked files, staged changes, and **untracked files that are not
ignored**. All three are uncommitted, and the untracked case is the point of the indicator
rather than a cost it carries — a file left untracked is usually one that should be added
or ignored. The occasion for the change was this repository beginning the session with four
such files, unnoticed.

**Words rather than a mark on the branch.** `master*` is the conventional form and carries
no meaning until a reader is taught it, which the naming standard rejects. No count either:
the line already carries one, and a number that changes with every edit is noise. The
segment is absent when the tree is clean, which is how the whole line works — a segment
appears only when it has something to say.

Recorded in `local/log/2026-07-28T00-05-10Z-the-status-line-shows-uncommitted-changes.md`.

## 18. The foundation scripts, and the old migration path retired

A short pass over `system/foundation/`'s scripts, beginning with the indicator from the
previous section doing its job: an untracked file named `noise`, empty, was what the new
segment was reporting. Removing it made the tree clean.

**The refresh script was not executable.** `refresh-packages.sh` was the one script in
`system/foundation/` still at mode 644 while `install.sh`, `session-start.sh`, and
`statusline.sh` were at 755.

Setting the bit turned out not to finish the job. The script was still reached through `sh`
everywhere it was documented — the README's refresh command and the script's own usage
comment both passed it to `sh`, so the executable bit changed nothing about how anyone was
told to run it. Both were corrected to the direct form. **`install.sh` keeps its `sh`
prefix and is not a similar case:** it is fetched with `curl`, which does not preserve the
mode, whereas `refresh-packages.sh` reaches a project inside `waytide/system/foundation/`
by `git subtree`, which does.

**`migrate-to-system-and-local.sh` is removed.** It moved a consuming project from
`waytide/framework/` to the `system/` and `local/` layout — the one-time migration
recorded in section 13. Removing it was first taken as removing the file alone, and the
references were then removed with it on a second pass: the README's migration section
including the `raw.githubusercontent.com` URL the script was fetched from, the refresh
script's pointer to it when `waytide/system/` is absent, and a comment naming which scripts
tolerate untracked files. The mention in this record is left in place, being a record of
what happened rather than a live reference.

**Foundation was published** by the `CONTRIBUTING.md` runbook — `report-direct-commits.sh`
clean before and after, the split verified to carry the mode and to have lost the migration
script, and the fast-forward guard confirming no force was involved. `waytide/foundation`
moved `76f9a39..3704677`.

**Deferred:** the `sessions/` directory should be named `work-session/` —
`local/deferred/2026-07-28T00-42-29Z-the-sessions-directory-is-named-work-session.md`,
raised while this record was being appended, with the singular-versus-plural question
against its siblings left for the resolution to settle.

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
- **An option label is read at the moment of deciding, and states or hides what happens.**
  "Switch this working tree to `experiment/X`" described a branch that does not exist yet.
  The command beside it had the same defect and would have failed.
- **A word can fail inspection years after it is chosen.** "Framework" was settled on the
  name-literally principle five days earlier and still misdescribed the thing: in software
  a framework inverts control and calls your code, and Waytide runs nothing.
- **A naming question can be a structural question wearing a disguise.** `.framework` and
  `_framework` were both attempts to mark one directory apart from ten siblings. The
  answer was that there should not be eleven siblings.
- **Deleting a resolved deferred item strands references to it.** The convention says to
  delete on resolution and is silent on what else points at the file. Two instances were
  found — one created and corrected today, one stranded six days and discovered only by
  searching. Neither surfaced on its own; the question is now deferred.
- **A name sorts, and the order of its parts decides what groups.** Putting the kind
  before the subject in a worktree name is what makes every feature sort together instead
  of interleaving with the experiments.
- **An option is described by what distinguishes it.** Branch only was being described by
  a working tree it does not touch. What separates the two options is whether a second
  working directory is added, and only that belongs in the label.
- **An indicator is worth the case that looks like noise.** The untracked-file case is
  what the status-line segment is *for* — four such files sat unnoticed — not a cost the
  indicator carries. A fifth, `noise`, was found and removed the moment the segment
  existed to report it.
- **A permission bit is not an interface.** Setting `refresh-packages.sh` executable
  changed nothing anyone would notice: the README and its own usage comment still passed
  it to `sh`. How a thing is invoked is what the documentation says, not what the
  filesystem permits.
- **How a file arrives decides how it is run.** `install.sh` keeps its `sh` prefix and
  `refresh-packages.sh` sheds it, for one reason — `curl` drops the mode bit and
  `git subtree` preserves it.
- **Deleting a script strands what points at it, the same way deleting a deferred item
  does.** The migration script's removal left a documented `curl` URL, an error message
  directing users to it, and a comment naming it. This is the stranded-reference item
  from section 8 recurring in a second form, against a file rather than a queue entry.

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
- **branch only** / **branch and worktree** — the two working locations, named for what
  each creates. Both create the branch; only the second creates a working directory.
  Retires *single tree*, which named where the work happens and said nothing about a
  branch.
- **system** — what Waytide is: a shared, versioned body of guidance a project adopts,
  distributed rather than executed, governing how work proceeds. Not a **framework**,
  which in software names something you build inside that inverts control.
- **`waytide/system/`** — the installed packages, never edited in place. **`waytide/local/`**
  — everything the project writes, its own `rules/` included. In this repository both sit
  at the root without the `waytide/` wrapper.
- **the `**State:**` line** — the canonical, single statement of an experiment's state, in
  its record's setup block. The only place in a record readable as the state, because the
  state words appear throughout its forecast and findings prose. A record without one is
  in flight.

## Where the durable records live

*Paths here are current. The narrative above names them as they were at the time —
`framework/` before the rename, `waytide/log/` before the move — and is left that way,
since restating them would erase the record of what changed.*

- **New rules:** `system/foundation/a-time-value-carries-minutes-and-seconds.md`,
  `agent-features-convention.md`, `feature-runs-on-its-own-branch.md`,
  `record-title-date-format.md` (adopted from the component repository), and
  `system/code/ruby/applicative-errors-extend-runtime-error.md`.
- **Rules changed:** `record-rule-authorship-in-a-footer`,
  `experiment-runs-on-its-own-branch`, `agent-experiments-convention`,
  `announce-waytide-at-session-start`, `agent-rules-convention`, `status-report-format`,
  `agent-file-names-use-iso8601-utc-prefix`, and the `subject-first-commit-messages`
  correction adopted from `waytide/git`.
- **Scripts:** `system/foundation/session-start.sh`, reporting experiments and features
  that have not concluded; `system/foundation/statusline.sh`, which gained the
  uncommitted-changes segment; `system/foundation/refresh-packages.sh`, now executable and
  documented as invoked directly; and `report-direct-commits.sh` at the root, which reports
  component repositories carrying commits this history does not contain.
  `system/foundation/migrate-to-system-and-local.sh`, which moved a consuming project to
  this layout, was **removed** at the session's close along with every reference to it — see
  section 18. Section 13 names it as it stood at the time.
- **Decision log:** forty-three entries under `local/log/`.
- **Design and plan:** `local/design/2026-07-27T07-09-02Z-the-feature-capability.md` and
  `local/plans/2026-07-27T07-17-24Z-the-feature-capability.md` — the first of each in this
  repository, all seven tasks complete with inline notes.
- **Experiment record:** `local/experiments/2026-07-21T09-17-02Z-rules-files-flattening.md`,
  backfilled with its `**State:**` line and working location.
- **Documentation:** `docs/experiments.md`, `docs/features.md` (new), and
  `docs/capabilities.md`, whose list gained a *Building features* section and renumbered
  from six onward. The standing website-content review item covers all three.
- **Deferred queue:** three items resolved and deleted, three added; **seven remain** —
  among them the stranded-reference item and the `work-session/` rename raised in
  section 18.
- **This repository's layout:** `system/` and `local/` at the root, `local/migration/`
  holding the pre-Waytide migration records, and `AGENTS.md` stating how to read a rule's
  consuming-project path here.
- **Component repositories:** all seven at the `system/<package>` split, force-reset once
  when the path changed and fast-forwarding since. `waytide/foundation` was published
  again at the session's close, `76f9a39..3704677`, a fast-forward.

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
Changed by Scott Bellware on Mon Jul 27 2026 at 12:59:44 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 3:30:32 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 4:25:24 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 5:44:12 PM PT
