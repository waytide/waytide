# A rule's compressed text is written in its source, checked against it, and its figures recorded below the body

**A source rule may carry a compressed text: the rule restated with the same effect and outcome, in fewer words.** It is written in the source, in a `## Compressed` section below the body, and it shares the source's title and `Related:` list. The source's body stays the authority. The compressed text is a second rendering of it, and is never edited apart from it.

## The compressed text

**The compressed text is numbered lists.** Each point is one or two short sentences, carrying one directive or the reason for one. Headings within the section group the points, and each group's list numbers from 1. A reason is a point that leads with `**Why:**`. A fenced example the directives depend on is kept.

**A change to the body reaches the compressed text in the same commit.** A point keeps its number where it can, so that a check's verdicts and a reader's references still find it.

**`./compile.sh` compiles the body, and `./compile.sh --compressed` compiles the compressed text.** Told `--compressed`, a rule with a Compressed section compiles to its title, the compressed text, and its `Related:` list. A rule with none compiles as it does by default. Neither form carries the `## Compressed` heading, the `## Compression` section, the `## History` section, or the provenance footer.

## The check

**A compressed text stands only after it is checked against its source.** The check has two parts, each done by a fresh agent that has not seen the compression:

1. A lister lists the source's directives from its body, without the Compressed section, the Compression section, and the footer.
2. A checker judges each directive against the title, the compressed text, and the `Related:` list, as **kept**, **less precise**, or **lost**.

**A lost directive, and a materially less precise one, is repaired with the smallest clause that closes the gap**, and the repaired rule is checked again in full. Where two checkers disagree on a directive, the source decides. A less precise directive left as it is, and why, is recorded.

**A change to a compressed text after its check is checked again.** A change that only swaps one term for another the engineer settled is the exception.

## The figures

**Each compression, revision, and check of a compressed text is recorded in its source, in a `## Compression` section below the Compressed section.** One line records each event, and a later event adds a line. The earlier lines stay as written, so the section is the rule's history of compression.

**A line gives the date, the event, and its figures:**

- **compressed** — the compression, the change, the solubility and the clarity score before and after, and the directive counts: how many directives, and how many of them kept, less precise, and lost
- **revised** — the solubility and the clarity score before and after, and the directive counts of the check that followed
- **re-checked** — the directive counts, and the number of repairs

Restorations, where a compression put back text it had dropped, are named on the line of the event that made them. A figure that was not measured is left out, not estimated.

**The measures:**

- **Compression** is the share of the body's characters the compressed text removes.
- **Change** is the share of the body's words removed, added, or replaced, from a word-level comparison of the body and the compressed text.
- **Clarity score** is 1 − unclarity. Unclarity is the mean of six ranks among the compiled rules: the average sentence length, the share of sentences over 25 words, and the history words, the asides, the citations, and the negations per sentence.
- **Solubility** is (1 − the mean of the size rank and the unclarity) × 100, as a whole number. Higher is easier to process.

The ranks are taken against the compiled rules at commit `770c7eb`, so that a figure written later is comparable with one written earlier. The rule-reduction experiment's record, `2026-10-22T04-51-25Z-rule-reduction`, sets out each measure.

**The figures are written by the process that compresses, revises, or checks the text, in the same commit.** The compiler leaves the section out of the compiled rule, so the figures are not read at session start.

**Why:** a compressed text is read in place of its source, so a directive it loses is lost to every session that reads it. The check is what shows that it carries what the source carries. Recording the figures in the source keeps the facts about a compressed text where the text is. A reader of the rule sees how it was compressed, how it changed, and when it was last checked, without the experiment record that produced it.

**How to apply:** write a compressed text in the source's `## Compressed` section, as numbered lists. Have a fresh lister and a fresh checker check it against the body, repair each loss with the smallest clause, and check a repaired rule again. Add a line to the source's `## Compression` section for each compression, revision, and check, in the same commit as the change it records.

Related:

- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — a package's `source/` and its compiled rules
- the an-implementation-runs-on-a-branch-to-a-declared-end rule — the rule-reduction experiment, which brings this rule to master when it merges
