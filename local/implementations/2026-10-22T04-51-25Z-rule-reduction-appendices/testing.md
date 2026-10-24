# Rule reduction — the `testing` batch, its prompts and answers

The appendix to the experiment record's `testing` batch. Each rule's compression, directive list, and two checkers' answers are given word for word, with the re-check of each repaired rule.

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

The prompt for `a-high-level-context-names-a-behavior-not-a-method`. The other rules' prompts differ only in the path.

    Read the file /private/tmp/claude-501/batch-testing/a-high-level-context-names-a-behavior-not-a-method/source.md. It is a rule that governs an AI coding agent and the scripts of the project it works in.

    List every directive the rule contains. A directive is any statement of what must, must not, or may be done, or of what something must be, say, contain, or leave out. Include the directives stated only in passing, inside explanations, and in the How to apply section.

    - Number them, one directive per line.
    - Make each self-contained, so it can be understood without the rule. Keep the rule's own wording where you can.
    - Do not merge two directives into one line, and do not split one into two.
    - Leave out history and justification, except where a reason itself constrains what is done.
    - Where the rule states the same directive more than once, list it once.

    Use no tool except reading that one file. Answer with the numbered list only.

## The checking prompt

The prompt for the same rule. The checker's `compressed.md` holds the rule's title, its compressed text, and its Related list.

    Read the file /private/tmp/claude-501/batch-testing/a-high-level-context-names-a-behavior-not-a-method/directives.md, a numbered list of the directives in a rule. Then read the file /private/tmp/claude-501/batch-testing/a-high-level-context-names-a-behavior-not-a-method/compressed.md, a shorter version of the same rule.

    For each directive in the list, judge whether the shorter version carries it:

    - **kept** — the shorter version states it, or states something that requires the same behavior
    - **less precise** — the shorter version states part of it, or states it less strictly, or makes it ambiguous
    - **lost** — the shorter version does not state it and nothing in it requires it

    Answer with one line per directive, in the list's order: its number, the verdict, and, for kept or less precise, the words in the shorter version that carry it, quoted. For less precise or lost, add what is missing in a few words. Judge only from the two files. Use no tool except reading those two files.

## a-high-level-context-names-a-behavior-not-a-method

### The compressor's answer

    1. A test's high-level context names a behavior.
    2. A high-level context does not name a method. A method name is an implementation.
    3. A high-level context does not name a class's internal structure.
    4. `context "Call"` names the method `call` and states nothing about what the unit does.

    ## The requirement is firm at the top and relaxes with depth

    1. The requirement applies more firmly at higher contexts and more permissively at deeper ones.
    2. The higher a context sits, the more firmly it names a behavior.
    3. The unit's own context and the contexts directly under it must not name a method.
    4. A deeper context may name an implementation element when it describes one part of how the behavior is carried out.
    5. The predicate-context-name rule is that case. `context "Defined Predicate"` sits inside the behavior it qualifies.
    6. No fixed level marks the change. The writer judges where a context has begun to describe the implementation.
    7. Prefer a behavior at every level.
    8. A deep context that can name a behavior still names one.

    ## Where the root test sits

    1. A unit's root test has no second-level context.
    2. The root test sits directly under the unit's own context.
    3. The root test's outcome context carries the name of the unit's central behavior.
    4. Each subsequent test takes a second-level context named for the behavior it covers.
    5. Contexts mirror the file path under `test/automated/`, per the test-context-nesting-mirrors-folders rule. Do not drop a context and keep its path segment.
    6. A root test lives at `test/automated/<unit>.rb`.
    7. A subsequent behavior lives at `test/automated/<unit>/<behavior>.rb`.
    8. **Why:** a context is read first and decides what the reader takes the test to be about. A method name sends the reader to the source, and goes stale silently if the method is renamed. A deep context is read with the behavior above it in hand, so naming an implementation element costs nothing.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A test's high-level context must be expressed in terms of a behavior.
    2. A high-level context must not be named for a method, such as `context "Call"` for the method `call`.
    3. A high-level context must not be named for a class's internal structure.
    4. The higher a context sits in a test, the more firmly it must name a behavior.
    5. The unit's own context and the contexts directly under it must name a behavior and not a method name.
    6. A deeper context that describes one part of how the behavior is carried out (an implementation element) may name that element, as in `context "Defined Predicate"` inside the behavior it qualifies.
    7. Prefer a behavior at every level of context.
    8. The writer judges where a context has begun to describe the implementation, since no fixed level marks the change.
    9. A deep context that can name a behavior must still name one.
    10. A unit's root test (its basic test, which establishes the unit's central behavior) must have no second-level context and must sit directly under the unit's own context.
    11. The root test's outcome context must carry the name of the unit's central behavior.
    12. Each subsequent test, covering another behavior, must take its own second-level context named for the behavior it covers.
    13. A unit's root test must be located at `test/automated/<unit>.rb`.
    14. A subsequent behavior's test must be located at `test/automated/<unit>/<behavior>.rb`.
    15. The test's file path must stay in step with its contexts: when a context is dropped, the matching path segment under `test/automated/` must be dropped as well.

### Checker A

    1. kept — "A test's high-level context names a behavior."
    2. kept — "A high-level context does not name a method." / "`context "Call"` names the method `call` and states nothing about what the unit does."
    3. kept — "A high-level context does not name a class's internal structure."
    4. kept — "The higher a context sits, the more firmly it names a behavior."
    5. kept — "The unit's own context and the contexts directly under it must not name a method." together with "A test's high-level context names a behavior." (The positive "must name a behavior" for this level comes from the high-level statement, not from the sentence that names the level.)
    6. kept — "A deeper context may name an implementation element when it describes one part of how the behavior is carried out." / "`context "Defined Predicate"` sits inside the behavior it qualifies."
    7. kept — "Prefer a behavior at every level."
    8. kept — "No fixed level marks the change. The writer judges where a context has begun to describe the implementation."
    9. kept — "A deep context that can name a behavior still names one."
    10. kept — "A unit's root test has no second-level context." / "The root test sits directly under the unit's own context."
    11. kept — "The root test's outcome context carries the name of the unit's central behavior."
    12. kept — "Each subsequent test takes a second-level context named for the behavior it covers."
    13. kept — "A root test lives at `test/automated/<unit>.rb`."
    14. kept — "A subsequent behavior lives at `test/automated/<unit>/<behavior>.rb`."
    15. kept — "Contexts mirror the file path under `test/automated/` ... Do not drop a context and keep its path segment."

### Checker B

    1. kept — "A test's high-level context names a behavior."
    2. kept — "A high-level context does not name a method." / "`context "Call"` names the method `call` and states nothing about what the unit does."
    3. kept — "A high-level context does not name a class's internal structure."
    4. kept — "The higher a context sits, the more firmly it names a behavior."
    5. less precise — "The unit's own context and the contexts directly under it must not name a method." Missing: the positive requirement that these contexts must name a behavior. Only the ban on method names is stated for this level.
    6. kept — "A deeper context may name an implementation element when it describes one part of how the behavior is carried out." / "`context "Defined Predicate"` sits inside the behavior it qualifies."
    7. kept — "Prefer a behavior at every level."
    8. kept — "No fixed level marks the change. The writer judges where a context has begun to describe the implementation."
    9. kept — "A deep context that can name a behavior still names one."
    10. kept — "A unit's root test has no second-level context." / "The root test sits directly under the unit's own context."
    11. kept — "The root test's outcome context carries the name of the unit's central behavior."
    12. kept — "Each subsequent test takes a second-level context named for the behavior it covers."
    13. kept — "A root test lives at `test/automated/<unit>.rb`."
    14. kept — "A subsequent behavior lives at `test/automated/<unit>/<behavior>.rb`."
    15. kept — "Contexts mirror the file path under `test/automated/`, per the test-context-nesting-mirrors-folders rule. Do not drop a context and keep its path segment."

## a-suspended-test-file-is-named-with-a-leading-underscore

### The compressor's answer

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
    3. It is not a suspension in the sense of the `foundation` a-suspension-is-a-log-entry rule. That rule governs something done, stopped, and removed.
    4. A suspended test is removed from nothing.
    5. Do not tag a log entry `[suspended]` for a suspended test, since nothing was removed.
    6. Suspending a test is an ordinary decision. The decision log's own trigger applies to it like any other.

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
    10. **Why:** Deleting a test that cannot pass loses the work and the intent. Leaving it in makes every run report an expected failure, which hides the next real one. Renaming keeps the file visible and out of the report. A suspended test is not counted in the pass count, and that cost is accepted because the name shows in the directory listing.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A test file whose name begins with a leading underscore is suspended; a file without the leading underscore is not (e.g. `_upload.rb` is suspended, `upload.rb` is not).
    2. A suite run does not run a suspended test file.
    3. Suspending a test is a rename and nothing else: rename its file with a leading underscore.
    4. A suspended test file stays where it is; it is not moved.
    5. A suspended test file's content is left untouched; change nothing inside it.
    6. To take a suspended test back into the suite, remove the leading underscore from its filename.
    7. The suspension mark goes in the test file's name, not inside the file.
    8. Do not use a dot-prefixed filename to suspend a test.
    9. Whatever runs the suite must skip every file whose name begins with an underscore, and must write that exclusion explicitly, because a glob pattern or a language's test-file discovery does not exclude it; do not assume the mark is self-enforcing.
    10. A suspended test takes no log entry tagged `[suspended]`, since nothing was removed.
    11. Suspending a test is an ordinary decision, and the decision log's own trigger applies to it like any other decision.
    12. Do not delete a test to get it out of the suite; the suspended file is kept.
    13. Do not leave a failing test in the suite.

### Checker A

    1. kept — "A leading underscore on a test file's name means the file is suspended." / "`_upload.rb` is suspended and `upload.rb` is not."
    2. kept — "A suite run does not run a suspended file."
    3. kept — "To suspend a test, rename its file with a leading underscore. Suspending is a rename and nothing else."
    4. kept — "The file stays where it is."
    5. kept — "Change nothing inside the file."
    6. kept — "To take the test back into the suite, remove the underscore."
    7. kept — "The suspension mark goes in the filename, not inside the file."
    8. kept — "Do not use a dot-prefixed name for suspension."
    9. kept — "Whatever runs the suite excludes files whose names begin with an underscore." / "Write that exclusion explicitly, because the pattern does not do it." / "The underscore does not exclude itself. Expect this failure." / "A shell glob skips a leading dot but not a leading underscore." / "A language's own test-file discovery usually does not skip the underscore either."
    10. kept — "Do not tag a log entry `[suspended]` for a suspended test, since nothing was removed."
    11. kept — "Suspending a test is an ordinary decision. The decision log's own trigger applies to it like any other."
    12. kept — "Do not delete a test to get it out of the suite." / "The file is kept, and it is expected to run again."
    13. kept — "Do not leave a failing test in the suite."

### Checker B

    1. kept: "A leading underscore on a test file's name means the file is suspended." / "`_upload.rb` is suspended and `upload.rb` is not."
    2. kept: "A suite run does not run a suspended file."
    3. kept: "To suspend a test, rename its file with a leading underscore. Suspending is a rename and nothing else."
    4. kept: "The file stays where it is."
    5. kept: "Change nothing inside the file."
    6. kept: "To take the test back into the suite, remove the underscore."
    7. kept: "The suspension mark goes in the filename, not inside the file."
    8. kept: "Do not use a dot-prefixed name for suspension."
    9. kept: "Whatever runs the suite excludes files whose names begin with an underscore." / "Write that exclusion explicitly, because the pattern does not do it." / "The underscore does not exclude itself. Expect this failure." / "A shell glob skips a leading dot but not a leading underscore." / "A language's own test-file discovery usually does not skip the underscore either." The word "usually" softens the claim about language discovery, but the explicit-exclusion requirement is still stated in full.
    10. kept: "Do not tag a log entry `[suspended]` for a suspended test, since nothing was removed."
    11. kept: "Suspending a test is an ordinary decision. The decision log's own trigger applies to it like any other."
    12. kept: "Do not delete a test to get it out of the suite." / "The file is kept, and it is expected to run again."
    13. kept: "Do not leave a failing test in the suite."

## assert-error-message-only-as-sole-discriminator

### The compressor's answer

    1. Assert an error's message content only when the message is the only way to confirm the correct error was raised under the expected conditions.
    2. Otherwise, do not assert the message.
    3. Ordinarily, `assert_raises(SomeClass)` plus the test's condition setup already confirms the right error. The class identifies the failure, and the setup fixes the condition.
    4. A message assertion in that ordinary case tests presentation, not behavior. A harmless reword would break it.
    5. The message is the sole discriminator in only one situation: the same error class can be raised from multiple sites reachable in the same execution path.
    6. In that situation, the class cannot show which site raised. The error may come from the intended condition or from an incidental one elsewhere in the path.

    ## How to apply

    1. For each `assert_raises`, ask: *can this exact error class be raised from more than one site along this actuation's execution?*
    2. If no, class and condition suffice. Assert no message.
    3. Example of no: the empty-file guard's lone `Upload::Error`, with one `raise` site on the empty-file path.
    4. Example of no: a response check that always raises from a single line.
    5. If yes, the message is the discriminator. Assert its exact content.
    6. Example of yes: a multi-part `Upload#call` can raise `Upload::Error` at the head part or the tail part. The message (which part, which response) confirms the intended failure.
    7. Example of yes: a two-step upload can raise `Upload::Error` from the initial post's "rejected" site or the finalize step's "rejected" site.
    8. **Why:** error tests stay about error correctness, not presentation. This gives a precise, testable criterion for when library-specific error classes are "self-evidently the right failure and need no message".

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Assert an error's message content only where the message is the only way for the test to determine that the correct error was raised under the expected conditions.
    2. Where the message is not the only way to determine that the correct error was raised under the expected conditions, do not assert the message.
    3. Treat the message as the sole discriminator only when the same error class is raised from multiple sites reachable in the same execution path.
    4. For each `assert_raises`, ask whether this exact error class can be raised from more than one site along this actuation's execution.
    5. When the error class can be raised from only one site along the actuation's execution, rely on the class (`assert_raises(SomeClass)`) plus the test's condition setup to confirm the error, and assert no message.
    6. When the same error class can be raised from more than one site along the actuation's execution, assert the error's message.
    7. When asserting an error's message, assert its exact content.
    8. Keep error tests about error correctness (whether the right failure was raised under the right condition), not error presentation (the wording).

### Checker A

    1. kept — "Assert an error's message content only when the message is the only way to confirm the correct error was raised under the expected conditions."
    2. kept — "Otherwise, do not assert the message."
    3. kept — "The message is the sole discriminator in only one situation: the same error class can be raised from multiple sites reachable in the same execution path."
    4. kept — "For each `assert_raises`, ask: *can this exact error class be raised from more than one site along this actuation's execution?*"
    5. kept — "If no, class and condition suffice. Assert no message." together with "`assert_raises(SomeClass)` plus the test's condition setup already confirms the right error."
    6. kept — "If yes, the message is the discriminator. Assert its exact content."
    7. kept — "Assert its exact content." This sits in the "If yes" step, which is the only case where a message is asserted, so it covers every message assertion.
    8. kept — "**Why:** error tests stay about error correctness, not presentation." and "A message assertion in that ordinary case tests presentation, not behavior."

