# Rule reduction — the `git` batch, its prompts and answers

The appendix to the experiment record's `git` batch. Each rule's compression, directive list, and two checkers' answers are given word for word.

## The compression guidance

    You are compressing one rule of a rule system that governs an AI coding agent. Write a shorter version of the rule's body that has exactly the same effect: everything the source requires, forbids, or permits must still be required, forbidden, or permitted.

    - Keep every directive, including small ones, qualifiers, examples that fix a form, and anything stated only in a section heading.
    - Write sentences of 25 words or fewer, averaging about 15. Do not pack several directives into one sentence with dashes or semicolons.
    - Keep quoted interface text, commands, formats, and examples word for word.
    - Drop restatement, history, and argument. Keep a reason only where it constrains what is done, and end with a short **Why:** line.
    - Lead each paragraph or list item with its claim in bold, as the source does.
    - If the source contradicts itself, keep both statements as the source has them, and report the contradiction after the text.
    - Write the body only: no title, no attribute lines, no Related list, no footer.

    Answer with the compressed body, then a line `CONTRADICTIONS:` followed by any contradiction you found in the source, or `none`.

## a-sha-names-the-work-rather-than-the-commit

### The compressor's answer

    **A commit SHA from the engineer asks about the work it carries.** That work is the item, the implementation, the rule, or the code change. It does not ask about the commit's mechanics. The mechanics are its message, its file list, its diff statistics, and the log entry that came with it.

    **Answer from what the commit added or changed.** If it carries an item, an implementation record, or a rule, read that file. Answer from its content. If it changes code, answer from what the code now does. Open the files it added or changed rather than reporting their names.

    **Give the mechanics when the question is about them.** *Was it pushed*, *what did it touch*, *is it on master*, *what does its message say* — answer each directly.

    **Give the mechanics when they are the substance.** A merge, a revert, a rename, a force-push, and a rebase have the operation as their content. There is nothing behind them to read.

    **Ask only where it is genuinely unclear.** A bare SHA with no verb is the ordinary case. Give the substance for it.

    **Why:** reporting the commit's bookkeeping is correct but about the wrong thing. It costs the engineer a second turn to ask again.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the engineer names a commit by its SHA, treat it as a question about the substance the commit carries (the item, the implementation, the rule, or the change to the code), not about the commit's own mechanics (its message, its file list, its diff statistics, or the log entry that travelled with it).
    2. Answer a SHA reference from what the commit added or changed.
    3. Where the commit carries an item, an implementation record, or a rule, read that file and answer from its content.
    4. Where the commit changes code, answer from what the code now does.
    5. Open the files the commit added or changed rather than reporting their names.
    6. When the question is actually about the commit's mechanics (for example: was it pushed, what did it touch, is it on master, what does its message say), answer it directly with the mechanics.
    7. When the commit's whole content is a git operation (a merge, a revert, a rename, a force-push, or a rebase), give the mechanics as the answer, since there is nothing behind them to read.
    8. Where it is genuinely unclear whether the substance or the mechanics is wanted, and only where the sentence genuinely does not say, ask which is wanted.
    9. When a SHA appears alone in a sentence with no verb, give the substance; this is the ordinary case and does not count as unclear.

### Checker A

    1. kept — "A commit SHA from the engineer asks about the work it carries." / "That work is the item, the implementation, the rule, or the code change. It does not ask about the commit's mechanics. The mechanics are its message, its file list, its diff statistics, and the log entry that came with it."
    2. kept — "Answer from what the commit added or changed."
    3. kept — "If it carries an item, an implementation record, or a rule, read that file. Answer from its content."
    4. kept — "If it changes code, answer from what the code now does."
    5. kept — "Open the files it added or changed rather than reporting their names."
    6. kept — "Give the mechanics when the question is about them. *Was it pushed*, *what did it touch*, *is it on master*, *what does its message say* — answer each directly."
    7. kept — "Give the mechanics when they are the substance. A merge, a revert, a rename, a force-push, and a rebase have the operation as their content. There is nothing behind them to read."
    8. less precise — "Ask only where it is genuinely unclear." Missing: it limits when to ask but does not plainly say to ask in that case, it does not say the question is whether substance or mechanics is wanted, and it drops the test "only where the sentence genuinely does not say."
    9. kept — "A bare SHA with no verb is the ordinary case. Give the substance for it." Because this sits in the "Ask only where it is genuinely unclear" paragraph and calls it "the ordinary case", it means the bare SHA does not count as unclear.

