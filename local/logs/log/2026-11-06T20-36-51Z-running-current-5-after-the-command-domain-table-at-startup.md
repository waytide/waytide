# Running /current 5 after the command domain table at startup is a standing change. Where should it be recorded? — Amend the foundation rule, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Running /current 5 after the command domain table at startup is a standing change. Where should it be recorded?

The options:

- **Amend the foundation rule** — Amend the-command-domain-table-prints-when-the-rules-have-loaded rule in foundation, so every project that installs foundation runs /current 5 after the table.
- **New local rule** — Add a rule in local/rules/ with a log entry, so only this project runs /current 5 after the table.
- **Observation** — Record it as an observation in local/items/, since the thinking may not have stabilized.
- **Don't record it** — Record nothing. It holds only as an instruction for now.

The engineer's answer: **Amend the foundation rule**
