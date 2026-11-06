---
name: freewrite
description: Begin, end, or resume freewriting, recording points as they are said and organizing them at the end.
argument-hint: "[begin | end | resume | idea | observation | mistake | help]"
disable-model-invocation: true
---

The engineer typed `/freewrite $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md` in the `freewrite` skill's directory, and do nothing more.
2. Otherwise, load the rule that governs freewriting. From the project root, run `waytide/system/foundation/load-rules.sh freewriting-records-points-as-they-are-said-and-organizes-them-at-the-end`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Read the first word typed as the subcommand. **Nothing typed, or `begin`**: begin freewriting. **`end`**, **`resume`**, **`idea`**, **`observation`**, or **`mistake`**: do what the rule says of it.
4. Any other first word is not guessed at. Say it is not one of this command's subcommands, and ask which is meant, through the selection interface, in these groups, then again within the group selected:
   - **Freewrite:** `begin`, `end`, `resume`
   - **Freewrite into an item:** `idea`, `observation`, `mistake`
   - **Help:** `help`
