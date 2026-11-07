---
name: "?"
description: Answer "What are we doing?"
disable-model-invocation: true
---

The engineer typed `/? $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, answer the prompt "What are we doing?", as if the engineer had typed it.
