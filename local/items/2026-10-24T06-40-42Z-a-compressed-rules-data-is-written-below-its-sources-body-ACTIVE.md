# A compressed rule's data is written below its source's body

- **State:** Active
- **Tags:** [idea]

**When a compressed text is written into a source rule, the data about that compression is written into the source with it, below the rule's body.** Today the data lives only in the rule-reduction experiment's record and its appendices, not in the rule. That data covers the compression, the change, the solubility and clarity score before and after, the directive check's counts, the restorations, and when the text was written. A reader of the source rule would then see the facts about its compressed version where the version is.

**"Footer" means below the body, not the provenance footer.** The engineer said so on 2026-10-27, correcting this item's first reading. The data sits after the rule's body. The provenance footer, the `---` divider and the Authored by and Changed by lines, records authorship and nothing else.

**Settled on 2026-10-27:**

1. **The figures go in a `## Compression` section below the Compressed section, one line per compression, revision, or check.** A later event adds a line, and the earlier lines stay, so the section is the rule's history of compression. The engineer chose this form from examples.
2. **The process that compresses, revises, or checks the text writes the line, in the same commit.** The compiler cannot know a check's counts.
3. **The compiler leaves the section out of both compiled forms**, so it is not read at session start.
4. **A rule governs it.** The engineer settled that an experiment brings to master the rules its practice needs, so the rule-reduction experiment's phase branch carries a foundation rule for the whole of compression: the compressed text, the check, and the figures. Its sources carry the figures the experiment record holds.

The item stays Active until the experiment merges, since master has neither the rule nor the sections until then.

## History

As the engineer first stated it: "Idea: The compiler data should be written into the source footer when the compiled text is written into it"

---

Authored by Scott Bellware on Fri Oct 23 2026 at 11:40:42 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:49:49 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:49 PM PT
