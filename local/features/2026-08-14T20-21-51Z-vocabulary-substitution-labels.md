# Feature — Vocabulary substitution labels

## Intent

**Clarify the column headers of the substitutions table**, which five of the six vocabularies
carry, all headed the same way:

```
| Say | Don't say | What it names |
```

**`What it names` undersells what the column holds.** Every row's third cell carries the
definition, and most carry the reason the substitution exists and the STE note that reserves or
approves the word. A reader taking the header at its word expects a gloss and meets an argument.

**The other two are not obviously wrong, and the feature examines them anyway.** `Say` and
`Don't say` are imperative and short, which is what a table wants. Whether they are the right
imperatives is the question this feature puts.

**The scope is the header row, in every vocabulary that has one.** The section headings are not in
scope, and they carry a known inconsistency that is deliberately left: `foundation` says
`Discontinuations` where `design-by-efferent` says `Discontinued terms (do not use)`. That is a
separate feature.

**Nothing about a row's content changes.** No substitution is added, removed, or reworded here.

## Setup

- **Upstream branch:** `master`
- **Feature branch:** `feature/vocabulary-substitution-labels`
- **Base:** `4e586a2b9dfac8295a8e0b6e8bc53aea85ef07d2`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.

## The files in scope

Five vocabularies carry a substitutions table:

- `system/language/vocabulary.md`
- `system/foundation/vocabulary.md`
- `system/testing/vocabulary.md`
- `system/design-by-efferent/vocabulary.md`
- `system/diary/vocabulary.md`

`system/versioning/vocabulary.md` has terms and no substitutions, so it holds no header row.

## How the hinges apply

**This feature builds no unit, so four of the five hinges are degenerate.** There is no actuation
to design, nothing to observe, no controls to construct, and no implementation to write. The
hinge-cycle rule's five are named here rather than recited, since reciting hinges that do not
apply would be the ceremony the method exists to discontinue.

**The naming hinge is the whole of the design**, and it is where the loop waits. The candidate
headers are put through the selection interface as the artifact — the header row as it would be
written — per the one-outcome-at-a-time-name-via-options rule.

**The implementation hinge reduces to conforming the five files** once the naming is settled.

## Confirmations

- **Working location** — branch only, at the start.
- **Participation** — attended, at the start.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 1:21:51 PM PT
