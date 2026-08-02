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

**Priority:** 2

**Gated on:** nothing in flight blocks it; it is a methodology question about the hinge
cycle, not a task. The question is settled before the hinge-cycle rule or the
first-implementation-may-run-a-contained-red-green-loop rule is changed.

**Why:** the implementation hinge is where solubility is judged, and what the hinge offers
shapes what the developer deliberates. If a failing implementation is a genuine
alternative, withholding it costs the developer a real choice; if it is not, offering it
reinstates the red-bar ceremony DBE exists to retire and pads a hinge whose two-option
floor should instead be met by finding the real underlying decision.

**How to apply:** settle the question first — decide whether a failing implementation is a
candidate at the implementation hinge, remains a separate optional hinge as the
contained-red/green rule has it, or is dropped as a candidate entirely — and record the
decision in `waytide/local/log/`. Only then conform the hinge-cycle rule, the first-implementation-may-run-a-contained-red-green-loop rule, and the
present-every-prompt rule's two-option guidance to it. Delete this file when it is carried out,
and log that it was done. Related: the hinge-cycle rule (the implementation hinge), the
first-implementation-may-run-a-contained-red-green-loop rule, the dbe-as-design-tool rule
(the failure that teaches nothing), the present-every-prompt rule (the two-option floor),
the no-green-on-arrival-tests rule (the no-op implementation hinge), the
tdd-designs-coverage-protects and hinges-gate-the-design-of-a-test rules (the coverage
case, where the implementation hinge is degenerate), and the deferred item *Ask whether the
process is attended or unattended before running the DBE cycle*, separated from this one on
2026-08-01 — both are about what the method's gating costs, this one from inside a single hinge
and that one from before the cycle begins.

---

Authored by Scott Bellware on Fri Jul 24 2026 at 9 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:40:18 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:44:27 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:51:32 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:35:18 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 6:07:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
