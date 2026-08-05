# The modes are normalized to a generalization, trading self-evident files for one place to keep true

Explore stating the mode-dependent artifacts **once**, generally — as **planning directories** and
**planning files** — rather than naming both pairs in every rule that touches them. The rules
would speak of the generalization; the mode rule would bind it to concrete names and paths.

- **Gated on:** nothing. Actionable now.

- **Priority:** 1

## What it would replace

The project-mode feature chose, at its fifth gate, to **edit each rule to name both** directories,
so that a reader of any single rule sees the truth for their project without a second lookup. The
alternative on the table was to hold the substitution in one place, and it was declined for
exactly that reason.

**The cost of that choice has since been counted, and it is nine files** — the four planning
conventions, then `status-report-format`, `work-sessions-convention`, `plans-no-code-samples`, and
`migration-convention`, then `install.sh`. Every rule written from now on that names a planning
directory inherits the same obligation, **and nothing enforces it**: foundation is prose, so a new
rule naming only `plans/` would review, publish, and install cleanly, and stay wrong in every
creative project until an agent followed it into a directory that does not exist. The four
corrected on 2026-08-05 were found by a search someone happened to run, not by a mechanism.

## The trade, as the developer stated it

**The files stop being self-explanatory at a glance.** A reader of a rule that says *planning
directories* learns what governs but not where their own project keeps things, and has to reach
the mode rule to resolve it. That is the quality the fifth gate was buying.

**The judgment offered with the proposal is that this quality may not be achievable while
remaining maintainable** — that self-evidence at every site and one place to keep true are in
tension, and nine files with an unenforced and open-ended obligation is what the first costs.

## A precedent already in the system

**`install.sh` already does this.** Corrected on 2026-08-05, the bootstrap it generates says *and
the project's planning directories* rather than naming either pair, because the installer cannot
know a project's mode — it runs before the mode is chosen. That correction was made for a
different reason and arrived at this vocabulary independently, which is some evidence the
generalization reads acceptably in place.

## What is not settled

- **Whether the generalization is only for rules that mention the directories in passing**, with
  the four planning conventions still naming both because they are *about* those artifacts. That
  is a middle position and may be the right one: `status-report-format` mentioning *planning
  files* costs a reader nothing, where `plans-convention` calling its subject a planning file
  would be evasive.
- **Whether it reaches `migration/`.** A migration record is planning by any ordinary reading, and
  the mode does not touch it — so *planning directories* would either wrongly include it or need
  a qualifier, which is the kind of exception that erodes a general term.
- **What the terms are.** *Planning directories* and *planning files* are the proposal; whether a
  file is the right noun, and whether *artifact* or *document* reads better, is open.
- **Whether the nine existing files are rewritten or only new ones follow the convention.** A
  half-converted system is worse than either whole.
- **Whether a check is the better answer**, or an answer alongside this one: a dozen lines that
  grep `system/` for a rule naming one pair without the other, in the shape of
  `report-direct-commits.sh`. It would not reduce the duplication, but it would make the
  obligation enforced rather than remembered, which is the half of the problem this item does not
  by itself solve.

## The observation this must be read against

**Planning spans three artifacts across two packages** warns against inventing a covering term
for design, implementation plan, and migration record, on the ground that a name spanning all
three would have to be vague enough to fit all three — *which is how a word that explains nothing
gets into a vocabulary that exists to prevent exactly that*. **This item proposes such a term.**
That is not fatal — the observation's caution is about a term that spans artifacts which differ in
what they produce and when they are written, and *planning directories* here spans two pairs that
are deliberately identical in every obligation. But the objection is live and the observation
should be read before this is taken up, not after.

**Why:** the current arrangement has a recurring, unbounded, unenforced cost, and the way it was
paid twice in one day is the argument for looking at it. Whether the generalization is better
depends on how much the self-evidence at each site is actually worth to a reader, which is a
judgment about how the rules are read rather than about how they are written.

**How to apply:** when this is taken up, decide the middle position first — whether rules *about*
the planning artifacts keep naming both while rules that merely mention them generalize — because
it decides how much of the system is in scope. Read the planning-spans-three-artifacts observation
before settling the terms. Consider the check as a companion rather than an alternative. Related:
the `a-project-works-in-formal-or-creative-mode` rule (where the binding would live), the four
planning conventions and the four rules corrected after them (the nine files this would revisit),
and `install.sh` (the precedent).

---

Authored by Scott Bellware on Wed Aug 5 2026 at 1:11:45 AM PT
