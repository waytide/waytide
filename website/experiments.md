# Experiments

An experiment is deliberate work that tests a **question** — something the code alone won't tell you. Two kinds of question come up:

- **About the code** — "Does this approach hold up? Is it faster? Does it handle the awkward cases?"
- **About the way of working** — "Does this design method actually help, and where does the human really need to step in?"

What makes it an experiment, rather than just trying something, is one move: you **write down what you expect before you start**, then record what actually happened. The gap between the two is the finding — and it only counts because the guess was committed in advance.

An experiment is kept: it's a dated file under `agent/experiments/`, committed with the code, not a scratch note you throw away.

## The shape of one

By default, an experiment is **one branch, worked until the question is answered**. No phases, no numbering — most experiments are exactly this. It runs on its own branch (named `experiment/<subject>`) so it's never mistaken for ordinary feature work, and it merges back into whatever branch it came from — often `master`, sometimes another topic branch.

The record holds:

- **The question** — the thing you're testing.
- **The forecast** — what you expect to happen, written *before* the work.
- **What actually happened** — recorded against the forecast as you go.
- **Findings, and the misses** — the outcomes that escaped your forecast are usually the most useful.

## How an experiment ends

Every experiment reaches a clear end — it's never just left open. The end names a verdict on the **question**, not a judgment of the work: an experiment that disproves its idea did its job.

| State | What it means | What happens to the work |
|---|---|---|
| **Affirmed** | the question held | you confirm it; the findings are copied into the project's decision log, and — if there's code — it merges back (once tests pass) |
| **Refuted** | the question was disproven | not merged; the record is kept as evidence |
| **Inconclusive** | it ran but gave no clear answer | not merged; kept |
| **Abandoned** | dropped before an answer | not merged; kept |
| **Superseded** | replaced by another experiment | not merged; kept, with both records pointing at each other |
| **Suspended** | *paused, not ended* | the branch is kept; you pick it up later |

## What the framework protects

The point of the lifecycle is that an experiment can't quietly become permanent, and can't rejoin the main line without you knowing what it proved:

- **Merging is gated on tests passing.** If the branch has no tests covering the code you wrote, merging it needs your explicit confirmation — untested code never merges silently.
- **You end up back on the main branch** every time an experiment concludes, never stranded on the experiment branch.
- **Deleting the branch needs your say-so** — local and remote both.
- **Drift is flagged.** If you start ordinary work while an experiment is still open, the agent surfaces it rather than letting the two quietly diverge.
- **Every confirmation is recorded** in the experiment's file, so who authorized what is always on the record.

## Runs (only when you're comparing)

Sometimes you want to hold the question fixed and change *one thing* to compare — say, "the AI proposes first" versus "the human answers blind first." Then, and only then, you split the experiment into **runs** (Run 1, Run 2, …), each on its own branch from the same starting point, each with its own forecast. A run is a deliberate variation, not a retry. Most experiments never need this.

## A quick example

> **Question:** does forecasting the decision points before writing a feature actually locate where the human steps in?
>
> You branch `experiment/gate-forecasting`, and *before touching the code* you write down which decisions you expect the human to correct and which to wave through. Then you build the feature. Afterward, you compare: the corrections landed where you predicted, plus two you'd filed as trivial that the human actually changed. That surprise is the finding. You mark the experiment **affirmed**, copy the findings into the project log, and — since the feature's tests pass — merge it.

---

*The experiment conventions come from the `foundation` package (the record format, and the branch-and-lifecycle rules). Installing `foundation` gives you the `agent/experiments/` directory and these conventions. See [Getting started](#) for installation.*
