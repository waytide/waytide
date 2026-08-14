# A package is published from `master`, and a publish is never offered from an experiment or a feature

**Publishing follows a merge to `master`.** It is not a step that follows a commit, and not a step
that follows any other merge. A component repository receives a `git subtree split` of this
composite's history. A publish puts that content in front of every project that installs the
package.

**So an experiment never publishes and a feature never publishes.** Neither is `master`.

**A merge to some other branch does not release the hold.** An experiment's upstream branch is not
always `master`, and a feature's is not either. Each may merge into another topic branch, and the
foundation experiment-lifecycle and feature-lifecycle rules each say so. That merge concludes the
work against its own upstream. It does not put the content on `master`, so it licenses no publish.
The publish waits for `master`, however many merges that takes.

**The work also has to have concluded.** An experiment is **affirmed**, which the engineer
declares. A feature is **completed**. A feature has no affirmation, being built to an intent rather
than to a question, which the foundation feature-lifecycle rule states. Reaching `master` and
reaching a concluded state are two conditions, and a publish waits for the two.

## The publish is never offered

**Do not offer to publish**, in any form. Not as a next step, not in a state summary, not as an
option among others, and not as a precondition for something else. This holds while an experiment
or a feature is open, whatever the work has produced.

**A publish named as a precondition is the same offer.** *This package cannot be installed anywhere
until it is published* states a true fact and points at the publish. It makes the open state read
as an obstacle. Do not write what the work is blocked on where the block is that the work has not
concluded.

**This is the publishing case of the foundation experiment-lifecycle rule's instruction** that the
agent never raises the end of an experiment. An offer to publish reaches the same place by a longer
route. A publish requires a merge, and a merge requires the ending.

**Report what is settled and what is open, and stop there.** The engineer signals when the work is
done.

## The exception is rare and it is confirmed

Where an experiment's own question is about publishing, put the exception through the selection UI
and record it as a confirmation in the experiment record. Nothing else licenses a publish from a
topic branch.

**The never-offer instruction does not reach that case.** An experiment whose question is about
publishing has publishing as its subject, so raising it is the work rather than an offer. What is
forbidden is raising it where the experiment is about something else.

**Waytide carries no version numbers**, and this rule asks for none. The `versioning` package's
the-next-version-is-chosen-by-the-engineer rule governs a consuming project that versions its
packages. It does not govern this project, which versions nothing.

**Why:** an experiment can be refuted, and its branch is deleted on confirmation. A feature can be
abandoned. A publish is neither reversible nor confirmable after the fact, since a component
repository's `master` is what a consuming project pulls.

`master` is the line rather than any upstream branch, because a topic branch that merges into
another topic branch has not reached the main line. The content still sits where it can be
abandoned wholesale. `master` is the one state every consuming project's install is taken against.

Forbidding the offer is what keeps the rule from being worked around. The act was already
forbidden. An agent that names the publish as the next step presses toward the merge and the ending
a publish needs, which is a state change the engineer did not ask for. It arrives at the moment the
agent's view of the work is narrowest.

**How to apply:** merge the work to `master` first. Then publish the affected packages, following
`CONTRIBUTING.md`. Do not publish from an experiment branch, a feature branch, or any other topic
branch.

Never offer a publish while an experiment or a feature is open. Never name one as an action, an
option, a next step, or a reason something else cannot happen yet. Wait for the engineer.

Related:

- `CONTRIBUTING.md` — the publish procedure itself
- the foundation experiment-lifecycle rule — the affirmation a publish waits on, and its
  instruction that the agent never raises the end of an experiment
- the foundation feature-lifecycle rule — the completion a publish waits on, and why a feature has
  no affirmation
- the versioning package's the-next-version-is-chosen-by-the-engineer rule — which governs a
  consuming project that versions its packages, and not this one

---

Authored by Scott Bellware on Wed Aug 12 2026 at 10:52:06 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 6:14:22 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:44:35 PM PT
