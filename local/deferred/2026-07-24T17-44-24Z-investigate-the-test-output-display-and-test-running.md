# Investigate the test output display and test running

The system says a good deal about **what test output must be shown and when**, and
almost nothing about **how the suite is run or how its output is rendered**. That gap
has not been examined as a whole. This item is an investigation — it opens the subject
rather than proposing a change.

What the rules currently require:

- **`show-feature-test-output-after-implementation-hinge`** — at *every* implementation
  hinge, run and display the whole current feature's tests "with verbose output so the
  context tree, `comment`/`detail` narration, and pass/fail are visible."
- **`show-the-test-after-implementing`** — display the just-satisfied test and its run
  result, unasked.
- **`test-report-format`** and **`status-report-format`** — both require a context tree
  two levels deep, confirmed by running the suite rather than asserted.
- **`test-tree-command`** — run the suite with narration suppressed, parse *that output*,
  and merge duplicate context headings into one normalized tree.

Observations that prompted the investigation:

- **A Ruby-specific runner is hardcoded in a package that declares no dependencies.**
  The `git` package's `run-suite-before-commit` rule names `ruby test/automated.rb`
  directly, while the `git` README describes the package as standalone — "it includes no
  other packages." So a package meant to carry commit conventions carries a Ruby and
  TestBench assumption, unlike `testing`, which is deliberately "not tied to a specific
  test-framework API."
- **The `test-tree` command depends on a script the system does not ship.**
  `test-tree-command` calls for "a durable script that does this," and points at another
  project's `test/automated/tree.rb` as "one such implementation." So the command is not
  reproducible from an install alone — each consuming project must supply the script the
  rule assumes.
- **Verbose output at every implementation hinge has no stated bound.** The rule requires
  the *whole feature's* tests, verbose, each time an implementation hinge is satisfied.
  Nothing says what happens as a feature accumulates outcomes, or how output that exceeds
  a readable length should be handled — and the display surface is an agent response in a
  terminal, where volume directly competes with the deliberation the hinge exists for.
- **Display and production are not separated.** The rules specify what the human must
  see; how it is produced (which runner, which flags, narration on or off) is left
  implicit or borrowed from a specific stack. Whether that separation should be made
  explicit — display rules in `design-by-efferent`, production in `testing` — is part of
  the question.

What the investigation should establish:

- Whether the runner belongs in the rules at all, and if so, in which package — a
  language-neutral `testing` convention, a `code/ruby` specific, or a project-local rule.
- Whether `test-tree`'s script should be shipped by the `testing` package rather than
  described and left to each project.
- Whether the verbose-output requirement needs a stated bound, and what the rule should
  say when output would overwhelm the hinge it serves.
- Whether the several display rules (feature output, just-satisfied test, the two report
  formats, the tree command) are consistent with each other, or have drifted.

**Gated on:** nothing in flight blocks it. It is an investigation, so it produces
findings first — recorded as observations under `waytide/local/observations/` if they are not
yet settled — and only then any rule change. No rule is edited before the investigation
reports.

**Why:** the display rules are load-bearing for the method — the implementation hinge is
where solubility is judged, and solubility is judged against observed behavior, so what
appears on screen decides what can be deliberated. But those rules rest on running a
suite, and the running side is specified inconsistently: hardcoded to one stack in one
place, delegated to a script the system does not provide in another, and unbounded in
a third. Examining them together is the only way to see whether that is three separate
defects or one missing distinction between producing output and displaying it.

**How to apply:** investigate the four questions above by reading the rules together —
`show-feature-test-output-after-implementation-hinge`, `show-the-test-after-implementing`,
`test-report-format`, `test-tree-command`, `status-report-format`, and the `git`
`run-suite-before-commit` rule — and record what is found. Settle each finding before
changing any rule, and log the decisions. Delete this file when it is carried out, and
log that it was done. Related: the rules named above, the `testing` package README (which
declares the package system-agnostic), the `git` package README (which declares the
package standalone), and the observations convention (where unsettled findings belong).

---

Authored by Scott Bellware on Fri Jul 24 2026 at 10 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
