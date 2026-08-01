# Consider offering a failing implementation as a candidate at the implementation hinge

At the implementation hinge — the fourth of the five (the hinge-cycle rule) — the AI
proposes the code that satisfies the test. Whether a **deliberately failing
implementation** should be among the candidates offered there is an open question. The
proposal is that the hinge present, as a genuine option, an implementation written so
the new test fails, letting the developer choose to see the red before the satisfying
implementation is written.

The rules already in tension on this:

- **The contained red is permitted, but as a separate optional hinge.** The
  first-implementation-may-run-a-contained-red-green-loop rule allows a red at the first
  implementation of a unit, "permitted only if the failure is contained to the new test,"
  and instructs that red and green be treated as their own hinges presented through the
  selection UI. So a red is already reachable — the question is whether it should be a
  *candidate at the implementation hinge* rather than a *hinge preceding it*.
- **DBE rejects the pre-implementation failure as a checkpoint.** The dbe-as-design-tool
  rule is explicit: a test written before its implementation exists is trivially going to
  fail, that failure teaches nothing, and the loop does not stop to observe it. A red
  offered as an option at every implementation hinge risks reinstating exactly the
  ceremony that rule retires.
- **The two-option floor is a live pressure.** The present-every-prompt rule requires at
  least two options and forbids manufacturing cosmetic ones to reach the floor. The
  implementation hinge frequently has one real implementation, so a failing
  implementation is tempting as a reliable second option — which is precisely the
  temptation that rule warns against, unless the red is a *genuine* alternative rather
  than padding.

What has to be settled:

- **Is the red a genuine candidate or a procedural step?** A candidate is something the
  developer might *prefer*; a step is something they might *sequence*. If a failing
  implementation is never something a developer would choose as the implementation, it is
  not a candidate for that hinge and belongs where the red/green rule already puts it.
- **What the red actually buys.** Its one honest value is proving the test
  **discriminates** — that it can fail — which the containment constraint exists to make
  safe. Whether that is worth a gate, and at which hinge, is the substance of the
  question.
- **Whether it reaches coverage.** The tdd-designs-coverage-protects rule forbids breaking
  a working implementation to manufacture a red, and the hinges-gate-the-design-of-a-test
  rule makes the implementation hinge **degenerate** when covering existing behavior.
  Any change here must leave both untouched.

**Gated on:** nothing in flight blocks it; it is a methodology question about the hinge
cycle, not a task. The question is settled before the hinge-cycle rule or the
first-implementation-may-run-a-contained-red-green-loop rule is changed.

**Why:** the implementation hinge is where solubility is judged, and what the hinge offers
shapes what the developer deliberates. If a failing implementation is a genuine
alternative, withholding it costs the developer a real choice; if it is not, offering it
reinstates the red-bar ceremony DBE exists to retire and pads a hinge whose two-option
floor should instead be met by finding the real underlying decision.

## Amendment, 2026-08-01 — asking whether to run DBE at all

**Before starting the DBE cycle with the human in the loop, ask the developer whether they
want DBE or would prefer the agent to proceed unattended.**

This is a second question about the same thing the item above is about — how much of the
developer's attention the method spends — reached from the other end. The item asks what a
single hinge should offer; this asks whether the hinges should be run at all for a given piece
of work.

**The question is batch size.** Stated as the developer put it: the choice is whether the
process is **attended** — human-in-the-loop, with **small-batch interruptions** — or
**unattended**, which is **big-batch**, carrying the commensurate expectation of **higher
rework and its attendant cost**.

That framing does two things the amendment above could not do on its own.

- **It says what the two answers mean.** Unattended is not *DBE off*. It is the same
  generation run in one large batch instead of many small ones, with the gates removed. The
  cradle, the efferent-first actuation, and the solubility standard are unaffected by batch
  size; what changes is how much is produced before a person looks.
