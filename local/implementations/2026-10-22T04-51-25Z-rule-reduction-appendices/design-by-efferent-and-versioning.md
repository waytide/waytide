# Rule reduction — the `design-by-efferent` and `versioning` batch, its prompts and answers

The appendix to the experiment record's `design-by-efferent` and `versioning` batch. Each rule's compression, directive list, and two checkers' answers are given word for word, with the re-check of each repaired rule.

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

The prompt for `actuation-gate-options-or-chat`. The other rules' prompts differ only in the path.

    Read the file /private/tmp/claude-501/batch-dbe/actuation-gate-options-or-chat/source.md. It is a rule that governs an AI coding agent and the scripts of the project it works in.

    List every directive the rule contains. A directive is any statement of what must, must not, or may be done, or of what something must be, say, contain, or leave out. Include the directives stated only in passing, inside explanations, and in the How to apply section.

    - Number them, one directive per line.
    - Make each self-contained, so it can be understood without the rule. Keep the rule's own wording where you can.
    - Do not merge two directives into one line, and do not split one into two.
    - Leave out history and justification, except where a reason itself constrains what is done.
    - Where the rule states the same directive more than once, list it once.

    Use no tool except reading that one file. Answer with the numbered list only.

## The checking prompt

The prompt for the same rule. The checker's `compressed.md` holds the rule's title, its compressed text, and its Related list.

    Read the file /private/tmp/claude-501/batch-dbe/actuation-gate-options-or-chat/directives.md, a numbered list of the directives in a rule. Then read the file /private/tmp/claude-501/batch-dbe/actuation-gate-options-or-chat/compressed.md, a shorter version of the same rule.

    For each directive in the list, judge whether the shorter version carries it:

    - **kept** — the shorter version states it, or states something that requires the same behavior
    - **less precise** — the shorter version states part of it, or states it less strictly, or makes it ambiguous
    - **lost** — the shorter version does not state it and nothing in it requires it

    Answer with one line per directive, in the list's order: its number, the verdict, and, for kept or less precise, the words in the shorter version that carry it, quoted. For less precise or lost, add what is missing in a few words. Judge only from the two files. Use no tool except reading those two files.

## actuation-gate-options-or-chat

### The compressor's answer

    1. At the actuation gate, the first gate where the cradle is set, do not commit a single actuation and proceed.
    2. Present the human a small set of candidate actuations as options to choose among.
    3. The human either chooses the option that reads as the more soluble use, or takes the free-text option.
    4. The free-text option lets the human dictate the actuation outright, or open a chat to work out what it should be.
    5. The free-text option is mandatory and always present. It covers the case where the right shape is not among the options.
    6. Never offer a single proposed actuation for approval, such as "here's my actuation — approve?".
    7. Offer several genuine options, so the human compares real candidate shapes for solubility rather than ratifying one.
    8. Never box the human into the AI's option set.

    ## A candidate varies what the use site states

    1. Two actuations are distinct candidates when a reader at the use site sees different words.
    2. Where the use site reads the same either way, the two are one candidate. Offering both pads the gate.
    3. An omitted argument is a candidate. `upload.(file)` beside `upload.(file, retries: 3)` is a real pair.
    4. The first makes the retry policy the object's own. The second makes every use site state the count.
    5. An absent parameter is an interface decision, not the lack of one. Do not discard the shorter shape as the other with something missing.
    6. A chained construction is not an actuation. `Upload.build(retries: 3).(file)` constructs and actuates in one expression.
    7. The actuation in it is `upload.(file)`, with the constructed object bound to an explaining variable on its own line.
    8. Do not offer a construction here. Construction belongs to the controls hinge.
    9. A varied receiver is not a candidate. `Upload.(file, retries: 3)` beside `upload.(file, retries: 3)` is one shape reached two ways.
    10. This hinge does not ask which interface carries the operation.
    11. To apply the test, hold the receiver constant and ask what the use site states.

    ## How to apply

    1. At the first gate, generate a few genuinely distinct candidate actuations.
    2. Make them different efferent shapes, not cosmetic variants.
    3. Present each as it would read at the use site.
    4. Keep a shape that omits an argument.
    5. Drop a chained construction and a varied receiver.
    6. Offer the candidates through the selection UI, which supplies the free-text option. See the present-every-prompt rule.
    7. Do not add a free-text option of your own.
    8. If the human chooses a candidate, adopt it as the cradle.
    9. If the human writes their own instead, take that actuation or enter a dialogue.
    10. Settle the actuation before writing the test file.
    11. Do not proceed to the test body until the actuation is settled.
    12. When a hinge has no genuinely distinct candidates, do not manufacture them.
    13. Present the one candidate as the option, in the same form every other option takes, with the free-text option still there.
    14. `Explain` is the second option, as the present-every-prompt rule sets out. Do not seek another candidate to reach two.
    15. Do not replace the single candidate with an `Accept` label. The option is the artifact. See the hinge-cycle rule.
    16. This mechanism applies at every hinge of the cycle: actuation, observation, controls, implementation, and naming.
    17. **Why:** The actuation is the highest-leverage hinge. Concrete alternatives make the human produce the answer, and the free-text option keeps the human above the AI's mean.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. At the actuation gate (the first gate, where the cradle is set), the AI must not commit a single actuation and proceed.
    2. At the actuation gate, the AI must generate a small set (a few) of candidate actuations and present them to the human as options to choose among.
    3. The human may either choose the option that reads as the more soluble use, or take the free-text option and dictate the actuation outright or open a chat to work out what it should be.
    4. The free-text option is mandatory and must always be there, so the human is never boxed into the AI's option set.
    5. Present alternatives, not a fait accompli: do not present a single proposed actuation for the human to approve ("here's my actuation — approve?").
    6. The candidate actuations must be genuinely distinct, meaning different efferent shapes rather than cosmetic variants.
    7. Judge whether candidate actuations are distinct by what the use site states: two actuations are distinct candidates when a reader at the use site sees different words.
    8. Where the use site reads the same either way, treat the two actuations as one candidate and do not offer both, since that pads the gate.
    9. A shape that omits an argument is a candidate and must be kept (e.g. `upload.(file)` beside `upload.(file, retries: 3)` is a real pair).
    10. A chained construction (e.g. `Upload.build(retries: 3).(file)`) is not an actuation and must be dropped from the candidates, because construction is the controls hinge's decision.
    11. In an actuation, the constructed object is bound to an explaining variable on its own line, not left as an unbound intermediate.
    12. A varied receiver (e.g. `Upload.(file, retries: 3)` beside `upload.(file, retries: 3)`) is not a candidate and must be dropped; hold the receiver constant.
    13. The actuation gate does not ask which interface carries the operation.
    14. Present each candidate actuation as it would read at the use site.
    15. Offer the candidates through the selection UI, which supplies the free-text option (per the present-every-prompt rule).
    16. Do not add a free-text option of your own to the options.
    17. If the human chooses one of the candidates, adopt it as the cradle.
    18. If the human writes their own actuation instead, take that actuation or enter a dialogue.
    19. Settle the actuation before writing the test file.
    20. Do not proceed to the test body until the actuation is settled.
    21. When a hinge has no genuinely distinct candidates, do not manufacture candidates (do not seek one just to reach two).
    22. When there is only one candidate, present it as the option in the same form every other option takes, with the free-text option still there.
    23. When there is only one candidate, `Explain` is the second option, as the present-every-prompt rule sets out.
    24. Do not replace a single candidate option with an `Accept` label; the option is the artifact.
    25. The mechanism of offering candidates as options with the free-text option applies at every hinge of the cycle: actuation, observation, controls, implementation, and naming.

### Checker A

    All 25 directives are kept in the shorter version.

    1. kept: "At the actuation gate, the first gate where the cradle is set, do not commit a single actuation and proceed."
    2. kept: "Present the human a small set of candidate actuations as options to choose among." / "generate a few genuinely distinct candidate actuations"
    3. kept: "The human either chooses the option that reads as the more soluble use, or takes the free-text option." / "The free-text option lets the human dictate the actuation outright, or open a chat to work out what it should be."
    4. kept: "The free-text option is mandatory and always present." / "Never box the human into the AI's option set."
    5. kept: "Never offer a single proposed actuation for approval, such as \"here's my actuation — approve?\"."
    6. kept: "generate a few genuinely distinct candidate actuations" / "Make them different efferent shapes, not cosmetic variants."
    7. kept: "Two actuations are distinct candidates when a reader at the use site sees different words."
    8. kept: "Where the use site reads the same either way, the two are one candidate. Offering both pads the gate."
    9. kept: "An omitted argument is a candidate. `upload.(file)` beside `upload.(file, retries: 3)` is a real pair." / "Keep a shape that omits an argument."
    10. kept: "A chained construction is not an actuation." / "Drop a chained construction" / "Do not offer a construction here. Construction belongs to the controls hinge."
    11. kept: "with the constructed object bound to an explaining variable on its own line"
    12. kept: "A varied receiver is not a candidate." / "Drop a chained construction and a varied receiver." / "hold the receiver constant"
    13. kept: "This hinge does not ask which interface carries the operation."
    14. kept: "Present each as it would read at the use site."
    15. kept: "Offer the candidates through the selection UI, which supplies the free-text option. See the present-every-prompt rule."
    16. kept: "Do not add a free-text option of your own."
    17. kept: "If the human chooses a candidate, adopt it as the cradle."
    18. kept: "If the human writes their own instead, take that actuation or enter a dialogue."
    19. kept: "Settle the actuation before writing the test file."
    20. kept: "Do not proceed to the test body until the actuation is settled."
    21. kept: "When a hinge has no genuinely distinct candidates, do not manufacture them." / "Do not seek another candidate to reach two."
    22. kept: "Present the one candidate as the option, in the same form every other option takes, with the free-text option still there."
    23. kept: "`Explain` is the second option, as the present-every-prompt rule sets out."
    24. kept: "Do not replace the single candidate with an `Accept` label. The option is the artifact."
    25. kept: "This mechanism applies at every hinge of the cycle: actuation, observation, controls, implementation, and naming."

### Checker B

    1. kept — "At the actuation gate, the first gate where the cradle is set, do not commit a single actuation and proceed."
    2. kept — "Present the human a small set of candidate actuations as options to choose among." / "generate a few genuinely distinct candidate actuations"
    3. kept — "The human either chooses the option that reads as the more soluble use, or takes the free-text option." / "The free-text option lets the human dictate the actuation outright, or open a chat to work out what it should be."
    4. kept — "The free-text option is mandatory and always present." / "Never box the human into the AI's option set."
    5. kept — "Never offer a single proposed actuation for approval, such as "here's my actuation — approve?"."
    6. kept — "generate a few genuinely distinct candidate actuations" / "Make them different efferent shapes, not cosmetic variants."
    7. kept — "Two actuations are distinct candidates when a reader at the use site sees different words."
    8. kept — "Where the use site reads the same either way, the two are one candidate. Offering both pads the gate."
    9. kept — "An omitted argument is a candidate. `upload.(file)` beside `upload.(file, retries: 3)` is a real pair." / "Keep a shape that omits an argument."
    10. kept — "A chained construction is not an actuation." / "Drop a chained construction" / "Do not offer a construction here. Construction belongs to the controls hinge."
    11. kept — "with the constructed object bound to an explaining variable on its own line"
    12. kept — "A varied receiver is not a candidate." / "Drop ... a varied receiver." / "hold the receiver constant"
    13. kept — "This hinge does not ask which interface carries the operation."
    14. kept — "Present each as it would read at the use site."
    15. kept — "Offer the candidates through the selection UI, which supplies the free-text option. See the present-every-prompt rule."
    16. kept — "Do not add a free-text option of your own."
    17. kept — "If the human chooses a candidate, adopt it as the cradle."
    18. kept — "If the human writes their own instead, take that actuation or enter a dialogue."
    19. kept — "Settle the actuation before writing the test file."
    20. kept — "Do not proceed to the test body until the actuation is settled."
    21. kept — "When a hinge has no genuinely distinct candidates, do not manufacture them." / "Do not seek another candidate to reach two."
    22. kept — "Present the one candidate as the option, in the same form every other option takes, with the free-text option still there."
    23. kept — "`Explain` is the second option, as the present-every-prompt rule sets out."
    24. kept — "Do not replace the single candidate with an `Accept` label. The option is the artifact."
    25. kept — "This mechanism applies at every hinge of the cycle: actuation, observation, controls, implementation, and naming."

## attended-or-unattended-is-chosen-at-the-start

