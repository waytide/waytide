# A loop record holds the cycles through the loop, one file per feature

Source: system/design-by-efferent/source/a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature.md

1. `waytide/local/logs/loops/` holds loop records: one file per feature, recording its cycles through the loop.
2. The loop is the distributed OODA cycle, as defined in the DBE vocabulary.
3. A loop record captures how a feature was decided. The log captures what was decided.
4. A loop record holds the hinges the AI determined and, in attended work, the options it put to the engineer.
5. It also holds the engineer's decisions, or the chat that replaced them. In unattended work, it holds the agent's decisions, with its reasoning.
6. A loop record must not displace the log.
7. The log stays one line per entry. Keep its entries separate and intact.
8. When a feature's loop is worth preserving, add a file under `waytide/local/logs/loops/` in the format below.

## Format

1. Name the file per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`.
2. Begin with a `# Loop record — <feature>` title and a one-paragraph summary of the feature.
3. Declare the mode at the top, as **attended** or **unattended**, per the attended-or-unattended-is-chosen-when-the-work-is-started rule.
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

# A test of behavior that already exists is coverage, not design

Source: system/design-by-efferent/source/a-test-of-behavior-that-already-exists-is-coverage-not-design.md

1. A test justifies itself in DBE by driving an implementation that did not exist.
2. A test that passes the first time it runs, because the behavior already exists, is uncontested: no implementation is written to meet it. It confirms the behavior and designs nothing.
3. Such a test is coverage, not a DBE design step. DBE does not take it as an outcome, and it is not part of the design loop.
4. The tell is a no-op implementation hinge in the hinge cycle: "nothing to write — the existing code already satisfies this".
5. At a no-op implementation hinge, do not take the outcome as a design step. Move to the next outcome, rather than writing a test to confirm this one.
6. Behavior may already be present when its own outcome comes up. It may have come from a default value, a conveyed keyword, or a prevention written incidentally. Notice that the implementation ran ahead of its test, and do not take a confirming test as design.
7. Coverage has value. A test of existing behavior prevents a regression in it.
8. Coverage is a concern of testing, not of DBE. Adding such a test is a decision about coverage, and it is the engineer's.
9. The agent may suggest the test to the engineer as an increase to coverage, to accept or decline.
10. When the work is adding coverage, an uncontested test is expected and correct. See the "TDD designs, coverage prevents" rule.

# Advance one outcome at a time, and stop at every gate in attended work

Source: system/design-by-efferent/source/advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work.md

1. The loop advances one outcome at a time.
2. In attended work, the loop stops at every gate for the human.
3. Do not run ahead.
4. Do not batch-generate multiple test files in one pass.
5. Generate one outcome's test, then stop at its gate.
6. Proceed only on the human's go. Under unattended work, the loop does not stop at the gates. It still advances one outcome at a time.
7. Finishing the work means naming the test.
8. A test left with an empty, unnamed outcome context is unfinished.
9. The closing step ascribes the test's name.
10. Name one test at a time.
11. At the naming gate, present candidate outcome-context names, as every hinge presents its candidates. The name passes to the human through the options and the free-text answer. The AI does not name the test on its own.
12. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule for the mechanism and its reasons.
13. Build one outcome's test at a time.
14. After each test, stop at each of its hinges (see the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule) and wait.
15. Under unattended work, chosen at the start, the agent decides each hinge itself and does not stop (see the attended-or-unattended-is-chosen-when-the-work-is-started rule).
16. Never write several test files at once, in either mode.
17. To finish an unnamed test, present candidate names as options through the selection UI.
18. Then apply the name the human chose or dictated.

# After any implementation hinge, show the test output for the current feature

Source: system/design-by-efferent/source/after-any-implementation-hinge-show-the-test-output-for-the-current-feature.md

