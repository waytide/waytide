# Reducing rule files to their essential directives

- **State:** Open

**As the engineer stated it:** reduce size of files by reducing them to their essential directives. The determination of "essential" is the challenge.

## What the read costs today

The rule files and vocabularies read at session start hold 569,781 characters across 119 files, and the local rules and this project's vocabulary hold 31,083 more. The read of them on 2026-08-28 took about two and a half minutes of wall-clock.

The largest single file is the announce-waytide-at-session-start rule at 32,426 characters. Four vocabularies and two rules follow it above 12,000 each. Provenance footers account for 1,195 lines.

## What makes "essential" hard to determine

A rule file carries more than its directive, and each of the other parts is there for a stated reason:

- **The `**Why:**` passage** is what a later reader decides against when they weigh changing or removing the rule. The rules-convention requires it.
- **The account of what a rule replaced, and what that cost** — the rejected alternative, the mechanism that was decommissioned, the wording that failed. A directive alone does not stop the same alternative being reached for again.
- **The worked instance.** Several rules turn on a distinction that only a worked case makes legible — the actuation-gate rule's omitted argument, the ete rules' two worked phrases.
- **The `Related:` list**, which is how a rule is reached from a neighbouring one, the rules being referenced by name rather than by path.
- **The provenance footer**, which the record-rule-authorship-in-a-footer rule requires because `git subtree` strips per-file history from a consuming project.

So a reduction that keeps only the directive is a reduction that discards the reasoning the corpus was built to preserve. That is the difficulty the engineer named, stated as what would be given up.

## What is not yet settled

- Whether "essential" is decided per file, per part, or by a test that any rule can be run through.
- Whether the reduction is a rewrite of each file or a second, shorter artifact derived from it, with the full file kept.
- Whether the reader whose need decides is the agent at session start or the engineer revising a rule. The two want different things from the same file.
- Whether the cost being reduced is the read's duration, the context it occupies, or the reader's attention.

---

Authored by Scott Bellware on Wed Sep 9 2026 at 1:36:50 PM PT
