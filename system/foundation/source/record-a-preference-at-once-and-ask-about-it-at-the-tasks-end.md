# Record a preference at once, and ask about it at the task's end

**When the engineer expresses a preference about how the work is done, write their words at once as an observation, unless the preference corrects what the agent just did.** A correction is acted on at once, as set out below. Do not carry the preference silently, and do not interrupt the work to ask about it. At the end of the task, ask what becomes of it, through the selection interface, per the present-every-prompt-to-the-engineer-through-the-selection-ui rule.

**A preference is not a rule until it is written.** An agent holds it for the rest of the session and loses it at the session boundary. The engineer states it again, and every restatement is evidence that nothing carried it. The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule says so in its own **Why:** the preference had been stated three times in one week before it was written down.

## What counts

**A statement about how the work is done, rather than about the artifact in front of you.** *Answer in lists*, *never offer to conclude an experiment*, and *say writer rather than user* are each one.

**A statement about this one artifact is an instruction.** *Make that sentence shorter* is carried out rather than recorded.

**The test is whether it would still hold next week.** Where it would, it is a candidate for a rule. Where it would not, it is an instruction and nothing is recorded.

## A correction is acted on at once

**A preference that points out a deficiency in what the agent just did is a correction, and it is acted on at once.** The deficiency is not left standing while the task goes on. Fix the output, and ask at once, through the selection interface, what the correction changes:

- **An amendment to an existing rule**, where a rule covers the subject, changed in its own source with its History.
- **A new rule**, in `waytide/local/rules/`, with the log entry the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule requires.
- **The fix alone**, where the engineer wants nothing recorded.

**The rule records the correction's own words.** No observation is written first, since nothing is deferred.

## The observation, written at once

**The observation holds the engineer's own words, not a paraphrase.** They are at hand at the moment they are said and are not at hand an hour later. An agent writing from memory records its own reading of the preference rather than the preference. The observation is written per the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes rule, with its log entry.

**Writing it does not stop the work.** The task continues, and the observation waits for the question at the task's end.

## The question at the task's end

Each candidate is genuine, and the selection carries those that apply:

- **A new rule**, in `waytide/local/rules/`, with the matching `waytide/local/logs/log/` entry the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule requires. The observation is promoted, per the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes rule, and names the rule it became.
- **An amendment to an existing rule**, where a rule already covers the subject. The rule is changed in its own source, with its History, and the observation names the rule it became part of. This candidate is offered only where such a rule exists.
- **The observation as it stands**, where the thinking has not settled or the engineer does not want a rule. The an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes rule prefers this where there is doubt. Promoting later is cheap, and retracting a premature rule is not.

**A preference the engineer chose to leave as an observation is not asked about again in the same session.** The answer was given.

**Why:** the alternative to writing a preference down is holding it in an agent memory store, which the a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store rule forbids. Writing the observation at once makes the path from a preference to a written record short enough that nothing needs holding. With the wording already kept, asking at the task's end costs nothing that matters, and it keeps the task's thread whole. Where a rule already covers the subject, a change to that rule is the likeliest outcome, so the question offers it.

**How to apply:** where the engineer corrects what you just did, fix it, and ask at once whether to amend the rule that covers it, write a rule, or leave the fix alone. Where the engineer otherwise states how the work should be done, write their words at once as an observation, with its log entry, and carry on with the task. At the task's end, ask through the selection interface: a new rule, an amendment to the rule that covers the subject where there is one, or the observation as it stands.

Do not record an instruction that governs only the artifact at hand. Do not ask a second time about a preference the engineer has chosen to leave as an observation.

## Compressed

1. When the engineer expresses a preference about how the work is done, write their words at once as an observation, unless it corrects what the agent just did. Do not interrupt the work to ask about it.
2. Do not carry the preference silently.
3. At the end of the task, ask what becomes of it, through the selection interface.
4. A preference is not a rule until it is written. Held by the agent, it is lost at the session boundary.

## What counts

1. A statement about how the work is done, rather than about the artifact at hand, is a preference.
2. A statement about this one artifact is an instruction. Carry it out, and record nothing.
3. The test is whether it would still hold next week.

## A correction

1. A preference that points out a deficiency in what the agent just did is a correction. Act on it at once.
2. Fix the output, and ask at once what the correction changes: an amendment to the rule that covers the subject, a new rule, or the fix alone.
3. The rule records the correction's own words. No observation is written first.

## The observation and the question

1. The observation holds the engineer's own words, not a paraphrase. Write it with its log entry, and carry on with the task.
2. At the task's end, offer the candidates that apply: a new rule, an amendment to an existing rule that covers the subject, or the observation as it stands.
3. A new rule takes its log entry. The observation is promoted and names the rule it became.
4. An amendment changes the rule in its own source, with its History, and the observation names the rule it became part of. Offer it only where such a rule exists.
5. Prefer leaving the observation where there is doubt.
6. Do not ask a second time about a preference the engineer chose to leave as an observation.
7. **Why:** holding a preference in an agent memory store is forbidden. Writing the words at once means nothing is held, so the question can wait for the task's end without losing them.

## History

Until Sun Oct 25 2026 this rule was named ask-at-once-when-a-preference-is-expressed.

Until Tue Oct 27 2026 this rule was named ask-at-once-when-the-engineer-expresses-a-preference and titled "Ask at once when the engineer expresses a preference".

Until Tue Oct 27 2026 this rule interrupted the work to ask whether a preference was recorded, offering a rule, an observation, or neither. The engineer settled that the words are written at once as an observation, and that the question comes at the task's end, with an amendment to an existing rule among its candidates.

Until Tue Oct 27 2026 a correction of what the agent just did was treated as any other preference: written as an observation and asked about at the task's end. The engineer settled that a correction is acted on at once.

Related:

- the a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store rule — the store this replaces, and which depends on this one
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the interface the ask uses
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory — the rule and its log entry
- the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes rule — where the words are written at once, and how the observation is promoted
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the preference stated three times before it was written

---

Authored by Scott Bellware on Fri Aug 14 2026 at 11:32:29 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:34 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:17:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:33:49 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:34:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:37:58 PM PT
