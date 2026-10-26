# A compressed rule's data is written into its source's footer

- **State:** Active
- **Tags:** [idea]

**When a compressed text is written into a source rule, the data about that compression goes into the source's footer with it.** Today the data lives only in the rule-reduction experiment's record and its appendices, not in the rule. That data covers the compression, the change, the solubility and clarity score before and after, the directive check's counts, the restorations, and when the text was written. A reader of the source rule would then see the facts about its compressed version where the version is.

**The footer is the provenance footer** of the rules-convention and the working-state-artifacts-carry-a-provenance-footer rule: the `---` divider and the Authored by and Changed by lines. The compiler leaves it out of the compiled rule, so data placed there is not read at session start.

**Not yet settled:**

1. Which data, and in what form: a line per measure, or one line per compression.
2. Whether it is written by the compiler or by the process that writes the compressed text.
3. Whether a later compression replaces the earlier data or adds to it, as Changed by lines add.

## History

As the engineer first stated it: "Idea: The compiler data should be written into the source footer when the compiled text is written into it"

---

Authored by Scott Bellware on Fri Oct 23 2026 at 11:40:42 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
