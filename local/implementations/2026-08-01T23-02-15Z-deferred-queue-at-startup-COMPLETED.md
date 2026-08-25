# Feature — The deferred queue is printed at startup

**Tags:** [feature]

## Intent

The deferred queue is printed at startup, **immediately after the Waytide rules and the project's own local rules are read**. Nothing currently brings the queue to attention unprompted: the session-start notice reports experiments and features that have not concluded, the working directories are not read at session start, and the `next-deferred-item` command reaches the queue only on demand. What is missing is not access — it is the reminder that arrives without being asked for.

This realizes the deferred item *The deferred queue is surfaced at session start* (2026-07-28), and departs from how that item framed the problem. See **The surface** below.

## Setup

- **State:** Completed
- **Tags:** [feature]
- **Upstream branch:** `master`
- **Feature branch:** `feature/deferred-queue-at-startup`
- **Base:** `8d3c06e31352fc0232faf9062da2817121be342a`
- **Working location:** branch only — this working tree is switched to the feature branch and switches back to `master` at the conclusion. Chosen at initiation on 2026-08-01 through the selection interface; no worktree.

## The surface

**The queue is printed by the agent after the rule read, not by the session-start hook.** That is what the intent specifies, and it is a different surface from the one the deferred item assumed. The distinction decides most of the design:

- **The hook runs before the session.** It cannot read anything the session then does, and its notice is a `systemMessage` rendered once. A queue line there would be present every session regardless of context — the failure the deferred item identified, where a line that is always there is read once and never again.
- **The agent's print happens after the read**, inside the response that concludes the rule read. It is bounded to that moment, it is not a standing notice segment, and the agent has the queue's contents in hand rather than a script parsing them.

**This dissolves the deferred item's blocking objection.** That item held that filtering to actionable work required `**Gated on:**` to be machine-readable, and that free prose made this the larger question to settle first. An agent reads free prose. No change to the deferred convention's format is required.

## Confirmations

- **2026-08-01 — working location.** Branch only, chosen through the selection interface at initiation.
- **2026-08-01 — branch deletion.** Confirmed through the selection interface after the feature was integrated. The local branch was deleted; it was never pushed, so there was no remote branch to delete.

## What was settled

Each question was put to the developer and answered; the loop record carries the passes.

- **What is printed** — every item. Filtering to actionable work was rejected on the data: 7 of the 8 items then in the queue stated a gate of *nothing in flight*, so the filter would have reported nearly all of them.
- **How much of each item** — the summary, alongside the title and the date.
- **The count is stated**, and an empty queue prints a line saying so rather than nothing, since silence is indistinguishable from the print having been skipped.
- **Where the instruction lives** — a new `foundation` rule of its own, `print-the-deferred-queue-after-the-rule-read`.
- **The rendering** — a list of rows, not a rendered table. Settled after the first output was shown: a table sizes its columns to the widest summary, narrowing the title and date and wrapping every row in a terminal.

## Verification

This repository has no automated suite, so the `run-suite-before-commit` gate has nothing to run. The feature is prose — one new rule and cross-references in three files — and was verified by rendering the print against the live queue before integrating.

## Conclusion

**Completed 2026-08-01.** Integrated into `master`. The deferred item it realizes — *The deferred queue is surfaced at session start* — was carried out and deleted as part of the completion, and its deletion is logged.

## Related records

- The loop record for this feature's design: `waytide/local/loops/2026-08-01T23-10-02Z-deferred-queue-at-startup.md`.
- The deferred item this realized: *The deferred queue is surfaced at session start* (deleted) — carried out 2026-08-01 as the `print-the-deferred-queue-after-the-rule-read` rule. Its central objection, that filtering required a machine-readable `**Gated on:**` line, does not arise on this surface: the agent reads the prose.

---

Authored by Scott Bellware on Sat Aug 1 2026 at 4:02:15 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:14:38 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:22:05 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:09:20 AM PT
