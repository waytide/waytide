# Claude Code has its own built-in /help, which wins when /help is typed. A Slasher /help would only run as /slasher:help. What should the new top row of the table be? — `/slasher help` row, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Claude Code has its own built-in /help, which wins when /help is typed. A Slasher /help would only run as /slasher:help. What should the new top row of the table be?

The options:

- **`/slasher help` row** — The row names `/slasher help`, which already prints every Slasher command's help. No new command.
- **`/help` row and a skill** — Add a /help skill that prints the Slasher help, and a `/help` row. Typed bare, Claude Code's own help runs instead. Only /slasher:help reaches it.
- **`/help` row, no skill** — The row says `/help`, pointing at Claude Code's own help. No Slasher command is added.

The engineer's answer: **`/slasher help` row**
