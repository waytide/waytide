---
name: observation
description: Record an observation. An alias of /item observation.
argument-hint: "[<text> | help]"
disable-model-invocation: true
---

The engineer typed `/observation $ARGUMENTS`. `/observation` is an alias of `/item observation`, and does exactly what it does.

1. Where the first word is `help`, print the text of `help.md` in the `item` skill's directory, beside this skill's, and do nothing more.
2. Load the rule that governs observations. From the project root, run `waytide/system/foundation/load-rules.sh an-observation-is-a-working-hypothesis-whose-one-state-recorded-never-changes`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints, and the rules its triggers then name.
3. Record an observation. The words typed are what it says. Where none were typed, ask what it says.
