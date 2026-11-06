---
name: phases
description: List the phases of the current implementation, the current one marked.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/phases $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, list the phases of the implementation the conversation is on, in order, with the current one marked. From the project root, run `waytide/system/foundation/load-rules.sh a-phase-starts-by-stating-its-goal`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Where it is not clear which implementation is meant, or more than one is open, ask which, through the selection interface.
