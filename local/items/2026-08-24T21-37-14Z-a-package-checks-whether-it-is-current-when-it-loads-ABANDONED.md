# A package checks whether it is current with its upstream when it loads, and a stale one is put to the engineer

- **State:** Abandoned
- **Tags:** [design]

**Why this state:** the engineer dropped it on 2026-08-24. Abandoning is a decision, which is what separates it from a record that lapsed because the work moved past it.

**No reason is recorded, because none was stated.** A reason is what a later reader reconsidering this would decide against, and inventing one would put the agent's reading in place of the engineer's.

**Everything below is left as written.** The direction, the five decisions taken on the day it was recorded, and the correction that moved the check from the session-start hook to the rule set read are the record of what was thought. A dropped record is not a draft.

**Its earlier state, and what held it there:** it was `Open` — the direction proposed and the mechanism unsettled. What the check compares, what the engineer is offered, whether the ask is per package or once for all of them, and what a stale package costs an engineer who declines were each open.

**2026-08-24 — the first version of this record placed the check in the session-start hook, and that was wrong.** The engineer stated that it belongs to **the rule set read that happens at the engineer's first prompt**. The correction is recorded rather than quietly made, because the two placements have different costs and the earlier reading made the idea look harder than it is. What follows is written against the read.

## Premise

**As the engineer stated it:** packages can check if they're up to date with their upstream master when they load. If a package is out of date, then the user can be asked how they'd like to proceed: ie: update the package now, and then read it.

**What makes it worth having:** an installed package is a copy, and a copy goes stale silently. A rule changed upstream is a rule the project is not following, and nothing announces it. The refresh is a command the engineer has to think to run, which is the same failure the deferred-queue rule names about an item nobody looks for.

**The window is the point.** A refresh run at any other moment lands after the session's rules are read, so the new rules take effect next session. Checking during the read puts the update **ahead** of the file being opened, so the rule that binds this session is the current one. That is the whole of what this buys over running `refresh-packages.sh` when it occurs to someone.

## Where the check runs

**In the rule set read, at the engineer's first prompt.** The read is the agent's own work: it opens the initialization rule first, prints what that carries, then opens every rule file in every installed package. The check sits inside that, per package, as each package is reached.

**Three things follow from the placement, and each was a difficulty under the hook reading.**

- **The agent can ask.** It has a turn and the selection interface. A `SessionStart` hook has neither — it runs before the session and emits text. Nothing about the ask needs inventing.
- **The wait is already announced.** The initialization rule prints *Loading Waytide will take a few moments* precisely because the read opens every rule file. A `git ls-remote` per package adds to a cost that is already named and expected, rather than introducing an unexplained pause.
- **The engineer's sequence works as stated.** *Update the package now, and then read it* is literally available: reach the package, find it stale, ask, pull, and read the files that arrived.

## What it would need

**A local record of what was last pulled.** A `git subtree pull --squash` writes a commit whose message names the upstream commit — `Squashed 'waytide/system/ext/ruby-lang/' content from commit 3852ac74`. So the last-pulled SHA is already in the project's history and no new file records it.

**The upstream repository's head.** `git ls-remote <repository> master`. The repository is the installed path flattened to dashes, or the name a package declares on its `**Repository:**` line. `refresh-packages.sh` already resolves this and the check would reuse it rather than restate it.

## What is not settled

**The first prompt is settled — 2026-08-24.** It asks **whether to check for updates at all**, and it carries three candidates:

- **Yes**, for this session.
- **No**, for this session.
- **Never** — don't ask again, for this and all future sessions.

**Three candidates and `Explain` is exactly four**, which is the selection interface's cap. A fourth candidate would not fit, which is one reason *never* and *don't ask again* are one option with two phrasings rather than two options.

**The gate sits ahead of the network rather than ahead of the read.** Declining costs nothing — no `ls-remote`, no split, no wait. That answers the round-trip cost recorded above: it is paid only on *yes*.

