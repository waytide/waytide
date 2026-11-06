# Low confidence in unattended work recommends attended

- **State:** Active
- **Tags:** [idea]

**Where the agent's confidence in doing a piece of work unattended is below a threshold, it would say so and recommend attended work.** The engineer would still choose. The recommendation puts the agent's doubt in front of the choice, rather than leaving it to show in the work.

It builds on the item `2026-11-05T02-29-51Z-the-participation-question-shows-the-unattended-plan-and-a-confidence`, which has the agent show its confidence as a percentage when it asks who decides.

**Not yet settled:** the threshold, whether it is fixed or set by the project, and whether a recommendation below it changes the participation question's options or only adds a line ahead of them.

## Settled

- **2026-11-06** — The threshold is an overall score of 70% or lower, fixed in the rule. At or below it, the question carries a warning line and the Attended option is marked as the recommendation, so it does both. It is carried out by the participation confidence feature, `2026-11-06T09-08-21Z-participation-confidence`. The 70% comes from the estimate in the log entry `2026-11-06T09-23-01Z-the-attended-floor-is-estimated-at-about-70-percent`.

## History

As the engineer first stated it: "Idea: If the agent has less than a certain percentage of confidence in its unattended work, tell the user and recommend attended work"

---

Authored by Scott Bellware on Wed Nov 4 2026 at 6:38:50 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:25:09 AM PT
