# Subagents Under Waytide — Aspiration

## Premise

Claude Code can dispatch **subagents** — separate agents with their own context window, each
returning a result to the main agent rather than to the engineer. This design settles the
direction for using them under Waytide: **establish whether a subagent is governed by the rules
before delegating any authoring work to one**, and treat the gated steps as undelegatable
regardless of the answer.

**This design is unusually open, and deliberately so.** What it settles is a **constraint** and
an **order of work** — what cannot be delegated, and what must be answered before anything is.
The question of where subagents actually help is genuinely unexamined, and this design does not
pretend otherwise.

## Background & Motivation

**The two things that make subagents attractive here are the work that has produced the most
rework**: bounded read-only searches, and per-package repetition across eight component
repositories. Both are mechanical, both are done by hand today, and both have failed by being
forgotten rather than by being done wrong.

**The governance question cuts the other way, and is why examination precedes adoption.** An
agent that has not loaded the rules can produce work that **looks conformant and is not** — a
commit message in the wrong voice, a rule file without a provenance footer, a record in the
wrong format. That failure is silent, which is the class of failure this system repeatedly
finds itself correcting.

## The governance question

**Waytide loads through two mechanisms, and neither is obviously inherited by a subagent.**

- `CLAUDE.md` imports `AGENTS.md`, which instructs the agent to read every rule file under
  `system/` at the start of a session.
- `.claude/settings.json` registers a `SessionStart` hook running
  `system/foundation/session-start.sh`, which carries the read instruction on
  `additionalContext`.

A subagent begins with its own context and system prompt. If it receives neither, a subagent
given authoring work is working **outside the rules that govern it**.

**This is to be established by observation, not assumed in either direction.** It is a fact
about the harness, it is cheap to test, and both possible answers change what may be delegated.

## The boundary: gated steps cannot be delegated

**A subagent has no channel to the engineer.** Its result returns to the main agent. So any
step that requires the engineer decides nothing can be delegated to one:

- Every **hinge** in the DBE cycle, which the present-every-prompt rule requires be put through
  the selection interface.
- The **working-location** and **attended-or-unattended** choices at a feature's or experiment's
  initiation.
- **Branch deletion**, and every other confirmation the lifecycle rules require.

This holds whatever the governance question's answer turns out to be, which is why it is settled
here rather than left to the examination. It also bounds the whole subject: subagents are for
the **mechanical** complement, never for a hinge.

## Where they plausibly help, to be tested rather than assumed

- **Searching for stranded references.** Bounded, read-only, returns a list. The problem has
  recurred twice, and both instances were found by grepping after the fact.
- **Pre-publish checks across the component repositories.** `report-direct-commits.sh` automates
  the direct-commit check; the surrounding runbook is still read and applied by hand, once per
  package, eight times.
- **Reading the rules.** The session-start instruction is to read every file under `system/` —
  **95 files** as of 2026-08-03. Whether that is a fan-out or something a subagent would only
  ever summarize, losing exactly the binding text, is part of the question and is not obvious.

## Settled

- **2026-07-28** — Whether a subagent is governed by the rules is **established by observation
  before any authoring work is delegated**, not assumed in either direction.
- **2026-07-28** — **No gated step is delegated to a subagent**, whatever the governance answer.
  A subagent has no channel to the engineer, so every hinge, initiation choice, and confirmation
  stays with the main agent.
- **2026-07-28** — Whether Waytide should **ship** agent definitions — a package carrying its
  own subagent for its own checks — is downstream of the examination and not proposed.
- **2026-08-03** — There is **no `.claude/agents/` directory** in this repository, so any use
  today is ad hoc.

## Out of Scope / Deferred

- **The examination itself** — this design settles the order and the constraint, not the
  findings. Establish the governance question first, then try one bounded read-only task and
  judge the result against what the main agent would have produced.
- **Where the boundary actually falls** between mechanical work a subagent does well and work
  that only looks mechanical.
- **Whether reading 95 rule files is a fan-out**, given that a summary loses the binding text.
- **Whether Waytide ships agent definitions**, and in which package.
- **The plan that sequences this.** Not written; this design settles direction only.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 6:02:22 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:32:03 AM PT