1. After each implementation hinge, show the whole feature's test output without being asked.
2. First, write the accepted implementation and run the suite.
3. Then run every test file of the current feature.
4. The feature's tests are every outcome built so far for the unit, not only the new one.
5. Run them with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show.
6. Put the output in the turn that reports the implementation.
7. The each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule shows the implementation and the new outcome's test. This rule adds the feature's full output.

# At the implementation hinge, the engineer chooses a direct implementation or red-green-refactor

Source: system/design-by-efferent/source/at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor.md

1. At the implementation hinge, the fourth of the five, put two candidates to the engineer through the selection UI.
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
2. Do not offer the cycle, or manufacture a red, when covering behavior that already exists. A red there breaks working code.
3. When covering, the implementation hinge is degenerate. See the the-design-of-a-test-waits-at-the-hinges-coverage-included rule.
4. Never offer the cycle and then refuse it; offer it only where it is available.

## Choosing the cycle is not performing choreography

1. The dbe-is-a-design-tool-not-a-testing-ritual rule rejects only the unchosen cycle, performed as ritual.
2. An engineer selecting the cycle at a gate for this unit has made a design judgment, which that rule permits.
3. Perform the cycle only where the engineer selected it at the gate for that unit, never as unchosen choreography.

## Refactor is part of the cycle

1. The cycle has three parts: red, green, and refactor.
2. Red proves the test discriminates.
3. Green makes the test pass.
4. Refactor improves the design, with the test holding the behavior still.
5. Never offer the cycle without refactor.
6. Where the cycle is chosen, run it in order: the red, then the full suite, then green, then refactor.

## The second candidate is real

1. The cycle counts as a real second candidate under the present-every-prompt two-option floor.
2. Do not present a failing implementation as an option merely to reach the two-option floor.
3. Where the hinge has a real second implementation, surface that option.
4. The cycle is not a substitute for searching for another implementation.
5. Do not manufacture cosmetic options to reach the two-option floor.

# Attended or unattended is chosen when the work is started

Source: system/design-by-efferent/source/attended-or-unattended-is-chosen-when-the-work-is-started.md

1. Work designed through DBE runs in one of two modes: attended or unattended.
2. Choose the mode when a feature or an experiment is started. Hold it for the work's whole duration.
3. **Attended** is human-in-the-loop. The loop waits at every hinge, and the engineer deliberates each one.
4. Attended is the default.
5. **Unattended**: the loop does not wait. The agent determines and decides each hinge, generating through to the end of the work.
6. DBE is in effect in both modes. Unattended is not DBE off.
7. The cradle still holds under unattended work. The efferent test is written before the implementation.
8. The actuation is still designed from the use site. Code generation is still steered toward solubility.
9. Every hinge is still determined and run in both modes. Only who decides it changes, and whether the loop stops.
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
21. Declare the mode once, at the top of the loop record. Do not infer it cycle by cycle.
22. Under unattended work, the top-of-record declaration is what distinguishes the mode's ungated hinges from skipped gates.
23. Under unattended work, each cycle records its hinge, and what was decided and why.
24. The "why" is the reasoning the agent actually applied.
25. Under unattended work, write no Options line and no Decision / chat line.
26. Do not write an unattended cycle as though an engineer was consulted.
27. Do not mark unattended hinges with the a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule form *"none — no gate"*. That form surfaces a skipped gate in an attended run as a defect.

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

# DBE is a design tool, not a testing ritual

Source: system/design-by-efferent/source/dbe-is-a-design-tool-not-a-testing-ritual.md

