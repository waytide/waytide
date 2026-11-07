---
name: report
description: List the current items, then the current implementations, or say what was recently done and what's next with /report brief.
argument-hint: "[brief | <n>]"
disable-model-invocation: true
---

The engineer typed `/report $ARGUMENTS`.

1. Read the first word typed as the subcommand.
2. Where the first word is `help`, say that this command takes no `help`, and that `/process help` prints the help of its command domain. Do nothing more.
3. **`brief`**: say what was recently done, and what's next. Load the rule that governs the act. From the project root, run `slasher/system/foundation/load-rules.sh the-brief-report-says-what-was-recently-done-and-what-is-next`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
4. **Nothing typed, or a number**: list the current items, then the current implementations. Where the first word is a number, list only that many of the most recent current items. Load the rule that governs a printed list. From the project root, run `slasher/system/foundation/load-rules.sh a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows`. Where the project has no `slasher/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
5. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface: the list of current items, or `brief`.
