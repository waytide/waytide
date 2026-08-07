# Remove the Waytide silent option

`WAYTIDE_QUIET` is removed. A developer setting that environment variable to any non-empty
value currently silences the session-start notice, the Waytide segment of the status line, and
what the initialization-rule prints at the head of the rule read.

- **Gated on:** nothing was stated. Actionable now.

## What it reaches, as it stands

- **`session-start.sh`** — checks it twice. Once to withhold the notice, and once to append a
  sentence to the read instruction telling the agent to print nothing at the head of the read.
  That second path exists because the agent prints what the initialization-rule carries and
  cannot read the environment, so the opt-out has to be carried to it.
- **`statusline.sh`** — checks it to drop the Waytide segment.
- **`announce-waytide-at-session-start`** — four mentions, including a paragraph on why the two
  surfaces are silenced by different mechanisms, and the standing claim that quieting a display
  must never disable the mechanism carrying the rules.
- **`initialization-rule`** — three mentions, silencing what it prints along with the block.
- **`install.sh`** and the generated **`AGENTS.md`** bootstrap — each states that a developer
  silences both surfaces by setting the variable in their own environment.

## What removing it settles, and what it costs

**The read is never silenced today**, and that is deliberate: the opt-out governs displays only,
so a personal preference cannot deactivate the mechanism that carries the rules to the agent.
Removing the variable removes the display opt-out and leaves that guarantee intact — nothing about
the read changes.

**What a developer loses is the ability to work without the notice and the status-line segment.**
Whether anyone relies on that is not known here, and the variable lives in a developer's own
environment rather than in committed content, so the repository cannot answer it.

**What is gained is one fewer conditional across two scripts and four documents**, and the
removal of the only mechanism in the system whose whole purpose is to make Waytide invisible while
it is in force. The copyright and license lines added on 2026-08-06 are silenced by it too, which
is a further reason to settle whether it should exist.

**Why:** an opt-out that hides the system's presence sits awkwardly beside rules that exist to keep
that presence legible — the notice, the status line, and the printed copyright are each there
because a system read at the start of every session should announce itself. The variable is the
one sanctioned way to have the system in force and say nothing about it.

**How to apply:** decide first whether the option should go at all, since the question is whether
anyone works with it set. If it goes, remove both checks from `session-start.sh` — including the
sentence appended to the read instruction — and the check in `statusline.sh`; remove the
paragraphs from the announce-waytide-at-session-start and initialization rules, including the
account of why the two surfaces are silenced differently; remove the sentence from `install.sh`'s
generated bootstrap and regenerate the `AGENTS.md` in every consuming project, since a bootstrap
change does not travel with a package refresh. Related: the
announce-waytide-at-session-start rule (the two surfaces and the opt-out's stated boundary), the
initialization-rule (what it silences at the head of the read), and `refresh-packages.sh` (whose
bootstrap comparison is what would report the stale `AGENTS.md`).

---

Authored by Scott Bellware on Thu Aug 6 2026 at 5:35:24 PM PT
