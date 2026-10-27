# Advance one outcome at a time, and stop at every gate in attended work

The loop advances **one outcome at a time** and, in attended work, **stops at every gate** for the human. It does not run ahead. In particular, do **not batch-generate multiple test files** in one pass. A batch skips the gates where the human's judgment belongs, and accumulates unreviewed, pending mistakes. Generate one outcome's test, stop at its gate, and proceed only on the human's go. **Under unattended work the loop does not stop at the gates**, since the agent decides each hinge itself. It still advances one outcome at a time.

**Finishing the work means naming the test.** A test left with an empty (unnamed) outcome context is unfinished. The closing step ascribes its name. Do this one test at a time.

**The naming gate offers candidate outcome-context names, as every hinge offers its candidates.** See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule for the mechanism and its reasons.

**Why:** Batch code generation moves fast, but it bypasses the gates that are the whole point of the loop. Each skipped gate is a place the human's judgment did not get to act, and mistakes hide in the pile. Naming is a hinge like the actuation, since the outcome-context name is a small contract on what the test establishes. So responsibility transfers there the same way, through options plus the free-text option, rather than through an AI fait accompli.

**How to apply:** Build one outcome's test at a time. After each, stop at each of its hinges (see the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule) and wait. Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-when-the-work-is-started rule). Never write several test files at once, in either mode. To finish an unnamed test, present candidate names as options through the selection UI. Then apply the name chosen or dictated.

Related:

- the actuation-gate-options
- human-in-the-loop
- first-turn
- the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming
- present-every-prompt rules
- the testing package's test-naming rules
