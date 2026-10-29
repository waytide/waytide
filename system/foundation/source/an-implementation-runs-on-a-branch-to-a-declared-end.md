# An implementation runs on a branch to a declared end

**Trigger:** When starting, working within, adding a worktree to, suspending, or concluding an experiment or feature implementation

- **Solubility:** 21
- **Original rank:** 6 of 106
- **Unclarity:** 0.58

An implementation is bounded work with a lifecycle. It runs on a branch created for it, it is designed through the five hinges, and it reaches one of a fixed set of declared states. It is never left silently open.

**Its tag decides the parts that differ.** An `[experiment]` is built to a **question** and a `[feature]` to an **intent** (see the the-implementations-directory-holds-one-record-per-implementation rule). Every clause below that names one kind names it because of that difference, and no other clause varies.

## The branch

- **Name it `experiment/<subject>` or `feature/<subject>`**, matching the tag. `<subject>` is a short dash-separated, lower-case name of what is under test or what is being built, named literally. Add a `-run-<n>` suffix only where an experiment actually has multiple runs.
- **Where the work has a worktree, the name carries `worktree/`** — `feature/worktree/<subject>` and `experiment/worktree/<subject>`. A branch checked out in a worktree cannot be checked out again in the main working tree, and nothing in `git branch` says which those are. The segment says it in the one listing where the question comes up.
- **Adding a worktree to work already under way renames the branch**, and that act is already a confirmed one the record carries. A name that says where the work is has to keep saying it, or it is worse than a name that never claimed to.
- **The upstream branch is not encoded in the name.** A branch can outlive a change of upstream target, so the record names it.
- **Record the base — no tag.** The baseline is captured in the record as the base commit SHA and the ref it came from. A later run branches straight from the recorded commit. Tags would accumulate as clutter in `git tag` and on any remote, and the record already names the base.

**The worktree segment is an exception to the upstream clause, and it is one deliberately.** The upstream target is kept out of the name because a name that goes stale misleads, and a worktree can be added or removed the same way. What separates them is where each fact is asked about. An upstream target is asked about when the work is merged, and the record is open at that moment. The existence of a worktree is asked about in `git branch`, where the record is not. So the one that has no other answer at the point of asking is the one the name carries — and the rename is what keeps it from becoming the stale name the other clause refuses.

## An experiment in phases

**An experiment may run in phases**, each a question of its own that serves the experiment's. The record names the phases and their order at the start, and states a forecast for each before its work.

- **A phase's branch is the experiment's branch name, a dot, and the phase's name** — `experiment/rule-reduction.flattening`. A slash cannot join them: git refuses a branch named beneath another branch's name, so `experiment/rule-reduction/flattening` cannot exist beside `experiment/rule-reduction`. The `worktree/` segment, where the experiment has one, carries into each phase's name.
- **A phase branches from the experiment's branch and concludes into it.** It is affirmed, refuted, or inconclusive on the engineer's declaration, as an experiment is, and an affirmed phase merges back into the experiment's branch. The experiment's record carries each phase's verdict and findings.
- **The experiment concludes after its phases**, and only then merges to its upstream branch. A phase never merges anywhere else.
- **One phase runs at a time, in the order the record names**, each starting from the experiment's branch as the phases before it left it.

## The working location, chosen at the start

**Put it through the selection interface at every start, with no standing default.** The trade is situational: work that resolves in a sitting favours branch only, and work that has to coexist with other work favours a worktree.

**Each option states what it creates:**

> **Branch only** — Create the branch and switch this working tree to it. At the conclusion this
> working tree switches back.
>
> **Branch and worktree** — Create the branch as `<kind>/worktree/<subject>` and check it out in a
> new worktree: a second working directory at `<path>`. This working tree stays on
> `<upstream branch>`.
>
> **The current branch** — Build it where the working tree already is, creating nothing. There is
> no branch to switch back to and nothing to merge.

