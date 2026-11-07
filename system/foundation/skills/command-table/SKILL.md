---
name: command-table
description: Print the command domain table, as a bare /slasher does.
disable-model-invocation: true
---

The engineer typed `/command-table $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/slasher help` prints the help of every Slasher command. Do nothing more.
2. Otherwise, print the command domain table. From the project root, run `slasher/system/foundation/load-rules.sh the-command-domain-table-prints-when-the-rules-have-loaded`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Print the table in the rule it prints, word for word, and nothing else. Do not run `/current`.