### Checker B

    1. kept: "A commit SHA from the engineer asks about the work it carries. That work is the item, the implementation, the rule, or the code change. It does not ask about the commit's mechanics. The mechanics are its message, its file list, its diff statistics, and the log entry that came with it."
    2. kept: "Answer from what the commit added or changed."
    3. kept: "If it carries an item, an implementation record, or a rule, read that file. Answer from its content."
    4. kept: "If it changes code, answer from what the code now does."
    5. kept: "Open the files it added or changed rather than reporting their names."
    6. kept: "Give the mechanics when the question is about them. *Was it pushed*, *what did it touch*, *is it on master*, *what does its message say* — answer each directly."
    7. kept: "Give the mechanics when they are the substance. A merge, a revert, a rename, a force-push, and a rebase have the operation as their content. There is nothing behind them to read."
    8. less precise: "Ask only where it is genuinely unclear." Missing: it limits when asking is allowed but does not say to ask in the unclear case, and it does not say what to ask (substance or mechanics). It also drops the condition "only where the sentence genuinely does not say".
    9. kept: "A bare SHA with no verb is the ordinary case. Give the substance for it." The original says this case "does not count as unclear". The shorter version calls it "the ordinary case" right after the line about asking, which requires the same behavior.

## announce-a-branch-switch-in-a-bordered-block

### The compressor's answer

    When the agent switches branches, it prints this block. The block has a border of `=` characters above and below:

    ```
    ========================================
    BRANCH SWITCHED

      from    master
      to      experiment/ste-spec
      reason  the vocabulary comparison is
              recorded on this branch
    ========================================
    ```

    **Print it on every switch.** That includes a switch the engineer asked for. It includes a switch made to reach a file. It includes a switch back to the branch the session started on.

    **Print it before reporting anything else about the work.**

    ## The three fields

    1. **from** — the branch the working tree was on.
    2. **to** — the branch the working tree is on now.
    3. **reason** — why the agent switched, in one line or two.

    **Fill all three fields.** The reason states what the switch was for, not what the work is.

    **The border is the requirement, not decoration.** Any unmissable form satisfies this rule. `=` characters above and below are the settled form.

    ## What this does not cover

    - **Creating a branch** is a switch when the working tree moves to it. `git switch -c` prints the block, with `from` naming the base.
    - **A worktree** adds a working directory rather than moving this one. No block is printed. The implementation-lifecycle rule governs that case.
    - **A merge, a commit, or a push** does not move the working tree. No block is printed.

    **Why:** a switch changes what every path means, and later reports never show where the work landed. A block that cannot be scrolled past prevents silent switches.

    CONTRADICTIONS: The source opens by stating the block's border is made of `=` characters, and shows that form as the required block. Later it says "Any unmissable form satisfies this rule" and calls `=` only "the settled one". Whether the `=` border is mandatory or one acceptable form is left unresolved. The compressed text keeps both statements. A smaller inconsistency: the source's "How to apply" line lists "a worktree, a merge, or a commit" as no-block cases and leaves out push. "What this does not cover" includes push. The compressed text follows the fuller list.

