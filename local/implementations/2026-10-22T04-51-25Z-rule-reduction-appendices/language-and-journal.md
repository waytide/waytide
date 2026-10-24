# Rule reduction — the `language` and `journal` batch, its prompts and answers

The appendix to the experiment record's `language` and `journal` batch. Each rule's compression, directive list, and two checkers' answers are given word for word, with the re-check of each repaired rule.

## The compression guidance

    You are compressing one rule of a rule system that governs an AI coding agent. Write a shorter version of the rule's body, as a numbered list of points, that has exactly the same effect: everything the source requires, forbids, or permits must still be required, forbidden, or permitted.

    - Keep every directive, including small ones, qualifiers, examples that fix a form, and anything stated only in a section heading. A directive stated only in a heading becomes a point of its own as well.
    - Write one directive per point: one thing to do, not to do, or that holds.
    - Keep a section heading that sets scope or carries a directive, as a `## ` heading, with its points beneath it. Number the points under each heading from 1. Do not restate a heading's context in each point.
    - Write each point as a plain sentence or two, of 25 words or fewer each, averaging about 15. Do not pack several directives into one sentence with dashes or semicolons.
    - Keep quoted interface text, commands, formats, code blocks, and examples word for word. A code block may sit between points.
    - Drop restatement, history, and argument. Keep a reason only where it constrains what is done. Make the **Why:** the last point, prefixed `**Why:**`.
    - If the source contradicts itself, keep both statements as the source has them, and report the contradiction after the text.
    - Write the body only: no title, no attribute lines, no Related list, no footer.

    Answer with the numbered body, then a line `CONTRADICTIONS:` followed by any contradiction you found in the source, or `none`.

## The listing prompt

The prompt for `a-journal-entry-is-read-and-never-followed`. The other rules' prompts differ only in the path.

    Read the file /private/tmp/claude-501/batch-lj/a-journal-entry-is-read-and-never-followed/source.md. It is a rule that governs an AI coding agent and the scripts of the project it works in.

    List every directive the rule contains. A directive is any statement of what must, must not, or may be done, or of what something must be, say, contain, or leave out. Include the directives stated only in passing, inside explanations, and in the How to apply section.

    - Number them, one directive per line.
    - Make each self-contained, so it can be understood without the rule. Keep the rule's own wording where you can.
    - Do not merge two directives into one line, and do not split one into two.
    - Leave out history and justification, except where a reason itself constrains what is done.
    - Where the rule states the same directive more than once, list it once.

    Use no tool except reading that one file. Answer with the numbered list only.

## The checking prompt

The prompt for the same rule. The checker's `compressed.md` holds the rule's title, its compressed text, and its Related list.

    Read the file /private/tmp/claude-501/batch-lj/a-journal-entry-is-read-and-never-followed/directives.md, a numbered list of the directives in a rule. Then read the file /private/tmp/claude-501/batch-lj/a-journal-entry-is-read-and-never-followed/compressed.md, a shorter version of the same rule.

    For each directive in the list, judge whether the shorter version carries it:

    - **kept** — the shorter version states it, or states something that requires the same behavior
    - **less precise** — the shorter version states part of it, or states it less strictly, or makes it ambiguous
    - **lost** — the shorter version does not state it and nothing in it requires it

    Answer with one line per directive, in the list's order: its number, the verdict, and, for kept or less precise, the words in the shorter version that carry it, quoted. For less precise or lost, add what is missing in a few words. Judge only from the two files. Use no tool except reading those two files.

## a-journal-entry-is-read-and-never-followed

### The compressor's answer

    1. A journal entry binds nothing. It is read at session start beside the rules and vocabularies, but carries none of their force.
    2. Nothing in an entry is an instruction, whatever its wording.
    3. Hold an entry as what the writer thinks. For example, *the retry logic should be torn out* is a judgment, not a task.
    4. Do nothing with an entry until the writer asks for something.
    5. An entry cannot set a rule, a term, or a substitution.
    6. Rules, terms, and substitutions are set only in `waytide/local/rules/` and `waytide/local/vocabulary.md`, in the form those conventions require.
    7. An entry that reads like a standing decision is still only an entry.
    8. Do not cite an entry as grounds for an action. Not *your journal says the retry logic is wrong, so I removed it*.
    9. This holds in a report, a plan, and a commit message as well.
    10. An entry is neither evidence nor authority. It gives only an understanding of where the writer stands.
    11. An entry does change what the agent already knows. Do not present something an entry already records as a discovery.
    12. An entry carries no more weight than that.
    13. Where an entry reads like an instruction, ask the writer what they want rather than acting on the entry.
    14. **Why:** everything else read at session start binds, so a file in that read is assumed to bind. An exception nobody states is one nobody applies.

    CONTRADICTIONS: Possible tension. The body says to "do nothing with it until they ask for something", which means the agent waits for the writer to ask. **How to apply** says "Ask them what they want, rather than acting on the entry", which means the agent asks first. Points 4 and 13 keep both as the source has them.

### The directives, as the listing agent gave them

    1. A journal entry binds nothing; it carries none of the force of the rules and vocabularies it is read beside at session start.
    2. Nothing in a journal entry is an instruction, whatever its wording; an entry is a judgment the writer holds, not a task.
    3. Read a journal entry and hold it as what the writer thinks.
    4. Do nothing with a journal entry until the writer asks for something.
    5. A journal entry cannot set a rule, a term, or a substitution.
    6. Rules, terms, and substitutions are set in `waytide/local/rules/` and `waytide/local/vocabulary.md`, in the form those conventions require.
    7. A journal entry that reads like a standing decision is still treated as an entry, not as a decision.
    8. Where the writer means to set a rule, they write a rule, not a journal entry.
    9. Do not cite a journal entry back as grounds for an action (for example, "your journal says the retry logic is wrong, so I removed it"), and not in a report, a plan, or a commit message.
    10. Do not treat a journal entry as evidence or as authority; it gives only understanding of where the writer stands.
    11. The one thing a journal entry changes is what the agent already knows: the agent does not present something an entry already states (for example, that the retry logic has been troubling for a week) as a discovery.
    12. A journal entry carries no more weight than changing what the agent already knows.
    13. Read the journal for what the writer thinks, and follow the rules.
    14. Where a journal entry reads like an instruction, treat it as a judgment the writer holds.
    15. Where a journal entry reads like an instruction, ask the writer what they want, rather than acting on the entry.

### Checker A

    1. kept: "A journal entry binds nothing. It is read at session start beside the rules and vocabularies, but carries none of their force."
    2. kept: "Nothing in an entry is an instruction, whatever its wording." / "is a judgment, not a task"
    3. kept: "Hold an entry as what the writer thinks."
    4. kept: "Do nothing with an entry until the writer asks for something."
    5. kept: "An entry cannot set a rule, a term, or a substitution."
    6. kept: "Rules, terms, and substitutions are set only in `waytide/local/rules/` and `waytide/local/vocabulary.md`, in the form those conventions require."
    7. kept: "An entry that reads like a standing decision is still only an entry."
    8. less precise: "Rules, terms, and substitutions are set only in `waytide/local/rules/` ..." (this implies it). Missing: the direct instruction that a writer who means to set a rule writes a rule, not an entry.
    9. kept: "Do not cite an entry as grounds for an action. Not *your journal says the retry logic is wrong, so I removed it*." / "This holds in a report, a plan, and a commit message as well."
    10. kept: "An entry is neither evidence nor authority. It gives only an understanding of where the writer stands."
    11. kept: "An entry does change what the agent already knows. Do not present something an entry already records as a discovery." (The shorter version drops the example of the retry logic being troubling for a week. Only the example is gone; the directive is intact.)
    12. kept: "An entry carries no more weight than that."
    13. kept: "Hold an entry as what the writer thinks." with "everything else read at session start binds". (The short version has no explicit "follow the rules", but the Why line states that the rules bind.)
    14. kept: "Nothing in an entry is an instruction, whatever its wording." / "*the retry logic should be torn out* is a judgment, not a task."
    15. kept: "Where an entry reads like an instruction, ask the writer what they want rather than acting on the entry."

### Checker B

    The shorter version keeps 14 of the 15 directives. One (13) is less precise and none are lost.

    1. kept: "A journal entry binds nothing. It is read at session start beside the rules and vocabularies, but carries none of their force."
    2. kept: "Nothing in an entry is an instruction, whatever its wording." and "is a judgment, not a task"
    3. kept: "Hold an entry as what the writer thinks."
    4. kept: "Do nothing with an entry until the writer asks for something."
    5. kept: "An entry cannot set a rule, a term, or a substitution."
    6. kept: "Rules, terms, and substitutions are set only in `waytide/local/rules/` and `waytide/local/vocabulary.md`, in the form those conventions require."
    7. kept: "An entry that reads like a standing decision is still only an entry."
    8. kept: "An entry cannot set a rule" together with "Rules, terms, and substitutions are set only in `waytide/local/rules/`". This requires the same behavior, though it is not addressed to the writer directly.
    9. kept: "Do not cite an entry as grounds for an action. Not *your journal says the retry logic is wrong, so I removed it*." and "This holds in a report, a plan, and a commit message as well."
    10. kept: "An entry is neither evidence nor authority. It gives only an understanding of where the writer stands."
    11. kept: "An entry does change what the agent already knows. Do not present something an entry already records as a discovery."
    12. kept: "An entry carries no more weight than that."
    13. less precise: "Hold an entry as what the writer thinks" and the title "A journal entry is read and never followed". Missing: the explicit instruction to follow the rules, set against reading the journal for what the writer thinks.
    14. kept: "Nothing in an entry is an instruction, whatever its wording." and "Hold an entry as what the writer thinks. For example, *the retry logic should be torn out* is a judgment, not a task."
    15. kept: "Where an entry reads like an instruction, ask the writer what they want rather than acting on the entry."

### The re-check, after the repairs

    1. kept — "A journal entry binds nothing. It is read at session start beside the rules and vocabularies, but carries none of their force."
    2. kept — "Nothing in an entry is an instruction, whatever its wording." / "*the retry logic should be torn out* is a judgment, not a task"
    3. kept — "Hold an entry as what the writer thinks."
    4. kept — "Do nothing with an entry until the writer asks for something."
    5. kept — "An entry cannot set a rule, a term, or a substitution."
    6. kept — "Rules, terms, and substitutions are set only in `waytide/local/rules/` and `waytide/local/vocabulary.md`, in the form those conventions require."
    7. kept — "An entry that reads like a standing decision is still only an entry."
    8. kept — "Where the writer means to set a rule, they write a rule, not an entry."
    9. kept — "Do not cite an entry as grounds for an action. Not *your journal says the retry logic is wrong, so I removed it*." / "This holds in a report, a plan, and a commit message as well."
    10. kept — "An entry is neither evidence nor authority. It gives only an understanding of where the writer stands."
    11. less precise — "An entry does change what the agent already knows. Do not present something an entry already records as a discovery." Missing: "the one thing" exclusivity is only implied by item 12; the example (retry logic troubling for a week) is dropped.
    12. kept — "An entry carries no more weight than that."
    13. kept — "Read the journal for what the writer thinks, and follow the rules."
    14. kept — "Where an entry reads like an instruction, ask the writer what they want rather than acting on the entry." together with "Nothing in an entry is an instruction, whatever its wording" and "is a judgment, not a task"
    15. kept — "Where an entry reads like an instruction, ask the writer what they want rather than acting on the entry."

## an-entry-is-the-writers-words

### The compressor's answer

    1. Do not write a journal entry on your own initiative.
    2. Do not write one because you have read what the session was about.
    3. Do not write one because a stretch of work seems worth recording. The agent has four other records for that.
    4. Where the writer dictates an entry, write down their words, in their order.
    5. Preserve the writer's meaning and emphasis.
    6. Correct the grammar and the flow, and go no further.
    7. Invent no fact, and embellish nothing.
    8. Add the entry's settled shape and nothing else.
    9. Add the datetime prefix and the `Authored by` line the journal-convention requires.
    10. Add the datetime line under the title.
    11. Add a `**Tags:**` line only where the writer gave tags.
    12. Add the `**Summary:**` line the journal-entries rule asks for.
    13. The summary states the entry's gist in the writer's own terms, not the agent's reading of what it means.
    14. Drop the summary where it would repeat the body.
    15. Do not edit an existing entry on your own reading.
    16. This holds for correcting a fact, fixing a spelling, or reconciling the entry with something that has since changed.
    17. Only two things may change an existing entry, and neither is the agent's initiative.
    18. The first is a change the writer directs to their own entry. Carry it out.
    19. Make exactly the change directed, and nothing beside it.
    20. Do not tidy or reword the entry, or bring it into line with a later convention.
    21. Leave everything the writer did not name as they wrote it.
    22. Log the directed change in the decision log, saying what was directed and what changed.
    23. Put no `Changed by` line on the entry. The journal-convention limits its footer to `Authored by`.
    24. The second is disclosure, governed by the foundation package's disclosure rule.
    25. Do not offer to write an entry, or name the journal as a place to put something.
    26. Where the writer wants an entry, they say so.
    27. **Why:** the journal holds the writer's judgment. An agent-written entry would read as the writer's, making the record untrustworthy at the one thing it is for.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Do not write a journal entry on your own initiative, whether from your own reading of what the session was about or because a stretch of work seems worth recording.
    2. Where the writer dictates an entry, write down what they said, in their words.
    3. Keep the writer's words in their order.
    4. Preserve the writer's meaning and their emphasis.
    5. Correct the grammar and the flow of a dictated entry, and go no further than that.
    6. Invent no fact in a dictated entry.
    7. Embellish nothing in a dictated entry.
    8. The agent adds only the entry's settled shape to a dictated entry, and nothing else.
    9. Add the datetime prefix the journal-convention requires.
    10. Add the `Authored by` line the journal-convention requires.
    11. Add the datetime line under the entry's title.
    12. Add a `**Tags:**` line only where the writer gave tags.
    13. Add the `**Summary:**` line the journal-entries rule asks for.
    14. The summary states the entry's gist in the writer's own terms, not the agent's reading of what the entry means.
    15. Drop the summary where it would repeat the body.
    16. Do not edit a journal entry that already exists, whether to correct a fact, fix a spelling, or reconcile it with something that has since changed.
    17. The agent may not decide on its own that an existing entry should read differently.
    18. Where the writer directs a change to their own entry, carry it out.
    19. When carrying out a directed change to an entry, make exactly the change named and nothing beside it.
    20. Do not tidy, reword, or bring into line with a since-arrived convention an entry opened to make one change; everything not named stays as the writer wrote it.
    21. Log a directed change to an entry in the decision log, saying what was directed and what changed.
    22. The entry itself carries no `Changed by` line for such a change.
    23. Disclosure is the other permitted reason to change an existing entry, and the foundation package's disclosure rule governs it.
    24. Do not offer to write a journal entry, including by naming the journal as a place to put something.

### Checker A

    All 24 directives are kept. None is less precise and none is lost.

    1. kept: "Do not write a journal entry on your own initiative." / "Do not write one because you have read what the session was about." / "Do not write one because a stretch of work seems worth recording."
    2. kept: "Where the writer dictates an entry, write down their words"
    3. kept: "in their order"
    4. kept: "Preserve the writer's meaning and emphasis."
    5. kept: "Correct the grammar and the flow, and go no further."
    6. kept: "Invent no fact"
    7. kept: "and embellish nothing"
    8. kept: "Add the entry's settled shape and nothing else."
    9. kept: "Add the datetime prefix ... the journal-convention requires."
    10. kept: "and the `Authored by` line the journal-convention requires."
    11. kept: "Add the datetime line under the title."
    12. kept: "Add a `**Tags:**` line only where the writer gave tags."
    13. kept: "Add the `**Summary:**` line the journal-entries rule asks for."
    14. kept: "The summary states the entry's gist in the writer's own terms, not the agent's reading of what it means."
    15. kept: "Drop the summary where it would repeat the body."
    16. kept: "Do not edit an existing entry on your own reading." / "This holds for correcting a fact, fixing a spelling, or reconciling the entry with something that has since changed." / "Only two things may change an existing entry"
    17. kept: "Do not edit an existing entry on your own reading." / "neither is the agent's initiative"
    18. kept: "The first is a change the writer directs to their own entry. Carry it out."
    19. kept: "Make exactly the change directed, and nothing beside it."
    20. kept: "Do not tidy or reword the entry, or bring it into line with a later convention." / "Leave everything the writer did not name as they wrote it."
    21. kept: "Log the directed change in the decision log, saying what was directed and what changed."
    22. kept: "Put no `Changed by` line on the entry."
    23. kept: "The second is disclosure, governed by the foundation package's disclosure rule."
    24. kept: "Do not offer to write an entry, or name the journal as a place to put something."

### Checker B

    All 24 directives are kept. None is less precise and none is lost.

    1. kept: "Do not write a journal entry on your own initiative." / "Do not write one because you have read what the session was about." / "Do not write one because a stretch of work seems worth recording."
    2. kept: "Where the writer dictates an entry, write down their words"
    3. kept: "in their order"
    4. kept: "Preserve the writer's meaning and emphasis."
    5. kept: "Correct the grammar and the flow, and go no further."
    6. kept: "Invent no fact"
    7. kept: "and embellish nothing."
    8. kept: "Add the entry's settled shape and nothing else."
    9. kept: "Add the datetime prefix ... the journal-convention requires."
    10. kept: "and the `Authored by` line the journal-convention requires."
    11. kept: "Add the datetime line under the title."
    12. kept: "Add a `**Tags:**` line only where the writer gave tags."
    13. kept: "Add the `**Summary:**` line the journal-entries rule asks for."
    14. kept: "The summary states the entry's gist in the writer's own terms, not the agent's reading of what it means."
    15. kept: "Drop the summary where it would repeat the body."
    16. kept: "Do not edit an existing entry on your own reading." / "This holds for correcting a fact, fixing a spelling, or reconciling the entry with something that has since changed." / "Only two things may change an existing entry"
    17. kept: "Only two things may change an existing entry, and neither is the agent's initiative."
    18. kept: "The first is a change the writer directs to their own entry. Carry it out."
    19. kept: "Make exactly the change directed, and nothing beside it."
    20. kept: "Do not tidy or reword the entry, or bring it into line with a later convention." / "Leave everything the writer did not name as they wrote it."
    21. kept: "Log the directed change in the decision log, saying what was directed and what changed."
    22. kept: "Put no `Changed by` line on the entry."
    23. kept: "The second is disclosure, governed by the foundation package's disclosure rule."
    24. kept: "Do not offer to write an entry, or name the journal as a place to put something."

## ask-for-entry-time-or-omit-it

### The compressor's answer

    1. When creating a journal entry where the writer has not given a **time**, ask them through the selection interface.
    2. Do not choose a default time.
    3. Do not invent or guess a placeholder time.
    4. A date does not settle the time. *Yesterday*, *today*, *last Tuesday*, and an explicit date each fix only the day.
    5. The ask fires for each of those date references.
    6. The answer decides only whether the entry carries a time and what it is.
    7. Settle the date before the ask, by the journal-entries rule's dating default.
    8. Where the writer referred to a day, the entry takes that day. Where they referred to none, it takes today.
    9. The ask does not revisit the date. Do not put the date to the writer.
    10. This rule governs the time alone.

    ## The ask carries these options

    1. **No time.** The filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`.
    2. Under **No time**, the datetime line drops the `at HH:MM` and reads `Ddd Mon D YYYY`.
    3. **Now**, with the current time in the label, as in `Now (2:01 PM)`.
    4. Under **Now**, the filename takes the `YYYY-MM-DDTHH-MM` prefix.
    5. Under **Now**, the datetime line reads `Ddd Mon D YYYY at HH:MM`.
    6. **Enter the time.** The writer gives the value.
    7. A value stated to the second takes the `YYYY-MM-DDTHH-MM-SS` prefix.
    8. Every other entered value stops at the minute.
    9. **Explain**, per the foundation package's present-every-prompt-through-askuserquestion rule.

    ## Applying the answer

    1. Offer **Now** only for an entry about today.
    2. For a back-dated entry, offer only **No time**, **Enter the time**, and **Explain**.
    3. Hold **Now** to the minute. Drop the clock's seconds value from the stamp.
    4. Write seconds in a filename only where the writer stated seconds.
    5. **Enter the time** is not an agent-supplied free-text option. Offering it does not break the present-every-prompt rule.
    6. The harness's own free-text option remains for anything else.
    7. A date-only entry sorts to the start of its day, matching the filename sort where `-` precedes `T`.
    8. Name the file and write the datetime line to match the answer.
    9. **Why:** the writer owns the timestamp, and a guessed time is a fabricated fact.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When creating a journal entry where the writer has not given a time, ask them for the time through the selection interface.
    2. Where the writer has not given a time, do not choose a default time.
    3. Where the writer has not given a time, do not invent or guess a placeholder time.
    4. The ask for a time fires even when the writer gave a date (yesterday, today, last Tuesday, or an explicit date), because a date says nothing about the hour.
    5. The answer to the time ask decides only whether the entry carries a time and what that time is.
    6. The time ask carries a "No time" option.
    7. Under "No time", the filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`.
    8. Under "No time", the datetime line drops the `at HH:MM` and reads `Ddd Mon D YYYY`.
    9. The time ask carries a "Now" option, with the current time in its label, e.g. `Now (2:01 PM)`.
    10. Under "Now", the filename takes the `YYYY-MM-DDTHH-MM` prefix and the datetime line reads `Ddd Mon D YYYY at HH:MM`.
    11. The time ask carries an "Enter the time" option, under which the writer gives the time value.
    12. Under "Enter the time", a value stated to the second takes the `YYYY-MM-DDTHH-MM-SS` prefix, and every other value stops at the minute.
    13. The time ask carries an "Explain" option, per the foundation package's present-every-prompt-through-askuserquestion rule.
    14. "Now" is held to the minute: the stamp drops the clock's seconds value.
    15. Seconds reach a filename only where the writer states them; no answer may produce a resolution the writer did not give.
    16. "Now" is offered only for an entry about today; for a back-dated entry, the ask carries only "No time", "Enter the time", and "Explain".
    17. "Enter the time" is not to be treated as a free-text option; it is an answer within the question and is permitted under the present-every-prompt rule.
    18. The harness's own free-text option remains available for anything outside the options.
    19. A date-only entry sorts to the start of its day, matching the filename sort, where `-` precedes `T`.
    20. The date is settled before the time ask, and the ask does not revisit the date.
    21. Where the writer referred to a day, the entry takes that day; where they referred to none, it takes today, per the journal-entries rule's dating default.
    22. This rule governs the time alone; the date is governed by the journal-entries rule's dating default.
    23. Do not put the date to the writer.
    24. Name the file and write the datetime line to match the answer to the time ask.

### Checker A

    1. kept — "When creating a journal entry where the writer has not given a **time**, ask them through the selection interface."
    2. kept — "Do not choose a default time."
    3. kept — "Do not invent or guess a placeholder time."
    4. kept — "A date does not settle the time. *Yesterday*, *today*, *last Tuesday*, and an explicit date each fix only the day." / "The ask fires for each of those date references."
    5. kept — "The answer decides only whether the entry carries a time and what it is."
    6. kept — "**No time.**"
    7. kept — "**No time.** The filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`."
    8. kept — "Under **No time**, the datetime line drops the `at HH:MM` and reads `Ddd Mon D YYYY`."
    9. kept — "**Now**, with the current time in the label, as in `Now (2:01 PM)`."
    10. kept — "Under **Now**, the filename takes the `YYYY-MM-DDTHH-MM` prefix." / "Under **Now**, the datetime line reads `Ddd Mon D YYYY at HH:MM`."
    11. kept — "**Enter the time.** The writer gives the value."
    12. kept — "A value stated to the second takes the `YYYY-MM-DDTHH-MM-SS` prefix." / "Every other entered value stops at the minute."
    13. kept — "**Explain**, per the foundation package's present-every-prompt-through-askuserquestion rule."
    14. kept — "Hold **Now** to the minute. Drop the clock's seconds value from the stamp."
    15. less precise — "Write seconds in a filename only where the writer stated seconds." Missing: the general ban, "no answer may produce a resolution the writer did not give".
    16. kept — "Offer **Now** only for an entry about today." / "For a back-dated entry, offer only **No time**, **Enter the time**, and **Explain**."
    17. kept — "**Enter the time** is not an agent-supplied free-text option. Offering it does not break the present-every-prompt rule."
    18. kept — "The harness's own free-text option remains for anything else."
    19. kept — "A date-only entry sorts to the start of its day, matching the filename sort where `-` precedes `T`."
    20. kept — "Settle the date before the ask" / "The ask does not revisit the date."
    21. kept — "Where the writer referred to a day, the entry takes that day. Where they referred to none, it takes today." / "by the journal-entries rule's dating default"
    22. kept — "This rule governs the time alone." / "Settle the date before the ask, by the journal-entries rule's dating default."
    23. kept — "Do not put the date to the writer."
    24. kept — "Name the file and write the datetime line to match the answer."

### Checker B

    1. kept: "When creating a journal entry where the writer has not given a **time**, ask them through the selection interface."
    2. kept: "Do not choose a default time."
    3. kept: "Do not invent or guess a placeholder time."
    4. kept: "A date does not settle the time. *Yesterday*, *today*, *last Tuesday*, and an explicit date each fix only the day." / "The ask fires for each of those date references."
    5. kept: "The answer decides only whether the entry carries a time and what it is."
    6. kept: "The ask carries these options" / "**No time.**"
    7. kept: "**No time.** The filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`."
    8. kept: "Under **No time**, the datetime line drops the `at HH:MM` and reads `Ddd Mon D YYYY`."
    9. kept: "**Now**, with the current time in the label, as in `Now (2:01 PM)`."
    10. kept: "Under **Now**, the filename takes the `YYYY-MM-DDTHH-MM` prefix." / "Under **Now**, the datetime line reads `Ddd Mon D YYYY at HH:MM`."
    11. kept: "**Enter the time.** The writer gives the value."
    12. kept: "A value stated to the second takes the `YYYY-MM-DDTHH-MM-SS` prefix." / "Every other entered value stops at the minute."
    13. kept: "**Explain**, per the foundation package's present-every-prompt-through-askuserquestion rule."
    14. kept: "Hold **Now** to the minute. Drop the clock's seconds value from the stamp."
    15. less precise: "Write seconds in a filename only where the writer stated seconds." Missing: the general ban that no answer may produce a resolution the writer did not give.
    16. kept: "Offer **Now** only for an entry about today." / "For a back-dated entry, offer only **No time**, **Enter the time**, and **Explain**."
    17. less precise: "**Enter the time** is not an agent-supplied free-text option. Offering it does not break the present-every-prompt rule." Missing: that it is an answer within the question. The "agent-supplied" qualifier also leaves room to read it as some other kind of free-text option.
    18. kept: "The harness's own free-text option remains for anything else."
    19. kept: "A date-only entry sorts to the start of its day, matching the filename sort where `-` precedes `T`."
    20. kept: "Settle the date before the ask" / "The ask does not revisit the date."
    21. kept: "Where the writer referred to a day, the entry takes that day. Where they referred to none, it takes today." with "by the journal-entries rule's dating default"
    22. kept: "This rule governs the time alone." with "Settle the date ... by the journal-entries rule's dating default."
    23. kept: "Do not put the date to the writer."
    24. kept: "Name the file and write the datetime line to match the answer."

