# Attended or unattended is chosen when the work is started; DBE is in effect either way

Work designed through DBE runs in one of two modes, chosen when a feature or an experiment is
started and held for its duration:

- **Attended** — human-in-the-loop. The loop **waits** at every hinge, and the engineer
  deliberates each one. **This is the default.**
- **Unattended** — the loop does not wait. The agent determines each hinge and decides it,
  generating through to the end of the work.

**DBE is in effect either way, and that is what makes this a cadence rather than a switch.**
Unattended is not DBE off. The **cradle** still holds — the efferent test written before the
implementation, the actuation designed from the use site, the generation steered toward
**solubility**. Every hinge is still determined; what changes is who decides it. The method is
untouched; only the stopping is.

**The choice is batch size.** Attended is **small-batch**: the engineer's attention is spent
continuously, and a wrong turn is caught at the hinge where it was taken, so rework stays near
zero. Unattended is **big-batch**: no attention is spent until the end, and a wrong turn is
found with everything built on top of it, so rework is the price. Which is cheaper depends on
how load-bearing the work is and how likely the first pass is to be right — a judgment about
*this* piece of work.

**It is asked at the start, through the selection UI, beside the working location.** Both are
choices about how the work will be conducted, both are made once, and both hold for its
duration — so they are put at the same gate rather than adding one. The default is attended,
and the option set says so.

**The mode is recorded in both records.**

- **The feature or experiment record** carries it as a **confirmation at the start**, beside
  the working-location choice. It is a lifecycle fact: what was chosen, when, and by whom.
- **The loop record declares it at the top**, because it changes how every cycle below is read.

**An unattended cycle is not written as though a engineer was consulted.** A loop record's
cycle ordinarily carries a hinge, the **options** put at the gate, and the **decision or chat**
that resolved it. Under unattended work the last two did not happen. So:

- The record **declares the mode once**, at the top.
- Each cycle records its **hinge** and **what was decided and why** — the reasoning the agent
  actually applied.
- There is **no Options line and no Decision / chat line**. Writing them would be a false
  record of a deliberation that never occurred.

**This is not the same as a hinge with no gate in an attended run.** The loop-records rule has a
form for that — *"none — no gate"* — and it exists to **surface a skipped gate as a defect**.
Under unattended work every hinge has no gate by choice, so marking each one that way would
report a run of failures where there was a declared mode. The mode declaration is what
distinguishes them, and it is why it goes at the top rather than being inferred cycle by cycle.

## Unattended presents a plan before it generates

**The engineer is out of the loop, so the plan is the only place they see the intended path
before the work is done.** Attended needs no plan. The loop waits at every hinge, and the sequence
of those waits is the plan.

**This is the one cheap moment of attention in a big-batch arrangement.** Unattended spends no
attention until the end, and a wrong turn is found with everything built on top of it. A plan read
before the work costs one reading and can move the whole path.

**The plan is a list.** Use an ordered list where each step rests on the one above it. Use a bullet
list where the steps are independent. This is the `language` package's
an-answer-is-a-list-and-prose-must-justify-itself rule, applied to a plan.

**Write the plan in Steve** — Simplified Technical English Vector, which is the STE dictionary and
the STE writing rules with Waytide's reserved terms. Short sentences. Active voice. No semicolon.
One idea in each item. A plan written in the raw standard could not name a `hinge`, an `actuation`,
a `cradle`, or `solubility`, because the STE dictionary does not approve them. See the `language`
package's ste rules.

**This is not a plan document.** `foundation`'s plans-convention governs a plan in
`waytide/local/plans/`, an intention in `waytide/local/intention/`, or an action in
`waytide/local/action/`, whichever the project's mode names. This plan is presented in the response,
before the agent generates, and it is not written to a file.

**Why:** the engineer's attention is the scarce thing the whole method is arranged around, and
the arrangement assumes it is always worth spending at a hinge. For work whose rework cost is
negligible that assumption is wrong, and five waits buy nothing — the ceremony this
method exists to discontinue, arriving by a different route. Making the cadence a choice puts the
trade where it belongs, with the person who knows what the work is worth. Keeping DBE in force
in both modes is what stops the choice from being a way out of the method: unattended work is
still designed from the efferent side, still cradled by a test written first, still judged by
solubility. And recording the mode honestly is what keeps the loop record worth reading — a
record that showed options put to a engineer who was not there would be worse than no record,
because it would be believed.

**How to apply:** at a feature's or an experiment's start, put **attended or unattended**
to the engineer through the selection UI alongside the working location, with attended as the
default. Record the choice as a confirmation in the feature or experiment record, and declare
it at the top of the loop record. Run the hinges either way. **When unattended, present the plan
as a list before generating, and write it in Steve.** Write each cycle
as its hinge and the decision with its reasoning, and write no Options or Decision / chat line.
Do not describe unattended work as suspending DBE — what is suspended is the waits. Related:
the loop-records rule (the record's shape and the "none — no gate" form this is distinct
from), the dbe-human-in-the-loop rule (why attention is placed at the hinges), the hinge-cycle
rule (the hinges that run either way), the never-ask-to-start-test-first rule (which forbids
asking about the method's substance, where this asks about its cadence), and foundation's
feature-lifecycle and experiment-lifecycle rules (the starts where the choice is put).

---

Authored by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:02:16 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:04:16 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
