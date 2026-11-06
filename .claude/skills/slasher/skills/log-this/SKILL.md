---
name: log-this
description: Write a log entry for the work the conversation is on.
disable-model-invocation: true
---

The engineer typed `/log-this $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/log help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the log. From the project root, run `waytide/system/foundation/load-rules.sh the-log-holds-one-file-per-entry-with-a-one-line-title`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, for `/log-this`.