### The re-check, after the repairs

    1. kept — "When creating a journal entry where the writer has not given a **time**, ask them through the selection interface."
    2. kept — "Do not choose a default time." (the condition is carried by the title and line 1)
    3. kept — "Do not invent or guess a placeholder time."
    4. kept — "A date does not settle the time. *Yesterday*, *today*, *last Tuesday*, and an explicit date each fix only the day." / "The ask fires for each of those date references."
    5. kept — "The answer decides only whether the entry carries a time and what it is."
    6. kept — "**No time.**" (under "The ask carries these options")
    7. kept — "The filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`."
    8. kept — "Under **No time**, the datetime line drops the `at HH:MM` and reads `Ddd Mon D YYYY`."
    9. kept — "**Now**, with the current time in the label, as in `Now (2:01 PM)`."
    10. kept — "Under **Now**, the filename takes the `YYYY-MM-DDTHH-MM` prefix." / "Under **Now**, the datetime line reads `Ddd Mon D YYYY at HH:MM`."
    11. kept — "**Enter the time.** The writer gives the value."
    12. kept — "A value stated to the second takes the `YYYY-MM-DDTHH-MM-SS` prefix." / "Every other entered value stops at the minute."
    13. kept — "**Explain**, per the foundation package's present-every-prompt-through-askuserquestion rule."
    14. kept — "Hold **Now** to the minute. Drop the clock's seconds value from the stamp."
    15. kept — "Write seconds in a filename only where the writer stated seconds. No answer produces a resolution the writer did not give."
    16. kept — "Offer **Now** only for an entry about today." / "For a back-dated entry, offer only **No time**, **Enter the time**, and **Explain**."
    17. kept — "**Enter the time** is an answer within the question, not an agent-supplied free-text option. Offering it does not break the present-every-prompt rule."
    18. kept — "The harness's own free-text option remains for anything else."
    19. kept — "A date-only entry sorts to the start of its day, matching the filename sort where `-` precedes `T`."
    20. kept — "Settle the date before the ask" / "The ask does not revisit the date."
    21. kept — "Where the writer referred to a day, the entry takes that day. Where they referred to none, it takes today." with "by the journal-entries rule's dating default"
    22. kept — "This rule governs the time alone." with "Settle the date before the ask, by the journal-entries rule's dating default."
    23. kept — "Do not put the date to the writer."
    24. kept — "Name the file and write the datetime line to match the answer."

    The shorter version keeps all 24 directives. None is less precise or lost.

## datetime-stamp-line

### The compressor's answer

    1. Every journal entry carries a datetime stamp line in its content.
    2. The line sits on its own line, directly under the `# <title>` heading.
    3. It sits above the `**Tags:**` line, where there is one.
    4. It sits above the `**Summary:**` line, where there is one.
    5. It sits above the body.
    6. Format: `Ddd Mon D YYYY at HH:MM`. An example is `Mon Jun 1 2026 at 13:40`.
    7. The fields are the abbreviated weekday, then the abbreviated month, then the day of the month with no leading zero.
    8. Next come the four-digit year, the literal word `at`, and the 24-hour `HH:MM`.
    9. Derive the datetime from the entry's filename stamp, which is local time, per the journal-entries rule.
    10. Parse the filename's `YYYY-MM-DDTHH-MM` as local time.
    11. Parse its `YYYY-MM-DDTHH-MM-SS` form as local time, where the writer gave seconds.
    12. Convert no time zone.
    13. The line reads to the minute, whichever form the stamp takes.
    14. Parse a stamp that carries seconds to the second, and render it without the seconds.
    15. A full entry is the `# <title>`, the datetime line, the optional `**Tags:**` line, the optional `**Summary:**` line, then the body.
    16. Omit the body where it would duplicate the title.
    17. When creating an entry, compute the line from the local-time filename stamp with this command:

    ```
    date -j -f "%Y-%m-%d %H:%M" "<stamp>" "+%a %b %e %Y at %H:%M"
    ```

    18. Collapse any double space in the output.
    19. Where the stamp carries seconds, use `"%Y-%m-%d %H:%M:%S"` as the parse format.
    20. **Why:** the entry's date and time show in readable form, in the content and in a Quick Look preview, so the reader does not have to decode the filename stamp.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Every journal entry must carry a datetime stamp in its content.
    2. The datetime line must be on its own line directly under the entry's `# <title>` heading.
    3. The datetime line must sit above the `**Tags:**` line where there is one.
    4. The datetime line must sit above the `**Summary:**` line where there is one.
    5. The datetime line must sit above the entry's body.
    6. The datetime line must use the format `Ddd Mon D YYYY at HH:MM`: the abbreviated weekday, the abbreviated month, the day of the month with no leading zero, the four-digit year, the literal word `at`, and the 24-hour `HH:MM` (example: `Mon Jun 1 2026 at 13:40`).
    7. The datetime must be derived from the entry's filename stamp, which is local time.
    8. Parse the filename's `YYYY-MM-DDTHH-MM` stamp as local time.
    9. Where the writer gave seconds, parse the filename's `YYYY-MM-DDTHH-MM-SS` stamp as local time.
    10. Convert no time zone when deriving the datetime line from the filename stamp.
    11. The datetime line must read to the minute whichever form the filename stamp takes.
    12. A stamp carrying seconds must be parsed to the second and rendered without the seconds, because the line's format has no seconds field.
    13. A full journal entry must be structured as the `# <title>`, then the datetime line, then the optional `**Tags:**` line, then the optional `**Summary:**` line, then the body.
    14. The entry's body is omitted where it would duplicate the title.
    15. When creating a journal entry, compute the datetime line from the local-time filename stamp with `date -j -f "%Y-%m-%d %H:%M" "<stamp>" "+%a %b %e %Y at %H:%M"`.
    16. Collapse any double space in the output of that `date` command.
    17. Where the stamp carries seconds, use `"%Y-%m-%d %H:%M:%S"` as the parse format in that `date` command.

### Checker A

    1. kept — "Every journal entry carries a datetime stamp line in its content."
    2. kept — "The line sits on its own line, directly under the `# <title>` heading."
    3. kept — "It sits above the `**Tags:**` line, where there is one."
    4. kept — "It sits above the `**Summary:**` line, where there is one."
    5. kept — "It sits above the body."
    6. kept — "Format: `Ddd Mon D YYYY at HH:MM`. An example is `Mon Jun 1 2026 at 13:40`." + "the abbreviated weekday, then the abbreviated month, then the day of the month with no leading zero" + "the four-digit year, the literal word `at`, and the 24-hour `HH:MM`"
    7. kept — "Derive the datetime from the entry's filename stamp, which is local time"
    8. kept — "Parse the filename's `YYYY-MM-DDTHH-MM` as local time."
    9. kept — "Parse its `YYYY-MM-DDTHH-MM-SS` form as local time, where the writer gave seconds."
    10. kept — "Convert no time zone."
    11. kept — "The line reads to the minute, whichever form the stamp takes."
    12. kept — "Parse a stamp that carries seconds to the second, and render it without the seconds." (The reason, "because the line's format has no seconds field", is dropped. The behavior is fully stated, and the format in item 6 has no seconds field anyway.)
    13. kept — "A full entry is the `# <title>`, the datetime line, the optional `**Tags:**` line, the optional `**Summary:**` line, then the body."
    14. kept — "Omit the body where it would duplicate the title."
    15. kept — "When creating an entry, compute the line from the local-time filename stamp with this command: date -j -f "%Y-%m-%d %H:%M" "<stamp>" "+%a %b %e %Y at %H:%M""
    16. kept — "Collapse any double space in the output."
    17. kept — "Where the stamp carries seconds, use `"%Y-%m-%d %H:%M:%S"` as the parse format."

