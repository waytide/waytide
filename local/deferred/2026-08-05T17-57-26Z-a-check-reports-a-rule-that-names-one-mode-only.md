# A check reports a rule that names one mode's planning directory without the other

A dozen lines that read `system/` and report any rule naming `design/`, `plans/`, `aspiration/`,
or `intention/` in a way the mode convention does not allow — a rule that merely mentions one
naming it concretely at all, or a rule about one naming a single pair.

- **Gated on:** nothing. Actionable now.

- **Priority:** 1

**It is what the generalization does not solve.** Generalizing the rules that merely mention the
planning artifacts shrank the surface from nine files to seven, and the seven that remain are
**about** those artifacts, so they are stable by design. What is unchanged is that **nothing
enforces either half of the convention**. A new rule naming only `plans/` still reviews,
publishes, and installs cleanly, and is wrong in every creative project until someone follows it
into a directory that does not exist. The rules corrected on 2026-08-05 were found by a search
someone happened to run.

**The shape is `report-direct-commits.sh`'s** — a read-only reporting script at the composite
root, run before publishing, exiting non-zero on a finding. That script exists because the same
class of silent drift, in a different place, was found the hard way twice.

## What is not settled

- **Whether it can distinguish *about* from *mentions* mechanically.** The convention turns on
  what a rule is for, which a grep cannot read. A list of the rules that are *about* the artifacts
  would be a maintained list — the thing this system argues against — while inferring it from the
  filename is a guess that will be wrong eventually.
- **Whether it belongs at the composite root or in `foundation`.** It checks the packages' own
  prose, so a consuming project has no use for it, which argues for the root beside the other
  authoring tools.
- **Whether it should also check a consuming project**, whose local rules may name a directory
  its mode does not have.

**Why:** the convention is stated in the mode rule and nowhere enforced, which is the same
position the direct-commit rule was in before its script existed. A convention that depends on
every future author remembering it is a convention with a known failure mode and no detector.

**How to apply:** write it at the composite root beside `report-direct-commits.sh` and
`read-consuming-projects.sh`, reading `system/` and reporting per rule. Settle the *about* versus
*mentions* question first — it decides whether the check is precise or merely advisory. Related:
the `a-project-works-in-formal-or-creative-mode` rule (the convention it would check) and
`report-direct-commits.sh` (the shape).

---
Authored by Scott Bellware on Wed Aug 5 2026 at 10:57:26 AM PT
