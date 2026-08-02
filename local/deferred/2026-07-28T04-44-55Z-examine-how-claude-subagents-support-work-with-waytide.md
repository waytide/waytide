# Examine how Claude subagents can support work with Waytide

Claude Code can dispatch **subagents** — separate agents with their own context window,
each returning a result to the main agent rather than to the engineer. Whether and where
they help work under Waytide has not been examined. Nothing here is settled; the item is
the examination.

**The first question is whether a subagent is governed by the rules at all.** Waytide
loads through two mechanisms in this repository, and neither is obviously inherited:
`CLAUDE.md` imports `AGENTS.md`, which instructs the agent to read every rule file under
`system/` at the start of a session; and `.claude/settings.json` registers a `SessionStart`
hook running `system/foundation/session-start.sh`. A subagent begins with its own context
and system prompt. If it receives neither the bootstrap nor the hook, then a subagent given
authoring work is working *outside* the rules that govern it — writing commit messages,
rule files, or records to no standard. That is the finding the examination most needs, and
it should be established by observation rather than assumed in either direction.

**Where subagents plausibly help**, each to be tested rather than taken on faith:

- **Searching for stranded references.** The stranded-reference problem has now recurred
  twice — against a deleted deferred item, and against the removed
  `migrate-to-system-and-local.sh`. Both were found by grepping after the fact. Such a
  search is bounded, read-only, and returns a list.
- **Pre-publish checks across the seven component repositories.** `report-direct-commits.sh`
  already automates the direct-commit check; the surrounding runbook is still read and
  applied by hand, once per package.
- **Reading the rules.** The session-start instruction is to read every file under
  `system/` — currently seventy-odd files. Whether that is a fan-out or something a
  subagent would only ever summarize, losing exactly the binding text, is part of the
  question.

**Where they cannot help, and this bounds the item.** The design-by-efferent package
requires the engineer to be prompted through the **AskUserQuestion** selection UI at every
hinge, and the lifecycle rules require confirmation at initiation and before branch
deletion. A subagent has no channel to the engineer — its result returns to the main agent.
So no gated step can be delegated, and the examination should establish where the boundary
falls rather than treating subagents as generally applicable.

There is no `.claude/agents/` directory in this repository, so any use today would be ad
hoc. Whether Waytide should *ship* agent definitions — a package carrying its own subagent
for its own checks — is downstream of the examination and not proposed here.

**Priority:** 6

**Gated on:** nothing in flight. Actionable whenever it is taken up.

**Why:** subagents are available and unexamined, and the two things that make them
attractive here — bounded read-only searches and per-package repetition — are exactly the
work that has produced the most rework. The governance question cuts the other way and is
the reason to examine before adopting: an agent that does not load the rules can produce
work that looks conformant and is not.

**How to apply:** establish first whether a subagent loads the Waytide bootstrap and the
`SessionStart` hook. Then try one bounded, read-only task — a search for stranded
references is the
cheapest — and judge the result against what the main agent would have produced. Record
what is settled in `local/observations/` or the decision log, and resolve by deleting this
file and logging that it was carried out.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 9:44:55 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 10:15:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:35:18 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
