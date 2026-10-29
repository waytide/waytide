# A commit message's subject stops at 50 characters and its body wraps at 72

Source: system/git/source/a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72.md

Trigger: When writing a commit message

1. The subject line is at most 50 characters.
2. The body is wrapped at 72 characters.
3. The two numbers are separate budgets, not one convention.
4. 50 is a display budget. `git log --oneline` and hosted commit lists truncate near there.
5. 72 is a wrapping budget. `git log` indents the body four spaces, so 72 fits an 80-column terminal.
6. Wrap the body in the message itself. Do not leave wrapping to the terminal.

## When the subject will not fit

1. Split the commit, or move the detail to the body. Try them in that order.
2. A subject that will not fit usually means the commit does too much. Treat that as the main reason to split.
3. Do not abbreviate a subject into something a reader must decode.
4. Use plain words, not contractions.
5. The `language` package's rules hold in commit messages too.
6. The body has no limit on what it says. Its only constraint is line width.
7. A journal entry is the one record where neither remedy is available. It truncates instead.
8. An entry is one commit, so there is nothing to split.
9. An entry's subject is the writer's words, which the `journal` package bars the agent from shortening.
10. Cut a journal entry's commit subject at the 50th character with an ellipsis. See that package's the-journal-is-the-record-the-writer-keeps rule.
11. Truncation is not a general escape. It is available for a journal entry alone.
12. Everywhere else, a subject that will not fit is a commit to split.

## What still governs the subject

1. The write-subject-first-commit-messages rule is unchanged.
2. The subject is the software, never the engineer.
3. The subject is a fact stated in passive voice and indicative mood.
4. The a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rule is unchanged too.
5. Those rules push length up, and that is accepted.
6. Write the subject within the budget.
7. Do not drop the subject and lead with a verb to save space.
8. A prefix spends the budget.
9. The journal's commit prefix is `Journal:`, which costs 9 characters. It carries no date. See the `journal` package's the-journal-is-the-record-the-writer-keeps rule.

## The history is not rewritten

1. Every commit written before 2026-08-18 stands as written.
2. Do not revise a commit message already written to suit a later convention.

# A commit's SHA refers to the work the commit carries

Source: system/git/source/a-commits-sha-refers-to-the-work-the-commit-carries.md

Trigger: When the engineer gives a commit SHA

1. A commit SHA from the engineer asks about the work the commit carries.
2. That work is the item, the implementation, the rule, or the code change.
3. The SHA does not ask about the commit's mechanics.
4. The mechanics are the commit's message, its file list, its diff statistics, and the log entry that came with it.
5. Answer from what the commit added or changed.
6. If the commit carries an item, an implementation record, or a rule, read that file. Answer from its content.
7. If the commit changes code, answer from what the code now does.
8. Open the files the commit added or changed, rather than reporting their names.
9. Give the mechanics when the question is about them. Answer each of *Was it pushed*, *what did it touch*, *is it on master*, and *what does its message say* directly.
10. Give the mechanics when they are the substance. A merge, a revert, a rename, a force-push, and a rebase have the operation as their content.
11. There is nothing behind those operations to read.
12. Ask only where it is genuinely unclear.
13. A bare SHA with no verb is the ordinary case. Give the substance for it.

# Announce a branch switch in a bordered block

Source: system/git/source/announce-a-branch-switch-in-a-bordered-block.md

Trigger: When switching the working tree to another branch (including `git switch -c`)

1. When the agent switches branches, it prints this block.
2. The block has a border of `=` characters above and below:

```
========================================
BRANCH SWITCHED

  from    master
  to      experiment/ste-spec
  reason  the vocabulary comparison is
          recorded on this branch
========================================
```

3. Print it on every switch.
4. Print it when the engineer asked for the switch.
5. Print it when the switch was made to reach a file.
6. Print it when the switch goes back to the branch the session started on.
7. Print it before reporting anything else about the work.

## The three fields

1. **from** is the branch the working tree was on.
2. **to** is the branch the working tree is on now.
3. **reason** is why the agent switched, in one line or two.
4. Fill all three fields.
5. The reason states what the switch was for, not what the work is.
6. The border is the requirement, not decoration.
7. Only `=` characters above and below satisfy this rule.

## What this does not cover

1. Creating a branch is a switch when the working tree moves to it.
2. `git switch -c` prints the block, with `from` naming the base.
3. A worktree adds a working directory rather than moving this one.
4. Print no block for a worktree.
5. The an-implementation-runs-on-a-branch-to-a-declared-end rule governs the worktree case.
6. A merge, a commit, or a push does not move the working tree.
7. Print no block for a merge, a commit, or a push.

# Claude is not credited as a co-author of a commit

Source: system/git/source/claude-is-not-credited-as-a-co-author-of-a-commit.md

Trigger: When creating a commit

1. Do not add a `Co-Authored-By: Claude …` trailer to any commit you create.
2. Do not add any other "co-authored by Claude/Anthropic" attribution either.
3. The commit is authored by the user only.
4. Omit the trailer even though Claude Code adds it by default.
5. This applies to every project.

# Write subject-first commit messages

Source: system/git/source/write-subject-first-commit-messages.md

Trigger: When writing a commit message

1. The subject of a commit message is **the software**, never the engineer.
2. The log records changes to the software and their effects. It is not an account of what the engineer did.
3. The first line leads with the thing that changed and its new state.
4. State it as a fact, in passive voice and indicative mood.
5. **State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation".
6. Use **"is corrected"** for a defect.
7. Use **"is clarified"** for a refactor or readability change.
8. **Omit the verb for something new.** "Widget tests", not "Widget tests are added".
9. **Rename form:** "Widget, rather than sprocket".
10. **Package version form:** "Package version is increased from 1.1.1 to 1.2.0".
11. State both the current version and the next one.
12. "Increased" holds even when a trailing segment resets.
13. **Never lead with a verb.** That covers the imperative ("Fix…") and the past tense ("Fixed…") alike.
14. Name the software that changed, then its new state.
15. **The subject's length is the a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 rule's.** That rule caps the subject at 50 characters and wraps the body at 72.
16. **Split the commit when the subject will not fit.**
17. Do not drop the software subject and lead with a verb instead.