1. Design By Efferent is a design tool.
2. Do not perform red-green-refactor as choreography.
3. A test written before its implementation will trivially fail. Do not stop to observe that failure.
4. Do not treat the red bar as a checkpoint.
5. What is rejected is the unchosen cycle, the one performed because the form calls for it.
6. An engineer may choose the red/green/refactor cycle at the implementation hinge, for a particular unit. See the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule.
7. They choose it where the design wants working out under a red, or where the test's discrimination is in doubt.
8. A cycle the engineer chose after weighing two real alternatives is not choreography. Only the engineer's choice makes the cycle legitimate.
9. Approach every unit from the efferent side first. The test is the first efferent reference.
10. Author the actuation before the implementation exists, so the unit's interface is designed from the use site.
11. Aim for the unit's greatest **solubility**: how readily it dissolves into the reader's understanding.
12. Seek minimal necessary complexity, found rather than presumed.
13. Treat the efferent test as a **cradle**. It holds the implementation in position without gripping it rigid.
14. Generate code within the dictates of the efferent view, free to move inside those bounds.
15. The test is not an after-the-fact filter or pass/fail gate, and not a point to halt at.
16. Keep the cradle in context while building, and generate straight through inside it, steering toward solubility. The human sets the cradle.
17. Do not regress to the average of the code you have seen. Do not copy poorly designed code.
18. Condition on the project's well-designed, efferent-oriented, high-solubility code, not on code in general. Hold to its standard.
19. Leave design judgment with the human: knowing in detail what good, soluble design looks like.

# Each hinge displays the actuation as its anchor, and the contexts once

Source: system/design-by-efferent/source/each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once.md

1. Each hinge shows the human a specific amount of the test on screen.
2. The the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule owns the sequence of hinges and the acceptance mechanism. This rule owns what is displayed at each hinge.
3. Render each hinge per this table:

| Hinge | Displays |
|---|---|
| 1 — **actuation** | the actuation, inside its nested folder-mirroring `context` blocks |
| 2 — **observation** | the actuation + the observation — no contexts |
| 3 — **controls** | the controls + the actuation + the observation — the full test body, no contexts |
| 4 — **implementation** | at the gate, the candidates. Once one is accepted, **the implementation itself**, then the feature's test output |
| 5 — **naming** | the candidate names, and the test whose outcome they name |

## The actuation is the anchor at every downstream hinge

1. Show the actuation at hinges 2 and 3, because what each one decides has no meaning apart from it.
2. The actuation shown at hinges 2 and 3 is context. It is not re-decided there. Everything shown from an earlier hinge is context, not an invitation to re-decide it.
3. At hinge 2, show the actuation bound to its explaining variable, then the observation's explaining variables and the `test` block.
4. At hinge 3, show the control declarations, then the actuation, then the observation. This is the complete test body, with the `context` blocks omitted.

## The contexts are shown once, where they are decided, and elided after

1. Hinge 1 establishes the outcome's structural placement: which class or feature contexts it nests under, mirroring the test's folder path.
2. Show the full `context` nesting at hinge 1, so the human judges where the outcome lives before anything else is built.
3. Do not repeat the contexts at the hinges after the first.
4. The full nesting returns when the turn-one test file is assembled and shown, after the three test hinges.

## The implementation is shown before the loop moves on from its hinge

1. Hinge 4 is where solubility is judged. An awkward implementation signals that the actuation is wrong.
2. Do not show the run alone at hinge 4. Showing only the run withholds the code the solubility judgment is made on.
3. Once a candidate is accepted, show the implementation first, ahead of the test and the feature's output.
4. Show the test and the feature's output with the implementation, per the after-any-implementation-hinge-show-the-test-output-for-the-current-feature rule.
5. Do not advance to naming before the implementation is on screen.

# TDD designs behavior, coverage prevents regression, and neither breaks an implementation

Source: system/design-by-efferent/source/tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation.md

1. TDD is a design activity. Its failing-test-then-implement cycle designs behavior, and its tests are proofs for design.
2. In TDD, the red drives the implementation into existence.
3. Adding test coverage is a separate activity. It prevents regression in existing behavior that is already designed and correct.
4. Coverage tests are regression prevention, not design proofs. Adding coverage is a testing or final-inspection process, not TDD.
5. When adding coverage, an uncontested test, one that passes without any implementation written to meet it, is inevitable and correct. Do not treat it as a defect to work around.
6. The stance that such a test is coverage rather than design is a DBE concern. It does not apply to adding coverage.
7. Never break, mutate, or otherwise invalidate a working implementation to introduce a test.
8. Do not break working code to "see it go red first." There is no red to manufacture when covering existing behavior.
9. When the behavior already exists and you are adding coverage, write the test and run it.
10. Accept the passing coverage test as verification, and leave the implementation untouched.
11. Reserve the failing-test-first cycle for design, where a test drives new behavior into existence.

