# Work Session — Process questions are logged (Fri Nov 6 2026)

This work session made every process question put through the selection interface log itself, with the engineer's answer, and put the unattended plan inside the question that asks the engineer to accept it. It was the first feature started under the new *Human in the loop* question, and the first run unattended under it. It was concluded Completed.

This record is the guided tour. The durable records it points to are the source of truth: the feature record `local/implementations/2026-11-06T10-13-43Z-process-question-log`, foundation's a-process-question-and-its-answer-are-logged rule, the design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule, and the log.

## 1. The mechanism

The engineer asked that every process question and its answer be logged. The agent set out two ways: a rule, which depends on the agent remembering, and a hook, which never misses one but cannot tell a process question from any other. The engineer asked whether a hook could tell them apart. The agent answered that it could not by meaning, only by a marker in the call, and named `metadata.source`, which the engineer does not see and the hook receives. The engineer had the marker name the question's kind, selected `decision` as its value, and stated that a mechanical question is the opposite of a process question.

## 2. The start, under the new question

The feature was started branch and worktree, concluding without a verdict. The *Human in the loop* question showed an agent's confidence of 70%, so it carried the warning and recommended Attended. The engineer chose Unattended. The agent presented a plan, and the engineer accepted it through *Accept the plan?*.

## 3. The work

The documentation did not describe what `AskUserQuestion` returns to a hook, so the agent read it from this session's own transcript: the questions, the answers keyed by question text, and any notes. The test was written first, then `process-question-log.sh`, the plugin hook on `PostToolUse` for `AskUserQuestion`, and a pre-loaded foundation rule. The rule is pre-loaded because a missed load would leave a question silently unlogged. It was checked, with two repairs.

The hook could not run in the session that built it, which loaded its hooks at the start. The engineer tested it in a fresh session, and it worked. The entry it wrote had a filename cut in the middle of a word, so long filenames are now cut at a word, with a test.

## 4. The plan inside the question

The engineer said a plan should be a numbered or a bullet list. The plan had been one, but it was in the response, and a selection that is open may hide the response above it. The engineer had the plan put inside the *Accept the plan?* question, in this feature. A plan accepted that way is now recorded in the log with the answer.

## 5. The conclusion

The engineer first said Affirmed. The agent pointed out that the feature was started to conclude without a verdict. The engineer selected Completed. The branch merged into `master`, and the worktree and branch were removed.

## Takeaways

- A process question carries `metadata.source` set to `decision`. A mechanical question carries no marker.
- A plugin hook logs each marked question with the engineer's answer, tagged `[decision]`, and the agent commits the entries.
- The unattended plan goes inside the *Accept the plan?* question, so it is in view while the engineer chooses.
- A hook's input for a tool the documentation does not describe can be read from the session's own transcript.

## Where the durable records live

- The feature record, `local/implementations/2026-11-06T10-13-43Z-process-question-log`.
- The rule, foundation's a-process-question-and-its-answer-are-logged.
- The script, `system/foundation/process-question-log.sh`, and its test, `test/automated/process-question-log.sh`.
- The plugin hook, `system/foundation/plugin/hooks/process-question-log`.
- The participation rule, design-by-efferent's attended-or-unattended-is-chosen-when-the-work-is-started.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 9:08:34 AM PT
