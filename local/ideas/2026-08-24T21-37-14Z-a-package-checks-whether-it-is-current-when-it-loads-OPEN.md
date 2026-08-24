# A package checks whether it is current with its upstream when it loads, and a stale one is put to the engineer

- **State:** Open
- **Tags:** [aspiration]

**Why this state:** the direction is proposed and the mechanism is not settled. Where the check
runs, what it compares, what a network reach at session start costs, and what the engineer is
offered are each open. It is promoted to `Active` once those are decided.

## Premise

**As the engineer stated it:** packages can check if they're up to date with their upstream master
when they load. If a package is out of date, then the user can be asked how they'd like to proceed:
ie: update the package now, and then read it.

**What makes it worth having:** an installed package is a copy, and a copy goes stale silently. A
rule changed upstream is a rule the project is not following, and nothing announces it. The refresh
is a command the engineer has to think to run, which is the same failure the deferred queue's own
rule names about an item nobody looks for.

**The window is the point.** A refresh is ordinarily read *after* the session's rules are read, so
the new rules take effect next session. Checking at load puts the update **ahead** of the read, so
the rules that bind this session are the current ones. That is the whole of what this buys over
running `refresh-packages.sh` whenever it occurs to someone.

## What it would need

**A local record of what was last pulled.** A `git subtree pull --squash` writes a commit whose
message names the upstream commit — `Squashed 'waytide/system/ext/ruby-lang/' content from commit
3852ac74`. So the last-pulled SHA is already in the project's history and needs no new file.

**The upstream repository's head.** `git ls-remote <repository> master`. The repository is the
installed path flattened, or the name a package declares on its `**Repository:**` line.
`refresh-packages.sh` already resolves this, and the check would borrow that rather than restate it.

**Somewhere to ask from.** See below — this is the part with no obvious answer.

## What is not settled

**The hook cannot ask, and it is where a check would naturally sit.** `session-start.sh` runs
**before** the session and emits a notice and a read instruction. It has no selection interface and
no turn to take. So either the check runs in the hook and only **reports** staleness, leaving the
ask to the agent's first turn, or the check runs in the agent's first turn and pays its cost there.

**A network reach at session start is a new cost on every session.** The status line rule refuses
the network outright — *the line renders every turn, so fetching is out of the question*. A hook
runs once per session rather than every turn, so the argument does not transfer whole, but the cost
is real: one `ls-remote` per installed package, eight today, against a remote that may be
unreachable. What a session does offline, and whether the check degrades silently or says it could
not run, are unanswered.

**Updating before the read runs against the unconditional read.** The
announce-waytide-at-session-start rule makes the read unconditional deliberately, and names the
failure that made it so: a session opened with a small request, the read was judged not worth it,
and the session grew into rule edits governed by rules nobody read. **An offer placed ahead of the
read is a decision placed ahead of the read.** Whether *update now* can be offered without
reopening that failure is the load-bearing question here.

**A subtree pull needs a clean working tree**, which `refresh-packages.sh` states. At session start
an engineer frequently has uncommitted work, so *update now* would fail for the ordinary case rather
than the exception.

**A refresh writes merge commits.** So accepting the offer commits to the engineer's repository
before they have said anything about what the session is for. That is a larger act than the offer's
wording suggests.

**What the engineer is offered is more than two things.** *Update now and read the new rules* is one.
*Read what is installed and refresh later* is another. *Never ask again for this package* may be a
third, and whether the check is per-package or once for all of them is not settled either.

**Whether a deactivated package is checked.** The a-project-declares-its-package-set rule says a
deactivated package is read and refreshed like any other, so the check would cover it. A prompt about
a package the project has switched off may be noise.

## What it is not

**It is not the downstream direction.** The `foundation` downstream-work-is-never-offered rule
forbids the agent raising work in projects that installed a package. This is a project updating
**itself** from upstream, which that rule does not reach and does not forbid.

Related:

- the `foundation` announce-waytide-at-session-start rule — the unconditional read, and the hook's
  two channels
- its refresh-packages.sh — the resolution and the pull this would reuse
- its a-project-declares-its-package-set rule — a deactivated package is refreshed like any other
- its downstream-work-is-never-offered rule — the other direction, which is forbidden
- its present-every-prompt-through-askuserquestion rule — how the ask would be put

---

Authored by Scott Bellware on Mon Aug 24 2026 at 2:37:14 PM PT