### The directives, as the listing agent gave them

    1. When the agent switches branches, it prints a bordered block announcing the switch.
    2. The block has a border above and below, made of `=` characters.
    3. The block opens with the heading `BRANCH SWITCHED`.
    4. The agent prints the block on every branch switch.
    5. The agent prints the block when the engineer asked for the switch.
    6. The agent prints the block when it switched to reach a file.
    7. The agent prints the block when the switch returns to a branch the session started on.
    8. The block's `from` field names the branch the working tree was on.
    9. The block's `to` field names the branch the working tree is on now.
    10. The block's `reason` field states why the agent switched.
    11. The `reason` field is one line, or two.
    12. The border is a requirement, not decoration: the announcement must be in a form that does not read as another line of a report and cannot be scrolled past.
    13. Any unmissable form of the announcement satisfies the rule, and `=` characters above and below are the settled form.
    14. Creating a branch counts as a branch switch when the working tree moves to it, so `git switch -c` prints the block.
    15. When a branch is created and switched to, the block's `from` field names the base branch.
    16. Adding a worktree is not a branch switch, so no block is printed for it.
    17. A merge, a commit, or a push does not move the working tree, so no block is printed for it.
    18. The agent prints the block before reporting anything else about the work.
    19. The agent fills all three fields of the block: `from`, `to`, and `reason`.
    20. The `reason` field is kept to what the switch was for, not what the work is.

### Checker A

    1. kept — "When the agent switches branches, it prints this block."
    2. kept — "The block has a border of `=` characters above and below"
    3. kept — "BRANCH SWITCHED" (the first line of the example block that "it prints this block" prescribes)
    4. kept — "Print it on every switch."
    5. kept — "That includes a switch the engineer asked for."
    6. kept — "It includes a switch made to reach a file."
    7. kept — "It includes a switch back to the branch the session started on."
    8. kept — "**from** — the branch the working tree was on."
    9. kept — "**to** — the branch the working tree is on now."
    10. kept — "**reason** — why the agent switched"
    11. kept — "in one line or two."
    12. less precise — "The border is the requirement, not decoration. Any unmissable form satisfies this rule." / "A block that cannot be scrolled past prevents silent switches." Missing: the requirement that the announcement not read as another line of a report.
    13. kept — "Any unmissable form satisfies this rule. `=` characters above and below are the settled form."
    14. kept — "**Creating a branch** is a switch when the working tree moves to it. `git switch -c` prints the block"
    15. kept — "with `from` naming the base."
    16. kept — "**A worktree** adds a working directory rather than moving this one. No block is printed."
    17. kept — "**A merge, a commit, or a push** does not move the working tree. No block is printed."
    18. kept — "Print it before reporting anything else about the work."
    19. kept — "Fill all three fields."
    20. kept — "The reason states what the switch was for, not what the work is."

### Checker B

    1. kept — "When the agent switches branches, it prints this block."
    2. kept — "The block has a border of `=` characters above and below"
    3. kept — the example block opens with "BRANCH SWITCHED" right after the border, and the text says "it prints this block"
    4. kept — "Print it on every switch."
    5. kept — "That includes a switch the engineer asked for."
    6. kept — "It includes a switch made to reach a file."
    7. kept — "It includes a switch back to the branch the session started on."
    8. kept — "**from** — the branch the working tree was on."
    9. kept — "**to** — the branch the working tree is on now."
    10. kept — "**reason** — why the agent switched"
    11. kept — "in one line or two."
    12. less precise — "The border is the requirement, not decoration. Any unmissable form satisfies this rule." / "A block that cannot be scrolled past prevents silent switches." — missing: the form must not read as another line of a report. Also, "cannot be scrolled past" appears only in the Why paragraph, not as a requirement.
    13. kept — "Any unmissable form satisfies this rule. `=` characters above and below are the settled form."
    14. kept — "**Creating a branch** is a switch when the working tree moves to it. `git switch -c` prints the block"
    15. kept — "with `from` naming the base."
    16. kept — "**A worktree** adds a working directory rather than moving this one. No block is printed."
    17. kept — "**A merge, a commit, or a push** does not move the working tree. No block is printed."
    18. kept — "Print it before reporting anything else about the work."
    19. kept — "Fill all three fields."
    20. kept — "The reason states what the switch was for, not what the work is."

## commit-message-widths

