# Ask whether the process is attended or unattended before running the DBE cycle

**Before starting the DBE cycle with the human in the loop, ask the developer whether they
want DBE attended or would prefer the agent to proceed unattended.**

**The question is batch size.** The choice is whether the process is **attended** —
human-in-the-loop, with **small-batch interruptions** — or **unattended**, which is
**big-batch**, carrying the commensurate expectation of **higher rework and its attendant
cost**.

**Unattended is not DBE off.** It is the same generation run in one large batch instead of
many small ones, with the gates removed. The cradle, the efferent-first actuation, and the
solubility standard are unaffected by batch size; what changes is how much is produced before
a person looks.

**It is in direct tension with a rule now in force, and that is the substance of the
question.** The never-ask-to-start-test-first rule says: *"Do not ask 'shall I start it
test-first?' or otherwise put the test-first decision to the human — there is nothing to
deliberate at that point; the answer is always yes unless told otherwise."* Its reason is that
*"asking confirms a settled default and spends a turn on a non-decision"* and is *"ceremony,
the same failure DBE retires."* An upfront attended-or-unattended prompt is that prompt, or
something very near it.

**What the batch framing already answers:**

- **Whether the answer is genuinely open.** The existing rule's justification is that the
  answer is always yes. A batch trade has two real sides — small batches spend the developer's
  attention continuously and keep rework near zero; big batches spend none until the end and
  pay for it in rework when the batch is wrong. Which is cheaper depends on how load-bearing
  the work is and how likely the first pass is to be right, which is a judgment about *this*
  piece of work rather than a default to be confirmed. A situational answer is a decision, and
  the rule's reasoning does not reach it.
- **What the two answers mean.** Stated above: the gates are suspended, the method is not.

**What is still open:**

- **Test-first versus attended, as distinct questions.** The existing rule forbids asking about
  *test-first*, which is the method's substance. This asks about **gating**, which is its cost.
  They may be different questions wearing the same shape — a developer can want the design
  driven from the efferent side without wanting to be stopped at five hinges. Whether that
  distinction holds, and whether it is stated in that rule's own words or the rule is changed,
  has to be settled.
- **The precedent, which runs the other way.** Suspending DBE is already possible and already
  **user-initiated**: the experiment-runs-on-its-own-branch rule says *"A user may instruct the
  agent to suspend DBE for the experiment — which requires specific user confirmation."* The
  capability exists and the developer opens it. This proposal moves the initiative to the agent.
- **Granularity, which the batch framing makes decisive.** Rework cost is the term the decision
  turns on, so the prompt is only worth asking where the two batch sizes actually differ in it —
  and the rework exposure of a session, a feature, and a single unit are not the same. That
  makes it a **criterion** rather than a standing prompt, and settling the criterion is settling
  the granularity.

**Gated on:** nothing in flight. It is a methodology question about how the loop is entered,
not a task.

**Why:** DBE places the developer's attention at the hinges because that is where design
judgment has leverage, and it retires ceremony wherever attention is spent on a non-decision.
Both halves of that reasoning are in play here: a prompt that fires on every piece of work is
the ceremony the method rejects, and a method that gates five times on work whose rework cost
is negligible is spending attention where it has no leverage. The batch framing is what makes
the trade legible rather than a matter of preference, and the open questions are all about
where the line falls.

**How to apply:** settle whether the agent asks attended-or-unattended before running the
hinges, at what granularity, and against what criterion — the batch framing says the prompt is
worth asking only where rework cost actually differs between the two. Reconcile whatever is
decided with the never-ask-to-start-test-first rule, which currently forbids the nearest thing
to it, either by distinguishing the two questions in that rule's own words or by changing it.
Record the decision in `waytide/local/log/`, then conform the hinge-cycle and human-in-the-loop
rules. Delete this file when it is carried out, and log that it was done. Related: the
never-ask-to-start-test-first rule (which forbids the nearest thing to this prompt), the
human-in-the-loop rule (where the developer's attention is placed and why), the hinge-cycle
rule (the five gates whose cost this is about), the dbe-as-design-tool rule (ceremony as the
failure mode), the experiment-runs-on-its-own-branch rule (where suspending DBE already exists
and is user-initiated), and the deferred item *Consider offering a failing implementation as a
candidate at the implementation hinge*, which this was separated from — both are about what the
method's gating costs, that one from inside a single hinge and this one from before the cycle
begins.

---

Authored by Scott Bellware on Sat Aug 1 2026 at 4:51:32 PM PT
