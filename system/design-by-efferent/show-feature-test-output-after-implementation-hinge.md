# After any implementation hinge, show the test output for the current feature

Every time an implementation hinge is satisfied. The just-accepted implementation is written and the suite run. **Show the test output for the current feature**, without being asked. Not just the single outcome's test: run and display the **whole feature's** tests (every outcome built so far for the unit under development). The human sees the feature's accumulated behavior at each implementation step.

Run the feature's tests with verbose output so the context tree, `comment`/`detail` narration. Pass/fail are visible. Show that output in the same turn as reporting the implementation.

**Why:** the implementation hinge is where solubility is judged, and solubility is judged against behavior, not code. Showing the *feature's* output — all its outcomes together. Keeps the growing efferent contract in view as it accumulates. The human deliberates the new outcome in the context of the ones already established rather than in isolation. Surfacing it automatically keeps the loop's load-bearing artifact present without the human asking each turn.

**How to apply:** after writing an accepted implementation and running the suite, run the current feature's test file(s) with verbose output and include that output in the turn that reports the implementation, then hand over the solubility gate. This sharpens the show-the-test-after-implementing rule — that rule shows the just-satisfied test. This one requires the **feature's full test output** at **every** implementation hinge.

Related:

- the hinge-cycle rule
- the human-in-the-loop rule
- the show-the-test-after-implementing rule
- the one-outcome-at-a-time rule

---

Authored by Scott Bellware on Mon Jun 29 2026 at 9 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:49:34 PM PT