### Checker B

    All eight directives are kept. None is less precise or lost.

    1. kept — "Assert an error's message content only when the message is the only way to confirm the correct error was raised under the expected conditions."
    2. kept — "Otherwise, do not assert the message."
    3. kept — "The message is the sole discriminator in only one situation: the same error class can be raised from multiple sites reachable in the same execution path."
    4. kept — "For each `assert_raises`, ask: *can this exact error class be raised from more than one site along this actuation's execution?*"
    5. kept — "If no, class and condition suffice. Assert no message." together with "`assert_raises(SomeClass)` plus the test's condition setup already confirms the right error."
    6. kept — "If yes, the message is the discriminator. Assert its exact content."
    7. kept — "Assert its exact content." This sits in the "if yes" branch. Directive 1 allows a message assertion only in that branch, so the shorter version requires the same behavior.
    8. kept — "error tests stay about error correctness, not presentation" together with "A message assertion in that ordinary case tests presentation, not behavior."

## context-only-for-local-instrumentation

### The compressor's answer

    1. A `test` block holds exactly one assertion and nothing else, per the test-block-is-assertion-only rule.
    2. Naming an outcome does not require a `context` block. TestBench lets a test carry its own name: `test "Outcome name" do … end`.
    3. Enclose a test in a named `context` only when the outcome needs local instrumentation. Otherwise name the test directly.
    4. Local instrumentation means an explaining variable of the outcome's own.
    5. Local instrumentation also means a `comment` or `detail` specific to that outcome.
    6. Also use a named `context` where it is a leading `When …` condition, promoted to a context per the error-test-named-fails-condition-is-context rule.
    7. The `When` exception covers only a leading `When …`.
    8. A context named `"When the file is empty"` stays a context, with `test "Fails"` inside, even though it holds nothing but the test.
    9. An outcome name that merely contains "when" is not a condition context. Examples are `"Created when the file is accepted"` and `"Located when the response carries a location"`.
    10. Such a name flattens to a directly named test, as in `test "Created when the file is accepted" do …`.
    11. When the outcome is a single assertion over values already in scope, name the `test` directly and use no context.
    12. Values already in scope are the shared controls and actuation at the top of the feature context.

    ```ruby
    # No local setup needed → named test, no context
    test "Is the location the response carries" do
      assert(location == control_location)
    end

    # Local explaining variable / detail needed → context holds it
    context "Status" do
      status = result.status
      detail status.inspect
      test do
        assert(status == 201)
      end
    end
    ```

    13. When flattening an over-nested test, flatten only where there is no code between the context and the `test`.
    14. Do not flatten a context that is a leading `When …` condition.
    15. **Why:** a context should mean "there is local instrumentation here." A context holding only a bare test adds a nesting level that carries no information, and the name belongs on the test.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A `test` block must hold exactly one assertion and nothing else.
    2. Naming an outcome does not require a `context` block; a test may carry its own name, as in `test "Outcome name" do … end`.
    3. Use a named `context` to enclose a `test` when that outcome needs local instrumentation: an explaining variable of its own, or a `comment` or `detail` specific to it.
    4. Use a named `context` to enclose a `test` where the context is a leading `When …` condition, meaning a condition promoted to a context.
    5. A context named with a leading `When …` (e.g. `"When the file is empty"`) stays a context, with `test "Fails"` inside, even when it holds nothing but the test.
    6. An outcome name that only contains "when" partway through (e.g. `"Created when the file is accepted"`) is not a condition context. It is an outcome name, and it must be flattened to a directly named test, e.g. `test "Created when the file is accepted" do …`.
    7. Where the outcome is a single assertion over values already in scope (the shared controls and actuation at the top of the feature context), name the `test` directly and use no context.
    8. Do not wrap a bare `test` in a `context "name"` when the assertion is the context's only content. Put the name on the `test` instead.
    9. Use contexts only for outcomes that actually use a local variable or add local narration.
    10. By default, name the `test` directly. Use a `context` only where the outcome uses its own explaining variable, adds an outcome-local `comment` or `detail`, or is a leading `When …` condition.
    11. When flattening an over-nested test, flatten only where there is no code between the context and the `test`, so that the context holds nothing but the test.
    12. When flattening an over-nested test, do not flatten a context that is a leading `When …` condition.

### Checker A

    1. kept: "A `test` block holds exactly one assertion and nothing else"
    2. kept: "Naming an outcome does not require a `context` block. TestBench lets a test carry its own name: `test "Outcome name" do … end`"
    3. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation" / "Local instrumentation means an explaining variable of the outcome's own." / "Local instrumentation also means a `comment` or `detail` specific to that outcome."
    4. kept: "Also use a named `context` where it is a leading `When …` condition, promoted to a context"
    5. kept: "A context named `"When the file is empty"` stays a context, with `test "Fails"` inside, even though it holds nothing but the test."
    6. kept: "An outcome name that merely contains "when" is not a condition context." / "The `When` exception covers only a leading `When …`." / "Such a name flattens to a directly named test, as in `test "Created when the file is accepted" do …`"
    7. kept: "When the outcome is a single assertion over values already in scope, name the `test` directly and use no context." / "Values already in scope are the shared controls and actuation at the top of the feature context."
    8. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation. Otherwise name the test directly." / "A context holding only a bare test adds a nesting level that carries no information, and the name belongs on the test."
    9. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation" / "a `comment` or `detail` specific to that outcome"
    10. kept: "Otherwise name the test directly." / "only when the outcome needs local instrumentation" / "Also use a named `context` where it is a leading `When …` condition"
    11. less precise: "flatten only where there is no code between the context and the `test`". Missing: "so that the context holds nothing but the test". Without it, code after the test inside the context is not clearly ruled out.
    12. kept: "Do not flatten a context that is a leading `When …` condition."

### Checker B

    1. kept: "A `test` block holds exactly one assertion and nothing else"
    2. kept: "Naming an outcome does not require a `context` block. TestBench lets a test carry its own name: `test "Outcome name" do … end`"
    3. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation" / "Local instrumentation means an explaining variable of the outcome's own" / "Local instrumentation also means a `comment` or `detail` specific to that outcome"
    4. kept: "Also use a named `context` where it is a leading `When …` condition, promoted to a context"
    5. kept: "A context named `"When the file is empty"` stays a context, with `test "Fails"` inside, even though it holds nothing but the test" (generalized by "Also use a named `context` where it is a leading `When …` condition")
    6. kept: "An outcome name that merely contains "when" is not a condition context" / "Such a name flattens to a directly named test, as in `test "Created when the file is accepted" do …`" / "The `When` exception covers only a leading `When …`" (this last line stands in for "partway through")
    7. kept: "When the outcome is a single assertion over values already in scope, name the `test` directly and use no context" / "Values already in scope are the shared controls and actuation at the top of the feature context"
    8. kept: "Otherwise name the test directly" / "A context holding only a bare test adds a nesting level that carries no information, and the name belongs on the test"
    9. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation" with items 4 and 5 defining local instrumentation as an explaining variable or an outcome-specific `comment`/`detail`
    10. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation. Otherwise name the test directly" / "Also use a named `context` where it is a leading `When …` condition"
    11. less precise: "When flattening an over-nested test, flatten only where there is no code between the context and the `test`". Missing: the purpose clause "so that the context holds nothing but the test". Without it, code after the test, which is not "between", seems not to block flattening.
    12. kept: "Do not flatten a context that is a leading `When …` condition"

### The re-check, after the repairs

    All 12 directives are kept. None is less precise and none is lost.

    1. kept: "A `test` block holds exactly one assertion and nothing else"
    2. kept: "Naming an outcome does not require a `context` block. TestBench lets a test carry its own name: `test "Outcome name" do … end`"
    3. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation"; "Local instrumentation means an explaining variable of the outcome's own"; "Local instrumentation also means a `comment` or `detail` specific to that outcome"
    4. kept: "Also use a named `context` where it is a leading `When …` condition, promoted to a context"
    5. kept: "A context named `"When the file is empty"` stays a context, with `test "Fails"` inside, even though it holds nothing but the test"
    6. kept: "An outcome name that merely contains "when" is not a condition context"; "The `When` exception covers only a leading `When …`"; "Such a name flattens to a directly named test, as in `test "Created when the file is accepted" do …`". The shorter version says "flattens" where the directive says "must be flattened". "Otherwise name the test directly" still requires the same behavior.
    7. kept: "When the outcome is a single assertion over values already in scope, name the `test` directly and use no context"; "Values already in scope are the shared controls and actuation at the top of the feature context"
    8. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation. Otherwise name the test directly"; "A context holding only a bare test adds a nesting level that carries no information, and the name belongs on the test"
    9. kept: "Enclose a test in a named `context` only when the outcome needs local instrumentation"; "an explaining variable of the outcome's own"; "a `comment` or `detail` specific to that outcome"
    10. kept: "Otherwise name the test directly"; "an explaining variable of the outcome's own"; "a `comment` or `detail` specific to that outcome"; "Also use a named `context` where it is a leading `When …` condition"
    11. kept: "When flattening an over-nested test, flatten only where there is no code between the context and the `test`, so the context holds nothing but the test"
    12. kept: "Do not flatten a context that is a leading `When …` condition"

## control-prefix-test-vars

### The compressor's answer

    1. In test code, a control is anything from `Controls::*`.
    2. Name a local variable that holds a control-built value with a `control_` prefix, as in `control_file` and `control_response`.
    3. This applies whenever you write or edit a test.
    4. Do not give such a local a bare name, such as `value` or `name`.
    5. **Why:** The existing tests already use this naming, and the prefix shows at a glance which values come from controls. It also reinforces that these helpers are controls.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. In test code, give a `control_` prefix to the name of any local variable that holds a value built by a control (anything from `Controls::*`), as in `control_file` and `control_response`.
    2. Do not give a local variable bound to a control's output a bare name (such as `value` or `name`) in a test.

### Checker A

    1. kept — "In test code, a control is anything from `Controls::*`." + "Name a local variable that holds a control-built value with a `control_` prefix, as in `control_file` and `control_response`." + "This applies whenever you write or edit a test."
    2. kept — "Do not give such a local a bare name, such as `value` or `name`."

### Checker B

    1. kept — "In test code, a control is anything from `Controls::*`." / "Name a local variable that holds a control-built value with a `control_` prefix, as in `control_file` and `control_response`."
    2. kept — "Do not give such a local a bare name, such as `value` or `name`." (with "This applies whenever you write or edit a test.")

## control-string-value-starts-with-some

### The compressor's answer

    1. A control may hold a string value: a literal used as test input, not a constant name.
    2. The string value starts with "some", as in `control_file = "some file"`, not `"a file"`.
    3. "some" marks the value as an arbitrary placeholder whose content does not matter.
    4. A bare string value is lowercase: `"some file"`, `"some other file"`.
    5. This differs from example constant names, which are capitalized: `"SomeModule"`, `"SomeOtherModule"`.
    6. Write `control_file = "some file"`, `"some other file"`, and so on for placeholder string values.
    7. Use specific string content only when the test actually depends on it.
    8. Non-string placeholder values, such as a number, are not covered, because they have no "some" form.
    9. **Why:** "some" signals that any value would do. That matches the `control_` prefix's intent, where the test turns on the value's identity, not its content.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A control's string value (a literal value used as test input rather than a constant name) must start with "some", as in `control_file = "some file"` and not `"a file"`.
    2. A bare string value used as a control's placeholder must be lowercase, as in `"some file"`, `"some other file"`, unlike example constant names, which are capitalized (`"SomeModule"`, `"SomeOtherModule"`).
    3. Additional placeholder string values in a test take the "some other …" form, as in `"some other file"`.
    4. Use specific string content in a control's value only when the test actually depends on that content.
    5. Non-string placeholder values, such as a number, are not covered by the "some" convention and need not take a "some" form.

### Checker A

    1. kept — "The string value starts with "some", as in `control_file = "some file"`, not `"a file"`." together with "A control may hold a string value: a literal used as test input, not a constant name."
    2. kept — "A bare string value is lowercase: `"some file"`, `"some other file"`." together with "This differs from example constant names, which are capitalized: `"SomeModule"`, `"SomeOtherModule"`."
    3. less precise — "Write `control_file = "some file"`, `"some other file"`, and so on for placeholder string values." Missing: it shows "some other …" only as an example and never says that each additional placeholder in a test takes that form.
    4. kept — "Use specific string content only when the test actually depends on it."
    5. kept — "Non-string placeholder values, such as a number, are not covered, because they have no "some" form."

### Checker B

    1. kept — "A control may hold a string value: a literal used as test input, not a constant name." / "The string value starts with \"some\", as in `control_file = \"some file\"`, not `\"a file\"`."
    2. kept — "A bare string value is lowercase: `\"some file\"`, `\"some other file\"`." / "This differs from example constant names, which are capitalized: `\"SomeModule\"`, `\"SomeOtherModule\"`."
    3. less precise — "Write `control_file = \"some file\"`, `\"some other file\"`, and so on for placeholder string values." Missing: it shows "some other file" only as an example in a list. It never says that additional placeholder values in a test must take the "some other …" form.
    4. kept — "Use specific string content only when the test actually depends on it."
    5. kept — "Non-string placeholder values, such as a number, are not covered, because they have no \"some\" form."

### The re-check, after the repairs

    The shorter version keeps all five directives. None is less precise or lost.

    1 — kept — "The string value starts with "some", as in `control_file = "some file"`, not `"a file"`." The meaning of a control's string value is carried by "A control may hold a string value: a literal used as test input, not a constant name."
    2 — kept — "A bare string value is lowercase: `"some file"`, `"some other file"`." and "This differs from example constant names, which are capitalized: `"SomeModule"`, `"SomeOtherModule"`."
    3 — kept — "Write each further placeholder in the "some other …" form, as in `"some other file"`."
    4 — kept — "Use specific string content only when the test actually depends on it."
    5 — kept — "Non-string placeholder values, such as a number, are not covered, because they have no "some" form." The shorter version gives a reason ("have no "some" form") where the directive says they "need not take" one. Either way, no "some" form is required.

## controls-not-factories-fixtures-arrange

### The compressor's answer

    1. The known, deterministic inputs a test is built from are all **controls**.
    2. Helpers that build example values are **controls**, never "factories".
    3. The example values they produce, and any literal known inputs, are **controls** or control values, never "fixtures".
    4. The setup phase, which establishes the known inputs before the actuation, is the **control** of the test.
    5. Never call the setup phase "arrange" or "arrangement". The noun form carries the same meaning as the verb.
    6. A test reads **control → actuate → observe**. The assertion is only *how* the outcome is observed.
    7. Apply this in prose, comments, docs, and dialogue.
    8. Never say "factory", "factories", "fixture", "fixtures", "arrange", or "arrangement" for these concepts.
    9. Where a test framework has its own `Fixture` context object, the known input values are still controls, not fixtures.
    10. **Why:** "controls" is the established vocabulary of controls-based testing. The other terms are imported jargon that a reader has to map back onto the one concept.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Use the one term "controls" for all of the known, deterministic inputs a test is built from: the helpers that build example values, the example values themselves, and the pre-actuation setup phase where they are established.
    2. Call the helpers that build example values in a test "controls", never "factories", in prose, comments, docs, and dialogue.
    3. Call the example values those helpers produce, and any literal known inputs, "controls" or "control values", never "fixtures", in prose, comments, docs, and dialogue.
    4. Call the setup phase of a test, where the known inputs are established before the actuation, the "control" of the test, never "arrange" and never "arrangement".
    5. A test reads control → actuate → observe, and the assertion is only how the outcome is observed.
    6. Where a test framework has its own `Fixture` context object, the known input values are still called controls, not fixtures.
    7. Never use the words "factory", "factories", "fixture", "fixtures", "arrange", or "arrangement" in prose, comments, docs, or dialogue about tests. The noun form "arrangement" is excluded as well as the verb "arrange", because the noun carries the same meaning as the verb.

