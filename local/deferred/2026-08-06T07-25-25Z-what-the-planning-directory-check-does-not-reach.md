# What the planning-directory check does not reach — a consuming project's own rules

`report-planning-directories-named-in-part.sh` reads `system/`, which holds Waytide's own
packages. A project that has installed Waytide keeps its own rules in `waytide/local/rules/`, and
nothing examines those at all.

- **Gated on:** nothing. Actionable now.

## The test there is not the one the composite runs

The composite check asks whether a file names **every** mode's directory for a planning artifact
or none of them, because the packages are read by projects in all three modes. A consuming project
works in **one** mode, fixed at its initiation and recorded as a `formal-mode`, `intuitive-mode`,
or `ooda-mode` rule in `waytide/local/rules/`. So the question there is different: does a local
rule name a planning directory that **this** project does not have?

Answering it means reading the project's mode, which the filename of that rule carries — which is
why the mode rule made the filename carry it.

## What is not settled

- **Where the check lives, and this is the consequential part.** Placed in `foundation`, a project
  runs it on itself and nothing else in the system changes. Driven from the composite over the
  actionable set that `read-consuming-projects.sh` discovers, it becomes this maintainer's tooling
  detecting a **condition** of each discovered project — which the consuming-project orchestrator
  aspiration excluded on 2026-08-04, and which its 2026-08-06 entry records as reopened on exactly
  this account. Deciding this settles that.
- **Whether it is wanted at all.** No consuming project has been found carrying the defect. The
  concern is anticipatory, which is legitimate but is a weaker footing than the composite check
  had — that one was written against eleven live findings.

## What was closed, and how

**The other gap this item carried is resolved, by prevention rather than detection.** The check
cannot see a planning directory written as an unmarked word in a sentence, which is how
`session-start.sh` wrote them, and this item proposed finding such a word by counting its
neighbours in a comma list. **That pattern was tested and rejected** — six findings over
`system/`, none of them true. It cannot be tuned into working: the directories are named after the
documents they hold, so an ordinary sentence listing document kinds carries the same words in the
same shape as a list of directories.

**What was done instead** was to remove the duplication that let the two lists disagree.
`session-start.sh` is now the only place the working directories are enumerated, and the
announce-waytide-at-session-start rule describes the instruction without reproducing its list. The
failure is impossible rather than detectable, and no script was added.

Both are recorded in `waytide/local/log/` under 2026-08-06.

**Why:** a consuming project's own wrong rule is read at the start of every session in that
project and is never seen by anything upstream, so it is the one hop in the chain with no check on
it at all. The composite check's existence makes it easy to believe the class of defect is
handled, which is the more expensive half of a partial check.

**How to apply:** decide first whether a consuming-project check is wanted, given that no instance
has been observed. If it is, settle where it lives before writing anything, because that choice
settles a resolution left open in the consuming-project orchestrator aspiration and is design work
rather than implementation. Related: `report-planning-directories-named-in-part.sh` (the composite
check this bounds), the `a-project-works-in-a-mode-chosen-at-initiation` rule (the convention a
consuming-project check would enforce, and the mode rule whose filename carries the answer), and
the consuming-project orchestrator aspiration (the resolution this would settle).

---

Authored by Scott Bellware on Thu Aug 6 2026 at 12:25:25 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 10:41:07 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:06:30 PM PT