- **It makes the answer situational, which is what separates this from the test-first
  prohibition.** never-ask-to-start-test-first holds that asking is ceremony *because the
  answer is always yes*. Here the answer is a trade with two real sides: small batches spend
  the developer's attention continuously and keep rework near zero; big batches spend none
  until the end and pay for it in rework when the batch is wrong. Which is cheaper depends on
  how load-bearing the work is and how likely the first pass is to be right — a judgment about
  *this* piece of work, not a default to be confirmed. A question with a genuinely situational
  answer is a decision, and the rule's reasoning does not reach it.

**What follows from it, and still has to be settled:** rework cost is the term the decision
turns on, so the prompt is only worth asking where the two batch sizes actually differ in it.
That is a criterion, not a standing prompt — and it bears directly on the granularity question
below, since the rework exposure of a session, a feature, and a single unit are not the same.

**It is in direct tension with a rule now in force, and that is what has to be settled.** The
never-ask-to-start-test-first rule says: *"Do not ask 'shall I start it test-first?' or
otherwise put the test-first decision to the human — there is nothing to deliberate at that
point; the answer is always yes unless told otherwise."* Its reason is that *"asking confirms a
settled default and spends a turn on a non-decision"* and is *"ceremony, the same failure DBE
retires."* An upfront DBE-or-unattended prompt is that prompt, or something very near it.

**What separates them, if anything does, has to be named:**

- **Test-first versus attended.** The existing rule forbids asking about *test-first*, which is
  the method's substance. The amendment asks about *human-in-the-loop gating*, which is its
  cost. Those may be different questions wearing the same shape — a developer can want the
  design driven from the efferent side without wanting to be stopped at five hinges.
- **Whether the answer is genuinely open — answered by the batch framing above.** The existing
  rule's justification is that the answer is always yes. The batch trade has two real sides, so
  the answer is situational and this is a decision rather than a confirmed default.
- **Where the precedent already sits.** Suspending DBE is already possible, and already
  user-initiated: the experiment-runs-on-its-own-branch rule says *"A user may instruct the
  agent to suspend DBE for the experiment — which requires specific user confirmation."* So the
  capability exists and the developer opens it. The amendment would move the initiative to the
  agent, at the start of every piece of work.
- **What unattended means, exactly — answered by the batch framing above.** It suspends the
  gates, not the method. The cradle, the efferent-first actuation, and the solubility standard
  are unaffected by batch size.
- **How often it would fire, and against what.** A prompt at the start of every piece of work
  is the cost profile the existing rule objects to. Whether it is asked once per session, per
  feature, or per unit changes the answer.

**How to apply:** settle the question first — decide whether a failing implementation is a
candidate at the implementation hinge, remains a separate optional hinge as the
contained-red/green rule has it, or is dropped as a candidate entirely — and record the
decision in `waytide/local/log/`. Settle the amendment's question separately: whether the agent
asks attended-or-unattended before running the hinges, and if so at what granularity and with
what the two answers actually mean. Reconcile whatever is decided with the
never-ask-to-start-test-first rule, which currently forbids the nearest thing to it — either by
distinguishing the two questions in that rule's own words or by changing it. Only then conform
the hinge-cycle rule, the first-implementation-may-run-a-contained-red-green-loop rule, and the
present-every-prompt rule's two-option guidance to it. Delete this file when it is carried out,
and log that it was done. Related: the hinge-cycle rule (the implementation hinge), the
first-implementation-may-run-a-contained-red-green-loop rule, the dbe-as-design-tool rule
(the failure that teaches nothing), the present-every-prompt rule (the two-option floor),
the no-green-on-arrival-tests rule (the no-op implementation hinge), the
tdd-designs-coverage-protects and hinges-gate-the-design-of-a-test rules (the coverage
case, where the implementation hinge is degenerate), the never-ask-to-start-test-first rule
(which forbids the nearest thing to the amendment's prompt), and the human-in-the-loop and
experiment-runs-on-its-own-branch rules (where suspending DBE already exists and is
user-initiated).

---

Authored by Scott Bellware on Fri Jul 24 2026 at 9 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:40:18 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:44:27 PM PT
