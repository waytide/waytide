# Advance one outcome at a time, stop at every gate in attended work, and name via options

The loop advances **one outcome at a time** and, in attended work, **stops at every gate** for the human. It does not run ahead. In particular, do **not batch-generate multiple test files** in one pass. A batch skips the gates where the human's judgment belongs, and accumulates unreviewed, pending mistakes. Generate one outcome's test, stop at its gate, and proceed only on the human's go. **Under unattended work the loop does not stop at the gates**, since the agent decides each hinge itself. It still advances one outcome at a time.

**Finishing the work means naming the test.** A test left with an empty (unnamed) outcome context is unfinished. The closing step ascribes its name. Do this one test at a time.

**The naming gate offers candidate outcome-context names, as every hinge offers its candidates.** See the hinge-cycle rule for the mechanism and its reasons.

**Why:** Batch code generation moves fast, but it bypasses the gates that are the whole point of the loop. Each skipped gate is a place the human's judgment did not get to act, and mistakes hide in the pile. Naming is a hinge like the actuation, since the outcome-context name is a small contract on what the test establishes. So responsibility transfers there the same way, through options plus the free-text option, rather than through an AI fait accompli.

**How to apply:** Build one outcome's test at a time. After each, stop at each of its hinges (see the hinge-cycle rule) and wait. Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-at-the-start rule). Never write several test files at once, in either mode. To finish an unnamed test, present candidate names as options through the selection UI. Then apply the name chosen or dictated.

## History

Until 2026-10-24 the opening said, without qualification, that the loop stops at every gate and proceeds only on the human's go. The rule predates unattended work, whose exception was added only to How to apply. The opening and the title now carry it too.

Until Mon Oct 26 2026 this rule restated, for the naming gate, the mechanism every hinge follows and its reasons. It now cites the hinge-cycle rule.

Related:

- the actuation-gate-options
- human-in-the-loop
- first-turn
- hinge-cycle
- present-every-prompt rules
- the testing package's test-naming rules

---

Authored by Scott Bellware on Sat Jun 27 2026 at 3 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:05:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 1:12:44 PM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:06:30 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:28:14 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:37:04 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:44:33 AM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:16:10 PM PT
