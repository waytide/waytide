# `waytide/sessions/` — the narrative record of a work session

`waytide/sessions/` holds **session records**: the communicable, chronological narrative of a discrete work session between an engineer and Claude. A session is a unit of the engineer's work — it may run a few hours, a whole day, or span more than a day; its boundaries are the discrete piece of work, not a fixed clock.

- **What a session record is.** The **guided tour** of the session — what was asked and what was concluded at each step, in order, with the settled vocabulary defined as it arises. It is written to be *read by a person*, so its job is orientation and reasoning, not truth-of-record.
- **It is not the source of truth.** The durable records are: the binding rules (`waytide/packages/`, `waytide/rules/`), working observations (`waytide/observations/`), the decision log (`waytide/log/`), experiments (`waytide/experiments/`), and plans (`waytide/plans/`). The session record **points to** them throughout; they are authoritative, and the session record is the narrative that ties them together and preserves the reasoning behind each fork.
- **When it is written.** At the close of a session that produced substantial dialogue, decisions, or discovery worth a durable narrative — on the engineer's request, or when the agent recognizes the session has accumulated such work and proposes recording it. A trivial session needs no record; the session record is not a per-session obligation.
- **Naming.** A session record is a dated working-state artifact, so it takes the ISO-8601-UTC filename prefix (see the agent-file-names rule): `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.
- **Format:** the document shape — its sections — is the `plan` package's session-document-format rule.

**Why:** the durable records capture *what* was decided, but the reasoning and the arc of a session — how the thinking moved, why a fork was taken, what vocabulary settled — are easy to lose and expensive to reconstruct. A narrative session record preserves that arc as a communicable whole, and, because it points to the durable records rather than restating them, it stays a guided tour rather than a second source of truth.

**How to apply:** at a substantial session's close, write a session record here that narrates the session chronologically, defines the settled vocabulary, and points to the durable records it produced. Follow the session-document-format rule for the sections. Related: the agent-plans-convention, agent-design-convention, and agent-experiments-convention (the sibling artifact conventions), the decision-log rule, and the observations rule.

---

Authored by Scott Bellware on Wed Jul 22 2026 at 8 PM PT