**`Never` writes a file under `waytide/local/`** that directs future sessions to skip the check. The a-project-declares-its-package-set rule is the precedent for its shape: a dated record, plain text data attribute lines, and a new record rather than an edit when the decision changes. So *never* is reversible by declaring again, like every other decision recorded that way.

**The hook can read that file even though it cannot ask.** `session-start.sh` already finds the most recent `*-package-set.md` and carries what it says to the agent on `additionalContext`. The same route carries *do not ask*, which puts the one thing a hook is good at — reading a file before the session — in front of the one thing it cannot do.

**The second prompt is settled — 2026-08-24.** Where the check finds stale packages, **all of them are put in one prompt** rather than one prompt each. It carries three candidates:

- **Update all**, and the option **lists the packages** it would update.
- **Decide one at a time**, which opens a sequence of yes-or-no prompts, one per stale package.
- **Update none of them.**

**Three candidates and `Explain` is four again**, and the per-package prompts under *decide one at a time* are yes, no, and `Explain`.

**This is the attended-or-unattended trade, reached by another route.** *Update all* is big-batch and spends no attention. *Decide one at a time* is small-batch and spends it per package. Which is cheaper depends on how much the engineer wants to see, and the decision is theirs — the same shape the attended-or-unattended-is-chosen-at-the-start rule already puts at a feature's start.

**So the eight-prompts-in-one-read shape is gone as a default.** One prompt is the ordinary path, and eight happen only where the engineer asks for them.

**The prompt fires only where there is something to decide.** A check that finds nothing stale produces no second prompt and the read proceeds. A prompt with no pending decision is the furniture the corpus names, and this avoids it by construction.

**The placement is settled — 2026-08-24. The prompt goes after the startup content and before the packages are read.**

**So the read spans more than one response**, which it did not before. The startup content prints at the head of the first, the gate ends it, and the check, any update, the package read, and the deferred-queue print follow in the responses after the engineer answers.

**The initialization rule's wording assumes one response** — *at the head of the response that carries the rule read*. It still holds, since the startup content heads the first of them, but the rule was written when the read was one turn and would want reading against this.

**A prompt on every session is the failure this design already answers.** The corpus says it twice — a line always present is read once and never again, and a selection prompt where no decision is pending doubles the turns and becomes furniture. **`Never` is what keeps this from becoming that**, and it is worth stating that the option is load-bearing rather than a convenience.

**A subtree pull needs a clean working tree — settled 2026-08-24. Where the tree is not clean, say so and do not offer the update.** `refresh-packages.sh` states the requirement, and an engineer at the start of a session frequently has uncommitted work, so this is the ordinary case rather than the exception.

**Which means the second prompt does not fire at all there.** Take *update all* and *decide one at a time* away and nothing is left to decide. A prompt carrying one candidate is a prompt with no pending decision, which is the furniture the corpus refuses. **So the read reports what it found and carries on.** Telling and asking are different acts, and only the first is available when nothing can be done.

**The check still runs.** Knowing which packages are stale is worth having even where the update cannot happen now, since it is what makes committing and refreshing an informed act rather than a guess.

**A refresh writes merge commits**, so accepting writes to the engineer's repository during what they asked to be a read. That is a larger act than the offer's wording suggests, and the offer should say so.

**What happens to a package already read — answered 2026-08-24 by the placement.** The gate sits **before** the packages, so every package is checked and any update applied while nothing has been read. There is no package read at an older version than one updated after it, and the ordering problem this recorded does not arise.

**Whether declining is remembered.** An engineer who says *later* wants to be asked again at some point and not at the next prompt. Nothing in the system records a declined offer today, and the ask-at-once rule's *not asked twice in the same session* is the nearest precedent.

**An unreachable remote — settled 2026-08-24, the same way. Say so, and do not offer the update.** Offline or behind a firewall, the comparison cannot be made, so there is nothing to offer and the read reports and carries on.

