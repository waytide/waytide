# A commit message states that a task is done, never that it is marked done

Source: system/git/source/a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done.md

1. A commit message never uses "mark ... done" or "mark ... complete".
2. State the accomplishment as a fact about the work.
3. Do not phrase it as bookkeeping on a checkbox.
4. Write **"Task 9 is done"**, not "mark Task 9 done" or "mark Task 9 as complete".

| Don't | Do |
|---|---|
| `Log: mark Task 9 done (already passing)` | `Log: Task 9 is done (already passing)` |
| `mark the predicate task complete` | `the predicate task is done` |

5. Phrase finished work as the task being done. Say "Task N is done" or "X is complete".
6. This applies to the commit subject and the commit body.
7. Prose addressed to the user follows the same preference.
8. In prose addressed to the user, state the plain fact. Do not describe the act of marking it.

# Run the test suite after changes, before considering whether to commit

Source: system/git/source/run-the-test-suite-after-changes-before-considering-whether-to-commit.md

1. Run the full suite after any code change.
2. Confirm it passes **before** considering whether to commit.
3. The suite run is a precondition of the commit decision.
4. The suite run is not a step taken after deciding to commit.
5. A failing or incomplete suite means there is nothing to weigh.
6. Do not reach the question of committing until the suite passes.
7. How the suite is run is the project's stack's concern, not this rule's.
8. The command and its passing output differ by language and test framework.
9. The command and its passing output are settled where a stack is settled.
10. For a Ruby project, that is the `ext/ruby-lang` package's rule on running the suite.
11. This rule fixes only *when* the run happens relative to the commit decision. That holds for any stack.
12. Apply it as: Edit → run the full suite → confirm it reports nothing failed → only then consider committing.
13. If anything is failing or aborted, fix it, or stop, before the commit question arises.
14. For a single-file change, you may run that one file's tests first for speed.
15. Run the full suite before commit anyway.
16. The commit waits on the suite passing, not on the human's attention.