### Checker A

    1. kept: "The known, deterministic inputs a test is built from are all **controls**." Items 2 to 4 of the shorter version then name the helpers, the values and the setup phase one by one.
    2. kept: "Helpers that build example values are **controls**, never \"factories\"." The scope comes from "Apply this in prose, comments, docs, and dialogue."
    3. kept: "The example values they produce, and any literal known inputs, are **controls** or control values, never \"fixtures\"." The scope comes from "Apply this in prose, comments, docs, and dialogue."
    4. kept: "The setup phase, which establishes the known inputs before the actuation, is the **control** of the test." and "Never call the setup phase \"arrange\" or \"arrangement\"."
    5. kept: "A test reads **control → actuate → observe**. The assertion is only *how* the outcome is observed."
    6. kept: "Where a test framework has its own `Fixture` context object, the known input values are still controls, not fixtures."
    7. less precise: "Never say \"factory\", \"factories\", \"fixture\", \"fixtures\", \"arrange\", or \"arrangement\" for these concepts." and "The noun form carries the same meaning as the verb." Missing: the original bans these words anywhere in prose, comments, docs or dialogue about tests. "For these concepts" narrows that to uses that name these concepts. The shorter version also states the scope ("Apply this in prose, comments, docs, and dialogue.") as a separate line, so it is not explicit that the scope covers this ban.

### Checker B

    1 — kept — "The known, deterministic inputs a test is built from are all **controls**." Together with lines 2–4, which name the helpers, the values, and the setup phase as controls.
    2 — kept — "Helpers that build example values are **controls**, never \"factories\"." and "Apply this in prose, comments, docs, and dialogue."
    3 — kept — "The example values they produce, and any literal known inputs, are **controls** or control values, never \"fixtures\"." and "Apply this in prose, comments, docs, and dialogue."
    4 — kept — "The setup phase, which establishes the known inputs before the actuation, is the **control** of the test." and "Never call the setup phase \"arrange\" or \"arrangement\"."
    5 — kept — "A test reads **control → actuate → observe**. The assertion is only *how* the outcome is observed."
    6 — kept — "Where a test framework has its own `Fixture` context object, the known input values are still controls, not fixtures."
    7 — less precise — "Never say \"factory\", \"factories\", \"fixture\", \"fixtures\", \"arrange\", or \"arrangement\" for these concepts." and "The noun form carries the same meaning as the verb." Missing: the original bans these words anywhere in talk about tests. "for these concepts" bans them only when they name these concepts, which is narrower. The shorter version also never says outright that the noun is banned *because* it carries the verb's meaning; that link is only implied by the two sentences sitting next to each other.

### The re-check, after the repairs

    1 — kept — "The known, deterministic inputs a test is built from are all **controls**." The three parts are carried by "Helpers that build example values are **controls**", "The example values they produce ... are **controls**", and "The setup phase ... is the **control** of the test."
    2 — kept — "Helpers that build example values are **controls**, never "factories"." together with "Apply this in prose, comments, docs, and dialogue."
    3 — kept — "The example values they produce, and any literal known inputs, are **controls** or control values, never "fixtures"." together with "Apply this in prose, comments, docs, and dialogue."
    4 — kept — "The setup phase, which establishes the known inputs before the actuation, is the **control** of the test." and "Never call the setup phase "arrange" or "arrangement"."
    5 — kept — "A test reads **control → actuate → observe**. The assertion is only *how* the outcome is observed."
    6 — kept — "Where a test framework has its own `Fixture` context object, the known input values are still controls, not fixtures."
    7 — kept — "In talk about tests, never say "factory", "factories", "fixture", "fixtures", "arrange", or "arrangement"." together with "Apply this in prose, comments, docs, and dialogue." The reason for excluding the noun is carried by "The noun form carries the same meaning as the verb."

## do-not-test-the-platform

### The compressor's answer

    1. Test the library's own behavior and decisions, not the language or system it sits on.
    2. A unit is a transparent pass-through on a path when it adds no branch, guard, normalization, or policy there and just forwards to a platform primitive.
    3. On such a path, the unit's behavior is the platform's, so a test there tests the platform, not the library.
    4. The signal: you can state the expected behavior only through the primitive's guarantee ("`String#empty?` returns true for an empty string").
    5. When that signal holds, nothing of ours is at risk on that path, so write no test.
    6. Example: `Upload#empty?(file)` is `file.empty?`, which forwards to the string primitive and adds no branch, guard, or normalization.
    7. Its emptiness behavior is therefore `String#empty?`'s exactly: true for `""` and false for any other content.
    8. Once `#empty?` has been decided to stay transparent to Ruby, there is no library emptiness behavior, and an "empty string is empty" test would only test Ruby.
    9. The resolution is the decision to stay transparent, not a test.
    10. When a unit adds a policy, that policy is the library's own decision, and it must be tested.
    11. Example policies that must be tested: `Upload#call`'s guard `raise Error, "File is empty" if file.empty?`, which raises `Upload::Error` on an empty file, a coercion that normalizes the file, and a suppressed warning.
    12. The bare `file.empty?` forwarding underneath those policies is not tested.
    13. **Why:** Tests exist to prevent regressions in the library's design and decisions. Testing the platform adds noise, couples the suite to language internals, and gives false confidence when none of our code ran.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Test the library's own behavior and decisions, not the language or system it sits on.
    2. A unit counts as a transparent pass-through to a platform primitive on a path only if it adds no branch, guard, normalization, or policy of its own on that path and just forwards to the primitive.
    3. If you can only state a unit's expected behavior in terms of the underlying primitive's guarantee (for example, "`String#empty?` returns true for an empty string"), and the unit adds nothing of its own on that path, write no test for that path.
    4. When a unit has been decided to stay transparent to the platform, that decision is the resolution, not a test.
    5. When a unit adds a policy of its own (such as a guard that raises an error, a coercion that normalizes input, or a suppressed warning), test that policy.
    6. Do not test the bare forwarding to the platform primitive that sits underneath a tested policy.

### Checker A

    1 — kept — "Test the library's own behavior and decisions, not the language or system it sits on."

    2 — less precise — "A unit is a transparent pass-through on a path when it adds no branch, guard, normalization, or policy there and just forwards to a platform primitive." Missing: the original's "only if" makes these conditions necessary. "When" only makes them sufficient, so it does not exclude other routes to counting as transparent.

    3 — less precise — "The signal: you can state the expected behavior only through the primitive's guarantee" / "When that signal holds, nothing of ours is at risk on that path, so write no test." Missing: the original requires two conditions together, the guarantee-only statement and the unit adding nothing of its own on that path. The shorter version makes the signal alone sufficient and only claims the second condition follows from it, instead of requiring it.

    4 — kept — "Once `#empty?` has been decided to stay transparent to Ruby, ..." / "The resolution is the decision to stay transparent, not a test."

    5 — kept — "When a unit adds a policy, that policy is the library's own decision, and it must be tested." / "Example policies that must be tested: ... guard ... a coercion that normalizes the file, and a suppressed warning."

    6 — kept — "The bare `file.empty?` forwarding underneath those policies is not tested." (Less general in wording, since it names the example, but together with lines 3 and 5 it requires the same behavior.)

### Checker B

    1. kept — "Test the library's own behavior and decisions, not the language or system it sits on."

    2. less precise — "A unit is a transparent pass-through on a path when it adds no branch, guard, normalization, or policy there and just forwards to a platform primitive." Missing: the directive says "only if", which makes the condition required, but "when" only makes it enough. "Of its own" is also dropped.

    3. less precise — "The signal: you can state the expected behavior only through the primitive's guarantee (\"`String#empty?` returns true for an empty string\")" and "When that signal holds, nothing of ours is at risk on that path, so write no test." Missing: the directive requires both conditions, the "only through the primitive" signal and the unit adding nothing of its own. Line 5 makes the signal alone enough. The second condition is only implied by "On such a path" in line 3.

    4. kept — "Once `#empty?` has been decided to stay transparent to Ruby, there is no library emptiness behavior" and "The resolution is the decision to stay transparent, not a test."

    5. kept — "When a unit adds a policy, that policy is the library's own decision, and it must be tested." and "Example policies that must be tested: `Upload#call`'s guard `raise Error, \"File is empty\" if file.empty?` ... a coercion that normalizes the file, and a suppressed warning."

    6. kept — "The bare `file.empty?` forwarding underneath those policies is not tested."

### The re-check, after the repairs

    All six directives are kept in the shorter version. Nothing is lost or less precise.

    1. kept: "Test the library's own behavior and decisions, not the language or system it sits on."
    2. kept: "A unit is a transparent pass-through on a path only when it adds no branch, guard, normalization, or policy there and just forwards to a platform primitive."
    3. kept: "The signal: you can state the expected behavior only through the primitive's guarantee (\"`String#empty?` returns true for an empty string\")." together with "When that signal holds and the unit adds nothing of its own on that path, nothing of ours is at risk, so write no test."
    4. kept: "The resolution is the decision to stay transparent, not a test." with "Once `#empty?` has been decided to stay transparent to Ruby, there is no library emptiness behavior". Line 9 states it generally, though it comes right after the `#empty?` example.
    5. kept: "When a unit adds a policy, that policy is the library's own decision, and it must be tested." with "Example policies that must be tested: `Upload#call`'s guard ... a coercion that normalizes the file, and a suppressed warning."
    6. kept: "The bare `file.empty?` forwarding underneath those policies is not tested." This is said through the example, but the general rule follows from it together with lines 3 and 5.

## error-test-named-fails-condition-is-context

### The compressor's answer

    1. When a test asserts that the actuation raises an error (an `assert_raises`), name the `test` block "Fails".
    2. When a test asserts that the actuation does not raise, name the `test` block "Doesn't fail".
    3. Do not put the condition under which the actuation fails, or doesn't, in the test name.
    4. Promote that condition to a `context` that encloses the test and names the condition.
    5. A test name that wants the word "when" signals a condition. Lift that "when" clause into the `context`.

    ```ruby
    context "When the name is not defined" do
      test "Fails" do
        assert_raises(SomeError) { actuation }
      end
    end
    ```

    6. Several conditions over the same actuation sit as sibling `When …` contexts, each with its own `test "Fails"`.
    7. "Fails" is a plain outcome name, not an "Is" case. It does not conflict with the "Is"-naming rule, which reserves "Is" for value-equals.
    8. An error test is the deliberate exception to the context-only-for-local-instrumentation rule. Its enclosing context is not empty, because it carries the condition.
    9. **Why:** an error outcome states "under condition X, the actuation fails." The scenario belongs in a context and the observed fact in the test. "Fails" names the behavior directly and keeps test names uniform.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When a test's assertion is that the actuation raises an error (an `assert_raises`), the `test` block's name is "Fails".
    2. When a test's assertion is that the actuation does not raise an error, the `test` block's name is "Doesn't fail".
    3. In an error test ("Fails" or "Doesn't fail"), the condition under which the actuation fails or doesn't fail is not part of the test name.
    4. In an error test, the condition under which the actuation fails or doesn't fail goes into a `context` that encloses the test.
    5. The `context` that encloses an error test is named for the condition, as a "When …" clause (e.g. `context "When the name is not defined"`).
    6. If a test's name wants the word "when", lift that "when" clause into an enclosing `context`, and name the `test` "Fails" or "Doesn't fail".
    7. Several conditions over the same actuation may sit as sibling "When …" contexts, each with its own `test "Fails"`.
    8. An error test is named for the actuation's behavior ("Fails" / "Doesn't fail"), not with "Is"; "Is" is reserved for value-equals.
    9. Do not enclose a single-assertion test in a context that holds nothing.
    10. An error test is the exception to the rule against enclosing a single-assertion test in a context: it must be enclosed in a context that carries its condition, since that context is the only place the condition can go.

### Checker A

    1. kept: "When a test asserts that the actuation raises an error (an `assert_raises`), name the `test` block "Fails"."
    2. kept: "When a test asserts that the actuation does not raise, name the `test` block "Doesn't fail"."
    3. kept: "Do not put the condition under which the actuation fails, or doesn't, in the test name."
    4. kept: "Promote that condition to a `context` that encloses the test"
    5. less precise: "names the condition", "Lift that "when" clause into the `context`", `context "When the name is not defined"`, "sibling `When …` contexts". Missing: it never says outright that the context name takes the form of a "When …" clause. That form appears only in the example and the sibling-contexts line.
    6. kept: "A test name that wants the word "when" signals a condition. Lift that "when" clause into the `context`." Naming the test "Fails" or "Doesn't fail" is carried by items 1 and 2: "name the `test` block "Fails"" and "name the `test` block "Doesn't fail"".
    7. kept: "Several conditions over the same actuation sit as sibling `When …` contexts, each with its own `test "Fails"`."
    8. kept: ""Fails" is a plain outcome name, not an "Is" case. It does not conflict with the "Is"-naming rule, which reserves "Is" for value-equals."
    9. less precise: "the context-only-for-local-instrumentation rule", "Its enclosing context is not empty". Missing: the general prohibition (do not wrap a single-assertion test in a context that holds nothing) is not stated. It is only pointed to by the other rule's name.
    10. kept: "An error test is the deliberate exception to the context-only-for-local-instrumentation rule. Its enclosing context is not empty, because it carries the condition." Item 4 carries the requirement: "Promote that condition to a `context` that encloses the test".

### Checker B

    1. kept: "When a test asserts that the actuation raises an error (an `assert_raises`), name the `test` block "Fails"."
    2. kept: "When a test asserts that the actuation does not raise, name the `test` block "Doesn't fail"."
    3. kept: "Do not put the condition under which the actuation fails, or doesn't, in the test name."
    4. kept: "Promote that condition to a `context` that encloses the test"
    5. less precise: "names the condition"; `context "When the name is not defined"` (example); "sibling `When …` contexts". Missing: the "When …" clause form is only shown in the example and item 6. No directive requires it.
    6. kept: "A test name that wants the word "when" signals a condition. Lift that "when" clause into the `context`." Items 1 and 2 then require the test to be named "Fails" or "Doesn't fail".
    7. kept: "Several conditions over the same actuation sit as sibling `When …` contexts, each with its own `test "Fails"`."
    8. kept: ""Fails" is a plain outcome name, not an "Is" case. It does not conflict with the "Is"-naming rule, which reserves "Is" for value-equals."
    9. less precise: "the deliberate exception to the context-only-for-local-instrumentation rule"; "Its enclosing context is not empty". Missing: the ban on wrapping a single-assertion test in a context that holds nothing is never stated. It is only implied through a rule cited by name.
    10. kept: "An error test is the deliberate exception to the context-only-for-local-instrumentation rule. Its enclosing context is not empty, because it carries the condition." Item 4 ("Promote that condition to a `context` that encloses the test") and item 3 together require the enclosure, and they leave the context as the only place for the condition.