**The two failures are known at different moments, and that is the one asymmetry.** The working tree's state is knowable before any network call, so an unclean tree is known before the check starts. A remote's reachability is discovered **during** the check, one package at a time.

**So a partial failure is possible**, and the reading taken here is that a package whose remote could not be reached is reported as unchecked, while a package that was checked and is stale is still offered. That follows from the check being per package. It is a judgment rather than something the engineer stated, and it is marked as one.

**The cost, stated plainly.** Eight network round trips inside a read that already takes a few moments. Whether that is measured before this is built is itself unsettled.

**Whether it runs in this repository at all — settled 2026-08-24. It does.** The engineer's words: *a good, representative exercise of the implementation*.

**What it checks here is inverted, and that is what makes it representative rather than a special case.** This is the authoring source, so its packages are the originals and can never be **behind**. What they can be is **ahead** — unpublished, with the component repository holding an older split. The comparison is the same one either way: take the package, take the remote head, and say which side is in front.

**The routine already exists, run by hand.** A publish splits each package, compares the split against `git ls-remote`, and reports up to date, behind by N and fast-forwarding, or diverged. That was run four times on 2026-08-24. Building the check here mechanizes a thing this repository already does at the moment it matters, which is why it exercises the implementation rather than simulating one.

**Three differences to expect, and each is a decision rather than an obstacle.**

- **The split is the expensive half.** A consuming project reads a squash commit message for its last-pulled SHA. The composite has to run `git subtree split` per package to have anything to compare, which is real work inside a read.
- **What is offered differs.** *Update now* has no meaning here. *Publish now* is the counterpart, and it is governed by the local a-package-is-published-from-master rule — which forbids offering a publish while an experiment or a feature is open, and forbids naming one as a precondition. **So the composite may be able to report and not to ask**, which is the reverse of the consuming project's case.
- **Every package that is ahead is reported — settled 2026-08-24.** The engineer's reason: it happens once, at the loading of Waytide. Every commit to a package leaves it ahead until someone publishes, so *ahead* is the ordinary state here — but a report paid once per session is cheap enough that no threshold is worth inventing. This is the status line's argument in reverse: that line refuses the network because it renders every turn, and this runs once.

- **Reporting every one collides with the local publish rule, and the collision is recorded rather than resolved.** The a-package-is-published-from-master rule forbids offering a publish while an experiment or a feature is open — *not as a next step, not in a state summary, not as an option among others* — and the `foundation` downstream-work-is-never-offered rule says a line reporting what is not done is a prompt whatever its grammar.

  **A line saying `foundation` is ahead of its component repository states a fact about two refs and names no act.** Whether that is inside what those rules forbid is a question for the build. The engineer has settled that every one is reported, and this records what that runs into rather than leaving it to be met later.

**How much of the unconditional read this touches.** Less than the first version of this record claimed. The announce-waytide-at-session-start rule makes the read unconditional because a session once judged it not worth doing and then edited rules nobody had read. **Here the read happens either way** — what the offer decides is which version is read. That is a weaker tension than a read being skipped, and it is recorded as a question rather than an objection.

## What it is not

**It is not the downstream direction.** The `foundation` downstream-work-is-never-offered rule forbids the agent raising work in projects that installed a package. This is a project updating **itself** from upstream, which that rule does not reach and does not forbid.

Related:

- the `foundation` announce-waytide-at-session-start rule — the unconditional read this bears on, and the hook, which is not where the check goes
- its initialization-rule — the first file the read opens, and the wait it announces
- its refresh-packages.sh — the resolution and the pull this would reuse
- its a-project-declares-its-package-set rule — a deactivated package is refreshed like any other
- its downstream-work-is-never-offered rule — the other direction, which is forbidden
- its present-every-prompt-through-askuserquestion rule — how the ask would be put

---

Authored by Scott Bellware on Mon Aug 24 2026 at 2:37:14 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 2:44:02 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 2:52:38 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 3:01:55 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 3:11:24 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 3:22:41 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:28:30 PM PT
