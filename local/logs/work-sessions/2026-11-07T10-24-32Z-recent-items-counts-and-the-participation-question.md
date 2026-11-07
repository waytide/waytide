# Work Session — /recent, the /items counts, and the participation question (2026-11-07)

This work session began with a rename of `/brief` to `/recent`, and went on to add a count of the other items by state below the `/items` table. It then started item 8 as a feature, which put Unattended first in the *Human in the loop* question. Most of the session went to that question's wording. It ended with the wording settled and committed on the feature branch, and the feature still open.

This is the communicable record, the guided tour of the work session. The durable records it points to are the source of truth: the rules, the item, the feature record, and the log.

## 1. `/brief` becomes `/recent`

The engineer asked for the command to be renamed. The rule behind it was renamed with it, to the the-recent-report-says-what-was-recently-done-and-what-is-next rule, and the change was made on `master`. The command table and the PROCESS help name `/recent`.

## 2. `/items` counts what it leaves out

The engineer asked for a summary below the `/items` table of the other items. Asked whether to count by state or by kind, the engineer chose state. Each state other than Open and Active takes one line, such as `45 Realized`, from the largest count to the smallest. A number given to `/items` does not change the counts. The change is in the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule.

## 3. Item 8 starts as a feature

Item 8 was *The participation question offers Unattended first*. It left one question open: where Attended goes when it is the recommendation. The engineer settled that Attended then moves first, because a first option reads as recommended. The feature runs on a branch and worktree, concludes without a verdict, and was not put through the design loop, since rule text is content work under the local rule that holds that loop off content work.

## 4. The question's wording

Seeing the question shown in both cases, the engineer reworded it in a series of steps:

1. The warning went from *you may have to redo work the agent does* through three other wordings to *intervention is indicated*.
2. Each figure's explanation moved into parentheses, starting in lower case.
3. The *It'll work* explanation became *how sure the agent is that what it builds on its own does what it says*.
4. The *Risk of redo* line lost *It is 100% minus the agent's confidence*. The agent still computes it that way.

## 5. A confidence for attended work

The engineer asked whether the agent can calculate how much confidence improves when the work is attended. It cannot calculate it, but it can estimate it: attended work removes most of the risk behind *Your approval*, so the attended confidence is about the *It'll work* figure. That finding was logged. The engineer then had the Attended option carry that figure in parentheses, as *Attended (95%)*, or *Attended (Recommended, 90%)* where it is recommended. The start confirmation records it as a fifth figure.

## Takeaways

- A first option reads as recommended, so the option order follows the recommendation.
- The confidence of attended work is estimated, not calculated, and is about the *It'll work* figure.
- Nothing has yet checked the figures, or the 70% threshold, against how the work turned out.

## Glossary

- **`/recent`:** says what was recently done, and what's next.
- **attended confidence:** the agent's estimate of its confidence if the work is attended, shown in the Attended option.

## Where the durable records live

- The the-recent-report-says-what-was-recently-done-and-what-is-next rule
- The a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule
- The attended-or-unattended-is-chosen-when-the-work-is-started rule, on the feature branch `feature/worktree/participation-question-offers-unattended-first`
- The item: `local/items/2026-11-07T08-03-39Z-the-participation-question-offers-unattended-first`
- The feature record: `local/implementations/2026-11-07T09-46-08Z-participation-question-offers-unattended-first`
- The log entries from `2026-11-07T09-27-02Z` onward under `local/logs/log/`

---

Authored by Scott Bellware on Sat Nov 7 2026 at 2:24:32 AM PT
