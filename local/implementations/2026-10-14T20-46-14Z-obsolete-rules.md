# Experiment — Obsolete rules

**Tags:** [experiment]

## Question

**As the engineer stated it:** Find and remove stale, obsolete, or impertinent rules, as well as rules that exist only for historical reference.

**Can the rule corpus lose its stale, obsolete, impertinent, and history-only rules, and sessions still follow what remains?** Four kinds are named:

- **Stale** — a rule whose content no longer matches the system: it describes a file, a directory, a script, or a behavior that has changed.
- **Obsolete** — a rule that governs something that no longer exists: a retired mechanism, directory, or package.
- **Impertinent** — a rule that does not bear on the work an agent does in a session, or does not belong in the package it sits in.
- **History-only** — a rule whose content is a record of how something came about, with no directive an agent acts on.

**What is removed is a whole rule.** A stale passage inside a rule that otherwise stands is a different question, and is noted where it is found rather than fixed here.

## Setup

- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/obsolete-rules`
- **Base:** `1be591d826ef3cfd9984a3a9b865aa6eaae15253`, from `master`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Reads:** the 108 source rules in the seven packages, and the four local rules in `local/rules/`.

## Forecast

Committed before the work. Each item carries the agent's confidence.

1. **Few whole rules qualify — fewer than ten of the 112.** Most of what is stale sits in passages inside rules that otherwise stand, as the derived-rule-files experiment found for history. *Moderate confidence.*
2. **The candidates concentrate in `foundation`, around retired mechanisms:** the mode mechanism, the deferred queue, and the `observations/` directory, which no longer exists. *Moderate confidence.*
3. **Every rule removed is cited by at least one other rule**, in its body or its `Related:` list, so each removal needs those citations reconciled. *High confidence.*
4. **Stale and obsolete can be shown from the files** — a rule naming a directory, script, or mechanism that is not there. **Impertinent cannot**, and it is the kind that needs the engineer's judgment rule by rule. *Moderate confidence.*
5. **The compiled read shrinks by less than 10%.** *Moderate confidence.*
6. **At least one rule judged obsolete is still read by a script** — `session-start.sh`, `install.sh`, or another — so removing it would break something no test covers. *Low confidence.*

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| Working location | Branch only | Wed Oct 14 2026 at 1:46:14 PM PT |
| Participation | Attended | Wed Oct 14 2026 at 1:46:14 PM PT |

## What actually happened

Nothing yet.

---

Authored by Scott Bellware on Wed Oct 14 2026 at 1:46:14 PM PT