**The current branch is a `[feature]`'s alone, and it is offered last.** An experiment is a controlled deviation from the main line: it may be refuted or abandoned, and until it is affirmed its changes must not reach the branch it deviates from. The branch is what makes that reversible, so it is not optional there. A feature **is** the main line, and a branch prevents nothing already ordinary.

**Last, because a first option reads as recommended** whatever a rule says about defaults, and the current branch is the option that gives up isolation.

**What the current branch costs, stated plainly.** There is no isolation: partial work sits on the branch others read, and abandoning means reverting rather than deleting a branch. The record still carries the intent, the state, and the confirmations, so only the containment differs.

**A worktree is a sibling of the repository directory**, named `<repository-name>-<branch with its slash written as a dash>` — `constant-feature-upload-retries`, `waytide-experiment-state-suffix-legibility`. The kind comes before the subject, so every experiment sorts together and every feature does. Sibling placement keeps the path outside the repository working tree, where a worktree created inside would appear as untracked content in the work's own `git status`.

**The commands are `git switch -c <branch>` and `git worktree add -b <branch> <path>`.** The `-b` is not optional — `git worktree add <path> <branch>` fails on a branch that does not exist, and is the right form only when a worktree is added to work already under way.

**The working location changes on two triggers, and only by adding a worktree.** One is external: other work arrives that the engineer intends to work alongside this. One is internal — the work is **escalated**, judged to need more isolation than the single working tree gives it, having proved larger than it was taken for. Either way the addition is confirmed and recorded, the record **gains a line** rather than having its original rewritten, and the conclusion dispatches on the current location. Collapsing a worktree back has no motivation and is not done.

## The human's level of participation, chosen at the start

**Attended or unattended, put through the selection interface beside the working location.** Attended is the default. See the design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule, which states why the two sit at one gate and what changes between them.

## The end

**Every implementation ends in a declared state**, or is suspended, which is paused rather than ended. The words are the the-implementations-directory-holds-one-record-per-implementation rule's.

**An `[experiment]` is affirmed only on the engineer's explicit declaration.** On affirmation its log is **copied into the project log**, so the durable record carries what it established. Where it produced implementation, the branch also merges to the upstream branch — waiting on the tests, and on specific confirmation where no test covers what was built. An observation-only experiment has nothing to merge, and affirmation is the log copy alone.

**An `[experiment]` that will merge brings what master needs to conform to it.** Before it merges, its branch holds every rule its practice needs, and every other change master needs to conform to what it developed. A practice the experiment introduced reaches master already governed, not as work left over for after the merge.

**A `[feature]` is verified before integrating, and nothing gates the merge.** `run-the-test-suite-after-changes-before-considering-whether-to-commit` already achieves it, every commit on the branch having been verified. The merged result is a combination neither branch ran, so a feature whose commits all passed can still break the suite on integration. That is ordinary and is fixed from there. There is no affirmation step, because a feature has no finding to promote.

**Refuted, inconclusive, abandoned, and superseded keep the record and do not merge.** The record is maintained and marked, so the attempt and its findings survive as evidence.

**Supersession runs through suspension.** A superseded implementation stays **Suspended** until the engineer explicitly concludes it as superseded, and its branch is kept until then. The two records name the counterpart.

**A child supersedes its parent by preserving it.** Work created from another's branch already holds that history. The child merges the parent first, which brings over every commit the parent made after the child was created from it and makes deleting the parent branch lossless. Then the parent is parked `Superseded`, the records name each other, the child's upstream becomes what the parent's was, and the parent branch is deleted on confirmation. **This is the one supersession that merges the superseded branch**, because a child already contains its parent and refusing the merge would discard the parent's last commits rather than preserve them.

**Conclude in the main working tree, on the upstream branch.** With branch only, the working tree switches back. Under a worktree the main working tree never left it, so the session must end there rather than in a directory that has been removed. On the current branch there is nowhere to return from.

