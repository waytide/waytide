# A package is published from `master`, and a publish is never offered from an experiment or a feature

**Publishing follows a merge to `master`.** It is not a step that follows a commit, and not a step that follows any other merge. A component repository receives a `git subtree split` of this composite's history. A publish puts that content in front of every project that installs the package.

**So an experiment never publishes and a feature never publishes.** Neither is `master`.

**A merge to some other branch does not release the hold.** An experiment's upstream branch is not always `master`, and a feature's is not either. Each may merge into another topic branch, and the foundation an-implementation-runs-on-a-branch-to-a-declared-end rule says so. That merge concludes the work against its own upstream. It does not put the content on `master`, so it licenses no publish. The publish waits for `master`, however many merges that takes.

**The work also has to have concluded.** An experiment is **affirmed**, which the engineer declares. A feature is **completed**. A feature has no affirmation, being built to an intent rather than to a question, which the foundation an-implementation-runs-on-a-branch-to-a-declared-end rule states. Reaching `master` and reaching a concluded state are two conditions, and a publish waits for the two.

## The publish is never offered

**Do not offer to publish**, in any form. Not as a next step, not in a state summary, not as an option among others, and not as a precondition for something else. This holds while an experiment or a feature is open, whatever the work has produced.

**A publish named as a precondition is the same offer.** *This package cannot be installed anywhere until it is published* states a true fact and points at the publish. It makes the open state read as an obstacle. Do not write what the work is blocked on where the block is that the work has not concluded.

**This is the publishing case of the foundation an-implementation-runs-on-a-branch-to-a-declared-end rule's instruction** that the agent never raises the end of an experiment. An offer to publish reaches the same place by a longer route. A publish requires a merge, and a merge requires the ending.

**Report what is settled and what is open, and stop there.** The engineer signals when the work is done.

**What the never-offer instruction reaches is the agent's own text**, and it cannot reach more than that. The harness has a channel of its own — the grey suggestion the tab key completes — which predicts the engineer's next message from the conversation. On 2026-08-23 it suggested publishing a package while a feature branch was open, drawn from the engineer's own earlier messages in the same session, at a moment when the rule forbids the agent from raising it.

**That is not a violation and it is not a loophole.** No rule here binds the harness, and the instruction is not weakened by a channel it was never able to govern. It is recorded so a later reader does not take the suggestion for the agent's offer, and does not conclude from it that the instruction failed.

## The exception is rare and it is confirmed

Where an experiment's own question is about publishing, put the exception through the selection UI and record it as a confirmation in the experiment record. Nothing else licenses a publish from a topic branch.

**The never-offer instruction does not reach that case.** An experiment whose question is about publishing has publishing as its subject, so raising it is the work rather than an offer. What is forbidden is raising it where the experiment is about something else.

**Waytide carries no version numbers**, and this rule asks for none. The `versioning` package's the-next-version-is-put-to-the-engineer-never-decided-by-the-agent rule governs a consuming project that versions its packages. It does not govern this project, which versions nothing.

**Why:** an experiment can be refuted, and its branch is deleted on confirmation. A feature can be abandoned. A publish is neither reversible nor confirmable after the fact, since a component repository's `master` is what a consuming project pulls.

`master` is the line rather than any upstream branch, because a topic branch that merges into another topic branch has not reached the main line. The content still sits where it can be abandoned wholesale. `master` is the one state every consuming project's install is taken against.

Forbidding the offer is what keeps the rule from being worked around. The act was already forbidden. An agent that names the publish as the next step presses toward the merge and the ending a publish needs, which is a state change the engineer did not ask for. It arrives at the moment the agent's view of the work is narrowest.

**How to apply:** merge the work to `master` first. Then publish the affected packages, following `CONTRIBUTING.md`. Do not publish from an experiment branch, a feature branch, or any other topic branch.

Never offer a publish while an experiment or a feature is open. Never name one as an action, an option, a next step, or a reason something else cannot happen yet. Wait for the engineer.

## Compressed

## When a publish happens

1. Publish only after the work merges to `master`. A commit, or a merge to any other branch, does not license a publish.
2. An experiment and a feature never publish. Neither is `master`.
3. An experiment's or a feature's upstream may be another topic branch. A merge into it concludes the work against that upstream, but puts nothing on `master` and licenses no publish. The publish waits for `master`, however many merges that takes.
4. The work must also have concluded: an experiment is affirmed, which the engineer declares, and a feature is completed. A feature has no affirmation.
5. A publish waits for both conditions: reaching `master` and reaching a concluded state.
6. Merge the work to `master` first. Then publish the affected packages, following `CONTRIBUTING.md`.
7. Do not publish from an experiment branch, a feature branch, or any other topic branch.

## The publish is never offered

1. Never offer a publish while an experiment or a feature is open, whatever the work has produced.
2. Do not offer it in any form: as an action, a next step, in a state summary, as an option among others, or as a precondition or reason something else cannot happen yet.
3. Do not write what the work is blocked on where the block is that the work has not concluded.
4. Do not raise the end of an experiment by way of a publish.
5. Report what is settled and what is open, and stop. Wait for the engineer to signal that the work is done.
6. The instruction reaches only the agent's own text. A harness suggestion, such as the grey text the tab key completes, is not the agent's offer, not a violation of this rule, and not a loophole. It does not weaken the instruction.

## The exception

1. Where an experiment's own question is about publishing, put the exception through the selection UI and record it as a confirmation in the experiment record.
2. Nothing else licenses a publish from a topic branch.
3. In that experiment, raising the publish is the work, not a forbidden offer. Raising it in an experiment about something else stays forbidden.
4. Waytide carries no version numbers, and this rule asks for none. The `versioning` package's the-next-version-is-put-to-the-engineer-never-decided-by-the-agent rule governs a consuming project that versions its packages. It does not govern this project, which versions nothing.

## Compression

- 2026-10-29, compressed: 5183 → 2360 characters; checked: 32 directives, 23 kept, 6 less precise, 3 lost; 5 repairs, re-checked: 27 directives, 24 kept, 2 less precise, 1 lost; what is still not kept was judged reasons or background

Related:

- `CONTRIBUTING.md` — the publish procedure itself
- the foundation work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported rule — the same never-offer instruction for the act on the other side of a publish, refreshing the projects that installed the package
- the foundation an-implementation-runs-on-a-branch-to-a-declared-end rule — the affirmation and the completion a publish waits on, its instruction that the agent never raises the end of an experiment, and why a feature has no affirmation
- the versioning package's the-next-version-is-put-to-the-engineer-never-decided-by-the-agent rule — which governs a consuming project that versions its packages, and not this one

---

Authored by Scott Bellware on Wed Aug 12 2026 at 10:52:06 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 6:14:22 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:44:35 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 12:37:43 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:42:05 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:44 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:27:43 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
