# Work Session — The branch-switch hook feature is completed (Fri Nov 6 2026 09:23)

This work session started with the rules being loaded and two questions about how rules are compressed. It then found the branch-switch hook feature still open, confirmed its work was finished, and concluded it as Completed.

This record is the guided tour. The durable records it points to are the source of truth: the feature record `local/implementations/2026-11-06T08-51-10Z-branch-switch-hook`, foundation's a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body rule, the rule-reduction experiment's record `local/implementations/2026-10-22T04-51-25Z-rule-reduction`, and the log.

## 1. How rules are compressed

The engineer asked how rules are compressed, including the measures. The answer came from foundation's compression rule. A source rule carries a compressed text with the same effect in fewer words, written as numbered lists without reasons. Two fresh agents check it against the body, one listing the directives and one judging each as kept, less precise, or lost. Each compression, revision, and check records its figures in the source: size rank, clarity score, solubility, change, compression, and directive counts.

## 2. Unclarity

The engineer asked what unclarity is. The answer came from the rule-reduction experiment's record. **Unclarity** is the mean of six ranks among the compiled rules: average sentence length, the share of sentences over 25 words, and history words, asides, citations, and negations per sentence. It is shown as a clarity score, 1 − unclarity. The record states its limits: it is relative, its weights are the agent's choice, sentence length counts twice, and it misses contradiction and ambiguity. It is a screen for which rules to read, not a ranking of difficulty.

## 3. The open feature

The engineer typed `/sup?`, which is not a command, and then asked whether a feature was open. One was: the branch-switch hook, built on `master`. The engineer asked whether it was complete. Every part its record lists was committed, and its two tests passed. No real branch switch had happened in this work session, so the hook had not been seen to fire outside its tests.

## 4. The conclusion

The engineer said to affirm the feature. It had been started as work without a verdict, which ends only as Completed. The engineer selected Completed. The record's state line changed, the record was renamed, and the conclusion was logged and committed.

## Takeaways

- Unclarity is a relative screen of six text measures, displayed as a clarity score.
- The branch-switch hook feature is Completed.
- A feature started without a verdict is concluded Completed, even when the engineer first says affirm.

## Glossary

- **unclarity** — the mean of six ranks among the compiled rules measuring how hard a rule is to follow, from 0 to 1, displayed as the clarity score, 1 − unclarity.

## Where the durable records live

- The feature record, `local/implementations/2026-11-06T08-51-10Z-branch-switch-hook`.
- The compression rule, foundation's a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body.
- The measures' definitions, in `local/implementations/2026-10-22T04-51-25Z-rule-reduction`.
- The log entries for the conclusion, in `local/logs/log/`.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 9:23:41 AM PT