**Branch deletion is engineer-confirmed, put through the selection interface, and the worktree is removed first.** Git refuses to delete a branch checked out in a worktree, and **one confirmation covers the two** — a single cleanup act with a forced order, which splitting would prompt twice for. Suspension never deletes and never removes a worktree.

## The agent never raises the end of an `[experiment]`

**Do not offer to conclude, affirm, refute, or merge one.** Not as a next step, not as an option among others, and not as a precondition for something else. The precondition form is the one that slips through: *this cannot be published until it merges* states a true fact and points at the ending. Report what is settled and what is open, and stop there.

**An experiment's length is the engineer's judgment** and is not readable from how much work the branch holds. An agent that has just finished a stretch of work sees a natural stopping point where the engineer sees a question still open. The prompt would arrive at the moment the agent's view is narrowest.

**This does not reach a `[feature]`**, which has no verdict to press toward and whose completion is the ordinary conclusion of main-line work.

## Drift, and the one lifecycle change the agent does raise

**While an `[experiment]` is open under branch only, watch for main-sequence work starting**, and surface it rather than letting the branches silently diverge. Offer two recourses through the selection interface — **suspend the experiment**, where the intent is to stop working it for now, or **add a worktree**, where the intent is to keep working it alongside. Neither ends the experiment, and the engineer's intent decides.

**What the watch rests on, stated plainly:** the branch name, which the status line carries every turn, and a judgment of whether the work at hand answers the recorded question. Only the first is mechanical, and a missed detection produces nothing at all — no alarm, no artifact, just the divergence. It is a practice, not a guarantee.

**Under a worktree there is nothing to diverge and nothing to notice.** The main working tree stays on the upstream branch and the experiment leaves no trace in it, so the configuration that isolates best is the one that most easily loses track. That is what the **session-start notice** answers, reporting every implementation that has not concluded.

**There is no counterpart for a `[feature]`.** Other work during a feature is normally another feature, and starting one is ordinary rather than a problem, so there is nothing to detect. A feature being forgotten is covered by the same notice.

**Why:** an experiment and a feature ran on two lifecycles that agreed on the branch, the working location, the participation decision, the declared end, the confirmations, the conclusion in the main working tree, and the confirmed branch deletion. They differed on the forecast, the verdict, the merge gate, the affirmation, the current-branch option, and the drift watch — and every one of those differences follows from a question against an intent.

Stating the shared lifecycle once and conditioning six clauses on a tag is smaller than stating it twice, and it makes the asymmetry legible instead of leaving a reader to diff two rules to find it.

**How to apply:** branch for every implementation, named for its tag. Record the upstream branch, the branch, and the base. Ask the working location and the participation level at the start, through the selection interface, and record both. Offer the current branch only for a feature, and offer it last. Before an experiment merges, write on its branch the rules and changes master needs to conform to it.

Follow DBE inside. End in a declared state. Copy an affirmed experiment's log into the project's log and merge where it produced implementation. Verify a feature before integrating and add no gate at the merge.

Raise no ending for an experiment. Leave the engineer on the upstream branch in the main working tree. Confirm before deleting any branch, removing the worktree first under one confirmation.

## Compressed

1. An implementation runs on its own branch, designed through the five hinges by DBE, to a declared state.
2. It is never left silently open.
3. Its tag decides the parts that differ.
4. An `[experiment]` is built to a question, and a `[feature]` to an intent (see the the-implementations-directory-holds-one-record-per-implementation rule).
5. A clause below names a kind only because of that difference. Every other clause holds for both.

## The branch

