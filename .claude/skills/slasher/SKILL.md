---
name: slasher
description: Print the command domain table, or the help of every Slasher command with /slasher help.
argument-hint: "help"
disable-model-invocation: true
---

The engineer typed `/slasher $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this plugin's root directory, beside this file, exactly as it stands.
2. Where nothing was typed after `/slasher`, print the command domain table. From the project root, run `slasher/system/foundation/load-rules.sh the-command-domain-table-prints-when-the-rules-have-loaded`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Print the table in the rule it prints, word for word, and nothing else. Do not run `/current`.
3. Otherwise, do nothing, and say nothing.