# Test-first is the default, so never ask whether to start a task that way

Source: system/design-by-efferent/source/test-first-is-the-default-so-never-ask-whether-to-start-a-task-that-way.md

1. Test-first is the standing default for starting any task.
2. Do not ask "shall I start it test-first?".
3. Do not otherwise put the test-first decision to the human.
4. The answer is always yes unless told otherwise.
5. If the human wants a task started another way, they will give a different instruction.
6. When the next task is clear, begin it test-first without asking.
7. You may offer the next-task selection if useful.
8. Never frame the next-task selection as a test-first/not question.
9. Deviate from test-first only on an explicit instruction to do so.

## What this does not cover: the human's level of participation

1. Test-first is the method's substance: design is driven from the efferent side, and the test is written before the implementation.
2. Test-first is never put to the engineer.
3. Attended or unattended is a different question. It asks how often the loop stops, not what it builds.
4. The choice neither confirms nor declines the method.
5. A question with a genuinely situational answer is a decision, not a settled default. This rule does not forbid asking it.
6. See the attended-or-unattended-is-chosen-when-the-work-is-started rule.

# The actuation gate offers candidate actuations as options

Source: system/design-by-efferent/source/the-actuation-gate-offers-candidate-actuations-as-options.md

1. At the actuation gate, the first gate where the cradle is set, do not commit a single actuation and proceed.
2. Present the human a small set of candidate actuations as options to choose among.
3. The human either chooses the option that reads as the more soluble use, or takes the free-text option.
4. The free-text option lets the human dictate the actuation outright, or open a chat to work out what it should be.
5. The free-text option is mandatory and always present. It covers the case where the right shape is not among the options.
6. This is the form every hinge takes. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule for it and the two results it rests on.
7. Present each candidate as it would read at the use site.
8. Offer the candidates through the selection UI, which supplies the free-text option. Do not add a free-text option of your own. See the present-every-prompt rule.
9. A chosen candidate becomes the cradle. Where the human writes their own instead, take that actuation or enter a dialogue.
10. Settle the actuation before writing the test file. Do not proceed to the test body until it is settled.
11. A lone candidate is presented as every hinge presents one, beside `Explain`, with no candidate manufactured to reach two. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule.

## A candidate varies what the use site states

1. Make the candidates genuinely distinct efferent shapes, not cosmetic variants. Two actuations are distinct candidates when a reader at the use site sees different words.
2. Where the use site reads the same either way, the two are one candidate. Do not offer both. That pads the gate.
3. An omitted argument is a candidate. `upload.(file)` beside `upload.(file, retries: 3)` is a real pair.
4. The first makes the retry policy the object's own. The second makes every use site state the count.
5. An absent parameter is an interface decision, not the lack of one. Do not discard the shorter shape as the other with something missing.
6. A chained construction is not an actuation. `Upload.build(retries: 3).(file)` constructs and actuates in one expression.
7. The actuation in it is `upload.(file)`, with the constructed object bound to an explaining variable on its own line, leaving no intermediate unbound.
8. Do not offer a construction here. Construction belongs to the controls hinge.
9. A varied receiver is not a candidate. `Upload.(file, retries: 3)` beside `upload.(file, retries: 3)` is one shape reached two ways.
10. This hinge does not ask which interface carries the operation.
11. To apply the test, hold the receiver constant and ask what the use site states.

# The design of a test waits at the hinges, coverage included

Source: system/design-by-efferent/source/the-design-of-a-test-waits-at-the-hinges-coverage-included.md

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
10. Never change the implementation to resolve that awkwardness. Never break an implementation to introduce a test.

