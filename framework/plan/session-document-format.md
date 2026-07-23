# How a session record reads

A session record (`waytide/sessions/*.md`) is the narrative, chronological account of a work session between an engineer and Claude. It is titled `# Session — <name> (<date>)` and reads as a **guided tour**, not a source of truth — it points to the durable records, which are authoritative.

The shape:

- **Opening summary** — a short paragraph naming what the session *was*: its arc (began as X, became Y, ended with Z).
- **Framing note** — that this is the communicable record / guided tour, and that the durable records (rules, observations, log, experiments, plans) are the source of truth the narrative points to.
- **Chronological body** — numbered sections (`## 1.`, `## 2.`, …) walking the session in order: what was asked and what was concluded at each step, with settled vocabulary defined as it arises. Give inline pointers to the durable records a step produced (an observation, a rule, a log entry, an experiment).
- **Takeaways** — the settled conclusions, compressed to a few bullets.
- **Glossary** — the terms settled during the session, each with its literal definition.
- **Where the durable records live** — pointers to the rules, observations, log entries, experiments, and code the session produced.
- Optionally, a **reflective closing note** on the session itself.

**Why:** a session's value is its arc and its reasoning, which a chronological narrative preserves where a scatter of dated records cannot. Keeping the record a *tour that points* to the durable records — rather than a restatement — keeps one source of truth and lets the narrative do what it is for: orient a reader through what happened and why.

**How to apply:** when writing a session record, open with the arc and the framing note, walk the session chronologically with inline pointers to the durable records, then close with takeaways, a glossary of settled terms, and a map of where the durable records live. Related: the foundation agent-sessions-convention (what the directory holds), and the plan-document-format and design-document-format rules (the sibling document-format rules).

---

Authored by Scott Bellware on Wed Jul 22 2026 at 8 PM PT
