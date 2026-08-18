# The `git` package declares itself standalone and is not

- **State:** Open
- **Tags:** [observation]

**Why this state:** a working hypothesis under discovery, produced by the test-output-display investigation. It records what the files say; it settles nothing. It is promoted once the decision is made about where a test runner belongs and whether `git`'s standalone claim is corrected or its cross-package references are removed.

`system/git/README.md` states: *"This is a standalone package: it includes no other
packages."* The package's rules do not hold to that, in two separate ways.

**A specific stack is named in the rules.** `run-suite-before-commit` names
`ruby test/automated.rb` in both its opening statement and its How-to-apply line, and its
How-to-apply also names `0 failed, 0 aborted` — which is not a general phrasing but
TestBench's own output. So the package carries a language, a test framework, **and** that
framework's output format. The deferred item recorded the runner; the output string is a
third stack-specific detail that had not been noted.

**Four cross-package references exist.** All are in Related lines or reasoning:

- `run-suite-before-commit` → the `design-by-efferent` human-in-the-loop rule (twice: in its
  **Why**, "consistent with the human-in-the-loop TDD rule's framing of the test run as
  confirmation", and in Related) and the `design-by-efferent` show-the-test-after-implementing
  rule.
- `commit-says-task-is-done-not-mark-done` → the `language` no-slang rule and the
  `foundation` decision-log conventions.

So `git` refers to `design-by-efferent`, `language`, and `foundation` while declaring it
includes none of them.

**The contrast is with `testing`, which is deliberately neutral.** Its README opens *"Not
tied to a specific test-framework API."* Both packages govern practices that touch a test
run; only one of them keeps a stack out of its rules. Whatever is decided, the two should
not be answering the same question differently by accident.

**What this does not settle.** Whether a Related line pointing at another package's rule
*is* a dependency is itself unsettled — a rule can name a sibling for orientation without
requiring it be installed, and `git` remains readable and applicable with none of the three
installed. The runner is the harder case, because a project that installs `git` and does not
use Ruby cannot follow `run-suite-before-commit` as written. Those two may deserve different
answers.

---

Authored by Scott Bellware on Thu Jul 30 2026 at 7:03:09 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:21:39 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:25:14 PM PT