### The re-check, after the repairs

    1. kept: "When a test asserts that the actuation raises an error (an `assert_raises`), name the `test` block "Fails"."
    2. kept: "When a test asserts that the actuation does not raise, name the `test` block "Doesn't fail"."
    3. kept: "Do not put the condition under which the actuation fails, or doesn't, in the test name."
    4. kept: "Promote that condition to a `context` that encloses the test"
    5. kept: "names the condition as a "When …" clause", plus the example `context "When the name is not defined"`
    6. kept: "A test name that wants the word "when" signals a condition. Lift that "when" clause into the `context`." Naming the test "Fails" or "Doesn't fail" is not repeated in item 5, but items 1 and 2 ("name the `test` block "Fails"" / ""Doesn't fail"") require it.
    7. kept: "Several conditions over the same actuation sit as sibling `When …` contexts, each with its own `test "Fails"`."
    8. kept: ""Fails" is a plain outcome name, not an "Is" case. It does not conflict with the "Is"-naming rule, which reserves "Is" for value-equals."
    9. less precise: "the deliberate exception to the context-only-for-local-instrumentation rule. Its enclosing context is not empty". Missing: the shorter version never states the prohibition itself. It only points to it through the rule's name and through "not empty".
    10. kept: "An error test is the deliberate exception to the context-only-for-local-instrumentation rule. Its enclosing context is not empty, because it carries the condition." The phrase "the only place the condition can go" is not stated, but items 3 and 4 together require the same behavior: the condition is kept out of the name and must go into the enclosing context.

## normal-path-and-exceptional-paths-are-separate-files

### The compressor's answer

    1. A feature's normal path is its ordinary, non-raising course through it.
    2. The normal path's test and each exceptional path's test live in separate files.
    3. A feature with one normal path and one exceptional path is two files. It is not one file with two contexts.
    4. A test file actuates the concern once, at the top of the feature context. See the tdd-test-structure rule.
    5. Each outcome of that one actuation is asserted in its own nested context.
    6. An exceptional path cannot share the normal path's actuation. Its actuation is inside an `assert_raises` and produces no result to observe.
    7. Naming follows the existing file conventions.
    8. Where a feature has a normal path and one or more exceptional paths, the feature takes a folder.
    9. Each file in the folder is named for the case it distinguishes. See the single-case-test-named-for-feature rule.
    10. The normal-path file is named for the feature.
    11. Each exceptional-path file is named for the condition under which the actuation fails.
    12. That condition is also promoted to a `context` inside the exceptional-path file.
    13. The test in that context is named `Fails`. See the error-test-named-fails-condition-is-context rule.
    14. An exceptional-path file holds only its one exceptional case.
    15. An exceptional-path file does not re-prove the normal path.
    16. Controls in an exceptional-path file that also appear on the normal path serve only to make the failure discriminating.
    17. Discriminating means the raised error can be told from a different failure of the same class.
    18. Do not add a second, raising actuation to a normal-path file.
    19. **Why:** a file holds one set of controls and one actuation. Separate files make failure modes findable by filename, and keep normal-path files from accumulating exceptional cases.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A feature's normal-path test and the test of each of its exceptional paths must live in separate files.
    2. A feature with one normal path and one exceptional path must be two files, not one file with two contexts.
    3. A test file must actuate the concern once, at the top of the feature context.
    4. A test file must assert each outcome of its one actuation in its own nested context.
    5. An exceptional path must not share the normal path's actuation.
    6. Test files must be named according to the existing file conventions.
    7. Where a feature has a normal path and one or more exceptional paths, the feature must take a folder.
    8. Each file in a feature's folder must be named for the case it distinguishes.
    9. The normal-path file must be named for the feature.
    10. Each exceptional-path file must be named for the condition under which the actuation fails.
    11. The failure condition must also be promoted to a `context` inside the exceptional-path file.
    12. The test inside an exceptional-path file must be named `Fails`.
    13. An exceptional-path file must contain only its one exceptional case.
    14. The normal path must not be re-proven in an exceptional-path file.
    15. Where an exceptional-path file's controls include values that also appear on the normal path, those values must be there only to make the failure discriminating (so the raised error can be told from a different failure of the same class), not to establish the normal path a second time.
    16. A raising actuation must not be mixed with a non-raising one in the same file.
    17. The normal path's proof must be kept in its own file.
    18. A second, raising actuation must not be added to a normal-path file.

### Checker A

    1 — kept — "The normal path's test and each exceptional path's test live in separate files."
    2 — kept — "A feature with one normal path and one exceptional path is two files. It is not one file with two contexts."
    3 — kept — "A test file actuates the concern once, at the top of the feature context."
    4 — kept — "Each outcome of that one actuation is asserted in its own nested context."
    5 — kept — "An exceptional path cannot share the normal path's actuation."
    6 — kept — "Naming follows the existing file conventions."
    7 — kept — "Where a feature has a normal path and one or more exceptional paths, the feature takes a folder."
    8 — kept — "Each file in the folder is named for the case it distinguishes."
    9 — kept — "The normal-path file is named for the feature."
    10 — kept — "Each exceptional-path file is named for the condition under which the actuation fails."
    11 — kept — "That condition is also promoted to a `context` inside the exceptional-path file."
    12 — kept — "The test in that context is named `Fails`."
    13 — kept — "An exceptional-path file holds only its one exceptional case."
    14 — kept — "An exceptional-path file does not re-prove the normal path."
    15 — kept — "Controls in an exceptional-path file that also appear on the normal path serve only to make the failure discriminating." / "Discriminating means the raised error can be told from a different failure of the same class."
    16 — kept — "A test file actuates the concern once" together with "The normal path's test and each exceptional path's test live in separate files." (One actuation per file means a raising and a non-raising actuation cannot share a file.)
    17 — kept — "The normal path's test and each exceptional path's test live in separate files."
    18 — kept — "Do not add a second, raising actuation to a normal-path file."

### Checker B

    All 18 directives are kept in the shorter version. None is less precise or lost.

    1. kept — "The normal path's test and each exceptional path's test live in separate files."
    2. kept — "A feature with one normal path and one exceptional path is two files. It is not one file with two contexts."
    3. kept — "A test file actuates the concern once, at the top of the feature context."
    4. kept — "Each outcome of that one actuation is asserted in its own nested context."
    5. kept — "An exceptional path cannot share the normal path's actuation."
    6. kept — "Naming follows the existing file conventions."
    7. kept — "Where a feature has a normal path and one or more exceptional paths, the feature takes a folder."
    8. kept — "Each file in the folder is named for the case it distinguishes."
    9. kept — "The normal-path file is named for the feature."
    10. kept — "Each exceptional-path file is named for the condition under which the actuation fails."
    11. kept — "That condition is also promoted to a `context` inside the exceptional-path file."
    12. kept — "The test in that context is named `Fails`."
    13. kept — "An exceptional-path file holds only its one exceptional case."
    14. kept — "An exceptional-path file does not re-prove the normal path."
    15. kept — "Controls in an exceptional-path file that also appear on the normal path serve only to make the failure discriminating." / "Discriminating means the raised error can be told from a different failure of the same class."
    16. kept — "A test file actuates the concern once" (one actuation per file means a raising and a non-raising actuation cannot share a file); also "a file holds one set of controls and one actuation."
    17. kept — "The normal path's test and each exceptional path's test live in separate files."
    18. kept — "Do not add a second, raising actuation to a normal-path file."

## precondition-documents-deciding-factors-and-reads-inline

### The compressor's answer

    1. A precondition is an `assert` or `refute` that is not a test.
    2. It sits in a context beside the controls and the actuation, not inside a `test` block.
    3. Its purpose is to state the factors that decide a test's outcome when the test script does not clearly express them.
    4. Those factors are most often in the controls. A control is named for itself, not for the properties of the value it produces.
    5. `Controls::Account::Sequence.example` says nothing about which positions that account has already processed. The definition that would say so is in another file.

    ```ruby
    handler = Handlers::Commands::Transactions.new

    deposit = Controls::Commands::Deposit.example

    account = Controls::Account::Sequence.example

    assert(account.processed?(deposit.metadata.global_position))

    handler.store.add(account.id, account)

    handler.(deposit)

    test "Deposited Event is not Written" do
      assert(deposited.nil?)
    end
    ```

    6. Here no event is written because the account has already processed that global position. The precondition states that factor where it is needed.
    7. Write the deciding factor as an assertion, not as a comment. An assertion states the factor and also verifies it, so it cannot silently become false.
    8. A precondition qualifies the test. It does not prevent a regression, and it observes nothing about the unit under test.
    9. When a precondition fails, the test's result is meaningless, not wrong. The unit may be correct, but the test did not exercise what it claims to.
    10. To decide whether one is warranted, ask what determines the outcome and whether the script shows it.
    11. Where a deciding factor is legible on the page, do not add a precondition.
    12. Where the factor sits inside a control, in a prior state, or in a derivation the reader cannot see, write a precondition that surfaces it.
    13. Where a deciding factor is invisible, a test can pass without exercising what it names. Examples: a value already present, a connection already open, a search that finds nothing.
    14. The criterion is whether the deciding factors are legible, not only the risk of a vacuous pass.

    ```ruby
    context "Database Connection" do
      session = MessageStore::Postgres::Session.build

      refute(session.connected?)

      test "Connects on first use" do
        refute_raises do
          session.execute('SELECT 1;')
        end
      end
    end
    ```

    15. Write the predicate inline, with no explaining variable. The assertion's own expression carries the condition and reads as a sentence.
    16. `refute(session.connected?)` reads as *the session is not connected*. `assert(account.processed?(deposit.metadata.global_position))` reads as *the account has processed that position*.
    17. This is a deliberate exception to the test-block-is-assertion-only rule, which requires every operand inside a `test` block to be bound to an explaining variable.
    18. That rule does not apply because a precondition has one operand, and a bound name would only restate the predicate.
    19. Do not write `connected = session.connected?` in front of `refute(connected)`. A precondition carries no name, because its expression is the name.
    20. Where the deciding factor is that an actuation completes, use `assert_raises` or `refute_raises` with a block. The block is the precondition's expression.
    21. In that block, bind nothing and name nothing. Write the actuation in place, not behind a variable.
    22. Place the precondition immediately before what it qualifies.
    23. Place it before the actuation when it documents a factor in the controls or in a prior state.
    24. Place it before the test when it documents a factor in a value derived from the result.

    ```ruby
    deposit_message = write.one_message do |written|
      written.instance_of?(Messages::Commands::Deposit)
    end

    refute(deposit_message.nil?)

    test "Deposit message follows previous message" do
      assert(deposit_message.follows?(previous_message))
    end
    ```

    25. A precondition may assert over the controls, a prior state, a derivation, or the actuation's completion where the controls decide it.
    26. It never asserts over the unit's behavior as an outcome. It is not coverage, and a passing one establishes nothing about the unit.
    27. It falls outside what the do-not-test-the-platform rule weighs and outside what a coverage test is for.
    28. Whether an assertion is a precondition or a test depends on its purpose, not on what it is written over.
    29. `refute_raises` around an actuation is a precondition when the controls would ordinarily make the actuation fail, the setup averts that, and the script does not show it.
    30. It is a test when whether the unit raises is the thing being established. Put that in a `test` block.

    ```ruby
    control_destination = Controls::Constant.example(
      name: "Destination",
      inner_constants: [control_excluded_constant_name]
    )

    refute_raises do
      Constant::Import.(control_source, control_destination, except: control_excluded_constant_name)
    end
    ```

    31. Here the destination owns the excluded name, so without `except:` the import is refused. Nothing else in the script says so.
    32. When writing or reading a test, look at the controls first, because their values are named rather than described.
    33. Do not wrap a precondition in a `test` block. Do not name it, and do not bind its operand.
    34. Do not write a deciding factor as a `comment` in place of a precondition.
    35. **Why:** The controls convention hides how example values are built, so the factors that decide an outcome are often the least visible ones. A test with invisible deciding factors cannot be read, and it can pass without exercising what it names. An assertion is checked where a comment is not. Keeping a precondition a bare assertion, not a named test, keeps it distinct from a claim about how the unit behaves.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A precondition is an `assert` or `refute` that is not a test, and it sits in a context beside the controls and the actuation, not inside a `test` block.
    2. A precondition's purpose is to clarify the deciding factors: it must put into the test script the factor that decides the test's outcome when that factor is not clearly expressed there.
    3. A deciding factor must be documented by asserting it, not by prose narration or a comment.
    4. A precondition must observe nothing about the unit under test. It states only what must already be true for the test's observation to mean anything.
    5. When a precondition fails, the test's result must be read as meaningless, not wrong.
    6. When deciding whether a precondition is warranted, ask what determines the outcome and whether the script shows it.
    7. Where a deciding factor is legible on the page, do not add a precondition, since it adds nothing.
    8. Where a deciding factor sits inside a control, in a prior state, or in a derivation the reader cannot see, surface it with a precondition.
    9. The criterion for a precondition is the legibility of the deciding factors, not only the risk of a vacuous pass.
    10. A precondition's predicate must read inline, with no explaining variable: the assertion's own expression carries the condition.
    11. A precondition is an exception to the test-block-is-assertion-only rule. Its operand must not be bound to an explaining variable first, even though that rule requires it for every operand inside a `test` block.
    12. A precondition carries no name, because its expression is the name.
    13. Where the deciding factor is that an actuation completes, write a bare `assert_raises` or `refute_raises` whose block is the precondition's expression.
    14. In an `assert_raises` or `refute_raises` precondition, nothing is bound and nothing is named, and the actuation is written in place in the block rather than behind a variable.
    15. A precondition must sit immediately before what it qualifies.
    16. A precondition that documents a factor in the controls or in a prior state must sit immediately before the actuation.
    17. A precondition that documents a factor in a value derived from the result must sit immediately before the test.
    18. A precondition may assert over the controls, a prior state, a derivation, or the actuation's completion where the controls are what decide it.
    19. A precondition must never assert over the unit's behavior as an outcome.
    20. A precondition must not be treated as coverage, or as preventing a regression. It is outside what the do-not-test-the-platform rule weighs and outside what a coverage test is for.
    21. Whether an assertion is a precondition or a test must be decided by what the assertion is for, not by what it is written over.
    22. `refute_raises` around an actuation is a precondition when the controls are set so the actuation would ordinarily fail, something in that setup averts it, and the script does not show this.
    23. `refute_raises` around an actuation is a test when whether the unit raises is the thing being established.
    24. When writing or reading a test, look first at the controls for deciding factors, since their values are named rather than described.
    25. Do not wrap a precondition in a `test` block.
    26. Do not write a precondition as a comment instead of an assertion.
    27. Where an actuation's completion is the thing being established, rather than the ground a later observation stands on, it is a test and must go in a `test` block.

### Checker A

    1. kept: "A precondition is an `assert` or `refute` that is not a test." / "It sits in a context beside the controls and the actuation, not inside a `test` block."
    2. kept: "Its purpose is to state the factors that decide a test's outcome when the test script does not clearly express them."
    3. less precise: "Write the deciding factor as an assertion, not as a comment." It excludes only a comment. Prose narration is not excluded.
    4. kept: "it observes nothing about the unit under test" / "A precondition qualifies the test."
    5. kept: "When a precondition fails, the test's result is meaningless, not wrong."
    6. kept: "To decide whether one is warranted, ask what determines the outcome and whether the script shows it."
    7. kept: "Where a deciding factor is legible on the page, do not add a precondition."
    8. kept: "Where the factor sits inside a control, in a prior state, or in a derivation the reader cannot see, write a precondition that surfaces it."
    9. kept: "The criterion is whether the deciding factors are legible, not only the risk of a vacuous pass."
    10. kept: "Write the predicate inline, with no explaining variable. The assertion's own expression carries the condition"
    11. kept: "This is a deliberate exception to the test-block-is-assertion-only rule, which requires every operand inside a `test` block to be bound to an explaining variable." / "do not bind its operand"
    12. kept: "A precondition carries no name, because its expression is the name."
    13. kept: "Where the deciding factor is that an actuation completes, use `assert_raises` or `refute_raises` with a block. The block is the precondition's expression." / "Do not wrap a precondition in a `test` block. Do not name it"
    14. kept: "In that block, bind nothing and name nothing. Write the actuation in place, not behind a variable."
    15. kept: "Place the precondition immediately before what it qualifies."
    16. kept: "Place it before the actuation when it documents a factor in the controls or in a prior state."
    17. kept: "Place it before the test when it documents a factor in a value derived from the result."
    18. kept: "A precondition may assert over the controls, a prior state, a derivation, or the actuation's completion where the controls decide it."
    19. kept: "It never asserts over the unit's behavior as an outcome."
    20. kept: "It does not prevent a regression" / "It is not coverage" / "It falls outside what the do-not-test-the-platform rule weighs and outside what a coverage test is for."
    21. kept: "Whether an assertion is a precondition or a test depends on its purpose, not on what it is written over."
    22. kept: "`refute_raises` around an actuation is a precondition when the controls would ordinarily make the actuation fail, the setup averts that, and the script does not show it."
    23. kept: "It is a test when whether the unit raises is the thing being established."
    24. kept: "When writing or reading a test, look at the controls first, because their values are named rather than described."
    25. kept: "Do not wrap a precondition in a `test` block."
    26. kept: "Do not write a deciding factor as a `comment` in place of a precondition." / "Write the deciding factor as an assertion, not as a comment."
    27. less precise: "It is a test when whether the unit raises is the thing being established. Put that in a `test` block." This covers only `refute_raises`, not an actuation's completion in general. The contrast with "the ground a later observation stands on" is gone.

### Checker B

    1. kept — "A precondition is an `assert` or `refute` that is not a test." / "It sits in a context beside the controls and the actuation, not inside a `test` block."
    2. kept — "Its purpose is to state the factors that decide a test's outcome when the test script does not clearly express them."
    3. kept — "Write the deciding factor as an assertion, not as a comment." (also "Do not write a deciding factor as a `comment` in place of a precondition.") Only a comment is named; "prose narration" is not mentioned separately, but in a test script that would be a comment anyway.
    4. kept — "it observes nothing about the unit under test" / "A precondition qualifies the test." / "the test did not exercise what it claims to"
    5. kept — "When a precondition fails, the test's result is meaningless, not wrong."
    6. kept — "To decide whether one is warranted, ask what determines the outcome and whether the script shows it."
    7. kept — "Where a deciding factor is legible on the page, do not add a precondition."
    8. kept — "Where the factor sits inside a control, in a prior state, or in a derivation the reader cannot see, write a precondition that surfaces it."
    9. kept — "The criterion is whether the deciding factors are legible, not only the risk of a vacuous pass."
    10. kept — "Write the predicate inline, with no explaining variable. The assertion's own expression carries the condition"
    11. kept — "This is a deliberate exception to the test-block-is-assertion-only rule, which requires every operand inside a `test` block to be bound to an explaining variable." / "do not bind its operand"
    12. kept — "A precondition carries no name, because its expression is the name."
    13. kept — "Where the deciding factor is that an actuation completes, use `assert_raises` or `refute_raises` with a block. The block is the precondition's expression." "Bare" is carried by "Do not wrap a precondition in a `test` block. Do not name it"
    14. kept — "In that block, bind nothing and name nothing. Write the actuation in place, not behind a variable."
    15. kept — "Place the precondition immediately before what it qualifies."
    16. kept — "Place it before the actuation when it documents a factor in the controls or in a prior state." ("immediately" comes from the line before it)
    17. kept — "Place it before the test when it documents a factor in a value derived from the result."
    18. kept — "A precondition may assert over the controls, a prior state, a derivation, or the actuation's completion where the controls decide it."
    19. kept — "It never asserts over the unit's behavior as an outcome."
    20. kept — "It does not prevent a regression" / "It is not coverage" / "It falls outside what the do-not-test-the-platform rule weighs and outside what a coverage test is for."
    21. kept — "Whether an assertion is a precondition or a test depends on its purpose, not on what it is written over."
    22. kept — "`refute_raises` around an actuation is a precondition when the controls would ordinarily make the actuation fail, the setup averts that, and the script does not show it."
    23. kept — "It is a test when whether the unit raises is the thing being established."
    24. kept — "When writing or reading a test, look at the controls first, because their values are named rather than described."
    25. kept — "Do not wrap a precondition in a `test` block."
    26. kept — "Do not write a deciding factor as a `comment` in place of a precondition." / "Write the deciding factor as an assertion, not as a comment."
    27. kept — "It is a test when whether the unit raises is the thing being established. Put that in a `test` block."

## predicate-context-name

### The compressor's answer

    1. A predicate method is a `?`-suffixed, boolean-returning method.
    2. Name a predicate method's test `context` by the method's name without the `?`, followed by "Predicate".
    3. Titlecase the method's name before appending "Predicate".
    4. `defined?` → `context "Defined Predicate"`, not `context "Defined?"`.
    5. Examples: `defined?` → "Defined Predicate", `valid?` → "Valid Predicate", and `empty?` → "Empty Predicate".
    6. Keep the `?` out of a `context` label.
    7. **Why:** The context names the feature under test. "Predicate" is the exact term for a boolean-returning method. A `?` in a label reads as interrogative prose, not a feature name.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. The `context` for a predicate method (a `?`-suffixed, boolean-returning method) must be named by the method's name without the `?`, followed by "Predicate" (e.g. `defined?` → `context "Defined Predicate"`, not `context "Defined?"`).
    2. The `?` must be kept out of a `context` label.
    3. When the unit under test is a predicate method `foo?`, its feature `context` must be named "Foo Predicate": titlecase the method's name without the `?`, then append "Predicate".

### Checker A

    1. kept: "Name a predicate method's test `context` by the method's name without the `?`, followed by "Predicate"", "A predicate method is a `?`-suffixed, boolean-returning method.", "`defined?` → `context "Defined Predicate"`, not `context "Defined?"`."
    2. kept: "Keep the `?` out of a `context` label."
    3. kept: "Titlecase the method's name before appending "Predicate".", "Name a predicate method's test `context` by the method's name without the `?`, followed by "Predicate"", "The context names the feature under test."

### Checker B

    1. kept — "Name a predicate method's test `context` by the method's name without the `?`, followed by \"Predicate\"", "A predicate method is a `?`-suffixed, boolean-returning method", "`defined?` → `context \"Defined Predicate\"`, not `context \"Defined?\"`"
    2. kept — "Keep the `?` out of a `context` label."
    3. kept — "Titlecase the method's name before appending \"Predicate\"", "Name a predicate method's test `context` by the method's name without the `?`, followed by \"Predicate\"", "The context names the feature under test."

## single-case-test-named-for-feature

### The compressor's answer

    1. When a feature has only one case, its test is a single file named for the feature.
    2. Example: `test/automated/upload/status.rb`, directly under the feature context `context "Upload" do; context "Status" do`.
    3. Do not put a single-case test in a folder under a case-discriminating filename (`status/present.rb`).
    4. The folder-with-case-files form is reserved for features with multiple cases.
    5. Examples: `rejected/empty.rb` with `rejected/refused.rb`, or `result/located.rb` with `result/unlocated.rb`.
    6. In the folder form, each filename names the case it distinguishes, such as `empty` and `refused`.
    7. A case name like `empty` is justified only when a sibling case (`refused`) exists to contrast against.
    8. You may start a feature's test wherever is convenient.
    9. Once the case set is settled and there is one case, collapse to `<feature>.rb`, named for the feature.
    10. When collapsing, fix the `require_relative` depth to match.
    11. Once the case set is settled and there is more than one case, use `<feature>/<case>.rb`, each file named for its case.
    12. **Why:** a filename should carry meaning. A sole case-named file like `present` implies a contrast that does not exist, and misdescribes the feature as multi-case.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When a feature has only one case, its test must be a single file named for the feature (for example `test/automated/upload/status.rb`).
    2. A single-case feature's test file must sit directly under the feature context (for example `context "Upload" do; context "Status" do`).
    3. Do not put a single-case feature's test in a folder under a case-discriminating filename (for example `status/present.rb`).
    4. The folder-with-case-files form (for example `rejected/empty.rb` with `rejected/refused.rb`) is reserved for features with multiple cases.
    5. In the folder-with-case-files form, each filename must name the case it distinguishes (for example `empty` and `refused`).
    6. A case name such as `empty` may be used as a filename only when there is a sibling case (such as `refused`) to contrast it against.
    7. A filename should carry meaning, so it must not imply a contrast between cases that doesn't exist.
    8. A feature's test may start wherever is convenient, before its case set is settled.
    9. Once the case set is settled and there is one case, collapse the test to `<feature>.rb`, named for the feature.
    10. When collapsing or moving a test file, fix its `require_relative` depth to match.
    11. Once the case set is settled and there is more than one case, use `<feature>/<case>.rb`, with each file named for its case.

### Checker A

    Two directives are less precise in the shorter version and none are lost. Directive 2 survives only inside an example line, and directive 10 no longer covers moving a file. The other nine are kept.

    1. kept: "When a feature has only one case, its test is a single file named for the feature." and "Example: `test/automated/upload/status.rb`"
    2. less precise: "Example: `test/automated/upload/status.rb`, directly under the feature context `context "Upload" do; context "Status" do`." Missing: the placement is stated only within an example line, not as a requirement.
    3. kept: "Do not put a single-case test in a folder under a case-discriminating filename (`status/present.rb`)."
    4. kept: "The folder-with-case-files form is reserved for features with multiple cases." and "Examples: `rejected/empty.rb` with `rejected/refused.rb`"
    5. kept: "In the folder form, each filename names the case it distinguishes, such as `empty` and `refused`."
    6. kept: "A case name like `empty` is justified only when a sibling case (`refused`) exists to contrast against."
    7. kept: "a filename should carry meaning. A sole case-named file like `present` implies a contrast that does not exist"
    8. kept: "You may start a feature's test wherever is convenient." The phrase "before its case set is settled" is gone, but line 9's "Once the case set is settled..." applies that limit.
    9. kept: "Once the case set is settled and there is one case, collapse to `<feature>.rb`, named for the feature."
    10. less precise: "When collapsing, fix the `require_relative` depth to match." Missing: moving a test file no longer triggers the depth fix.
    11. kept: "Once the case set is settled and there is more than one case, use `<feature>/<case>.rb`, each file named for its case."

### Checker B

    Of the 11 directives, the shorter version keeps 8 and states 3 less precisely (2, 8 and 10). It loses none.

    1. kept — "When a feature has only one case, its test is a single file named for the feature."
    2. less precise — "directly under the feature context `context "Upload" do; context "Status" do`". Missing: this is said only inside an example line ("Example: ..."), not as a requirement that the file must sit directly under the feature context.
    3. kept — "Do not put a single-case test in a folder under a case-discriminating filename (`status/present.rb`)."
    4. kept — "The folder-with-case-files form is reserved for features with multiple cases."
    5. kept — "In the folder form, each filename names the case it distinguishes, such as `empty` and `refused`."
    6. kept — "A case name like `empty` is justified only when a sibling case (`refused`) exists to contrast against."
    7. kept — "a filename should carry meaning. A sole case-named file like `present` implies a contrast that does not exist". Item 3's prohibition is what requires the behavior.
    8. less precise — "You may start a feature's test wherever is convenient." Missing: the limit "before its case set is settled". Item 9 only implies it.
    9. kept — "Once the case set is settled and there is one case, collapse to `<feature>.rb`, named for the feature."
    10. less precise — "When collapsing, fix the `require_relative` depth to match." Missing: "or moving", so a moved test file is not covered.
    11. kept — "Once the case set is settled and there is more than one case, use `<feature>/<case>.rb`, each file named for its case."

### The re-check, after the repairs

    1. kept — "When a feature has only one case, its test is a single file named for the feature." / "Example: `test/automated/upload/status.rb`"
    2. kept — "The file sits directly under the feature context. Example: ... under `context "Upload" do; context "Status" do`."
    3. kept — "Do not put a single-case test in a folder under a case-discriminating filename (`status/present.rb`)."
    4. kept — "The folder-with-case-files form is reserved for features with multiple cases." / "Examples: `rejected/empty.rb` with `rejected/refused.rb`"
    5. kept — "In the folder form, each filename names the case it distinguishes, such as `empty` and `refused`."
    6. kept — "A case name like `empty` is justified only when a sibling case (`refused`) exists to contrast against."
    7. less precise — "**Why:** a filename should carry meaning. A sole case-named file like `present` implies a contrast that does not exist" — It now appears only as a rationale about one example (a single case-named file). The general rule that a filename must not imply a contrast that doesn't exist is gone.
    8. kept — "You may start a feature's test wherever is convenient, before its case set is settled."
    9. kept — "Once the case set is settled and there is one case, collapse to `<feature>.rb`, named for the feature."
    10. less precise — "When collapsing, fix the `require_relative` depth to match." — It says nothing about moving a test file, only collapsing one.
    11. kept — "Once the case set is settled and there is more than one case, use `<feature>/<case>.rb`, each file named for its case."

## tdd-test-structure

### The compressor's answer

    1. A test file has three layers: a feature context, a shared control-and-actuation block at its top, and inner contexts that each establish one outcome.
    2. The outer `context` names the feature.
    3. Everything for the feature lives inside the outer context.
    4. Set up the controls and actuate once, at the top of the outer context.
    5. State the inputs just above the actuation, built through controls (`Controls::File.example()`) or stated as literals.
    6. Actuate the unit under test a single time.
    7. Bind the actuation's result to an explaining variable.
    8. Write the actuation from the efferent side, as use would express it.
    9. The variables read as the scenario.

    ```ruby
    file = Controls::File.example()
    upload = Controls::Upload.example()

    result = upload.(file)
    ```

    10. Right after the actuation, narrate the salient values with `comment` for the reader of test output.
    11. The narrated values are the inputs and the actuation result.
    12. Write one inner `context` per outcome.
    13. Each inner context establishes one distinct outcome of that single actuation.
    14. Each inner context's title states the outcome it establishes.
    15. Each inner context derives an explaining variable from the result.
    16. An inner context may narrate its variable locally with `detail`.
    17. Each inner context asserts its variable in a single `test` block.

    ```ruby
    context "Status" do
      status = result.status
      detail status.inspect
      test do
        assert(status == 201)
      end
    end
    ```

    18. Name the derivation that produces the asserted value, and bind it on its own line.
    19. The `test` block asserts the variable, never an inline expression.
    20. `comment` narrates scenario-wide values near the actuation.
    21. `detail` narrates a value local to one inner context.
    22. Each `test` block holds one assertion.
    23. **Why:** Actuating once and asserting each facet separately keeps the efferent view of the unit in one place. Each outcome can then be read, named, and diagnosed on its own.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A test file's outer `context` must name the feature.
    2. Everything for the feature must live inside the outer feature `context`.
    3. Set up the controls and actuate once, at the top of the outer feature context.
    4. State the test's inputs just above the actuation.
    5. Inputs must be built through controls (e.g. `Controls::File.example()`) or stated as literals.
    6. Actuate the unit under test a single time per test file's feature context.
    7. Bind the actuation's result to an explaining variable.
    8. Write the actuation from the efferent side, as use would express it.
    9. The variables must read as the scenario.
    10. Right after the actuation, narrate the salient values (the inputs and the actuation result) with `comment`, for the reader of test output.
    11. Use one inner `context` per outcome, each establishing one distinct outcome of that single actuation.
    12. Each inner context's title must state the outcome it establishes.
    13. Each inner context must derive an explaining variable for the value it asserts.
    14. An inner context may narrate its explaining variable locally with `detail`.
    15. Each inner context must assert its explaining variable in a single `test` block.
    16. Each inner context must assert a separate facet of the one actuation result.
    17. The derivation producing the asserted value must be named and bound on its own line.
    18. The `test` block must assert the explaining variable, never an inline expression.
    19. Use `comment` for scenario-wide values near the actuation, and `detail` for a value local to one inner context.
    20. Each `test` block must contain one assertion, and that single assertion must confirm the outcome the inner context's title states.

### Checker A

    1. kept: "The outer `context` names the feature."
    2. kept: "Everything for the feature lives inside the outer context."
    3. kept: "Set up the controls and actuate once, at the top of the outer context."
    4. kept: "State the inputs just above the actuation"
    5. kept: "built through controls (`Controls::File.example()`) or stated as literals."
    6. kept: "Actuate the unit under test a single time." together with "actuate once, at the top of the outer context"
    7. kept: "Bind the actuation's result to an explaining variable."
    8. kept: "Write the actuation from the efferent side, as use would express it."
    9. kept: "The variables read as the scenario."
    10. kept: "Right after the actuation, narrate the salient values with `comment` for the reader of test output." together with "The narrated values are the inputs and the actuation result."
    11. kept: "Write one inner `context` per outcome." together with "Each inner context establishes one distinct outcome of that single actuation."
    12. kept: "Each inner context's title states the outcome it establishes."
    13. kept: "Each inner context derives an explaining variable from the result." together with "Each inner context asserts its variable in a single `test` block."
    14. kept: "An inner context may narrate its variable locally with `detail`."
    15. kept: "Each inner context asserts its variable in a single `test` block."
    16. kept: "Each inner context establishes one distinct outcome of that single actuation" together with "derives an explaining variable from the result" and "asserting each facet separately"
    17. kept: "Name the derivation that produces the asserted value, and bind it on its own line."
    18. kept: "The `test` block asserts the variable, never an inline expression."
    19. kept: "`comment` narrates scenario-wide values near the actuation." together with "`detail` narrates a value local to one inner context."
    20. less precise: "Each `test` block holds one assertion." Missing: the requirement that this one assertion confirm the outcome the inner context's title states. You can infer it from "title states the outcome it establishes", but the shorter version never says it outright.

### Checker B

    1. kept — "The outer `context` names the feature." (with "A test file has three layers: a feature context")
    2. kept — "Everything for the feature lives inside the outer context."
    3. kept — "Set up the controls and actuate once, at the top of the outer context."
    4. kept — "State the inputs just above the actuation"
    5. kept — "built through controls (`Controls::File.example()`) or stated as literals"
    6. kept — "Actuate the unit under test a single time." together with "actuate once, at the top of the outer context"
    7. kept — "Bind the actuation's result to an explaining variable."
    8. kept — "Write the actuation from the efferent side, as use would express it."
    9. kept — "The variables read as the scenario."
    10. kept — "Right after the actuation, narrate the salient values with `comment` for the reader of test output." and "The narrated values are the inputs and the actuation result."
    11. kept — "Write one inner `context` per outcome." and "Each inner context establishes one distinct outcome of that single actuation."
    12. kept — "Each inner context's title states the outcome it establishes."
    13. kept — "Each inner context derives an explaining variable from the result." with "Each inner context asserts its variable"
    14. kept — "An inner context may narrate its variable locally with `detail`."
    15. kept — "Each inner context asserts its variable in a single `test` block."
    16. kept — "Each inner context establishes one distinct outcome of that single actuation." with "derives an explaining variable from the result"
    17. kept — "Name the derivation that produces the asserted value, and bind it on its own line."
    18. kept — "The `test` block asserts the variable, never an inline expression."
    19. kept — "`comment` narrates scenario-wide values near the actuation." and "`detail` narrates a value local to one inner context."
    20. less precise — "Each `test` block holds one assertion." Missing: the requirement that this one assertion confirms the outcome named in the inner context's title. The title rule (14) and the assertion rule (22) are never linked.

### The re-check, after the repairs

    All 20 directives are kept. None are less precise or lost.

    1. kept — "The outer `context` names the feature."
    2. kept — "Everything for the feature lives inside the outer context."
    3. kept — "Set up the controls and actuate once, at the top of the outer context."
    4. kept — "State the inputs just above the actuation"
    5. kept — "built through controls (`Controls::File.example()`) or stated as literals."
    6. kept — "Actuate the unit under test a single time." The "per feature context" scope comes from "actuate once, at the top of the outer context."
    7. kept — "Bind the actuation's result to an explaining variable."
    8. kept — "Write the actuation from the efferent side, as use would express it."
    9. kept — "The variables read as the scenario."
    10. kept — "Right after the actuation, narrate the salient values with `comment` for the reader of test output." plus "The narrated values are the inputs and the actuation result."
    11. kept — "Write one inner `context` per outcome." plus "Each inner context establishes one distinct outcome of that single actuation."
    12. kept — "Each inner context's title states the outcome it establishes."
    13. kept — "Each inner context derives an explaining variable from the result." plus "Each inner context asserts its variable in a single `test` block." Together these tie the variable to the asserted value.
    14. kept — "An inner context may narrate its variable locally with `detail`."
    15. kept — "Each inner context asserts its variable in a single `test` block."
    16. kept — "Each inner context establishes one distinct outcome of that single actuation." plus "asserting each facet separately"
    17. kept — "Name the derivation that produces the asserted value, and bind it on its own line."
    18. kept — "The `test` block asserts the variable, never an inline expression."
    19. kept — "`comment` narrates scenario-wide values near the actuation." plus "`detail` narrates a value local to one inner context."
    20. kept — "Each `test` block holds one assertion, and that assertion confirms the outcome its inner context's title states."

## test-block-is-assertion-only

### The compressor's answer

    1. Never inline a method call in an assertion.
    2. Assign every value the assertion examines to an explaining variable first. This includes the actuation result and whatever it is compared against.
    3. The assertion references only those explaining variables and the comparison itself.
    4. A `test` block contains only the assertion: exactly one `assert`.
    5. A `test` block contains no controls setup, no actuation, no variable assignment, and no value-producing method calls.
    6. Declare explaining variables in the enclosing `context` block.
    7. When a test introduces explaining variables, encase its `test` block in a `context` block that declares them.
    8. In the enclosing `context`, declare the controls.
    9. In the enclosing `context`, bind the actuation to an explaining variable.
    10. In the enclosing `context`, bind any compared-against or expected value to its own explaining variable.
    11. The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays in the assertion.

    ```ruby
    # No — method call inlined in the assertion
    test do
      assert(result == Upload::Result.build(control_response))
    end

    # Yes — operands are explaining variables declared in the context; test asserts only
    context "..." do
      control_response = Controls::HTTP::Response.example
      control_file = Controls::File.example

      upload = Controls::Upload.example
      result = upload.(control_file)
      expected_result = Upload::Result.build(control_response)

      test do
        assert(result == expected_result)
      end
    end
    ```

    ## The three parts govern a `test` block, and a precondition is not one

    1. Points 1 through 11 govern `test` blocks only. They do not apply to a precondition.
    2. A precondition is a bare `assert` or `refute` that is not a test. It documents a factor that decides the test's outcome where the script does not express it.
    3. A precondition reads its predicate inline, with no explaining variable.
    4. The precondition is the one stated exception to these parts.
    5. **Why:** A test block should read as a single relation among named values, not a computation mixed with a check. Naming operands in the context documents each value, gives it an inspection point, and separates control from observation.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Never inline a method call in an assertion.
    2. Every value the assertion examines (the actuation result and whatever it is compared against) must first be assigned to an explaining variable.
    3. The assertion must reference only those explaining variables and the comparison itself.
    4. The only thing in a `test` block is the assertion: no controls setup, no actuation, no variable assignment, and no value-producing method calls, just the one `assert`.
    5. Explaining variables must be declared in the enclosing `context` block.
    6. If a test introduces explaining variables, the `test` block must be enclosed in a `context` block where those variables are declared.
    7. The controls must be declared in the enclosing `context`.
    8. The actuation must be bound to an explaining variable.
    9. Any compared-against or expected value must be bound to its own explaining variable.
    10. The `test` block must contain exactly one `assert`, and it compares the explaining variables.
    11. The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays in the assertion.
    12. A precondition (a bare `assert` or `refute` that is not a test and documents a factor that decides the test's outcome where the script does not express it) is exempt from the three parts governing a `test` block.
    13. A precondition must read its predicate inline, with no explaining variable.

### Checker A

    All 13 directives are kept in the shorter version. None is less precise or lost.

    1. kept: "Never inline a method call in an assertion."
    2. kept: "Assign every value the assertion examines to an explaining variable first. This includes the actuation result and whatever it is compared against."
    3. kept: "The assertion references only those explaining variables and the comparison itself."
    4. kept: "A `test` block contains only the assertion: exactly one `assert`." plus "A `test` block contains no controls setup, no actuation, no variable assignment, and no value-producing method calls."
    5. kept: "Declare explaining variables in the enclosing `context` block."
    6. kept: "When a test introduces explaining variables, encase its `test` block in a `context` block that declares them."
    7. kept: "In the enclosing `context`, declare the controls."
    8. kept: "In the enclosing `context`, bind the actuation to an explaining variable."
    9. kept: "In the enclosing `context`, bind any compared-against or expected value to its own explaining variable."
    10. kept: "exactly one `assert`" plus "The assertion references only those explaining variables and the comparison itself."
    11. kept: "The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays in the assertion."
    12. kept: "The three parts govern a `test` block, and a precondition is not one" / "Points 1 through 11 govern `test` blocks only. They do not apply to a precondition." / "A precondition is a bare `assert` or `refute` that is not a test. It documents a factor that decides the test's outcome where the script does not express it."
    13. kept: "A precondition reads its predicate inline, with no explaining variable."

### Checker B

    All 13 directives come through as kept. None is less precise or lost.

    1. kept: "Never inline a method call in an assertion."
    2. kept: "Assign every value the assertion examines to an explaining variable first. This includes the actuation result and whatever it is compared against."
    3. kept: "The assertion references only those explaining variables and the comparison itself."
    4. kept: "A `test` block contains only the assertion: exactly one `assert`." and "A `test` block contains no controls setup, no actuation, no variable assignment, and no value-producing method calls."
    5. kept: "Declare explaining variables in the enclosing `context` block."
    6. kept: "When a test introduces explaining variables, encase its `test` block in a `context` block that declares them."
    7. kept: "In the enclosing `context`, declare the controls."
    8. kept: "In the enclosing `context`, bind the actuation to an explaining variable."
    9. kept: "In the enclosing `context`, bind any compared-against or expected value to its own explaining variable."
    10. kept: "exactly one `assert`" together with "The assertion references only those explaining variables and the comparison itself."
    11. kept: "The comparison operator (`==`, etc.) is the assertion's predicate, not an inlined value-producing call, so it stays in the assertion."
    12. kept: "Points 1 through 11 govern `test` blocks only. They do not apply to a precondition." and "A precondition is a bare `assert` or `refute` that is not a test. It documents a factor that decides the test's outcome where the script does not express it." The shorter version names the scope of the exemption as "Points 1 through 11" in its body, while its heading still says "The three parts". The two references point to the same scope, so the exemption is not ambiguous.
    13. kept: "A precondition reads its predicate inline, with no explaining variable."

## test-context-nesting-mirrors-folders

### The compressor's answer

    1. A test file's context nesting mirrors the hierarchy of its folder path.
    2. Each directory segment under `test/automated/` becomes a context.
    3. Scenario contexts nest inside the folder contexts.
    4. Test blocks nest inside the scenario contexts.
    5. A test at `test/automated/upload/rejected/empty.rb` opens `context "Upload"` → `context "Rejected"` → the outcome context.
    6. A test at `test/automated/upload/retried.rb` opens `"Upload"` → `"Retried"`.
    7. Do **not** flatten the hierarchy into a single combined context, such as `"Upload Rejected"`.
    8. Leaf files within a feature folder, such as `rejected/empty.rb` and `rejected/refused.rb`, are distinct cases of the same feature.
    9. Those leaf files share the folder-mirrored context nesting.
    10. Leaf files are distinguished by their outcome-context titles.
    11. Do not add an extra per-file context layer.
    12. Nest the file's contexts in this order: one `context` per folder segment, then the scenario contexts, then the test blocks.
    13. Each test block may have an optional context that scopes a local variable or a comment.
    14. Keep the suite consistent with the existing `upload/` tests.
    15. **Why:** the test output and the file tree read as the same structure, with each outcome placed under its path segments and its scenario.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A test file's context nesting must mirror the hierarchy of its folder path.
    2. Each directory segment under `test/automated/` must become a context, mirroring the test organization's hierarchy (e.g. a test at `test/automated/upload/rejected/empty.rb` opens `context "Upload"` → `context "Rejected"` → the outcome context).
    3. In a test file, the scenario contexts must nest inside the folder-segment contexts.
    4. In a test file, the test blocks must nest inside the scenario contexts.
    5. Do not flatten the folder hierarchy into a single combined context (e.g. `"Upload Rejected"`).
    6. Leaf test files within the same feature folder (e.g. `rejected/empty.rb`, `rejected/refused.rb`) must share the same folder-mirrored context nesting.
    7. Leaf test files within the same feature folder must be distinguished by their outcome-context titles, not by an extra per-file context layer.
    8. A test file's contexts must be nested in this order: first one `context` per folder segment, then the contexts that pertain to the scenario, then the test blocks.
    9. Each test block may have an optional context that scopes a local variable or a comment.

### Checker A

    1. kept: "A test file's context nesting mirrors the hierarchy of its folder path."
    2. kept: "Each directory segment under `test/automated/` becomes a context." with "A test at `test/automated/upload/rejected/empty.rb` opens `context "Upload"` → `context "Rejected"` → the outcome context."
    3. kept: "Scenario contexts nest inside the folder contexts."
    4. kept: "Test blocks nest inside the scenario contexts."
    5. kept: "Do **not** flatten the hierarchy into a single combined context, such as `"Upload Rejected"`."
    6. kept: "Leaf files within a feature folder, such as `rejected/empty.rb` and `rejected/refused.rb`" with "Those leaf files share the folder-mirrored context nesting."
    7. kept: "Leaf files are distinguished by their outcome-context titles." with "Do not add an extra per-file context layer."
    8. kept: "Nest the file's contexts in this order: one `context` per folder segment, then the scenario contexts, then the test blocks."
    9. kept: "Each test block may have an optional context that scopes a local variable or a comment."

### Checker B

    1. kept — "A test file's context nesting mirrors the hierarchy of its folder path."
    2. kept — "Each directory segment under `test/automated/` becomes a context." and "A test at `test/automated/upload/rejected/empty.rb` opens `context "Upload"` → `context "Rejected"` → the outcome context."
    3. kept — "Scenario contexts nest inside the folder contexts."
    4. kept — "Test blocks nest inside the scenario contexts."
    5. kept — "Do **not** flatten the hierarchy into a single combined context, such as `"Upload Rejected"`."
    6. kept — "Leaf files within a feature folder, such as `rejected/empty.rb` and `rejected/refused.rb`" ... "Those leaf files share the folder-mirrored context nesting."
    7. kept — "Leaf files are distinguished by their outcome-context titles." and "Do not add an extra per-file context layer."
    8. kept — "Nest the file's contexts in this order: one `context` per folder segment, then the scenario contexts, then the test blocks."
    9. kept — "Each test block may have an optional context that scopes a local variable or a comment."

## test-name-is-prefix

### The compressor's answer

    1. Begin a test or context name with "Is" only when the test asserts that a value is some other comparator.
    2. Such an assertion is an equality or identity comparison of a value against another value.
    3. Do not begin the name with "Is" for any other kind of assertion.
    4. Other kinds include a predicate being true, a presence or definition check, a raised error, an exclusion, or a behavior or side effect.
    5. Name such a test for what it establishes.
    6. Good examples, each asserting `value == <comparator>`:
       - `context "Is the final segment of the qualified name as a String"` → `assert(name == control_inner_constant_name.to_s)`
       - `context "Is the whole name as a String"` → `assert(name == control_value.name)`
    7. Counter-examples, where "Is" is not used:
       - a predicate result — `context "Defined"` → `assert(defined)`
       - a returned value — `context "The defined constant is returned"`
       - a raised error — named `Fails`, per the error-test-naming rule
       - an exclusion — `context "Excludes non-module inner constants"`
    8. Before naming a context "Is …", look at its assertion.
    9. If the assertion is `assert(a == b)`, or an identity comparison, "Is …" fits.
    10. Otherwise, name the context for the outcome it establishes: the predicate, the presence, the exclusion, or the behavior.
    11. Name a context for a raised error "Fails", per the error-test-naming rule.
    12. **Why:** "Is X" reads as a claim of equality or identity. Using it for any other assertion promises a comparison the assertion does not make.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Begin a test or context name with "Is" only when the test asserts that a value is some other comparator, meaning an equality or identity comparison of a value against another value.
    2. Do not start a test or context name with "Is" for any other kind of assertion: a predicate being true, a presence or definition check, a raised error, an exclusion, or a behavior or side effect.
    3. Name a test or context that does not assert value equality or identity for what it establishes: the predicate, the presence, the exclusion, or the behavior.
    4. Name a test that asserts a raised error "Fails", per the error-test-naming rule.
    5. Before naming a context "Is …", look at its assertion.
    6. If a context's assertion is `assert(a == b)` or an identity comparison, the context may be named "Is …".

### Checker A

    1 — kept — "Begin a test or context name with "Is" only when the test asserts that a value is some other comparator." / "Such an assertion is an equality or identity comparison of a value against another value."
    2 — kept — "Do not begin the name with "Is" for any other kind of assertion." / "Other kinds include a predicate being true, a presence or definition check, a raised error, an exclusion, or a behavior or side effect."
    3 — kept — "Name such a test for what it establishes." / "Otherwise, name the context for the outcome it establishes: the predicate, the presence, the exclusion, or the behavior."
    4 — kept — "a raised error — named `Fails`, per the error-test-naming rule" / "Name a context for a raised error "Fails", per the error-test-naming rule."
    5 — kept — "Before naming a context "Is …", look at its assertion."
    6 — kept — "If the assertion is `assert(a == b)`, or an identity comparison, "Is …" fits."

### Checker B

    1. kept — "Begin a test or context name with \"Is\" only when the test asserts that a value is some other comparator." + "Such an assertion is an equality or identity comparison of a value against another value."
    2. kept — "Do not begin the name with \"Is\" for any other kind of assertion." + "Other kinds include a predicate being true, a presence or definition check, a raised error, an exclusion, or a behavior or side effect."
    3. kept — "Name such a test for what it establishes." + "Otherwise, name the context for the outcome it establishes: the predicate, the presence, the exclusion, or the behavior."
    4. kept — "a raised error — named `Fails`, per the error-test-naming rule" + "Name a context for a raised error \"Fails\", per the error-test-naming rule."
    5. kept — "Before naming a context \"Is …\", look at its assertion."
    6. kept — "If the assertion is `assert(a == b)`, or an identity comparison, \"Is …\" fits."

## test-report-format

### The compressor's answer

    1. This rule applies when the user asks for a **test report**.
    2. Classify the automated suite along the lenses below.
    3. Then print the context hierarchy two levels deep.
    4. Re-derive everything from the current files.
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
    4. Derive this section alone from a suite run, not from the source.
    5. Run the suite and take the first two levels from its output.
    6. Never take the hierarchy from the `context "…"` declarations.
    7. A dynamic `context <expr> do` is a placeholder in the source but its expanded value in a run.
    8. A bare unnamed `test do` appears in the source but emits no line in a run.
    9. **Why:** a suite has a discoverable structure worth surfacing on demand. A fixed report shape makes it repeatable and steers reading to the test files rather than recollection.

    CONTRADICTIONS: The source says to "re-derive everything from the current files" and to read the tests, but it also says the context-hierarchy section "alone is derived from a suite run, not from the source." The source carves out that exception itself, so this is an apparent tension, not an unqualified contradiction. Both statements are kept as written (points 4–5 of the opening list, and points 4–6 under section 6).

    Notes on what was dropped: the "Companion to `lib-report` (`ext/ruby-lang`) and `test-tree`" sentence and the claim that test-tree produces the same tree at full depth. Neither is a directive. Its one directive, "Neither report is written to a file," is kept as opening point 11. The reference to the test-tree rule's reasons is replaced by the two concrete cases the source gives.

### The directives, as the listing agent gave them

    1. When the user asks for a test report, classify the automated suite along the report's lenses: generations/styles, subject under test, structural style, assertion kind, and other factors.
    2. After classifying the suite, print the test context hierarchy two levels deep.
    3. Re-derive everything in a test report from the current files: read the tests and recompute membership and counts.
    4. Do not report stale buckets from memory in a test report.
    5. The lenses are the frame of a test report, and the specific buckets are whatever the current suite yields.
    6. A test report produces these sections, in this order: Generations / styles; By subject under test; By structural style; By assertion kind; Other factors; Context hierarchy, two levels deep.
    7. In the Generations / styles section, split the test files by which of the suite's coexisting conventions (an older style alongside a newer one) they follow.
    8. In the Generations / styles section, name the cleanest mechanical tell that distinguishes the conventions (one such tell is actuation placement: captured in the controls versus performed inside the test block).
    9. If the suite is uniform in convention, say so and skip the Generations / styles section.
    10. In the By subject under test section, group the tests by the unit each test targets.
    11. In the By subject under test section, give the file count per group.
    12. In the By structural style section, classify the tests as single-outcome leaf (one capability, one assertion), multi-outcome with fan-out (a loop generating one sub-context per case), or multi-outcome flat (sibling outcomes, no loop).
    13. In the By assertion kind section, classify the tests as affirmative `assert`, refutation `refute`, or error-raising `assert_raises`.
    14. In the By assertion kind section, note the error classes in play.
    15. In the Other factors section, cover topology pairs (e.g. top-level vs nested for the same method), normal-path vs error outcomes, and controls usage.
    16. The first five sections of a test report are source analysis, derived from reading the test source.
    17. In the Context hierarchy section, show each distinct top-level context with its distinct second-level contexts nested beneath it, rendered as an indented tree using `├─`/`└─`.
    18. Render the context hierarchy tree as the status-report rule (in `foundation`) describes.
    19. Stop the context hierarchy at two levels.
    20. Derive the context hierarchy from a suite run: run the suite and take the first two levels from its output, never from the source's `context "…"` declarations, because a dynamic `context <expr> do` shows only a placeholder in the source and a bare unnamed `test do` emits no line in a run.
    21. Keep each section of a test report tight.
    22. Confirm each test's membership in a bucket by reading the files (actuation placement, assertion kind, loop fan-out) rather than asserting it.
    23. Do not write the test report to a file.

### Checker A

    1. kept: "This rule applies when the user asks for a **test report**." / "Classify the automated suite along the lenses below." (the lenses are the five section headings)
    2. kept: "Then print the context hierarchy two levels deep."
    3. kept: "Re-derive everything from the current files." / "Read the tests and recompute membership and counts."
    4. kept: "Do not report stale buckets from memory."
    5. kept: "The lenses are fixed. The buckets are whatever the current suite yields."
    6. kept: "Produce the sections below, in the order given." (the headings are in the original order: Generations / styles; By subject under test; By structural style; By assertion kind; Other factors; Context hierarchy, two levels deep)
    7. kept: "The suite may have coexisting conventions, an older style alongside a newer one." / "Split the files by which convention they follow."
    8. kept: "Name the cleanest mechanical tell." / "One such tell is actuation placement: captured in the controls, or performed inside the test block."
    9. kept: "If the suite is uniform, say so and skip this section."
    10. kept: "Group by the unit each test targets."
    11. kept: "Give the file count per group."
    12. kept: "Use these styles: single-outcome leaf — one capability, one assertion / multi-outcome with fan-out — a loop generating one sub-context per case / multi-outcome flat — sibling outcomes, no loop" (together with "Classify the automated suite along the lenses below.")
    13. kept: "Classify as affirmative `assert`, refutation `refute`, or error-raising `assert_raises`."
    14. kept: "Note the error classes in play."
    15. kept: "Report topology pairs (e.g. top-level vs nested for the same method)." / "Report normal-path vs error outcomes." / "Report controls usage."
    16. kept: "Derive this section alone from a suite run, not from the source." / "Read the tests and recompute membership and counts." (saying only the hierarchy comes from a run, together with reading the tests, requires the other five sections to come from the source)
    17. kept: "Show each distinct top-level context, with its distinct second-level contexts nested beneath." / "Render it as an indented tree (`├─`/`└─`)"
    18. kept: "as the status-report rule (in `foundation`) describes."
    19. kept: "Stop at two levels."
    20. kept: "Run the suite and take the first two levels from its output." / "Never take the hierarchy from the `context "…"` declarations." / "A dynamic `context <expr> do` is a placeholder in the source but its expanded value in a run." / "A bare unnamed `test do` appears in the source but emits no line in a run."
    21. kept: "Keep each section tight."
    22. kept: "Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out), rather than asserting it."
    23. kept: "Do not write the report to a file."

    All 23 directives are kept. Nothing is lost or less precise.

### Checker B

    The shorter version keeps all 23 directives. None came out less precise or lost.

    1. kept — "This rule applies when the user asks for a **test report**." / "Classify the automated suite along the lenses below." (sections 1–5 name the lenses)
    2. kept — "Then print the context hierarchy two levels deep."
    3. kept — "Re-derive everything from the current files." / "Read the tests and recompute membership and counts."
    4. kept — "Do not report stale buckets from memory."
    5. kept — "The lenses are fixed. The buckets are whatever the current suite yields."
    6. kept — "Produce the sections below, in the order given." (the six headings match the listed sections and their order)
    7. kept — "The suite may have coexisting conventions, an older style alongside a newer one." / "Split the files by which convention they follow."
    8. kept — "Name the cleanest mechanical tell." / "One such tell is actuation placement: captured in the controls, or performed inside the test block."
    9. kept — "If the suite is uniform, say so and skip this section."
    10. kept — "Group by the unit each test targets."
    11. kept — "Give the file count per group."
    12. kept — "Use these styles: single-outcome leaf — one capability, one assertion / multi-outcome with fan-out — a loop generating one sub-context per case / multi-outcome flat — sibling outcomes, no loop"
    13. kept — "Classify as affirmative `assert`, refutation `refute`, or error-raising `assert_raises`."
    14. kept — "Note the error classes in play."
    15. kept — "Report topology pairs (e.g. top-level vs nested for the same method)." / "Report normal-path vs error outcomes." / "Report controls usage."
    16. kept — "Derive this section alone from a suite run, not from the source." / "Re-derive everything from the current files." (together these require the first five sections to come from the test source; the shorter version implies this rather than stating it directly)
    17. kept — "Show each distinct top-level context, with its distinct second-level contexts nested beneath." / "Render it as an indented tree (`├─`/`└─`)"
    18. kept — "as the status-report rule (in `foundation`) describes."
    19. kept — "Stop at two levels."
    20. kept — "Run the suite and take the first two levels from its output." / "Never take the hierarchy from the `context "…"` declarations." / "A dynamic `context <expr> do` is a placeholder in the source but its expanded value in a run." / "A bare unnamed `test do` appears in the source but emits no line in a run."
    21. kept — "Keep each section tight."
    22. kept — "Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out), rather than asserting it."
    23. kept — "Do not write the report to a file."

## test-tree-command

### The compressor's answer

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
    19. **Why:** the de-duped tree is the readable, whole-suite view of feature and outcome structure, without per-file repetition. Expanded dynamic names also surface loop-generated cases.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the user gives the command "test tree", run the automated suite.
    2. On a "test tree" command, print the suite's structure as a single normalized tree: the whole suite's `context`/`test` hierarchy.
    3. In the test tree, duplicate outer context headings must be merged, so each context path appears once.
    4. In the test tree, each outer context appears once, then each sub-feature once beneath it.
    5. In the test tree, the individual tests are leaves with a `•` prefix.
    6. In the test tree, the pass/fail summary line comes at the end.
    7. Produce the test tree from the run's output, not from the source.
    8. Build the test tree by running the suite with narration output suppressed, capturing the output, and parsing that output.
    9. Merge every file's `context`/`test` hierarchy into one tree keyed by name, so identical paths de-duplicate.
    10. In the test tree, a dynamic `context <expr> do` shows its expanded real value, not the source placeholder.
    11. In the test tree, a bare unnamed `test do` produces no line, so its enclosing context becomes the leaf.
    12. The test tree must be produced by a durable script, so the command is reproducible in every session, rather than by a parser rebuilt from scratch each time.
    13. Which test tree script is used, and where it lives, is settled by the project's stack, not by this rule.
    14. The test tree script runs the project's suite, suppresses that runner's narration, and parses that framework's output.
    15. For a Ruby project, the test tree script is settled by the `ext/ruby-lang` package's rule on running the suite.
    16. On a "test tree" request, run the project's durable tree script and present its output.

### Checker A

    1. kept — "When the user gives the command **"test tree"**, run the automated suite."
    2. kept — "Print its structure as a **single normalized tree**." / "The tree is the whole suite's `context`/`test` hierarchy."
    3. kept — "Merge **duplicate outer context headings**, so each context path appears **once**."
    4. kept — "Each outer context appears once, with each sub-feature once beneath it."
    5. kept — "Show individual tests as leaves with a `•` prefix."
    6. kept — "Put the pass/fail summary line at the end."
    7. kept — "**Produce the tree from the run's output, not the source.**"
    8. kept — "Run the suite with narration output suppressed, capture the output, and parse that output."
    9. kept — "Merge every file's `context`/`test` hierarchy into one tree keyed by name, so identical paths de-duplicate."
    10. kept — "A dynamic `context <expr> do` shows its **expanded real value**, not the source placeholder."
    11. kept — "A bare unnamed `test do` produces no line, so its enclosing context becomes the leaf."
    12. kept — "Use a durable script, so the command is reproducible in every session, rather than rebuilding a parser each time."
    13. kept — "**Which script, and where it lives, is the project's stack's concern.**" together with "This rule fixes only what the tree is and where it is derived from."
    14. kept — "The script runs the project's suite, suppresses that runner's narration, and parses that framework's output."
    15. kept — "For a Ruby project, the `ext/ruby-lang` package's rule on running the suite settles the script."
    16. kept — "On a "test tree" request, run the project's durable tree script and present its output."

    All 16 directives are kept. The shorter version loses none of them and makes none less precise. It also adds a "Why" line and a "Related" list, which are not in the directive list.

### Checker B

    All 16 directives are kept in the shorter version. None is less precise or lost.

    1. kept — "When the user gives the command **"test tree"**, run the automated suite."
    2. kept — "Print its structure as a **single normalized tree**." / "The tree is the whole suite's `context`/`test` hierarchy."
    3. kept — "Merge **duplicate outer context headings**, so each context path appears **once**."
    4. kept — "Each outer context appears once, with each sub-feature once beneath it."
    5. kept — "Show individual tests as leaves with a `•` prefix."
    6. kept — "Put the pass/fail summary line at the end."
    7. kept — "**Produce the tree from the run's output, not the source.**"
    8. kept — "Run the suite with narration output suppressed, capture the output, and parse that output."
    9. kept — "Merge every file's `context`/`test` hierarchy into one tree keyed by name, so identical paths de-duplicate."
    10. kept — "A dynamic `context <expr> do` shows its **expanded real value**, not the source placeholder."
    11. kept — "A bare unnamed `test do` produces no line, so its enclosing context becomes the leaf."
    12. kept — "Use a durable script, so the command is reproducible in every session, rather than rebuilding a parser each time."
    13. kept — "**Which script, and where it lives, is the project's stack's concern.**" / "This rule fixes only what the tree is and where it is derived from."
    14. kept — "The script runs the project's suite, suppresses that runner's narration, and parses that framework's output."
    15. kept — "For a Ruby project, the `ext/ruby-lang` package's rule on running the suite settles the script."
    16. kept — "On a "test tree" request, run the project's durable tree script and present its output."

## tests-are-automated-or-interactive

### The compressor's answer

    1. A project's tests sit under `test/`, in `test/automated/`, `test/interactive/`, or both.
    2. Put a test that a machine runs and a machine judges in `test/automated/`.
    3. `test/automated/` is the suite that every other rule in this package means.
    4. Put a test that needs a person in `test/interactive/`. The engineer runs it, with a person in the loop.
    5. In an interactive test, a person drives the run and a person judges what came back.
    6. Only `test/automated/` runs before a commit.
    7. The suite that the `git` run-suite-before-commit rule requires to pass is the automated one.
    8. This rule applies in full in a project that does not install the `git` package.

    ## An interactive test is the engineer's to run

    1. Do not run an interactive test on your own initiative.
    2. Do not run an interactive test as part of a suite run.
    3. Run an interactive test when the engineer asks for it.
    4. A test is interactive when a person is part of the run.
    5. A test is interactive when it needs a judgment that a machine cannot make.
    6. A test is also interactive when it reaches something the project does not control.
    7. Examples are a network, a remote repository, an installer that writes outside the working tree, or a rendering someone has to look at.
    8. No pre-commit gate depends on an interactive test.

    ## Say which tests ran

    1. A report of a suite run names the automated tests and claims nothing more.
    2. Say that the automated tests passed, not that the tests passed.
    3. Where a project holds interactive tests, say that they were not run.
    4. That line states a fact. It is not an offer to run them.

    ## A project may hold only one of the two

    1. A project with no `test/interactive/` is the ordinary case, and nothing is missing.
    2. A project with no `test/automated/` is ordinary too.
    3. In that case the pre-commit run has nothing to run, so run nothing.
    4. Do not report the missing automated suite as a failure, or as anything missing.
    5. Weigh the commit decision on what the project does have.
    6. Run-suite-before-commit is then satisfied vacuously, not violated.
    7. **Why:** Keeping the tests in separate directories keeps the automated suite mechanically true, so it either passes or fails. It also gives the tests that need a person a place to live, so they are not deleted for not fitting. The engineer's attention is the scarce resource, so a test that spends it runs only when the engineer says so.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A project's tests sit under `test/`, in one of two directories: `test/automated/` or `test/interactive/`.
    2. A project may hold either `test/automated/` or `test/interactive/`, or both.
    3. `test/automated/` holds tests a machine runs and a machine judges.
    4. `test/automated/` is the suite that every other rule in the package means when it says "suite", including the suite the `git` package's run-suite-before-commit rule makes a precondition of the commit decision.
    5. `test/interactive/` holds tests the engineer runs, human-in-the-loop, where a person drives the run and a person judges what came back.
    6. A test is interactive when a person is part of the run: it needs a judgment a machine cannot make, or it reaches something the project does not control, such as a network, a remote repository, an installer that writes outside the working tree, or a rendering someone has to look at.
    7. Put a test that a machine runs and judges in `test/automated/`.
    8. Put a test that needs a person in `test/interactive/`, rather than deleting it because it does not fit the automated suite.
    9. Only `test/automated/` runs before a commit.
    10. Run `test/automated/` before weighing a commit.
    11. Do not put a pre-commit gate on an interactive test.
    12. Do not run an interactive test on your own initiative.
    13. Do not run an interactive test as part of a suite run.
    14. Run an interactive test when the engineer asks for it, and run nothing from `test/interactive/` unless the engineer asks.
    15. A report of a suite run names the automated tests and does not claim more: say the automated tests passed, not that the tests passed.
    16. Where a project holds interactive tests, the report of a suite run says that they were not run.
    17. The statement that the interactive tests were not run is kept to a fact, and is not an offer to run them.
    18. A project with no `test/interactive/` is the ordinary case, and it is not treated as missing anything.
    19. Where a project has no `test/automated/`, the pre-commit run runs nothing.
    20. Where a project has no `test/automated/`, the absence is not a failure and is not reported as one or as something missing.
    21. Where a project has no `test/automated/`, the commit decision is weighed on what the project does have.
    22. Where a project has no `test/automated/`, the run-suite-before-commit rule is treated as satisfied vacuously, not violated.
    23. This rule applies in full in a project that does not install the `git` package.

### Checker A

    1. kept: "A project's tests sit under `test/`, in `test/automated/`, `test/interactive/`, or both."
    2. kept: "in `test/automated/`, `test/interactive/`, or both"; "A project may hold only one of the two"
    3. kept: "Put a test that a machine runs and a machine judges in `test/automated/`."
    4. kept: "`test/automated/` is the suite that every other rule in this package means." and "The suite that the `git` run-suite-before-commit rule requires to pass is the automated one."
    5. kept: "The engineer runs it, with a person in the loop." and "In an interactive test, a person drives the run and a person judges what came back."
    6. kept: "A test is interactive when a person is part of the run." / "when it needs a judgment that a machine cannot make." / "A test is also interactive when it reaches something the project does not control." / "Examples are a network, a remote repository, an installer that writes outside the working tree, or a rendering someone has to look at."
    7. kept: "Put a test that a machine runs and a machine judges in `test/automated/`."
    8. kept: "Put a test that needs a person in `test/interactive/`." The "rather than deleting it" part appears only in the Why: "so they are not deleted for not fitting". Placing the test there already means it is not deleted.
    9. kept: "Only `test/automated/` runs before a commit."
    10. kept: "Only `test/automated/` runs before a commit." and "The suite that the `git` run-suite-before-commit rule requires to pass is the automated one."
    11. kept: "No pre-commit gate depends on an interactive test."
    12. kept: "Do not run an interactive test on your own initiative."
    13. kept: "Do not run an interactive test as part of a suite run."
    14. kept: "Run an interactive test when the engineer asks for it." with "Do not run an interactive test on your own initiative." and "An interactive test is the engineer's to run"
    15. kept: "A report of a suite run names the automated tests and claims nothing more." and "Say that the automated tests passed, not that the tests passed."
    16. kept: "Where a project holds interactive tests, say that they were not run."
    17. kept: "That line states a fact. It is not an offer to run them."
    18. kept: "A project with no `test/interactive/` is the ordinary case, and nothing is missing."
    19. kept: "In that case the pre-commit run has nothing to run, so run nothing."
    20. kept: "Do not report the missing automated suite as a failure, or as anything missing." with "A project with no `test/automated/` is ordinary too."
    21. kept: "Weigh the commit decision on what the project does have."
    22. kept: "Run-suite-before-commit is then satisfied vacuously, not violated."
    23. kept: "This rule applies in full in a project that does not install the `git` package."

### Checker B

    1. kept — "A project's tests sit under `test/`, in `test/automated/`, `test/interactive/`, or both."
    2. kept — "or both"; "A project may hold only one of the two"
    3. kept — "Put a test that a machine runs and a machine judges in `test/automated/`."
    4. kept — "`test/automated/` is the suite that every other rule in this package means."; "The suite that the `git` run-suite-before-commit rule requires to pass is the automated one."
    5. kept — "The engineer runs it, with a person in the loop."; "In an interactive test, a person drives the run and a person judges what came back."
    6. kept — "A test is interactive when a person is part of the run."; "when it needs a judgment that a machine cannot make"; "A test is also interactive when it reaches something the project does not control."; "Examples are a network, a remote repository, an installer that writes outside the working tree, or a rendering someone has to look at."
    7. kept — "Put a test that a machine runs and a machine judges in `test/automated/`."
    8. less precise — "Put a test that needs a person in `test/interactive/`." Missing: "rather than deleting it" appears only as rationale in the Why ("so they are not deleted for not fitting"), not as a directive.
    9. kept — "Only `test/automated/` runs before a commit."
    10. less precise — "Only `test/automated/` runs before a commit."; "The suite that the `git` run-suite-before-commit rule requires to pass is the automated one." Missing: no direct instruction to run it before weighing a commit. It is stated as a limit on what runs, and the requirement to run it comes from the cited git rule, which does not apply where git is not installed.
    11. kept — "No pre-commit gate depends on an interactive test."
    12. kept — "Do not run an interactive test on your own initiative."
    13. kept — "Do not run an interactive test as part of a suite run."
    14. kept — "Run an interactive test when the engineer asks for it."; "Do not run an interactive test on your own initiative."
    15. kept — "A report of a suite run names the automated tests and claims nothing more."; "Say that the automated tests passed, not that the tests passed."
    16. kept — "Where a project holds interactive tests, say that they were not run."
    17. kept — "That line states a fact. It is not an offer to run them."
    18. kept — "A project with no `test/interactive/` is the ordinary case, and nothing is missing."
    19. kept — "In that case the pre-commit run has nothing to run, so run nothing."
    20. kept — "Do not report the missing automated suite as a failure, or as anything missing."; "A project with no `test/automated/` is ordinary too."
    21. kept — "Weigh the commit decision on what the project does have."
    22. kept — "Run-suite-before-commit is then satisfied vacuously, not violated."
    23. kept — "This rule applies in full in a project that does not install the `git` package."

### The re-check, after the repairs

    1. kept: "A project's tests sit under `test/`, in `test/automated/`, `test/interactive/`, or both."
    2. kept: "in `test/automated/`, `test/interactive/`, or both"; "A project may hold only one of the two"
    3. kept: "Put a test that a machine runs and a machine judges in `test/automated/`."
    4. kept: "`test/automated/` is the suite that every other rule in this package means."; "The suite that the `git` run-suite-before-commit rule requires to pass is the automated one."
    5. kept: "The engineer runs it, with a person in the loop."; "In an interactive test, a person drives the run and a person judges what came back."
    6. kept: "A test is interactive when a person is part of the run."; "when it needs a judgment that a machine cannot make"; "when it reaches something the project does not control"; "Examples are a network, a remote repository, an installer that writes outside the working tree, or a rendering someone has to look at."
    7. kept: "Put a test that a machine runs and a machine judges in `test/automated/`."
    8. less precise: "Put a test that needs a person in `test/interactive/`."; "so they are not deleted for not fitting". Missing: "rather than deleting it" appears only in the Why rationale, not as a directive.
    9. kept: "Only `test/automated/` runs before a commit."
    10. kept: "Run it before weighing a commit."
    11. kept: "No pre-commit gate depends on an interactive test."
    12. kept: "Do not run an interactive test on your own initiative."
    13. kept: "Do not run an interactive test as part of a suite run."
    14. kept: "Run an interactive test when the engineer asks for it."; "Do not run an interactive test on your own initiative."
    15. kept: "A report of a suite run names the automated tests and claims nothing more."; "Say that the automated tests passed, not that the tests passed."
    16. kept: "Where a project holds interactive tests, say that they were not run."
    17. kept: "That line states a fact. It is not an offer to run them."
    18. kept: "A project with no `test/interactive/` is the ordinary case, and nothing is missing."
    19. kept: "the pre-commit run has nothing to run, so run nothing."
    20. kept: "Do not report the missing automated suite as a failure, or as anything missing."; "A project with no `test/automated/` is ordinary too."
    21. kept: "Weigh the commit decision on what the project does have."
    22. kept: "Run-suite-before-commit is then satisfied vacuously, not violated."
    23. kept: "This rule applies in full in a project that does not install the `git` package."

---

Authored by Scott Bellware on Sat Oct 24 2026 at 12:00:23 AM PT