### The compressor's answer

    - **The subject line is at most 50 characters.**
    - **The body is wrapped at 72 characters.**

    **The two numbers are separate budgets, not one convention.**

    - **50 is a display budget.** `git log --oneline` and hosted commit lists truncate near there.
    - **72 is a wrapping budget.** `git log` indents the body four spaces, so 72 fits an 80-column terminal.

    **Wrap the body in the message itself.** Do not leave wrapping to the terminal.

    ## When the subject will not fit

    **Split the commit, or move the detail to the body.** Try them in that order.

    **A subject that will not fit usually means the commit does too much.** Treat that as the main reason to split.

    **Do not abbreviate a subject into something a reader must decode.** Use plain words, not contractions. The `language` package's rules hold in commit messages too.

    **The body has no limit on what it says.** Its only constraint is line width.

    **A journal entry is the one record where neither remedy is available, and it truncates instead.** An entry is one commit, so there is nothing to split. Its subject is the writer's words, which the `journal` package bars the agent from shortening. Cut its commit subject at the 50th character with an ellipsis. See that package's journal-convention.

    **Truncation is not a general escape.** It is available only where the subject is not the agent's to rewrite. Everywhere else, a subject that will not fit is a commit to split.

    ## What still governs the subject

    **The subject-first-commit-messages rule is unchanged.** The subject is the software, never the engineer. It is a fact stated in passive voice and indicative mood. The commit-says-task-is-done-not-mark-done rule is unchanged too.

    **Those rules push length up, and that is accepted.** Write the subject within the budget. Do not drop the subject and lead with a verb to save space.

    **A prefix spends the budget.** The journal's commit prefix is `Journal:`, which costs 9 characters. It carries no date. See the `journal` package's journal-convention.

    ## The history is not rewritten

    **Every commit written before 2026-08-18 stands as written.** Do not revise a commit message already written to suit a later convention.

    **Why:** git's tooling is built around these numbers, so messages written to them read as written everywhere. The subject limit also exposes an oversized commit while it is being written, when splitting is cheapest.

    CONTRADICTIONS: Possible tension, not a strict contradiction. The source calls a journal entry "the one record where neither remedy is available", then states truncation more generally as "available where the subject is not the agent's to rewrite". That wording could cover records other than journal entries. I kept both statements as the source gives them.

### The directives, as the listing agent gave them

    1. A commit message's subject line is at most 50 characters.
    2. A commit message's body is wrapped at 72 characters.
    3. Where a commit's subject will not fit in 50 characters, split the commit first, and only failing that, move the detail to the body.
    4. Do not abbreviate a commit subject into something a reader has to decode, such as shorthand or contractions; use plain words.
    5. The `language` package's rules apply in a commit message as they do everywhere.
    6. Where the subject needs more than 50 characters can hold, the body may say it, since the body is constrained only in how wide its lines run, not in what it says.
    7. A journal entry's commit subject is not split or reworded; it is cut at the 50th character with an ellipsis that marks the cut.
    8. The agent must not shorten a journal entry's subject, because it is the writer's words.
    9. Truncating a commit subject is allowed only where the subject is not the agent's to rewrite; anywhere else, a subject that will not fit means the commit is to be split.
    10. The subject-first-commit-messages rule still governs the commit subject: the subject is the software and never the engineer, stated as a fact in passive voice and indicative mood.
    11. The commit-says-task-is-done-not-mark-done rule still governs the commit subject.
    12. The 50-character limit is a budget the subject is written within, and is not a licence to drop the subject and lead with a verb.
    13. A journal entry's commit message uses the prefix `Journal:` and does not carry the date.
    14. A commit message already written, including every commit written before 2026-08-18, is not revised to suit a later convention.
    15. The body is wrapped in the commit message itself, not left for the terminal to wrap.

