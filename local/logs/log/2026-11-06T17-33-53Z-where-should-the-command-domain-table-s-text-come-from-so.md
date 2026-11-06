# Where should the command domain table's text come from, so the agent can print it after the rules load? — Written in a rule, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the command domain table's text come from, so the agent can print it after the rules load?

The options:

- **Loader prints it** — load-rules.sh ends its output with the table, built from the skills' help.md descriptions. A rule tells the agent to print it at the end of the response that carries the read. The table cannot drift from the help text.
- **Written in a rule** — A foundation rule holds the table word for word and tells the agent to print it. It is simpler, but it is a second copy of the descriptions, which can drift.

The engineer's answer: **Written in a rule**
