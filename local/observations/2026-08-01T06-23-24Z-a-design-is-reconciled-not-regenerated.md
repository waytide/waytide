# A design is reconciled against the records, not regenerated from them

**Status:** a working hypothesis under discovery, following from
[[2026-08-01T06-18-29Z-deferred-items-preempt-design-and-plans]]. It answers whether a design
can be kept current the way a session record is assembled, and proposes reconciliation instead.
It is promoted once it is decided whether reconciliation is adopted, and — the open question
below — whether the moment to reconcile can be detected rather than remembered.

**The question:** can `local/design/` be periodically updated from the other record types, the
way a work-session record is reconstituted from the pertinent input records?

**Partly — and the two artifacts differ in the way that decides it.**

**A session record can be a projection because it is explicitly not a source of truth.** Its
convention says so outright and has it point at the durable records. **A design is a source of
truth.** A plan *realizes* a design and names it as its **Source design**, and the design is
"the stable reference the plan points back to." Regenerating a design from records of the work
downstream of it inverts that relationship: the reference would be derived from the thing it
governs.

**Two parts of a design cannot be projected at all.**

- **Out of Scope / Deferred** records what the design *deliberately leaves out*. Nothing in the
  log, the rules, or the observations holds a decision **not** to do something — the records
  are of what was done.
- **Direction settled but not yet built.** A design's distinctive value is stating the shape
  *before* the work. Records of completed work can only ever describe the shape afterward, so a
  projection is structurally incapable of carrying the part that is furthest ahead of the code.

**What is projectable is a different artifact: an as-built description of what the system
currently is,** derived from the rules, which *are* the current state. That artifact already
exists here — the package `README.md` files — and it is hand-maintained and does drift. Three
of them were updated by hand in the session that produced this observation, for exactly that
reason. So the projectable thing is already a thing, and its problem is the same one.

**The proposal: reconciliation rather than regeneration.** Periodically read the design against
the log, the rules, and the observations, and **report where they diverge** — leaving the
developer to say which side is stale, because either may be. A design can be out of date, and a
design can be right about a direction the implementation has drifted from. Only a reader can
tell those apart, and collapsing them is what regeneration would do: it would silently treat the
implementation as correct in every case.

This keeps the design authoritative while making staleness **visible**, which is the actual
complaint in the sibling observation — not that the design is wrong, but that nothing announces
when it has fallen behind.

**Precedent for a read-time projection exists either way.** The decision-log convention already
prefers a generated summary over consolidating the log, on the ground that a summary "reads the
record without destroying it." Reconciliation is the same move applied to a design: read the
records against it, change neither.

**The open question — can the moment be detected?** Reconciliation that has to be *remembered*
will go the way the design did. Whether the divergence can be detected mechanically, so the
developer is prompted rather than relied upon, is the next thing to settle. Some signals are
mechanical and definite (a design naming a rule or path that no longer resolves), some are
mechanical but only proxies for risk (**102 log entries postdate the one design on file**), and
the divergence that actually matters — the design says one shape and the rules now say another
— is a reading, not a computation. Attributing changes to the right design also stops being
mechanical as soon as a project has more than one.

---

Authored by Scott Bellware on Fri Jul 31 2026 at 11:23:24 PM PT
