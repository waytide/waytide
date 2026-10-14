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

### The survey — 2026-10-14

**Five agents read all 113 rules against the four kinds**, each to one brief, checking every claim that something no longer exists against the repository and listing what cites each candidate. The local rules number five, not four: the-source-is-compiled-before-a-package-is-published was added the same day.

**Five rules are candidates.**

| rule | package | kind | confidence | a live directive lost on removal |
|---|---|---|---|---|
| show-the-test-after-implementing | design-by-efferent | stale — superseded by what-each-hinge-displays and show-feature-test-output-after-implementation-hinge | moderate | none found |
| rules-establish-a-mindset-purpose-over-category | foundation | stale — framed on rule folders that no longer exist | moderate | judge a stance rule by the mindset it produces, and reconcile conflicts at the level of purpose |
| package-dependency-heading | foundation | impertinent — one heading's wording for a "design doc" no other rule uses | low to moderate | title the section "Package Dependency" |
| dbe-human-in-the-loop | design-by-efferent | stale — the two-hinge loop, superseded by hinge-cycle and in conflict with it on when the test file is shown | low | never make the human wait at a red or green bar; exit on solubility, not coverage; the division of labor |
| a-citation-is-not-a-dependency | foundation | impertinent — governs package authoring, shipped to every consuming project | low | the citation-or-dependency test, and where a dependency is declared |

**Rules holding stale passages, not candidates:** about 40, across every package. The kinds that recur:

- **The retired deferred queue,** still named in seven rules — among them project-context-lives-in-the-committed-artifacts, working-state-artifacts-carry-a-provenance-footer, status-report-format, file-names-use-iso8601-utc-prefix, decision-log-convention, and communicate-plainly-name-the-thing.
- **Citations by names that match no file:** "the file-names rule", "the decision-log rule", "the observations rule", "the folder-mirroring rule", "the Word Substitutions rule", "the assert-raises rule", "the import-define-audit", and a suspended rule that no longer exists.
- **Counts that have drifted:** vocabularies (five, where there are six), implementation records (sixteen, where there are 22), reserved words (three, where there are six), scripts (thirteen, where there are 19), and word frequencies.
- **Rules that contradict another rule:** a-suspension-is-a-log-entry's one reserved tag, an-idea-takes-a-log-entry on the ideas-convention, tests-are-automated-or-interactive on itself, tdd-test-structure's "arrange", and the two-gate loop still named in show-feature-test-output-after-implementation-hinge and one-outcome-at-a-time-name-via-options.
- **Damaged text:** tdd-designs-coverage-prevents-never-break-implementation's repeated "regression", and `Related:` lists that split one rule's name across two items.
- **A removed script still relied on:** ordinary-vocabulary-is-not-reserved-and-not-rewritten's unclaimed-words check, deleted on 2026-08-13; and the local shell-scripts-are-self-executable rule's two removed scripts.

**What the survey says of the forecast so far.** Item 1 holds: five candidates, fewer than ten. Item 2 does not: no candidate governs a retired mechanism; the retired mechanisms survive only as passages, and the candidates divide between foundation and design-by-efferent. Item 3 holds for four of the five: every candidate but package-dependency-heading is cited by another rule. Item 4 holds: the two impertinent candidates are the two the agents were least sure of.

---

Authored by Scott Bellware on Wed Oct 14 2026 at 1:46:14 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:49:11 PM PT
