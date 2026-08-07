# Experiment — Bullet list answers

## Question

**Should bullet lists be the required form for an agent's answers, with prose reserved for named
exceptions?** Not whether they read better — that is settled and recorded — but whether the
preference is a **rule**, and if so what it may require without breaking the answers it governs.

## Setup

- **State:** In flight
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/bullet-list-answers`
- **Base:** `5422551fed1310b7460f24fcae65f90933e1db17`
- **Working location:** branch only, chosen at initiation. This working tree switches back to
  `master` at the conclusion.
- **Gating cadence:** attended, chosen at initiation. The loop stops at every hinge.

## What prompted it

The preference is established and has been stated repeatedly rather than once:

- **2026-08-01, stated outright** — *speak with less prose and more bullet points, communicate only
  the essentials, no editorializing, be a scientist rather than Shakespeare.*
- **2026-08-06** — no back-references by number or position, and no definite description standing in
  for a thing without identifying it.
- **2026-08-06, on the confirmed form** — a flat bullet list of actions, each naming the file it
  acts on, no preamble and no closing.

**A preference restated is a rule that has not been written.** Every restatement is evidence the
agent does not hold it between sessions, which is precisely what a rule read at the start of every
session is for.

## Forecast

Committed before the work.

1. **The rule is worth writing, and the experiment is affirmed.** The preference is stable, has
   been stated three times across a week, and is about how an agent communicates — which the
   `language` package already governs.
2. **The hard part is not the requirement but the exceptions**, and getting them wrong is what
   would refute this. Candidate exceptions: an explanation asked for in so many words, a record or
   rule written to be read as a document, and a single-sentence answer that a bullet would only
   decorate.
3. **A naive requirement would damage some answers.** An argument whose steps depend on each other
   reads worse as bullets, because a list asserts its items are parallel and independent. Where a
   conclusion follows *from* the item above it, the form misstates the relationship.
4. **The likeliest failure is over-application** — an agent bulleting reasoning that needed to be
   sequential, and producing a list of fragments that is shorter to read and harder to follow.
5. **The rule most likely belongs in `language`**, beside `communicate-plainly-name-the-thing`,
   which already governs how the agent addresses the developer rather than only what goes into the
   code. A local rule here would bind one project, and the preference is not project-specific.

## What actually happened

To be recorded against the forecast as the work proceeds.

**The rule is written**, in `language`, as `an-answer-is-a-list-and-prose-must-justify-itself`.
Against the forecast so far:

1. **Forecast 2 held.** The exceptions were the hard part, and settling them took most of the
   cycles.
2. **Forecast 3 was wrong in an instructive way.** It predicted a naive requirement would damage
   answers carrying dependent reasoning, and treated prose as the remedy. The remedy is a
   **numbered list** — an unordered list asserts its items are parallel, an ordered one asserts
   sequence, so the case is served inside the form. Dependent reasoning is therefore not an
   exception at all.
3. **A candidate the forecast named was refuted by this session's own answers.** *An explanation
   asked for* was listed as a likely exception. Every explanation the developer asked for outright
   was answered in a list, and none was harder to follow for it.
4. **Forecast 5 held and was settled early**, by the developer directly rather than by the work.
5. **An element the forecast did not anticipate was added by the developer** — after a list answer,
   the developer is offered an expanded one. Nothing in the question implied it.

## What the experiment now watches for

**Forecast 4 — over-application — cannot be judged from writing the rule.** It is a claim about
what an agent does under the rule over time, so the experiment stays open until use produces
evidence. Two things in particular:

1. **Whether reasoning gets bulleted into fragments** — items shorter to read and harder to follow
   than the sentences they replaced. This is the failure forecast 4 named.
2. **Whether the expansion line's timing holds.** It rests on the agent judging that it compressed
   something out, which is the faculty the rule exists because of. The rule records two stricter
   forms — appending the line to every list answer, or above a length threshold — and states that
   neither is adopted in advance of evidence that the judgment fails. **What settles that is
   experience, not argument**, which is why the experiment is not concluded on the rule being
   written.

## Findings

To be recorded.

## Misses

The outcomes that escaped the forecast, recorded post hoc.

---

Authored by Scott Bellware on Fri Aug 7 2026 at 12:36:07 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:03:17 PM PT
