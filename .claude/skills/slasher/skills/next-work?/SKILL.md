---
name: next-work?
description: Name the next step of the work under way, without taking it.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/next-work? $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `waytide/system/foundation/load-rules.sh next-takes-the-next-step-of-the-work-under-way`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, for `/next-work?`.
