# The actuation gate: offer candidate actuations as options; the human chooses one or originates their own

At the actuation gate — the first gate, where the cradle is set — the AI does not commit a single actuation and proceed. It presents the human a small set of **candidate actuations** as options to choose among. The human then either:

- **chooses** the option that reads as the more soluble use, or
- takes the **origination escape** — dictating the actuation outright, or opening a chat to work out what it should be.

This is how the highest-leverage hinge — the efferent shape of the actuation — is handed over for deliberation: by comparing concrete alternatives, with an always-open escape into dictation or dialogue when the right shape isn't among the options.

The form is deliberate. It is the operationalization of the two results the gates rest on (see the DBE vocabulary):

- **Provoke origination, not mean-bias — so present alternatives, not a fait accompli.** A single proposed actuation ("here's my actuation — approve?") puts the human in judge mode, downstream of the AI's mean-drawn answer, exerting mean-bias and lowering the human toward the average. Offering several genuine options keeps the human originating — comparing real candidate shapes for solubility — rather than ratifying.
- **The best options are ones the AI can't produce — so the escape is mandatory.** The option set is the AI's own, drawn from the average; the best actuation is often one only the human can produce, and showing a closed list tempts the human to pick from it instead of producing their own. The escape is what keeps the human above the AI's mean — never boxed into the AI's option set.

## A candidate varies what the use site states

**That is the whole test.** Two actuations are distinct candidates when a reader at the use site
sees different words. Where the use site reads the same either way, the two are one candidate, and
offering both pads the gate.

**An omitted argument is a candidate.** `upload.(file)` beside `upload.(file, retries: 3)` is a
real pair. The first makes the retry policy the object's own and leaves every use site identical.
The second makes every use site state the count. **Whether a value reaches the use site is the
efferent decision**, so an absent parameter is a choice about the interface rather than the lack of
one. This is the case most easily discarded, because the shorter shape reads as the other one with
something missing.

**A chained construction is not an actuation.** `Upload.build(retries: 3).(file)` constructs and
actuates in one expression. The actuation in it is `upload.(file)`, with the constructed object
bound to an explaining variable on its own line. Construction is the **controls** hinge's concern,
so a construction offered here takes a decision out of the hinge that owns it. The chain also
leaves an intermediate unbound, against the way every test file is written.

**A varied receiver is not a candidate.** `Upload.(file, retries: 3)` beside
`upload.(file, retries: 3)` is one shape reached two ways. Which interface carries the operation is
a real question, and this hinge does not ask it.

**Why the test is worth stating.** The rule already refuses a cosmetic variant, and an agent that
could tell a cosmetic variant from a real one would not have produced one. A named test gives the
agent something to apply: hold the receiver constant, and ask what the use site states. Without it
the gate fails in both directions at once — three shapes offered where one decision exists, and the
omitted-argument shape discarded as no shape at all.

**Why:** The actuation is the cradle and the highest-leverage hinge (human-in-the-loop rule, step 1: "the AI may propose the actuation… asks rather than averaging"). Concrete alternatives make the deliberation tractable and provoke origination; the mandatory escape keeps the human above the AI's mean when the right actuation is one the AI couldn't produce. Together they let the AI carry the proposing work without pulling the human's judgment down to the mean.

**How to apply:** At the first gate, generate a few genuinely distinct candidate actuations — different efferent shapes, not cosmetic variants — each presented as it would read at the use site. **Judge distinctness by what the use site states**: keep a shape that omits an argument, and drop a chained construction and a varied receiver. Offer them through the selection UI, whose built-in free-text choice *is* the origination escape (do not add an escape option of your own — see the present-every-prompt rule). If the human chooses one, adopt it as the cradle. If the human originates instead, take their dictated actuation or enter a dialogue, and settle the actuation before writing the test file. Do not proceed to the test body until the actuation is settled. **When a hinge has no genuinely distinct candidates, do not manufacture them** — present the one candidate as the option, in the form every other option takes, with the escape still open. **Do not replace it with an `Accept` label**: the option is the artifact, and the single case changes nothing about that (see the hinge-cycle rule). This mechanism — the candidates as options, with the escape — applies at **every** hinge of the cycle (actuation, observation, controls, implementation, naming), not only the actuation — see the hinge-cycle rule. Related: the hinge-cycle, human-in-the-loop, first-turn, DBE-as-design-tool, and present-every-prompt rules, the DBE vocabulary, the `testing` package's tdd-test-structure rule (where the actuation is bound to an explaining variable), and the `code/ruby` package's no-inline-method-call-arguments rule (the same discipline in the library source).

---

Authored by Scott Bellware on Sat Jun 27 2026 at 1 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 7:40:50 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
