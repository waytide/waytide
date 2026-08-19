# Deferred items preempt design and plans, and a deferred item is deleted on resolution

- **State:** Open
- **Tags:** [observation]

**Why this state:** a working hypothesis under discovery. It records a pattern in how this repository actually accumulates work, and a consequence of the deferred convention that follows from it. It proposes no change. It is promoted once it is decided whether design and plan are meant to carry this work, whether the deferred convention should preserve what a resolved item held, or whether the pattern is correct as it stands and only the conventions overstate design's role.

**The observation, as stated by the developer:** the design of a system is often not kept up to
date as the work goes on, and both design and plan tend to be preempted by the entries into
deferred items.

**The repository bears it out.** Counts at the time of writing:

| Directory | Files |
|---|---|
| `local/design/` | 1 |
| `local/plans/` | 1 |
| `local/loops/` | 1 |
| `local/observations/` | 5 |
| `local/work-sessions/` | 6 |
| `local/deferred/` | 9 |
| `local/log/` | 202 |

The single design and the single plan are both dated 2026-07-27 and are both for the same
piece of work — the feature capability. Design and plan have been used **once, together, and
not since**, while the deferred queue has been the working surface throughout.

**The mechanism appears to be cost, and the formats reinforce it.** A deferred item is written
at the moment of discovery, mid-task, which is exactly when the material is at hand. A design
requires settling direction first; a plan requires a settled design. So the cheap path is
always available at the moment the expensive one would be started. The deferred format then
does the rest: an item carries a `**Gated on:**` line, a `**Why:**`, and a `**How to apply:**`,
which is most of what a small design would say. The item does not *defer to* a design — it
**absorbs** it.

**The consequence is sharper than staleness: a resolved deferred item is deleted.** The
convention is explicit that the queue is "a queue, not a permanent record" and that the file is
deleted once carried out, leaving a one-line log entry. So where the item was carrying design
reasoning, that reasoning is destroyed at exactly the moment the work it described is done. The
log entry cannot hold it — it is one line by its own convention — and the resulting rule states
the conclusion, not the reasoning that reached it.

**Both outcomes occurred in a single session (2026-07-30 into 2026-07-31), which is what
prompted this.**

- The **preconditions** item was carried out and deleted. What survives is the rule and three
  log lines. The item's own framing of the problem is recoverable only from git history.
- The **test-output-display investigation** item was also carried out and deleted, but its
  content survives — because its findings were promoted into `local/observations/` first. That
  happened only because the item itself instructed it: *"recorded as observations under
  `waytide/local/observations/` if they are not yet settled."* Nothing in the deferred
  convention requires it.

So the system already has the path that preserves a resolved item's substance. It is used when
an individual item happens to say so, not by convention.

**What this does not establish.** That design and plan *should* be carrying this work. It is
equally possible that most of what goes through the queue is too small to warrant a design, and
that the defect is the conventions implying otherwise rather than the practice diverging from
them. The one design and plan on file were written for a feature large enough to need them,
which is at least consistent with the conventions being right and rarely applicable. Nor does
it establish that deletion is wrong — the convention's reason is sound, that what remains in the
queue should be exactly the outstanding work and not a history.

**The question it leaves.** Where does the reasoning in a resolved deferred item belong, given
that the item is deleted, the log entry is one line, and the resulting rule states only the
conclusion? Promotion to an observation is one answer and is already practiced ad hoc. The
session record is another, and is where this session's reasoning in fact survives.

**Reconciled 2026-08-05.** This project moved to **intuitive mode**, so the directories named
above are now `local/aspiration/` and `local/intention/`. The observation is left as written
otherwise — it is a discovery record, and what it observed was true of the directories under
the names they had.

## Amended 2026-08-18 — a deferred item is no longer deleted on resolution

**The title's second clause is no longer true, and it stands as written.** A deferred item was
deleted when it was resolved, leaving a decision log entry as the durable trace. That was dropped
on 2026-08-18: the item is an idea tagged `[deferred]`, the tag comes off when the work is done,
and the record is kept with its state changed to `Realized`, `Abandoned`, or `Lapsed`.

**What the change was for.** Deletion required searching every artifact that cited an item before
removing it, because removal left the citations pointing at nothing. A kept record still resolves,
and its state line says what became of it, so the search is retired rather than moved.

**The first clause is untouched.** Whether deferred items preempt the settled direction is the
observation's actual subject, and nothing on 2026-08-18 bears on it. See the
deferred-queue-convention.

---

Authored by Scott Bellware on Fri Jul 31 2026 at 11:18:29 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:32:03 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:21:39 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:25:14 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 5:31:14 PM PT