### Checker A

    1. kept — "The subject line is at most 50 characters."
    2. kept — "The body is wrapped at 72 characters."
    3. kept — "Split the commit, or move the detail to the body. Try them in that order."
    4. kept — "Do not abbreviate a subject into something a reader must decode. Use plain words, not contractions."
    5. kept — "The `language` package's rules hold in commit messages too."
    6. kept — "The body has no limit on what it says. Its only constraint is line width."
    7. kept — "A journal entry is the one record where neither remedy is available, and it truncates instead." / "Cut its commit subject at the 50th character with an ellipsis." (The ban on rewording is carried by "the subject is not the agent's to rewrite" in the truncation paragraph.)
    8. kept — "Its subject is the writer's words, which the `journal` package bars the agent from shortening."
    9. kept — "Truncation is not a general escape. It is available only where the subject is not the agent's to rewrite. Everywhere else, a subject that will not fit is a commit to split."
    10. kept — "The subject-first-commit-messages rule is unchanged. The subject is the software, never the engineer. It is a fact stated in passive voice and indicative mood."
    11. kept — "The commit-says-task-is-done-not-mark-done rule is unchanged too."
    12. kept — "Write the subject within the budget. Do not drop the subject and lead with a verb to save space."
    13. kept — "The journal's commit prefix is `Journal:`, which costs 9 characters. It carries no date."
    14. kept — "Every commit written before 2026-08-18 stands as written. Do not revise a commit message already written to suit a later convention."
    15. kept — "Wrap the body in the message itself. Do not leave wrapping to the terminal."

### Checker B

    All 15 directives are kept. None is less precise or lost.

    1. kept: "The subject line is at most 50 characters."
    2. kept: "The body is wrapped at 72 characters."
    3. kept: "Split the commit, or move the detail to the body. Try them in that order."
    4. kept: "Do not abbreviate a subject into something a reader must decode. Use plain words, not contractions."
    5. kept: "The `language` package's rules hold in commit messages too."
    6. kept: "The body has no limit on what it says. Its only constraint is line width." (together with "move the detail to the body")
    7. kept: "A journal entry is the one record where neither remedy is available, and it truncates instead." / "Cut its commit subject at the 50th character with an ellipsis."
    8. kept: "Its subject is the writer's words, which the `journal` package bars the agent from shortening."
    9. kept: "Truncation is not a general escape. It is available only where the subject is not the agent's to rewrite. Everywhere else, a subject that will not fit is a commit to split."
    10. kept: "The subject-first-commit-messages rule is unchanged. The subject is the software, never the engineer. It is a fact stated in passive voice and indicative mood."
    11. kept: "The commit-says-task-is-done-not-mark-done rule is unchanged too."
    12. kept: "Write the subject within the budget. Do not drop the subject and lead with a verb to save space."
    13. kept: "The journal's commit prefix is `Journal:`, which costs 9 characters. It carries no date."
    14. kept: "Every commit written before 2026-08-18 stands as written. Do not revise a commit message already written to suit a later convention."
    15. kept: "Wrap the body in the message itself. Do not leave wrapping to the terminal."

## commit-says-task-is-done-not-mark-done

### The compressor's answer

    **A commit message never uses "mark ... done" or "mark ... complete".** State the accomplishment as a fact about the work. Do not phrase it as bookkeeping on a checkbox. Write **"Task 9 is done"**, not "mark Task 9 done" or "mark Task 9 as complete".

    | Don't | Do |
    |---|---|
    | `Log: mark Task 9 done (green-on-arrival)` | `Log: Task 9 is done (green-on-arrival)` |
    | `mark the predicate task complete` | `the predicate task is done` |

    **Phrase finished work as the task being done.** Say "Task N is done" or "X is complete". This applies to the commit subject and the commit body.

    **Prose addressed to the user follows the same preference.** State the plain fact. Do not describe the act of marking it.

    **Why:** The commit records the state of the work, not the clerical act of ticking a box.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A commit message must not use the phrasing "mark ... done".
    2. A commit message must not use the phrasing "mark ... complete".
    3. A commit message must state the accomplishment as a fact about the work, not as an act of bookkeeping on a checkbox (for example, write "Task 9 is done", not "mark Task 9 done" or "mark Task 9 as complete").
    4. A commit message must describe the state of the work (the task *is* done), not the clerical gesture of marking it.
    5. When a commit records that a task or a piece of work is finished, phrase the commit subject as the task being done (for example, "Task N is done" or "X is complete").
    6. When a commit records that a task or a piece of work is finished, phrase the commit body as the task being done (for example, "Task N is done" or "X is complete").
    7. The prohibition on "mark ... done/complete" phrasing applies to both the commit subject and the commit body.
    8. Prose addressed to the user should also state that work is done as a plain statement of fact, not as marking it done.

