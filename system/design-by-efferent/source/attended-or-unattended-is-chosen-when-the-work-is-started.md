# Attended or unattended is chosen when the work is started

Work designed through DBE runs in one of two modes, chosen when a feature or an experiment is started and held for its duration:

- **Attended** — human-in-the-loop. The loop **waits** at every hinge, and the engineer deliberates each one. **This is the default.**
- **Unattended** — the loop does not wait. The agent determines each hinge and decides it, generating through to the end of the work.

**DBE is in effect either way, and that is what makes this a cadence rather than a switch.** Unattended is not DBE off. The **cradle** still holds — the efferent test written before the implementation, the actuation designed from the use site, the code generation steered toward **solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding**. Every hinge is still determined.

What changes is who decides it. The method is untouched. Only the stopping is.

**The decision is batch size.** Attended is **small-batch**. The engineer's attention is spent continuously, and a wrong turn is caught at the hinge where it was taken. So rework stays near zero.

Unattended is **big-batch**: no attention is spent until the end. A wrong turn is found with everything built on top of it. Rework is the cost.

Which is cheaper depends on how load-bearing the work is, and on how likely the first pass is to be right. That is a judgment about *this* piece of work.

**It is asked at the start, through the selection UI, beside the working location.** The two are decisions about how the work will be conducted. Each is made once and holds for its duration. So they are put at the same gate rather than adding one. The default is attended, and the option set says so.

**The question is asked in these words:**

> Who decides?

with these options:

> **Attended** — You decide. The agent automates. (the default)
>
> **Unattended** — The agent decides and generates through.

**Neither the question nor an option names a hinge.** The words are fixed for that reason. The decision is put at a feature's or an experiment's **start**. An engineer meeting this system has not yet met a hinge, a gate, or the loop. So *the loop waits at each hinge* asks them to hold three reserved terms before they can answer. **Who decides** is answerable by anyone, and it is the whole of what the decision settles.

**The option says what each party does, in that order.** *You decide. The agent automates.* names the engineer's part first, because that part is what the engineer is choosing to keep or to give up. The unattended option names only the agent, because under it the engineer has no part.

**The vocabulary is not being avoided, only deferred.** The hinges are named the moment the loop reaches the first one, where the engineer sees an actuation rather than a definition.

**The mode is recorded in the two records.**

- **The feature or experiment record** carries it as a **confirmation at the start**, beside the working-location selection. It is a lifecycle fact: what was chosen, when, and by whom.
- **The loop record declares it at the top**, because it changes how every cycle below is read.

**An unattended cycle is not written as though an engineer was consulted.** A loop record's cycle ordinarily carries a hinge, the **options** put at the gate, and the **decision or chat** that resolved it. Under unattended work the last two did not happen. So:

- The record **declares the mode once**, at the top.
- Each cycle records its **hinge** and **what was decided and why** — the reasoning the agent actually applied.
- There is **no Options line and no Decision / chat line**. Writing them would be a false record of a deliberation that never occurred.

**This is not the same as a hinge with no gate in an attended run.** The a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule has a form for that — *"none — no gate"* — and it exists to **surface a skipped gate as a defect**. Under unattended work every hinge has no gate, by decision. Marking each one that way would report a run of failures where there was a declared mode. The mode declaration is what distinguishes them, and it is why it goes at the top rather than being inferred cycle by cycle.

## Unattended presents a plan before it generates

**The engineer is out of the loop, so the plan is the only place they see the intended path before the work is done.** Attended needs no plan. The loop waits at every hinge, and the sequence of those waits is the plan.

**This is the one cheap moment of attention in a big-batch arrangement.** Unattended spends no attention until the end, and a wrong turn is found with everything built on top of it. A plan read before the work costs one reading and can move the whole path.

**The plan is a list.** Use an ordered list where each step rests on the one above it. Use a bullet list where the steps are independent. This is the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule, applied to a plan.

**Write the plan in ETE.** That is Eventide Technical English: the STE dictionary and the STE writing rules, with Waytide's reserved terms. Short sentences. Active voice. No semicolon. One idea in each list item. The STE dictionary does not approve `hinge`, `actuation`, `cradle`, or `solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding`. A plan written in the raw standard could not name any of them. See the `language` package's ETE rules, in `ete/`.