1. Name it `experiment/<subject>` or `feature/<subject>`, matching the tag.
2. The subject is short, lower-case, and dash-separated, and names literally what is tested or built.
3. Add `-run-<n>` only where an experiment has more than one run.
4. With a worktree, the name carries `worktree/`: `experiment/worktree/<subject>`, `feature/worktree/<subject>`.
5. A branch checked out in a worktree cannot be checked out in the main working tree, and `git branch` is where that question comes up.
6. Adding a worktree to work under way renames the branch.
7. The rename is confirmed, and the record carries it.
8. Keep the upstream branch out of the name, since a branch can outlive its upstream target. The record names it.
9. A worktree is the one fact the name carries, because `git branch` has no other answer for it.
10. The rename keeps that fact current.
11. Record the branch, its upstream, and its base. Record the base as its commit SHA and the ref it came from.
12. Make no git tag for the base.
13. A later run branches from the recorded commit.

## Phases

1. An experiment may run in phases, each a question that serves the experiment's.
2. The record names the phases and their order at the start.
3. The record states each phase's forecast before its work.
4. A phase's branch is the experiment's branch, a dot, and the phase's name: `experiment/rule-reduction.flattening`.
5. Git refuses a slash here, because no branch can sit beneath another branch's name.
6. A `worktree/` segment carries into each phase's name.
7. A phase branches from the experiment's branch and concludes into it.
8. A phase is affirmed, refuted, or inconclusive only on the engineer's declaration.
9. An affirmed phase merges back into the experiment's branch.
10. The record carries each phase's verdict and findings.
11. One phase runs at a time, in the record's order, each from the experiment's branch as the earlier phases left it.
12. A phase merges nowhere else.
13. The experiment concludes after its phases, and only then merges to its upstream branch.

## The working location

1. Put the working location through the selection interface at every start, with no default.
2. Each option states what it creates:

> **Branch only** — Create the branch and switch this working tree to it. At the conclusion this
> working tree switches back.
>
> **Branch and worktree** — Create the branch as `<kind>/worktree/<subject>` and check it out in a
> new worktree: a second working directory at `<path>`. This working tree stays on
> `<upstream branch>`.
>
> **The current branch** — Build it where the working tree already is, creating nothing. There is
> no branch to switch back to and nothing to merge.

3. Offer the current branch for a feature only.
4. An experiment's changes must not reach the branch it deviates from before it is affirmed, and its own branch is what keeps them out.
5. A feature is the main line.
6. Offer the current branch last, because a first option reads as recommended, and the current branch gives up isolation.
7. When offering it, state its cost plainly: there is no isolation, partial work sits where others read, and abandoning means reverting rather than deleting a branch.
8. On the current branch, the record still carries the intent, the state, and the confirmations.
9. Place a worktree beside the repository directory, named `<repository-name>-<branch, each slash as a dash>`, as in `waytide-experiment-state-suffix-legibility`.
10. A worktree inside the repository would show as untracked content in the work's own `git status`.
11. Create a branch-only implementation with `git switch -c <branch>`, and a worktree implementation with `git worktree add -b <branch> <path>`, where `-b` is required.
12. Use `git worktree add <path> <branch>` only to add a worktree to work under way, since it fails on a branch that does not exist.
13. Change the location only by adding a worktree.
14. Add one only on one of two triggers: other work arrives that the engineer means to work alongside.
15. Or the work is escalated, needing more isolation than it was taken for.
16. Confirm the addition.
17. Add a line to the record, and keep the original.
18. The conclusion follows the location as it then stands.
19. Never collapse a worktree back.

## Participation

1. Put attended or unattended through the selection interface beside the working location.
2. Attended is the default.
3. The design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule states why the two sit at one gate, and what changes between them.
4. Record both choices.

## The end

