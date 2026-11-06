---
name: clarify
description: Clarify the previous answer, then clarify it again.
disable-model-invocation: true
---

The engineer typed `/clarify $ARGUMENTS`.

1. Where the first word is `help`, say that this command takes no `help`, and that `/language help` prints the help of its command domain. Do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `waytide/system/foundation/load-rules.sh clarify-rewrites-the-previous-answer-twice`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Rewrite the previous answer more plainly, then once more, as the rule says.
