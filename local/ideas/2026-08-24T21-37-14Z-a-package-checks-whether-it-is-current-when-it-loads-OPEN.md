# A package checks whether it is current with its upstream when it loads, and a stale one is put to the engineer

- **State:** Open
- **Tags:** [aspiration]

**Why this state:** the direction is proposed and the mechanism is not settled. What the check
compares, what the engineer is offered, whether the ask is per package or once for all of them, and
what a stale package costs an engineer who declines are each open. It is promoted to `Active` once
those are decided.

**2026-08-24 — the first version of this record placed the check in the session-start hook, and
that was wrong.** The engineer stated that it belongs to **the rule set read that happens at the
engineer's first prompt**. The correction is recorded rather than quietly made, because the two
placements have different costs and the earlier reading made the idea look harder than it is. What
follows is written against the read.

## Premise

**As the engineer stated it:** packages can check if they're up to date with their upstream master
when they load. If a package is out of date, then the user can be asked how they'd like to proceed:
ie: update the package now, and then read it.

**What makes it worth having:** an installed package is a copy, and a copy goes stale silently. A
rule changed upstream is a rule the project is not following, and nothing announces it. The refresh
is a command the engineer has to think to run, which is the same failure the deferred-queue rule
names about an item nobody looks for.

**The window is the point.** A refresh run at any other moment lands after the session's rules are
read, so the new rules take effect next session. Checking during the read puts the update **ahead**
of the file being opened, so the rule that binds this session is the current one. That is the whole
of what this buys over running `refresh-packages.sh` when it occurs to someone.

## Where the check runs

**In the rule set read, at the engineer's first prompt.** The read is the agent's own work: it opens
the initialization rule first, prints what that carries, then opens every rule file in every
installed package. The check sits inside that, per package, as each package is reached.

**Three things follow from the placement, and each was a difficulty under the hook reading.**

- **The agent can ask.** It has a turn and the selection interface. A `SessionStart` hook has
  neither — it runs before the session and emits text. Nothing about the ask needs inventing.
- **The wait is already announced.** The initialization rule prints *Loading Waytide will take a few
  moments* precisely because the read opens every rule file. A `git ls-remote` per package adds to a
  cost that is already named and expected, rather than introducing an unexplained pause.
- **The engineer's sequence works as stated.** *Update the package now, and then read it* is
  literally available: reach the package, find it stale, ask, pull, and read the files that arrived.

## What it would need

**A local record of what was last pulled.** A `git subtree pull --squash` writes a commit whose
message names the upstream commit — `Squashed 'waytide/system/ext/ruby-lang/' content from commit
3852ac74`. So the last-pulled SHA is already in the project's history and no new file records it.

**The upstream repository's head.** `git ls-remote <repository> master`. The repository is the
installed path flattened to dashes, or the name a package declares on its `**Repository:**` line.
`refresh-packages.sh` already resolves this and the check would reuse it rather than restate it.

## What is not settled

**What the engineer is offered, and how many times.** *Update now and read what arrives* is one
answer. *Read what is installed and refresh later* is another. *Do not ask again for this package*
may be a third. **Per package or once for all of them** is a separate decision: eight installed
packages could mean eight prompts inside a single read, which is the shape most likely to make the
whole thing unwelcome.

**A subtree pull needs a clean working tree**, which `refresh-packages.sh` states. An engineer at
the start of a session frequently has uncommitted work, so *update now* would fail for the ordinary
case rather than the exception. Whether the check reports staleness without offering the update in
that state, or offers it and fails, is open.

**A refresh writes merge commits**, so accepting writes to the engineer's repository during what
they asked to be a read. That is a larger act than the offer's wording suggests, and the offer
should say so.

**What happens to a package already read.** The read is ordered, foundation first. A package updated
at position six leaves the five before it read at whatever version they were, which is correct where
they were current and is a silent inconsistency where they were stale and declined.

**Whether declining is remembered.** An engineer who says *later* wants to be asked again at some
point and not at the next prompt. Nothing in the system records a declined offer today, and the
ask-at-once rule's *not asked twice in the same session* is the nearest precedent.

**What an unreachable remote does.** Offline, or behind a firewall, every check fails. Whether the
read says so once, says nothing, or says it per package decides whether a plane journey is workable.

**The cost, stated plainly.** Eight network round trips inside a read that already takes a few
moments. Whether that is measured before this is built is itself unsettled.

**Whether it runs in this repository at all.** This is the authoring source: its packages are the
originals rather than installed subtrees, and there is nothing upstream of them to be behind. The
check is a consuming project's, and the composite would have to recognize that it is not one.

**How much of the unconditional read this touches.** Less than the first version of this record
claimed. The announce-waytide-at-session-start rule makes the read unconditional because a session
once judged it not worth doing and then edited rules nobody had read. **Here the read happens
either way** — what the offer decides is which version is read. That is a weaker tension than a
read being skipped, and it is recorded as a question rather than an objection.

## What it is not

**It is not the downstream direction.** The `foundation` downstream-work-is-never-offered rule
forbids the agent raising work in projects that installed a package. This is a project updating
**itself** from upstream, which that rule does not reach and does not forbid.

Related:

- the `foundation` announce-waytide-at-session-start rule — the unconditional read this bears on,
  and the hook, which is not where the check goes
- its initialization-rule — the first file the read opens, and the wait it announces
- its refresh-packages.sh — the resolution and the pull this would reuse
- its a-project-declares-its-package-set rule — a deactivated package is refreshed like any other
- its downstream-work-is-never-offered rule — the other direction, which is forbidden
- its present-every-prompt-through-askuserquestion rule — how the ask would be put

---

Authored by Scott Bellware on Mon Aug 24 2026 at 2:37:14 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 2:44:02 PM PT
