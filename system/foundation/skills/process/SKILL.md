---
name: process
description: Print the help of the commands that move the work under way along, with /process help.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/process $ARGUMENTS`.

1. `/process` prints the help of its command domain: `/current`, `/next`, `/next?`, and `/work-status`. It takes only `help`.
2. Where the first word is `help`, or nothing was typed, print the text of `help.md`, in this skill's directory, and do nothing more.
3. Any other first word is not guessed at. Say it is not one of this command's subcommands, and that `/process` takes only `help`.
