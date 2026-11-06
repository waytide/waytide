---
name: current-items
description: List the current items, Open and Active. An alias of /item list current.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/current-items $ARGUMENTS`. `/current-items` is an alias of `/item list current`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Otherwise, list the current items, those Open and Active. Load the rule that governs a printed list. From the project root, run `waytide/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
