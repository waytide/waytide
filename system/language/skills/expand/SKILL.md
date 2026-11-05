---
name: expand
description: Expand the previous answer beyond its bullet points.
argument-hint: "[help]"
disable-model-invocation: true
---

The engineer typed `/expand $ARGUMENTS`.

1. Where the first word is `help`, print the text of `help.md`, in this skill's directory, and do nothing more.
2. Otherwise, load the rule that governs the act. From the project root, run `waytide/system/foundation/load-rules.sh an-answer-is-a-list-and-prose-must-justify-itself`. Where the project has no `waytide/` directory, run `system/foundation/load-rules.sh` with the same rule name. Follow the rule it prints.
3. Give the expanded answer the rule offers: more detail on the previous answer than its bullet points carried. Offer no next topic.