# The first DBE gate is the actuation and an unnamed assert

Source: system/design-by-efferent/source/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md

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
27. Propose each hinge and get it accepted before the next, per the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule.
28. Do not present the whole test file for a single accept.
29. Settle the three test hinges first, then assemble and show the file.
30. The exception to points 28 and 29 is when the engineer chose unattended work at the start, per the attended-or-unattended-is-chosen-when-the-work-is-started rule.

# The hinge cycle is actuation, observation, controls, implementation, and naming

Source: system/design-by-efferent/source/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md

1. Building the initial implementation of an outcome runs a cycle of five hinges, in the order below.
2. Hand each hinge to the human separately. Get it accepted before moving to the next.
3. **Actuation** is the invocation of the unit under test. It is the unit's efferent shape: name, arguments, arity, return.
4. **Observation** is what is asserted about the result. That covers value-equality vs. identity vs. a raised error, and what the explaining variable is compared against.
5. What the test reads is the side effect the actuation produces. A returned value is one such effect, a case rather than the rule.
6. An actuation that returns nothing still produces an effect somewhere. One that returns a value frequently produces others beside it.
7. The observation hinge asks which effect the test reads, and how it reads it. It does not assume the return.
8. **Controls** are the example constants the test is built from. That covers control form, nested vs. top-level, inner constants, Array vs. Hash seeding, and literals vs. controls.
9. **Implementation** is the code that satisfies the test.
10. The implementation hinge always has two candidates. One is the working implementation written directly. The other is the red/green/refactor cycle (see the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule).
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
37. This generalizes the the-actuation-gate-offers-candidate-actuations-as-options rule, which states the same mechanism at the first gate.
38. What goes on screen at each hinge is the each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once rule. That is the actuation as the anchor, and the contexts shown once.

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
6. The account does not apply under unattended work, where no hinge is put to the engineer. There the plan takes its place (see the attended-or-unattended-is-chosen-when-the-work-is-started rule).
7. Give the account after the participation decision, not before it.
8. Place the account immediately ahead of the first hinge.
9. The participation decision names no hinge, on purpose.

# The human deliberates the hinges, never the pass/fail bar

Source: system/design-by-efferent/source/the-human-deliberates-the-hinges-never-the-pass-fail-bar.md

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
12. Let the AI fill everything other than the actuation and the solubility verdict.

## The loop, by turn

1. **Human sets the cradle, the actuation.** The actuation is the contract and the highest-leverage hinge.
2. The AI may propose the actuation.
3. The human holds edit and veto power specifically on the actuation.
4. When the efferent shape is uncertain, the AI asks rather than averaging toward common code.
5. **The three test hinges produce turn one.** Put the actuation, the observation, and the controls to the human in turn, per the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule.
6. Assemble the test file once all three are accepted.
7. Never produce the whole test file at an earlier hinge.
8. The exception is when the engineer chose unattended work at the start. Then the agent decides each hinge and generates through (see the attended-or-unattended-is-chosen-when-the-work-is-started rule).
9. The human deliberates whether the actuation reads as soluble use, not the test mechanics: the testing framework and the ceremonies of using it. The actuation, observation, and controls, as well as the naming of things, are the test's content, not its mechanics.
10. If it does not, fix the cradle now, before any implementation exists.
11. **AI generates the implementation inside the cradle, straight through.**
12. The AI runs the test to confirm, as verification, not as the green half of a ceremony.
13. The human deliberates the unit's solubility.
14. If the unit only works by forcing an awkward actuation, fix the cradle, not the implementation.
15. **Loop by outcome.** Name the next distinct outcome of the same single actuation.
16. The AI adds an inner `context` and extends the implementation just enough.
17. The human deliberates solubility again.
18. **Exit on solubility, not coverage.** Stop when the unit has dissolved into the reader's understanding, not at an assertion count.
19. Keep turns small: one actuation, one outcome, so the cradle stays legible during deliberation.
