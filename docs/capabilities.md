# What Waytide does

*Waytide is by [the Eventide Project](https://eventide-project.org), grown out of the design practice it uses in its own work.*

The capability list — the things adopting Waytide gives you. This is the basis for the documentation site: each capability below becomes a page or section (see `experiments.md` and `features.md` for worked examples). The structure of the project — the packages, how they install, how they're distributed — comes *after* this, once a reader wants to adopt what's here.

The most important are the last two: these aren't tips in a prompt, they're a persistent, versioned system that changes how the agent works. Everything else supports that claim.

## Designing and building code

1. **Human-in-the-loop design** — the AI generates the code; the human decides the few choices the design actually turns on, instead of reviewing everything or rubber-stamping.
2. **Every real decision surfaced as a choice** — decisions are put to you as options (or a prompt to accept one), never buried in prose or handed over as a done deal.
3. **Build one outcome at a time, test-first** — small, named increments, each driven by a test written first.
4. **A guard against the AI's averaging** — the method is built to counter the AI drifting toward the average of the code it has seen, and to provoke the human to originate the better answer.
5. **Tests that actually drive design** — no "passes the moment you write it" tests, which teach nothing.

## Building features

6. **A feature lifecycle** — feature work runs on its own branch, worked in your single working tree or in a worktree, and ends in a stated condition: completed, abandoned, superseded, or paused. No feature quietly trails off.
7. **A record of how each feature was built** — what it was for, where it was worked, and what was confirmed along the way, kept after the feature ships.

## Running experiments

8. **Controlled experiments** — test a question about the code, or about the way of working, on its own branch, with a forecast written before and the outcome recorded after.
9. **A full experiment lifecycle** — every experiment reaches a clear verdict (affirmed / refuted / inconclusive / abandoned / superseded) or is paused; merging is gated on tests, and merging untested code needs your explicit say-so.

## Writing tests

10. **A consistent test style** — controls instead of factories/fixtures, "Is"-named tests, context nesting that mirrors the folder tree, so the suite reads as plain statements.
11. **Suite reports** — summarize the test suite and print its structure.

## Writing code

12. **A house Ruby style, applied automatically** — method naming, explaining variables, the build/new constructor split, robustness at the class interface — applied without reminders.
13. **Library reports** — classify a library by construct, layer, and how current its API is.

## Language and communication

14. **Precise language** — the exact established term over the loose one, on the premise that a word choice is a design decision.
15. **Plain, literal wording** — no slang, name things for what they are, no invented jargon or opaque labels — in the code *and* in conversation with you.

## Committing

16. **Commit conventions** — no AI co-author trailer, run the suite first, subject-first messages that describe the change to the code as a fact.

## Documentation

17. **Plan and design conventions** — how a plan and a design doc read; plans stay code-free so you direct the code yourself, interactively.

## Keeping a durable project record

18. **A decision log** — one file per decision, committed with the code: a skimmable record of *why* the project is the way it is.
19. **Working hypotheses** — a place for not-yet-binding thinking, so ideas aren't lost or enforced too early.
20. **A deferred-work queue** — park a change that surfaces mid-task without losing it or derailing the task in flight.
21. **Plans, designs, experiments, and features as first-class artifacts** — each with its own place and shape.

## Seeing where a project stands

22. **Whole-project reports** — a status summary, the next deferred item, test and library reports, the test tree.

## What makes all of it work

23. **Conventions as files the agent reads every session** — everything above is real files under `waytide/`, versioned with the code and read at the start of each session, so the conventions persist, travel with the repo, and hold across sessions rather than living in a prompt or memory.
24. **Rules install a mindset** — the conventions shape *how* the agent works, not just check its output afterward.
