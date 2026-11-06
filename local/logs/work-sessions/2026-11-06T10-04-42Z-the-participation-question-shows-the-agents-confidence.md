# Work Session — The participation question shows the agent's confidence (Fri Nov 6 2026)

This work session put the agent's confidence in doing the work unattended into the question asked at a feature's or an experiment's start, and concluded the feature that did it, Affirmed. It began with the engineer asking to show a confidence percentage in the "Who decides?" question. It ended with the question renamed *Human in the loop*, four figures each explained on a line of its own, a warning and a recommendation below a floor of 70%, the figures recorded in the start confirmation, and unattended work waiting for the engineer to accept its plan. Nearly every word of the question was settled by the engineer, one wording at a time.

This record is the guided tour. The durable records it points to are the source of truth: the feature record `local/implementations/2026-11-06T09-08-21Z-participation-confidence`, the two ideas it realized, the design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule, and the log.

## 1. What the percentage measures

The agent first offered options that called the agent's decisions "choices". The engineer rejected the word and said the measure is about the agent doing what the engineer would do, "more like voice". The engineer selected two figures, *works* and *voice*, then asked for a combined score as well, estimated directly by the agent rather than computed, and placed first. The engineer renamed it the *overall score*. The agent added, unasked, that the overall score is never higher than the lower of the other two, and said so.

## 2. The question's words

The engineer renamed *Who decides?* to *Human in the loop*, then removed its question mark. The figures were put each on a line of its own with a sentence saying what it measures. A heading line the engineer supplied was then removed by the engineer. *(the default)* was removed from the Attended option, and with it the rule's directive that the option set show the default. Attended is still the default.

The labels settled as *Agent's confidence*, *It'll work*, and *Your approval*. *Your approval* came after *Your style*, *Satisfactory*, and *Approval*. The engineer asked for a single word for acceptability. The agent recommended *Acceptable*. The engineer chose *Satisfactory*, then *Approval*, then *Your approval*.

## 3. The floor, the warning, and the risk of redo

The engineer asked the agent to estimate the confidence below which attended work is the better choice. The agent estimated about 70%, from the cost of fixing a wrong unattended result against the cost of attention at each hinge, and the estimate was logged as a hypothesis. The engineer then had the question warn and recommend Attended at 70% or lower. The warning's words went from the agent's draft, to *risks adverse outcomes*, which the engineer found too ostentatious, to *you may have to redo work the agent does*.

The engineer asked whether the chance of redo is linear in the confidence. The agent answered that it is 100% minus the confidence only if the confidence is accurate, and that the amount of redo is not linear. The engineer added *Risk of redo* as a line of its own, computed rather than estimated.

## 4. Recording the figures, and the plan

The engineer had the figures recorded in the feature or experiment record's start confirmation, beside the answer to the question, so they can later be compared with how the work turned out. The engineer then had the Unattended option tell the engineer about the plan, and had unattended work wait for the engineer to accept it. Acceptance is asked through the selection UI, with *Accept* and *Revise*. The option's words settled as *The agent makes the decisions and generates through if you accept the plan it'll propose.*

## 5. The checks

The rule was checked after each substantive change, by a fresh agent listing the body's directives and a separate one judging the compressed form. Repairs were made where a directive was lost or less precise, and re-checked. Several checks were stopped and rerun when the engineer changed the wording under them. Word swaps the engineer settled were recorded as not re-checked. The last check kept all 69 directives.

## 6. The conclusion

The engineer declared the feature Affirmed. No fresh agent had yet started a feature under the rule, and the forecast, that the figures are borne out by the work, can only be tested by later features. Both ideas were Realized, the branch merged into `master`, and the worktree and branch removed.

## Takeaways

- The question at a feature's or an experiment's start is *Human in the loop*, with the agent's confidence, the risk of redo, *It'll work*, and *Your approval*, each on a line of its own with a sentence saying what it measures.
- At an agent's confidence of 70% or lower, the question warns that the engineer may have to redo the agent's work, and recommends Attended.
- The figures are recorded in the start confirmation, so they can be compared with how the work turned out.
- Unattended work waits for the engineer to accept the plan, through *Accept* or *Revise*.
- The 70% floor is an estimate. Nothing has yet checked the agent's figures against outcomes.

## Where the durable records live

- The feature record, `local/implementations/2026-11-06T09-08-21Z-participation-confidence`.
- The ideas realized: `2026-11-05T02-29-51Z-the-participation-question-shows-the-unattended-plan-and-a-confidence` and `2026-11-05T02-38-50Z-low-confidence-in-unattended-work-recommends-attended`.
- The estimate of the floor, `local/logs/log/2026-11-06T09-23-01Z-the-attended-floor-is-estimated-at-about-70-percent`.
- The rule, design-by-efferent's attended-or-unattended-is-chosen-when-the-work-is-started.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 2:04:42 AM PT
