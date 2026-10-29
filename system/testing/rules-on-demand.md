# A feature's normal path and its exceptional paths are separate test files

Source: system/testing/source/a-features-normal-path-and-its-exceptional-paths-are-separate-test-files.md

Trigger: When writing a test for a feature's exceptional (raising) path

1. A feature's normal path is its ordinary, non-raising course through it.
2. The normal path's test and each exceptional path's test live in separate files.
3. A feature with one normal path and one exceptional path is two files. It is not one file with two contexts.
4. A test file actuates the concern once, at the top of the feature context. See the a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context rule.
5. Each outcome of that one actuation is asserted in its own nested context.
6. An exceptional path cannot share the normal path's actuation. Its actuation is inside an `assert_raises` and produces no result to observe.
7. Naming follows the existing file conventions.
8. Where a feature has a normal path and one or more exceptional paths, the feature takes a folder.
9. Each file in the folder is named for the case it distinguishes. See the a-feature-with-one-case-has-one-test-file-named-for-the-feature rule.
10. The normal-path file is named for the feature.
11. Each exceptional-path file is named for the condition under which the actuation fails.
12. That condition is also promoted to a `context` inside the exceptional-path file.
13. The test in that context is named `Fails`. See the an-error-test-is-named-fails-and-its-condition-is-a-context rule.
14. An exceptional-path file holds only its one exceptional case.
15. An exceptional-path file does not re-prove the normal path.
16. Controls in an exceptional-path file that also appear on the normal path serve only to make the failure discriminating.
17. Discriminating means the raised error can be told from a different failure of the same class.
18. Do not add a second, raising actuation to a normal-path file.

# A predicate method's test context is its name followed by the word "Predicate"

Source: system/testing/source/a-predicate-methods-test-context-is-its-name-followed-by-the-word-predicate.md

Trigger: When naming a test context for a ?-suffixed predicate method

1. A predicate method is a `?`-suffixed, boolean-returning method.
2. Name a predicate method's test `context` by the method's name without the `?`, followed by "Predicate".
3. Titlecase the method's name before appending "Predicate".
4. `defined?` → `context "Defined Predicate"`, not `context "Defined?"`.
5. Examples: `defined?` → "Defined Predicate", `valid?` → "Valid Predicate", and `empty?` → "Empty Predicate".
6. Keep the `?` out of a `context` label.

# A test file named with a leading underscore is suspended

Source: system/testing/source/a-test-file-named-with-a-leading-underscore-is-suspended.md

Trigger: When taking a test out of the suite, finding a failing test to set aside, or writing the code that selects a suite's test files

1. A leading underscore on a test file's name means the file is suspended.
2. `_upload.rb` is suspended and `upload.rb` is not.
3. A suite run does not run a suspended file.
4. To suspend a test, rename its file with a leading underscore. Suspending is a rename and nothing else.
5. The file stays where it is.
6. Change nothing inside the file.
7. To take the test back into the suite, remove the underscore.
8. Do not delete a test to get it out of the suite.
9. Do not leave a failing test in the suite.

## Suspended here means paused, not stopped

1. This is the `Suspended` state's sense: paused, not ended.
2. The file is kept, and it is expected to run again.
3. It is not a suspension in the sense of the `foundation` a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule. That rule governs something done, stopped, and removed.
4. A suspended test is removed from nothing.
5. Do not tag a log entry `[suspended]` for a suspended test, since nothing was removed.
6. Suspending a test is an ordinary decision. The log's own trigger applies to it like any other.

## The mark is in the filename because that is what a suite reads

1. The suspension mark goes in the filename, not inside the file.
2. A suite selects its files by name, by expanding a pattern over the test directory.
3. The underscore does not exclude itself. Expect this failure.
4. A shell glob skips a leading dot but not a leading underscore. `*.rb` returns `_upload.rb` along with the rest.
5. A language's own test-file discovery usually does not skip the underscore either.
6. Whatever runs the suite excludes files whose names begin with an underscore.
7. Write that exclusion explicitly, because the pattern does not do it.
8. Do not use a dot-prefixed name for suspension. It would hide the file from directory listings and editor file trees.
9. A suspended test should stay visible and be passed over.

# A test report classifies the suite and prints its context hierarchy

Source: system/testing/source/a-test-report-classifies-the-suite-and-prints-its-context-hierarchy.md

Trigger: When the user asks for a test report

1. This rule applies when the user asks for a **test report**.
2. Classify the automated suite along the lenses below.
3. Then print the context hierarchy two levels deep.
4. Re-derive everything from the current files, the context hierarchy included.
5. Read the tests and recompute membership and counts.
6. Do not report stale buckets from memory.
7. The lenses are fixed. The buckets are whatever the current suite yields.
8. Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out), rather than asserting it.
9. Produce the sections below, in the order given.
10. Keep each section tight.
11. Do not write the report to a file.

## 1. Generations / styles

1. The suite may have coexisting conventions, an older style alongside a newer one.
2. Split the files by which convention they follow.
3. Name the cleanest mechanical tell.
4. One such tell is actuation placement: captured in the controls, or performed inside the test block.
5. If the suite is uniform, say so and skip this section.

## 2. By subject under test

1. Group by the unit each test targets.
2. Give the file count per group.

