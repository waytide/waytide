# The heading over the items printed after the rules load should read "5 most recent items". Where should that be recorded? — Amend the /current rule, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The heading over the items printed after the rules load should read "5 most recent items". Where should that be recorded?

The options:

- **Amend the /current rule** — In the printed-list rule's current-command section: `/current n` heads its items "<n> most recent items". This covers the post-load print, which runs `/current 5`, and every `/current n`.
- **Amend the table rule** — In the command-domain-table rule only: the items printed after the rules load are headed "5 most recent items". `/current n` typed later keeps its own heading.
- **Record as observation** — An observation item in local/items/, for thinking that has not settled.
- **Don't record** — Use the heading now and record nothing.

The engineer's answer: **Amend the /current rule**