1. Every implementation ends in a declared state, or is suspended, which pauses it.
2. The words are the the-implementations-directory-holds-one-record-per-implementation rule's.
3. An `[experiment]` is affirmed only on the engineer's explicit declaration.
4. On affirmation, its log is copied into the project log.
5. Where it produced implementation, its branch merges to the upstream branch, after the tests pass.
6. Where no test covers the work, the merge also waits for specific confirmation.
7. An observation-only experiment's affirmation is the log copy alone.
8. An `[experiment]` that will merge brings what master needs to conform to it: every rule its practice needs, and every other change, on its branch before it merges.
9. A `[feature]` merges with no gate, because every commit was verified under the run-the-test-suite-after-changes-before-considering-whether-to-commit rule.
10. The merged result can still break the suite, and that is fixed from there.
11. A feature has no affirmation.
12. Refuted, inconclusive, abandoned, and superseded work keeps its record, marked with its state, so the attempt and its findings survive.
13. Refuted, inconclusive, abandoned, and superseded work does not merge.
14. Supersession runs through suspension.
15. The superseded implementation stays Suspended, its branch kept, until the engineer concludes it as superseded.
16. The two records name each other.
17. A child supersedes its parent by preserving it.
18. The child merges the parent first, taking every commit the parent made after the child branched.
19. The parent is then parked Superseded, and the records name each other.
20. The child takes the parent's upstream.
21. The parent branch is deleted only on confirmation.
22. This is the one supersession that merges the superseded branch.
23. Conclude in the main working tree, on the upstream branch.
24. Under branch only, the working tree switches back.
25. Under a worktree, end the session in the main working tree, never in the removed directory.
26. On the current branch there is nothing to return from.
27. Branch deletion takes one confirmation from the engineer, through the selection interface. It covers the worktree removal too. Do not prompt twice.
28. Remove the worktree first, since git refuses to delete a branch checked out in a worktree.
29. Suspension deletes no branch and removes no worktree.

## The agent never raises the end of an `[experiment]`

1. Do not offer to conclude, affirm, refute, or merge one: not as a next step, an option, or a precondition.
2. Report what is settled and what is open, and stop.
3. An experiment's length is the engineer's judgment, not readable from the work done.
4. A `[feature]` is not covered, because its completion is ordinary.

## Drift

1. While an `[experiment]` is open under branch only, watch for main-sequence work starting, and surface it.
2. Offer two recourses through the selection interface: suspend the experiment, where the intent is to stop working it for now, or add a worktree, where the intent is to keep working it alongside.
3. Neither recourse ends the experiment, and the engineer's intent decides.
4. The watch rests on the branch name in the status line and on a judgment of whether the work answers the recorded question.
5. The watch is a practice, not a guarantee.
6. Under a worktree there is nothing to watch.
7. A `[feature]` has no watch, since starting other work during one is ordinary.

## Compression

- 2026-10-22, compressed: compression 0.43, change 0.63, solubility 21 → 42, clarity 0.42 → 0.76
- 2026-10-24, revised: written as a numbered list; checked: 86 directives, 75 kept, 11 less precise, 0 lost, 3 repairs, re-checked kept
- 2026-10-27, re-checked: 88 directives, 75 kept, 12 less precise, 1 lost, 13 repairs, re-checked kept; directive 58 left less precise, since the point gives its reason and the run-the-test-suite-after-changes-before-considering-whether-to-commit rule states the directive
- 2026-10-28, revised: Why points removed, solubility 42 → 41, clarity 0.76 → 0.79; checked: 85 directives, 84 kept, 1 less precise, 0 lost

## History

Until Sun Oct 25 2026 this rule was named implementation-lifecycle and titled "An implementation runs on a branch, from a working location chosen at the start, to a declared end".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Mon Oct 26 2026 this rule restated why attended or unattended sits at one gate with the working location, and what changes between them. It now cites the attended-or-unattended-is-chosen-when-the-work-is-started rule.

Related:

- the the-implementations-directory-holds-one-record-per-implementation rule — the record, the tags, and the state words
- the design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started and the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rules
- the the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule — the notice reporting what has not concluded
- the `git` run-the-test-suite-after-changes-before-considering-whether-to-commit and announce-a-branch-switch-in-a-bordered-block rules

---

Authored by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:34:20 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:50:42 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 2:08:32 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:57 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:09 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:55 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:18:23 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:10 PM PT
