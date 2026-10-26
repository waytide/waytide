# A test of behavior that already exists is coverage, not design

In DBE, a test justifies itself by **driving** an implementation that did not exist. The failing test is what brings the behavior into being. A test that passes the first time it runs, because the behavior already exists, drives nothing. It *confirms* the behavior rather than *designing* it. **Such a test is coverage, not a DBE design step.**

**Coverage has value, and it is a concern of testing rather than of DBE.** A test of existing behavior prevents a regression in it, which is worth having. It is not part of the design loop, and DBE does not take it as an outcome. Adding it is a decision about coverage, made on its own. See the "TDD designs, coverage prevents" rule.

**The tell is a no-op implementation hinge.** In the hinge cycle, the implementation hinge may degenerate to "nothing to write — the existing code already satisfies this". The outcome is then not a genuine design step. The loop moves on to the next outcome rather than writing a test to confirm this one.

**The agent may suggest an increase to coverage.** Where the loop passes over such an outcome, the agent may put its test to the engineer as coverage, to accept or decline. It is offered as coverage, not as a design step.

**Why:** DBE is a design tool, not a coverage tool (see the DBE-as-design-tool and human-in-the-loop rules: *exit on solubility, not coverage*). A test that passes when first run, taken as a design step, reads as a driven outcome when it isn't. Such a test usually appears because the implementation ran **ahead** of its driving test. The cause is a default value, a conveyed keyword, or a prevention written incidentally while satisfying an earlier outcome. So the behavior was already present when its "own" outcome came up. The discipline is to notice that, and not take a confirming test as design.

**How to apply:** an outcome's implementation hinge may be a no-op, meaning its test would pass when first run. Do not take it as a design step, and move to the next outcome. The agent may suggest the test as an increase to coverage. Adding it is the engineer's decision, and a decision about coverage rather than a DBE design step.

**When the work is adding coverage, a test that passes when first run is expected and correct.** The activity is preventing a regression in existing behavior rather than designing new behavior. See the "TDD designs, coverage prevents" rule.

## History

Until Mon Oct 26 2026 this rule was titled "Drop an outcome whose test is green-on-arrival — it drives no design". It told the reader to drop such an outcome rather than keep the confirming test, and said the test dilutes the suite's signal. The engineer settled that a test of behavior that already exists is coverage, which has value and is a concern of testing rather than of DBE, and that the agent may suggest it as an increase to coverage. "Green-on-arrival" is replaced by the literal "passes when first run".

Related:

- the DBE-as-design-tool rule
- the human-in-the-loop rule — exit on solubility
- the one-outcome-at-a-time rule
- the hinge-cycle rule — the implementation hinge
- the testing package's vocabulary — verified, not green

---

Authored by Scott Bellware on Sun Jun 28 2026 at 9 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:43:08 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:43:08 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:34:11 PM PT
