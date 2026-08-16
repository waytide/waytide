# Experiment — Bullet list answers

## Question

**Should bullet lists be the required form for an agent's answers, with prose reserved for named
exceptions?** Not whether they read better — that is settled and recorded — but whether the
preference is a **rule**, and if so what it may require without breaking the answers it governs.

## Setup

- **State:** Affirmed
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/bullet-list-answers`
- **Base:** `5422551fed1310b7460f24fcae65f90933e1db17`
- **Working location:** branch only, chosen at initiation. This working tree switches back to
  `master` at the conclusion.
- **Participation:** attended, chosen at initiation. The loop stops at every hinge.

## Confirmations

The user confirmations this experiment's lifecycle required, recorded so the run's authority is
auditable:

1. **Working location, at initiation** — branch only, chosen through the selection interface. The
   current-branch option was named and marked unavailable, an experiment's branch not being
   optional.
2. **Participation, at initiation** — attended, chosen through the selection interface.
3. **The question itself, at initiation** — chosen among three readings rather than assumed from
   the experiment's name.
4. **Affirmation** — declared by the developer on 2026-08-07. The lifecycle reserves this to the
   user, and it was not inferred from the rule having been written.
5. **Merging without a passing suite** — confirmed specifically, on 2026-08-07. The lifecycle gates
   an affirmed merge on the experiment's tests passing and requires specific confirmation where
   nothing covers what the experiment produced. **This repository has no suite at all**, so the
   condition could not be met rather than having been failed, and what the experiment produced is a
   rule and a README line rather than code. The planning-directory check was green at the merge.
6. **Deleting the branch** — confirmed on 2026-08-07, after the merge. The branch was never pushed,
   so there is no remote branch and the single confirmation covers the whole deletion.

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

1. **The question held.** Bullet lists are the required form, written as
   `an-answer-is-a-list-and-prose-must-justify-itself` in `language`.
2. **Inverting the burden is the substance of the rule.** A rule saying *prefer lists* would leave
   prose available whenever it is easier, which is always. Requiring prose to name a justifying
   condition is what makes the difference survive a session boundary.
3. **Dependent reasoning is served by the form, not by an exception to it.** An unordered list
   asserts its items are parallel; a numbered list asserts sequence. The forecast treated prose as
   the remedy and was wrong.
4. **An explanation asked for is not a justification for prose**, refuted by this experiment's own
   session: every explanation requested outright was answered in a list.
5. **The expansion offer was not anticipated by the question or the forecast.** It was added by the
   developer mid-experiment, and it is the one element whose reliability is unproven.

## Misses

1. **Forecast 3 named the right problem and the wrong remedy.** It predicted that a naive
   requirement would damage reasoning whose steps depend on each other — correct — and assumed the
   remedy was prose. The remedy is an ordered list. The miss is instructive because it shows the
   forecast reasoning in the same terms the rule was written to displace: prose against lists,
   rather than one kind of list against another.
2. **Forecast 4 is unresolved and is affirmed anyway.** It predicted over-application — reasoning
   bulleted into fragments — which cannot be observed from writing a rule. Affirmation does not
   settle it, and nothing is lost by that: the rule itself records that experience decides whether
   the expansion line's timing needs tightening, and names the two stricter forms available. **The
   claim carried forward is the rule's, not this record's.**
3. **The experiment concluded before the thing it was most uncertain about could be tested**, which
   is a property of what it was testing rather than a defect in how it ran. A rule about how an
   agent answers can only be judged by an agent answering under it.

## Misses

Outcomes the forecast did not account for, recorded post hoc.

---

Authored by Scott Bellware on Fri Aug 7 2026 at 12:36:07 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:03:17 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:06:37 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:08:07 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 12:44:33 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:20:44 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
