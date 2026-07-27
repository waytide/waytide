# Features

*Waytide is by [the Eventide Project](https://eventide-project.org), grown out of the design practice it uses in its own work.*

A feature is a bounded piece of ordinary work — the thing you're building, as opposed to a question you're testing. Waytide gives it a beginning, a place to be worked, and a stated end, so a project can always say what is in flight and what is finished.

A feature is kept: it's a dated file under `waytide/features/`, committed with the code.

## The shape of one

A feature runs on **its own branch**, named `feature/<subject>`, and merges back into whatever branch it came from — often `master`, sometimes another topic branch.

Starting one asks you **where it gets worked**: in your single working tree, switched over to the feature branch and back, or in a **worktree** — a second checkout in its own directory, so your main working tree stays where it was and both are open at once. Either way the feature branches; the choice is only how many checkouts exist. You're asked every time, because the answer depends on the feature.

The record holds:

- **The intent** — what you're building, and why.
- **Where it's worked** — the single tree, or a worktree and its path.
- **What was confirmed** — every decision you were asked to make.

The *design* of the feature — the choices you made at each step, and the options you chose among — lives in its loop record instead. The two files name each other: one is how the feature was governed, the other is how it was designed.

## How a feature ends

Every feature reaches a stated condition. It's never just left open.

| State | What it means | What happens to the work |
|---|---|---|
| **Completed** | it's built and integrated | merged into the branch it came from |
| **Abandoned** | dropped before finishing | not merged; the record is kept |
| **Superseded** | a different design replaced it | not merged; kept, with both records pointing at each other |
| **Suspended** | *paused, not ended* | the branch is kept, and so is the worktree if it has one; you pick it up later |

## Where it differs from an experiment

The two lifecycles look alike on purpose, and they part company in four places. All four come from one difference: **an experiment asks a question, and a feature has an intent.**

- **No forecast.** An experiment writes down what it expects *before* the work, and the gap between that and what happened is the finding. A feature isn't predicting anything.
- **No verdict.** *Affirmed*, *refuted*, *inconclusive* are answers to a question. A feature isn't proven or disproven, so its states describe what became of it instead.
- **No gate at the merge.** Your tests are verified before the feature integrates. After it integrates the suite may fail anyway — the merged result is a combination neither side ran — and that's ordinary. You fix it from there.
- **No declaring it affirmed.** An experiment produces a finding you confirm and promote into the project's decision log. A feature just gets finished.

## What the system protects

- **Nothing quietly trails off.** A feature that's been left open is reported at the start of every session, along with any open experiments — which matters most for one worked in a worktree, where nothing in your main working tree hints that it exists.
- **You're asked before anything is deleted.** Removing a feature's branch needs your say-so, local and remote both, and its worktree goes first.
- **Every confirmation is recorded** in the feature's file, so who authorized what stays on the record.

## A worked example

> **Intent:** uploads should retry on a timeout rather than failing outright.
>
> You branch `feature/upload-retries` and choose a worktree, since a defect report is likely this week and you'd rather not switch back and forth. It's created next to the repository as `waytide-upload-retries-feature`, so listing the parent directory shows both together. You build the feature through the hinges, one outcome at a time. The suite passes on every commit. You merge it into `master`, mark the record **Completed**, and confirm removing the worktree and the branch together.

---

*The feature conventions come from the `foundation` package (the record format, and the branch-and-lifecycle rules). Installing `foundation` gives you the `waytide/features/` directory and these conventions. See [Getting started](#) for installation.*
