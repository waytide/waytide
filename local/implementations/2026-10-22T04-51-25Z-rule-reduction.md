# Experiment — Rule reduction

**Tags:** [experiment]

## Question

**Can the rules a session reads be reduced — in their content, in how they are read, and in how they arrive — and sessions still behave the same?**

It realizes the item *Reducing rule files to their essential directives*, `local/items/2026-09-09T20-36-50Z-reducing-rule-files-to-their-essential-directives-OPEN.md`, and its plan.

## Phases

One at a time, in this order, each on its own branch from the experiment's.

1. **flattening** — `experiment/worktree/rule-reduction.flattening`. Can each rule be flattened to its essential content — present directives and their reasons — and sessions behave the same? *Same effect and outcome* is the engineer's test for what is essential.
2. **packaged-script** — `experiment/worktree/rule-reduction.packaged-script`. Does one packaged script that prints every rule in a fixed order shorten the session-start read?
3. **additional-context** — `experiment/worktree/rule-reduction.additional-context`. Can the session-start hook deliver the rules to the agent before its first response, with no read at all?

## State

**Suspended by the engineer on 2026-10-22**, during phase 1, flattening. The phase branch `experiment/worktree/rule-reduction.flattening` and the worktree are kept. The record's full account of phase 1 is on the phase branch. Phase 1 had reached this point:

- **Five rules compressed:** #2, #7, #11, #12, and #15. Each passed the predictability simulation, with one miss in 150 answers.
- **The directive check run on #15:** its one material loss of precision, the missing-upstream decision, was restored.
- **The directive check run on #11:** two directives were found lost outside the intended resolution, and are not restored.

**Whether a compressed rule has the same effect as its source remains open.**

**Resumed by the engineer on 2026-10-22.** The State line is removed, since absence is the in-progress state, and work continues on the phase branch in the worktree.

## Setup

- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/worktree/rule-reduction`
- **Base:** `5979ee0`, from `master` — the commit that records this experiment
- **Working location:** branch and worktree, chosen at the start. The worktree is `/Users/sbellware/projects/waytide/waytide-experiment-worktree-rule-reduction`, and this working tree stays on `master`.
- **Participation:** attended, chosen at the start.
- **The first phased experiment.** The implementation-lifecycle rule gained its account of phases for it, in `241a95b`.

## Forecast

Committed before the work. Each item carries the agent's confidence.

**Phase 1 — flattening**

1. **The compiled read shrinks by 10% to 25%.** The history moved in the derived-rule-files experiment was 0.8%, so most of the saving has to come from restating, not from moving. *Moderate confidence.*
2. **Sessions answer representative requests the same from the flattened read as from today's**, as the derived-rule-files experiment found for footers and history. *Moderate confidence.*
3. **For a few rules, what is essential is the engineer's judgment rather than the agent's**, as passage 45 of the obsolete-rules experiment was. *Moderate confidence.*

**Phase 2 — packaged-script**

4. **The read falls to one to three tool calls, and its median duration falls well below the variance measured so far — under 20 seconds.** *Moderate confidence.*
5. **The printed rules exceed what one tool result carries**, so the harness saves the output to a file and the agent reads it in parts, giving back some of the saving. *Moderate confidence.*

**Phase 3 — additional-context**

6. **Delivering every rule this way is refuted by size alone.** The channel is capped at 10,000 characters and the compiled read is about 547,000. *High confidence.*
7. **A part of the rules fits, and what fits is not enough to stand in for the read.** *Low confidence.*

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| The phases, and their order | flattening, packaged-script, additional-context | Wed Oct 21 2026 at 9:51:25 PM PT |
| Branch names | the base, then a dot and the phase | Wed Oct 21 2026 at 9:51:25 PM PT |
| Working location | Branch and worktree | Wed Oct 21 2026 at 9:51:25 PM PT |
| Participation | Attended | Wed Oct 21 2026 at 9:51:25 PM PT |

## What actually happened

Nothing yet.

---

Authored by Scott Bellware on Wed Oct 21 2026 at 9:51:25 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 9:28:49 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 10:58:15 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:42:31 PM PT
