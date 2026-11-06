---
name: sup?
description: Say what was recently done, and what is next. An alias of /work-status.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/sup? $ARGUMENTS`. `/sup?` is an alias of `/work-status`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `work-status` skill's directory, and do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `waytide/system/foundation/load-rules.sh work-status-says-what-was-recently-done-and-what-is-next`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
