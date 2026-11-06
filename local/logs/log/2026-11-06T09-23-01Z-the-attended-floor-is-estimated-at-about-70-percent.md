# The floor of unattended confidence is estimated at about 70% overall score — below it, attended is likely the better choice

**Tags:** [hypothesis]

This is an estimate. Nothing was decided and nothing was built. The engineer asked for it during the participation confidence feature, `2026-11-06T09-08-21Z-participation-confidence`.

1. **What unattended costs:** the chance the work comes out wrong, times what a wrong result costs to fix. A wrong turn found at the end has everything built on it, so fixing it means reviewing the whole result and undoing part of it. That is put at about one full pass of the engineer's attention over the work.
2. **What attended costs:** the engineer's attention at each hinge, as the work goes. It is spent in small pieces, and nothing is built on a mistake. That is put at about a quarter to a third of a full pass.
3. **Break-even:** unattended pays when its chance of being wrong, times one full pass, is less than a quarter to a third of a pass. So it must be wrong less than 25–35% of the time. That puts the floor at about 65–75%, and 70% is the estimate.

**Two things move the floor:**

- **How load-bearing the work is.** If other work will be built on it, a wrong result costs more to fix, and the floor rises toward 80%. For throwaway or easily replaced work it falls toward 50%.
- **Which figure is low.** A low voice figure matters more than a low works figure. The tests catch a works failure while the agent is still working. Only the engineer catches a voice failure, and under unattended work the engineer sees it only at the end. So a voice figure under about 70% points to attended even when the overall score is above the floor.

**The estimate is not calibrated.** Nothing has yet checked the agent's percentages against how the work actually turns out. That is what the feature's forecast tests. Until then, the figure is a rough one. It bears on the idea that low confidence recommends attended.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 1:23:01 AM PT