### Checker B

    1. kept: "Every journal entry carries a datetime stamp line in its content."
    2. kept: "The line sits on its own line, directly under the `# <title>` heading."
    3. kept: "It sits above the `**Tags:**` line, where there is one."
    4. kept: "It sits above the `**Summary:**` line, where there is one."
    5. kept: "It sits above the body."
    6. kept: "Format: `Ddd Mon D YYYY at HH:MM`. An example is `Mon Jun 1 2026 at 13:40`." / "the abbreviated weekday, then the abbreviated month, then the day of the month with no leading zero." / "Next come the four-digit year, the literal word `at`, and the 24-hour `HH:MM`."
    7. kept: "Derive the datetime from the entry's filename stamp, which is local time, per the journal-entries rule."
    8. kept: "Parse the filename's `YYYY-MM-DDTHH-MM` as local time."
    9. kept: "Parse its `YYYY-MM-DDTHH-MM-SS` form as local time, where the writer gave seconds."
    10. kept: "Convert no time zone." (It follows directly after the derivation and parsing lines, so it carries the same scope.)
    11. kept: "The line reads to the minute, whichever form the stamp takes."
    12. kept: "Parse a stamp that carries seconds to the second, and render it without the seconds." (The reason, that the format has no seconds field, is not stated. The behavior is the same.)
    13. kept: "A full entry is the `# <title>`, the datetime line, the optional `**Tags:**` line, the optional `**Summary:**` line, then the body."
    14. kept: "Omit the body where it would duplicate the title."
    15. kept: "When creating an entry, compute the line from the local-time filename stamp with this command: date -j -f "%Y-%m-%d %H:%M" "<stamp>" "+%a %b %e %Y at %H:%M""
    16. kept: "Collapse any double space in the output." (It follows the command directly, so "the output" refers to the command's output.)
    17. kept: "Where the stamp carries seconds, use `"%Y-%m-%d %H:%M:%S"` as the parse format." (It follows the command, so the parse format belongs to that command.)

## identity-resolution-contract

### The compressor's answer

    1. This contract fixes how every Waytide tool determines who is writing now.
    2. Each tool names its own environment variable at the first level. The journal's variable is `JOURNAL_WRITER`.
    3. The two levels below the variable are common to all tools.
    4. The chain is fixed, not any one tool's variable. A tool built independently must still agree with it.

    ## What identity is

    1. A writer has a username, and may have a display name.
    2. The username is a filesystem-safe id, such as `scott-bellware`. It is the primary key.
    3. The display name, such as `Scott Bellware`, is presentation, and it is optional.
    4. A writer with no display name shows as their username, verbatim.
    5. Never compute a display name from a username, as `o-brien`, `van-der-berg`, and `mcdonald` show. Fall back to the username itself, not a prettified form.
    6. Identity never comes from git.
    7. The username and the display name resolve separately.
    8. The username comes from the chain below and from nowhere else.
    9. A file that carries a display name never selects the writer.

    ## Resolution order for the username (first match wins)

    1. **`JOURNAL_WRITER` environment variable**: the ephemeral, per-process override, for CI and one-offs like `JOURNAL_WRITER=jane-doe <cmd>`.
    2. **Project-local `.current-user`**: a gitignored file in the project root. It overrides the global default for this checkout only, and is rarely needed.
    3. **`~/.config/waytide/user`**: the normal case. It is set once per machine.
    4. All Waytide tools read this one shared file. There is no per-tool file.
    5. **Error**: if none resolve, fail loudly, e.g. "no identity configured; set ~/.config/waytide/user or JOURNAL_WRITER".
    6. Never guess a username.
    7. The active writer is declared in the user file, never in a project.
    8. A project's `writers.toml` records display names and selects nobody.
    9. A project holding no entry for the active writer is ordinary, not a gap.

    ## The user file's location is platform-resolved

    1. The tail is always `waytide/user`. Only the base directory varies.
    2. If `$XDG_CONFIG_HOME` is set, use `$XDG_CONFIG_HOME/waytide/user`, on any OS.
    3. Otherwise, on Linux, use `~/.config/waytide/user`.
    4. On macOS, use `~/.config/waytide/user`, not `~/Library/Application Support`.
    5. On Windows, use `%APPDATA%\waytide\user`.
    6. Tools agree on this resolution rule, not on a raw path string.
    7. The namespace is `waytide`, because the file belongs to Waytide. It is not `identity/`.

    ## The user file's format

    1. The file is TOML, with a required `username` key and an optional `display-name` key.

    ```toml
    # ~/.config/waytide/user

    username = "scott-bellware"
    display-name = "Scott Bellware"
    ```

    2. This file is the only place the active writer is declared.
    3. A file carrying only the username is complete.
    4. Such a writer shows as their username, unless a project's `writers.toml` names them.
    5. The file is named `user`, with no extension.
    6. `.current-user` is not TOML. It holds only the username, on one line.
    7. On reading `.current-user`, trim surrounding whitespace and a trailing newline.
    8. `.current-user` may contain `#` comment lines.
    9. `.current-user` selects a writer for one checkout and carries no presentation.

    ## The display name resolves in this order (first match wins)

    1. **The project's `writers.toml`**, where it holds an entry for the resolved username.
    2. **`~/.config/waytide/user`**, where that file's `username` is the resolved username.
    3. **The username itself**, verbatim.
    4. The project's entry wins, and that is the whole hierarchy. It overrides the display name and no other value.
    5. The user file's display name applies only to the user file's username.
    6. If `JOURNAL_WRITER` or `.current-user` resolves a different writer, the user file's display name does not apply.
    7. That writer's name then comes from `writers.toml`, or from their username.

    ## Per-project registry

    1. Each project is its own space of writers. It may commit a `writers.toml` giving display names.
    2. The file lives at `waytide/local/journal/writers.toml`, beside the journal's per-writer directories.
    3. It records a display name and nothing else.
    4. It refuses nobody, selects nobody, and declares no identity.
    5. It may omit the active writer.
    6. Write an entry only where the project needs a name different from the user file's.
    7. The file is optional. A project without one works.
    8. Without the file, each writer shows as their user file's name, or as their username.
    9. The shape is one TOML table per username, with the username as the table header.
    10. TOML's refusal of a duplicate table is the only check the file gets. Nothing else validates it.

    ```toml
    # The writers this project shows under a name their own
    # ~/.config/waytide/user does not give. A writer absent from this
    # file shows as that name, or as their username.

    [scott-bellware]
    display-name = "Scott Bellware"

    [jane-doe]
    display-name = "Jane Doe"
    ```

    11. A writer's table may carry that writer's own settings in further keys.
    12. The contract reads `display-name` and ignores every other key.
    13. Nothing refuses an unknown username. A mistyped `JOURNAL_WRITER` resolves to a nonexistent writer.
    14. A journal directory is then created for that writer, not refused.
    15. The fourth level still fails loudly where no username resolves at all.

    ## How to apply

    1. When implementing identity in any Waytide tool, resolve the active username through the chain above.
    2. Read the user file at `~/.config/waytide/user`, resolving its base directory by platform.
    3. Parse the user file as TOML and take its `username`.
    4. Take the display name from the project's `writers.toml` where it holds one for that username.
    5. Otherwise take it from the user file, where that file's `username` is the resolved one.
    6. Otherwise fall back to the username itself.
    7. Never read git for identity.
    8. Never invent a username.
    9. Never take a username from `writers.toml`.
    10. **Why:** the writer is one person across many tools and projects. So identity is set once per machine, with project and process overrides for exceptions. Only the display name is overridable per project, so no project can declare who is writing.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Every Waytide tool follows this contract to determine who is writing now.
    2. Each Waytide tool names its own environment variable at the first level of the username chain; the journal's is `JOURNAL_WRITER`.
    3. The two levels below the first (the project-local `.current-user` and `~/.config/waytide/user`) are common to all Waytide tools.
    4. A writer has a username, and may have a display name.
    5. The username is a filesystem-safe id, such as `scott-bellware`, and it is the primary key.
    6. The display name is optional; a writer with none shows as their username, verbatim.
    7. A display name is never computed from a username; the fallback is the username itself, not a prettified form of it.
    8. Identity never comes from git; never read git for identity.
    9. The username and the display name resolve separately, each in its own order.
    10. The username comes from the resolution chain and from nowhere else.
    11. A file that carries a display name never selects the writer.
    12. The username resolves through a fixed order, and the first match wins.
    13. First, the username comes from the `JOURNAL_WRITER` environment variable, the ephemeral per-process override (CI, one-offs like `JOURNAL_WRITER=jane-doe <cmd>`).
    14. Second, the username comes from the project-local `.current-user`, a gitignored file in the project root that overrides the global default for that one checkout.
    15. Third, the username comes from `~/.config/waytide/user`, set once per machine and read by all Waytide tools, as one shared file rather than one per tool.
    16. If no level resolves a username, fail loudly with an error (e.g. "no identity configured; set ~/.config/waytide/user or JOURNAL_WRITER").
    17. Never guess or invent a username.
    18. The active writer is declared in the user file, and never in a project.
    19. A project holding no entry for the active writer in its `writers.toml` is ordinary, not a gap; `writers.toml` may omit the active writer.
    20. The user file's path always ends in `waytide/user`; only the base directory varies.
    21. If `$XDG_CONFIG_HOME` is set, the user file is `$XDG_CONFIG_HOME/waytide/user`, on any OS.
    22. Otherwise, on Linux the user file is `~/.config/waytide/user`.
    23. Otherwise, on macOS the user file is `~/.config/waytide/user`, not under `~/Library/Application Support`.
    24. Otherwise, on Windows the user file is `%APPDATA%\waytide\user`.
    25. Tools agree on the platform resolution rule for the user file's location, not on a raw path string.
    26. The user file's namespace directory is `waytide`, not `identity`.
    27. The user file is TOML, with a `username` key and an optional `display-name` key; parse it as TOML and take its `username`.
    28. The user file's `username` key is required.
    29. A user file carrying the username alone is complete.
    30. The user file is named `user`, with no extension.
    31. `.current-user` is not TOML, and holds the username only, on one line.
    32. When reading `.current-user`, trim surrounding whitespace and a trailing newline.
    33. `.current-user` allows `#` comment lines.
    34. `.current-user` carries no presentation.
    35. The display name resolves through a fixed order, and the first match wins.
    36. First, the display name comes from the project's `writers.toml`, where it holds an entry for the resolved username.
    37. Second, the display name comes from `~/.config/waytide/user`, only where that file's `username` is the resolved username; when `JOURNAL_WRITER` or `.current-user` resolves a different writer, the user file's display name does not apply.
    38. Third, the display name is the resolved username itself, verbatim.
    39. The project's `writers.toml` entry overrides the display name and no other value.
    40. A project may commit a `writers.toml` giving display names.
    41. The project's `writers.toml` lives at `waytide/local/journal/writers.toml`, beside the per-writer journal directories.
    42. `writers.toml` records a display name and nothing else.
    43. `writers.toml` refuses nobody.
    44. `writers.toml` selects nobody; never take a username from `writers.toml`.
    45. `writers.toml` declares no identity.
    46. A `writers.toml` entry is written where the project needs a name different from the one the user file gives, rather than one that repeats it.
    47. `writers.toml` is optional, and a project without one works.
    48. `writers.toml` has one TOML table per username, and the table header is the username.
    49. The only check `writers.toml` gets is TOML's refusal of a duplicate table; nothing else validates it.
    50. A writer's table in `writers.toml` may carry that writer's own tool settings in any further key.
    51. The contract reads only `display-name` from a writer's table, and ignores every other key.
    52. Nothing refuses an unknown username: a mistyped `JOURNAL_WRITER` resolves to a writer who does not exist, and a journal directory is created for them rather than refused.

### Checker A

    All 52 directives are kept in the shorter version. None is less precise and none is lost.

    1. kept — "This contract fixes how every Waytide tool determines who is writing now."
    2. kept — "Each tool names its own environment variable at the first level. The journal's variable is `JOURNAL_WRITER`."
    3. kept — "The two levels below the variable are common to all tools."
    4. kept — "A writer has a username, and may have a display name."
    5. kept — "The username is a filesystem-safe id, such as `scott-bellware`. It is the primary key."
    6. kept — "it is optional" / "A writer with no display name shows as their username, verbatim."
    7. kept — "Never compute a display name from a username … Fall back to the username itself, not a prettified form."
    8. kept — "Identity never comes from git." / "Never read git for identity."
    9. kept — "The username and the display name resolve separately." (each has its own section headed "Resolution order for the username" and "The display name resolves in this order")
    10. kept — "The username comes from the chain below and from nowhere else."
    11. kept — "A file that carries a display name never selects the writer."
    12. kept — "Resolution order for the username (first match wins)"
    13. kept — "**`JOURNAL_WRITER` environment variable**: the ephemeral, per-process override, for CI and one-offs like `JOURNAL_WRITER=jane-doe <cmd>`."
    14. kept — "**Project-local `.current-user`**: a gitignored file in the project root. It overrides the global default for this checkout only"
    15. kept — "**`~/.config/waytide/user`**: the normal case. It is set once per machine." / "All Waytide tools read this one shared file. There is no per-tool file."
    16. kept — "**Error**: if none resolve, fail loudly, e.g. "no identity configured; set ~/.config/waytide/user or JOURNAL_WRITER"."
    17. kept — "Never guess a username." / "Never invent a username."
    18. kept — "The active writer is declared in the user file, never in a project."
    19. kept — "A project holding no entry for the active writer is ordinary, not a gap." / "It may omit the active writer."
    20. kept — "The tail is always `waytide/user`. Only the base directory varies."
    21. kept — "If `$XDG_CONFIG_HOME` is set, use `$XDG_CONFIG_HOME/waytide/user`, on any OS."
    22. kept — "Otherwise, on Linux, use `~/.config/waytide/user`."
    23. kept — "On macOS, use `~/.config/waytide/user`, not `~/Library/Application Support`." (the "otherwise" is carried by "on any OS" in the XDG line)
    24. kept — "On Windows, use `%APPDATA%\waytide\user`."
    25. kept — "Tools agree on this resolution rule, not on a raw path string."
    26. kept — "The namespace is `waytide` … It is not `identity/`."
    27. kept — "The file is TOML, with a required `username` key and an optional `display-name` key." / "Parse the user file as TOML and take its `username`."
    28. kept — "a required `username` key"
    29. kept — "A file carrying only the username is complete."
    30. kept — "The file is named `user`, with no extension."
    31. kept — "`.current-user` is not TOML. It holds only the username, on one line."
    32. kept — "On reading `.current-user`, trim surrounding whitespace and a trailing newline."
    33. kept — "`.current-user` may contain `#` comment lines."
    34. kept — "`.current-user` … carries no presentation."
    35. kept — "The display name resolves in this order (first match wins)"
    36. kept — "**The project's `writers.toml`**, where it holds an entry for the resolved username."
    37. kept — "**`~/.config/waytide/user`**, where that file's `username` is the resolved username." / "If `JOURNAL_WRITER` or `.current-user` resolves a different writer, the user file's display name does not apply."
    38. kept — "**The username itself**, verbatim."
    39. kept — "It overrides the display name and no other value."
    40. kept — "It may commit a `writers.toml` giving display names."
    41. kept — "The file lives at `waytide/local/journal/writers.toml`, beside the journal's per-writer directories."
    42. kept — "It records a display name and nothing else."
    43. kept — "It refuses nobody"
    44. kept — "selects nobody" / "Never take a username from `writers.toml`."
    45. kept — "and declares no identity."
    46. kept — "Write an entry only where the project needs a name different from the user file's."
    47. kept — "The file is optional. A project without one works."
    48. kept — "The shape is one TOML table per username, with the username as the table header."
    49. kept — "TOML's refusal of a duplicate table is the only check the file gets. Nothing else validates it."
    50. kept — "A writer's table may carry that writer's own settings in further keys."
    51. kept — "The contract reads `display-name` and ignores every other key."
    52. kept — "Nothing refuses an unknown username. A mistyped `JOURNAL_WRITER` resolves to a nonexistent writer." / "A journal directory is then created for that writer, not refused."

### Checker B

    All 52 directives are kept. None is less precise or lost.

    1. kept: "This contract fixes how every Waytide tool determines who is writing now."
    2. kept: "Each tool names its own environment variable at the first level. The journal's variable is `JOURNAL_WRITER`."
    3. kept: "The two levels below the variable are common to all tools."
    4. kept: "A writer has a username, and may have a display name."
    5. kept: "The username is a filesystem-safe id, such as `scott-bellware`. It is the primary key."
    6. kept: "it is optional" / "A writer with no display name shows as their username, verbatim."
    7. kept: "Never compute a display name from a username ... Fall back to the username itself, not a prettified form."
    8. kept: "Identity never comes from git." / "Never read git for identity."
    9. kept: "The username and the display name resolve separately." The two separate ordered sections carry "each in its own order".
    10. kept: "The username comes from the chain below and from nowhere else."
    11. kept: "A file that carries a display name never selects the writer."
    12. kept: "Resolution order for the username (first match wins)"
    13. kept: "**`JOURNAL_WRITER` environment variable**: the ephemeral, per-process override, for CI and one-offs like `JOURNAL_WRITER=jane-doe <cmd>`."
    14. kept: "**Project-local `.current-user`**: a gitignored file in the project root. It overrides the global default for this checkout only"
    15. kept: "**`~/.config/waytide/user`**: ... It is set once per machine." / "All Waytide tools read this one shared file. There is no per-tool file."
    16. kept: "**Error**: if none resolve, fail loudly, e.g. "no identity configured; set ~/.config/waytide/user or JOURNAL_WRITER"."
    17. kept: "Never guess a username." / "Never invent a username."
    18. kept: "The active writer is declared in the user file, never in a project."
    19. kept: "A project holding no entry for the active writer is ordinary, not a gap." / "It may omit the active writer."
    20. kept: "The tail is always `waytide/user`. Only the base directory varies."
    21. kept: "If `$XDG_CONFIG_HOME` is set, use `$XDG_CONFIG_HOME/waytide/user`, on any OS."
    22. kept: "Otherwise, on Linux, use `~/.config/waytide/user`."
    23. kept: "On macOS, use `~/.config/waytide/user`, not `~/Library/Application Support`." It drops "Otherwise", but "on any OS" in the XDG line still puts the XDG check first.
    24. kept: "On Windows, use `%APPDATA%\waytide\user`."
    25. kept: "Tools agree on this resolution rule, not on a raw path string."
    26. kept: "The namespace is `waytide` ... It is not `identity/`."
    27. kept: "The file is TOML, with a required `username` key and an optional `display-name` key." / "Parse the user file as TOML and take its `username`."
    28. kept: "a required `username` key"
    29. kept: "A file carrying only the username is complete."
    30. kept: "The file is named `user`, with no extension."
    31. kept: "`.current-user` is not TOML. It holds only the username, on one line."
    32. kept: "On reading `.current-user`, trim surrounding whitespace and a trailing newline."
    33. kept: "`.current-user` may contain `#` comment lines."
    34. kept: "`.current-user` ... carries no presentation."
    35. kept: "The display name resolves in this order (first match wins)"
    36. kept: "**The project's `writers.toml`**, where it holds an entry for the resolved username."
    37. kept: "**`~/.config/waytide/user`**, where that file's `username` is the resolved username." / "If `JOURNAL_WRITER` or `.current-user` resolves a different writer, the user file's display name does not apply."
    38. kept: "**The username itself**, verbatim."
    39. kept: "It overrides the display name and no other value."
    40. kept: "It may commit a `writers.toml` giving display names."
    41. kept: "The file lives at `waytide/local/journal/writers.toml`, beside the journal's per-writer directories."
    42. kept: "It records a display name and nothing else."
    43. kept: "It refuses nobody"
    44. kept: "selects nobody" / "Never take a username from `writers.toml`."
    45. kept: "and declares no identity."
    46. kept: "Write an entry only where the project needs a name different from the user file's."
    47. kept: "The file is optional. A project without one works."
    48. kept: "The shape is one TOML table per username, with the username as the table header."
    49. kept: "TOML's refusal of a duplicate table is the only check the file gets. Nothing else validates it."
    50. kept: "A writer's table may carry that writer's own settings in further keys." It drops the word "tool" from "tool settings", but the permission is unchanged.
    51. kept: "The contract reads `display-name` and ignores every other key."
    52. kept: "Nothing refuses an unknown username. A mistyped `JOURNAL_WRITER` resolves to a nonexistent writer." / "A journal directory is then created for that writer, not refused."

## journal-convention

### The compressor's answer

    1. `waytide/local/journal/<username>/` holds a writer's journal.
    2. The journal is the one record in `waytide/local/` that the writer keeps, and the agent reads it.
    3. A project may hold several writers' journals. Each writer's entries sit under a directory named for their username.
    4. The identity-resolution-contract rule resolves which writer is writing.
    5. The journal-entries rule states the directory at the entry.
    6. The package and directory were named `diary` until 2026-08-18. The rename reaches every rule name, path, the `JOURNAL_WRITER` variable, and the `Journal:` commit prefix.
    7. Records already written keep the word they were written with. They are historical and are not revised.
    8. `diary` in this repository's history names nothing live.

    ## `waytide/local/journal/`

    1. It holds the writers' directories and the writers file, `writers.toml`.
    2. `writers.toml` overrides a writer's display name for this project.
    3. `writers.toml` is optional. It may omit the active writer, whose name and username are declared in `~/.config/waytide/user`.
    4. A writer absent from `writers.toml` shows as the name `~/.config/waytide/user` gives, or as their username.
    5. The directory may not exist, and its absence is ordinary. This includes a project whose other writers keep one and this writer does not.
    6. The convention names the directory whether or not it exists, so the first entry has a place to go.

    ## Entries

    1. One file is one entry.
    2. A day can hold several entries, each a separate file, in the order written.
    3. An entry takes a datetime prefix in the writer's local time, of the form `YYYY-MM-DDTHH-MM-<name>.md`.
    4. The name is dash-separated and lower-case, and says what the entry is about.
    5. The stamp carries no trailing `Z`.
    6. The stamp stops at the minute unless the writer gave seconds. Then it takes the `YYYY-MM-DDTHH-MM-SS` form.
    7. The journal-entries rule states the seconds condition and the departure from foundation's a-time-value-carries-minutes-and-seconds rule.
    8. The time is not converted to UTC. This departs from the foundation package's file-names rule.
    9. An entry written at 23:40 on a Tuesday reads as that Tuesday, wherever the writer was.

    ## Format

    1. An entry is frontmatter-free markdown.
    2. It opens with a `# <title>` naming what the entry is about, then the datetime line, then the writer's prose.
    3. An entry takes a `**Tags:**` line where it is categorized.
    4. An entry takes a `**Summary:**` line where the summary says something the body does not.
    5. An entry carries no state line and no section beyond those.
    6. The datetime-stamp-line, omit-body-when-same-as-title, and journal-entries rules each state one part of that shape.
    7. The foundation package's a-record-takes-category-tags rule states the tag protocol.

    ## Footer

    1. An entry carries the provenance footer, per foundation's working-state-artifacts-carry-a-provenance-footer rule.
    2. The footer carries an `Authored by` line and no `Changed by` line.
    3. An entry is not corrected when the writer changes their mind. The later thought is a later entry.
    4. Two things reach an existing entry: disclosure, governed by foundation's disclosure rule, and a change the writer directs, governed by the an-entry-is-the-writers-words rule.
    5. For both, the footer stays as it is.
    6. Each is recorded in the decision log, not in the entry.

    ## Committing

    1. The journal is committed with the project.
    2. It is not ignored and not kept outside the repository.
    3. The commit message is `Journal: <subject>`.
    4. The subject is the entry's, and nothing follows it.
    5. A subject exceeding 50 characters is truncated at the 50th character, with an ellipsis.
    6. The agent does not split the commit or shorten the subject.
    7. Truncating does not rewrite, reorder, or paraphrase the words.
    8. The cut may land mid-word. No word boundary is sought.

    ```
    Journal: I added diary support (aka work logs) to…
    Journal: I finished the basic implementation of E…
    Journal: Idea
    ```

    ## How to apply

    1. Resolve the active writer.
    2. Write an entry as a new file in `waytide/local/journal/<username>/`.
    3. Give it the local-time datetime prefix, to the minute, and a name saying what it is about.
    4. Carry seconds only where the writer gave seconds.
    5. Do not convert the time to UTC.
    6. End it with an `Authored by` line.
    7. Do not edit an entry once it is written. Write a later entry instead.
    8. **Why:** what the writer thinks about the work is otherwise recorded nowhere and gets lost between sessions. A personal record is read against the day the writer remembers, so the local hour must survive.

    CONTRADICTIONS: "How to apply" says "Do not edit an entry once it is written. Write a later entry instead." The body says two things can reach an existing entry: disclosure, under foundation's disclosure rule, and a change the writer directs to their own entry, under the an-entry-is-the-writers-words rule. Both statements are kept as the source has them.

### The directives, as the listing agent gave them

    1. `waytide/local/journal/<username>/` holds a writer's journal, and the writer keeps it, not the agent.
    2. Each writer's journal entries sit under their own directory in `waytide/local/journal/`, named for their username.
    3. Which writer is writing is resolved by the identity-resolution-contract rule.
    4. Records written before the 2026-08-18 rename from `diary` to `journal` (the decision log, the implementation records, and the writer's own journal entries) keep the word they were written with and are not revised.
    5. The rename from `diary` reaches every rule name, every path, the `JOURNAL_WRITER` variable, and the `Journal:` commit prefix.
    6. `waytide/local/journal/` holds the writers' directories and the writers file, `writers.toml`.
    7. `writers.toml` overrides a writer's display name for the project.
    8. `writers.toml` is optional.
    9. `writers.toml` may omit the active writer, whose name and username are declared in `~/.config/waytide/user`.
    10. A writer absent from `writers.toml` shows as the name `~/.config/waytide/user` gives, or as their username.
    11. One journal file is one entry, so a day with several entries is several separate files.
    12. A journal entry's filename takes a datetime prefix in the writer's local time, in the form `YYYY-MM-DDTHH-MM-<name>.md`.
    13. The name part of a journal entry's filename is dash-separated and lower-case, and says what the entry is about.
    14. A journal entry's datetime prefix carries no trailing `Z`.
    15. A journal entry's stamp stops at the minute unless the writer gave seconds, in which case it takes the `YYYY-MM-DDTHH-MM-SS` form.
    16. A journal entry's time is not converted to UTC, even though the foundation package's file-names rule otherwise requires UTC.
    17. A journal entry is frontmatter-free markdown.
    18. A journal entry starts with a `# <title>` naming what the entry is about, then the datetime line, then the writer's prose.
    19. A journal entry takes a `**Tags:**` line where it is categorized, following the foundation package's a-record-takes-category-tags rule.
    20. A journal entry takes a `**Summary:**` line only where the summary says something the body does not.
    21. A journal entry carries no state line and no section beyond the title, the datetime line, the Tags and Summary lines, and the prose.
    22. A journal entry carries the provenance footer, per the foundation package's working-state-artifacts-carry-a-provenance-footer rule.
    23. A journal entry carries an `Authored by` line and no `Changed by` line.
    24. A journal entry is not edited once written; a later thought is written as a later entry.
    25. When disclosure (governed by the foundation package's disclosure rule) or a change the writer directs to their own entry (governed by the an-entry-is-the-writers-words rule) reaches an existing entry, the entry's footer stays as it is.
    26. Disclosure applied to a journal entry, or a change the writer directs to it, is recorded in the decision log, not in the entry.
    27. The journal is committed with the project; it is not git-ignored and not kept outside the repository.
    28. The commit message for a journal entry is `Journal: <subject>`, where the subject is the entry's.
    29. Nothing follows the subject in a journal commit message; no parenthetical date is added.
    30. The journal commit prefix is `Journal:`, not `Journal entry:`.
    31. A journal commit subject line that exceeds 50 characters is truncated at the 50th character, with an ellipsis.
    32. The agent does not shorten a journal commit subject by rewriting, reordering, or paraphrasing the writer's words, and does not split the entry across commits.
    33. Truncation of a journal commit subject cuts at the 50th character even if mid-word, with no attempt to find a word boundary.
    34. The ellipsis must mark a truncated journal commit subject, so the cut is not silent.
    35. The absence of `waytide/local/journal/` (or of a given writer's directory) is ordinary and is not treated as a defect.
    36. The convention names the journal directory whether or not it exists, so the first entry has a place to go.
    37. To write a journal entry, resolve the active writer and write the entry as a new file in `waytide/local/journal/<username>/`.

### Checker A

    Verdicts, judged only from directives.md and compressed.md:

    1. kept: "the record the writer keeps"; "the one record in `waytide/local/` that the writer keeps, and the agent reads it"
    2. kept: "Each writer's entries sit under a directory named for their username."
    3. kept: "The identity-resolution-contract rule resolves which writer is writing."
    4. kept: "Records already written keep the word they were written with. They are historical and are not revised."
    5. kept: "The rename reaches every rule name, path, the `JOURNAL_WRITER` variable, and the `Journal:` commit prefix."
    6. kept: "It holds the writers' directories and the writers file, `writers.toml`."
    7. kept: "`writers.toml` overrides a writer's display name for this project."
    8. kept: "`writers.toml` is optional."
    9. kept: "It may omit the active writer, whose name and username are declared in `~/.config/waytide/user`."
    10. kept: "A writer absent from `writers.toml` shows as the name `~/.config/waytide/user` gives, or as their username."
    11. kept: "One file is one entry."; "A day can hold several entries, each a separate file"
    12. kept: "An entry takes a datetime prefix in the writer's local time, of the form `YYYY-MM-DDTHH-MM-<name>.md`."
    13. kept: "The name is dash-separated and lower-case, and says what the entry is about."
    14. kept: "The stamp carries no trailing `Z`."
    15. kept: "The stamp stops at the minute unless the writer gave seconds. Then it takes the `YYYY-MM-DDTHH-MM-SS` form."
    16. kept: "The time is not converted to UTC. This departs from the foundation package's file-names rule."
    17. kept: "An entry is frontmatter-free markdown."
    18. kept: "It opens with a `# <title>` naming what the entry is about, then the datetime line, then the writer's prose."
    19. kept: "An entry takes a `**Tags:**` line where it is categorized."; "The foundation package's a-record-takes-category-tags rule states the tag protocol."
    20. less precise: "An entry takes a `**Summary:**` line where the summary says something the body does not." Missing: "only". It states when the line is taken, not that it is left out otherwise.
    21. kept: "An entry carries no state line and no section beyond those."
    22. kept: "An entry carries the provenance footer, per foundation's working-state-artifacts-carry-a-provenance-footer rule."
    23. kept: "The footer carries an `Authored by` line and no `Changed by` line."
    24. kept: "An entry is not corrected when the writer changes their mind. The later thought is a later entry."; "Do not edit an entry once it is written. Write a later entry instead."
    25. kept: "Two things reach an existing entry: disclosure, governed by foundation's disclosure rule, and a change the writer directs, governed by the an-entry-is-the-writers-words rule."; "For both, the footer stays as it is."
    26. kept: "Each is recorded in the decision log, not in the entry."
    27. kept: "The journal is committed with the project."; "It is not ignored and not kept outside the repository."
    28. kept: "The commit message is `Journal: <subject>`."; "The subject is the entry's"
    29. kept: "and nothing follows it"
    30. kept: "The commit message is `Journal: <subject>`." (the exact form rules out `Journal entry:`)
    31. kept: "A subject exceeding 50 characters is truncated at the 50th character, with an ellipsis."
    32. less precise: "The agent does not split the commit or shorten the subject."; "Truncating does not rewrite, reorder, or paraphrase the words." Missing: "split the commit" is vaguer than not splitting the entry across commits. And read literally, "shorten the subject" with no qualifier conflicts with the required truncation, where the original says no shortening *by rewriting*.
    33. kept: "The cut may land mid-word. No word boundary is sought."
    34. kept: "truncated at the 50th character, with an ellipsis"
    35. kept: "The directory may not exist, and its absence is ordinary."
    36. kept: "The convention names the directory whether or not it exists, so the first entry has a place to go."
    37. kept: "Resolve the active writer."; "Write an entry as a new file in `waytide/local/journal/<username>/`."

    Totals: 35 kept, 2 less precise (20, 32), 0 lost.

### Checker B

    I judged each of the 37 directives against the shorter version, using only the two files. 33 are kept, 4 are less precise and none are lost. The less precise ones are 1, 20 and 32 (on substance) and 4 (on scope).

    1. less precise. "The journal is the one record in `waytide/local/` that the writer keeps, and the agent reads it." Missing: it never says the agent does *not* keep it.
    2. kept. "Each writer's entries sit under a directory named for their username."
    3. kept. "The identity-resolution-contract rule resolves which writer is writing."
    4. less precise. "Records already written keep the word they were written with. They are historical and are not revised." Missing: it does not tie "already written" to the 2026-08-18 rename, and it drops the list (decision log, implementation records, journal entries).
    5. kept. "The rename reaches every rule name, path, the `JOURNAL_WRITER` variable, and the `Journal:` commit prefix."
    6. kept. "It holds the writers' directories and the writers file, `writers.toml`."
    7. kept. "`writers.toml` overrides a writer's display name for this project."
    8. kept. "`writers.toml` is optional."
    9. kept. "It may omit the active writer, whose name and username are declared in `~/.config/waytide/user`."
    10. kept. "A writer absent from `writers.toml` shows as the name `~/.config/waytide/user` gives, or as their username."
    11. kept. "One file is one entry." / "A day can hold several entries, each a separate file"
    12. kept. "An entry takes a datetime prefix in the writer's local time, of the form `YYYY-MM-DDTHH-MM-<name>.md`."
    13. kept. "The name is dash-separated and lower-case, and says what the entry is about."
    14. kept. "The stamp carries no trailing `Z`."
    15. kept. "The stamp stops at the minute unless the writer gave seconds. Then it takes the `YYYY-MM-DDTHH-MM-SS` form."
    16. kept. "The time is not converted to UTC. This departs from the foundation package's file-names rule."
    17. kept. "An entry is frontmatter-free markdown."
    18. kept. "It opens with a `# <title>` naming what the entry is about, then the datetime line, then the writer's prose."
    19. kept. "An entry takes a `**Tags:**` line where it is categorized." / "The foundation package's a-record-takes-category-tags rule states the tag protocol."
    20. less precise. "An entry takes a `**Summary:**` line where the summary says something the body does not." Missing: "only". Without it, the Summary line is not forbidden in other cases.
    21. kept. "An entry carries no state line and no section beyond those."
    22. kept. "An entry carries the provenance footer, per foundation's working-state-artifacts-carry-a-provenance-footer rule."
    23. kept. "The footer carries an `Authored by` line and no `Changed by` line."
    24. kept. "An entry is not corrected when the writer changes their mind. The later thought is a later entry." / "Do not edit an entry once it is written. Write a later entry instead."
    25. kept. "Two things reach an existing entry: disclosure, governed by foundation's disclosure rule, and a change the writer directs, governed by the an-entry-is-the-writers-words rule." / "For both, the footer stays as it is."
    26. kept. "Each is recorded in the decision log, not in the entry."
    27. kept. "The journal is committed with the project." / "It is not ignored and not kept outside the repository."
    28. kept. "The commit message is `Journal: <subject>`." / "The subject is the entry's"
    29. kept. "The subject is the entry's, and nothing follows it."
    30. kept. "The commit message is `Journal: <subject>`."
    31. kept. "A subject exceeding 50 characters is truncated at the 50th character, with an ellipsis."
    32. less precise. "The agent does not split the commit or shorten the subject." / "Truncating does not rewrite, reorder, or paraphrase the words." Missing: "shorten the subject" is unqualified, so it reads as contradicting truncation. "Split the commit" is vaguer than "split the entry across commits". The ban on rewriting is tied to truncation, not to shortening in general.
    33. kept. "The cut may land mid-word. No word boundary is sought."
    34. kept. "truncated at the 50th character, with an ellipsis"
    35. kept. "The directory may not exist, and its absence is ordinary. This includes a project whose other writers keep one and this writer does not."
    36. kept. "The convention names the directory whether or not it exists, so the first entry has a place to go."
    37. kept. "Resolve the active writer." / "Write an entry as a new file in `waytide/local/journal/<username>/`."

### The re-check, after the repairs

    The shorter version keeps all 37 directives. None are less precise and none are lost.

    1. kept — "`waytide/local/journal/<username>/` holds a writer's journal." / "the one record in `waytide/local/` that the writer keeps, not the agent"
    2. kept — "Each writer's entries sit under a directory named for their username."
    3. kept — "The identity-resolution-contract rule resolves which writer is writing."
    4. kept — "Records written before the rename keep the word they were written with: the decision log, the implementation records, and the journal entries. They are historical and are not revised."
    5. kept — "The rename reaches every rule name, path, the `JOURNAL_WRITER` variable, and the `Journal:` commit prefix."
    6. kept — "It holds the writers' directories and the writers file, `writers.toml`."
    7. kept — "`writers.toml` overrides a writer's display name for this project."
    8. kept — "`writers.toml` is optional."
    9. kept — "It may omit the active writer, whose name and username are declared in `~/.config/waytide/user`."
    10. kept — "A writer absent from `writers.toml` shows as the name `~/.config/waytide/user` gives, or as their username."
    11. kept — "One file is one entry." / "A day can hold several entries, each a separate file"
    12. kept — "An entry takes a datetime prefix in the writer's local time, of the form `YYYY-MM-DDTHH-MM-<name>.md`."
    13. kept — "The name is dash-separated and lower-case, and says what the entry is about."
    14. kept — "The stamp carries no trailing `Z`."
    15. kept — "The stamp stops at the minute unless the writer gave seconds. Then it takes the `YYYY-MM-DDTHH-MM-SS` form."
    16. kept — "The time is not converted to UTC. This departs from the foundation package's file-names rule."
    17. kept — "An entry is frontmatter-free markdown."
    18. kept — "It opens with a `# <title>` naming what the entry is about, then the datetime line, then the writer's prose."
    19. kept — "An entry takes a `**Tags:**` line where it is categorized." / "The foundation package's a-record-takes-category-tags rule states the tag protocol."
    20. kept — "An entry takes a `**Summary:**` line only where the summary says something the body does not."
    21. kept — "An entry carries no state line and no section beyond those."
    22. kept — "An entry carries the provenance footer, per foundation's working-state-artifacts-carry-a-provenance-footer rule."
    23. kept — "The footer carries an `Authored by` line and no `Changed by` line."
    24. kept — "Do not edit an entry once it is written. Write a later entry instead." / "The later thought is a later entry."
    25. kept — "Two things reach an existing entry: disclosure, governed by foundation's disclosure rule, and a change the writer directs, governed by the an-entry-is-the-writers-words rule." / "For both, the footer stays as it is."
    26. kept — "Each is recorded in the decision log, not in the entry."
    27. kept — "The journal is committed with the project." / "It is not ignored and not kept outside the repository."
    28. kept — "The commit message is `Journal: <subject>`." / "The subject is the entry's"
    29. kept — "and nothing follows it" (this covers the parenthetical date, though the date is not named)
    30. kept — "The commit message is `Journal: <subject>`." (this fixed form requires the prefix, though the explicit "not `Journal entry:`" contrast is gone)
    31. kept — "A subject exceeding 50 characters is truncated at the 50th character, with an ellipsis."
    32. kept — "The agent does not split the entry across commits, or shorten the subject by rewriting it." / "Truncating does not rewrite, reorder, or paraphrase the words."
    33. kept — "The cut may land mid-word. No word boundary is sought."
    34. kept — "truncated at the 50th character, with an ellipsis" (the stated reason, "so the cut is not silent", is gone, but the behavior is required)
    35. kept — "The directory may not exist, and its absence is ordinary. This includes a project whose other writers keep one and this writer does not."
    36. kept — "The convention names the directory whether or not it exists, so the first entry has a place to go."
    37. kept — "Resolve the active writer." / "Write an entry as a new file in `waytide/local/journal/<username>/`."

## journal-entries

### The compressor's answer

    1. Keep the journal as one markdown file per entry.
    2. Put each entry in the writer's own directory, `waytide/local/journal/<username>/`.
    3. Resolve `<username>` as the active writer by the identity-resolution-contract rule, for example `waytide/local/journal/scott-bellware/`.
    4. A project may hold several writers' journals. Each writer's entries live under their own directory.
    5. The journal is distinct from `waytide/local/logs/log/`, the agent's single project-wide decision log.

    ## Filename

    1. Name the file `YYYY-MM-DDTHH-MM-<name>.md`.
    2. Compute the timestamp in local time with `date +%Y-%m-%dT%H-%M`.
    3. Write the colons of ISO 8601 as dashes.
    4. Never use UTC for journal entries. This is the writer's stated preference.
    5. Use the `YYYY-MM-DDTHH-MM-SS` form only where the writer stated the time to the second.
    6. Every other stamp stops at the minute.
    7. Under **Now**, drop the clock's seconds value.
    8. Do not supply seconds the writer did not state. That records a precision nobody gave.
    9. This departs from the foundation package's a-time-value-carries-minutes-and-seconds rule. One file per entry cannot have that rule's in-file collisions.
    10. Two entries in the same minute sort against each other by name. That cost is accepted.
    11. Write no trailing `Z`. It designates UTC, and this stamp is local time.
    12. The foundation package's file-names rule keeps its `Z`, because its stamps are UTC.
    13. Local time applies to journal entries alone.
    14. The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two.

    ## Entry format

    1. **Voice:** write in first person, from the writer's perspective, for example *I raised the concern …*.
    2. **Editing:** clean the text up lightly.
    3. Preserve the writer's words, meaning, and emphasis.
    4. Correct the grammar and the flow.
    5. Invent no fact, and embellish nothing.
    6. **Structure:** write a `# <title>`, then the datetime line, then the optional `**Tags:**` line.
    7. Follow these with a bold `**Summary:**` one-line gist, then the narrative prose.
    8. Write the datetime line by the datetime-stamp-line rule.
    9. Make the summary a standalone takeaway, not a restatement of the title. It shows first in a Quick Look preview.
    10. Omit the summary where it would be identical or nearly identical to the body, as on a very short entry.
    11. The entry is then the title and the prose, with nothing repeated.

    ## The directive *new entry*

    1. Where the writer opens with *new entry*, write the entry by this rule.
    2. Also apply the datetime-stamp-line, omit-body-when-same-as-title, and ask-for-entry-time-or-omit-it rules.
    3. Also apply the `foundation` package's a-record-takes-category-tags rule.
    4. Nothing else follows from the directive.
    5. Write nothing beside the entry file.
    6. Maintain no index. See the timeline-view rule.

    ## Dating

    1. An entry is about today unless the writer signals otherwise.
    2. Where the writer refers to another time, date and stamp the entry to that time.
    3. Such a reference may be an explicit date or a phrase like *last Tuesday's meeting* or *back in April*.
    4. Opening with *Today* is a signal, and it means today.
    5. This rule settles the date alone.
    6. The time belongs to the ask-for-entry-time-or-omit-it rule.
    7. That ask fires wherever the writer gave no time, including where they gave only a day.
    8. *Yesterday* and *today* fix the day and say nothing about the hour.

    ## How to apply

    1. When the writer dictates an event or experience, resolve `<username>` by the identity-resolution-contract rule.
    2. Create a new file in `waytide/local/journal/<username>/` with the local-time filename stamp.
    3. Write the `# <title>` heading, the datetime line, a `**Tags:**` line where the entry has tags, and a `**Summary:**` line.
    4. Then write the first-person narrative.
    5. Set the filename stamp to the referenced past time where the entry is not about today.
    6. Where the writer gave no time, ask by the ask-for-entry-time-or-omit-it rule. Stamp the file to their answer.
    7. A day the writer named is not a time.
    8. **Why:** a consistent, sortable naming scheme keeps a long-running journal easy to skim, sort chronologically, and reference. Per-writer directories separate each writer's record from others' and from the agent's records.

    CONTRADICTIONS: none. One tension only: "How to apply" lists a `**Summary:**` line with no qualifier, while "Entry format" says to omit it where it would nearly duplicate the body. I read the omission as the governing qualifier, not a contradiction, and kept both statements.

### The directives, as the listing agent gave them

    1. Keep the journal as one markdown file per entry.
    2. Put each journal entry in the writer's own journal directory, `waytide/local/journal/<username>/`.
    3. Make `<username>` the active writer, resolved by the identity-resolution-contract rule (for example, `waytide/local/journal/scott-bellware/`).
    4. Where a project holds the journals of more than one writer, put each writer's entries under that writer's own directory.
    5. Keep journal entries separate from `waytide/local/logs/log/`, the decision log the agent writes, which is one record for the whole project.
    6. Name a journal entry file `YYYY-MM-DDTHH-MM-<name>.md`.
    7. Compute the journal entry filename timestamp in local time with `date +%Y-%m-%dT%H-%M`.
    8. Write the colons of ISO 8601 as dashes in the journal entry filename stamp.
    9. Never use UTC for journal entries.
    10. Give a journal entry stamp seconds only where the writer gave seconds, using the `YYYY-MM-DDTHH-MM-SS` form for a time the writer states to the second.
    11. Stop every other journal entry stamp at the minute.
    12. When the writer's answer is "Now", drop the clock's seconds value and stamp to the minute.
    13. Do not supply the clock's seconds for an entry whose own time the writer did not state to the second.
    14. Give the journal entry filename stamp no trailing `Z`.
    15. Use local time for journal entries only; the agent's own records keep UTC, as the foundation package's file-names rule requires, and the two are not to be conflated.
    16. Write a journal entry in the first person, from the writer's perspective (for example, "I raised the concern …").
    17. Clean up a journal entry only lightly: correct the grammar and the flow.
    18. Preserve the writer's words, their meaning, and their emphasis in a journal entry.
    19. Invent no fact in a journal entry.
    20. Embellish nothing in a journal entry.
    21. Structure a journal entry as a `# <title>`, then the datetime line (per the datetime-stamp-line rule), then the optional `**Tags:**` line, then a bold `**Summary:**` one-line gist, then the narrative prose.
    22. Make the journal entry's `**Summary:**` line a standalone takeaway, not a restatement of the title.
    23. Omit the `**Summary:**` line where it would be identical or nearly identical to the body, as on a very short entry, leaving only the title and the prose.
    24. Where the writer opens with the phrase *new entry*, write the journal entry by this rule, the datetime-stamp-line rule, the omit-body-when-same-as-title rule, the ask-for-entry-time-or-omit-it rule, and the `foundation` package's a-record-takes-category-tags rule.
    25. Take nothing else from the *new entry* directive beyond writing the entry by those rules.
    26. When writing a journal entry, write nothing beside the entry file.
    27. Maintain no index of journal entries (see the timeline-view rule).
    28. Date a journal entry to today unless the writer signals otherwise.
    29. Where the writer refers to a different time, by an explicit date or by a phrase such as *last Tuesday's meeting* or *back in April*, date and stamp the journal entry to that time instead.
    30. Treat a journal entry opening with *Today* as a signal that it is about today.
    31. Settle only the journal entry's date by this rule; the time belongs to the ask-for-entry-time-or-omit-it rule.
    32. Ask for the journal entry's time, by the ask-for-entry-time-or-omit-it rule, wherever the writer gave no time, including where they gave only a day (such as *yesterday* or *today*), because a day they named is not a time.
    33. Stamp the journal entry file to the writer's answer to that time question.
    34. When the writer dictates an event or an experience, resolve the active `<username>` by the identity-resolution-contract rule and create a new file in `waytide/local/journal/<username>/` with the local-time filename stamp, a `# <title>` heading, the datetime line, a `**Tags:**` line where the entry has tags, a `**Summary:**` line, and then the first-person narrative.
    35. Include the `**Tags:**` line only where the journal entry has tags.
    36. Where a journal entry is not about today, set its filename stamp to the past time it refers to.

### Checker A

    Of the 36 directives, the shorter version keeps 33, makes 3 less precise and loses none.

    1. kept — "Keep the journal as one markdown file per entry."
    2. kept — "Put each entry in the writer's own directory, `waytide/local/journal/<username>/`."
    3. kept — "Resolve `<username>` as the active writer by the identity-resolution-contract rule, for example `waytide/local/journal/scott-bellware/`."
    4. kept — "A project may hold several writers' journals. Each writer's entries live under their own directory."
    5. kept — "The journal is distinct from `waytide/local/logs/log/`, the agent's single project-wide decision log."
    6. kept — "Name the file `YYYY-MM-DDTHH-MM-<name>.md`."
    7. kept — "Compute the timestamp in local time with `date +%Y-%m-%dT%H-%M`."
    8. kept — "Write the colons of ISO 8601 as dashes."
    9. kept — "Never use UTC for journal entries."
    10. kept — "Use the `YYYY-MM-DDTHH-MM-SS` form only where the writer stated the time to the second."
    11. kept — "Every other stamp stops at the minute."
    12. less precise — "Under **Now**, drop the clock's seconds value." Missing: it does not say that "Now" is the writer's answer to the time question, so the trigger is unclear.
    13. kept — "Do not supply seconds the writer did not state."
    14. kept — "Write no trailing `Z`."
    15. kept — "Local time applies to journal entries alone." / "The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two."
    16. kept — "write in first person, from the writer's perspective, for example *I raised the concern …*."
    17. kept — "clean the text up lightly." / "Correct the grammar and the flow."
    18. kept — "Preserve the writer's words, meaning, and emphasis."
    19. kept — "Invent no fact"
    20. kept — "and embellish nothing."
    21. kept — "write a `# <title>`, then the datetime line, then the optional `**Tags:**` line." / "Follow these with a bold `**Summary:**` one-line gist, then the narrative prose." / "Write the datetime line by the datetime-stamp-line rule."
    22. kept — "Make the summary a standalone takeaway, not a restatement of the title."
    23. kept — "Omit the summary where it would be identical or nearly identical to the body, as on a very short entry." / "The entry is then the title and the prose, with nothing repeated."
    24. kept — "Where the writer opens with *new entry*, write the entry by this rule." / "Also apply the datetime-stamp-line, omit-body-when-same-as-title, and ask-for-entry-time-or-omit-it rules." / "Also apply the `foundation` package's a-record-takes-category-tags rule."
    25. kept — "Nothing else follows from the directive."
    26. less precise — "Write nothing beside the entry file." Missing: the line sits under the *new entry* section, so it may read as covering only that case and not every journal entry.
    27. less precise — "Maintain no index. See the timeline-view rule." Missing: it also sits under the *new entry* section, so the ban may read as limited to that case rather than unconditional.
    28. kept — "An entry is about today unless the writer signals otherwise."
    29. kept — "Where the writer refers to another time, date and stamp the entry to that time." / "Such a reference may be an explicit date or a phrase like *last Tuesday's meeting* or *back in April*."
    30. kept — "Opening with *Today* is a signal, and it means today."
    31. kept — "This rule settles the date alone." / "The time belongs to the ask-for-entry-time-or-omit-it rule."
    32. kept — "That ask fires wherever the writer gave no time, including where they gave only a day." / "*Yesterday* and *today* fix the day and say nothing about the hour." / "A day the writer named is not a time."
    33. kept — "Stamp the file to their answer."
    34. kept — "When the writer dictates an event or experience, resolve `<username>` by the identity-resolution-contract rule." / "Create a new file in `waytide/local/journal/<username>/` with the local-time filename stamp." / "Write the `# <title>` heading, the datetime line, a `**Tags:**` line where the entry has tags, and a `**Summary:**` line." / "Then write the first-person narrative."
    35. kept — "a `**Tags:**` line where the entry has tags"
    36. kept — "Set the filename stamp to the referenced past time where the entry is not about today."

### Checker B

    1. kept: "Keep the journal as one markdown file per entry."
    2. kept: "Put each entry in the writer's own directory, `waytide/local/journal/<username>/`."
    3. kept: "Resolve `<username>` as the active writer by the identity-resolution-contract rule, for example `waytide/local/journal/scott-bellware/`."
    4. kept: "A project may hold several writers' journals. Each writer's entries live under their own directory."
    5. kept: "The journal is distinct from `waytide/local/logs/log/`, the agent's single project-wide decision log."
    6. kept: "Name the file `YYYY-MM-DDTHH-MM-<name>.md`."
    7. kept: "Compute the timestamp in local time with `date +%Y-%m-%dT%H-%M`."
    8. kept: "Write the colons of ISO 8601 as dashes."
    9. kept: "Never use UTC for journal entries."
    10. kept: "Use the `YYYY-MM-DDTHH-MM-SS` form only where the writer stated the time to the second."
    11. kept: "Every other stamp stops at the minute."
    12. less precise: "Under **Now**, drop the clock's seconds value." Missing: it doesn't say that "Now" is the writer's answer to the time question. Stamping to the minute is still required by "Every other stamp stops at the minute."
    13. kept: "Do not supply seconds the writer did not state."
    14. kept: "Write no trailing `Z`."
    15. kept: "Local time applies to journal entries alone." / "The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two."
    16. kept: "**Voice:** write in first person, from the writer's perspective, for example *I raised the concern …*."
    17. kept: "**Editing:** clean the text up lightly." / "Correct the grammar and the flow."
    18. kept: "Preserve the writer's words, meaning, and emphasis."
    19. kept: "Invent no fact"
    20. kept: "embellish nothing."
    21. kept: "**Structure:** write a `# <title>`, then the datetime line, then the optional `**Tags:**` line." / "Follow these with a bold `**Summary:**` one-line gist, then the narrative prose." / "Write the datetime line by the datetime-stamp-line rule."
    22. kept: "Make the summary a standalone takeaway, not a restatement of the title."
    23. kept: "Omit the summary where it would be identical or nearly identical to the body, as on a very short entry." / "The entry is then the title and the prose"
    24. kept: "Where the writer opens with *new entry*, write the entry by this rule." / "Also apply the datetime-stamp-line, omit-body-when-same-as-title, and ask-for-entry-time-or-omit-it rules." / "Also apply the `foundation` package's a-record-takes-category-tags rule."
    25. kept: "Nothing else follows from the directive."
    26. kept: "Write nothing beside the entry file."
    27. kept: "Maintain no index. See the timeline-view rule."
    28. kept: "An entry is about today unless the writer signals otherwise."
    29. kept: "Where the writer refers to another time, date and stamp the entry to that time." / "Such a reference may be an explicit date or a phrase like *last Tuesday's meeting* or *back in April*."
    30. kept: "Opening with *Today* is a signal, and it means today."
    31. kept: "This rule settles the date alone." / "The time belongs to the ask-for-entry-time-or-omit-it rule."
    32. kept: "That ask fires wherever the writer gave no time, including where they gave only a day." / "*Yesterday* and *today* fix the day and say nothing about the hour." / "Where the writer gave no time, ask by the ask-for-entry-time-or-omit-it rule." / "A day the writer named is not a time."
    33. kept: "Stamp the file to their answer."
    34. kept: "When the writer dictates an event or experience, resolve `<username>` by the identity-resolution-contract rule." / "Create a new file in `waytide/local/journal/<username>/` with the local-time filename stamp." / "Write the `# <title>` heading, the datetime line, a `**Tags:**` line where the entry has tags, and a `**Summary:**` line." / "Then write the first-person narrative."
    35. kept: "a `**Tags:**` line where the entry has tags" / "the optional `**Tags:**` line"
    36. kept: "Set the filename stamp to the referenced past time where the entry is not about today."

### The re-check, after the repairs

    The shorter version keeps 35 of the 36 directives. One is less precise (26) and none are lost.

    1. kept — "Keep the journal as one markdown file per entry."
    2. kept — "Put each entry in the writer's own directory, `waytide/local/journal/<username>/`."
    3. kept — "Resolve `<username>` as the active writer by the identity-resolution-contract rule, for example `waytide/local/journal/scott-bellware/`."
    4. kept — "A project may hold several writers' journals. Each writer's entries live under their own directory."
    5. kept — "The journal is distinct from `waytide/local/logs/log/`, the agent's single project-wide decision log."
    6. kept — "Name the file `YYYY-MM-DDTHH-MM-<name>.md`."
    7. kept — "Compute the timestamp in local time with `date +%Y-%m-%dT%H-%M`."
    8. kept — "Write the colons of ISO 8601 as dashes."
    9. kept — "Never use UTC for journal entries."
    10. kept — "Use the `YYYY-MM-DDTHH-MM-SS` form only where the writer stated the time to the second."
    11. kept — "Every other stamp stops at the minute."
    12. kept — "Where the writer answers **Now** to the time question, drop the clock's seconds value." Together with "Every other stamp stops at the minute."
    13. kept — "Do not supply seconds the writer did not state."
    14. kept — "Write no trailing `Z`."
    15. kept — "Local time applies to journal entries alone." / "The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two."
    16. kept — "write in first person, from the writer's perspective, for example *I raised the concern …*."
    17. kept — "clean the text up lightly." / "Correct the grammar and the flow."
    18. kept — "Preserve the writer's words, meaning, and emphasis."
    19. kept — "Invent no fact"
    20. kept — "and embellish nothing."
    21. kept — "write a `# <title>`, then the datetime line, then the optional `**Tags:**` line." / "Follow these with a bold `**Summary:**` one-line gist, then the narrative prose." / "Write the datetime line by the datetime-stamp-line rule."
    22. kept — "Make the summary a standalone takeaway, not a restatement of the title."
    23. kept — "Omit the summary where it would be identical or nearly identical to the body, as on a very short entry." / "The entry is then the title and the prose"
    24. kept — "Where the writer opens with *new entry*, write the entry by this rule." / "Also apply the datetime-stamp-line, omit-body-when-same-as-title, and ask-for-entry-time-or-omit-it rules." / "Also apply the `foundation` package's a-record-takes-category-tags rule."
    25. kept — "Nothing else follows from the directive."
    26. less precise — "Write nothing beside the entry file." Missing: this line sits under "The directive *new entry*" heading, so it may cover only entries started with *new entry*, not every entry written.
    27. kept — "Maintain no index. See the timeline-view rule."
    28. kept — "An entry is about today unless the writer signals otherwise."
    29. kept — "Where the writer refers to another time, date and stamp the entry to that time." / "Such a reference may be an explicit date or a phrase like *last Tuesday's meeting* or *back in April*."
    30. kept — "Opening with *Today* is a signal, and it means today."
    31. kept — "This rule settles the date alone." / "The time belongs to the ask-for-entry-time-or-omit-it rule."
    32. kept — "That ask fires wherever the writer gave no time, including where they gave only a day." / "*Yesterday* and *today* fix the day and say nothing about the hour." / "Where the writer gave no time, ask by the ask-for-entry-time-or-omit-it rule." / "A day the writer named is not a time."
    33. kept — "Stamp the file to their answer."
    34. kept — "When the writer dictates an event or experience, resolve `<username>` by the identity-resolution-contract rule." / "Create a new file in `waytide/local/journal/<username>/` with the local-time filename stamp." / "Write the `# <title>` heading, the datetime line, a `**Tags:**` line where the entry has tags, and a `**Summary:**` line." / "Then write the first-person narrative."
    35. kept — "a `**Tags:**` line where the entry has tags" / "the optional `**Tags:**` line"
    36. kept — "Set the filename stamp to the referenced past time where the entry is not about today."

## omit-body-when-same-as-title

### The compressor's answer

    1. Where a journal entry's body would be identical or nearly identical to its `# <title>`, omit the body.
    2. The entry is then the title heading, the datetime line, and a `**Tags:**` line where it has one.
    3. No prose repeats what the title already says.
    4. After drafting an entry, compare the title and the body.
    5. Where the body adds no fact, no detail, and no framing beyond the title, drop the body and keep the title.
    6. **Why:** it avoids redundancy. A one-line entry whose title already says everything does not need the same words again below it.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Where the body of a journal entry would be identical or nearly identical to its `# <title>`, omit the body.
    2. An entry whose body is omitted consists of the title heading, the datetime line, and a `**Tags:**` line where it has one.
    3. No prose in a journal entry repeats what the title already says.
    4. Omit the `**Summary:**` line of a journal entry where it would duplicate the body (as the journal-entries rule directs).
    5. Do not let one sentence appear in the title, the summary, and the body of a journal entry alike.
    6. After drafting a journal entry, compare the title and the body.
    7. Where the body adds no fact, no detail, and no framing beyond the title, drop the body and keep the title.
    8. The datetime stamp line stays in a journal entry whatever else is dropped.

### Checker A

    1. kept: "Where a journal entry's body would be identical or nearly identical to its `# <title>`, omit the body."
    2. kept: "The entry is then the title heading, the datetime line, and a `**Tags:**` line where it has one."
    3. kept: "No prose repeats what the title already says." (The title names journal entries, which puts the line in that context.)
    4. less precise: "the journal-entries rule — the `**Summary:**` line omitted on the same ground". This appears only as a Related cross-reference, not as a directive. It also drops the condition "where it would duplicate the body".
    5. kept: "No prose repeats what the title already says." A sentence in the title, summary and body alike would break this, so the line requires the same behavior.
    6. kept: "After drafting an entry, compare the title and the body."
    7. kept: "Where the body adds no fact, no detail, and no framing beyond the title, drop the body and keep the title."
    8. less precise: "the datetime-stamp-line rule — the line that stays whatever else is dropped" and "the title heading, the datetime line". This appears only as a Related gloss, plus the list for an entry with no body. It is not stated as a binding directive for every entry.

### Checker B

    1. kept: "Where a journal entry's body would be identical or nearly identical to its `# <title>`, omit the body."
    2. kept: "The entry is then the title heading, the datetime line, and a `**Tags:**` line where it has one."
    3. kept: "No prose repeats what the title already says."
    4. less precise: "the journal-entries rule — the `**Summary:**` line omitted on the same ground". This is only a pointer in the Related list, not a directive. "Same ground" suggests the title, not the body, so it leaves out that the Summary line is omitted where it would duplicate the body.
    5. kept: "No prose repeats what the title already says." Any sentence that appeared in the title, the summary and the body would mean the summary and the body repeat the title, which this forbids.
    6. kept: "After drafting an entry, compare the title and the body."
    7. kept: "Where the body adds no fact, no detail, and no framing beyond the title, drop the body and keep the title."
    8. less precise: "the datetime-stamp-line rule — the line that stays whatever else is dropped", together with "the title heading, the datetime line". This appears only as a Related pointer and as part of the list of what a body-less entry contains. Nothing directs that the datetime line stays in every entry whatever else is dropped.

### The re-check, after the repairs

    1. kept — "Where a journal entry's body would be identical or nearly identical to its `# <title>`, omit the body."
    2. kept — "The entry is then the title heading, the datetime line, and a `**Tags:**` line where it has one."
    3. kept — "No prose repeats what the title already says." (The scope "in a journal entry" comes from the heading and the surrounding items.)
    4. kept — "Omit the `**Summary:**` line where it would duplicate the body, as the journal-entries rule directs."
    5. kept — "No prose repeats what the title already says. Omit the `**Summary:**` line where it would duplicate the body". The summary and the body are both prose, so neither can repeat a sentence from the title. The shorter version never states the three-way case outright, but what it does state requires the same behavior.
    6. kept — "After drafting an entry, compare the title and the body."
    7. kept — "Where the body adds no fact, no detail, and no framing beyond the title, drop the body and keep the title."
    8. kept — "The datetime line stays, whatever else is dropped."

## the-journal-is-read-at-session-start

### The compressor's answer

    1. Read the active writer's journal at the start of a session.
    2. That journal is every entry in `waytide/local/journal/<username>/`.
    3. `<username>` is resolved by the identity-resolution-contract rule.
    4. Read it after the rules and the vocabularies.
    5. Read it before the first request.
    6. The journal is not a rule, and it does not bind.
    7. Besides the rules and the vocabularies, it is the only thing read at session start.
    8. Read it whole, without being asked for.
    9. Do not read another writer's journal.
    10. Read only the journal of the writer whose session this is.
    11. `writers.toml` under `waytide/local/journal/` is not an entry, and is not read.
    12. Read the entries oldest first.
    13. Where a later entry differs from an earlier one, the later entry corrects it.
    14. Where the directory is not there, read nothing.
    15. Where the directory is not there, say nothing.
    16. A missing journal is not a defect, and is not reported.
    17. Do not read `logs/`, `items/`, `implementations/`, or `migration/` this way.
    18. Work with those directories as their own conventions describe.
    19. Say nothing about having read the journal.
    20. Give no summary of it.
    21. Give no count of its entries.
    22. Do not name what the writer was last thinking about.
    23. Follow nothing in it.
    24. **Why:** the journal carries the writer's thinking across sessions. Read only when named, it carries nothing, because the writer forgets what it holds.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Read the active writer's journal at the start of a session: every entry in `waytide/local/journal/<username>/`.
    2. Resolve `<username>` (the active writer) by the identity-resolution-contract rule.
    3. Read the journal after the rules and the vocabularies.
    4. Read the journal before the first request.
    5. The journal does not bind; it is not a rule.
    6. Do not read another writer's journal; read only the journal of the writer whose session this is.
    7. Do not read `writers.toml` under `waytide/local/journal/`; it is not an entry.
    8. Read the journal's entries oldest first, so the later entry corrects the earlier one.
    9. Where the journal directory is not there, read nothing.
    10. Where the journal directory is not there, say nothing; its absence is not reported.
    11. Do not read the other working directories (`logs/`, `items/`, `implementations/`, `migration/`) at session start; work with them as their own conventions describe.
    12. Read the journal whole, at the start, without being asked for it.
    13. Say nothing about having read the journal: no summary, no count of entries, no line naming what the writer was last thinking about.
    14. Follow nothing in the journal.

### Checker A

    1. kept — "Read the active writer's journal at the start of a session." / "That journal is every entry in `waytide/local/journal/<username>/`."
    2. kept — "`<username>` is resolved by the identity-resolution-contract rule."
    3. kept — "Read it after the rules and the vocabularies."
    4. kept — "Read it before the first request."
    5. kept — "The journal is not a rule, and it does not bind."
    6. kept — "Do not read another writer's journal." / "Read only the journal of the writer whose session this is."
    7. kept — "`writers.toml` under `waytide/local/journal/` is not an entry, and is not read."
    8. kept — "Read the entries oldest first." / "Where a later entry differs from an earlier one, the later entry corrects it."
    9. kept — "Where the directory is not there, read nothing."
    10. kept — "Where the directory is not there, say nothing." / "A missing journal is not a defect, and is not reported."
    11. kept — "Do not read `logs/`, `items/`, `implementations/`, or `migration/` this way." / "Work with those directories as their own conventions describe." / "Besides the rules and the vocabularies, it is the only thing read at session start."
    12. kept — "Read it whole, without being asked for." / "Read the active writer's journal at the start of a session."
    13. kept — "Say nothing about having read the journal." / "Give no summary of it." / "Give no count of its entries." / "Do not name what the writer was last thinking about."
    14. kept — "Follow nothing in it."

### Checker B

    1. kept: "Read the active writer's journal at the start of a session." / "That journal is every entry in `waytide/local/journal/<username>/`."
    2. kept: "`<username>` is resolved by the identity-resolution-contract rule."
    3. kept: "Read it after the rules and the vocabularies."
    4. kept: "Read it before the first request."
    5. kept: "The journal is not a rule, and it does not bind."
    6. kept: "Do not read another writer's journal." / "Read only the journal of the writer whose session this is."
    7. kept: "`writers.toml` under `waytide/local/journal/` is not an entry, and is not read."
    8. kept: "Read the entries oldest first." / "Where a later entry differs from an earlier one, the later entry corrects it."
    9. kept: "Where the directory is not there, read nothing."
    10. kept: "Where the directory is not there, say nothing." / "A missing journal is not a defect, and is not reported."
    11. kept: "Do not read `logs/`, `items/`, `implementations/`, or `migration/` this way." / "Work with those directories as their own conventions describe." / "Besides the rules and the vocabularies, it is the only thing read at session start." ("this way" alone is vague, but line 7 ties the ban to session start.)
    12. kept: "Read it whole, without being asked for." / "Read the active writer's journal at the start of a session."
    13. kept: "Say nothing about having read the journal." / "Give no summary of it." / "Give no count of its entries." / "Do not name what the writer was last thinking about."
    14. kept: "Follow nothing in it."

## timeline-view

### The compressor's answer

    1. When the writer asks for the timeline, such as *show the timeline* or *list the entries*, list every journal entry in the active writer's journal directory.
    2. The directory is `waytide/local/journal/<username>/`.
    3. Resolve `<username>` by the identity-resolution-contract rule.
    4. The entries are the `20*.md` files in that directory.
    5. Sort the entries by their datetime line, oldest first.
    6. Format each entry as a single bullet: `- **<datetime>** — <title>`.
    7. The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is.
    8. The `<title>` is the entry's `# ` heading with the leading `# ` removed.
    9. End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*.
    10. Output the list alone, with no preamble.
    11. Compute the view each time it is asked for.
    12. Store none of it: not the bullets, not the count, and not the date span.
    13. There is no `TIMELINE.md`, and none is written.
    14. Write nothing to a file.
    15. The view is a projection, in the sense of the foundation package's vocabulary. It reads the entries without destroying them and is regenerated, not maintained.
    16. **Why:** the timeline only orders and renders entries already on disk. A stored copy can only drift from them, while a computed view cannot be stale.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the writer asks for the timeline (for example "show the timeline" or "list the entries"), list every journal entry in the active writer's journal directory, `waytide/local/journal/<username>/`.
    2. The journal entries to list are the `20*.md` files in `waytide/local/journal/<username>/`.
    3. Resolve the active `<username>` by the identity-resolution-contract rule.
    4. List the journal entries in chronological order, oldest first.
    5. Sort the journal entries by their datetime line.
    6. Format each journal entry in the timeline as a single bullet, `- **<datetime>** — <title>`.
    7. The `<datetime>` in each timeline bullet is the human-readable datetime line under the entry's title (for example `Wed Jun 17 2026 at 18:28`).
    8. The `<title>` in each timeline bullet is the entry's `# ` heading with the leading `# ` removed.
    9. End the timeline with a one-line count and date span (for example "15 entries, spanning Jun 15–17, 2026").
    10. Output the timeline list alone, with no preamble.
    11. Compute the timeline view, including its count and date span, every time it is asked for.
    12. Store the timeline view nowhere and write nothing to a file: not the bullets, not the count, and not the date span.
    13. There is no `TIMELINE.md`, and none is to be written.
    14. The timeline view reads the journal entries without destroying them.
    15. The timeline view is regenerated rather than maintained.

### Checker A

    All 15 directives are kept. None is less precise or lost.

    1. kept — "When the writer asks for the timeline, such as *show the timeline* or *list the entries*, list every journal entry in the active writer's journal directory." + "The directory is `waytide/local/journal/<username>/`."
    2. kept — "The entries are the `20*.md` files in that directory."
    3. kept — "Resolve `<username>` by the identity-resolution-contract rule."
    4. kept — "Sort the entries by their datetime line, oldest first."
    5. kept — "Sort the entries by their datetime line"
    6. kept — "Format each entry as a single bullet: `- **<datetime>** — <title>`."
    7. kept — "The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is."
    8. kept — "The `<title>` is the entry's `# ` heading with the leading `# ` removed."
    9. kept — "End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*."
    10. kept — "Output the list alone, with no preamble."
    11. kept — "Compute the view each time it is asked for." (The count and span are part of the view, as item 9 sets out, so they are computed each time too.)
    12. kept — "Store none of it: not the bullets, not the count, and not the date span." + "Write nothing to a file."
    13. kept — "There is no `TIMELINE.md`, and none is written."
    14. kept — "It reads the entries without destroying them"
    15. kept — "and is regenerated, not maintained."

### Checker B

    1. kept: "When the writer asks for the timeline, such as *show the timeline* or *list the entries*, list every journal entry in the active writer's journal directory." / "The directory is `waytide/local/journal/<username>/`."
    2. kept: "The entries are the `20*.md` files in that directory."
    3. kept: "Resolve `<username>` by the identity-resolution-contract rule."
    4. kept: "Sort the entries by their datetime line, oldest first."
    5. kept: "Sort the entries by their datetime line"
    6. kept: "Format each entry as a single bullet: `- **<datetime>** — <title>`."
    7. kept: "The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is."
    8. kept: "The `<title>` is the entry's `# ` heading with the leading `# ` removed."
    9. kept: "End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*."
    10. kept: "Output the list alone, with no preamble."
    11. kept: "Compute the view each time it is asked for." The count and date span are part of the view under line 9, so they are computed with it.
    12. kept: "Store none of it: not the bullets, not the count, and not the date span." / "Write nothing to a file."
    13. kept: "There is no `TIMELINE.md`, and none is written."
    14. kept: "It reads the entries without destroying them"
    15. kept: "is regenerated, not maintained."

## an-answer-is-a-list-and-prose-must-justify-itself

### The compressor's answer

    1. An answer to the engineer is a list.
    2. Prose is not forbidden, but it is not the default.
    3. Prose is written only where a condition below applies. The agent must name the condition that applies.
    4. Where no condition applies, the answer is a list.

    ## What justifies prose

    1. Only one condition justifies prose: the answer is a sentence or two.
    2. Such an answer takes no list. Examples: *Yes*, *The suite passes*, *Correct — the rule says so and I did not follow it*.
    3. No other condition justifies prose.
    4. An explanation the engineer asked for does not justify prose. It is answered in a list.
    5. Dependent reasoning does not justify prose. It is answered in a numbered list.

    ## A list item states a fact. It does not narrate

    1. Each list item states what is true. It does not describe the work.
    2. A list whose items are narration fails this rule, even when the list form is correct.
    3. Do not describe a decision as a decision. Examples: *the judgment is left as a judgment on purpose*, *this was recorded as a new entry rather than by rewriting the old one*, *the option was declined*.
    4. Do not explain why something is as it is, unless asked. Examples: *so a later reader knows what tightening would mean*, *which is what keeps the record honest*, *for the same reason the other rule gives*.
    5. Do not characterize the work or its result. Examples: *the miss is instructive*, *worth noting*, *this is the substantive part*, *cleanly*, *correctly*.
    6. Do not report the agent's process. Examples: *I checked*, *verified rather than assumed*, *rather than trusting the composite's copy*.
    7. State the fact that is left once those are removed. Example: *The rule names two stricter forms: the line on every list answer, or above a length threshold. Neither is adopted.*
    8. Test each list item by asking whether it could be false. Remove it if it could not.
    9. *The check is green*, *nine of thirteen scripts lack it*, and *the branch is deleted* are facts. *This keeps the record honest* is narration.
    10. Reasoning belongs in rules, records, and commit messages. It does not belong in an answer unless asked for.
    11. Reasoning the engineer wants is asked for through the expansion line.

    ## Dependent reasoning takes an ordered list, not prose

    1. An unordered list is only for list items that are parallel and independent.
    2. Number reasoning whose steps rest on each other: `1.`, `2.`, `3.`.
    3. Number a list whose entries the engineer may refer back to, such as options, findings, candidates, or things to decide.
    4. Those numbers are handles, such as *#2*. They imply no order.
    5. In all other cases, leave the list unordered.

    ## After a list answer, the engineer is offered an expansion

    1. Where an expansion would add something, end the answer with this line:

    ```
    For more detail than bullet points, ask for an expanded answer.
    ```

    2. Write it as a line on its own, not as a selection prompt.
    3. Include it only where the agent compressed material out of the answer.
    4. Leave it out of an answer that says all it has.
    5. It offers more depth on the answer given, not a next topic.
    6. It names the form being given up, "more detail than bullet points". "More detail" alone does not do this.
    7. Whether to include the line is the agent's own judgment.
    8. Do not make the judgment stricter until there is proof that it needs to be.
    9. Two stricter forms are not adopted: appending the line to every list answer, or appending it above a length threshold.
    10. Either stricter form may be adopted if the judgment proves unreliable in use.
    11. **Why:** An agent writes prose without deciding to, and prose hides padding, comment, and unnamed back-references. A list puts each claim on its own line, so an empty claim shows. Putting the burden on prose, rather than stating a preference, keeps the rule in force across sessions.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. An answer to the engineer is a list.
    2. Write prose in an answer only where the answer is a sentence or two; that condition is the whole of what justifies prose.
    3. To write prose, the agent must name which justifying condition applies; where none does, the answer is a list.
    4. An explanation the engineer asked for does not justify prose; answer it in a list.
    5. Reasoning whose points are connected or dependent does not justify prose; it is answered in a list.
    6. A list item states a fact; it does not narrate.
    7. Do not include a list item that describes a decision as a decision (e.g., "the option was declined").
    8. Do not include a list item that explains, unasked, why something is as it is; reasoning the engineer did not ask for does not belong in an answer.
    9. Do not include a list item that characterizes the work or its result (e.g., "worth noting", "cleanly", "correctly").
    10. Do not include a list item that reports the agent's process or what it did to be sure (e.g., "I checked", "verified rather than assumed").
    11. Test each list item by whether it could be false; an item that cannot be false is a comment on a fact, not a fact, and does not belong.
    12. Number the list (`1.`, `2.`, `3.`) where its list items depend on each other.
    13. Number a list whose entries the engineer may refer back to (options, findings, candidates, things to decide), with the numbers serving as handles rather than a sequence.
    14. Leave a list unordered where its list items are neither dependent nor to be referred back to.
    15. Where a list answer left something out (the agent compressed material out of it), end it with this line on its own: `For more detail than bullet points, ask for an expanded answer.`
    16. Omit the expansion line where the answer says all it has.
    17. The expansion offer is a line, not a selection prompt.
    18. The expansion line offers depth on the answer given, not a next topic.
    19. Do not end an answer with a trailing offer of more that points at a next topic or at what else might be done.
    20. The expansion line names the form being traded away ("more detail than bullet points"), not only the depth on offer.
    21. Whether to add the expansion line stays the agent's judgment, and is not replaced by a mechanical condition (on every list answer, or above a length threshold) unless the judgment proves unreliable in use.
    22. A question to the engineer goes through the selection interface (foundation's present-every-prompt-through-askuserquestion rule); this rule governs only answers.

### Checker A

    1. kept — "An answer to the engineer is a list."
    2. kept — "Only one condition justifies prose: the answer is a sentence or two." / "No other condition justifies prose."
    3. kept — "Prose is written only where a condition below applies. The agent must name the condition that applies." / "Where no condition applies, the answer is a list."
    4. kept — "An explanation the engineer asked for does not justify prose. It is answered in a list."
    5. less precise — "Dependent reasoning does not justify prose. It is answered in a numbered list." Missing: reasoning that is "connected" but not dependent.
    6. kept — "Each list item states what is true. It does not describe the work." / "A list item states a fact. It does not narrate"
    7. kept — "Do not describe a decision as a decision. Examples: ... *the option was declined*."
    8. kept — "Do not explain why something is as it is, unless asked." / "Reasoning ... does not belong in an answer unless asked for."
    9. kept — "Do not characterize the work or its result. Examples: ... *worth noting* ... *cleanly*, *correctly*."
    10. kept — "Do not report the agent's process. Examples: *I checked*, *verified rather than assumed*"
    11. kept — "Test each list item by asking whether it could be false. Remove it if it could not." / "*This keeps the record honest* is narration."
    12. kept — "Number reasoning whose steps rest on each other: `1.`, `2.`, `3.`" / "An unordered list is only for list items that are parallel and independent."
    13. kept — "Number a list whose entries the engineer may refer back to, such as options, findings, candidates, or things to decide." / "Those numbers are handles, such as *#2*. They imply no order."
    14. kept — "In all other cases, leave the list unordered."
    15. kept — "end the answer with this line: For more detail than bullet points, ask for an expanded answer." / "Include it only where the agent compressed material out of the answer." / "Write it as a line on its own"
    16. kept — "Leave it out of an answer that says all it has."
    17. kept — "Write it as a line on its own, not as a selection prompt."
    18. kept — "It offers more depth on the answer given, not a next topic."
    19. less precise — "It offers more depth on the answer given, not a next topic." Missing: a general ban on ending any answer with a trailing offer, including offers of "what else might be done". The shorter version only limits what the expansion line itself offers.
    20. kept — "It names the form being given up, "more detail than bullet points". "More detail" alone does not do this."
    21. kept — "Whether to include the line is the agent's own judgment." / "Do not make the judgment stricter until there is proof that it needs to be." / "Two stricter forms are not adopted: appending the line to every list answer, or appending it above a length threshold." / "Either stricter form may be adopted if the judgment proves unreliable in use."
    22. kept — "`foundation`'s present-every-prompt-through-askuserquestion rule — the selection interface, which is where a **question** goes — this rule governs an **answer**"

### Checker B

    1. kept — "An answer to the engineer is a list."
    2. kept — "Only one condition justifies prose: the answer is a sentence or two." / "No other condition justifies prose."
    3. kept — "Prose is written only where a condition below applies. The agent must name the condition that applies." / "Where no condition applies, the answer is a list."
    4. kept — "An explanation the engineer asked for does not justify prose. It is answered in a list."
    5. kept — "Dependent reasoning does not justify prose. It is answered in a numbered list."
    6. kept — "Each list item states what is true. It does not describe the work."
    7. kept — "Do not describe a decision as a decision. Examples: ... *the option was declined*."
    8. kept — "Do not explain why something is as it is, unless asked." / "It does not belong in an answer unless asked for."
    9. kept — "Do not characterize the work or its result. Examples: ... *worth noting*, ... *cleanly*, *correctly*."
    10. kept — "Do not report the agent's process. Examples: *I checked*, *verified rather than assumed*"
    11. kept — "Test each list item by asking whether it could be false. Remove it if it could not."
    12. kept — "Number reasoning whose steps rest on each other: `1.`, `2.`, `3.`" / "An unordered list is only for list items that are parallel and independent."
    13. kept — "Number a list whose entries the engineer may refer back to, such as options, findings, candidates, or things to decide." / "Those numbers are handles, such as *#2*. They imply no order."
    14. kept — "In all other cases, leave the list unordered."
    15. kept — "Where an expansion would add something, end the answer with this line: ... For more detail than bullet points, ask for an expanded answer." / "Include it only where the agent compressed material out of the answer."
    16. kept — "Leave it out of an answer that says all it has."
    17. kept — "Write it as a line on its own, not as a selection prompt."
    18. kept — "It offers more depth on the answer given, not a next topic."
    19. lost — no general ban on ending an answer with a trailing offer of a next topic or of what else might be done. The compressed version limits only what the expansion line itself offers.
    20. kept — "It names the form being given up, \"more detail than bullet points\". \"More detail\" alone does not do this."
    21. kept — "Whether to include the line is the agent's own judgment." / "Two stricter forms are not adopted: appending the line to every list answer, or appending it above a length threshold." / "Either stricter form may be adopted if the judgment proves unreliable in use."
    22. kept — "`foundation`'s present-every-prompt-through-askuserquestion rule — the selection interface, which is where a **question** goes — this rule governs an **answer**"

### The re-check, after the repairs

    1. kept — "An answer to the engineer is a list."
    2. kept — "Only one condition justifies prose: the answer is a sentence or two." / "No other condition justifies prose."
    3. kept — "The agent must name the condition that applies." / "Where no condition applies, the answer is a list."
    4. kept — "An explanation the engineer asked for does not justify prose. It is answered in a list."
    5. kept — "Connected or dependent reasoning does not justify prose. It is answered in a numbered list."
    6. kept — "A list item states a fact. It does not narrate" / "Each list item states what is true. It does not describe the work."
    7. kept — "Do not describe a decision as a decision. Examples: ... *the option was declined*."
    8. kept — "Do not explain why something is as it is, unless asked." / "It does not belong in an answer unless asked for."
    9. kept — "Do not characterize the work or its result. Examples: ... *worth noting*, ... *cleanly*, *correctly*."
    10. kept — "Do not report the agent's process. Examples: *I checked*, *verified rather than assumed*"
    11. kept — "Test each list item by asking whether it could be false. Remove it if it could not." / "*This keeps the record honest* is narration."
    12. kept — "Number reasoning whose steps rest on each other: `1.`, `2.`, `3.`" / "An unordered list is only for list items that are parallel and independent."
    13. kept — "Number a list whose entries the engineer may refer back to, such as options, findings, candidates, or things to decide." / "Those numbers are handles, such as *#2*. They imply no order."
    14. kept — "In all other cases, leave the list unordered."
    15. kept — "end the answer with this line: For more detail than bullet points, ask for an expanded answer." / "Write it as a line on its own" / "Include it only where the agent compressed material out of the answer."
    16. kept — "Leave it out of an answer that says all it has."
    17. kept — "Write it as a line on its own, not as a selection prompt."
    18. kept — "It offers more depth on the answer given, not a next topic."
    19. kept — "Do not end any answer with an offer of a next topic, or of what else might be done."
    20. kept — "It names the form being given up, "more detail than bullet points". "More detail" alone does not do this."
    21. kept — "Whether to include the line is the agent's own judgment." / "Two stricter forms are not adopted: appending the line to every list answer, or appending it above a length threshold." / "Either stricter form may be adopted if the judgment proves unreliable in use."
    22. kept — "the selection interface, which is where a **question** goes — this rule governs an **answer**, and the two do not overlap"

## communicate-plainly-name-the-thing

### The compressor's answer

    1. Speak and write to the user in plain language, using the actual names of things.
    2. Do not hide meaning behind invented labels or compressed jargon offered as if already shared.
    3. Do not coin numbered or abstract stand-ins ("tier 1", "phase A2", "the T3 bucket") for things that have real names.
    4. Say the thing itself — "the notes copied into a project when it installs a package," not "the distributed tier."
    5. Do not point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter").
    6. Name the thing again each time — "the show-the-test merge," not "#2" — even at the cost of some repetition.
    7. The engineer may refer to a list item by its number.
    8. When the engineer writes a number such as *#2*, name what it refers to before acting on it, so the reference is confirmed.
    9. Use a compressed term ("distributed", "atomic records") only once its plain meaning has been stated.
    10. Do not lead with a compressed term as though the reader already shares it.
    11. Bring in a shorthand only if it is justified.
    12. Prefer the plain word and the concrete description over the clever-sounding one.
    13. If a sentence needs a glossary to parse, rewrite it.
    14. This rule governs phrasing addressed to the user, such as an explanation, a summary, or a status note.
    15. It also governs the codebase and the durable artifacts the user reads later: rules, logs, plans, and deferred items.
    16. **Why:** Invented labels and unexplained jargon hide meaning and force the reader to decode them. The point of communicating is to be understood.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Speak and write to the user in plain language, using the actual names of things.
    2. Do not hide meaning behind invented labels or compressed jargon offered as if it were already shared.
    3. Don't coin numbered or abstract stand-ins (such as "tier 1", "phase A2", "the T3 bucket") for things that have real names; say the thing itself.
    4. Don't point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter").
    5. Name the thing again each time it is referred back to, even at the cost of a little repetition.
    6. The engineer may refer to a list item by its number.
    7. A list the engineer may refer back to is numbered for them.
    8. When the engineer refers to a list item by number (such as "#2"), name what that item is before acting on it, so the reference is confirmed rather than assumed.
    9. A compressed term (such as "distributed" or "atomic records") may be used only once its plain meaning has been made clear.
    10. Don't lead with a compressed term as though the reader already shares its meaning.
    11. Prefer the plain word and the concrete description over the clever-sounding one.
    12. If a sentence needs a glossary to parse, rewrite it.
    13. When explaining something, use the concrete name and a plain description.
    14. Bring in a shorthand only after its meaning is clear, and only if it is justified.
    15. Plain-language communication with actual names applies to phrasing addressed to the user (explanations, summaries, status notes), not only to what goes into the codebase.
    16. Plain-language communication with actual names applies to the durable artifacts the user reads later: rules, logs, plans, and deferred items.

### Checker A

    1. kept: "Speak and write to the user in plain language, using the actual names of things."
    2. kept: "Do not hide meaning behind invented labels or compressed jargon offered as if already shared."
    3. kept: "Do not coin numbered or abstract stand-ins ("tier 1", "phase A2", "the T3 bucket") for things that have real names." together with "Say the thing itself"
    4. kept: "Do not point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter")."
    5. kept: "Name the thing again each time — "the show-the-test merge," not "#2" — even at the cost of some repetition."
    6. kept: "The engineer may refer to a list item by its number."
    7. lost: nothing says that a list the engineer may refer back to is numbered for them.
    8. kept: "When the engineer writes a number such as *#2*, name what it refers to before acting on it, so the reference is confirmed."
    9. kept: "Use a compressed term ("distributed", "atomic records") only once its plain meaning has been stated."
    10. kept: "Do not lead with a compressed term as though the reader already shares it."
    11. kept: "Prefer the plain word and the concrete description over the clever-sounding one."
    12. kept: "If a sentence needs a glossary to parse, rewrite it."
    13. kept: "in plain language, using the actual names of things" with "Prefer the plain word and the concrete description", which applies to "an explanation" through "This rule governs phrasing addressed to the user, such as an explanation"
    14. kept: "Bring in a shorthand only if it is justified." together with "Use a compressed term ... only once its plain meaning has been stated." The shorthand line itself drops "only after its meaning is clear", but the compressed-term line requires the same thing.
    15. kept: "This rule governs phrasing addressed to the user, such as an explanation, a summary, or a status note." and "It also governs the codebase"
    16. kept: "the durable artifacts the user reads later: rules, logs, plans, and deferred items."

### Checker B

    1. kept — "Speak and write to the user in plain language, using the actual names of things."
    2. kept — "Do not hide meaning behind invented labels or compressed jargon offered as if already shared."
    3. kept — "Do not coin numbered or abstract stand-ins ("tier 1", "phase A2", "the T3 bucket") for things that have real names." plus "Say the thing itself"
    4. kept — "Do not point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter")."
    5. kept — "Name the thing again each time — "the show-the-test merge," not "#2" — even at the cost of some repetition."
    6. kept — "The engineer may refer to a list item by its number."
    7. lost — nothing says to number a list the engineer may refer back to. The shorter version allows references by number but does not require numbering the list.
    8. kept — "When the engineer writes a number such as *#2*, name what it refers to before acting on it, so the reference is confirmed."
    9. kept — "Use a compressed term ("distributed", "atomic records") only once its plain meaning has been stated."
    10. kept — "Do not lead with a compressed term as though the reader already shares it."
    11. kept — "Prefer the plain word and the concrete description over the clever-sounding one."
    12. kept — "If a sentence needs a glossary to parse, rewrite it."
    13. kept — "using the actual names of things" together with "Prefer the plain word and the concrete description"
    14. kept — "Bring in a shorthand only if it is justified." together with "Use a compressed term ... only once its plain meaning has been stated." (This assumes a shorthand counts as a compressed term.)
    15. kept — "This rule governs phrasing addressed to the user, such as an explanation, a summary, or a status note." plus "It also governs the codebase"
    16. kept — "It also governs the codebase and the durable artifacts the user reads later: rules, logs, plans, and deferred items."

### The re-check, after the repairs

    All 16 directives are kept in compressed.md.

    1. kept: "Speak and write to the user in plain language, using the actual names of things."
    2. kept: "Do not hide meaning behind invented labels or compressed jargon offered as if already shared."
    3. kept: "Do not coin numbered or abstract stand-ins ("tier 1", "phase A2", "the T3 bucket") for things that have real names." and "Say the thing itself"
    4. kept: "Do not point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter")."
    5. kept: "Name the thing again each time — "the show-the-test merge," not "#2" — even at the cost of some repetition."
    6. kept: "The engineer may refer to a list item by its number."
    7. kept: "Number a list the engineer may refer back to."
    8. kept: "When the engineer writes a number such as *#2*, name what it refers to before acting on it, so the reference is confirmed." (Dropping "rather than assumed" changes nothing, since "confirmed" already requires it.)
    9. kept: "Use a compressed term ("distributed", "atomic records") only once its plain meaning has been stated."
    10. kept: "Do not lead with a compressed term as though the reader already shares it."
    11. kept: "Prefer the plain word and the concrete description over the clever-sounding one."
    12. kept: "If a sentence needs a glossary to parse, rewrite it."
    13. kept: "using the actual names of things" (line 1) and "Prefer the plain word and the concrete description" (line 12)
    14. kept: "Bring in a shorthand only if it is justified." together with "only once its plain meaning has been stated" (line 9). The "only after its meaning is clear" condition comes from line 9, which speaks of a "compressed term" rather than a "shorthand". The two mean the same thing here.
    15. kept: "This rule governs phrasing addressed to the user, such as an explanation, a summary, or a status note." and "It also governs the codebase"
    16. kept: "It also governs the codebase and the durable artifacts the user reads later: rules, logs, plans, and deferred items."

## a-word-is-reserved-in-six-steps

### The compressor's answer

    1. Reserve a word by following these six steps in order, every time a word is reserved.
    2. The instruction that starts the sequence is "Waytide reserves the word, X". It names the word and asks for all six steps.
    3. The sequence does not have to be spelled out each time a term is settled.
    4. Write the verb as `reserves`, and never `claims`.
    5. A reservation is made under STE Rules 1.5, 1.6, and 1.12, which let a project add its own technical nouns and verbs.
    6. Step 1: look the word up in the STE dictionary. This step is mechanical.
    7. The lookup has three outcomes. The word is approved, with the one meaning it may carry.
    8. Or the word is not approved, and the dictionary names the approved word that replaces it.
    9. Or the word is absent from the STE dictionary.
    10. Step 2: ask what the word names. Do not skip this step.
    11. A word that names something in the subject field is terminology. Continue the sequence.
    12. A word that qualifies, joins two statements, or does grammatical work is ordinary vocabulary. Stop and write no entry, per the ordinary-vocabulary-is-not-reserved-and-not-rewritten rule.
    13. Step 3: decide noun or verb.
    14. A word used both ways takes a category for each. These are two decisions, not one.
    15. STE Rule 1.7 forbids a technical noun used as a verb. STE Rule 1.13 forbids a technical verb used as a noun.
    16. Step 4: try an STE category first. STE Rule 1.5 gives twenty-two noun categories, and STE Rule 1.12 gives four verb categories.
    17. Waytide's terms land in noun categories 7, 11, 15, and 19, and verb category 2.
    18. Step 5: use an ETE category only where no STE category holds the word.
    19. Do not reach step 5 until an STE category has been tried and refused.
    20. The five ETE categories are declared in the ete-declares-its-own-categories rule.
    21. Step 6: write the entry in the vocabulary of the package whose domain the term belongs to, per the foundation vocabulary-convention.
    22. The entry gives the definition, what the STE dictionary says about the word, and the category.
    23. The engineer decides the term, because a term is a design decision.
    24. Put the category to the engineer through the selection UI.
    25. Bring the step 1 lookup already done, and name the candidate categories.
    26. Steps 4 and 5 are judgment. Step 1 is not.
    27. The phrase reserves the word and does not order a sweep.
    28. A reservation settles what the word means in Waytide's prose from that point on.
    29. Replacing another word with the reserved word where it already stands is a separate instruction, asked for separately.
    30. Do not conform existing prose until that separate instruction is given.
    31. **Why:** without the stated sequence, a writer picks a category by feel, and the ETE categories absorb every hard word. An ETE category is a departure from the standard, taken only where the standard has nothing.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Run the six steps of reserving a word in order, for every word reserved.
    2. The instruction "Waytide reserves the word, X" starts the sequence and asks for all six steps.
    3. The verb for the act of reserving is `reserves`, never `claims`.
    4. Step 1: Look the word up in the STE dictionary. The outcome is one of three: approved with the one meaning it may carry, not approved with the approved replacement named, or absent from the STE dictionary.
    5. Step 2: Ask what the word names. A word that names something in the subject field is terminology, and the sequence continues.
    6. At step 2, a word that qualifies, joins two statements, or does the sentence's grammatical work is ordinary vocabulary. Stop there and write no entry for it.
    7. Do not skip step 2.
    8. Step 3: Decide whether the word is a noun or a verb. A word used both ways takes a category for each, as two decisions, not one.
    9. Do not use a technical noun as a verb (STE Rule 1.7).
    10. Do not use a technical verb as a noun (STE Rule 1.13).
    11. Step 4: Try an STE category first: the twenty-two noun categories of STE Rule 1.5 and the four verb categories of STE Rule 1.12.
    12. Step 5: Fall to one of the five ETE categories only where no STE category holds the word.
    13. Do not reach step 5 until an STE category has been tried and refused.
    14. Step 6: Write the entry in the vocabulary of the package whose domain the term belongs to, per the foundation vocabulary-convention.
    15. The vocabulary entry gives the definition, what the STE dictionary says about the word, and the category.
    16. The engineer decides the term's category, because a term is a design decision.
    17. Put the category decision to the engineer through the selection UI.
    18. When putting the category to the engineer, bring the step 1 dictionary lookup already done.
    19. When putting the category to the engineer, name the candidate categories.
    20. Reserving a word does not order a sweep. Replacing some other word with the reserved word wherever that other word already stands is a separate instruction and must be asked for separately.
    21. Conform no existing prose to a reserved word until that is asked for separately.

### Checker A

    1. kept: "Reserve a word by following these six steps in order, every time a word is reserved."
    2. kept: "The instruction that starts the sequence is \"Waytide reserves the word, X\". It names the word and asks for all six steps."
    3. kept: "Write the verb as `reserves`, and never `claims`."
    4. kept: "Step 1: look the word up in the STE dictionary." / "The word is approved, with the one meaning it may carry." / "Or the word is not approved, and the dictionary names the approved word that replaces it." / "Or the word is absent from the STE dictionary."
    5. kept: "Step 2: ask what the word names." / "A word that names something in the subject field is terminology. Continue the sequence."
    6. kept: "A word that qualifies, joins two statements, or does grammatical work is ordinary vocabulary. Stop and write no entry"
    7. kept: "Do not skip this step."
    8. kept: "Step 3: decide noun or verb." / "A word used both ways takes a category for each. These are two decisions, not one."
    9. kept: "STE Rule 1.7 forbids a technical noun used as a verb."
    10. kept: "STE Rule 1.13 forbids a technical verb used as a noun."
    11. kept: "Step 4: try an STE category first. STE Rule 1.5 gives twenty-two noun categories, and STE Rule 1.12 gives four verb categories."
    12. kept: "Step 5: use an ETE category only where no STE category holds the word." / "The five ETE categories are declared in the ete-declares-its-own-categories rule."
    13. kept: "Do not reach step 5 until an STE category has been tried and refused."
    14. kept: "Step 6: write the entry in the vocabulary of the package whose domain the term belongs to, per the foundation vocabulary-convention."
    15. kept: "The entry gives the definition, what the STE dictionary says about the word, and the category."
    16. less precise: "The engineer decides the term, because a term is a design decision." Missing: it says "the term", not "the term's category", so it does not say clearly that the category is what the engineer decides.
    17. kept: "Put the category to the engineer through the selection UI."
    18. kept: "Bring the step 1 lookup already done"
    19. kept: "and name the candidate categories."
    20. kept: "The phrase reserves the word and does not order a sweep." / "Replacing another word with the reserved word where it already stands is a separate instruction, asked for separately."
    21. kept: "Do not conform existing prose until that separate instruction is given."

### Checker B

    1. kept: "Reserve a word by following these six steps in order, every time a word is reserved."
    2. kept: "The instruction that starts the sequence is \"Waytide reserves the word, X\". It names the word and asks for all six steps."
    3. kept: "Write the verb as `reserves`, and never `claims`."
    4. kept: "Step 1: look the word up in the STE dictionary." / "The word is approved, with the one meaning it may carry." / "Or the word is not approved, and the dictionary names the approved word that replaces it." / "Or the word is absent from the STE dictionary."
    5. kept: "Step 2: ask what the word names." / "A word that names something in the subject field is terminology. Continue the sequence."
    6. kept: "A word that qualifies, joins two statements, or does grammatical work is ordinary vocabulary. Stop and write no entry"
    7. kept: "Do not skip this step."
    8. kept: "Step 3: decide noun or verb." / "A word used both ways takes a category for each. These are two decisions, not one."
    9. kept: "STE Rule 1.7 forbids a technical noun used as a verb."
    10. kept: "STE Rule 1.13 forbids a technical verb used as a noun."
    11. kept: "Step 4: try an STE category first. STE Rule 1.5 gives twenty-two noun categories, and STE Rule 1.12 gives four verb categories."
    12. kept: "Step 5: use an ETE category only where no STE category holds the word." / "The five ETE categories are declared in the ete-declares-its-own-categories rule."
    13. kept: "Do not reach step 5 until an STE category has been tried and refused."
    14. kept: "Step 6: write the entry in the vocabulary of the package whose domain the term belongs to, per the foundation vocabulary-convention."
    15. kept: "The entry gives the definition, what the STE dictionary says about the word, and the category."
    16. less precise: "The engineer decides the term, because a term is a design decision." Missing: it says "the term", not "the term's category". The next line ("Put the category to the engineer") only implies that the category is what the engineer decides.
    17. kept: "Put the category to the engineer through the selection UI."
    18. kept: "Bring the step 1 lookup already done"
    19. kept: "and name the candidate categories."
    20. kept: "The phrase reserves the word and does not order a sweep." / "Replacing another word with the reserved word where it already stands is a separate instruction, asked for separately."
    21. kept: "Do not conform existing prose until that separate instruction is given."

### The re-check, after the repairs

    1. kept: "Reserve a word by following these six steps in order, every time a word is reserved."
    2. kept: "The instruction that starts the sequence is \"Waytide reserves the word, X\". It names the word and asks for all six steps."
    3. kept: "Write the verb as `reserves`, and never `claims`."
    4. kept: "Step 1: look the word up in the STE dictionary." / "The word is approved, with the one meaning it may carry." / "Or the word is not approved, and the dictionary names the approved word that replaces it." / "Or the word is absent from the STE dictionary."
    5. kept: "Step 2: ask what the word names." / "A word that names something in the subject field is terminology. Continue the sequence."
    6. kept: "A word that qualifies, joins two statements, or does grammatical work is ordinary vocabulary. Stop and write no entry"
    7. kept: "Do not skip this step."
    8. kept: "Step 3: decide noun or verb." / "A word used both ways takes a category for each. These are two decisions, not one."
    9. kept: "STE Rule 1.7 forbids a technical noun used as a verb."
    10. kept: "STE Rule 1.13 forbids a technical verb used as a noun."
    11. kept: "Step 4: try an STE category first. STE Rule 1.5 gives twenty-two noun categories, and STE Rule 1.12 gives four verb categories."
    12. kept: "Step 5: use an ETE category only where no STE category holds the word." / "The five ETE categories are declared in the ete-declares-its-own-categories rule."
    13. kept: "Do not reach step 5 until an STE category has been tried and refused."
    14. kept: "Step 6: write the entry in the vocabulary of the package whose domain the term belongs to, per the foundation vocabulary-convention."
    15. kept: "The entry gives the definition, what the STE dictionary says about the word, and the category."
    16. kept: "The engineer decides the term's category, because a term is a design decision."
    17. kept: "Put the category to the engineer through the selection UI."
    18. kept: "Bring the step 1 lookup already done"
    19. kept: "and name the candidate categories."
    20. kept: "The phrase reserves the word and does not order a sweep." / "Replacing another word with the reserved word where it already stands is a separate instruction, asked for separately."
    21. kept: "Do not conform existing prose until that separate instruction is given."

## ete-declares-its-own-categories

### The compressor's answer

    1. STE's category lists are closed. Its word lists are open.
    2. STE Rule 1.5 admits a technical noun that fits one or more of its twenty-two categories.
    3. STE Rule 1.12 admits a technical verb that fits one or more of its four categories.
    4. The words listed inside each STE category are only examples.
    5. ETE adds five categories. Each one holds technical nouns and technical verbs.
    6. The five categories are declared here and nowhere else.
    7. An entry names its category and its part of speech. STE Rules 1.7 and 1.13 depend on which part of speech a word is reserved as.

    ## Engineering, design, process, and method

    1. This category holds terms that name how engineering work is conducted, recorded, and set aside.
    2. It also holds the acts that conduct that work, and the parts of a design method.
    3. Examples: `hinge`, `gate`, `cradle`, `cycle`, `loop`, `actuation`, `observation`, `efferent`, `solubility`, `subtle`, `load-bearing`, `mean-bias`, `deferred`, `suspended`, `out of scope`, `responsibility`, `transfer`, `reconcile`.
    4. Try STE category 7 before this one. It covers concepts, design, calculations, and methodologies.

    ## Evented systems and autonomous components

    1. This category holds terms that name the parts of a message-based system, the components that run on their own, and what they do.
    2. Examples: `projection`, `entity`, `event`, `stream`, `consumer`, `handler`, `message`, `autonomous component`.

    ## Agent artifacts

    1. This category holds terms that name the files an agent and an engineer write and read as they work.
    2. It also holds terms for what is done to those files.
    3. Examples: `working-state artifact`, `implementation record`, `loop record`, `work session record`, `decision log entry`, `rule file`, `vocabulary`.

    ## Human-computer interaction (HCI)

    1. This category holds terms that name how a person and a machine work together, and what each of them does.
    2. Examples: `attended`, `unattended`, `free-text option`, `selection prompt`, `harness`.

    ## Deliberation and speech

    1. This category holds words whose object is a judgment or a statement rather than a thing.
    2. Examples: `ask`, `decide`, `choose`, `settle`, `state`, `present`, `observe`, `govern`, `establish`, `explain`.

    ## Applying the categories

    1. This rule contradicts STE Rule 1.5 and STE Rule 1.12, because each of them closes its list of categories.
    2. It contradicts nothing else.
    3. A word admitted to an ETE category is reserved, used, and bound exactly as a word in an STE category is.
    4. Try an STE category first.
    5. Use an ETE category only for a word that no STE category holds.
    6. Reserve words one at a time.
    7. The word's vocabulary entry names its category.
    8. The same entry states what the STE dictionary says about the word.
    9. A word with no entry is not reserved.
    10. A category is not a standing permission.
    11. **Why:** STE's categories are complete for aerospace maintenance, but they miss some of the method's nouns and every verb whose object is a judgment. Adding the categories is one departure, stated once. Separate exemptions would keep growing, and that growth would go unrecorded.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Under ETE, a technical noun or technical verb may also be used if it belongs to one of the five ETE categories: engineering, design, process, and method; evented systems and autonomous components; agent artifacts; human-computer interaction (HCI); and deliberation and speech.
    2. Each ETE category holds both technical nouns and technical verbs.
    3. The ETE categories are declared in this rule and nowhere else.
    4. An ETE vocabulary entry must name its category.
    5. An ETE vocabulary entry must name its part of speech, because STE Rules 1.7 and 1.13 depend on which part of speech a word is reserved as.
    6. Before you use the ETE category "engineering, design, process, and method", reach for STE category 7, which covers concepts, design, calculations, and methodologies.
    7. A word admitted to an ETE category is reserved, used, and bound exactly as a word in an STE category is.
    8. Reach for an STE category first. An ETE category is only for what none of the twenty-two STE noun categories or four STE verb categories holds.
    9. Reserve a word in an STE category where one holds it. Where none does, reserve it in an ETE category.
    10. A word is reserved one at a time.
    11. The word's vocabulary entry must state what the STE dictionary says about the word, in the same entry that names the category.
    12. A word with no vocabulary entry is not reserved.
    13. An ETE category is not a standing permission to use the words that fit it.
    14. The contradiction with STE is limited to STE Rule 1.5 and STE Rule 1.12, which close their lists of categories. The ETE categories contradict nothing else in STE.

### Checker A

    1 — kept — "ETE adds five categories" (with lines 2–3 saying STE admits a word that fits one of its categories), and the five section headings "Engineering, design, process, and method", "Evented systems and autonomous components", "Agent artifacts", "Human-computer interaction (HCI)", "Deliberation and speech"
    2 — kept — "Each one holds technical nouns and technical verbs."
    3 — kept — "The five categories are declared here and nowhere else."
    4 — kept — "An entry names its category and its part of speech." / "The word's vocabulary entry names its category."
    5 — kept — "An entry names its category and its part of speech. STE Rules 1.7 and 1.13 depend on which part of speech a word is reserved as."
    6 — kept — "Try STE category 7 before this one. It covers concepts, design, calculations, and methodologies."
    7 — kept — "A word admitted to an ETE category is reserved, used, and bound exactly as a word in an STE category is."
    8 — kept — "Try an STE category first." / "Use an ETE category only for a word that no STE category holds." (the counts are carried by "one or more of its twenty-two categories" and "one or more of its four categories")
    9 — kept — "Try an STE category first." / "Use an ETE category only for a word that no STE category holds." (the "only" makes STE reservation required where an STE category holds the word)
    10 — kept — "Reserve words one at a time."
    11 — kept — "The word's vocabulary entry names its category." / "The same entry states what the STE dictionary says about the word."
    12 — kept — "A word with no entry is not reserved."
    13 — less precise — "A category is not a standing permission." Missing: what the permission is for ("to use the words that fit it"). The words "a category" also do not say that ETE categories are meant.
    14 — kept — "This rule contradicts STE Rule 1.5 and STE Rule 1.12, because each of them closes its list of categories." / "It contradicts nothing else."

### Checker B

    1. kept — "ETE adds five categories. Each one holds technical nouns and technical verbs." Read with "STE Rule 1.5 admits a technical noun that fits one or more of its twenty-two categories" / "STE Rule 1.12 admits a technical verb…" and the five section headings ("Engineering, design, process, and method", "Evented systems and autonomous components", "Agent artifacts", "Human-computer interaction (HCI)", "Deliberation and speech").
    2. kept — "Each one holds technical nouns and technical verbs."
    3. kept — "The five categories are declared here and nowhere else."
    4. kept — "An entry names its category and its part of speech." and "The word's vocabulary entry names its category."
    5. kept — "An entry names its category and its part of speech. STE Rules 1.7 and 1.13 depend on which part of speech a word is reserved as."
    6. kept — "Try STE category 7 before this one. It covers concepts, design, calculations, and methodologies."
    7. kept — "A word admitted to an ETE category is reserved, used, and bound exactly as a word in an STE category is."
    8. kept — "Try an STE category first." / "Use an ETE category only for a word that no STE category holds." (the counts are in "its twenty-two categories" / "its four categories").
    9. kept — "Try an STE category first." / "Use an ETE category only for a word that no STE category holds." (The word "reserve" is not used here, but the ban on using ETE where an STE category holds requires the same behavior.)
    10. kept — "Reserve words one at a time."
    11. kept — "The word's vocabulary entry names its category." / "The same entry states what the STE dictionary says about the word."
    12. kept — "A word with no entry is not reserved."
    13. less precise — "A category is not a standing permission." Missing: what the permission would be for, which is using the words that fit the category. That leaves the line ambiguous.
    14. kept — "This rule contradicts STE Rule 1.5 and STE Rule 1.12, because each of them closes its list of categories." / "It contradicts nothing else."

### The re-check, after the repairs

    1 — kept — "ETE adds five categories. Each one holds technical nouns and technical verbs." together with the five section headings "Engineering, design, process, and method", "Evented systems and autonomous components", "Agent artifacts", "Human-computer interaction (HCI)", "Deliberation and speech". Read against "STE Rule 1.5 admits a technical noun that fits one or more of its twenty-two categories", adding categories admits words in the same way.
    2 — kept — "Each one holds technical nouns and technical verbs."
    3 — kept — "The five categories are declared here and nowhere else."
    4 — kept — "An entry names its category and its part of speech." / "The word's vocabulary entry names its category."
    5 — kept — "An entry names its category and its part of speech. STE Rules 1.7 and 1.13 depend on which part of speech a word is reserved as."
    6 — kept — "Try STE category 7 before this one. It covers concepts, design, calculations, and methodologies."
    7 — kept — "A word admitted to an ETE category is reserved, used, and bound exactly as a word in an STE category is."
    8 — kept — "Try an STE category first." / "Use an ETE category only for a word that no STE category holds." The counts come from "its twenty-two categories" and "its four categories".
    9 — kept — "Try an STE category first." / "Use an ETE category only for a word that no STE category holds." Together these require the same behavior.
    10 — kept — "Reserve words one at a time."
    11 — kept — "The word's vocabulary entry names its category." / "The same entry states what the STE dictionary says about the word."
    12 — kept — "A word with no entry is not reserved."
    13 — kept — "An ETE category is not a standing permission to use the words that fit it."
    14 — kept — "This rule contradicts STE Rule 1.5 and STE Rule 1.12, because each of them closes its list of categories." / "It contradicts nothing else."

## ete-fixes-the-meaning-of-a-word-in-its-category

### The compressor's answer

    1. The STE dictionary carries no technical nouns. STE Rule 1.8 sends the reader to the company glossary for them.
    2. A technical noun takes its meaning from the vocabulary that reserves it.
    3. Rules 1.5 and 1.6 reach only a word the dictionary omits or refuses. So an approved word cannot be reserved as a technical noun under them.
    4. STE Rule 1.3 requires an approved word to keep the dictionary's meaning and no other.
    5. A word reserved in an ETE category takes the meaning its ETE entry gives it.
    6. This holds whether the STE dictionary omits the word, refuses it, or approves it with a different meaning.
    7. This contradicts STE Rule 1.3.
    8. Mark each word reserved this way in its package's vocabulary.
    9. For example, `LOOP (n)` is approved as *a circular shape made in a flexible material*, and Waytide's loop is the DBE cycle.
    10. This is the most expensive reservation ETE makes, and the entry carries the cost.
    11. The entry quotes the approved meaning.
    12. The entry states why the approved meaning does not carry Waytide's.
    13. Recast the sentence instead where the approved meaning serves.
    14. STE Rule 9.1 covers the case where a word-for-word replacement will not do.
    15. This reservation is the last resort, not the first.
    16. An entry that does not argue against the approved meaning has not made the reservation.
    17. Use the STE dictionary's approved meaning where it serves.
    18. Recast the sentence under STE Rule 9.1 where a different word serves.
    19. Reserve the word in an ETE category only where neither serves.
    20. **Why:** a reader who meets an approved word believes they know it, and nothing in the sentence says otherwise. The other choice, a recast, would cost a settled term such as *the loop* in exchange for conformance on one word.

    CONTRADICTIONS: The bold heading "Recast the sentence instead where the approved meaning serves" (point 13) does not match "How to apply" (points 17 and 18). There, the approved meaning is used where it serves, and a recast is for where a different word serves. Both are kept as the source has them. Note also that "This contradicts STE Rule 1.3" (point 7) is a departure from STE that the rule states on purpose. It is not a contradiction inside the rule.

### The directives, as the listing agent gave them

    1. A technical noun takes its meaning from the vocabulary that reserves it (STE Rule 1.8 sends the reader to the company glossary for technical nouns).
    2. A word reserved in an ETE category takes the meaning its entry in the ETE gives it, whether the STE dictionary omits the word, refuses it, or approves it with a different meaning.
    3. Each word reserved in an ETE category with a meaning different from its STE-approved meaning must be marked in its package's vocabulary.
    4. The vocabulary entry for such a word must quote the STE dictionary's approved meaning.
    5. The vocabulary entry for such a word must state why the approved meaning does not serve, that is, why it does not carry Waytide's meaning.
    6. Use the STE dictionary's approved meaning of a word where it serves.
    7. Where the approved meaning does not serve but a different word does, recast the sentence under STE Rule 9.1 instead of reserving the word.
    8. Reserve an already-approved word in an ETE category only where neither the approved meaning nor a recast serves; this reservation is the last resort, not the first.
    9. An entry that does not argue against the approved meaning has not made the reservation.

### Checker A

    1. kept: "A technical noun takes its meaning from the vocabulary that reserves it." and "STE Rule 1.8 sends the reader to the company glossary for them."
    2. kept: "A word reserved in an ETE category takes the meaning its ETE entry gives it." and "This holds whether the STE dictionary omits the word, refuses it, or approves it with a different meaning."
    3. kept: "Mark each word reserved this way in its package's vocabulary." It is not clear what "this way" covers. It may cover every reserved word, not only one with a different approved meaning. That reading still requires the directive's behavior.
    4. kept: "The entry quotes the approved meaning."
    5. kept: "The entry states why the approved meaning does not carry Waytide's."
    6. kept: "Use the STE dictionary's approved meaning where it serves."
    7. less precise: "Recast the sentence under STE Rule 9.1 where a different word serves." What is missing: it does not state the condition "where the approved meaning does not serve". Also, line 13, "Recast the sentence instead where the approved meaning serves", says to recast in the case where line 17 says to use the approved meaning. That makes it unclear when to recast.
    8. kept: "Reserve the word in an ETE category only where neither serves." and "This reservation is the last resort, not the first."
    9. kept: "An entry that does not argue against the approved meaning has not made the reservation."

### Checker B

    1. kept: "A technical noun takes its meaning from the vocabulary that reserves it." / "STE Rule 1.8 sends the reader to the company glossary for them."
    2. kept: "A word reserved in an ETE category takes the meaning its ETE entry gives it." / "This holds whether the STE dictionary omits the word, refuses it, or approves it with a different meaning."
    3. less precise: "Mark each word reserved this way in its package's vocabulary." Missing: it does not say plainly that the marking is for words whose ETE meaning differs from the STE-approved meaning. "This way" could refer to every reserved word or only to those that contradict Rule 1.3.
    4. kept: "The entry quotes the approved meaning."
    5. kept: "The entry states why the approved meaning does not carry Waytide's."
    6. kept: "Use the STE dictionary's approved meaning where it serves."
    7. kept: "Recast the sentence under STE Rule 9.1 where a different word serves." / "Reserve the word in an ETE category only where neither serves." Line 13 confuses this. "Recast the sentence instead where the approved meaning serves" contradicts line 17, since the recast belongs where the approved meaning does not serve.
    8. kept: "Reserve the word in an ETE category only where neither serves." / "This reservation is the last resort, not the first."
    9. kept: "An entry that does not argue against the approved meaning has not made the reservation."

### The re-check, after the repairs

    1. kept — "A technical noun takes its meaning from the vocabulary that reserves it." / "STE Rule 1.8 sends the reader to the company glossary for them."
    2. kept — "A word reserved in an ETE category takes the meaning its ETE entry gives it." / "This holds whether the STE dictionary omits the word, refuses it, or approves it with a different meaning."
    3. kept — "Mark each word reserved with a meaning different from its approved meaning in its package's vocabulary."
    4. kept — "The entry quotes the approved meaning."
    5. kept — "The entry states why the approved meaning does not carry Waytide's."
    6. less precise — "Use the STE dictionary's approved meaning where it serves." Missing: line 13, "Recast the sentence instead where the approved meaning serves", contradicts this. It tells the reader to recast in the same case where this directive says to use the approved meaning, so the shorter version is ambiguous here.
    7. kept — "Where the approved meaning does not serve but a different word does, recast the sentence under STE Rule 9.1." / "Reserve the word in an ETE category only where neither serves."
    8. kept — "Reserve the word in an ETE category only where neither serves." / "This reservation is the last resort, not the first."
    9. kept — "An entry that does not argue against the approved meaning has not made the reservation."

## ordinary-vocabulary-is-not-reserved-and-not-rewritten

### The compressor's answer

    1. ETE conforms its terminology to the STE dictionary. It does not conform its ordinary vocabulary.
    2. This departs from STE Rule 1.1, which admits only approved words, technical nouns, and technical verbs.
    3. What a word names decides which side of the line it falls on.
    4. A word that names something in the subject field is terminology. It is either reserved or rewritten.
    5. A word that does a sentence's grammatical work, joins two statements, or qualifies one is ordinary vocabulary.
    6. Example: `branch` is terminology. `under` is not.
    7. Words such as `as`, `every`, `never`, `under`, `would`, `already`, and `may` are ordinary vocabulary. They are not technical nouns or verbs in any category.
    8. Do not reserve an ordinary-vocabulary word. Reserving it puts a false claim of conformance in a vocabulary.
    9. Do not rewrite prose to replace an ordinary-vocabulary word.
    10. To apply this rule, ask what a refused word names.
    11. Reserve the word in a category where it names something in the subject field.
    12. Rewrite the prose where an approved word says the same thing.
    13. Leave the word in place where it is ordinary vocabulary.
    14. Record no entry for an ordinary-vocabulary word.
    15. **Why:** the terminology is what a reader has to learn to use the method, and a misleading term costs the reader the concept. Conforming ordinary vocabulary is unbounded work that only buys a claim of conformance.

    CONTRADICTIONS: none. The source states openly that it departs from STE Rule 1.1. That is a deliberate break from an outside standard, not a conflict inside the rule.

### The directives, as the listing agent gave them

    1. Ordinary vocabulary refused by the STE dictionary must not be reserved.
    2. Ordinary vocabulary refused by the STE dictionary must not be rewritten to conform to the dictionary.
    3. ETE conforms its terminology.
    4. ETE does not conform its ordinary vocabulary.
    5. A word that names something in the subject field is terminology, and it must be reserved or rewritten.
    6. A word that does the sentence's grammatical work, joins two statements, or qualifies one is ordinary vocabulary, and the conform-or-reserve treatment does not apply to it.
    7. Decide whether a refused word is terminology or ordinary vocabulary by what the word names.
    8. A vocabulary must not carry a false claim of conformance, such as reserving a word that names nothing as a technical noun or technical verb.
    9. For a refused word, ask what it names.
    10. Reserve a refused word in a category where it names something in the subject field.
    11. Rewrite the prose where an approved word says the same thing as the refused word.
    12. Leave a refused word where it is when it is ordinary vocabulary.
    13. Record no vocabulary entry for a refused word that is ordinary vocabulary.

### Checker A

    1. kept: "Do not reserve an ordinary-vocabulary word."
    2. kept: "Do not rewrite prose to replace an ordinary-vocabulary word."
    3. kept: "ETE conforms its terminology to the STE dictionary."
    4. kept: "It does not conform its ordinary vocabulary."
    5. kept: "A word that names something in the subject field is terminology. It is either reserved or rewritten."
    6. kept: "A word that does a sentence's grammatical work, joins two statements, or qualifies one is ordinary vocabulary." together with "Do not reserve an ordinary-vocabulary word." and "Do not rewrite prose to replace an ordinary-vocabulary word."
    7. kept: "What a word names decides which side of the line it falls on."
    8. less precise: "Reserving it puts a false claim of conformance in a vocabulary." Missing: a general ban on a vocabulary carrying any false claim of conformance. The shorter version gives the false claim only as the result of reserving an ordinary word, not as something a vocabulary must never carry.
    9. kept: "To apply this rule, ask what a refused word names."
    10. kept: "Reserve the word in a category where it names something in the subject field."
    11. kept: "Rewrite the prose where an approved word says the same thing."
    12. kept: "Leave the word in place where it is ordinary vocabulary."
    13. kept: "Record no entry for an ordinary-vocabulary word."

### Checker B

    1. kept: "Do not reserve an ordinary-vocabulary word." (Item 10 of the shorter version, "ask what a refused word names", frames the subject as refused words.)
    2. kept: "Do not rewrite prose to replace an ordinary-vocabulary word." together with "ETE conforms its terminology to the STE dictionary. It does not conform its ordinary vocabulary."
    3. kept: "ETE conforms its terminology to the STE dictionary."
    4. kept: "It does not conform its ordinary vocabulary."
    5. kept: "A word that names something in the subject field is terminology. It is either reserved or rewritten."
    6. kept: "A word that does a sentence's grammatical work, joins two statements, or qualifies one is ordinary vocabulary." together with "Do not reserve an ordinary-vocabulary word." and "Do not rewrite prose to replace an ordinary-vocabulary word."
    7. kept: "What a word names decides which side of the line it falls on."
    8. less precise: "Reserving it puts a false claim of conformance in a vocabulary." and "They are not technical nouns or verbs in any category." Missing: the general ban on any false claim of conformance in a vocabulary. The shorter version states the false claim only as the result of reserving an ordinary-vocabulary word.
    9. kept: "To apply this rule, ask what a refused word names."
    10. kept: "Reserve the word in a category where it names something in the subject field."
    11. kept: "Rewrite the prose where an approved word says the same thing."
    12. kept: "Leave the word in place where it is ordinary vocabulary."
    13. kept: "Record no entry for an ordinary-vocabulary word."

### The re-check, after the repairs

    1. kept: "Do not reserve an ordinary-vocabulary word."
    2. kept: "Do not rewrite prose to replace an ordinary-vocabulary word."
    3. kept: "ETE conforms its terminology to the STE dictionary."
    4. kept: "It does not conform its ordinary vocabulary."
    5. kept: "A word that names something in the subject field is terminology. It is either reserved or rewritten."
    6. kept: "A word that does a sentence's grammatical work, joins two statements, or qualifies one is ordinary vocabulary." together with "Do not reserve an ordinary-vocabulary word." and "Do not rewrite prose to replace an ordinary-vocabulary word."
    7. kept: "What a word names decides which side of the line it falls on."
    8. kept: "Reserving it puts a false claim of conformance in a vocabulary. A vocabulary carries no false claim of conformance." and "They are not technical nouns or verbs in any category."
    9. kept: "To apply this rule, ask what a refused word names."
    10. kept: "Reserve the word in a category where it names something in the subject field."
    11. kept: "Rewrite the prose where an approved word says the same thing."
    12. kept: "Leave the word in place where it is ordinary vocabulary."
    13. kept: "Record no entry for an ordinary-vocabulary word."

## waytide-prose-conforms-to-the-ste-writing-rules

### The compressor's answer

    1. ASD-STE100 holds 53 writing rules in nine sections.
    2. These rules bind Waytide's prose, its rules, its records, its commit messages, and the agent's answers.
    3. This rule holds the STE rules Waytide breaks most.
    4. When a new STE rule is met in use, add it to the table, and add the phrase that met it.
    5. This rule is part of Eventide Technical English, or ETE. ETE is Waytide's implementation of the standard.
    6. The waytide-keeps-its-word-where-the-ste-word-means-something-else rule states what ETE is and the order its two parts decide in.
    7. Three rules carry ETE's departures from the standard. Each names the STE rule it contradicts.
    8. The ete-declares-its-own-categories rule adds five categories of Waytide's own.
    9. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take the meaning its entry gives.
    10. The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves the ordinary words alone.
    11. Check a phrase against Waytide's vocabulary first.
    12. Then check it against the STE dictionary.
    13. Then check it against the writing rules below.

    ## The writing rules

    | The rule | What it requires |
    |---|---|
    | STE Rule 1.3 | Use an approved word only with its approved meaning. The ete-fixes-the-meaning-of-a-word-in-its-category rule overrides this for a word reserved in an ETE category |
    | STE Rule 3.6 | Use the active voice. In descriptive writing the passive is permitted only where the agent is unknown |
    | STE Rule 4.2 | Do not omit words. Its own words: *Each sentence must have all its parts* |
    | STE Rule 8.1 | Do not use the semicolon. The standard's reason is that a semicolon lets you write very long sentences |
    | STE Rules 5.1 and 6.3 | A procedural sentence takes 20 words. A descriptive sentence takes 25 |
    | STE Rule 6.6 | A descriptive paragraph takes six sentences |

    ## Two worked phrases

    1. The agent wrote each of these phrases. Each broke Waytide's vocabulary before it broke the standard.

    ### `swept across 20 files`

    1. **`swept`**: the `language` vocabulary discontinues `sweep` for `conform`. The STE dictionary replaces `sweep (v)` with `SCAN`, which does not carry the meaning either.
    2. **`across`**: `ACROSS (prep)` is approved only as *from one side to the other*. STE Rule 1.3 forbids other meanings. Write `in`.
    3. **`was swept`**: this is the passive with a known agent, against STE Rule 3.6.
    4. **The semicolon** in the sentence that held it is against STE Rule 8.1.

    Before: `` `gate` is a technical noun; its verb form is `wait`, swept across 20 files. ``

    After: `` `gate` is a technical noun. Its verb form is `wait`. Twenty files conform to this. ``

    ### `The two checks green`

    1. **`green`**: the `testing` vocabulary substitutes `verified`. The word is also absent from the STE dictionary.
    2. **`The two`**: `the two (adj)` is not approved. The STE dictionary gives `THE TWO (TN)`, as in `ATTACH THE TWO ENDS`.
    3. **No verb**: this is against STE Rule 4.2.

    Before: `The two checks green`

    After: `The two checks are verified.` Or, to say what happened rather than name a state: `The two checks found no defect.`

    4. **`checks` survives.** `CHECK (n)` is approved, as in `DO A CHECK OF THE …`.
    5. Only `check (v)` is not approved. The STE dictionary gives `MAKE SURE` for it.
    6. **Why:** the STE dictionary reaches one word at a time, and the writing rules reach every sentence. A writer who reads only the dictionary still writes long passive sentences. Each rule is recorded beside the phrase that met it, so a rule is findable by the shape of the mistake.

    CONTRADICTIONS: none. One tension, not a contradiction: the source's "How to apply" says "Write the active voice" with no condition. Its table entry for STE Rule 3.6 permits the passive in descriptive writing where the agent is unknown. I kept the table's qualified form.

### The directives, as the listing agent gave them

    1. Waytide's prose must conform to the 53 ASD-STE100 writing rules. This covers its rules, its records, its commit messages, and the agent's answers.
    2. When Waytide is found breaking another STE writing rule in use, add that rule to this rule's table and add the phrase that broke it, recorded beside the rule.
    3. When a phrase is checked, Waytide's own vocabulary decides first and the STE standard decides second.
    4. Check a phrase against Waytide's vocabulary first, then against the STE dictionary, then against the STE writing rules.
    5. Each rule that carries an ETE departure from the STE standard must name the STE rule it contradicts.
    6. Leave ordinary vocabulary alone: it is not reserved and not rewritten.
    7. Use an approved STE word only with its approved meaning (STE Rule 1.3).
    8. A word reserved in an ETE category takes the meaning its entry gives, which overrides STE Rule 1.3.
    9. Use the active voice (STE Rule 3.6).
    10. In descriptive writing, use the passive only where the agent is unknown.
    11. Do not omit words. Each sentence must have all its parts, including a verb (STE Rule 4.2).
    12. Do not use the semicolon (STE Rule 8.1).
    13. Keep a procedural sentence to 20 words or fewer (STE Rules 5.1 and 6.3).
    14. Keep a descriptive sentence to 25 words or fewer (STE Rules 5.1 and 6.3).
    15. Keep a descriptive paragraph to six sentences or fewer (STE Rule 6.6).
    16. Do not use `sweep` (it is discontinued in the `language` vocabulary). Use `conform` in its place, not STE's `SCAN`.
    17. Use `across` only in its approved meaning, "from one side to the other". Write `in` where it would mean "throughout" (for example, "in 20 files").
    18. Do not use `green` for a passed check. The `testing` vocabulary substitutes `verified`.
    19. Do not use `the two` as an adjective. STE approves `THE TWO` only as a technical name, as in `ATTACH THE TWO ENDS`.
    20. Do not use `check` as a verb. Use `make sure` in its place.
    21. `check` may be used as a noun, as in `DO A CHECK OF THE …`.
    22. To say what happened rather than name a state, a result may be written as an event, for example `The two checks found no defect.`

### Checker A

    1. kept — "These rules bind Waytide's prose, its rules, its records, its commit messages, and the agent's answers." with "ASD-STE100 holds 53 writing rules in nine sections."
    2. less precise — "When a new STE rule is met in use, add it to the table, and add the phrase that met it." / "Each rule is recorded beside the phrase that met it" — "met" is weaker than "broken". Recording the phrase beside the rule appears only as a description, not as part of the instruction.
    3. less precise — "the order its two parts decide in" (delegated to another rule) and "Check a phrase against Waytide's vocabulary first." — it does not state that the vocabulary decides first and the standard second. Only the order of checking is given.
    4. kept — "Check a phrase against Waytide's vocabulary first." / "Then check it against the STE dictionary." / "Then check it against the writing rules below."
    5. kept — "Three rules carry ETE's departures from the standard. Each names the STE rule it contradicts."
    6. kept — "The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves the ordinary words alone."
    7. kept — "STE Rule 1.3 | Use an approved word only with its approved meaning."
    8. kept — "lets a reserved word take the meaning its entry gives" / "overrides this for a word reserved in an ETE category"
    9. kept — "STE Rule 3.6 | Use the active voice."
    10. kept — "In descriptive writing the passive is permitted only where the agent is unknown"
    11. kept — "Do not omit words. Its own words: *Each sentence must have all its parts*" / "**No verb**: this is against STE Rule 4.2."
    12. kept — "STE Rule 8.1 | Do not use the semicolon."
    13. less precise — "A procedural sentence takes 20 words." It does not say "or fewer", so it does not clearly set a maximum.
    14. less precise — "A descriptive sentence takes 25". It does not say "or fewer", so it does not clearly set a maximum.
    15. less precise — "A descriptive paragraph takes six sentences". It does not say "or fewer", so it does not clearly set a maximum.
    16. kept — "the `language` vocabulary discontinues `sweep` for `conform`. The STE dictionary replaces `sweep (v)` with `SCAN`, which does not carry the meaning either."
    17. less precise — "`ACROSS (prep)` is approved only as *from one side to the other*. ... Write `in`." It does not say that `in` replaces `across` only where `across` would mean "throughout". The "in 20 files" example is also missing.
    18. kept — "the `testing` vocabulary substitutes `verified`."
    19. kept — "`the two (adj)` is not approved. The STE dictionary gives `THE TWO (TN)`, as in `ATTACH THE TWO ENDS`."
    20. kept — "Only `check (v)` is not approved. The STE dictionary gives `MAKE SURE` for it."
    21. kept — "`CHECK (n)` is approved, as in `DO A CHECK OF THE …`."
    22. kept — "Or, to say what happened rather than name a state: `The two checks found no defect.`"

### Checker B

    1. kept: "ASD-STE100 holds 53 writing rules" plus "These rules bind Waytide's prose, its rules, its records, its commit messages, and the agent's answers."
    2. less precise: "When a new STE rule is met in use, add it to the table, and add the phrase that met it." / "Each rule is recorded beside the phrase that met it". Missing: "met" is ambiguous. It can mean conformed to, where the full version says the phrase broke the rule.
    3. less precise: "the order its two parts decide in" / "Each broke Waytide's vocabulary before it broke the standard." Missing: the shorter version does not say that Waytide's vocabulary decides first and STE second. It sends that question to another rule.
    4. kept: "Check a phrase against Waytide's vocabulary first." / "Then check it against the STE dictionary." / "Then check it against the writing rules below."
    5. kept: "Three rules carry ETE's departures from the standard. Each names the STE rule it contradicts."
    6. kept: "The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves the ordinary words alone."
    7. kept: "STE Rule 1.3 | Use an approved word only with its approved meaning."
    8. kept: "The ete-fixes-the-meaning-of-a-word-in-its-category rule overrides this for a word reserved in an ETE category" / "lets a reserved word take the meaning its entry gives."
    9. kept: "STE Rule 3.6 | Use the active voice."
    10. kept: "In descriptive writing the passive is permitted only where the agent is unknown"
    11. kept: "STE Rule 4.2 | Do not omit words. Its own words: *Each sentence must have all its parts*" / "No verb: this is against STE Rule 4.2."
    12. kept: "STE Rule 8.1 | Do not use the semicolon."
    13. less precise: "A procedural sentence takes 20 words." Missing: "or fewer". As written, 20 reads as an exact count, not a maximum.
    14. less precise: "A descriptive sentence takes 25". Missing: "or fewer". It is not stated as a maximum.
    15. less precise: "A descriptive paragraph takes six sentences". Missing: "or fewer". It is not stated as a maximum.
    16. kept: "the `language` vocabulary discontinues `sweep` for `conform`. The STE dictionary replaces `sweep (v)` with `SCAN`, which does not carry the meaning either."
    17. less precise: "`ACROSS (prep)` is approved only as *from one side to the other*. STE Rule 1.3 forbids other meanings. Write `in`." Missing: the condition for `in`, which is where `across` would mean "throughout". The shorter version shows it only through the one example.
    18. kept: "`green`: the `testing` vocabulary substitutes `verified`."
    19. kept: "`the two (adj)` is not approved. The STE dictionary gives `THE TWO (TN)`, as in `ATTACH THE TWO ENDS`."
    20. kept: "Only `check (v)` is not approved. The STE dictionary gives `MAKE SURE` for it."
    21. kept: "`checks` survives. `CHECK (n)` is approved, as in `DO A CHECK OF THE …`."
    22. kept: "Or, to say what happened rather than name a state: `The two checks found no defect.`"

### The re-check, after the repairs

    1. kept: "ASD-STE100 holds 53 writing rules" + "These rules bind Waytide's prose, its rules, its records, its commit messages, and the agent's answers."
    2. kept: "When another STE rule is found broken in use, add it to the table. Record beside it the phrase that broke it."
    3. kept: "Waytide's vocabulary decides first, and the standard second."
    4. kept: "Check a phrase against Waytide's vocabulary first." / "Then check it against the STE dictionary." / "Then check it against the writing rules below."
    5. less precise: "Three rules carry ETE's departures from the standard. Each names the STE rule it contradicts." Missing: it describes three existing rules. It does not require every rule that carries a departure to name the STE rule.
    6. kept: "The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves the ordinary words alone."
    7. kept: "STE Rule 1.3 | Use an approved word only with its approved meaning."
    8. kept: "The ete-fixes-the-meaning-of-a-word-in-its-category rule overrides this for a word reserved in an ETE category" + "lets a reserved word take the meaning its entry gives."
    9. kept: "STE Rule 3.6 | Use the active voice."
    10. kept: "In descriptive writing the passive is permitted only where the agent is unknown"
    11. kept: "Do not omit words. Its own words: *Each sentence must have all its parts*" + "**No verb**: this is against STE Rule 4.2."
    12. kept: "STE Rule 8.1 | Do not use the semicolon."
    13. kept: "STE Rules 5.1 and 6.3 | A procedural sentence takes 20 words or fewer."
    14. kept: "A descriptive sentence takes 25 or fewer"
    15. kept: "STE Rule 6.6 | A descriptive paragraph takes six sentences or fewer"
    16. kept: "the `language` vocabulary discontinues `sweep` for `conform`. The STE dictionary replaces `sweep (v)` with `SCAN`, which does not carry the meaning either."
    17. kept: "`ACROSS (prep)` is approved only as *from one side to the other*. ... Where `across` would mean *throughout*, write `in`, as in `in 20 files`."
    18. kept: "**`green`**: the `testing` vocabulary substitutes `verified`."
    19. kept: "`the two (adj)` is not approved. The STE dictionary gives `THE TWO (TN)`, as in `ATTACH THE TWO ENDS`."
    20. kept: "Only `check (v)` is not approved. The STE dictionary gives `MAKE SURE` for it."
    21. kept: "`CHECK (n)` is approved, as in `DO A CHECK OF THE …`."
    22. kept: "Or, to say what happened rather than name a state: `The two checks found no defect.`"

## expand-abbreviations-on-first-use

### The compressor's answer

    1. Do not use an abbreviation the reader may not already know without spelling it out.
    2. The first time an abbreviation appears, write the full term with the abbreviation in parentheses: "human-in-the-loop design (HITL)".
    3. This applies in a document and in conversation with the user alike.
    4. After the first use, the short form is fine within the same document or exchange.
    5. When in doubt, prefer the full term.
    6. Use an abbreviation only when it is more recognizable than what it stands for, for example "AI", "URL", "HTTP".
    7. Skip the expansion only for abbreviations more widely known than their expansions.
    8. If the expansion is clearer than the short form, use the expansion alone.
    9. Project abbreviations count too. A name coined inside the project, such as DBE for design-by-efferent, is defined where it is introduced.
    10. Use a project abbreviation freely only after its definition, such as the design-by-efferent vocabulary.
    11. **Why:** an unexplained abbreviation forces the reader to guess or look it up. It saves the writer a few letters and costs the reader the meaning.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Do not use an abbreviation that the reader may not already know without spelling it out.
    2. The first time an abbreviation appears, whether in a document or in conversation, write the full term with the abbreviation in parentheses, for example "human-in-the-loop design (HITL)".
    3. After an abbreviation has been introduced with its full term, the short form may be used within the same document or exchange.
    4. When in doubt, prefer the full term to the abbreviation.
    5. Use an abbreviation only when it is genuinely more recognizable than what it stands for, for example "AI", "URL", "HTTP".
    6. If the expansion is clearer than the short form, use the expansion instead of the abbreviation.
    7. An abbreviation coined inside the project, such as DBE for design-by-efferent, must be defined where it is introduced, for example in the design-by-efferent vocabulary.
    8. A project-coined abbreviation may be used freely only after it has been defined.
    9. Skip the expansion of an abbreviation only when the abbreviation is more widely known than its expansion.
    10. The requirement to expand abbreviations on first use applies to conversation with the user as much as to the files.

### Checker A

    1 — kept — "Do not use an abbreviation the reader may not already know without spelling it out."
    2 — kept — "The first time an abbreviation appears, write the full term with the abbreviation in parentheses: "human-in-the-loop design (HITL)"." together with "This applies in a document and in conversation with the user alike."
    3 — kept — "After the first use, the short form is fine within the same document or exchange."
    4 — kept — "When in doubt, prefer the full term."
    5 — kept — "Use an abbreviation only when it is more recognizable than what it stands for, for example "AI", "URL", "HTTP"." (the word "genuinely" is dropped, but the condition is the same)
    6 — kept — "If the expansion is clearer than the short form, use the expansion alone."
    7 — less precise — "A name coined inside the project, such as DBE for design-by-efferent, is defined where it is introduced." Missing: the obligation. "Is defined" reads as a description rather than "must be defined". The example of where it is defined (the design-by-efferent vocabulary) also moved to line 10, attached to the definition rather than to the place it is introduced.
    8 — kept — "Use a project abbreviation freely only after its definition"
    9 — kept — "Skip the expansion only for abbreviations more widely known than their expansions."
    10 — kept — "This applies in a document and in conversation with the user alike."

### Checker B

    1 — kept — "Do not use an abbreviation the reader may not already know without spelling it out."
    2 — kept — "The first time an abbreviation appears, write the full term with the abbreviation in parentheses: "human-in-the-loop design (HITL)"." together with "This applies in a document and in conversation with the user alike."
    3 — kept — "After the first use, the short form is fine within the same document or exchange." (The first use is the expanded one item 2 requires, so "introduced with its full term" is implied.)
    4 — kept — "When in doubt, prefer the full term."
    5 — kept — "Use an abbreviation only when it is more recognizable than what it stands for, for example "AI", "URL", "HTTP"." (The word "genuinely" is dropped, but the condition is unchanged.)
    6 — kept — "If the expansion is clearer than the short form, use the expansion alone."
    7 — less precise — "A name coined inside the project, such as DBE for design-by-efferent, is defined where it is introduced." Missing: the original's "must". "Is defined" describes rather than requires. The example of where the definition goes, the design-by-efferent vocabulary, has also moved to item 10.
    8 — kept — "Use a project abbreviation freely only after its definition, such as the design-by-efferent vocabulary."
    9 — kept — "Skip the expansion only for abbreviations more widely known than their expansions."
    10 — kept — "This applies in a document and in conversation with the user alike."

### The re-check, after the repairs

    1. kept — "Do not use an abbreviation the reader may not already know without spelling it out."
    2. kept — "The first time an abbreviation appears, write the full term with the abbreviation in parentheses: \"human-in-the-loop design (HITL)\"" together with "This applies in a document and in conversation with the user alike."
    3. kept — "After the first use, the short form is fine within the same document or exchange."
    4. kept — "When in doubt, prefer the full term."
    5. kept — "Use an abbreviation only when it is more recognizable than what it stands for, for example \"AI\", \"URL\", \"HTTP\"."
    6. kept — "If the expansion is clearer than the short form, use the expansion alone."
    7. kept — "A name coined inside the project, such as DBE for design-by-efferent, must be defined where it is introduced." (the example "the design-by-efferent vocabulary" is moved to item 10, where it still names the place of definition)
    8. kept — "Use a project abbreviation freely only after its definition"
    9. kept — "Skip the expansion only for abbreviations more widely known than their expansions."
    10. kept — "This applies in a document and in conversation with the user alike."

## language-is-precise-here

### The compressor's answer

    1. Use language very precisely. Words are load-bearing, not decoration.
    2. Choose words deliberately, hold to them, and change them only on purpose.
    3. Choosing a word chooses the concept that the work is then done with.
    4. Naming concepts literally and dropping slang are the two disciplines that make this precision achievable.
    5. Precision is not formality, and it is not plainness either.
    6. The precise word is the one that already means exactly this.
    7. Do not let a colloquialism bury the extant technical term under a vaguer everyday word. Examples: "wrap" over "mediates," "green" over "verified," and "happy path" over "normal path."
    8. Recover the established term the everyday word has displaced.
    9. Do not use dramatic jargon, meaning an impressive or academic term reached for to signal sophistication.
    10. Lean neither toward the plain nor toward the technical.
    11. Hold the term that says the thing exactly. It is as often an established technical term as a plain one.
    12. Treat the selection of a word as a design decision, with the same deliberation as any other.
    13. When two words are available, choose the one that *is* the thing, not the one that sounds better.
    14. When a word is wrong, change it everywhere the concept appears.
    15. Do not let a term mean one thing in one place and another thing elsewhere.
    16. When a precise word is missing, name the concept literally rather than reaching for the nearest metaphor.
    17. Expect this to feel like more effort than it is worth. Then an imprecise word costs a day.
    18. **Why:** The terminology is how the approach is taught and how people stay oriented to the same concepts. Imprecise words do quiet damage. Metaphors carry unintended baggage, overdramatic words distort judgment, and loose synonyms merge concepts the design keeps apart.

    CONTRADICTIONS: none. (Note: the source's closing sentence, "Then an imprecise word costs a day," is elliptical and reads as incomplete. I kept it word for word, not reinterpreted.)

### The directives, as the listing agent gave them

    1. Use language very precisely.
    2. Choose words deliberately.
    3. Hold to a word once it is chosen.
    4. Change a word only on purpose.
    5. Name concepts literally.
    6. Drop slang.
    7. Do not mistake precision for formality.
    8. Do not mistake precision for plainness.
    9. Use the word that already means exactly the thing.
    10. Do not bury the extant technical term under a vaguer everyday word or colloquialism (for example, "wrap" in place of "mediates," "green" in place of "verified," "happy path" in place of "normal path").
    11. Recover the established technical term that an everyday word has displaced.
    12. Do not use dramatic jargon, meaning an impressive or academic term reached for to signal sophistication.
    13. Do not lean toward the plain or toward the technical; hold the term that says the thing exactly, whether it is an established technical term or a plain one.
    14. Do not use a metaphor that carries baggage the reader cannot unsee.
    15. Do not use an overdramatic word that distorts judgment (for example, one that makes a routine tidying read as an urgent repair).
    16. Do not use a loose synonym that merges two concepts the design depends on keeping apart.
    17. Treat the selection of a word as a design decision, with the same deliberation as any other design decision.
    18. When two words are available, choose the one that is the thing, not the one that sounds better.
    19. When a word is wrong, change it.
    20. When a word is changed, change it everywhere the concept appears.
    21. Do not let a term mean one thing in one place and another thing elsewhere.
    22. When a precise word is missing, name the concept literally instead of reaching for the nearest metaphor.

### Checker A

    1. kept — "Use language very precisely."
    2. kept — "Choose words deliberately"
    3. kept — "hold to them"
    4. kept — "change them only on purpose"
    5. less precise — "Naming concepts literally and dropping slang are the two disciplines that make this precision achievable." Missing: this describes the practice but does not instruct it.
    6. less precise — "dropping slang are the two disciplines that make this precision achievable." Missing: this describes the practice but does not instruct it.
    7. kept — "Precision is not formality"
    8. kept — "and it is not plainness either."
    9. kept — "The precise word is the one that already means exactly this."
    10. kept — "Do not let a colloquialism bury the extant technical term under a vaguer everyday word. Examples: "wrap" over "mediates," "green" over "verified," and "happy path" over "normal path.""
    11. kept — "Recover the established term the everyday word has displaced."
    12. kept — "Do not use dramatic jargon, meaning an impressive or academic term reached for to signal sophistication."
    13. kept — "Lean neither toward the plain nor toward the technical." / "Hold the term that says the thing exactly. It is as often an established technical term as a plain one."
    14. less precise — "Metaphors carry unintended baggage" (in the Why). Missing: it appears only as a reason, not a prohibition, and "the reader cannot unsee" is gone.
    15. less precise — "overdramatic words distort judgment" (in the Why). Missing: it appears only as a reason, not a prohibition, and the routine-tidying-as-urgent-repair example is gone.
    16. less precise — "loose synonyms merge concepts the design keeps apart" (in the Why). Missing: it appears only as a reason, not a prohibition.
    17. kept — "Treat the selection of a word as a design decision, with the same deliberation as any other."
    18. kept — "When two words are available, choose the one that *is* the thing, not the one that sounds better."
    19. kept — "When a word is wrong, change it"
    20. kept — "change it everywhere the concept appears."
    21. kept — "Do not let a term mean one thing in one place and another thing elsewhere."
    22. kept — "When a precise word is missing, name the concept literally rather than reaching for the nearest metaphor."

### Checker B

    1. kept: "Use language very precisely."
    2. kept: "Choose words deliberately"
    3. kept: "hold to them"
    4. kept: "change them only on purpose"
    5. less precise: "Naming concepts literally and dropping slang are the two disciplines that make this precision achievable." It describes the practice and never directs it. The only direct instruction is the conditional one in item 16 ("name the concept literally"), which applies when a precise word is missing.
    6. less precise: "dropping slang are the two disciplines that make this precision achievable." It describes slang-dropping and never directs it.
    7. kept: "Precision is not formality"
    8. kept: "and it is not plainness either."
    9. kept: "The precise word is the one that already means exactly this." Read with "Use language very precisely."
    10. less precise: "Do not let a colloquialism bury the extant technical term under a vaguer everyday word. Examples: "wrap" over "mediates," "green" over "verified," and "happy path" over "normal path."" The original forbids burying the term under either an everyday word or a colloquialism. The shorter version mixes the two up, making the colloquialism the thing that does the burying and the everyday word the thing it buries under.
    11. kept: "Recover the established term the everyday word has displaced."
    12. kept: "Do not use dramatic jargon, meaning an impressive or academic term reached for to signal sophistication."
    13. kept: "Lean neither toward the plain nor toward the technical." / "Hold the term that says the thing exactly. It is as often an established technical term as a plain one."
    14. less precise: "Metaphors carry unintended baggage" (in the Why). It is a reason, not a prohibition. "The reader cannot unsee" is gone.
    15. less precise: "overdramatic words distort judgment" (in the Why). It is a reason, not a prohibition. The example (a routine tidying read as an urgent repair) is gone.
    16. less precise: "loose synonyms merge concepts the design keeps apart" (in the Why). It is a reason, not a prohibition.
    17. kept: "Treat the selection of a word as a design decision, with the same deliberation as any other."
    18. kept: "When two words are available, choose the one that *is* the thing, not the one that sounds better."
    19. kept: "When a word is wrong, change it"
    20. less precise: "When a word is wrong, change it everywhere the concept appears." Here the change-it-everywhere requirement applies only when a word is wrong. The original applies it to any change of a word, such as a change made on purpose.
    21. kept: "Do not let a term mean one thing in one place and another thing elsewhere."
    22. kept: "When a precise word is missing, name the concept literally rather than reaching for the nearest metaphor."

### The re-check, after the repairs

    1. kept — "Use language very precisely."
    2. kept — "Choose words deliberately"
    3. kept — "hold to them"
    4. kept — "change them only on purpose"
    5. kept — "Name concepts literally"
    6. kept — "drop slang"
    7. kept — "Precision is not formality"
    8. kept — "and it is not plainness either"
    9. kept — "The precise word is the one that already means exactly this." (stated as a definition, not an imperative, but it requires the same behavior)
    10. kept — "Do not bury the extant technical term under a vaguer everyday word or a colloquialism. Examples: "wrap" over "mediates," "green" over "verified," and "happy path" over "normal path.""
    11. kept — "Recover the established term the everyday word has displaced."
    12. kept — "Do not use dramatic jargon, meaning an impressive or academic term reached for to signal sophistication."
    13. kept — "Lean neither toward the plain nor toward the technical." together with "Hold the term that says the thing exactly. It is as often an established technical term as a plain one."
    14. kept — "Do not use a metaphor whose baggage the reader cannot unsee."
    15. less precise — "Do not use an overdramatic word that distorts judgment." Missing: the example (a routine tidying that reads as an urgent repair), which shows what distorting judgment means.
    16. kept — "Do not use a loose synonym that merges two concepts the design keeps apart." ("keeps apart" in place of "depends on keeping apart" requires the same behavior)
    17. kept — "Treat the selection of a word as a design decision, with the same deliberation as any other."
    18. kept — "When two words are available, choose the one that *is* the thing, not the one that sounds better."
    19. kept — "When a word is wrong, change it."
    20. kept — "When a word is changed, change it everywhere the concept appears."
    21. kept — "Do not let a term mean one thing in one place and another thing elsewhere."
    22. kept — "When a precise word is missing, name the concept literally rather than reaching for the nearest metaphor."

    Result: 21 of the 22 directives are kept, one is less precise (15), and none are lost.

## lead-with-a-summary-before-details

### The compressor's answer

    1. Open a response with a short summary: the conclusion, decision, or state.
    2. Put the supporting detail below the summary.
    3. Order the response so the reader can tell what must be read from what may be read.
    4. The summary carries the essential. The details are for whoever wants them.
    5. Be economical. Length is not thoroughness.
    6. Cut words that carry no information. Say what informs the reader, and stop.
    7. Prefer a short answer that can be expanded on request over a long one that pre-empts every question.
    8. **Why:** the reader's attention is scarce. Summary-first lets the reader grasp the point at once and choose whether to read on.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Open a response with a short summary (the conclusion, decision, or state).
    2. Put the supporting detail below the summary.
    3. Order the response so the reader can tell what must be read from what may be read.
    4. The summary must carry the essential.
    5. Be economical: do not treat length as thoroughness, and do not pad.
    6. Say what informs the reader, and stop.
    7. Prefer a short answer that can be expanded on request over a long one that pre-empts every question.
    8. Put the must-read before the may-read.
    9. Cut words that carry no information.

### Checker A

    1. kept: "Open a response with a short summary: the conclusion, decision, or state."
    2. kept: "Put the supporting detail below the summary."
    3. kept: "Order the response so the reader can tell what must be read from what may be read."
    4. kept: "The summary carries the essential." (It is worded as a description rather than "must", but in a numbered list of directives it requires the same behavior.)
    5. less precise: "Be economical. Length is not thoroughness." What is missing is the explicit "do not pad". "Cut words that carry no information" covers it only in part.
    6. kept: "Say what informs the reader, and stop."
    7. kept: "Prefer a short answer that can be expanded on request over a long one that pre-empts every question."
    8. less precise: "Order the response so the reader can tell what must be read from what may be read" and "The details are for whoever wants them." What is missing is the explicit order: the must-read comes before the may-read. The shorter version only requires that the two can be told apart, and implies the order only through summary-first.
    9. kept: "Cut words that carry no information."

### Checker B

    Of the 9 directives, the shorter version keeps 8 and states 1 less precisely. None are lost.

    1. kept: "Open a response with a short summary: the conclusion, decision, or state."
    2. kept: "Put the supporting detail below the summary."
    3. kept: "Order the response so the reader can tell what must be read from what may be read."
    4. kept: "The summary carries the essential."
    5. kept: "Be economical. Length is not thoroughness." The no-padding part is carried by "Cut words that carry no information."
    6. kept: "Say what informs the reader, and stop."
    7. kept: "Prefer a short answer that can be expanded on request over a long one that pre-empts every question."
    8. less precise: "Order the response so the reader can tell what must be read from what may be read" and "The details are for whoever wants them." Missing: no line says the must-read goes *before* the may-read. Item 3 only asks that the two can be told apart. The order follows only from summary-first, and only for the summary.
    9. kept: "Cut words that carry no information."

### The re-check, after the repairs

    The shorter version keeps all nine directives. None is less precise and none is lost.

    1. kept — "Open a response with a short summary: the conclusion, decision, or state."
    2. kept — "Put the supporting detail below the summary."
    3. kept — "Order the response so the reader can tell what must be read from what may be read."
    4. kept — "The summary carries the essential."
    5. kept — "Be economical, and do not pad. Length is not thoroughness."
    6. kept — "Say what informs the reader, and stop."
    7. kept — "Prefer a short answer that can be expanded on request over a long one that pre-empts every question."
    8. kept — "Put the must-read before the may-read."
    9. kept — "Cut words that carry no information."

## name-literally-not-by-analogy

### The compressor's answer

    1. Name a concept by describing literally what it is.
    2. Reject any name that makes the reader memorize an arbitrary mapping back to the actual idea.
    3. Reject real-world analogies and metaphors, e.g. "the menu problem," "menu trap."
    4. A metaphor is itself jargon, because the reader must learn and carry its mapping.
    5. A vivid metaphor still fails.
    6. Reject opaque codes, e.g. "A1 / A2." A code carries no meaning and needs a lookup key.
    7. Reject academic jargon, e.g. "irreducible," "intrinsic," "recall / precision," "anchoring."
    8. Test every candidate name by asking: *can the reader understand it without being taught a mapping?*
    9. A name fails if the reader must memorize "X stands for Y."
    10. A literal description ("unreachable options") passes.
    11. Default to plain description over a fresh metaphor or coined term.
    12. When a short handle is genuinely needed, use the most literal short handle available.
    13. Keep the existing coined handles *hinge* and *cradle*. They are precise, in active use, and defined plainly elsewhere.
    14. Do not mint new metaphors by default.
    15. **Why:** The terminology is how this work is taught to other engineers. A literal name is the explanation itself, so the reader pays nothing to understand it each time. This is the solubility test applied to a name.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Name a concept by describing, literally, what it is.
    2. Do not name a concept with a real-world analogy or metaphor (e.g. "the menu problem," "menu trap"), even when it is vivid.
    3. Do not name a concept with an opaque code (e.g. "A1 / A2").
    4. Do not name a concept with academic jargon (e.g. "irreducible," "intrinsic," "recall / precision," "anchoring").
    5. Test every candidate name by asking whether the reader can understand it without being taught a mapping. If the reader must memorize "X stands for Y," reject the name.
    6. By default, use a plain description rather than a fresh metaphor or a coined term.
    7. When a short handle is genuinely needed, make it the most literal short handle available.
    8. Keep coined handles that are precise, in active use, and defined plainly elsewhere, such as *hinge* and *cradle*.
    9. Do not mint new metaphors by default.

### Checker A

    1. kept — "Name a concept by describing literally what it is."
    2. kept — "Reject real-world analogies and metaphors, e.g. \"the menu problem,\" \"menu trap.\"" and "A vivid metaphor still fails."
    3. kept — "Reject opaque codes, e.g. \"A1 / A2.\""
    4. kept — "Reject academic jargon, e.g. \"irreducible,\" \"intrinsic,\" \"recall / precision,\" \"anchoring.\""
    5. kept — "Test every candidate name by asking: *can the reader understand it without being taught a mapping?*" and "A name fails if the reader must memorize \"X stands for Y.\""
    6. kept — "Default to plain description over a fresh metaphor or coined term."
    7. kept — "When a short handle is genuinely needed, use the most literal short handle available."
    8. less precise — "Keep the existing coined handles *hinge* and *cradle*. They are precise, in active use, and defined plainly elsewhere." Missing: the general rule that any coined handle meeting those three criteria is kept; the shorter version names only the two handles and gives the criteria as their justification, not as a test for other handles.
    9. kept — "Do not mint new metaphors by default."

### Checker B

    1. kept — "Name a concept by describing literally what it is."
    2. kept — "Reject real-world analogies and metaphors, e.g. \"the menu problem,\" \"menu trap.\"" and "A vivid metaphor still fails."
    3. kept — "Reject opaque codes, e.g. \"A1 / A2.\""
    4. kept — "Reject academic jargon, e.g. \"irreducible,\" \"intrinsic,\" \"recall / precision,\" \"anchoring.\""
    5. kept — "Test every candidate name by asking: *can the reader understand it without being taught a mapping?*" and "A name fails if the reader must memorize \"X stands for Y.\""
    6. kept — "Default to plain description over a fresh metaphor or coined term."
    7. kept — "When a short handle is genuinely needed, use the most literal short handle available."
    8. less precise — "Keep the existing coined handles *hinge* and *cradle*. They are precise, in active use, and defined plainly elsewhere." Missing: the general criterion. The original keeps any coined handle meeting the three conditions, with hinge and cradle as examples. The shorter version keeps only those two.
    9. kept — "Do not mint new metaphors by default."

### The re-check, after the repairs

    1. kept — "Name a concept by describing literally what it is."
    2. kept — "Reject real-world analogies and metaphors, e.g. "the menu problem," "menu trap."" and "A vivid metaphor still fails."
    3. kept — "Reject opaque codes, e.g. "A1 / A2.""
    4. kept — "Reject academic jargon, e.g. "irreducible," "intrinsic," "recall / precision," "anchoring.""
    5. kept — "Test every candidate name by asking: *can the reader understand it without being taught a mapping?*" and "A name fails if the reader must memorize "X stands for Y."" plus "Reject any name that makes the reader memorize an arbitrary mapping back to the actual idea."
    6. kept — "Default to plain description over a fresh metaphor or coined term."
    7. kept — "When a short handle is genuinely needed, use the most literal short handle available."
    8. kept — "Keep a coined handle that is precise, in active use, and defined plainly elsewhere, such as *hinge* and *cradle*."
    9. kept — "Do not mint new metaphors by default."

## no-slang

### The compressor's answer

    1. Names, prose, comments, and commit messages use literal, non-slang terms.
    2. Conversation with the user uses literal, non-slang terms too.
    3. The standard governs phrasing addressed to the human, not only what goes into the codebase.
    4. Do not use a figurative or slang term when a literal one states the thing directly.
    5. Each discontinued figurative term has a literal replacement, and each replacement is an entry in the `language` vocabulary.
    6. Use the literal replacement, as its entry in the `language` vocabulary defines it.
    7. Replace **wrap / wrapper** with **mediates**.
    8. Replace **sweep** with **conform**.
    9. Replace **"does that land?"** with plain phrasing, such as ("is that right?").
    10. Replace **arm** with **scenario**.
    11. Replace **cut** with **increment**.
    12. Replace **in flight** with **in progress**.
    13. Replace **owed** with **required**.
    14. Replace **choice** with **selection** for what is picked at a prompt.
    15. Replace **choice** with **decision** for the matter settled.
    16. Replace **earns its keep / earns its place** with **justified / justifiable**.
    17. A historical record that quotes a decision keeps the original word.
    18. Only live, forward-looking prose conforms.
    19. This rule governs phrasing in prose and conversation. The name-literally-not-by-analogy rule governs naming a concept.
    20. **Why:** slang and figurative terms are imprecise and carry unwanted associations. "wrap/wrapper" reads as a generic decorator and hides the accessor relationship that "mediates" names exactly.

    CONTRADICTIONS: The body says each literal replacement is an entry in the `language` vocabulary, but the Related list names entries only for mediates, conform, scenario, increment, and plain phrasing. It leaves out in progress, required, selection, decision, and justified/justifiable. This is an inconsistency, not a direct conflict between directives. The Related list was dropped from the compressed text, as the guidance requires.

### The directives, as the listing agent gave them

    1. Names, prose, comments, commit messages, and conversation with the user must use literal, non-slang terms. This covers phrasing addressed to the human, not only what goes into the codebase.
    2. Each discontinued figurative term must have a literal replacement, and each must be an entry in the `language` vocabulary.
    3. Use "mediates" instead of "wrap" or "wrapper".
    4. Use "conform" instead of "sweep".
    5. Use plain phrasing, such as "is that right?", instead of "does that land?".
    6. Use "scenario" instead of "arm".
    7. Use "increment" instead of "cut".
    8. Use "in progress" instead of "in flight".
    9. Use "required" instead of "owed".
    10. Instead of "choice", use "selection" for what is picked at a prompt, or "decision" for the matter settled.
    11. Use "justified" or "justifiable" instead of "earns its keep" or "earns its place".
    12. When replacing a figurative or slang term, use the literal replacement given in that term's entry in the `language` vocabulary.
    13. When a historical record quotes a decision, it keeps the original word and is not rewritten to the literal replacement.
    14. Only live, forward-looking prose is made to conform to the no-slang standard.

### Checker A

    All 14 directives are carried by the shorter version. None is less precise and none is lost.

    1. kept: "Names, prose, comments, and commit messages use literal, non-slang terms." + "Conversation with the user uses literal, non-slang terms too." + "The standard governs phrasing addressed to the human, not only what goes into the codebase."
    2. kept: "Each discontinued figurative term has a literal replacement, and each replacement is an entry in the `language` vocabulary."
    3. kept: "Replace **wrap / wrapper** with **mediates**."
    4. kept: "Replace **sweep** with **conform**."
    5. kept: "Replace **"does that land?"** with plain phrasing, such as ("is that right?")."
    6. kept: "Replace **arm** with **scenario**."
    7. kept: "Replace **cut** with **increment**."
    8. kept: "Replace **in flight** with **in progress**."
    9. kept: "Replace **owed** with **required**."
    10. kept: "Replace **choice** with **selection** for what is picked at a prompt." + "Replace **choice** with **decision** for the matter settled."
    11. kept: "Replace **earns its keep / earns its place** with **justified / justifiable**."
    12. kept: "Use the literal replacement, as its entry in the `language` vocabulary defines it."
    13. kept: "A historical record that quotes a decision keeps the original word." Keeping the original word means the record is not rewritten to the replacement.
    14. kept: "Only live, forward-looking prose conforms."

### Checker B

    1. kept: "Names, prose, comments, and commit messages use literal, non-slang terms." / "Conversation with the user uses literal, non-slang terms too." / "The standard governs phrasing addressed to the human, not only what goes into the codebase."
    2. kept: "Each discontinued figurative term has a literal replacement, and each replacement is an entry in the `language` vocabulary."
    3. kept: "Replace **wrap / wrapper** with **mediates**."
    4. kept: "Replace **sweep** with **conform**."
    5. kept: "Replace **\"does that land?\"** with plain phrasing, such as (\"is that right?\")."
    6. kept: "Replace **arm** with **scenario**."
    7. kept: "Replace **cut** with **increment**."
    8. kept: "Replace **in flight** with **in progress**."
    9. kept: "Replace **owed** with **required**."
    10. kept: "Replace **choice** with **selection** for what is picked at a prompt." / "Replace **choice** with **decision** for the matter settled."
    11. kept: "Replace **earns its keep / earns its place** with **justified / justifiable**."
    12. kept: "Use the literal replacement, as its entry in the `language` vocabulary defines it."
    13. kept: "A historical record that quotes a decision keeps the original word."
    14. kept: "Only live, forward-looking prose conforms."

    Notes: Directive 2's "must be" became the descriptive "has" / "is". I counted that as kept because the rule's numbered statements are directives either way. In item 9, "such as (\"is that right?\")" has stray parentheses, but the meaning is unchanged.

### The re-check, after the repairs

    All 14 directives are kept in the shorter version. None is less precise and none is lost.

    1. kept: "Names, prose, comments, and commit messages use literal, non-slang terms." / "Conversation with the user uses literal, non-slang terms too." / "The standard governs phrasing addressed to the human, not only what goes into the codebase."
    2. kept: "Each discontinued figurative term has a literal replacement, and each replacement is an entry in the `language` vocabulary."
    3. kept: "Replace **wrap / wrapper** with **mediates**."
    4. kept: "Replace **sweep** with **conform**."
    5. kept: "Replace **"does that land?"** with plain phrasing, such as "is that right?"."
    6. kept: "Replace **arm** with **scenario**."
    7. kept: "Replace **cut** with **increment**."
    8. kept: "Replace **in flight** with **in progress**."
    9. kept: "Replace **owed** with **required**."
    10. kept: "Replace **choice** with **selection** for what is picked at a prompt." / "Replace **choice** with **decision** for the matter settled."
    11. kept: "Replace **earns its keep / earns its place** with **justified / justifiable**."
    12. kept: "Use the literal replacement, as its entry in the `language` vocabulary defines it."
    13. kept: "A historical record that quotes a decision keeps the original word."
    14. kept: "Only live, forward-looking prose conforms."

## solubility

### The compressor's answer

    1. "Solubility" is the design-quality term for how readily a unit dissolves smoothly into the reader's cognition and understanding.
    2. Solubility is cognitive.
    3. The ideal is immediate comprehension with minimal interpretive work, which is knowledge at a glance.
    4. A soluble unit is as simple as it should be and no simpler.
    5. It has maximum simplicity and minimal necessary complexity, found rather than presumed.
    6. The word names a general quality of a design.
    7. Solubility is judged by the reader, not by the writer who made the unit.
    8. A unit understood only after the reader reconstructs the writer's reasoning is not soluble, however tidy it reads to the writer.
    9. Say "soluble" or "solubility" for this quality.
    10. It is not a synonym for "simple", "clean", or "elegant".
    11. A unit can be simple and still cost the reader interpretive work.
    12. "Clean" and "elegant" describe how the code reads to someone who already understands it.
    13. Use "solubility" wherever the concern is how readily a unit is understood: in prose, rules, designs, commits, and dialogue.
    14. Judge it from the reader by asking what interpretive work the unit costs them.
    15. **Why:** The quality needs one settled name so it can be aimed at, taught, and used as a criterion when a design is judged, not left to unstated taste.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Use the terms "soluble" and "solubility" for how readily a unit dissolves into the reader's understanding.
    2. Do not treat "solubility" as a synonym for "simple", "clean", or "elegant".
    3. A soluble unit must be as simple as it should be and no simpler: maximum simplicity, with only the complexity it needs, and that simplicity is found by looking, not presumed.
    4. Judge solubility by the reader, not by the writer who made the unit.
    5. Do not count a unit as soluble if the reader understands it only after reconstructing the writer's reasoning, however tidy it reads to the writer.
    6. Use "solubility" wherever the concern is how readily a unit is understood: in prose, rules, designs, commits, and dialogue.
    7. When judging a unit's solubility, ask what interpretive work the unit costs the reader.
    8. Use solubility as a target of design work and as a criterion at the moment a design is judged, rather than leaving that judgment to unstated taste.

### Checker A

    1. kept: "Say "soluble" or "solubility" for this quality." (the quality is defined in line 3 as "how readily a unit dissolves smoothly into the reader's cognition and understanding")
    2. kept: "It is not a synonym for "simple", "clean", or "elegant"."
    3. kept: "A soluble unit is as simple as it should be and no simpler." / "It has maximum simplicity and minimal necessary complexity, found rather than presumed."
    4. kept: "Solubility is judged by the reader, not by the writer who made the unit."
    5. kept: "A unit understood only after the reader reconstructs the writer's reasoning is not soluble, however tidy it reads to the writer."
    6. kept: "Use "solubility" wherever the concern is how readily a unit is understood: in prose, rules, designs, commits, and dialogue."
    7. kept: "Judge it from the reader by asking what interpretive work the unit costs them."
    8. less precise: "so it can be aimed at, taught, and used as a criterion when a design is judged, not left to unstated taste." Missing: this appears only in the **Why:** line, as the reason the quality needs a name. It is never stated as an instruction to use solubility as a design target and as the criterion when a design is judged.

### Checker B

    1. kept: "Say "soluble" or "solubility" for this quality." (with line 1: "how readily a unit dissolves smoothly into the reader's cognition and understanding")
    2. kept: "It is not a synonym for "simple", "clean", or "elegant"."
    3. kept: "A soluble unit is as simple as it should be and no simpler." / "It has maximum simplicity and minimal necessary complexity, found rather than presumed."
    4. kept: "Solubility is judged by the reader, not by the writer who made the unit."
    5. kept: "A unit understood only after the reader reconstructs the writer's reasoning is not soluble, however tidy it reads to the writer."
    6. kept: "Use "solubility" wherever the concern is how readily a unit is understood: in prose, rules, designs, commits, and dialogue."
    7. kept: "Judge it from the reader by asking what interpretive work the unit costs them."
    8. less precise: "**Why:** The quality needs one settled name so it can be aimed at, taught, and used as a criterion when a design is judged, not left to unstated taste." Missing: this appears only as the reason for having the name, not as an instruction to use solubility as a design target and as the criterion when a design is judged.

### The re-check, after the repairs

    1. kept: "Say \"soluble\" or \"solubility\" for this quality." and "how readily a unit dissolves smoothly into the reader's cognition and understanding"
    2. kept: "It is not a synonym for \"simple\", \"clean\", or \"elegant\"."
    3. kept: "A soluble unit is as simple as it should be and no simpler." and "It has maximum simplicity and minimal necessary complexity, found rather than presumed."
    4. kept: "Solubility is judged by the reader, not by the writer who made the unit."
    5. kept: "A unit understood only after the reader reconstructs the writer's reasoning is not soluble, however tidy it reads to the writer."
    6. kept: "Use \"solubility\" wherever the concern is how readily a unit is understood: in prose, rules, designs, commits, and dialogue."
    7. kept: "Judge it from the reader by asking what interpretive work the unit costs them."
    8. kept: "Aim design work at solubility, and use it as the criterion when a design is judged." and "not left to unstated taste" (in the Why line)

---

Authored by Scott Bellware on Sat Oct 24 2026 at 2:43:07 PM PT
