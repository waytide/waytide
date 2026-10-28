# An item that sequences work contains no code samples

- **Solubility:** 88
- **Original rank:** 103 of 106
- **Unclarity:** 0.18

A planning record in `waytide/local/items/` must never contain code samples, whatever its tags name it. No code blocks, no literal method bodies, no "write this content" snippets. A plan describes the intended work and outcomes in prose. Code is produced later, interactively, when the user directs it.

Plans should also avoid over-prescription. Do not commit up front to specific method names, file names, or other implementation details. Those are not actually known or decided yet. Those emerge during the work. State the goal and the behavior at the altitude that's genuinely settled. Leave the rest open rather than inventing names to fill the plan.

**Why:** The user wants to direct code generation at their command rather than have plans pre-bake implementation. Code samples and premature naming lock in decisions early and remove the interactive, incremental control the user wants over how the work is shaped.

**How to apply:** When writing or revising a plan, describe each step's intent and expected outcome in prose only. Write no code, and invent no method or file names where those are not yet decided. When it's time to implement, generate code only on the user's explicit instruction, in the increments they choose.

## Compression

- Solubility 91, clarity 0.86 (2026-10-28)
- Compression 0.22, change 0.59 (2026-10-24)
- 8 directives, 8 kept, 0 less precise, 0 lost (2026-10-28)
