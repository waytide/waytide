# What the planning-directory check does not reach — a plain-prose list, and a consuming project

`report-planning-directories-named-in-part.sh` reports a file naming some but not all of a mode's
planning directories. Two things it does not reach were found while writing it, and neither is
a defect in the completeness test — each is a different question the test was never asked.

- **Gated on:** nothing. Actionable now.

## The plain-prose list

The check matches a directory named as `local/plans/` or as a backticked `` `plans/` ``. It does
not match a bare word in a comma run, which is the form `session-start.sh` used — *the working
directories next to it — log, deferred, design, plans, work-sessions, …*. That site was found by
reading the script, not by the check, and it is the site with the widest reach in the system: the
instruction the agent receives at the start of every session. **A blind spot that hid the most
consequential instance is the argument for closing it.**

**It cannot be closed the obvious way.** Matching a bare `design` fires on every ordinary use of
the word, which in this repository is constant. The targeted form available is to treat a bare
planning-directory word as a finding only where it sits in a comma-separated run alongside two or
more of the other working-directory names — `log`, `deferred`, `observations`, `work-sessions`,
`loops`, `experiments`, `migration`, `suspended`. Both list sites have exactly that shape.

**What is not settled** is whether to take it. It is a heuristic, where the completeness test is
structural: it holds because only a defect names some of an artifact's directories and not the
rest, and it needs no notion of
what a rule is for. A pattern that counts neighbouring words is a different kind of thing, and
adding it makes the script's report two claims of unequal confidence rather than one.

## A consuming project

The check reads `system/`, which is the packages' own prose. A consuming project's local rules can
carry the same defect, and **the test there is not this one**: a consuming project works in a
single mode, so its question is whether a local rule names a directory that project does not have
— not whether an artifact's directories are named in full. Answering it means reading the
project's mode from its
`formal-mode`, `intuitive-mode`, or `ooda-mode` rule filename, which the composite check has no
reason to do.

**Why:** both gaps are silent. A rule wrong in a plain-prose list reviews, publishes, and installs
exactly as cleanly as the ones the check now catches, and a consuming project's own wrong rule is
never read by anything upstream at all. The check's existence makes it easy to believe the class
of defect is handled, which is the more expensive half of a partial check.

**How to apply:** settle the heuristic question first — whether the script should carry a
neighbour-count pattern beside its structural test, or whether the plain-prose form is left to
reading. Then decide whether a consuming-project check is the same script taught to read a mode
rule, or a separate one that belongs in `foundation` where a consuming project can run it.
Related: `report-planning-directories-named-in-part.sh` (the check these bound), the
`a-project-works-in-a-mode-chosen-at-initiation` rule (the convention both would enforce), and the
announce-waytide-at-session-start rule (which documents the instruction the missed site builds).

---

Authored by Scott Bellware on Thu Aug 6 2026 at 12:25:25 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 10:41:07 AM PT