**This is not a planning record.** `foundation` governs the project's planning records, which are written to a directory and kept. This plan is presented in the response, before the agent generates, and it is not written to a file.

**Why:** the engineer's attention is the scarce thing the whole method is arranged around. The arrangement assumes it is always worth spending at a hinge. For work whose rework cost is negligible that assumption is wrong, and five waits buy nothing. That is the ceremony this method exists to discontinue, arriving by a different route.

Making the cadence a decision puts the trade where it belongs, with the person who knows what the work is worth. Keeping DBE in force in the two modes is what stops the decision from being a way out of the method. Unattended work is still designed from the efferent side, still cradled by a test written first, and still judged by solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding.

A record that showed options put to an engineer who was not there would be worse than no record. It would be believed, and recording the mode honestly is what prevents that.

**How to apply:** at a feature's or an experiment's start, ask **attended or unattended** through the selection UI. Ask it alongside the working location. Attended is the default.

Ask it in the words fixed above: *Who decides?*, with *You decide. The agent automates.* and *The agent decides and generates through.* Name no hinge in the question or in an option.

Record the selection as a confirmation in the feature or experiment record. Declare it at the top of the loop record. Run the hinges either way.

**When unattended, present the plan as a list before generating, and write it in ETE.** Write each cycle as its hinge and the decision with its reasoning. Write no Options or Decision / chat line.

## Compressed

1. Work designed through DBE runs in one of two modes: attended or unattended.
2. Choose the mode when a feature or an experiment is started. Hold it for the work's whole duration.
3. **Attended** is human-in-the-loop. The loop waits at every hinge, and the engineer deliberates each one.
4. Attended is the default.
5. **Unattended**: the loop does not wait. The agent determines and decides each hinge, generating through to the end of the work.
6. DBE is in effect in both modes. Unattended is not DBE off.
7. The cradle still holds under unattended work. The efferent test is written before the implementation.
8. The actuation is still designed from the use site. Code generation is still steered toward solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding.
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
27. Do not mark unattended hinges with the a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature form *"none — no gate"*. That form surfaces a skipped gate in an attended run as a defect.

## Unattended presents a plan before it generates

1. Under unattended work, present a plan before generating.
2. Attended work needs no plan.
3. The plan is a list.
4. Use an ordered list where each step rests on the one above it.
5. Use a bullet list where the steps are independent.
6. Write the plan in ETE, per the `language` package's ETE rules in `ete/`.
7. ETE is the STE dictionary and writing rules, plus Waytide's reserved terms such as `hinge`, `actuation`, `cradle`, and `solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding`.
8. Use short sentences and active voice in the plan.
9. Use no semicolon in the plan.
10. Put one idea in each list item.
11. Present the plan in the response.
12. Do not write the plan to a file. It is not a `foundation` planning record.
13. **Why:** the engineer's attention is scarce. For work with negligible rework cost, waits at each hinge buy nothing. The person who knows the work's worth should choose the cadence. Keeping DBE in force stops the choice being a way out of the method. A record showing options put to an absent engineer would be believed, so the mode is recorded honestly. The plan is the one cheap moment of attention before big-batch work.

## History

Until Sun Oct 25 2026 this rule was named attended-or-unattended-is-chosen-at-the-start and titled "Attended or unattended is chosen when the work is started. DBE is in effect either way".

Related:

- the a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule — the record's shape and the "none — no gate" form this is distinct from
- the the-human-deliberates-the-hinges-never-the-pass-fail-bar rule — why attention is placed at the hinges
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule — the hinges that run either way
- the test-first-is-the-default-so-never-ask-whether-to-start-a-task-that-way rule — which forbids asking about the method's substance, where this asks about its cadence
- foundation's an-implementation-runs-on-a-branch-to-a-declared-end rule — the starts where the decision is put

---

Authored by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:02:16 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:04:16 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 8:21:33 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:35:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 6:24:18 AM PT
Changed by Scott Bellware on Thu Aug 13 2026 at 8:22:31 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:41:07 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 9:45:19 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:00:33 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:29 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:25:02 PM PT