### Checker A

    1. kept — "A commit message never uses "mark ... done""
    2. kept — "or "mark ... complete""
    3. kept — "State the accomplishment as a fact about the work. Do not phrase it as bookkeeping on a checkbox. Write **"Task 9 is done"**, not "mark Task 9 done" or "mark Task 9 as complete"."
    4. kept — "The commit records the state of the work, not the clerical act of ticking a box." (backed by "State the accomplishment as a fact about the work")
    5. kept — "Phrase finished work as the task being done. Say "Task N is done" or "X is complete". This applies to the commit subject"
    6. kept — "Phrase finished work as the task being done. Say "Task N is done" or "X is complete". This applies to the commit subject and the commit body."
    7. kept — "A commit message never uses "mark ... done" or "mark ... complete"". This covers the whole message, so it covers subject and body. "This applies to the commit subject and the commit body" is attached to the phrasing paragraph, not to the prohibition, but the "never" already covers both.
    8. kept — "Prose addressed to the user follows the same preference. State the plain fact. Do not describe the act of marking it."

### Checker B

    All 8 directives are kept.

    1. kept: "A commit message never uses "mark ... done""
    2. kept: "or "mark ... complete"."
    3. kept: "State the accomplishment as a fact about the work. Do not phrase it as bookkeeping on a checkbox. Write **"Task 9 is done"**, not "mark Task 9 done" or "mark Task 9 as complete"."
    4. kept: "State the accomplishment as a fact about the work." and "The commit records the state of the work, not the clerical act of ticking a box."
    5. kept: "Phrase finished work as the task being done. Say "Task N is done" or "X is complete". This applies to the commit subject"
    6. kept: "Phrase finished work as the task being done. Say "Task N is done" or "X is complete". This applies to ... the commit body."
    7. kept: "A commit message never uses "mark ... done" or "mark ... complete"." (a commit message includes both subject and body) and "This applies to the commit subject and the commit body."
    8. kept: "Prose addressed to the user follows the same preference. State the plain fact. Do not describe the act of marking it."

## no-claude-coauthor

### The compressor's answer

    **No Claude co-author trailer.** Do not add a `Co-Authored-By: Claude …` trailer to any commit you create. Do not add any other "co-authored by Claude/Anthropic" attribution either.

    **The commit is authored by the user only.** Omit the trailer even though Claude Code adds it by default.

    **This applies to every project.**

    **Why:** The user does not want AI co-authorship attribution in their commit history.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Do not add a `Co-Authored-By: Claude …` trailer, or any other "co-authored by Claude/Anthropic" attribution, to any commit you create. When writing commit messages, leave out the trailer that Claude Code adds by default.
    2. Every commit you create should appear as authored by the user only.
    3. The rule against Claude co-author attribution in commits applies to every project.

### Checker A

    1 — kept — "Do not add a `Co-Authored-By: Claude …` trailer to any commit you create. Do not add any other "co-authored by Claude/Anthropic" attribution either." / "Omit the trailer even though Claude Code adds it by default."
    2 — less precise — "The commit is authored by the user only." — states what is true of the commit instead of telling you to make every commit you create appear authored by the user only. It is also singular ("The commit"), not "every commit".
    3 — kept — "This applies to every project."

### Checker B

    1 — kept — "Do not add a `Co-Authored-By: Claude …` trailer to any commit you create. Do not add any other "co-authored by Claude/Anthropic" attribution either." / "Omit the trailer even though Claude Code adds it by default."
    2 — less precise — "The commit is authored by the user only." — the shorter version drops "every commit you create" and says "the commit", which leaves it unclear whether this covers every commit.
    3 — kept — "This applies to every project."

## run-suite-before-commit

