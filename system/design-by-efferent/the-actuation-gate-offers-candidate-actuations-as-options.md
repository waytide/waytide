# The actuation gate offers candidate actuations as options

At the actuation gate — the first gate, where the cradle is set — the AI does not commit a single actuation and proceed. It presents the human a small set of **candidate actuations** as options to choose among. The human then either:

- **chooses** the option that reads as the more soluble use, or
- takes the **free-text option** — dictating the actuation outright, or opening a chat to work out what it should be.

This is how the highest-leverage hinge is handed over for deliberation, that hinge being the efferent shape of the actuation. The engineer compares concrete alternatives. The free-text option, always there, covers the case where the right shape is not among the options.

The form is deliberate. It is the form every hinge takes, and the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule states it and the two results it rests on: the human produces the answer rather than approving one, and the free-text option is mandatory because the best answer is often one only the human can produce.

## A candidate varies what the use site states

**That is the whole test.** Two actuations are distinct candidates when a reader at the use site sees different words. Where the use site reads the same either way, the two are one candidate, and offering the two of them pads the gate.

**An omitted argument is a candidate.** `upload.(file)` beside `upload.(file, retries: 3)` is a real pair. The first makes the retry policy the object's own and leaves every use site identical. The second makes every use site state the count.

**Whether a value reaches the use site is the efferent decision.** So an absent parameter is a decision about the interface rather than the lack of one. This is the case most easily discarded, because the shorter shape reads as the other one with something missing.

**A chained construction is not an actuation.** `Upload.build(retries: 3).(file)` constructs and actuates in one expression. The actuation in it is `upload.(file)`, with the constructed object bound to an explaining variable on its own line. Construction is the **controls** hinge's concern, so a construction offered here takes a decision out of the hinge that owns it. The chain also leaves an intermediate unbound, against the way every test file is written.

**A varied receiver is not a candidate.** `Upload.(file, retries: 3)` beside `upload.(file, retries: 3)` is one shape reached two ways. Which interface carries the operation is a real question, and this hinge does not ask it.

**Why the test is worth stating.** The rule already refuses a cosmetic variant, and an agent that could tell a cosmetic variant from a real one would not have produced one. A named test gives the agent something to apply: hold the receiver constant, and ask what the use site states. Without it the gate fails in both directions at once. Three shapes are offered where one decision exists, and the omitted-argument shape is discarded as no shape at all.

**Why:** The actuation is the cradle and the highest-leverage hinge (human-in-the-loop rule, step 1: "the AI may propose the actuation… asks rather than averaging"). Concrete alternatives make the deliberation tractable, and they make the human produce the answer. The mandatory free-text option keeps the human above the AI's mean when the right actuation is one the AI couldn't produce. Together they let the AI carry the proposing work without pulling the human's judgment down to the mean.

**How to apply:** At the first gate, generate a few genuinely distinct candidate actuations. They are different efferent shapes rather than cosmetic variants. Present each as it would read at the use site.

**Judge distinctness by what the use site states.** Keep a shape that omits an argument. Drop a chained construction and a varied receiver.

Offer them through the selection UI, which supplies the free-text option. Do not add one of your own. See the present-every-prompt rule.

If the human chooses one, adopt it as the cradle. If the human writes their own instead, take that actuation or enter a dialogue. Settle the actuation before writing the test file. Do not proceed to the test body until the actuation is settled.

**A lone candidate is presented as every hinge presents one**, beside `Explain`, with no candidate manufactured to reach two. See the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule.

Related:

- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
- human-in-the-loop
- first-turn
- DBE-as-design-tool
- present-every-prompt rules
- the DBE vocabulary
- the `testing` package's a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context rule — where the actuation is bound to an explaining variable
- the `ext/ruby-lang` package's no-inline-method-call-arguments rule — the same discipline in the library source
