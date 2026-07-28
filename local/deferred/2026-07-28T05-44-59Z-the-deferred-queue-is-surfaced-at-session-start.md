# The deferred queue is surfaced at session start

Nothing brings the deferred queue to attention unprompted. The session-start notice reports
experiments and features that have not concluded; it says nothing about the ten items under
`local/deferred/`, and the working directories are not read at session start. The
`next-deferred-item` command reaches the queue on demand, so what is absent is not access —
it is the reminder that arrives without being asked for.

**The mechanism that works for experiments does not transfer, and that is the design
problem.** An experiment or feature carries a canonical `**State:**` line and **concludes**,
so its line is normally absent and its presence means something. The notice's whole shape
rests on that — a segment appears only when it has something to say, and absence is the clean
signal. A deferred item has no state and does not conclude; it stands until it is resolved and
deleted. So a deferred line would be present every session, and a line that is always there
is read once and never again. Reporting the queue the way experiments are reported would
produce exactly the blindness it is meant to cure.

**Filtering to what is actionable is not currently possible.** The natural answer — report
only the items whose gate has cleared — cannot be computed, because `**Gated on:**` is free
prose: *nothing in flight blocks it*, *the ECIL text existing (Scott to write it)*,
*observing the next session's opening behavior*. A person reads those; a script cannot. Making
them machine-readable would be a change to the **deferred convention itself**, not to the
notice, and that is the larger question this item actually opens.

**What the resolution has to choose among**, none of them obviously right:

- **A count with no names** — *10 deferred items*. Cheap and short, but a number that barely
  moves is close to no information, and it still appears every session.
- **Only what has aged** past some threshold. Surfaces staleness rather than actionability,
  and picks an arbitrary number.
- **Only what is actionable**, which requires the convention to carry a readable gate — the
  real work, and a change to every existing item.
- **Nothing at session start**, on the grounds that the queue is a *queue* and the
  `next-deferred-item` command is the right way in. Then the gap is accepted deliberately
  rather than by omission, which is worth something on its own.

**The case that prompted this may be better served another way.** What went unsurfaced was a
committed but unpublished change under `system/foundation/` — the publish held until the read
instruction is proven. That is not really a design change awaiting a gate; it is work awaiting
**distribution**. A check comparing each package's composite commits against its component
repository's head would catch it directly and mechanically — the mirror of
`report-direct-commits.sh`, which reports divergence in the other direction. That may be the
better answer for that case, and it would leave this item narrower: about the queue as such,
not about anything that happens to be parked in it.

**Gated on:** nothing in flight. Actionable whenever it is taken up, though the readable-gate
question above should be settled first if the answer is anything other than a bare count.

**Why:** the queue is where work goes to not be lost, and it is the one working directory
with no mechanism reporting it — the same gap that let two direct commits sit in component
repositories for days before `report-direct-commits.sh` existed. Ten items now sit there, the
oldest for nine days, none of them surfaced except by someone thinking to look.

**How to apply:** decide first whether the notice should carry the queue at all, given that a
permanently-present line is the failure mode. If it should, settle what makes an item worth
reporting — which likely means giving `**Gated on:**` a machine-readable form in the
agent-deferred-convention — then add the segment to `system/foundation/session-start.sh` and
document it in announce-waytide-at-session-start. Consider whether the unpublished-package
check belongs instead, or as well. Resolve by deleting this file and logging that it was
carried out.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 10:44:59 PM PT
