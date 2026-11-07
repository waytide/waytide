---
name: sup?
description: Say what was recently done, and what is next. An alias of /work-status.
disable-model-invocation: true
---

The engineer typed `/sup? $ARGUMENTS`. `/sup?` is an alias of `/work-status`, and does exactly what it does.

1. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh work-status-says-what-was-recently-done-and-what-is-next`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
