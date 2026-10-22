# Participation is a range of batch sizes, set finer or coarser, and changed as the work goes

- **State:** Open
- **Tags:** [idea]

**As the engineer stated it:** Batch size, or level of detail in the decision to have attanded or unattended can be a finery to coarse level. It allows the machine to take more steps on its own, or to real it in. You can say "go faster", and the human only checks in at larger scale cycle points.

## What it would change

- **Today the decision has two values, fixed at the start.** The attended-or-unattended-is-chosen-at-the-start rule makes participation *attended* or *unattended*, "chosen when a feature or an experiment is started and held for its duration".
- **The rule already frames the decision as batch size.** It calls attended "small-batch" and unattended "big-batch". Two batch sizes are the two ends of the range this item describes.
- **This item makes it a range, and adjustable during the work.** Between stopping at every hinge and stopping only at the end are stops at larger points of the cycle: each outcome, each phase, each feature. "Go faster" moves the next stop to a coarser point, and reining it in moves it back to a finer one.
- **It would reach the rule's "held for its duration".** A batch size that the engineer changes mid-work is not held, so that clause, and the start-only gate, would have to change with it.

---

Authored by Scott Bellware on Wed Oct 21 2026 at 9:53:28 PM PT
