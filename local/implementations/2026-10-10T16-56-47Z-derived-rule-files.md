# Experiment — Derived rule files

**Tags:** [experiment]

## Question

**Does a session that reads derived rule files read faster, and still honor the rules?**

**It tests one first cut of a derived file, not the open question of what a derived file carries.** The reducing-rule-files-to-their-essential-directives idea leaves that question open, and its reordered plan runs this experiment before the question is settled so the findings can inform it. A refuted result may say the cut was wrong rather than that derived files are, and the findings are to say which.

## Setup

- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/derived-rule-files`
- **Base:** `f53081153fde6596327cbb909f2c5d042da57ca7`, from `master`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Rests on:** the reducing-rule-files-to-their-essential-directives idea — its section on a package structure with source and derived rules, and its reordered plan.

## The first cut

**A derived file drops** the provenance footer and the dated history clauses.

**A derived file keeps** the directive, the `**Why:**` passage, and the worked instances.

**The read leaves out** the package `README.md` files. `vocabulary.md` is read as it is.

**The layout** is the one the idea describes: derived files at the package root under each rule's name, the full rules in a source subdirectory. The source subdirectory's name is not settled.

## Starting point

**Measured 2026-10-10:** 667,009 characters across 126 files, of which provenance footers are 74,524 and package `README.md` files are 59,006.

**Not yet measured:** the number of tool calls and the time from the start of the read to the first response. These are taken before the derived read is compared against them.

## Forecast

Committed before the work. Each item carries the agent's confidence.

1. **The derived read is between 450,000 and 520,000 characters**, about a quarter smaller. The footers and README files account for 133,530 of the reduction and the history clauses for the rest. *Moderate confidence — the history clauses have not been measured, and the estimate rests on the footers and README files.*
2. **The read's duration falls roughly in proportion to its size**, since the number of tool calls is unchanged by this experiment. *Low confidence — the agent's grouping of the reads varies between sessions, and that variance may be as large as the saving.*
3. **Removing the footers is mechanical and reliable.** A footer is a run of lines below the last `---` divider, starting `Authored by` or `Changed by`. *High confidence.*
4. **Removing the history clauses is not mechanical.** A sentence carrying a date can carry a directive — *every commit written before 2026-08-18 stands as written* is one. A generator that strips by date pattern will remove directives, and one that does not will keep history. *High confidence, and this is the item most likely to shape what a derived file can be.*
5. **Adherence holds for rules whose directive and `**Why:**` are kept**, which is most of them. *Moderate confidence.*
6. **Where adherence slips, it slips on a prohibition whose force came from the account of what it replaced** — the alternative that was tried and failed. The announce-waytide-at-session-start rule's no-quotation-marks and no-opt-out passages are the predicted cases. *Low confidence.*
7. **The README files cost nothing to leave out**, because each summarizes rules the read already carries. *Moderate confidence.*

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| Working location | Branch only | Sat Oct 10 2026 at 9:56:47 AM PT |
| Participation | Attended | Sat Oct 10 2026 at 9:56:47 AM PT |

## What actually happened

Nothing yet.

---

Authored by Scott Bellware on Sat Oct 10 2026 at 9:56:47 AM PT