## 3. By structural style

1. Use these styles:
   - single-outcome leaf — one capability, one assertion
   - multi-outcome with fan-out — a loop generating one sub-context per case
   - multi-outcome flat — sibling outcomes, no loop

## 4. By assertion kind

1. Classify as affirmative `assert`, refutation `refute`, or error-raising `assert_raises`.
2. Note the error classes in play.

## 5. Other factors

1. Report topology pairs (e.g. top-level vs nested for the same method).
2. Report normal-path vs error outcomes.
3. Report controls usage.

## 6. Context hierarchy, two levels deep

1. Show each distinct top-level context, with its distinct second-level contexts nested beneath.
2. Render it as an indented tree (`├─`/`└─`), as the status-report rule (in `foundation`) describes.
3. Stop at two levels.
4. Do not run the suite for this report.
5. Take the hierarchy from the `context "…"` declarations as written.
6. A dynamic `context <expr> do` shows as its expression.
7. A bare unnamed `test do` adds no context line.
8. A report on what a run produced is the test-tree command's, not this one's.

# An error test is named Fails, and its condition is a context

Source: system/testing/source/an-error-test-is-named-fails-and-its-condition-is-a-context.md

Trigger: When writing or naming a test that asserts an actuation raises an error or does not raise

1. When a test asserts that the actuation raises an error (an `assert_raises`), name the `test` block "Fails".
2. When a test asserts that the actuation does not raise, name the `test` block "Doesn't fail".
3. Do not put the condition under which the actuation fails, or doesn't, in the test name.
4. Promote that condition to a `context` that encloses the test and names the condition as a "When …" clause.
5. A test name that wants the word "when" signals a condition. Lift that "when" clause into an enclosing `context`, and name the test "Fails" or "Doesn't fail".

```ruby
context "When the name is not defined" do
  test "Fails" do
    assert_raises(SomeError) { actuation }
  end
end
```

6. Several conditions over the same actuation may sit as sibling `When …` contexts, each with its own `test "Fails"`.
7. "Fails" is a plain outcome name, not an "Is" case. It does not conflict with the "Is"-naming rule, which reserves "Is" for value-equals.
8. An error test always takes an enclosing context, because the context carries the condition. The a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables rule warns of a context that holds only a test. It never warns of a leading `When …` context, such as an error test's.

# Assert an error message only when it alone confirms the error

Source: system/testing/source/assert-an-error-message-only-when-it-alone-confirms-the-error.md

Trigger: When writing an `assert_raises` or deciding whether to assert an error's message

1. Assert an error's message content only when the message is the only way to confirm the correct error was raised under the expected conditions.
2. Otherwise, do not assert the message.
3. Ordinarily, `assert_raises(SomeClass)` plus the test's condition setup already confirms the right error. The class identifies the failure, and the setup fixes the condition.
4. A message assertion in that ordinary case tests presentation, not behavior. A harmless reword would break it.
5. The message is the sole discriminator in only one situation: the same error class can be raised from multiple sites reachable in the same execution path.
6. In that situation, the class cannot show which site raised. The error may come from the intended condition or from an incidental one elsewhere in the path.

## Deciding for each `assert_raises`

1. For each `assert_raises`, ask: *can this exact error class be raised from more than one site along this actuation's execution?*
2. If no, class and condition suffice. Assert no message.
3. Example of no: the empty-file guard's lone `Upload::Error`, with one `raise` site on the empty-file path.
4. Example of no: a response check that always raises from a single line.
5. If yes, the message is the discriminator. Assert its exact content.
6. Example of yes: a multi-part `Upload#call` can raise `Upload::Error` at the head part or the tail part. The message (which part, which response) confirms the intended failure.
7. Example of yes: a two-step upload can raise `Upload::Error` from the initial post's "rejected" site or the finalize step's "rejected" site.

# The test tree command prints the suite's context tree

Source: system/testing/source/the-test-tree-command-prints-the-suites-context-tree.md

Trigger: When the user gives the command "test tree"

1. When the user gives the command **"test tree"**, run the automated suite.
2. Print its structure as a **single normalized tree**.
3. The tree is the whole suite's `context`/`test` hierarchy.
4. Merge **duplicate outer context headings**, so each context path appears **once**.
5. Each outer context appears once, with each sub-feature once beneath it.
6. Show individual tests as leaves with a `•` prefix.
7. Put the pass/fail summary line at the end.
8. **Produce the tree from the run's output, not the source.**
9. Run the suite with narration output suppressed, capture the output, and parse that output.
10. Merge every file's `context`/`test` hierarchy into one tree keyed by name, so identical paths de-duplicate.
11. A dynamic `context <expr> do` shows its **expanded real value**, not the source placeholder.
12. A bare unnamed `test do` produces no line, so its enclosing context becomes the leaf.
13. Use a durable script, so the command is reproducible in every session, rather than rebuilding a parser each time.
14. **Which script, and where it lives, is the project's stack's concern.**
15. The script runs the project's suite, suppresses that runner's narration, and parses that framework's output.
16. For a Ruby project, the `ext/ruby-lang` package's rule on running the suite settles the script.
17. This rule fixes only what the tree is and where it is derived from.
18. On a "test tree" request, run the project's durable tree script and present its output.
