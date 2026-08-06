# Nothing checks that a consuming project is still in step with Waytide's vocabulary

A change to Waytide's own vocabulary reaches the composite repository and the component
repositories, and stops. A project that installed Waytide keeps its own rules in
`waytide/local/rules/`, written against the vocabulary as it stood at that project's initiation,
and nothing reads them again. The third hop has no check at all.

- **Gated on:** nothing. Actionable now.

## This is no longer anticipatory

**A survey on 2026-08-06 found the defect in every consuming project on the maintainer's
machine.** Each carried a mode rule whose filename named a mode retired on 2026-08-05, and whose
body cited a rule name that had been retired with it. Every one has since been repaired and
pushed, so the instance is closed and the class is not.

**The failure was silent in the way that matters most.** The mode rule states that the filename
alone carries the mode, which is what lets a project's mode be read without opening the file. A
filename naming a retired mode is invisible to that. The same rule states that an absent mode
rule means the mode question has never been asked, and that a mode is never inferred from which
directories exist — so the correct behavior on opening any of those projects was to ask the
developer to choose a mode each had already chosen.

**The same survey found a second, unrelated drift.** Every project's root `AGENTS.md` was behind
the packages installed beneath it, because a package refresh cannot reach a file that belongs to
no package. Both are recorded in `waytide/local/log/` under 2026-08-06.

## What a check would test

**Not what this item first proposed.** The original question was whether a local rule names a
planning directory that project's mode does not have. **The survey found that in no project**, and
it would have been wrong where it did fire: every project's mode rule names the other modes'
directories, because the template that writes it does so deliberately — once to say which
directories are unused, and again to explain the modes so the file stands alone. Any such check
must skip the mode rule, which is identifiable by its filename.

**What the survey says to test instead** is whether a project's mode rule filename matches one of
the mode names the installed `a-project-works-in-a-mode-chosen-at-initiation` rule currently
defines. That is exact, mechanical, and would have caught what was found. A companion test —
whether the project's bootstrap matches what the installed `install.sh` now generates — catches
the second drift the same way.

## What is not settled

- **Where the check lives, and this decides something else.** Placed in `foundation`, a project
  runs the check on itself and nothing else in the system changes. Driven from the composite over
  the set that `read-consuming-projects.sh` discovers, it becomes this maintainer's tooling
  detecting a **condition** of each discovered project — which the consuming-project orchestrator
  aspiration excluded on 2026-08-04, and which its 2026-08-06 entry records as reopened on exactly
  this account. Deciding this closes that.
- **Whether one check covers both drifts or two do.** A stale mode rule and a stale bootstrap are
  found by different tests and have different remedies — one is an edit to the project's own rule,
  the other is a regeneration from the installed installer.

## What was closed on the way here

**A pattern for finding a planning directory written as an unmarked word was tested and
rejected** — six findings over `system/`, none of them true, and untunable, because the
directories are named after the documents they hold. **The duplication that made the one real
instance possible was removed instead**, so `session-start.sh` is now the only place the working
directories are enumerated. Both are in the log under 2026-08-06.

**Why:** a consuming project reads its own rules at the start of every session, so a rule left
behind by a vocabulary change governs that project's work while being unreadable to the mechanisms
built to read it. The composite repository and the component repositories both have checks; the
projects that actually run the rules have none, and a survey found every one of them affected.

**How to apply:**

- Decide whether the script that checks a consuming project's rules against Waytide's current
  vocabulary goes in the `foundation` package or at this repository's root.
- Decide whether that script is one script or two.
- Write it. Two tests:
  - the mode-rule filename in a consuming project's `waytide/local/rules/` names a mode the
    installed `a-project-works-in-a-mode-chosen-at-initiation` rule defines
  - that project's root `AGENTS.md` matches what its installed `install.sh` generates
- Have that script skip the mode rule when checking anything else — a mode rule names other
  modes' directories by design.
- Update the Settled section of
  `waytide/local/aspiration/2026-08-04T17-27-34Z-the-consuming-project-orchestrator.md`, whose
  2026-08-04 no-status resolution is reopened pending the location decision above.
- Delete this file, and log that it was carried out.

Related: `report-planning-directories-named-in-part.sh` (the script at this repository's root that
reports a file naming some but not all of a planning artifact's directories, and which reads
`system/` and stops there), the `a-project-works-in-a-mode-chosen-at-initiation` rule (whose
filename convention makes the mode test possible), `read-consuming-projects.sh` (the script at
this repository's root that lists the consuming projects on the maintainer's machine), and the
consuming-project orchestrator aspiration named above.

---

Authored by Scott Bellware on Thu Aug 6 2026 at 12:25:25 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 10:41:07 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:06:30 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 1:38:14 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 2:00:23 PM PT
