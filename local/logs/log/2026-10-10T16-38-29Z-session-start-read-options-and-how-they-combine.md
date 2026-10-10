# The options for a faster session-start read are recorded with how they combine, and none is adopted

The options:

- **Reducing the files.** Provenance footers held 74,524 of the 667,009 characters read, and the package `README.md` files 59,006. Dated history clauses sit in rule files, where no rule bars them as the a-vocabulary-entry-says-what-a-term-means-not-what-it-was rule bars them in a vocabulary entry.
- **Reading a shorter derived artifact, with the full files kept.** This is an open question of the reducing-rule-files-to-their-essential-directives idea.
- **Printing every rule from one packaged script**, which would fix the read's order and its number of tool calls. Output that large is saved to a file and needs a follow-up read, so the floor is two calls.
- **Not reading deactivated packages.** The a-project-declares-its-package-set rule reads them deliberately, and this repository deactivates nothing.
- **Reading on demand rather than up front.** The announce-waytide-at-session-start rule records the failure this would bring back.
- **Claude Code's fast mode**, which speeds output and not the input the read is mostly made of.

How they combine:

1. Reducing the files and reading a shorter derived artifact reduce how much is read. Printing every rule from one packaged script reduces how many tool calls the read takes. The two savings add together.
2. The shorter derived artifact would leave out the same footers and README files that reducing the files would remove. Choosing it would leave the source files as written.
3. The packaged script is mechanical and does not depend on settling the questions the reducing-rule-files-to-their-essential-directives idea leaves open.
4. Optionally, an experiment would test whether `session-start.sh` can carry the rules in the `additionalContext` channel instead of the agent reading them. The channel's size limit is not known, and neither is whether the rules would reach the agent before its first response. Carrying them there would change the announce-waytide-at-session-start rule, which keeps that channel to the read instruction. It would also change the initialization-rule, which places its display at the head of the response that carries the read.