### The compressor's answer

    **Run the full suite after any code change.** Confirm it passes **before** considering whether to commit. The suite run is a precondition of the commit decision. It is not a step taken after deciding to commit. A failing or incomplete suite means there is nothing to weigh. Do not reach the question of committing until the suite passes.

    **How the suite is run is the project's stack's concern, not this rule's.** The command and its passing output differ by language and test framework. They are settled where a stack is settled. For a Ruby project that is the `ext/ruby-lang` package's rule on running the suite. This rule fixes only *when* the run happens relative to the commit decision. That holds for any stack.

    **How to apply:** Edit → run the full suite → confirm it reports nothing failed → only then consider committing. If anything is failing or aborted, fix it, or stop, before the commit question arises. For a single-file change you may run that one file first for speed. Run the full suite before commit anyway.

    **Why:** Committing is the point of no easy return. Running the suite before deliberating keeps a failing change from becoming a commit candidate. It keeps every commit in the history verified. The commit waits on the bar, not on the human's attention.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. After making any code change, run the full test suite and confirm it passes before considering whether to commit.
    2. The suite run must happen before the commit decision, as a precondition of it, and not as a step taken after deciding to commit.
    3. While the suite is failing or incomplete, do not reach the question of committing.
    4. How the suite is run (what command runs it, and what its output reads when nothing failed) must be settled by the project's stack, not by this rule.
    5. For a Ruby project, how the suite is run is settled by the `ext/ruby-lang` package's rule on running the suite.
    6. The commit must wait on the suite passing, not on the human's attention.
    7. Confirm that the full suite reports nothing failed before considering a commit.
    8. If anything in the suite is failing or aborted, fix it (or stop) before the commit question arises.
    9. For a single-file change, you may run the one test file first for speed.
    10. Even when the one file was run first for a single-file change, run the full suite before committing.

### Checker A

    1. kept — "Run the full suite after any code change. Confirm it passes before considering whether to commit."
    2. kept — "The suite run is a precondition of the commit decision. It is not a step taken after deciding to commit."
    3. kept — "A failing or incomplete suite means there is nothing to weigh. Do not reach the question of committing until the suite passes."
    4. kept — "How the suite is run is the project's stack's concern, not this rule's. The command and its passing output differ by language and test framework. They are settled where a stack is settled."
    5. kept — "For a Ruby project that is the `ext/ruby-lang` package's rule on running the suite."
    6. less precise — "The commit waits on the bar, not on the human's attention." Missing: it never says that "the bar" means the suite passing, so what the commit waits on is unclear.
    7. kept — "run the full suite → confirm it reports nothing failed → only then consider committing"
    8. kept — "If anything is failing or aborted, fix it, or stop, before the commit question arises."
    9. kept — "For a single-file change you may run that one file first for speed."
    10. kept — "Run the full suite before commit anyway."

### Checker B

    1. kept — "Run the full suite after any code change. Confirm it passes **before** considering whether to commit."
    2. kept — "The suite run is a precondition of the commit decision. It is not a step taken after deciding to commit."
    3. kept — "A failing or incomplete suite means there is nothing to weigh. Do not reach the question of committing until the suite passes."
    4. kept — "How the suite is run is the project's stack's concern, not this rule's. The command and its passing output differ by language and test framework. They are settled where a stack is settled."
    5. kept — "For a Ruby project that is the `ext/ruby-lang` package's rule on running the suite."
    6. less precise — "The commit waits on the bar, not on the human's attention." Missing: "the bar" is never defined. It does not say the bar is the suite passing.
    7. kept — "confirm it reports nothing failed → only then consider committing"
    8. kept — "If anything is failing or aborted, fix it, or stop, before the commit question arises."
    9. kept — "For a single-file change you may run that one file first for speed."
    10. kept — "Run the full suite before commit anyway."

## subject-first-commit-messages

