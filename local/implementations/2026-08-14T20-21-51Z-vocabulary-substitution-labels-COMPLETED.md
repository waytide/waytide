# Feature — Vocabulary substitution labels

**Tags:** [feature]

## Intent

**Clarify the column headers of the substitutions table**, which five of the six vocabularies carry, all headed the same way:

```
| Say | Don't say | What it names |
```

**`Say` and `Don't say` are crude.** They read as speech, and a substitution binds names, prose, comments, commit messages, logs, and dialogue alike. Each table's own intro says so, and the header contradicted it.

**`What it names` undersells the column.** Every row's third cell carries the definition, most carry the reason the refused word fails, and most carry the STE note that reserves or approves the Use word. A reader taking the header at its word expects a gloss and meets an argument.

**The scope is the header row and the prose that points at it.** Six files carry one or the other. The section headings are not in scope, and they carry a known inconsistency that is deliberately left: `foundation` says `Discontinuations` where `design-by-efferent` says `Discontinued terms (do not use)`. That is a separate feature.

**Nothing about a row's content changes.** No substitution is added, removed, or reworded here.

## Setup

- **State:** Completed
- **Tags:** [feature]
- **Upstream branch:** `master`
- **Feature branch:** `feature/vocabulary-substitution-labels`
- **Base:** `4e586a2b9dfac8295a8e0b6e8bc53aea85ef07d2`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.

## The files in scope

Five vocabularies carry a substitutions table, and each takes the new header row:

- `system/language/vocabulary.md`
- `system/foundation/vocabulary.md`
- `system/testing/vocabulary.md`
- `system/design-by-efferent/vocabulary.md`
- `system/diary/vocabulary.md`

**`system/versioning/vocabulary.md` has terms and no substitutions, so it holds no header row. It was still in scope**, and the record said otherwise until the work reached it. Every vocabulary carries the same preamble, which names the **Say** word of a substitutions table whether or not the file has one. So the sixth file's prose pointed at a column label that no longer exists anywhere.

## The naming hinge

**Settled 2026-08-14: `| Use | Don't use | Meaning |`.**

- **`Use` and `Don't use`** were given by the engineer, on the ground that `say` is crude. `Use` covers writing and speech, which is the whole of what a substitution binds.
- **`Meaning`** was already in the corpus. `design-by-efferent`'s **terms** table is headed `| Term | Role | Meaning |`, and its third column carries the same mixture of definition, argument, and STE note. So the label was proven against this content before it was chosen for it, and the two tables in that file now agree on their last column.
- **`Reason` and `Note` were evaluated and refused.** `reason (n)` is not approved by the STE dictionary, which gives `CAUSE (n)`, and the label is false on every row that argues nothing — `name` against *slug* carries a definition and an STE note and no reason at all. `Note` names no thing, which the communicate-plainly-name-the-thing rule is against, and it collides with the **STE:** note inside most cells.

## How the hinges apply

**This feature builds no unit, so four of the five hinges are degenerate.** There is no actuation to design, nothing to observe, no controls to construct, and no implementation to write. The hinge-cycle rule's five are named here rather than recited, since reciting hinges that do not apply would be the ceremony the method exists to discontinue.

**The naming hinge is the whole of the design**, and it is where the loop waits. The candidate headers are put through the selection interface as the artifact — the header row as it would be written — per the one-outcome-at-a-time-name-via-options rule.

**The implementation hinge reduces to conforming the five files** once the naming is settled.

## Verification

**There is no test suite in this repository**, so the run-suite-before-commit precondition had nothing to run. What the feature changed is prose in six rule files, and what could break is a markdown table.

**Each of the five tables was read back after the change** — the header row, the separator beneath it, and the rows under that. All five are intact, carrying 38 substitution rows between them. No row's content was touched.

**One cosmetic difference is left as found.** The `diary` table's separator is written `| --- | --- | --- |` where the other four write `|---|---|---|`. It renders identically, it predates this feature, and conforming it is not what the feature is for.

## Confirmations

- **Working location** — branch only, at the start.
- **Participation** — attended, at the start.
- **Branch deletion** — confirmed through the selection interface on 2026-08-14, after the merge to `master` and after `master` was pushed. The branch was never pushed, so there was no remote branch to remove. No worktree was created, so none was removed.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 1:21:51 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:31:02 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:32:55 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:09:20 AM PT