### The compressor's answer

    1. Work designed through DBE runs in one of two modes: attended or unattended.
    2. Choose the mode when a feature or an experiment is started. Hold it for the work's whole duration.
    3. **Attended** is human-in-the-loop. The loop waits at every hinge, and the engineer deliberates each one.
    4. Attended is the default.
    5. **Unattended**: the loop does not wait. The agent determines and decides each hinge, generating through to the end of the work.
    6. DBE is in effect in both modes. Unattended is not DBE off.
    7. The cradle still holds under unattended work. The efferent test is written before the implementation.
    8. The actuation is still designed from the use site. Code generation is still steered toward solubility.
    9. Every hinge is still determined in both modes. Only who decides it changes, and whether the loop stops.
    10. Attended is small-batch: a wrong turn is caught at its hinge. Unattended is big-batch: a wrong turn is found with everything built on it.
    11. The choice is a judgment about this piece of work: how load-bearing it is, and how likely the first pass is to be right.
    12. Ask the mode at the start, through the selection UI, beside the working-location selection.
    13. Put both decisions at the same gate. Do not add a separate gate.
    14. The option set shows that attended is the default.
    15. Ask the question in these exact words:

    > Who decides?

    with these options:

    > **Attended** — You decide. The agent automates. (the default)
    >
    > **Unattended** — The agent decides and generates through.

    16. These words are fixed.
    17. Name no hinge in the question or in any option.
    18. Name the hinges when the loop reaches the first one, not before.
    19. Record the mode in the feature or experiment record, as a confirmation at the start, beside the working-location selection.
    20. That confirmation records what was chosen, when, and by whom.
    21. Declare the mode at the top of the loop record.
    22. Under unattended work, declare the mode once, at the top. Do not infer it cycle by cycle.
    23. Under unattended work, each cycle records its hinge, and what was decided and why.
    24. The "why" is the reasoning the agent actually applied.
    25. Under unattended work, write no Options line and no Decision / chat line.
    26. Do not write an unattended cycle as though an engineer was consulted.
    27. Do not mark unattended hinges with the loop-records form *"none — no gate"*. That form surfaces a skipped gate in an attended run as a defect.

    ## Unattended presents a plan before it generates

    1. Under unattended work, present a plan before generating.
    2. Attended work needs no plan.
    3. The plan is a list.
    4. Use an ordered list where each step rests on the one above it.
    5. Use a bullet list where the steps are independent.
    6. Write the plan in ETE, per the `language` package's ETE rules in `ete/`.
    7. ETE is the STE dictionary and writing rules, plus Waytide's reserved terms such as `hinge`, `actuation`, `cradle`, and `solubility`.
    8. Use short sentences and active voice in the plan.
    9. Use no semicolon in the plan.
    10. Put one idea in each list item.
    11. Present the plan in the response.
    12. Do not write the plan to a file. It is not a `foundation` planning record.
    13. **Why:** the engineer's attention is scarce. For work with negligible rework cost, waits at each hinge buy nothing. The person who knows the work's worth should choose the cadence. Keeping DBE in force stops the choice being a way out of the method. A record showing options put to an absent engineer would be believed, so the mode is recorded honestly. The plan is the one cheap moment of attention before big-batch work.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Work designed through DBE runs in one of two modes, attended or unattended. The mode is chosen when a feature or an experiment is started and is held for its duration.
    2. In attended mode, the loop waits at every hinge, and the engineer deliberates each one.
    3. Attended is the default mode.
    4. In unattended mode, the loop does not wait. The agent determines each hinge and decides it, generating through to the end of the work.
    5. DBE is in effect in both modes. Unattended is not DBE off.
    6. In unattended mode the cradle still holds: the efferent test is written before the implementation, the actuation is designed from the use site, and code generation is steered toward solubility.
    7. Every hinge is still determined and run in both modes.
    8. The mode changes only who decides each hinge and whether the loop stops. The method is untouched.
    9. The mode is asked at the start of a feature or an experiment, through the selection UI.
    10. The mode question is asked alongside the working-location question, at the same gate, not at an added gate.
    11. The option set must say that attended is the default.
    12. The mode question is asked in these exact words: "Who decides?"
    13. The attended option reads: "Attended — You decide. The agent automates. (the default)"
    14. The unattended option reads: "Unattended — The agent decides and generates through."
    15. The wording of the mode question and its options is fixed.
    16. Neither the mode question nor any of its options names a hinge.
    17. Each mode option says what each party does, with the engineer's part named first.
    18. The unattended option names only the agent.
    19. The hinges are named when the loop reaches the first one, not before.
    20. The feature or experiment record carries the mode as a confirmation at the start, beside the working-location selection.
    21. The mode confirmation in the feature or experiment record states what was chosen, when, and by whom.
    22. The loop record declares the mode once, at the top, so that it is not inferred cycle by cycle.
    23. An unattended cycle in a loop record is not written as though an engineer was consulted.
    24. In unattended mode, each loop-record cycle records its hinge and what was decided and why, meaning the reasoning the agent actually applied.
    25. In unattended mode, a loop-record cycle has no Options line and no Decision / chat line.
    26. In unattended mode, hinges are not marked with the loop-records rule's "none — no gate" form, which is kept for surfacing a skipped gate as a defect in an attended run.
    27. In unattended mode, the agent presents a plan before it generates.
    28. Attended mode needs no plan.
    29. The plan is a list.
    30. The plan uses an ordered list where each step rests on the one above it.
    31. The plan uses a bullet list where the steps are independent.
    32. The plan is written in ETE (Eventide Technical English: the STE dictionary and STE writing rules, with Waytide's reserved terms), not in raw STE.
    33. The plan uses short sentences.
    34. The plan uses active voice.
    35. The plan uses no semicolon.
    36. Each plan list item holds one idea.
    37. The plan is presented in the response, before the agent generates.
    38. The plan is not written to a file and is not a planning record.

### Checker A

    1. kept — "runs in one of two modes: attended or unattended." / "Choose the mode when a feature or an experiment is started. Hold it for the work's whole duration."
    2. kept — "The loop waits at every hinge, and the engineer deliberates each one."
    3. kept — "Attended is the default."
    4. kept — "the loop does not wait. The agent determines and decides each hinge, generating through to the end of the work."
    5. kept — "DBE is in effect in both modes. Unattended is not DBE off."
    6. kept — "The cradle still holds under unattended work. The efferent test is written before the implementation." / "The actuation is still designed from the use site. Code generation is still steered toward solubility."
    7. less precise — "Every hinge is still determined in both modes." Missing: that every hinge is also still run.
    8. kept — "Only who decides it changes, and whether the loop stops."
    9. kept — "Ask the mode at the start, through the selection UI" (with "when a feature or an experiment is started")
    10. kept — "beside the working-location selection." / "Put both decisions at the same gate. Do not add a separate gate."
    11. kept — "The option set shows that attended is the default."
    12. kept — "Ask the question in these exact words: > Who decides?"
    13. kept — "**Attended** — You decide. The agent automates. (the default)"
    14. kept — "**Unattended** — The agent decides and generates through."
    15. kept — "These words are fixed."
    16. kept — "Name no hinge in the question or in any option."
    17. kept — "You decide. The agent automates." (the fixed wording requires it, but the principle is not stated)
    18. kept — "The agent decides and generates through." (the fixed wording requires it, but the principle is not stated)
    19. kept — "Name the hinges when the loop reaches the first one, not before."
    20. kept — "Record the mode in the feature or experiment record, as a confirmation at the start, beside the working-location selection."
    21. kept — "That confirmation records what was chosen, when, and by whom."
    22. less precise — "Declare the mode at the top of the loop record." / "Under unattended work, declare the mode once, at the top. Do not infer it cycle by cycle." Missing: "once" and "not inferred cycle by cycle" are limited to unattended work, where the original applies them to every loop record.
    23. kept — "Do not write an unattended cycle as though an engineer was consulted."
    24. kept — "each cycle records its hinge, and what was decided and why." / "The "why" is the reasoning the agent actually applied."
    25. kept — "Under unattended work, write no Options line and no Decision / chat line."
    26. kept — "Do not mark unattended hinges with the loop-records form *"none — no gate"*. That form surfaces a skipped gate in an attended run as a defect."
    27. kept — "Under unattended work, present a plan before generating."
    28. kept — "Attended work needs no plan."
    29. kept — "The plan is a list."
    30. kept — "Use an ordered list where each step rests on the one above it."
    31. kept — "Use a bullet list where the steps are independent."
    32. kept — "Write the plan in ETE" / "ETE is the STE dictionary and writing rules, plus Waytide's reserved terms"
    33. kept — "Use short sentences ... in the plan."
    34. kept — "... and active voice in the plan."
    35. kept — "Use no semicolon in the plan."
    36. kept — "Put one idea in each list item."
    37. kept — "Present the plan in the response." (with "present a plan before generating")
    38. kept — "Do not write the plan to a file. It is not a `foundation` planning record."

### Checker B

    1. kept: "Work designed through DBE runs in one of two modes: attended or unattended." / "Choose the mode when a feature or an experiment is started. Hold it for the work's whole duration."
    2. kept: "The loop waits at every hinge, and the engineer deliberates each one."
    3. kept: "Attended is the default."
    4. kept: "the loop does not wait. The agent determines and decides each hinge, generating through to the end of the work."
    5. kept: "DBE is in effect in both modes. Unattended is not DBE off."
    6. kept: "The cradle still holds under unattended work. The efferent test is written before the implementation." / "The actuation is still designed from the use site. Code generation is still steered toward solubility."
    7. kept: "Every hinge is still determined in both modes." / "the hinges that run either way" (the "run" part is stated only in the Related list)
    8. kept: "Only who decides it changes, and whether the loop stops." (it does not say "the method is untouched" in those words, but "only" requires it, and "DBE is in effect in both modes" supports it)
    9. kept: "Ask the mode at the start, through the selection UI"
    10. kept: "beside the working-location selection." / "Put both decisions at the same gate. Do not add a separate gate."
    11. kept: "The option set shows that attended is the default."
    12. kept: "Ask the question in these exact words: > Who decides?"
    13. kept: "**Attended** — You decide. The agent automates. (the default)"
    14. kept: "**Unattended** — The agent decides and generates through."
    15. kept: "These words are fixed."
    16. kept: "Name no hinge in the question or in any option."
    17. kept: "**Attended** — You decide. The agent automates." (the fixed wording follows the principle, but the principle itself is not stated)
    18. kept: "**Unattended** — The agent decides and generates through." (the fixed wording follows the principle, but the principle itself is not stated)
    19. kept: "Name the hinges when the loop reaches the first one, not before."
    20. kept: "Record the mode in the feature or experiment record, as a confirmation at the start, beside the working-location selection."
    21. kept: "That confirmation records what was chosen, when, and by whom."
    22. less precise: "Declare the mode at the top of the loop record." / "Under unattended work, declare the mode once, at the top. Do not infer it cycle by cycle." Missing: "once" and "not inferred cycle by cycle" are limited to unattended work, where the original applies them to the loop record in both modes.
    23. kept: "Do not write an unattended cycle as though an engineer was consulted."
    24. kept: "Under unattended work, each cycle records its hinge, and what was decided and why." / "The "why" is the reasoning the agent actually applied."
    25. kept: "Under unattended work, write no Options line and no Decision / chat line."
    26. kept: "Do not mark unattended hinges with the loop-records form *"none — no gate"*. That form surfaces a skipped gate in an attended run as a defect."
    27. kept: "Under unattended work, present a plan before generating."
    28. kept: "Attended work needs no plan."
    29. kept: "The plan is a list."
    30. kept: "Use an ordered list where each step rests on the one above it."
    31. kept: "Use a bullet list where the steps are independent."
    32. kept: "Write the plan in ETE, per the `language` package's ETE rules in `ete/`." / "ETE is the STE dictionary and writing rules, plus Waytide's reserved terms" (it does not say "not raw STE" outright, but "plus Waytide's reserved terms" requires it)
    33. kept: "Use short sentences ... in the plan."
    34. kept: "Use ... active voice in the plan."
    35. kept: "Use no semicolon in the plan."
    36. kept: "Put one idea in each list item."
    37. kept: "Present the plan in the response." / "present a plan before generating."
    38. kept: "Do not write the plan to a file. It is not a `foundation` planning record."

    Summary: 37 kept, 1 less precise (22), 0 lost.

### The re-check, after the repairs

    1. kept — "runs in one of two modes: attended or unattended" / "Choose the mode when a feature or an experiment is started. Hold it for the work's whole duration."
    2. kept — "The loop waits at every hinge, and the engineer deliberates each one."
    3. kept — "Attended is the default."
    4. kept — "the loop does not wait. The agent determines and decides each hinge, generating through to the end of the work."
    5. kept — "DBE is in effect in both modes. Unattended is not DBE off."
    6. kept — "The cradle still holds under unattended work. The efferent test is written before the implementation." / "The actuation is still designed from the use site. Code generation is still steered toward solubility."
    7. kept — "Every hinge is still determined and run in both modes."
    8. kept — "Only who decides it changes, and whether the loop stops." (with "DBE is in effect in both modes")
    9. kept — "Ask the mode at the start, through the selection UI"
    10. kept — "beside the working-location selection" / "Put both decisions at the same gate. Do not add a separate gate."
    11. kept — "The option set shows that attended is the default."
    12. kept — "Ask the question in these exact words: > Who decides?"
    13. kept — "**Attended** — You decide. The agent automates. (the default)"
    14. kept — "**Unattended** — The agent decides and generates through."
    15. kept — "These words are fixed."
    16. kept — "Name no hinge in the question or in any option."
    17. kept — carried by the fixed option words "You decide. The agent automates." together with "These words are fixed." The principle itself (each party's part, engineer first) is not stated.
    18. kept — carried by the fixed words "The agent decides and generates through." together with "These words are fixed." The principle itself (only the agent is named) is not stated.
    19. kept — "Name the hinges when the loop reaches the first one, not before."
    20. kept — "Record the mode in the feature or experiment record, as a confirmation at the start, beside the working-location selection."
    21. kept — "That confirmation records what was chosen, when, and by whom."
    22. kept — "Declare the mode once, at the top of the loop record. Do not infer it cycle by cycle."
    23. kept — "Do not write an unattended cycle as though an engineer was consulted."
    24. kept — "each cycle records its hinge, and what was decided and why." / "The 'why' is the reasoning the agent actually applied."
    25. kept — "Under unattended work, write no Options line and no Decision / chat line."
    26. kept — "Do not mark unattended hinges with the loop-records form *'none — no gate'*. That form surfaces a skipped gate in an attended run as a defect."
    27. kept — "Under unattended work, present a plan before generating."
    28. kept — "Attended work needs no plan."
    29. kept — "The plan is a list."
    30. kept — "Use an ordered list where each step rests on the one above it."
    31. kept — "Use a bullet list where the steps are independent."
    32. kept — "Write the plan in ETE" / "ETE is the STE dictionary and writing rules, plus Waytide's reserved terms"
    33. kept — "Use short sentences and active voice in the plan."
    34. kept — "Use short sentences and active voice in the plan."
    35. kept — "Use no semicolon in the plan."
    36. kept — "Put one idea in each list item."
    37. kept — "Present the plan in the response." with "present a plan before generating"
    38. kept — "Do not write the plan to a file. It is not a `foundation` planning record."

## dbe-as-design-tool

### The compressor's answer

    1. Design By Efferent is a design tool.
    2. Do not perform red-green-refactor as choreography.
    3. A test written before its implementation will trivially fail. Do not stop to observe that failure.
    4. Do not treat the red bar as a checkpoint.
    5. What is rejected is the unchosen cycle, the one performed because the form calls for it.
    6. An engineer may choose the red/green/refactor cycle at the implementation hinge, for a particular unit. See the the-implementation-hinge-offers-the-red-green-refactor-cycle rule.
    7. They choose it where the design wants working out under a red, or where the test's discrimination is in doubt.
    8. A cycle the engineer chose after weighing two real alternatives is not choreography.
    9. Approach every unit from the efferent side first. The test is the first efferent reference.
    10. Author the actuation before the implementation exists, so the unit's interface is designed from the use site.
    11. Aim for the unit's greatest **solubility**: how readily it dissolves into the reader's understanding.
    12. Seek minimal necessary complexity, found rather than presumed.
    13. Treat the efferent test as a **cradle**. It holds the implementation in position without gripping it rigid.
    14. Generate code within the dictates of the efferent view, free to move inside those bounds.
    15. The test is not an after-the-fact filter or pass/fail gate, and not a point to halt at.
    16. Keep the cradle in context while building, and generate straight through inside it, steering toward solubility.
    17. Do not regress to the average of the code you have seen.
    18. Condition on the project's well-designed, efferent-oriented, high-solubility code, not on code in general. Hold to its standard.
    19. **Why:** Design judgment stays with the human. The red-green-refactor ceremony existed only to put human attention in the loop, so ritual repetition wastes effort and teaches nothing. Tests are the vehicle; design is the point.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Use Design By Efferent (DBE) as a design tool, not as a testing ritual.
    2. Do not perform red-green-refactor as choreography, meaning a cycle that nobody chose and that is run only because the form calls for it.
    3. Do not stop to look at the failure of a test written before its implementation exists.
    4. Do not treat the red bar of a pre-implementation test as a checkpoint.
    5. An engineer may choose the red/green/refactor cycle at the implementation hinge for a particular unit, where the design needs working out under a red or where the test's discrimination is in doubt. Only that engineer's decision makes the cycle legitimate.
    6. Approach every unit from the efferent side first, with the test as the first efferent reference.
    7. Write the actuation (the efferent test) before the implementation exists, so that the unit's interface is designed from the use site.
    8. Aim for the greatest simplicity possible: maximum solubility and minimal necessary complexity, found rather than presumed.
    9. Treat the efferent test as a cradle for code generation, which holds the implementation in position without gripping it rigid. Do not treat it as a pass/fail gate, an after-the-fact filter, or a point to halt at.
    10. Keep the efferent test (the cradle) present and in context while generating the implementation, steering toward maximum solubility.
    11. Generate the implementation straight through inside the cradle, within the bounds the efferent view sets.
    12. Do not regress to the average of the code you have seen, and do not copy poorly designed code.
    13. Condition on the well-designed, efferent-oriented, high-solubility code in the project, not on code in general, and hold to its standard.
    14. Leave design judgment, meaning detailed knowledge of what good, soluble design looks like, with the human.
    15. Generate within the cradle the human sets, toward solubility, without performing the red-green-refactor ceremony.
    16. Design each unit from the efferent side inward.

### Checker A

    1 — kept — "DBE is a design tool, not a testing ritual"; "Design By Efferent is a design tool."
    2 — kept — "Do not perform red-green-refactor as choreography."; "What is rejected is the unchosen cycle, the one performed because the form calls for it."
    3 — kept — "A test written before its implementation will trivially fail. Do not stop to observe that failure."
    4 — kept — "Do not treat the red bar as a checkpoint."
    5 — kept — "An engineer may choose the red/green/refactor cycle at the implementation hinge, for a particular unit."; "They choose it where the design wants working out under a red, or where the test's discrimination is in doubt."; "What is rejected is the unchosen cycle"; "A cycle the engineer chose after weighing two real alternatives is not choreography."
    6 — kept — "Approach every unit from the efferent side first. The test is the first efferent reference."
    7 — kept — "Author the actuation before the implementation exists, so the unit's interface is designed from the use site."
    8 — kept — "Aim for the unit's greatest **solubility**"; "Seek minimal necessary complexity, found rather than presumed."
    9 — kept — "Treat the efferent test as a **cradle**. It holds the implementation in position without gripping it rigid."; "The test is not an after-the-fact filter or pass/fail gate, and not a point to halt at."
    10 — kept — "Keep the cradle in context while building, and generate straight through inside it, steering toward solubility."
    11 — kept — "Generate code within the dictates of the efferent view, free to move inside those bounds."; "generate straight through inside it"
    12 — less precise — "Do not regress to the average of the code you have seen."; "Condition on the project's well-designed ... code ... Hold to its standard." Missing: the explicit ban on copying poorly designed code, which is only implied.
    13 — kept — "Condition on the project's well-designed, efferent-oriented, high-solubility code, not on code in general. Hold to its standard."
    14 — less precise — "Design judgment stays with the human." Missing: the definition of design judgment (detailed knowledge of what good, soluble design looks like). It also appears only as a reason under "Why", not as a directive.
    15 — less precise — "generate straight through inside it, steering toward solubility"; "Do not perform red-green-refactor as choreography." Missing: that the human is the one who sets the cradle.
    16 — kept — "Approach every unit from the efferent side first."; "the unit's interface is designed from the use site."

### Checker B

    1. kept: "Design By Efferent is a design tool." and the title "DBE is a design tool, not a testing ritual"
    2. kept: "Do not perform red-green-refactor as choreography." and "What is rejected is the unchosen cycle, the one performed because the form calls for it."
    3. kept: "A test written before its implementation will trivially fail. Do not stop to observe that failure."
    4. kept: "Do not treat the red bar as a checkpoint." (This is broader than the original, because it is not limited to pre-implementation tests, and it requires the same behavior.)
    5. less precise: "An engineer may choose the red/green/refactor cycle at the implementation hinge, for a particular unit", "They choose it where the design wants working out under a red, or where the test's discrimination is in doubt." and "A cycle the engineer chose after weighing two real alternatives is not choreography." Missing: it does not say that only the engineer's decision makes the cycle legitimate. "Unchosen" does not say who chose, so a cycle the agent chose is not clearly ruled out.
    6. kept: "Approach every unit from the efferent side first. The test is the first efferent reference."
    7. kept: "Author the actuation before the implementation exists, so the unit's interface is designed from the use site."
    8. kept: "Aim for the unit's greatest **solubility**" and "Seek minimal necessary complexity, found rather than presumed."
    9. kept: "Treat the efferent test as a **cradle**. It holds the implementation in position without gripping it rigid." and "The test is not an after-the-fact filter or pass/fail gate, and not a point to halt at."
    10. kept: "Keep the cradle in context while building, ... steering toward solubility."
    11. kept: "generate straight through inside it" and "Generate code within the dictates of the efferent view, free to move inside those bounds."
    12. kept: "Do not regress to the average of the code you have seen." The ban on copying poorly designed code is not stated outright. It is required by "Condition on the project's well-designed ... code ... Hold to its standard."
    13. kept: "Condition on the project's well-designed, efferent-oriented, high-solubility code, not on code in general. Hold to its standard."
    14. less precise: "**Why:** Design judgment stays with the human." Missing: it is stated only as a reason, not as a directive. The meaning of design judgment, detailed knowledge of what good, soluble design looks like, is dropped.
    15. less precise: "generate straight through inside it, steering toward solubility" and "Do not perform red-green-refactor as choreography." Missing: it does not say that the human is the one who sets the cradle.
    16. kept: "Approach every unit from the efferent side first." ("Inward" is implied, not stated.)

### The re-check, after the repairs

    1. kept: "Design By Efferent is a design tool." with the title "DBE is a design tool, not a testing ritual"
    2. kept: "Do not perform red-green-refactor as choreography." and "What is rejected is the unchosen cycle, the one performed because the form calls for it."
    3. kept: "A test written before its implementation will trivially fail. Do not stop to observe that failure."
    4. kept: "Do not treat the red bar as a checkpoint." This reads as broader than the original, since it does not limit itself to a pre-implementation test. Line 3 supplies that context.
    5. kept: "An engineer may choose the red/green/refactor cycle at the implementation hinge, for a particular unit." / "They choose it where the design wants working out under a red, or where the test's discrimination is in doubt." / "Only the engineer's choice makes the cycle legitimate."
    6. kept: "Approach every unit from the efferent side first. The test is the first efferent reference."
    7. kept: "Author the actuation before the implementation exists, so the unit's interface is designed from the use site."
    8. kept: "Aim for the unit's greatest **solubility**" / "Seek minimal necessary complexity, found rather than presumed." The word "simplicity" does not appear, but solubility plus minimal necessary complexity requires the same behavior.
    9. kept: "Treat the efferent test as a **cradle**. It holds the implementation in position without gripping it rigid." / "The test is not an after-the-fact filter or pass/fail gate, and not a point to halt at."
    10. kept: "Keep the cradle in context while building, and generate straight through inside it, steering toward solubility." The word "maximum" comes from "greatest **solubility**".
    11. kept: "generate straight through inside it" / "Generate code within the dictates of the efferent view, free to move inside those bounds."
    12. kept: "Do not regress to the average of the code you have seen. Do not copy poorly designed code."
    13. kept: "Condition on the project's well-designed, efferent-oriented, high-solubility code, not on code in general. Hold to its standard."
    14. kept: "Leave design judgment with the human: knowing in detail what good, soluble design looks like."
    15. kept: "generate straight through inside it, steering toward solubility. The human sets the cradle." together with "Do not perform red-green-refactor as choreography."
    16. less precise: "Approach every unit from the efferent side first." Missing: the inward direction of the design work, from the efferent side in toward the unit, is not stated. Only the starting side is.

## dbe-first-turn-test-file

### The compressor's answer

    1. Start a feature by writing a test file, not implementation.
    2. The first turn produces that test file and nothing more.
    3. The first turn begins at the first gate, where responsibility first transfers to the human.
    4. The first gate puts down only the actuation and an unnamed assert.
    5. The actuation is the invocation of the unit under test, the first efferent reference, bound to an explaining variable.
    6. State any inputs just above the actuation, via controls or literals.
    7. The unnamed assert is a single bare `test` block asserting the explaining variable, or the variable against a control value.
    8. Write no inner outcome `context` yet, so no outcome is named.
    9. Nest the file to mirror its folder path, per the folder-mirroring rule, with one outer `context` per path segment.
    10. Place the actuation and the unnamed `test` block inside the innermost `context`.

    ```ruby
    context "Constant" do
      context "Module" do
        context "Namespace" do
          control_value = Controls::Constant.example

          constant = Constant::Module.new(control_value)

          namespace = constant.namespace
          control_namespace_constant = Constant::Module.new(Object)

          comment "Namespace: #{namespace.inspect}"

          test do
            assert(namespace == control_namespace_constant)
          end
        end
      end
    end
    ```

    11. Assert against an explaining variable, a named local whose name states what is asserted, not against an inline expression.
    12. The explaining variable holds the result of actuating the concern.
    13. Actuate first, bind the result, then assert it.
    14. The shell of the cradle is the actuation and its unnamed assert.
    15. Once the shell is implemented, leave the test unnamed through the rest of the feature's development.
    16. Name the test only at the end of the feature.
    17. Add the outcome `context` each observation establishes at that time, giving the test-structure rule's "one inner `context` per outcome" structure.
    18. This naming step is the seam where the next feature begins.
    19. A feature in progress carries bare unnamed asserts. A finished feature carries named outcome contexts.
    20. The first gate's hinge is the actuation's shape and the truth of the one observation, not how outcomes are named or divided.
    21. Before writing the file, settle the actuation, the observation, and the controls.
    22. Do not write the implementation in the first turn.
    23. Do not pause to run the inevitably-failing test.
    24. The human accepts the first turn's content in separate hinges: actuation, then observation, then controls.
    25. The implementation is the fourth hinge.
    26. The naming is the fifth hinge, at the feature's close.
    27. Propose each hinge and get it accepted before the next, per the hinge-cycle rule.
    28. Do not present the whole test file for a single accept.
    29. Settle the three test hinges first, then assemble and show the file.
    30. The exception to points 28 and 29 is when the engineer chose unattended work at the start, per the attended-or-unattended-is-chosen-at-the-start rule.
    31. **Why:** Writing the actuation before any implementation designs the interface from the use site, per the DBE-as-design-tool rule. Limiting the first gate to the actuation and one unnamed assert avoids committing early to an outcome taxonomy. The explaining variable makes the test read as a statement of the concern and keeps the efferent view in frame.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Start a feature by writing a test file, not implementation.
    2. The first turn of a feature produces the test file and nothing more.
    3. The first turn begins at the first gate, the point where responsibility first transfers to the human.
    4. Settle the three test hinges (actuation, observation, controls) before assembling and showing the test file. Do not assemble it before they are accepted, unless the engineer chose unattended work at the start.
    5. What the first gate puts down is small and fixed: the actuation and an unnamed assert.
    6. The actuation is the invocation of the unit under test, the first efferent reference, bound to an explaining variable.
    7. State any inputs to the actuation just above it, via controls or literals.
    8. The unnamed assert is a single bare `test` block asserting the explaining variable, or the variable against a control value.
    9. In the first turn, the test file has no inner outcome `context`, and no outcome is named yet.
    10. Nest the test file to mirror its folder path, per the folder-mirroring rule, with one outer `context` per path segment.
    11. The actuation and the unnamed `test` block sit inside the innermost of the folder-path contexts.
    12. Make the assertion against an explaining variable, a named local whose name states what is being asserted, not against an inline expression.
    13. The explaining variable holds the result of actuating the concern.
    14. Actuate first, bind the result, then assert it.
    15. Defer naming the outcome to the end: once the actuation and its unnamed assert (the shell of the cradle) are implemented, leave the test unnamed through the rest of the feature's development.
    16. At the feature's end, come back and name the test, adding then the outcome `context` each observation establishes (one inner `context` per outcome, per the test-structure rule).
    17. A feature in progress carries bare unnamed asserts, and a feature left behind carries named outcome contexts.
    18. The first gate's hinge is limited to the shape of the actuation and the truth of the one observation. It does not cover how outcomes are named or carved up.
    19. Do not pause to run the inevitably-failing test in the first turn.
    20. The human accepts turn one's content in separate hinges, in this order: actuation, then observation, then controls.
    21. The implementation is the fourth hinge.
    22. The naming is the fifth hinge, at the feature's close.
    23. Propose and accept each hinge before the next, per the hinge-cycle rule.
    24. Do not present the whole test file for a single accept, unless the engineer chose unattended work at the start.

### Checker A

    All 24 directives are kept. None is less precise or lost.

    1. kept: "Start a feature by writing a test file, not implementation."
    2. kept: "The first turn produces that test file and nothing more."
    3. kept: "The first turn begins at the first gate, where responsibility first transfers to the human."
    4. kept: "Before writing the file, settle the actuation, the observation, and the controls." / "Settle the three test hinges first, then assemble and show the file." / "The exception to points 28 and 29 is when the engineer chose unattended work at the start". Acceptance is required by "Propose each hinge and get it accepted before the next".
    5. kept: "The first gate puts down only the actuation and an unnamed assert."
    6. kept: "The actuation is the invocation of the unit under test, the first efferent reference, bound to an explaining variable."
    7. kept: "State any inputs just above the actuation, via controls or literals."
    8. kept: "The unnamed assert is a single bare `test` block asserting the explaining variable, or the variable against a control value."
    9. kept: "Write no inner outcome `context` yet, so no outcome is named."
    10. kept: "Nest the file to mirror its folder path, per the folder-mirroring rule, with one outer `context` per path segment."
    11. kept: "Place the actuation and the unnamed `test` block inside the innermost `context`." No outcome contexts exist in the first turn, so the innermost context is the innermost folder-path context.
    12. kept: "Assert against an explaining variable, a named local whose name states what is asserted, not against an inline expression."
    13. kept: "The explaining variable holds the result of actuating the concern."
    14. kept: "Actuate first, bind the result, then assert it."
    15. kept: "The shell of the cradle is the actuation and its unnamed assert." / "Once the shell is implemented, leave the test unnamed through the rest of the feature's development." / "Name the test only at the end of the feature."
    16. kept: "Name the test only at the end of the feature." / "Add the outcome `context` each observation establishes at that time, giving the test-structure rule's \"one inner `context` per outcome\" structure."
    17. kept: "A feature in progress carries bare unnamed asserts. A finished feature carries named outcome contexts."
    18. kept: "The first gate's hinge is the actuation's shape and the truth of the one observation, not how outcomes are named or divided."
    19. kept: "Do not pause to run the inevitably-failing test." This line does not say "in the first turn", so it is broader than the directive, but it still requires the same behavior.
    20. kept: "The human accepts the first turn's content in separate hinges: actuation, then observation, then controls."
    21. kept: "The implementation is the fourth hinge."
    22. kept: "The naming is the fifth hinge, at the feature's close."
    23. kept: "Propose each hinge and get it accepted before the next, per the hinge-cycle rule."
    24. kept: "Do not present the whole test file for a single accept." / "The exception to points 28 and 29 is when the engineer chose unattended work at the start"

### Checker B

    All 24 directives come out kept. None is less precise or lost.

    1. kept — "Start a feature by writing a test file, not implementation."
    2. kept — "The first turn produces that test file and nothing more."
    3. kept — "The first turn begins at the first gate, where responsibility first transfers to the human."
    4. kept — "Before writing the file, settle the actuation, the observation, and the controls."; "Settle the three test hinges first, then assemble and show the file."; "The exception to points 28 and 29 is when the engineer chose unattended work at the start"; "Propose each hinge and get it accepted before the next"
    5. kept — "The first gate puts down only the actuation and an unnamed assert."
    6. kept — "The actuation is the invocation of the unit under test, the first efferent reference, bound to an explaining variable."
    7. kept — "State any inputs just above the actuation, via controls or literals."
    8. kept — "The unnamed assert is a single bare `test` block asserting the explaining variable, or the variable against a control value."
    9. kept — "Write no inner outcome `context` yet, so no outcome is named."
    10. kept — "Nest the file to mirror its folder path, per the folder-mirroring rule, with one outer `context` per path segment."
    11. kept — "Place the actuation and the unnamed `test` block inside the innermost `context`." (No outcome context exists in the first turn, so the innermost context can only be a folder-path one.)
    12. kept — "Assert against an explaining variable, a named local whose name states what is asserted, not against an inline expression."
    13. kept — "The explaining variable holds the result of actuating the concern."
    14. kept — "Actuate first, bind the result, then assert it."
    15. kept — "The shell of the cradle is the actuation and its unnamed assert."; "Once the shell is implemented, leave the test unnamed through the rest of the feature's development."; "Name the test only at the end of the feature."
    16. kept — "Name the test only at the end of the feature."; "Add the outcome `context` each observation establishes at that time, giving the test-structure rule's \"one inner `context` per outcome\" structure."
    17. kept — "A feature in progress carries bare unnamed asserts. A finished feature carries named outcome contexts."
    18. kept — "The first gate's hinge is the actuation's shape and the truth of the one observation, not how outcomes are named or divided."
    19. kept — "Do not pause to run the inevitably-failing test." (The words "in the first turn" are dropped, so the shorter version is broader. It still requires the same behavior in the first turn.)
    20. kept — "The human accepts the first turn's content in separate hinges: actuation, then observation, then controls."
    21. kept — "The implementation is the fourth hinge."
    22. kept — "The naming is the fifth hinge, at the feature's close."
    23. kept — "Propose each hinge and get it accepted before the next, per the hinge-cycle rule."
    24. kept — "Do not present the whole test file for a single accept."; "The exception to points 28 and 29 is when the engineer chose unattended work at the start"

## dbe-human-in-the-loop

### The compressor's answer

    1. In DBE, place the human's attention only at the hinges, where design judgment lives.
    2. A hinge is a subtle, load-bearing decision the design turns on (see the DBE vocabulary).
    3. The original pair of hinges is setting the cradle (the efferent shape of the actuation) and judging solubility (the result).
    4. The loop waits at the hinges so the human can deliberate them.
    5. The agent does all code generation between hinges straight through.
    6. Never make the human wait at a red or green bar.
    7. Never deliberate the pass/fail bar.
    8. The AI generates. The human deliberates.
    9. The human owns the efferent design, meaning what the actuation looks like.
    10. The human owns the solubility verdict on what comes back.
    11. The AI owns generating within the cradle: the test scaffolding and the implementation, steered toward solubility.

    ## The loop, by turn

    1. **Human sets the cradle, the actuation.** The actuation is the contract and the highest-leverage hinge.
    2. The AI may propose the actuation.
    3. The human holds edit and veto power specifically on the actuation.
    4. When the efferent shape is uncertain, the AI asks rather than averaging toward common code.
    5. **The three test hinges produce turn one.** Put the actuation, the observation, and the controls to the human in turn, per the hinge-cycle rule.
    6. Assemble the test file once all three are accepted.
    7. Never produce the whole test file at an earlier hinge.
    8. The exception is when the engineer chose unattended work at the start. Then the agent decides each hinge and generates through (see the attended-or-unattended-is-chosen-at-the-start rule).
    9. The human deliberates whether the actuation reads as soluble use, not the test mechanics.
    10. If it does not, fix the cradle now, before any implementation exists.
    11. **AI generates the implementation inside the cradle, straight through.**
    12. The AI runs the test to confirm, as verification, not as the green half of a ceremony.
    13. The human deliberates the unit's solubility.
    14. If the unit only works by forcing an awkward actuation, fix the cradle, not the implementation.
    15. **Loop by outcome.** Name the next distinct outcome of the same single actuation.
    16. The AI adds an inner `context` and extends the implementation just enough.
    17. The human deliberates solubility again.
    18. **Exit on solubility, not coverage.** Stop when the unit has dissolved into the reader's understanding, not at an assertion count.

    ## How to apply

    1. Run the loop above.
    2. Keep turns small: one actuation, one outcome, so the cradle stays legible during deliberation.
    3. Hand the human the actuation to edit or approve.
    4. Let the AI fill everything else.
    5. Do not ask the human to confirm a failing or passing test.
    6. Stop when solubility is satisfied.
    7. **Why:** Design judgment stays with the human, and applies only at the hinges. The AI's failure mode, regressing toward average poorly-designed code, first shows as an awkward actuation, so a wait there catches it at the interface.

    CONTRADICTIONS: A tension, not a strict contradiction. Turn 2 puts the observation and the controls to the human as hinges, per the hinge-cycle rule. But the same turn says the human deliberates "not the test mechanics", and the Why says human attention is removed from "test mechanics". Both are kept as the source has them. Separately, the source names two original hinges, while turn 2 uses three test hinges. The Related list explains this as the original pair "grown to five", so I read it as history, not a conflict.

### The directives, as the listing agent gave them

    1. In DBE, place the human's attention only where design judgment lives, at the hinges (the decisions the design turns on).
    2. The loop waits at the hinges so the human can deliberate them.
    3. Everything between the hinges is code generation that the agent does straight through.
    4. Never make the human wait at a red or green bar, and do not ask the human to confirm a failing or passing test.
    5. The human owns the efferent design (what the actuation looks like) and the solubility verdict on what comes back.
    6. The AI owns generating within the cradle (the test scaffolding and the implementation), steered toward solubility.
    7. The human sets the cradle, which is the actuation.
    8. The AI may propose the actuation.
    9. The human holds edit and veto power specifically on the actuation.
    10. When the efferent shape is uncertain, the AI asks rather than averaging toward common code.
    11. The actuation, the observation, and the controls are each put to the human in turn, per the hinge-cycle rule.
    12. The test file is assembled once the actuation, the observation, and the controls have all been accepted.
    13. The whole test file is never produced at an earlier hinge, unless the engineer chose unattended work at the start.
    14. When the engineer chose unattended work at the start, the agent decides each hinge and generates through.
    15. The human deliberates whether the actuation reads as soluble use, not the test mechanics.
    16. If the actuation does not read as soluble use, fix the cradle at that point, before any implementation exists.
    17. The AI generates the implementation inside the cradle, straight through.
    18. The AI runs the test to confirm the implementation, as verification and not as the green half of a ceremony.
    19. The human deliberates the unit's solubility once the implementation has been generated.
    20. If the unit only works by forcing an awkward actuation, the fix goes to the cradle, not to the implementation.
    21. Loop by outcome: name the next distinct outcome of the same single actuation.
    22. For each new outcome, the AI adds an inner `context` and extends the implementation just enough.
    23. After each outcome is added, the human deliberates solubility again.
    24. Exit on solubility, not coverage. The stopping criterion is that the unit has dissolved into the reader's understanding, not an assertion count.
    25. Run the human-in-the-loop loop as laid out, turn by turn.
    26. Keep turns small (one actuation, one outcome) so the cradle stays legible while the human deliberates.
    27. Hand the human the actuation to edit or approve.
    28. Let the AI fill in everything other than the actuation.

### Checker A

    All 28 directives are kept. None is less precise and none is lost.

    1. kept — "place the human's attention only at the hinges, where design judgment lives" + "A hinge is a subtle, load-bearing decision the design turns on"
    2. kept — "The loop waits at the hinges so the human can deliberate them."
    3. kept — "The agent does all code generation between hinges straight through."
    4. kept — "Never make the human wait at a red or green bar." + "Do not ask the human to confirm a failing or passing test."
    5. kept — "The human owns the efferent design, meaning what the actuation looks like." + "The human owns the solubility verdict on what comes back."
    6. kept — "The AI owns generating within the cradle: the test scaffolding and the implementation, steered toward solubility."
    7. kept — "Human sets the cradle, the actuation."
    8. kept — "The AI may propose the actuation."
    9. kept — "The human holds edit and veto power specifically on the actuation."
    10. kept — "When the efferent shape is uncertain, the AI asks rather than averaging toward common code."
    11. kept — "Put the actuation, the observation, and the controls to the human in turn, per the hinge-cycle rule."
    12. kept — "Assemble the test file once all three are accepted."
    13. kept — "Never produce the whole test file at an earlier hinge." + "The exception is when the engineer chose unattended work at the start."
    14. kept — "Then the agent decides each hinge and generates through"
    15. kept — "The human deliberates whether the actuation reads as soluble use, not the test mechanics."
    16. kept — "If it does not, fix the cradle now, before any implementation exists."
    17. kept — "AI generates the implementation inside the cradle, straight through."
    18. kept — "The AI runs the test to confirm, as verification, not as the green half of a ceremony." (The object "the implementation" is left implicit, but the step that comes just before supplies it.)
    19. kept — "The human deliberates the unit's solubility." (It comes after the implementation step in the ordered loop, so it happens once the implementation exists.)
    20. kept — "If the unit only works by forcing an awkward actuation, fix the cradle, not the implementation."
    21. kept — "Loop by outcome. Name the next distinct outcome of the same single actuation."
    22. kept — "The AI adds an inner `context` and extends the implementation just enough." (It sits inside the loop-by-outcome steps, so it applies to each new outcome.)
    23. kept — "The human deliberates solubility again."
    24. kept — "Exit on solubility, not coverage. Stop when the unit has dissolved into the reader's understanding, not at an assertion count."
    25. kept — "Run the loop above." + the section heading "The loop, by turn"
    26. kept — "Keep turns small: one actuation, one outcome, so the cradle stays legible during deliberation."
    27. kept — "Hand the human the actuation to edit or approve."
    28. kept — "Let the AI fill everything else."

### Checker B

    1. kept — "place the human's attention only at the hinges, where design judgment lives" and "A hinge is a subtle, load-bearing decision the design turns on"
    2. kept — "The loop waits at the hinges so the human can deliberate them."
    3. kept — "The agent does all code generation between hinges straight through."
    4. kept — "Never make the human wait at a red or green bar." and "Do not ask the human to confirm a failing or passing test."
    5. kept — "The human owns the efferent design, meaning what the actuation looks like." and "The human owns the solubility verdict on what comes back."
    6. kept — "The AI owns generating within the cradle: the test scaffolding and the implementation, steered toward solubility."
    7. kept — "Human sets the cradle, the actuation."
    8. kept — "The AI may propose the actuation."
    9. kept — "The human holds edit and veto power specifically on the actuation."
    10. kept — "When the efferent shape is uncertain, the AI asks rather than averaging toward common code."
    11. kept — "Put the actuation, the observation, and the controls to the human in turn, per the hinge-cycle rule."
    12. kept — "Assemble the test file once all three are accepted."
    13. kept — "Never produce the whole test file at an earlier hinge." and "The exception is when the engineer chose unattended work at the start."
    14. kept — "Then the agent decides each hinge and generates through"
    15. kept — "The human deliberates whether the actuation reads as soluble use, not the test mechanics."
    16. kept — "If it does not, fix the cradle now, before any implementation exists."
    17. kept — "AI generates the implementation inside the cradle, straight through."
    18. kept — "The AI runs the test to confirm, as verification, not as the green half of a ceremony."
    19. kept — "The human deliberates the unit's solubility." (it comes right after the implementation step in the numbered turn order, so the timing holds)
    20. kept — "If the unit only works by forcing an awkward actuation, fix the cradle, not the implementation."
    21. kept — "Loop by outcome. Name the next distinct outcome of the same single actuation."
    22. kept — "The AI adds an inner `context` and extends the implementation just enough." (it sits inside the "Loop by outcome" step, so it applies to each outcome)
    23. kept — "The human deliberates solubility again."
    24. kept — "Exit on solubility, not coverage. Stop when the unit has dissolved into the reader's understanding, not at an assertion count."
    25. kept — "Run the loop above." together with the heading "The loop, by turn"
    26. kept — "Keep turns small: one actuation, one outcome, so the cradle stays legible during deliberation."
    27. kept — "Hand the human the actuation to edit or approve."
    28. kept — "Let the AI fill everything else."

    All 28 directives are kept. None is less precise or lost.

## hinge-cycle

### The compressor's answer

    1. Building the initial implementation of an outcome runs a cycle of five hinges, in the order below.
    2. Hand each hinge to the human separately. Get it accepted before moving to the next.
    3. **Actuation** is the invocation of the unit under test. It is the unit's efferent shape: name, arguments, arity, return.
    4. **Observation** is what is asserted about the result. That covers value-equality vs. identity vs. a raised error, and what the explaining variable is compared against.
    5. What the test reads is the side effect the actuation produces. A returned value is one such effect, a case rather than the rule.
    6. An actuation that returns nothing still produces an effect somewhere. One that returns a value frequently produces others beside it.
    7. The observation hinge asks which effect the test reads, and how it reads it. It does not assume the return.
    8. **Controls** are the example constants the test is built from. That covers control form, nested vs. top-level, inner constants, Array vs. Hash seeding, and literals vs. controls.
    9. **Implementation** is the code that satisfies the test.
    10. The implementation hinge always has two candidates. One is the working implementation written directly. The other is the red/green/refactor cycle (see the the-implementation-hinge-offers-the-red-green-refactor-cycle rule).
    11. **Naming** is the outcome `context` that names what the observation establishes (the test's name).
    12. The first three hinges concern the test (turn one). The fourth is the implementation (turn two).
    13. Assemble and show the turn-one test file only after the actuation, observation, and controls are accepted, per the first-turn rule.
    14. Then propose the implementation as the fourth hinge.
    15. Once the implementation is accepted, write it, run the suite, and show the test with its result.
    16. Defer the naming hinge to the feature's close. Per the first-turn rule, the cradle and its outcomes are developed unnamed.
    17. Once the feature's outcomes are implemented, settle each outcome's name as its own hinge. Add each outcome's `context` via options, one outcome at a time, per the one-outcome-at-a-time naming rule.
    18. For a single-outcome feature, naming directly follows the implementation hinge.
    19. This is the initial-implementation cycle for one outcome. Looping to further outcomes extends the implementation and re-enters at the relevant hinges.
    20. Naming is settled for all outcomes at the close.
    21. When an awkward implementation reveals a bad cradle, the fix goes to the cradle rather than the code.
    22. Settle the outcome taxonomy deliberately, as a design artifact. Do not treat it as a label applied after the fact.
    23. Where a hinge has genuinely distinct options, present them as options.
    24. Where a hinge has one candidate, present that one the same way.
    25. In both cases, always offer the free-text option. That is the human dictating outright, or a chat to work out the answer.
    26. Never pass a hinge without the human's acceptance.
    27. Present every hinge through the selection UI. Its built-in **Other** answer is the free-text option (see the present-every-prompt rule).
    28. An option is the artifact, not a label for it. It is the line that would be written, shown as it would be written.
    29. For example, the option reads `assert(retries == 3)` or `Controls::Upload.example(client: control_client, retries: 3)`.
    30. A gloss may follow an option where the difference between two candidates is not visible in the code alone.
    31. A label standing in place of the artifact is not an option. For example, `Accept — assert the returned count against 3` is not an option.
    32. A hinge with one candidate is not an "accept" prompt. It shows that candidate as its option, exactly as a hinge with three shows three.
    33. Selecting the lone candidate is the acceptance. Nothing about the single case changes the form.
    34. The selection UI takes no fewer than two options. With a lone candidate, `Explain` fills the second place, per the present-every-prompt rule.
    35. Do not search for a second candidate to reach two.
    36. Do not manufacture a second candidate to avoid the appearance of a foregone conclusion.
    37. This generalizes the actuation-gate-options-or-chat rule, which states the same mechanism at the first gate.
    38. What goes on screen at each hinge is the what-each-hinge-displays rule. That is the actuation as the anchor, and the contexts shown once.
    39. **Why:** Each hinge is a real design decision with its own failure mode. Bundling them collapses separate deliberations into one judgment on a fait accompli, the mean-bias failure. Separate hinges keep the human producing the answer, not ratifying it. The free-text option keeps a lone candidate from foreclosing an answer only the human can produce. The controls need their own hinge. A non-discriminating example asserts nothing, and a top-level constant cannot distinguish a full name from a final segment. A mis-describing name is a design error in its own right.

    ## The five are named before the first one is put

    1. Before the first hinge, give a brief account of all five.
    2. The account says what a hinge is. It gives the five in order with one line each, and says what the loop does between them.
    3. For example:

    > The work runs through five hinges. A hinge is a decision the design turns on, and the loop stops
    > at each one for you.
    >
    > 1. **Actuation** — the invocation of the unit, written as a use site would write it.
    > 2. **Observation** — what the test reads about the effect the actuation produces.
    > 3. **Controls** — the known inputs the test is built from.
    > 4. **Implementation** — the code that satisfies the test.
    > 5. **Naming** — the name of the outcome the test establishes.
    >
    > The first three build the test. The fourth writes the code. The fifth is settled at the close.
    > Everything between the hinges I generate without stopping.

    4. Give the account once, when the loop starts on a piece of work.
    5. Do not repeat it at each cycle or at each outcome.
    6. The account does not apply under unattended work, where no hinge is put to the engineer. There the plan takes its place (see the attended-or-unattended-is-chosen-at-the-start rule).
    7. Give the account after the participation decision, not before it.
    8. Place the account immediately ahead of the first hinge.
    9. The participation decision names no hinge, on purpose.
    10. **Why:** Without the account, an engineer weighs the actuation as though it were the whole of what is being asked. Each question the account would answer then arrives at a later hinge, mid-decision. A passage repeated at every hinge stops being read.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Building the initial implementation of an outcome runs a cycle of five hinges, in this order: actuation, observation, controls, implementation, naming.
    2. Each hinge is handed to the human separately.
    3. Each hinge must be accepted by the human before moving to the next. Never pass a hinge without the human's acceptance.
    4. The actuation hinge settles the invocation of the unit under test: its name, arguments, arity and return.
    5. The observation hinge settles what is asserted about the result: value-equality, identity or a raised error, and what the explaining variable is compared against.
    6. The observation hinge asks which side effect of the actuation the test reads, and how it reads it, rather than assuming the effect is the returned value.
    7. The controls hinge settles the example constants the test is built from: which control form, nested or top-level, what inner constants, Array or Hash seeding, and literals or controls.
    8. The implementation hinge always offers two candidates: the working implementation written directly, or the red/green/refactor cycle.
    9. The naming hinge settles the outcome `context` that names what the observation establishes (the test's name).
    10. Only after the actuation, observation and controls hinges are accepted does the AI assemble and show the turn-one test file.
    11. After showing the turn-one test, the AI proposes the implementation as the fourth hinge.
    12. Once the implementation is accepted, the AI writes it, runs the suite, and shows the test with its result.
    13. The naming hinge is deferred to the feature's close. The cradle and its outcomes are developed unnamed until then.
    14. Once the feature's outcomes are implemented, each outcome's name is settled as its own hinge, via options, one outcome at a time.
    15. For a single-outcome feature, the naming hinge directly follows the implementation hinge.
    16. Before the first hinge, the agent gives a brief account of all five hinges: what a hinge is, the five in order with one line each, and what the loop does between them.
    17. The brief account of the five hinges is given once, when the loop starts on a piece of work. It is not repeated at each cycle, at each outcome, or at each hinge.
    18. The brief account of the five hinges is not given under unattended work, where no hinge is put to the engineer. There the plan takes its place.
    19. The brief account of the five hinges comes after the participation decision, not before it, and sits immediately ahead of the first hinge.
    20. The participation decision names no hinge.
    21. Where a hinge has genuinely distinct options, present them as options.
    22. Where a hinge has only one candidate, present it as an option the same way, not as an "accept" prompt. Selecting it is the acceptance.
    23. At every hinge, always offer the free-text option: the human dictating the answer outright, or a chat to work out the answer.
    24. Every hinge is presented through the selection UI, whose built-in Other answer is the free-text option.
    25. An option is the artifact itself: the line that would be written, shown as it would be written.
    26. A label standing in place of the artifact (for example "Accept — assert the returned count against 3") is not an option.
    27. A gloss may follow an option where the difference between two candidates is not visible in the code alone.
    28. When a hinge has a lone candidate, `Explain` fills the second place in the selection UI, which takes no fewer than two options.
    29. The agent does not search for a second candidate just to reach two options.
    30. Manufacturing a second candidate to avoid the appearance of a foregone conclusion is forbidden.
    31. When an awkward implementation reveals a bad cradle, the fix goes to the cradle rather than the code.
    32. What goes on screen at each hinge follows the what-each-hinge-displays rule: the actuation as the anchor, and the contexts shown once.
    33. Looping to further outcomes extends the implementation and re-enters the cycle at the relevant hinges. Naming for all outcomes is settled at the close.

### Checker A

    All 33 directives are kept. None is less precise or lost.

    1. kept — "actuation → observation → controls → implementation → naming"; "runs a cycle of five hinges, in the order below"
    2. kept — "Hand each hinge to the human separately."
    3. kept — "Get it accepted before moving to the next."; "Never pass a hinge without the human's acceptance."
    4. kept — "**Actuation** is the invocation of the unit under test. It is the unit's efferent shape: name, arguments, arity, return."
    5. kept — "**Observation** is what is asserted about the result. That covers value-equality vs. identity vs. a raised error, and what the explaining variable is compared against."
    6. kept — "The observation hinge asks which effect the test reads, and how it reads it. It does not assume the return."
    7. kept — "**Controls** are the example constants the test is built from. That covers control form, nested vs. top-level, inner constants, Array vs. Hash seeding, and literals vs. controls."
    8. kept — "The implementation hinge always has two candidates. One is the working implementation written directly. The other is the red/green/refactor cycle"
    9. kept — "**Naming** is the outcome `context` that names what the observation establishes (the test's name)."
    10. kept — "Assemble and show the turn-one test file only after the actuation, observation, and controls are accepted"
    11. kept — "Then propose the implementation as the fourth hinge."
    12. kept — "Once the implementation is accepted, write it, run the suite, and show the test with its result."
    13. kept — "Defer the naming hinge to the feature's close. Per the first-turn rule, the cradle and its outcomes are developed unnamed."
    14. kept — "Once the feature's outcomes are implemented, settle each outcome's name as its own hinge. Add each outcome's `context` via options, one outcome at a time"
    15. kept — "For a single-outcome feature, naming directly follows the implementation hinge."
    16. kept — "Before the first hinge, give a brief account of all five."; "The account says what a hinge is. It gives the five in order with one line each, and says what the loop does between them."
    17. kept — "Give the account once, when the loop starts on a piece of work."; "Do not repeat it at each cycle or at each outcome." The list of places leaves out "at each hinge", but "once" already rules that out.
    18. kept — "The account does not apply under unattended work, where no hinge is put to the engineer. There the plan takes its place"
    19. kept — "Give the account after the participation decision, not before it."; "Place the account immediately ahead of the first hinge."
    20. kept — "The participation decision names no hinge, on purpose."
    21. kept — "Where a hinge has genuinely distinct options, present them as options."
    22. kept — "Where a hinge has one candidate, present that one the same way."; "A hinge with one candidate is not an \"accept\" prompt."; "Selecting the lone candidate is the acceptance."
    23. kept — "In both cases, always offer the free-text option. That is the human dictating outright, or a chat to work out the answer."
    24. kept — "Present every hinge through the selection UI. Its built-in **Other** answer is the free-text option"
    25. kept — "An option is the artifact, not a label for it. It is the line that would be written, shown as it would be written."
    26. kept — "A label standing in place of the artifact is not an option. For example, `Accept — assert the returned count against 3` is not an option."
    27. kept — "A gloss may follow an option where the difference between two candidates is not visible in the code alone."
    28. kept — "The selection UI takes no fewer than two options. With a lone candidate, `Explain` fills the second place"
    29. kept — "Do not search for a second candidate to reach two."
    30. kept — "Do not manufacture a second candidate to avoid the appearance of a foregone conclusion."
    31. kept — "When an awkward implementation reveals a bad cradle, the fix goes to the cradle rather than the code."
    32. kept — "What goes on screen at each hinge is the what-each-hinge-displays rule. That is the actuation as the anchor, and the contexts shown once."
    33. kept — "Looping to further outcomes extends the implementation and re-enters at the relevant hinges."; "Naming is settled for all outcomes at the close."

### Checker B

    The shorter version keeps all 33 directives. None is less precise and none is lost.

    1. kept — "a cycle of five hinges, in the order below" plus the title "actuation → observation → controls → implementation → naming"
    2. kept — "Hand each hinge to the human separately."
    3. kept — "Get it accepted before moving to the next." / "Never pass a hinge without the human's acceptance."
    4. kept — "**Actuation** is the invocation of the unit under test. It is the unit's efferent shape: name, arguments, arity, return."
    5. kept — "**Observation** is what is asserted about the result. That covers value-equality vs. identity vs. a raised error, and what the explaining variable is compared against."
    6. kept — "The observation hinge asks which effect the test reads, and how it reads it. It does not assume the return."
    7. kept — "**Controls** are the example constants the test is built from. That covers control form, nested vs. top-level, inner constants, Array vs. Hash seeding, and literals vs. controls."
    8. kept — "The implementation hinge always has two candidates. One is the working implementation written directly. The other is the red/green/refactor cycle"
    9. kept — "**Naming** is the outcome `context` that names what the observation establishes (the test's name)."
    10. kept — "Assemble and show the turn-one test file only after the actuation, observation, and controls are accepted"
    11. kept — "Then propose the implementation as the fourth hinge."
    12. kept — "Once the implementation is accepted, write it, run the suite, and show the test with its result."
    13. kept — "Defer the naming hinge to the feature's close. Per the first-turn rule, the cradle and its outcomes are developed unnamed."
    14. kept — "Once the feature's outcomes are implemented, settle each outcome's name as its own hinge. Add each outcome's `context` via options, one outcome at a time"
    15. kept — "For a single-outcome feature, naming directly follows the implementation hinge."
    16. kept — "Before the first hinge, give a brief account of all five." / "The account says what a hinge is. It gives the five in order with one line each, and says what the loop does between them."
    17. kept — "Give the account once, when the loop starts on a piece of work." / "Do not repeat it at each cycle or at each outcome." The list leaves out "at each hinge", but "once" already rules that out.
    18. kept — "The account does not apply under unattended work, where no hinge is put to the engineer. There the plan takes its place"
    19. kept — "Give the account after the participation decision, not before it." / "Place the account immediately ahead of the first hinge."
    20. kept — "The participation decision names no hinge, on purpose."
    21. kept — "Where a hinge has genuinely distinct options, present them as options."
    22. kept — "Where a hinge has one candidate, present that one the same way." / "A hinge with one candidate is not an "accept" prompt." / "Selecting the lone candidate is the acceptance."
    23. kept — "In both cases, always offer the free-text option. That is the human dictating outright, or a chat to work out the answer."
    24. kept — "Present every hinge through the selection UI. Its built-in **Other** answer is the free-text option"
    25. kept — "An option is the artifact, not a label for it. It is the line that would be written, shown as it would be written."
    26. kept — "A label standing in place of the artifact is not an option. For example, `Accept — assert the returned count against 3` is not an option."
    27. kept — "A gloss may follow an option where the difference between two candidates is not visible in the code alone."
    28. kept — "The selection UI takes no fewer than two options. With a lone candidate, `Explain` fills the second place"
    29. kept — "Do not search for a second candidate to reach two."
    30. kept — "Do not manufacture a second candidate to avoid the appearance of a foregone conclusion."
    31. kept — "When an awkward implementation reveals a bad cradle, the fix goes to the cradle rather than the code."
    32. kept — "What goes on screen at each hinge is the what-each-hinge-displays rule. That is the actuation as the anchor, and the contexts shown once."
    33. kept — "Looping to further outcomes extends the implementation and re-enters at the relevant hinges." / "Naming is settled for all outcomes at the close."

## loop-records

### The compressor's answer

    1. `waytide/local/logs/loops/` holds loop records: one file per feature, recording its cycles through the loop.
    2. The loop is the distributed OODA cycle, as defined in the DBE vocabulary.
    3. A loop record captures how a feature was decided. The decision log captures what was decided.
    4. A loop record holds the hinges the AI determined and the options it put to the engineer.
    5. It also holds the engineer's decisions, or the chat that replaced them.
    6. A loop record must not displace the decision log.
    7. The decision log stays one line per decision.

    ## Format

    1. Name the file per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`.
    2. Begin with a `# Loop record — <feature>` title and a one-paragraph summary of the feature.
    3. Declare the mode at the top, as **attended** or **unattended**, per the attended-or-unattended-is-chosen-at-the-start rule.
    4. State the mode once.
    5. Write one section per cycle, in order.
    6. Each cycle records a **Hinge**: the subtle, load-bearing decision the AI determined.
    7. Each cycle records **Options**: the candidates put to the engineer at the gate.
    8. When a hinge was handled without stopping, write Options explicitly as "none — no gate".
    9. Each cycle records **Decision / chat**: what the engineer chose, or the chat that ensued and how it resolved.
    10. Record the substance of the chat, not just its outcome.
    11. Under an unattended mode, a cycle carries its hinge and the decision with its reasoning.
    12. Under an unattended mode, write no Options line and no Decision / chat line.
    13. The "none — no gate" form marks a skipped gate in an attended run. Do not use it in an unattended run.
    14. Include an **Outcome** line: the resulting code or behavior, the suite state, and the commit.
    15. End the file with a provenance footer (`Authored by … / Changed by …`), per foundation's working-state-artifacts-carry-a-provenance-footer rule.

    ## Live vs. backfill

    1. Writing a loop record while doing the work is the default.
    2. Mark a record reconstructed retroactively from memory as a **Backfill**, at the top.

    ## How to apply

    1. When a feature's loop is worth preserving, add a file under `waytide/local/logs/loops/` in the format above.
    2. Record each cycle's hinge, options, and decision or chat.
    3. Keep the one-line decision-log entries separate and intact.
    4. **Why:** the deliberation, meaning the hinges and the reasoning over options, is lost if only code and one-line decisions survive. A per-feature narrative keeps it and exposes skipped gates.

    CONTRADICTIONS: "How to apply" says to record each cycle's "hinge, options, and decision or chat" with no exception. The Format section says that under an unattended mode a cycle carries no Options line and no Decision / chat line. Both are kept as the source has them (Format point 12 and How to apply point 2).

### The directives, as the listing agent gave them

    1. Loop records are held in `waytide/local/logs/loops/`, one file per feature, documenting the cycles through the loop.
    2. A loop record must not displace the one-line decision log.
    3. The decision log stays one line per decision.
    4. A loop record's filename follows the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`.
    5. A loop record has a `# Loop record — <feature>` title.
    6. A loop record has a one-paragraph summary of the feature.
    7. A loop record declares its mode, attended or unattended, at the top.
    8. A loop record states the mode once.
    9. A loop record has one section per cycle, in order.
    10. In an attended run, each cycle records a Hinge: the subtle, load-bearing decision the AI determined.
    11. In an attended run, each cycle records Options: the candidates put to the engineer at the gate.
    12. When a hinge was handled without stopping, its Options line says "none — no gate", explicitly.
    13. In an attended run, each cycle records Decision / chat: what the engineer chose, or the chat that followed and how it resolved.
    14. A Decision / chat entry records the substance of the chat, not just the outcome.
    15. Under an unattended mode, a cycle carries its hinge and the decision with its reasoning.
    16. Under an unattended mode, a cycle has no Options line and no Decision / chat line, because writing them would be a false record of a deliberation that never occurred.
    17. The "none — no gate" form is not used for an unattended run's cycles. It marks only a skipped gate in an attended run.
    18. A loop record has an Outcome line giving the resulting code or behavior, the suite state, and the commit.
    19. A loop record ends with a provenance footer (`Authored by … / Changed by …`), per foundation's working-state-artifacts-carry-a-provenance-footer rule.
    20. A loop record is written while the work is being done, by default.
    21. A loop record reconstructed retroactively from memory must be marked at the top as a Backfill.
    22. When a feature's loop is worth preserving, add a file for it under `waytide/local/logs/loops/` in the format above.
    23. Keep the one-line decision-log entries separate and intact.

### Checker A

    1. kept — "`waytide/local/logs/loops/` holds loop records: one file per feature, recording its cycles through the loop."
    2. kept — "A loop record must not displace the decision log." together with "The decision log stays one line per decision."
    3. kept — "The decision log stays one line per decision."
    4. kept — "Name the file per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`."
    5. kept — "Begin with a `# Loop record — <feature>` title"
    6. kept — "and a one-paragraph summary of the feature."
    7. kept — "Declare the mode at the top, as **attended** or **unattended**"
    8. kept — "State the mode once."
    9. kept — "Write one section per cycle, in order."
    10. kept — "Each cycle records a **Hinge**: the subtle, load-bearing decision the AI determined." (The compressed version says "each cycle" with no attended qualifier. It still requires the same behavior, because format item 11 also gives unattended cycles a hinge.)
    11. kept — "Each cycle records **Options**: the candidates put to the engineer at the gate." together with "Under an unattended mode, write no Options line and no Decision / chat line." (The unattended exception limits this to attended runs.)
    12. kept — "When a hinge was handled without stopping, write Options explicitly as "none — no gate"."
    13. kept — "Each cycle records **Decision / chat**: what the engineer chose, or the chat that ensued and how it resolved." together with the unattended exception in format item 12.
    14. kept — "Record the substance of the chat, not just its outcome."
    15. kept — "Under an unattended mode, a cycle carries its hinge and the decision with its reasoning."
    16. kept — "Under an unattended mode, write no Options line and no Decision / chat line." (The behavior is kept. The reason is dropped: such lines would be a false record of a deliberation that never occurred.)
    17. kept — "The "none — no gate" form marks a skipped gate in an attended run. Do not use it in an unattended run."
    18. kept — "Include an **Outcome** line: the resulting code or behavior, the suite state, and the commit."
    19. kept — "End the file with a provenance footer (`Authored by … / Changed by …`), per foundation's working-state-artifacts-carry-a-provenance-footer rule."
    20. kept — "Writing a loop record while doing the work is the default."
    21. kept — "Mark a record reconstructed retroactively from memory as a **Backfill**, at the top."
    22. kept — "When a feature's loop is worth preserving, add a file under `waytide/local/logs/loops/` in the format above."
    23. kept — "Keep the one-line decision-log entries separate and intact."

### Checker B

    1. kept — "`waytide/local/logs/loops/` holds loop records: one file per feature, recording its cycles through the loop."
    2. kept — "A loop record must not displace the decision log." together with "The decision log stays one line per decision."
    3. kept — "The decision log stays one line per decision."
    4. kept — "Name the file per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`."
    5. kept — "Begin with a `# Loop record — <feature>` title"
    6. kept — "and a one-paragraph summary of the feature."
    7. kept — "Declare the mode at the top, as **attended** or **unattended**"
    8. kept — "State the mode once."
    9. kept — "Write one section per cycle, in order."
    10. kept — "Each cycle records a **Hinge**: the subtle, load-bearing decision the AI determined." Format item 6 does not say "in an attended run", but item 11 says the same thing for unattended runs, so hinges are required in both modes.
    11. kept — "Each cycle records **Options**: the candidates put to the engineer at the gate." This line is unscoped, but "Under an unattended mode, write no Options line" limits it to attended runs.
    12. kept — "When a hinge was handled without stopping, write Options explicitly as \"none — no gate\"."
    13. kept — "Each cycle records **Decision / chat**: what the engineer chose, or the chat that ensued and how it resolved." The "no Decision / chat line" exclusion for unattended runs limits it to attended runs.
    14. kept — "Record the substance of the chat, not just its outcome."
    15. kept — "Under an unattended mode, a cycle carries its hinge and the decision with its reasoning."
    16. kept — "Under an unattended mode, write no Options line and no Decision / chat line." The behavior is fully required. Only the reason is gone, that writing them would be a false record of a deliberation that never occurred.
    17. kept — "The \"none — no gate\" form marks a skipped gate in an attended run. Do not use it in an unattended run."
    18. kept — "Include an **Outcome** line: the resulting code or behavior, the suite state, and the commit."
    19. kept — "End the file with a provenance footer (`Authored by … / Changed by …`), per foundation's working-state-artifacts-carry-a-provenance-footer rule."
    20. kept — "Writing a loop record while doing the work is the default."
    21. kept — "Mark a record reconstructed retroactively from memory as a **Backfill**, at the top."
    22. kept — "When a feature's loop is worth preserving, add a file under `waytide/local/logs/loops/` in the format above."
    23. kept — "Keep the one-line decision-log entries separate and intact."

## never-ask-to-start-test-first

### The compressor's answer

    1. Test-first is the standing default for starting any task.
    2. Do not ask "shall I start it test-first?".
    3. Do not otherwise put the test-first decision to the human.
    4. The answer is always yes unless told otherwise.
    5. If the human wants a task started another way, they will give a different instruction.
    6. When the next task is clear, begin it test-first without asking.
    7. Offer the next-task selection if useful.
    8. Never frame the next-task selection as a test-first/not question.
    9. Deviate from test-first only on an explicit instruction to do so.

    ## What this does not cover: the human's level of participation

    1. Test-first is the method's substance: design is driven from the efferent side, and the test is written before the implementation.
    2. Test-first is never put to the engineer.
    3. Attended or unattended is a different question. It asks how often the loop stops, not what it builds.
    4. DBE is in effect either way. The attended-or-unattended choice is a batch size, not a confirmation of the method.
    5. Small batches spend attention continuously and keep rework near zero. Big batches spend none until the end and take rework instead.
    6. A question with a genuinely situational answer is a decision, not a settled default. This rule does not forbid asking it.
    7. See the attended-or-unattended-is-chosen-at-the-start rule.
    8. **Why:** Asking confirms a settled default and spends a turn on a non-decision. The human's attention belongs at the hinges: the actuation and the solubility verdict. Re-asking the standing default is ceremony.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Test-first is the standing default for starting any task.
    2. Do not ask the human "shall I start it test-first?", or otherwise put the test-first decision to the human.
    3. Treat the answer to whether to start a task test-first as always yes, unless told otherwise.
    4. Under test-first, design is driven from the efferent side.
    5. Under test-first, the test is written before the implementation.
    6. The choice between attended and unattended work (how often the loop stops) is a separate decision that this rule does not forbid asking about. It is chosen at the start, per the attended-or-unattended-is-chosen-at-the-start rule.
    7. DBE is in effect whether the work is attended or unattended, so choosing between them neither confirms nor declines anything about the method.
    8. The human's attention belongs at the hinges, which are the actuation and the solubility verdict, and not on whether to follow the method itself.
    9. When the next task is clear, begin it test-first without asking.
    10. Offering the human a choice of the next task is allowed when useful.
    11. Never frame the next-task selection as a test-first-or-not question.
    12. Deviate from test-first only on an explicit instruction to do so.

### Checker A

    1. kept — "Test-first is the standing default for starting any task."
    2. kept — "Do not ask \"shall I start it test-first?\"." / "Do not otherwise put the test-first decision to the human."
    3. kept — "The answer is always yes unless told otherwise." (the question it answers comes from the heading, "Never ask whether to start a task test-first")
    4. kept — "design is driven from the efferent side"
    5. kept — "the test is written before the implementation"
    6. kept — "Attended or unattended is a different question. It asks how often the loop stops, not what it builds." / "This rule does not forbid asking it." / "See the attended-or-unattended-is-chosen-at-the-start rule." / "the cadence question this does not forbid"
    7. less precise — "DBE is in effect either way. The attended-or-unattended choice is a batch size, not a confirmation of the method." Missing: it says only that the choice does not confirm the method, not that it does not decline it either.
    8. kept — "The human's attention belongs at the hinges: the actuation and the solubility verdict. Re-asking the standing default is ceremony."
    9. kept — "When the next task is clear, begin it test-first without asking."
    10. less precise — "Offer the next-task selection if useful." Missing: the directive grants permission ("allowed"), but the shorter version reads as an instruction to offer.
    11. kept — "Never frame the next-task selection as a test-first/not question."
    12. kept — "Deviate from test-first only on an explicit instruction to do so."

### Checker B

    1. kept: "Test-first is the standing default for starting any task."
    2. kept: "Do not ask "shall I start it test-first?"." / "Do not otherwise put the test-first decision to the human."
    3. kept: "The answer is always yes unless told otherwise."
    4. kept: "design is driven from the efferent side"
    5. kept: "the test is written before the implementation"
    6. kept: "Attended or unattended is a different question. It asks how often the loop stops" / "This rule does not forbid asking it." / "See the attended-or-unattended-is-chosen-at-the-start rule." (The part about being chosen at the start comes only from the rule's name.)
    7. kept: "DBE is in effect either way. The attended-or-unattended choice is a batch size, not a confirmation of the method."
    8. kept: "The human's attention belongs at the hinges: the actuation and the solubility verdict. Re-asking the standing default is ceremony."
    9. kept: "When the next task is clear, begin it test-first without asking."
    10. less precise: "Offer the next-task selection if useful." Missing: the directive grants permission ("allowed"), but the shorter version reads as an instruction to offer.
    11. kept: "Never frame the next-task selection as a test-first/not question."
    12. kept: "Deviate from test-first only on an explicit instruction to do so."

### The re-check, after the repairs

    1. kept — "Test-first is the standing default for starting any task."
    2. kept — "Do not ask \"shall I start it test-first?\"." / "Do not otherwise put the test-first decision to the human."
    3. kept — "The answer is always yes unless told otherwise."
    4. kept — "design is driven from the efferent side"
    5. kept — "the test is written before the implementation"
    6. kept — "Attended or unattended is a different question. It asks how often the loop stops, not what it builds." / "This rule does not forbid asking it." / "See the attended-or-unattended-is-chosen-at-the-start rule." (Being chosen at the start is stated only through the rule's name. The link between "a question with a genuinely situational answer" and attended-or-unattended is implied by where it sits, not stated outright.)
    7. kept — "DBE is in effect either way. The attended-or-unattended choice is a batch size. It neither confirms nor declines the method."
    8. kept — "The human's attention belongs at the hinges: the actuation and the solubility verdict. Re-asking the standing default is ceremony."
    9. kept — "When the next task is clear, begin it test-first without asking."
    10. kept — "You may offer the next-task selection if useful."
    11. kept — "Never frame the next-task selection as a test-first/not question."
    12. kept — "Deviate from test-first only on an explicit instruction to do so."

## no-green-on-arrival-tests

### The compressor's answer

    1. A test justifies itself in DBE by driving an implementation that did not exist.
    2. A test that passes the moment it is written is "green-on-arrival". It only confirms an existing affordance and designs nothing.
    3. Drop an outcome whose test is green-on-arrival.
    4. The tell is a no-op implementation hinge in the hinge cycle: "nothing to write — the existing code already satisfies this".
    5. A no-op implementation hinge signals dropping the outcome. Do not add a confirming test in its place.
    6. Do not manufacture a test after the fact to cover behavior that was already present.
    7. Locking such behavior to prevent a public-contract regression is a deliberate, separate decision the human makes.
    8. That locking is not the default, and it is not a DBE design step.
    9. This rule covers design only. It does not reach coverage work.
    10. When the activity is preventing regression in existing behavior, green-on-arrival is inevitable and correct. See the "TDD designs, coverage prevents" rule.
    11. **Why:** DBE is a design tool, not a coverage tool: exit on solubility, not coverage. A green-on-arrival test dilutes the suite's signal by reading as a driven outcome. It usually means the implementation ran ahead of its test, through a default value, a conveyed keyword, or an incidental prevention.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. In DBE, a test must justify itself by driving an implementation that did not yet exist.
    2. Drop an outcome whose test is green-on-arrival, meaning it passes the moment it is written.
    3. When an outcome's implementation hinge degenerates to a no-op ("nothing to write — the existing code already satisfies this"), drop the outcome; do not add a confirming test.
    4. Do not manufacture a test after the fact to cover behavior that was already present (for example from a default value, a conveyed keyword, or a prevention written incidentally while satisfying an earlier outcome) when its "own" outcome comes up; notice that the implementation ran ahead of its driving test.
    5. Locking already-present behavior with a test to prevent a public-contract regression is a deliberate, separate decision the human makes; it is not the default, and it is not a DBE design step.
    6. The green-on-arrival prohibition applies only to design and does not reach coverage: when the activity is preventing a regression in existing behavior rather than designing new behavior, a green-on-arrival test is inevitable and correct.

### Checker A

    1 — kept — "A test justifies itself in DBE by driving an implementation that did not exist."

    2 — kept — "A test that passes the moment it is written is "green-on-arrival"." / "Drop an outcome whose test is green-on-arrival."

    3 — kept — "The tell is a no-op implementation hinge in the hinge cycle: "nothing to write — the existing code already satisfies this"." / "A no-op implementation hinge signals dropping the outcome. Do not add a confirming test in its place."

    4 — less precise — "Do not manufacture a test after the fact to cover behavior that was already present." / "It usually means the implementation ran ahead of its test, through a default value, a conveyed keyword, or an incidental prevention." Missing: the trigger "when its own outcome comes up"; the instruction to notice that the implementation ran ahead now appears only as an explanation under Why, not as a directive; and the examples are moved to Why, where they no longer qualify the prohibition (the prevention is no longer described as "written incidentally while satisfying an earlier outcome").

    5 — kept — "Locking such behavior to prevent a public-contract regression is a deliberate, separate decision the human makes." / "That locking is not the default, and it is not a DBE design step."

    6 — kept — "This rule covers design only. It does not reach coverage work." / "When the activity is preventing regression in existing behavior, green-on-arrival is inevitable and correct."

### Checker B

    1 — kept — "A test justifies itself in DBE by driving an implementation that did not exist."
    2 — kept — "A test that passes the moment it is written is \"green-on-arrival\"." / "Drop an outcome whose test is green-on-arrival."
    3 — kept — "The tell is a no-op implementation hinge in the hinge cycle: \"nothing to write — the existing code already satisfies this\"." / "A no-op implementation hinge signals dropping the outcome. Do not add a confirming test in its place."
    4 — less precise — "Do not manufacture a test after the fact to cover behavior that was already present." / "It usually means the implementation ran ahead of its test, through a default value, a conveyed keyword, or an incidental prevention." Missing: the trigger "when its own outcome comes up"; the examples and "ran ahead" appear only as explanation in the Why, not as a directive to notice it; "written incidentally while satisfying an earlier outcome" is shortened to "an incidental prevention".
    5 — kept — "Locking such behavior to prevent a public-contract regression is a deliberate, separate decision the human makes." / "That locking is not the default, and it is not a DBE design step."
    6 — kept — "This rule covers design only. It does not reach coverage work." / "When the activity is preventing regression in existing behavior, green-on-arrival is inevitable and correct."

### The re-check, after the repairs

    The shorter version keeps all 6 directives. None is less precise and none is lost.

    1. kept: "A test justifies itself in DBE by driving an implementation that did not exist."
    2. kept: "Drop an outcome whose test is green-on-arrival." and "A test that passes the moment it is written is "green-on-arrival"."
    3. kept: "The tell is a no-op implementation hinge in the hinge cycle: "nothing to write — the existing code already satisfies this"." and "A no-op implementation hinge signals dropping the outcome. Do not add a confirming test in its place."
    4. kept: "Behavior may already be present when its own outcome comes up. It came from a default value, a conveyed keyword, or a prevention written for an earlier outcome. Notice that the implementation ran ahead of its test. Do not manufacture a test after the fact to cover it." The word "incidental" appears in the Why line: "an incidental prevention".
    5. kept: "Locking such behavior to prevent a public-contract regression is a deliberate, separate decision the human makes." and "That locking is not the default, and it is not a DBE design step."
    6. kept: "This rule covers design only. It does not reach coverage work." and "When the activity is preventing regression in existing behavior, green-on-arrival is inevitable and correct."

## one-outcome-at-a-time-name-via-options

### The compressor's answer

    1. The loop advances one outcome at a time.
    2. The loop stops at every gate for the human.
    3. Do not run ahead.
    4. Do not batch-generate multiple test files in one pass.
    5. Generate one outcome's test, then stop at its gate.
    6. Proceed only on the human's go.
    7. Finishing the work means naming the test.
    8. A test left with an empty, unnamed outcome context is unfinished.
    9. The closing step ascribes the test's name.
    10. Name one test at a time.
    11. At the naming gate, present a list of candidate outcome-context names.
    12. Include the free-text option among the candidates.
    13. The free-text option is mandatory.
    14. The free-text option lets the human input a name directly or discuss it.
    15. Responsibility transfers at the naming gate exactly as at the actuation gate (see the actuation-gate-options rule).
    16. Present alternatives, not a single pick.
    17. Make the human produce the answer, not approve one.
    18. Build one outcome's test at a time.
    19. After each test, stop at each of its hinges (see the hinge-cycle rule) and wait.
    20. Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-at-the-start rule).
    21. Never write several test files at once, in either mode.
    22. To finish an unnamed test, present candidate names as options through the selection UI.
    23. Then apply the name the human chose or dictated.
    24. **Why:** Batching bypasses the gates where the human's judgment acts, and mistakes accumulate unreviewed. The outcome-context name is a small contract on what the test establishes, and the best name may be one only the human can produce.

    CONTRADICTIONS: The source states without qualification that the loop "stops at every gate for the human" and to "proceed only on the human's go", but its How to apply says that under unattended work the agent decides each hinge itself and does not stop. Both are kept as points 2, 6, and 20.

### The directives, as the listing agent gave them

    1. The loop must advance one outcome at a time.
    2. The loop must stop at every gate for the human.
    3. The loop must not run ahead.
    4. Do not batch-generate multiple test files in one pass.
    5. Generate one outcome's test, then stop at its gate.
    6. Proceed past a test's gate only on the human's go.
    7. Finishing the work means naming the test; a test left with an empty (unnamed) outcome context is unfinished.
    8. The closing step must ascribe the test's name.
    9. Name tests one test at a time.
    10. The naming gate must offer a list of candidate outcome-context names.
    11. The naming gate must include the free-text option among the candidate names, and that option is mandatory.
    12. The free-text option must let the human input a name directly or discuss it.
    13. At the naming gate, responsibility must transfer to the human exactly as it does at the actuation gate (per the actuation-gate-options rule).
    14. At the naming gate, present alternatives, not a single pick.
    15. At the naming gate, make the human produce the answer, not approve one.
    16. Naming must not be done as an AI fait accompli.
    17. After each outcome's test is built, stop at each of its hinges (per the hinge-cycle rule) and wait.
    18. Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (per the attended-or-unattended-is-chosen-at-the-start rule).
    19. Never write several test files at once, in either attended or unattended mode.
    20. To finish an unnamed test, present candidate names as options through the selection UI.
    21. Apply the name the human chose or dictated.

### Checker A

    1. kept — "The loop advances one outcome at a time."
    2. kept — "The loop stops at every gate for the human."
    3. kept — "Do not run ahead."
    4. kept — "Do not batch-generate multiple test files in one pass."
    5. kept — "Generate one outcome's test, then stop at its gate."
    6. kept — "Proceed only on the human's go." (It follows line 5, so it applies to the test's gate.)
    7. kept — "Finishing the work means naming the test." / "A test left with an empty, unnamed outcome context is unfinished."
    8. kept — "The closing step ascribes the test's name."
    9. kept — "Name one test at a time."
    10. kept — "At the naming gate, present a list of candidate outcome-context names."
    11. kept — "Include the free-text option among the candidates." / "The free-text option is mandatory."
    12. kept — "The free-text option lets the human input a name directly or discuss it."
    13. kept — "Responsibility transfers at the naming gate exactly as at the actuation gate (see the actuation-gate-options rule)."
    14. kept — "Present alternatives, not a single pick." (It is not tied to the naming gate in words, but it sits among the naming lines and as a broader statement it still requires the behavior.)
    15. kept — "Make the human produce the answer, not approve one." (Same note on scope as 14.)
    16. kept — "Make the human produce the answer, not approve one." / "present candidate names as options through the selection UI" (The phrase "fait accompli" is gone, but these lines require the same behavior.)
    17. kept — "After each test, stop at each of its hinges (see the hinge-cycle rule) and wait."
    18. kept — "Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-at-the-start rule)."
    19. kept — "Never write several test files at once, in either mode."
    20. kept — "To finish an unnamed test, present candidate names as options through the selection UI."
    21. kept — "Then apply the name the human chose or dictated."

    All 21 directives are kept. None is less precise or lost.

### Checker B

    1. kept: "The loop advances one outcome at a time."
    2. kept: "The loop stops at every gate for the human."
    3. kept: "Do not run ahead."
    4. kept: "Do not batch-generate multiple test files in one pass."
    5. kept: "Generate one outcome's test, then stop at its gate."
    6. kept: "Proceed only on the human's go." (it comes right after item 5's gate, so it reads as proceeding past that gate)
    7. kept: "Finishing the work means naming the test." / "A test left with an empty, unnamed outcome context is unfinished."
    8. kept: "The closing step ascribes the test's name."
    9. kept: "Name one test at a time."
    10. kept: "At the naming gate, present a list of candidate outcome-context names."
    11. kept: "Include the free-text option among the candidates." / "The free-text option is mandatory."
    12. kept: "The free-text option lets the human input a name directly or discuss it."
    13. kept: "Responsibility transfers at the naming gate exactly as at the actuation gate (see the actuation-gate-options rule)."
    14. kept: "Present alternatives, not a single pick." (it sits among the naming-gate items 11 to 17, so it applies to the naming gate)
    15. kept: "Make the human produce the answer, not approve one."
    16. kept: "Make the human produce the answer, not approve one." / "Then apply the name the human chose or dictated." (together these require that the AI not name the test unilaterally, though the phrase "fait accompli" itself is absent)
    17. kept: "After each test, stop at each of its hinges (see the hinge-cycle rule) and wait."
    18. kept: "Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-at-the-start rule)."
    19. kept: "Never write several test files at once, in either mode."
    20. kept: "To finish an unnamed test, present candidate names as options through the selection UI."
    21. kept: "Then apply the name the human chose or dictated."

    Result: all 21 directives are kept. None are less precise or lost.

## tdd-designs-coverage-prevents-never-break-implementation

### The compressor's answer

    1. TDD is a design activity. Its failing-test-then-implement cycle designs behavior, and its tests are proofs for design.
    2. In TDD, the red drives the implementation into existence.
    3. Adding test coverage is a separate activity. It prevents regression in existing behavior that is already designed and correct.
    4. Coverage tests are regression prevention, not design proofs. Adding coverage is a testing or final-inspection process, not TDD.
    5. When adding coverage, a test passing on arrival is inevitable and correct. Do not treat it as a defect to work around.
    6. The no-green-on-arrival stance is a design concern. It does not apply to adding coverage.
    7. Never break, mutate, or otherwise invalidate a working implementation to introduce a test.
    8. Do not break working code to "see it go red first." There is no red to manufacture when covering existing behavior.
    9. When the behavior already exists and you are adding coverage, write the test and run it.
    10. Accept the passing coverage test as verification, and leave the implementation untouched.
    11. Reserve the failing-test-first cycle for design, where a test drives new behavior into existence.
    12. **Why:** Forcing TDD's red-to-green onto coverage is a category error. It deforms shipped implementations to satisfy a misplaced ritual, and it blurs design tests with regression tests.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Do not conflate TDD (a design activity) with adding test coverage (a separate activity that prevents a regression in existing behavior); keep the two distinct.
    2. Treat adding test coverage as a testing / final-inspection process, not as TDD.
    3. When adding coverage, accept a test that is green on arrival as correct, and do not treat it as a defect to engineer around.
    4. The no-green-on-arrival stance does not apply when adding coverage to behavior that already exists.
    5. Never break, mutate, or otherwise invalidate a working implementation to introduce a test.
    6. Do not break a working implementation to "see it go red first."
    7. Do not force unnatural changes to shipped code to satisfy the red→green ritual when adding coverage.
    8. Do not manufacture a red when covering behavior that already exists.
    9. When the behavior already exists and you are adding coverage, write the test and run it.
    10. When adding coverage and the test passes, accept that the behavior is verified.
    11. When adding coverage, leave the implementation untouched.
    12. Reserve the failing-test-first cycle for design, where a test drives new behavior into existence.
    13. When writing coverage tests, the companion rule "the design of a test waits at the hinges" still applies.

### Checker A

    1. kept: "TDD is a design activity." / "Adding test coverage is a separate activity. It prevents regression in existing behavior"
    2. kept: "Adding coverage is a testing or final-inspection process, not TDD."
    3. kept: "When adding coverage, a test passing on arrival is inevitable and correct. Do not treat it as a defect to work around."
    4. kept: "The no-green-on-arrival stance is a design concern. It does not apply to adding coverage." The shorter version defines adding coverage as covering existing behavior, so the original's "behavior that already exists" qualifier is carried.
    5. kept: "Never break, mutate, or otherwise invalidate a working implementation to introduce a test."
    6. kept: "Do not break working code to \"see it go red first.\""
    7. kept: "Never break, mutate, or otherwise invalidate a working implementation to introduce a test" / "leave the implementation untouched". The "Why" line, "deforms shipped implementations to satisfy a misplaced ritual", backs this up as reasoning.
    8. kept: "There is no red to manufacture when covering existing behavior." It is phrased as a statement of fact rather than a prohibition, but it sits beside "Do not break working code to \"see it go red first\"", which requires the same behavior.
    9. kept: "When the behavior already exists and you are adding coverage, write the test and run it."
    10. kept: "Accept the passing coverage test as verification"
    11. kept: "leave the implementation untouched."
    12. kept: "Reserve the failing-test-first cycle for design, where a test drives new behavior into existence."
    13. kept: "the companion rule \"the design of a test waits at the hinges\" — they still apply when writing coverage". It now sits in the Related list instead of the numbered directives.

### Checker B

    1. kept — "TDD is a design activity." / "Adding test coverage is a separate activity. It prevents regression in existing behavior" / "it blurs design tests with regression tests"
    2. kept — "Adding coverage is a testing or final-inspection process, not TDD."
    3. kept — "When adding coverage, a test passing on arrival is inevitable and correct. Do not treat it as a defect to work around."
    4. kept — "The no-green-on-arrival stance is a design concern. It does not apply to adding coverage."
    5. kept — "Never break, mutate, or otherwise invalidate a working implementation to introduce a test."
    6. kept — "Do not break working code to \"see it go red first.\""
    7. kept — "Never break, mutate, or otherwise invalidate a working implementation to introduce a test." together with "It deforms shipped implementations to satisfy a misplaced ritual"
    8. kept — "There is no red to manufacture when covering existing behavior."
    9. kept — "When the behavior already exists and you are adding coverage, write the test and run it."
    10. kept — "Accept the passing coverage test as verification"
    11. kept — "and leave the implementation untouched."
    12. kept — "Reserve the failing-test-first cycle for design, where a test drives new behavior into existence."
    13. kept — "the companion rule \"the design of a test waits at the hinges\" — they still apply when writing coverage"

## the-design-of-a-test-waits-at-the-hinges-including-coverage

### The compressor's answer

    1. The five hinges are actuation, observation, controls, implementation, and naming.
    2. Designing a test is a design act, so the design of a test waits at the hinges.
    3. This holds both when designing behavior (DBE) and when covering existing behavior (testing).
    4. The hinges apply when writing coverage, not only when designing.
    5. When adding coverage for existing behavior, all five hinges are in play.
    6. Wait for the human at each hinge.

    ## Hinges when adding coverage

    1. **Actuation**: confirm the actuation's shape.
    2. **Controls**: decide how to construct the situation the test needs. An example is an inherited-only constant set up through an `include` relationship.
    3. **Observation**: decide what to read about the behavior's effect, and how to read it.
    4. **Naming**: settle the outcome contexts at the close.
    5. **Implementation**: this hinge is in play but degenerate. There is no new code to write and no red to drive.
    6. At the implementation hinge, run the test against the existing implementation and confirm that it passes.
    7. Show the implementation hinge as verified.
    8. Solubility is still judged at the implementation hinge.
    9. If the test reads awkwardly against clean code, fix the test's control, actuation, or observation.
    10. Never change the implementation to resolve that awkwardness.
    11. **Why:** The hinges hand each design decision to the human at its gate. A coverage test has real design decisions, especially in its controls and observations. Coverage differs from design only in that no behavior is designed and no red is driven. The hinges are present in both.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When writing coverage for behavior that already exists, the hinges (actuation, observation, controls, implementation, naming) are in play, not only when designing behavior.
    2. When adding coverage for existing behavior, all five hinges are in play.
    3. At the actuation hinge of a coverage test, confirm the actuation's shape.
    4. At the controls hinge of a coverage test, make the real decision of how to construct the situation the test needs (e.g. an inherited-only constant via an `include` relationship).
    5. At the observation hinge of a coverage test, make the real decision of what to read about the behavior's effect, and how.
    6. At the naming hinge of a coverage test, settle the outcome contexts at the close.
    7. In a coverage test, the implementation hinge is in play but degenerate: write no new code and drive no red.
    8. In a coverage test, the implementation hinge reduces to running the test against the existing implementation and confirming it passes.
    9. In a coverage test, solubility is still judged at the implementation hinge.
    10. If a coverage test reads awkwardly against clean code, the fix goes to the test (its control, actuation, or observation), never to the implementation.
    11. A coverage test gets the same wait for the human at each hinge as a design test does.
    12. Design a coverage test through the hinges as usual: actuation, controls, observation, and naming, with a wait at each for the human.
    13. Show the implementation hinge of a coverage test verified.
    14. An implementation is never broken to introduce a test.

### Checker A

    1. kept: "The hinges apply when writing coverage, not only when designing." / "The five hinges are actuation, observation, controls, implementation, and naming."
    2. kept: "When adding coverage for existing behavior, all five hinges are in play."
    3. kept: "**Actuation**: confirm the actuation's shape."
    4. kept: "**Controls**: decide how to construct the situation the test needs. An example is an inherited-only constant set up through an `include` relationship." (with "A coverage test has real design decisions, especially in its controls")
    5. kept: "**Observation**: decide what to read about the behavior's effect, and how to read it."
    6. kept: "**Naming**: settle the outcome contexts at the close."
    7. kept: "**Implementation**: this hinge is in play but degenerate. There is no new code to write and no red to drive."
    8. kept: "At the implementation hinge, run the test against the existing implementation and confirm that it passes."
    9. kept: "Solubility is still judged at the implementation hinge."
    10. kept: "If the test reads awkwardly against clean code, fix the test's control, actuation, or observation." / "Never change the implementation to resolve that awkwardness."
    11. kept: "Wait for the human at each hinge." with "This holds both when designing behavior (DBE) and when covering existing behavior (testing)."
    12. kept: "The five hinges are actuation, observation, controls, implementation, and naming." / "Wait for the human at each hinge."
    13. kept: "Show the implementation hinge as verified."
    14. less precise: "Never change the implementation to resolve that awkwardness." / "the companion tdd-designs-coverage-prevents-never-break-implementation rule". Missing: the general ban on breaking an implementation to introduce a test is stated only for the awkwardness case; the broader prohibition appears only in the name of a related rule.

### Checker B

    1. kept: "The hinges apply when writing coverage, not only when designing." / "The five hinges are actuation, observation, controls, implementation, and naming."
    2. kept: "When adding coverage for existing behavior, all five hinges are in play."
    3. kept: "**Actuation**: confirm the actuation's shape."
    4. kept: "**Controls**: decide how to construct the situation the test needs. An example is an inherited-only constant set up through an `include` relationship." (with "A coverage test has real design decisions, especially in its controls")
    5. kept: "**Observation**: decide what to read about the behavior's effect, and how to read it." (with "real design decisions, especially in its controls and observations")
    6. kept: "**Naming**: settle the outcome contexts at the close."
    7. kept: "**Implementation**: this hinge is in play but degenerate. There is no new code to write and no red to drive."
    8. kept: "At the implementation hinge, run the test against the existing implementation and confirm that it passes."
    9. kept: "Solubility is still judged at the implementation hinge."
    10. kept: "If the test reads awkwardly against clean code, fix the test's control, actuation, or observation." / "Never change the implementation to resolve that awkwardness."
    11. kept: "Wait for the human at each hinge." / "This holds both when designing behavior (DBE) and when covering existing behavior (testing)."
    12. kept: "When adding coverage for existing behavior, all five hinges are in play." / "Wait for the human at each hinge."
    13. kept: "Show the implementation hinge as verified."
    14. less precise: "Never change the implementation to resolve that awkwardness." / "the companion tdd-designs-coverage-prevents-never-break-implementation rule". Missing: the general ban on breaking an implementation to introduce a test. The shorter version only covers changing it to fix awkwardness, and names the general ban only as a related rule.

### The re-check, after the repairs

    1. kept: "The hinges apply when writing coverage, not only when designing." / "This holds both when designing behavior (DBE) and when covering existing behavior (testing)."
    2. kept: "When adding coverage for existing behavior, all five hinges are in play."
    3. kept: "**Actuation**: confirm the actuation's shape."
    4. kept: "**Controls**: decide how to construct the situation the test needs. An example is an inherited-only constant set up through an `include` relationship." (and "A coverage test has real design decisions, especially in its controls and observations.")
    5. kept: "**Observation**: decide what to read about the behavior's effect, and how to read it."
    6. kept: "**Naming**: settle the outcome contexts at the close."
    7. kept: "**Implementation**: this hinge is in play but degenerate. There is no new code to write and no red to drive."
    8. kept: "At the implementation hinge, run the test against the existing implementation and confirm that it passes."
    9. kept: "Solubility is still judged at the implementation hinge."
    10. kept: "If the test reads awkwardly against clean code, fix the test's control, actuation, or observation." / "Never change the implementation to resolve that awkwardness."
    11. kept: "Wait for the human at each hinge." with "the design of a test waits at the hinges. This holds both when designing behavior (DBE) and when covering existing behavior (testing)."
    12. kept: "Wait for the human at each hinge." with the "Hinges when adding coverage" list giving Actuation, Controls, Observation, Naming in that order.
    13. kept: "Show the implementation hinge as verified."
    14. kept: "Never break an implementation to introduce a test."

## the-implementation-hinge-offers-the-red-green-refactor-cycle

### The compressor's answer

    1. At the implementation hinge, the fourth of the five, put two candidates to the engineer.
    2. The first candidate is **a working implementation**: code that satisfies the test, written directly.
    3. The second candidate is **an implementation that lets the test fail**, followed by the complete **red, green, refactor** cycle.
    4. Both candidates answer the hinge's question: *how does this implementation come about*.
    5. Treat the cycle as a design judgment about this unit, not a procedure applied to every unit.
    6. This hinge is the only place the red decision is made.
    7. Do not offer a red at a separate hinge before the implementation.
    8. Do not ask again, by any other mechanism, an engineer who declined the cycle.

    ## The containment constraint governs the red, unchanged

    1. A deliberate red is permitted only where its cause reaches no other stable test.
    2. No existing, passing test may fail because of the red.
    3. A red that breaks working tests is breakage, even when the cycle was chosen at a gate.
    4. Before writing a deliberate red, know that its failure is local to the new test.
    5. Run the full suite after writing the red.
    6. If a stable test failed, back the red out and reach a passing implementation directly.

    ## The cycle is for the first implementation of a unit

    1. Offer the cycle only for new behavior being designed.
    2. Do not offer the cycle when covering behavior that already exists.
    3. When covering, the implementation hinge is degenerate. See the the-design-of-a-test-waits-at-the-hinges-including-coverage rule.
    4. Never offer the cycle and then refuse it; offer it only where it is available.

    ## Choosing the cycle is not performing choreography

    1. The dbe-as-design-tool rule rejects only the unchosen cycle, performed as ritual.
    2. An engineer selecting the cycle at a gate for this unit has made a design judgment, which that rule permits.

    ## Refactor is part of the cycle

    1. The cycle has three parts: red, green, and refactor.
    2. Red proves the test discriminates.
    3. Green makes the test pass.
    4. Refactor improves the design, with the test holding the behavior still.
    5. Never offer the cycle without refactor.

    ## The second candidate is real

    1. The cycle counts as a real second candidate under the present-every-prompt two-option floor.
    2. Do not present a failing implementation as an option merely to reach the two-option floor.
    3. Where the hinge has a real second implementation, surface that option.
    4. The cycle is not a substitute for searching for another implementation.

    ## How to apply

    1. At the implementation hinge for a unit's first implementation, offer the two candidates through the selection UI.
    2. Where the cycle is chosen, write the red only if its cause reaches no stable test.
    3. Then run the suite, then green, then refactor.
    4. **Why:** whether to drive an implementation through a failing test is a subtle, load-bearing judgment about that unit. Offering it as a candidate lets the engineer compare real alternatives rather than ratify one proposal.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. At the implementation hinge (the fourth of the five hinges), the agent puts two candidates to the engineer: a working implementation (the code that satisfies the test, written directly), and an implementation that lets the test fail followed by the complete red, green, refactor cycle.
    2. The two candidates are offered through the selection UI.
    3. The choice of whether to drive the implementation through a red is made at the implementation hinge and nowhere else.
    4. A red is not offered at a separate hinge before the implementation.
    5. An engineer who declines the cycle at the implementation hinge is not asked again by another mechanism.
    6. A deliberate red is permitted only where its cause reaches no other stable test. No existing, passing test may fail because of it.
    7. Choosing the cycle at a gate does not make a red that breaks working tests acceptable. Such a red is breakage, not a driven test.
    8. Before writing a deliberate red, know that its failure is local to the new test.
    9. Run the full suite after writing a deliberate red.
    10. If a stable test failed after the deliberate red, back the red out and reach a passing implementation directly.
    11. The red/green/refactor cycle is offered only for the first implementation of a unit, meaning new behavior being designed.
    12. Do not offer the red/green/refactor cycle when covering behavior that already exists. Offer the second candidate only where it is actually available, not offer it and then refuse it.
    13. Where the cycle is chosen, carry it out in order: write the red, run the suite, then green, then refactor.
    14. The cycle offered must include refactor. A cycle offered without refactor is not acceptable.
    15. Do not present a failing implementation as an option merely to reach the two-option floor.
    16. Offering the cycle does not excuse searching for a real alternative implementation. Where the hinge has a real second implementation, surface that as the option. The cycle is not a substitute for looking.

### Checker A

    All 16 directives are kept in the shorter version. One small wording note is under directive 16.

    1. kept: "At the implementation hinge, the fourth of the five, put two candidates to the engineer." / "a working implementation: code that satisfies the test, written directly." / "an implementation that lets the test fail, followed by the complete red, green, refactor cycle."
    2. kept: "offer the two candidates through the selection UI"
    3. kept: "This hinge is the only place the red decision is made."
    4. kept: "Do not offer a red at a separate hinge before the implementation."
    5. kept: "Do not ask again, by any other mechanism, an engineer who declined the cycle."
    6. kept: "A deliberate red is permitted only where its cause reaches no other stable test." / "No existing, passing test may fail because of the red."
    7. kept: "A red that breaks working tests is breakage, even when the cycle was chosen at a gate."
    8. kept: "Before writing a deliberate red, know that its failure is local to the new test."
    9. kept: "Run the full suite after writing the red."
    10. kept: "If a stable test failed, back the red out and reach a passing implementation directly."
    11. kept: "Offer the cycle only for new behavior being designed." (under the heading "The cycle is for the first implementation of a unit")
    12. kept: "Do not offer the cycle when covering behavior that already exists." / "Never offer the cycle and then refuse it; offer it only where it is available."
    13. kept: "Where the cycle is chosen, write the red only if its cause reaches no stable test." / "Then run the suite, then green, then refactor."
    14. kept: "Never offer the cycle without refactor."
    15. kept: "Do not present a failing implementation as an option merely to reach the two-option floor."
    16. kept: "Where the hinge has a real second implementation, surface that option." / "The cycle is not a substitute for searching for another implementation." The original says "surface that as the option", which more clearly makes the real alternative the second option. The shorter "surface that option" leaves this slightly softer.

### Checker B

    1. kept: "At the implementation hinge, the fourth of the five, put two candidates to the engineer." / "a working implementation: code that satisfies the test, written directly." / "an implementation that lets the test fail, followed by the complete red, green, refactor cycle."
    2. kept: "offer the two candidates through the selection UI"
    3. kept: "This hinge is the only place the red decision is made."
    4. kept: "Do not offer a red at a separate hinge before the implementation."
    5. kept: "Do not ask again, by any other mechanism, an engineer who declined the cycle."
    6. kept: "A deliberate red is permitted only where its cause reaches no other stable test." / "No existing, passing test may fail because of the red."
    7. kept: "A red that breaks working tests is breakage, even when the cycle was chosen at a gate."
    8. kept: "Before writing a deliberate red, know that its failure is local to the new test."
    9. kept: "Run the full suite after writing the red."
    10. kept: "If a stable test failed, back the red out and reach a passing implementation directly."
    11. kept: "The cycle is for the first implementation of a unit" / "Offer the cycle only for new behavior being designed."
    12. kept: "Do not offer the cycle when covering behavior that already exists." / "Never offer the cycle and then refuse it; offer it only where it is available."
    13. kept: "Where the cycle is chosen, write the red only if its cause reaches no stable test." / "Then run the suite, then green, then refactor."
    14. kept: "the complete red, green, refactor cycle" / "Never offer the cycle without refactor."
    15. kept: "Do not present a failing implementation as an option merely to reach the two-option floor."
    16. kept: "Where the hinge has a real second implementation, surface that option." / "The cycle is not a substitute for searching for another implementation."

## what-each-hinge-displays

### The compressor's answer

    1. Each hinge shows the human a specific amount of the test on screen.
    2. The hinge-cycle rule owns the sequence of hinges and the acceptance mechanism. This rule owns what is displayed at each hinge.
    3. Render each hinge per this table:

    | Hinge | Displays |
    |---|---|
    | 1 — **actuation** | the actuation, inside its nested folder-mirroring `context` blocks |
    | 2 — **observation** | the actuation + the observation — no contexts |
    | 3 — **controls** | the controls + the actuation + the observation — the full test body, no contexts |
    | 4 — **implementation** | at the gate, the candidates. Once one is accepted, **the implementation itself**, then the feature's test output |
    | 5 — **naming** | the candidate names, and the test whose outcome they name |

    ## The actuation is the anchor at every downstream hinge

    1. Show the actuation at hinges 2 and 3, because observations and controls have no meaning apart from it.
    2. The actuation shown at hinges 2 and 3 is context. It is not re-decided there.

    ## The contexts are shown once, where they are decided, and elided after

    1. Hinge 1 establishes the outcome's structural placement: which class or feature contexts it nests under, mirroring the test's folder path.
    2. Show the full `context` nesting at hinge 1, so the human judges where the outcome lives before anything else is built.
    3. Do not repeat the contexts at the observation and controls hinges.
    4. The full nesting returns when the turn-one test file is assembled and shown, after the three test hinges.

    ## The implementation is shown before the loop moves on from its hinge

    1. Hinge 4 is where solubility is judged. An awkward implementation signals that the actuation is wrong.
    2. Do not show the run alone at hinge 4. Showing only the run withholds the code the solubility judgment is made on.
    3. Once a candidate is accepted, show the implementation first, ahead of the test and the feature's output.
    4. Show the test and the feature's output with the implementation, per the show-feature-test-output-after-implementation-hinge rule.
    5. Do not advance to naming before the implementation is on screen.

    ## How to apply

    1. At hinge 1, show the actuation within its full `context` nesting.
    2. At hinge 2, show the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block.
    3. At hinge 3, show the control declarations, then the actuation, then the observation. This is the complete test body, with the `context` blocks omitted.
    4. Everything shown from an earlier hinge is context, not an invitation to re-decide it.
    5. **Why:** what is on screen decides what can be deliberated at each hinge. Too little forces judging things meaningless in isolation, so the actuation anchors. Too much buries the hinge's concern, so contexts are shown once.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. At hinge 1 (actuation), display the actuation inside its nested, folder-mirroring `context` blocks, so that its structural placement (the class/feature contexts it nests under, mirroring the test's folder path) is visible.
    2. At hinge 2 (observation), display the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block, with no contexts.
    3. At hinge 3 (controls), display the control declarations, then the actuation, then the observation (the complete test body), with the `context` blocks omitted.
    4. At hinge 4 (implementation), display the candidates at the gate.
    5. At hinge 4, once a candidate is accepted, show the implementation itself ahead of the test and the feature's test output.
    6. At hinge 5 (naming), display the candidate names and the test whose outcome they name.
    7. The actuation is the anchor at every downstream hinge: it is shown at each one for context.
    8. The contexts are shown once, at the actuation hinge where they are decided, and left out at every hinge after it.
    9. The full `context` nesting is shown again when the turn-one test file is assembled and shown after the three test hinges.
    10. The implementation is shown before the loop moves on from the implementation hinge.
    11. At the implementation hinge, do not show only the run, because that would ask the engineer for a solubility verdict on code they have not seen.
    12. Do not advance to the naming hinge before the implementation is on screen.
    13. Everything shown from an earlier hinge is context, not an invitation to re-decide it.

### Checker A

    1. kept — "1 — **actuation** | the actuation, inside its nested folder-mirroring `context` blocks"; "Hinge 1 establishes the outcome's structural placement: which class or feature contexts it nests under, mirroring the test's folder path."; "Show the full `context` nesting at hinge 1"
    2. kept — "At hinge 2, show the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block."; "2 — **observation** | the actuation + the observation — no contexts"
    3. kept — "At hinge 3, show the control declarations, then the actuation, then the observation. This is the complete test body, with the `context` blocks omitted."
    4. kept — "4 — **implementation** | at the gate, the candidates."
    5. kept — "Once a candidate is accepted, show the implementation first, ahead of the test and the feature's output."; "Once one is accepted, **the implementation itself**, then the feature's test output"
    6. kept — "5 — **naming** | the candidate names, and the test whose outcome they name"
    7. less precise — "The actuation is the anchor at every downstream hinge"; "Show the actuation at hinges 2 and 3" — the instruction names only hinges 2 and 3. Hinges 4 and 5 are covered only by implication, through "the test" they display.
    8. kept — "The contexts are shown once, where they are decided, and elided after"; "Do not repeat the contexts at the observation and controls hinges." — the heading carries "every hinge after". The body names only hinges 2 and 3.
    9. kept — "The full nesting returns when the turn-one test file is assembled and shown, after the three test hinges."
    10. kept — "The implementation is shown before the loop moves on from its hinge"
    11. kept — "Do not show the run alone at hinge 4. Showing only the run withholds the code the solubility judgment is made on."
    12. kept — "Do not advance to naming before the implementation is on screen."
    13. kept — "Everything shown from an earlier hinge is context, not an invitation to re-decide it."

### Checker B

    1. kept: "the actuation, inside its nested folder-mirroring `context` blocks"; "Hinge 1 establishes the outcome's structural placement: which class or feature contexts it nests under, mirroring the test's folder path"; "Show the full `context` nesting at hinge 1"
    2. kept: "At hinge 2, show the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block"; "the actuation + the observation — no contexts"
    3. kept: "At hinge 3, show the control declarations, then the actuation, then the observation. This is the complete test body, with the `context` blocks omitted."
    4. kept: "at the gate, the candidates"
    5. kept: "Once a candidate is accepted, show the implementation first, ahead of the test and the feature's output"; "**the implementation itself**, then the feature's test output"
    6. kept: "the candidate names, and the test whose outcome they name"
    7. less precise: "The actuation is the anchor at every downstream hinge"; "Show the actuation at hinges 2 and 3". Missing: the heading says every downstream hinge, but the directive only names hinges 2 and 3. Showing it at hinges 4 and 5 is at most implied through "the test".
    8. less precise: "The contexts are shown once, where they are decided, and elided after"; "Do not repeat the contexts at the observation and controls hinges". Missing: the explicit ban covers only hinges 2 and 3. Leaving the contexts out at hinges 4 and 5 rests on the heading alone.
    9. kept: "The full nesting returns when the turn-one test file is assembled and shown, after the three test hinges."
    10. kept: "The implementation is shown before the loop moves on from its hinge"
    11. kept: "Do not show the run alone at hinge 4. Showing only the run withholds the code the solubility judgment is made on."
    12. kept: "Do not advance to naming before the implementation is on screen."
    13. kept: "Everything shown from an earlier hinge is context, not an invitation to re-decide it."

### The re-check, after the repairs

    1. kept — "1 — **actuation** | the actuation, inside its nested folder-mirroring `context` blocks"; "Hinge 1 establishes the outcome's structural placement: which class or feature contexts it nests under, mirroring the test's folder path"
    2. kept — "At hinge 2, show the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block"; "the actuation + the observation — no contexts"
    3. kept — "At hinge 3, show the control declarations, then the actuation, then the observation. This is the complete test body, with the `context` blocks omitted."
    4. kept — "at the gate, the candidates"
    5. kept — "Once a candidate is accepted, show the implementation first, ahead of the test and the feature's output"; "**the implementation itself**, then the feature's test output"
    6. kept — "the candidate names, and the test whose outcome they name"
    7. kept — "Show the actuation at every hinge after the first, because what each one decides has no meaning apart from it."; "The actuation shown at hinges 2 and 3 is context."
    8. kept — "Show the full `context` nesting at hinge 1"; "Do not repeat the contexts at the hinges after the first."
    9. kept — "The full nesting returns when the turn-one test file is assembled and shown, after the three test hinges."
    10. kept — "The implementation is shown before the loop moves on from its hinge"
    11. kept — "Do not show the run alone at hinge 4. Showing only the run withholds the code the solubility judgment is made on."
    12. kept — "Do not advance to naming before the implementation is on screen."
    13. kept — "Everything shown from an earlier hinge is context, not an invitation to re-decide it."

## the-next-version-is-chosen-by-the-engineer

### The compressor's answer

    1. At a release, the agent does not select the next version.
    2. The agent presents the candidates through the **AskUserQuestion** selection UI.
    3. Present one option per segment that could be increased.
    4. Each option shows the version that would result.
    5. The engineer chooses.
    6. For a package at `2.2.3.1`, the options are:

    ```
    Patch  → 2.2.3.2   behavior corrected, interface unchanged
    Minor  → 2.2.4.0   capability added, existing use unaffected
    Major  → 2.3.0.0   existing use may not survive
    ```

    7. At a release, read the current version first.
    8. Offer patch, minor, and major as the options.
    9. The generation is not among the candidates. It is not a release-time decision. See the version-scheme rule.
    10. Each option states the compatibility claim it makes, not only the number.
    11. The resulting version is shown too, since it is what will be written and committed.
    12. Offer candidates rather than asking the engineer to type a version outright.
    13. Do not propose a version and ask for confirmation. The decision is put at a gate.
    14. **Why:** Which segment increases is a claim about other people's code, not derivable from the diff. A published version cannot be taken back, only superseded.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. At a release, the agent must not select the next version itself.
    2. At a release, the agent must present the next-version candidates through the AskUserQuestion selection UI.
    3. The candidates must have one option per segment that could be increased: patch, minor, and major.
    4. Each candidate option must show the version that would result.
    5. The engineer must choose the next version.
    6. The generation must not be among the next-version candidates, because it is not a release-time decision.
    7. Each candidate must be presented with the claim it makes about compatibility, not only the number (for example, "Patch: behavior corrected, interface unchanged"; "Minor: capability added, existing use unaffected"; "Major: existing use may not survive").
    8. The next version must be put to the engineer at a gate, not proposed by the agent and then confirmed.
    9. The agent must offer the candidates rather than ask the engineer for a version outright.
    10. At a release, the agent must read the current version before presenting the candidates.

### Checker A

    All ten directives are carried by the shorter version: 10 kept, 0 less precise, 0 lost.

    1. kept: "At a release, the agent does not select the next version."
    2. kept: "The agent presents the candidates through the **AskUserQuestion** selection UI." The words "at a release" are not repeated here, but line 1 sets that scope.
    3. kept: "Present one option per segment that could be increased." and "Offer patch, minor, and major as the options."
    4. kept: "Each option shows the version that would result." The point is repeated in "The resulting version is shown too, since it is what will be written and committed."
    5. kept: "The engineer chooses."
    6. kept: "The generation is not among the candidates. It is not a release-time decision."
    7. kept: "Each option states the compatibility claim it makes, not only the number." The example block gives the claims: "behavior corrected, interface unchanged", "capability added, existing use unaffected" and "existing use may not survive".
    8. kept: "Do not propose a version and ask for confirmation. The decision is put at a gate."
    9. kept: "Offer candidates rather than asking the engineer to type a version outright." The shorter version says "type a version" where the directive says "ask for a version". That is slightly narrower wording, but it requires the same behavior.
    10. kept: "At a release, read the current version first."

### Checker B

    1. kept — "At a release, the agent does not select the next version."
    2. kept — "The agent presents the candidates through the **AskUserQuestion** selection UI."
    3. kept — "Present one option per segment that could be increased." / "Offer patch, minor, and major as the options."
    4. kept — "Each option shows the version that would result." / "The resulting version is shown too, since it is what will be written and committed."
    5. kept — "The engineer chooses."
    6. kept — "The generation is not among the candidates. It is not a release-time decision."
    7. kept — "Each option states the compatibility claim it makes, not only the number." plus the example block ("Patch → 2.2.3.2 behavior corrected, interface unchanged" and so on)
    8. kept — "Do not propose a version and ask for confirmation. The decision is put at a gate."
    9. less precise — "Offer candidates rather than asking the engineer to type a version outright." Missing: "type" narrows the ban to typing, where the original bans asking for a version outright in any form.
    10. kept — "At a release, read the current version first."

### The re-check, after the repairs

    1. kept — "At a release, the agent does not select the next version."
    2. kept — "The agent presents the candidates through the **AskUserQuestion** selection UI." (The words "at a release" are not repeated on this line, but lines 1 and 7 set that context.)
    3. kept — "Present one option per segment that could be increased." / "Offer patch, minor, and major as the options."
    4. kept — "Each option shows the version that would result." / "The resulting version is shown too, since it is what will be written and committed."
    5. kept — "The engineer chooses."
    6. kept — "The generation is not among the candidates. It is not a release-time decision."
    7. kept — "Each option states the compatibility claim it makes, not only the number." The example block carries the three claims ("behavior corrected, interface unchanged", "capability added, existing use unaffected", "existing use may not survive").
    8. kept — "Do not propose a version and ask for confirmation. The decision is put at a gate."
    9. kept — "Offer candidates rather than asking the engineer for a version outright."
    10. kept — "At a release, read the current version first."

## version-scheme

### The compressor's answer

    1. A version takes one of two forms:

    ```
    <major>.<minor>.<patch>              2.3.1
    <generation>.<major>.<minor>.<patch> 2.2.3.1
    ```

    2. The three trailing segments are semantic versioning.
    3. The leading segment, when present, is the product generation.
    4. Choose the semver segment to increase by what a user of the package must do.
    5. Do not choose it by the change's size, duration, or how much source it touched.
    6. Increase patch when behavior is corrected and the interface is unchanged. The user upgrades without reading or touching code.
    7. Increase minor when a capability is added and everything using the previous version still works.
    8. With a minor, the user changes no code and reads only to use the new capability.
    9. Increase major when something a user may rely on is gone or different. The user reads first and may change code.
    10. A rewrite that leaves every interface intact is a patch.
    11. A single removed method is a major.
    12. The generation is a declaration that this is the same product, not a compatibility claim.
    13. The generation is increased only when an entirely new product line is declared.
    14. Declaring a new product line is a product management decision, not a technological one.
    15. Never increase the generation as part of a release.
    16. A release after a declared new product line carries the new generation because the line was already declared.
    17. A project uses one form throughout its life.
    18. A project that carries a generation carries it in every version.
    19. A project without a generation never acquires one at a release.
    20. **Why:** semver answers the upgrade-compatibility question and is kept unchanged. The generation states a product change that no analysis of a change can produce. Keeping it separate stops it reading as a compatibility break.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A version takes one of two forms: `<major>.<minor>.<patch>`, or `<generation>.<major>.<minor>.<patch>`.
    2. The three trailing segments of a version are semantic versioning, and semver is kept exactly as it is, not re-invented.
    3. The leading segment, when there is one, is the product generation, and it is a declaration, not a compatibility claim.
    4. Increase the patch segment when behavior is corrected and the interface is unchanged, so a user upgrades without reading anything and without touching their code.
    5. Increase the minor segment when a capability is added and everything that used the previous version still works, so a user upgrades without changing their code and reads only if they want the new capability.
    6. Increase the major segment when something a user may be relying on is gone or different, so a user reads before upgrading and may have to change their code.
    7. Choose which semver segment to increase by what the change does to the people using it, that is, by what a user of the package must do: nothing, nothing but read, or change their code.
    8. Do not choose the segment to increase by how large the change was, how long it took, or how much of the source it touched.
    9. A rewrite that leaves every interface intact is a patch.
    10. A single removed method is a major.
    11. The generation segment is decided by whoever decides what the product line is, as a product management decision rather than a technological one.
    12. Increase the generation segment only when an entirely new product line has been declared.
    13. Never increase the generation as part of a release.
    14. Declaring a new product line is a separate act from a release, done for its own reasons on its own occasion.
    15. A release that follows the declaration of a new product line carries the new generation because the line was already declared, not as part of deciding the release.
    16. A project uses one version form throughout its life; the two forms are not chosen per release.
    17. A project that carries a generation carries it in every version.
    18. A project that does not carry a generation never acquires one at a release.
    19. Do not mix the two version forms within one project.

### Checker A

    1. kept — "A version takes one of two forms: <major>.<minor>.<patch> ... <generation>.<major>.<minor>.<patch>"
    2. kept — "The three trailing segments are semantic versioning." / "semver answers the upgrade-compatibility question and is kept unchanged"
    3. less precise — "The leading segment, when present, is the product generation." / "The generation is a declaration that this is the same product, not a compatibility claim." Missing: the original says only "a declaration"; the shorter version adds "that this is the same product", which the original does not say and which sits oddly against a generation marking a new product line.
    4. kept — "Increase patch when behavior is corrected and the interface is unchanged. The user upgrades without reading or touching code."
    5. kept — "Increase minor when a capability is added and everything using the previous version still works." / "With a minor, the user changes no code and reads only to use the new capability."
    6. kept — "Increase major when something a user may rely on is gone or different. The user reads first and may change code."
    7. kept — "Choose the semver segment to increase by what a user of the package must do." (the three outcomes, nothing, read, or change code, are carried by lines 6, 8 and 9)
    8. kept — "Do not choose it by the change's size, duration, or how much source it touched."
    9. kept — "A rewrite that leaves every interface intact is a patch."
    10. kept — "A single removed method is a major."
    11. less precise — "Declaring a new product line is a product management decision, not a technological one." Missing: who decides, "whoever decides what the product line is".
    12. kept — "The generation is increased only when an entirely new product line is declared."
    13. kept — "Never increase the generation as part of a release."
    14. less precise — "Never increase the generation as part of a release." / "A release after a declared new product line carries the new generation because the line was already declared." Missing: the explicit statement that declaring is a separate act, "done for its own reasons on its own occasion".
    15. kept — "A release after a declared new product line carries the new generation because the line was already declared." (the "not as part of deciding the release" part is carried by "Never increase the generation as part of a release")
    16. kept — "A project uses one form throughout its life." (this makes "not chosen per release" follow)
    17. kept — "A project that carries a generation carries it in every version."
    18. kept — "A project without a generation never acquires one at a release."
    19. kept — "A project uses one form throughout its life." (one form for the project's whole life rules out mixing)

### Checker B

    1 — kept — "A version takes one of two forms: <major>.<minor>.<patch> … <generation>.<major>.<minor>.<patch>"
    2 — kept — "The three trailing segments are semantic versioning." / "semver answers the upgrade-compatibility question and is kept unchanged"
    3 — less precise — "The leading segment, when present, is the product generation." / "The generation is a declaration that this is the same product, not a compatibility claim." — the added words "that this is the same product" make it unclear what is being declared, since the generation changes when a new product line is declared
    4 — kept — "Increase patch when behavior is corrected and the interface is unchanged. The user upgrades without reading or touching code."
    5 — kept — "Increase minor when a capability is added and everything using the previous version still works." / "With a minor, the user changes no code and reads only to use the new capability."
    6 — kept — "Increase major when something a user may rely on is gone or different. The user reads first and may change code."
    7 — kept — "Choose the semver segment to increase by what a user of the package must do." (lines 6, 8 and 9 give the nothing / read only / change code cases)
    8 — kept — "Do not choose it by the change's size, duration, or how much source it touched."
    9 — kept — "A rewrite that leaves every interface intact is a patch."
    10 — kept — "A single removed method is a major."
    11 — less precise — "Declaring a new product line is a product management decision, not a technological one." — it no longer says who decides: whoever decides what the product line is
    12 — kept — "The generation is increased only when an entirely new product line is declared."
    13 — kept — "Never increase the generation as part of a release."
    14 — less precise — "Never increase the generation as part of a release." / "because the line was already declared" — this only implies the separation; it does not say that declaring is a separate act, done for its own reasons on its own occasion
    15 — kept — "A release after a declared new product line carries the new generation because the line was already declared." (together with "Never increase the generation as part of a release")
    16 — kept — "A project uses one form throughout its life."
    17 — kept — "A project that carries a generation carries it in every version."
    18 — kept — "A project without a generation never acquires one at a release."
    19 — kept — "A project uses one form throughout its life."

### The re-check, after the repairs

    All 19 directives are carried by the shorter version: 19 kept, 0 less precise, 0 lost.

    1. kept: "A version takes one of two forms: <major>.<minor>.<patch> ... <generation>.<major>.<minor>.<patch>"
    2. kept: "The three trailing segments are semantic versioning." and "semver answers the upgrade-compatibility question and is kept unchanged"
    3. kept: "The leading segment, when present, is the product generation." and "The generation is a declaration, not a compatibility claim."
    4. kept: "Increase patch when behavior is corrected and the interface is unchanged. The user upgrades without reading or touching code."
    5. kept: "Increase minor when a capability is added and everything using the previous version still works." and "With a minor, the user changes no code and reads only to use the new capability."
    6. kept: "Increase major when something a user may rely on is gone or different. The user reads first and may change code."
    7. kept: "Choose the semver segment to increase by what a user of the package must do." The original's three outcomes (nothing, nothing but read, change their code) are not listed in this line, but the patch, minor and major lines (6, 8, 9) state each one.
    8. kept: "Do not choose it by the change's size, duration, or how much source it touched."
    9. kept: "A rewrite that leaves every interface intact is a patch."
    10. kept: "A single removed method is a major."
    11. kept: "Declaring a new product line is a product management decision, not a technological one. Whoever decides what the product line is decides it."
    12. kept: "The generation is increased only when an entirely new product line is declared."
    13. kept: "Never increase the generation as part of a release."
    14. kept: "Declaring a new product line is a separate act, done for its own reasons on its own occasion."
    15. kept: "A release after a declared new product line carries the new generation because the line was already declared." The clause "not as part of deciding the release" is not repeated, but "Never increase the generation as part of a release" requires it.
    16. kept: "A project uses one form throughout its life." That requires that forms are not chosen per release.
    17. kept: "A project that carries a generation carries it in every version."
    18. kept: "A project without a generation never acquires one at a release."
    19. kept: "A project uses one form throughout its life." That requires not mixing the two forms within one project, though there is no separate statement of it.

---

Authored by Scott Bellware on Sat Oct 24 2026 at 2:39:24 AM PT
