# The initial-implementation hinge cycle: actuation → observation → controls → implementation → naming

Building the initial implementation of an outcome runs a cycle of **five hinges**, each handed to the human separately and accepted before moving to the next:

1. **Actuation** — the invocation of the unit under test (its efferent shape: name, arguments, arity, return).
2. **Observation** — what is asserted about the result (value-equality vs. identity vs. a raised error; what the explaining variable is compared against). **What the test reads is the side effect the actuation produces.** A returned value is one such effect, and it is a **case rather than the rule** — an actuation that returns nothing still produces an effect somewhere, and an actuation that returns a value frequently produces others beside it. So the hinge asks **which effect the test reads, and how it reads it**, rather than assuming the return.
3. **Controls** — the example constants the test is built from (which control form, nested vs. top-level, what inner constants, Array vs. Hash seeding, literals vs. controls).
4. **Implementation** — the code that satisfies the test. This hinge always has two candidates: the working implementation written directly, or the **red/green/refactor cycle** (see the the-implementation-hinge-offers-the-red-green-refactor-cycle rule).
5. **Naming** — the outcome `context` that names what the observation establishes (the test's name).

The first three concern the test (turn one); the fourth is the implementation (turn two). Only after the actuation, observation, and controls are accepted does the AI assemble and show the turn-one test file (per the first-turn rule); then it proposes the implementation as the fourth hinge, and — once that is accepted — writes it, runs the suite, and shows the test with its result. The fifth hinge, **naming**, is **deferred to the feature's close** (per the first-turn rule, the cradle and its outcomes are developed unnamed): once the feature's outcomes are implemented, each outcome's name is settled as its own hinge — via options, per the one-outcome-at-a-time naming rule. For a single-outcome feature, naming directly follows the implementation hinge.

## The five are named before the first one is put

**Before the first hinge, the agent gives a brief account of all five.** What a hinge is, the five
in order with one line each, and what the loop does between them:

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

**It is given once**, when the loop starts on a piece of work — not at each cycle and not at each
outcome. A passage repeated at every hinge stops being read, which is the failure the
announce-waytide-at-session-start rule names about a permanent line.

**It does not apply under unattended work**, where no hinge is put to the engineer at all. There
the plan takes its place (see the attended-or-unattended-is-chosen-at-the-start rule).

**It comes after the participation choice, not before it.** That choice names no hinge on purpose,
because it is asked at a feature's or an experiment's start and the engineer has met nothing yet.
This account is where they meet the five, and it sits immediately ahead of the first one.

**Why:** the actuation hinge asks for a decision, and an engineer answering it does not otherwise
know that four more follow, what those cover, or what happens in between. Without the account they
weigh the actuation as though it were the whole of what is being asked, and every question the
account would have answered arrives at a later hinge instead — one at a time, in the middle of
another decision. Six lines given once removes all of them.

**The handoff mechanism at every hinge:** where there are genuinely distinct options, present them **as options**. Where there is one, present that one the same way. **In both cases, always offer the origination escape** — the human dictating outright, or a chat to work out the answer. Never pass a hinge without the human's acceptance. Every hinge is presented through the selection UI, whose built-in free-text choice *is* that escape — see the present-every-prompt rule.

**An option is the artifact, not a label for it.** The option reads `assert(retries == 3)` or `Controls::Upload.example(client: control_client, retries: 3)` — the line that would be written, shown as it would be written. A gloss may follow it where the difference between two candidates is not visible in the code alone. **A label standing in place of the artifact is not an option**: `Accept — assert the returned count against 3` asks the engineer to approve a description of a thing rather than to read the thing. The engineer is judging a design, and the design is in the characters.

**So a hinge with one candidate is not an "accept" prompt.** It shows that candidate as its option, exactly as a hinge with three shows three, and selecting it is the acceptance. Nothing about the single case changes the form. **What is still forbidden is manufacturing a second candidate** to avoid the appearance of a foregone conclusion. Not every hinge has real alternatives, and the escape is what keeps a lone candidate from foreclosing the answer — the best choice is often one only the human can produce. This generalizes the actuation-gate-options-or-chat rule, which states the same mechanism at the first gate.

**Why:** Each of the five is a real design hinge with its own failure mode — including the implementation, where solubility is judged (an awkward implementation reveals a bad cradle, and the fix then goes to the cradle, not the code), and the naming, where a name that mis-describes what the observation establishes is a design error in its own right (the outcome taxonomy is a design artifact, settled deliberately, not a label applied after the fact). Bundling collapses separate deliberations into one judgment and puts the human in judge-mode on a fait accompli — the mean-bias failure. Separating them — each with a mandatory escape — keeps the human originating at every hinge, where the above-the-mean choice is introduced rather than ratified. The observation and the controls especially had been smuggled in under the actuation's gate; the controls are a hinge in their own right (a non-discriminating example asserts nothing — e.g. a top-level constant can't distinguish a full name from a final segment).

**How to apply:** Give the brief account of the five hinges once, ahead of the first one, and not again. Then run the five in order (naming deferred to the feature's close). At each: present every genuine candidate as an option, written as the artifact itself rather than as a label for it, and present a lone candidate the same way — always with the origination escape. What goes on screen at each hinge — the actuation as the anchor, the contexts shown once — is the what-each-hinge-displays rule. Assemble and show the turn-one test after the three test hinges; propose the implementation, then (on acceptance) write it and show the test + run result for the fourth. At the feature's close, settle the **naming** hinge — add each outcome's `context` via options, one outcome at a time. This is the **initial**-implementation cycle for one outcome; looping to further outcomes extends the implementation and re-enters at the relevant hinges, with naming settled for all at the close. Related: the what-each-hinge-displays rule, the first-turn rule (the three test hinges produce turn one), the human-in-the-loop rule (actuation and solubility were the original two hinges; the implementation hinge is that solubility judgment made an explicit acceptance), the actuation-gate-options-or-chat rule (the same mechanism at the first gate), the one-outcome-at-a-time rule, and the show-the-test-after-implementing rule.

---

Authored by Scott Bellware on Sun Jun 28 2026 at 8 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 6:37:11 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