### The compressor's answer

    The subject of a commit message is **the software**, never the engineer. The log records changes to the software and their effects. It is not an account of what the engineer did. The first line leads with the thing that changed and its new state. State it as a fact, in passive voice and indicative mood.

    - **State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation".
    - **"is corrected"** for a defect. **"is clarified"** for a refactor or readability change.
    - **Omit the verb for something new.** "Widget tests", not "Widget tests are added".
    - **Rename form:** "Widget, rather than sprocket".
    - **Package version form:** "Package version is increased from 1.1.1 to 1.2.0". State both the current version and the next one. "Increased" holds even when a trailing segment resets.

    **Never lead with a verb.** That covers the imperative ("Fix…") and the past tense ("Fixed…") alike. Name the software that changed, then its new state.

    **The subject's length is the commit-message-widths rule's.** That rule caps the subject at 50 characters and wraps the body at 72.

    **Split the commit when the subject will not fit.** Do not drop the software subject and lead with a verb instead.

    **Why:** the log records the software's history and is scanned, not read. Leading with the changed thing serves that and is easier to review.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. The subject of a commit message must be the software, never the engineer.
    2. The first line of a commit message must lead with the thing that changed and its new state.
    3. The first line must state the change as a fact, in passive voice and indicative mood.
    4. State the change; don't narrate the work (e.g. "Widget reconciliation is corrected", not "Fix widget reconciliation" or "Fixed widget reconciliation").
    5. Use "is corrected" for a defect.
    6. Use "is clarified" for a refactor or a readability change.
    7. Omit the verb for something new (e.g. "Widget tests", not "Widget tests are added").
    8. Write a rename in the form "Widget, rather than sprocket".
    9. Write a package version change in the form "Package version is increased from 1.1.1 to 1.2.0".
    10. A package version commit message must state both the current version and the next one.
    11. Use "increased" for a package version change even when a trailing segment resets, because what is increased is the version, not each segment.
    12. The commit subject must be no longer than 50 characters.
    13. The commit message body must be wrapped at 72 characters.
    14. Where the subject will not fit in its length, split the commit rather than dropping the subject and leading with a verb.
    15. Never lead a commit subject with a verb, whether imperative or past tense.

### Checker A

    1. kept — "The subject of a commit message is **the software**, never the engineer."
    2. kept — "The first line leads with the thing that changed and its new state."
    3. kept — "State it as a fact, in passive voice and indicative mood."
    4. kept — "**State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation"."
    5. kept — "**"is corrected"** for a defect."
    6. kept — "**"is clarified"** for a refactor or readability change."
    7. kept — "**Omit the verb for something new.** "Widget tests", not "Widget tests are added"."
    8. kept — "**Rename form:** "Widget, rather than sprocket"."
    9. kept — "**Package version form:** "Package version is increased from 1.1.1 to 1.2.0"."
    10. kept — "State both the current version and the next one."
    11. kept — ""Increased" holds even when a trailing segment resets." (The reason, that the version is what gets increased and not each segment, is left out. The required behavior is still there.)
    12. kept — "That rule caps the subject at 50 characters"
    13. kept — "and wraps the body at 72."
    14. kept — "**Split the commit when the subject will not fit.** Do not drop the software subject and lead with a verb instead."
    15. kept — "**Never lead with a verb.** That covers the imperative ("Fix…") and the past tense ("Fixed…") alike."

### Checker B

    1. kept: "The subject of a commit message is **the software**, never the engineer."
    2. kept: "The first line leads with the thing that changed and its new state."
    3. kept: "State it as a fact, in passive voice and indicative mood."
    4. kept: "**State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation"."
    5. kept: "**"is corrected"** for a defect."
    6. kept: "**"is clarified"** for a refactor or readability change."
    7. kept: "**Omit the verb for something new.** "Widget tests", not "Widget tests are added"."
    8. kept: "**Rename form:** "Widget, rather than sprocket"."
    9. kept: "**Package version form:** "Package version is increased from 1.1.1 to 1.2.0"."
    10. kept: "State both the current version and the next one."
    11. less precise: ""Increased" holds even when a trailing segment resets." Missing: the reason, that what is increased is the version and not each segment.
    12. kept: "That rule caps the subject at 50 characters"
    13. kept: "and wraps the body at 72."
    14. kept: "**Split the commit when the subject will not fit.** Do not drop the software subject and lead with a verb instead."
    15. kept: "**Never lead with a verb.** That covers the imperative ("Fix…") and the past tense ("Fixed…") alike."

---

Authored by Scott Bellware on Thu Oct 22 2026 at 3:28:16 PM PT
