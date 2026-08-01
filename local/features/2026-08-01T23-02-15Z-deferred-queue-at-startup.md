# Feature — The deferred queue is printed at startup

## Intent

The deferred queue is printed at startup, **immediately after the Waytide rules and the
project's own local rules are read**. Nothing currently brings the queue to attention
unprompted: the session-start notice reports experiments and features that have not
concluded, the working directories are not read at session start, and the
`next-deferred-item` command reaches the queue only on demand. What is missing is not
access — it is the reminder that arrives without being asked for.

This realizes the deferred item *The deferred queue is surfaced at session start*
(2026-07-28), and departs from how that item framed the problem. See **The surface** below.

## Setup

- **State:** In flight
- **Upstream branch:** `master`
- **Feature branch:** `feature/deferred-queue-at-startup`
- **Base:** `8d3c06e31352fc0232faf9062da2817121be342a`
- **Working location:** branch only — this working tree is switched to the feature branch
  and switches back to `master` at the conclusion. Chosen at initiation on
  2026-08-01 through the selection interface; no worktree.

## The surface

**The queue is printed by the agent after the rule read, not by the session-start hook.**
That is what the intent specifies, and it is a different surface from the one the deferred
item assumed. The distinction decides most of the design:

- **The hook runs before the session.** It cannot read anything the session then does, and
  its notice is a `systemMessage` rendered once. A queue line there would be present every
  session regardless of context — the failure the deferred item identified, where a line
  that is always there is read once and never again.
- **The agent's print happens after the read**, inside the response that concludes the rule
  read. It is bounded to that moment, it is not a standing notice segment, and the agent has
  the queue's contents in hand rather than a script parsing them.

**This dissolves the deferred item's blocking objection.** That item held that filtering to
actionable work required `**Gated on:**` to be machine-readable, and that free prose made
this the larger question to settle first. An agent reads free prose. No change to the
deferred convention's format is required.

## Confirmations

- **2026-08-01 — working location.** Branch only, chosen through the selection interface at
  initiation.

## Open questions

Settled through the hinges as the feature is built:

- **What is printed** — every item, or a filtered set. Note that 7 of the 8 current items
  state a gate of *nothing in flight*, so filtering to actionable work would report nearly
  all of them and reproduce the always-present problem in a different place.
- **How much of each item** — title alone, or title with its gate.
- **Whether the count is stated**, and whether an empty queue prints anything.
- **Where the instruction lives** — the `agent-deferred-convention`, the
  `announce-waytide-at-session-start` rule, or a rule of its own. The hook's read
  instruction and the notice are governed by the announce rule, but this is not the hook.

## Related records

- The deferred item this realizes: *The deferred queue is surfaced at session start*, which
  is carried out and deleted when this feature completes.
- The loop record for this feature's design, under `waytide/local/loops/`.

---

Authored by Scott Bellware on Sat Aug 1 2026 at 4:02:15 PM PT
