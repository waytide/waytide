# What Waytide does

*Waytide is by [the Eventide Project](https://eventide-project.org), grown out of the design practice it uses in its own work.*

The capability list — the things adopting Waytide gives you. This is the basis for the documentation site: each capability below becomes a page or section (see `experiments.md` for a worked example of one). The structure of the project — the packages, how they install, how they're distributed — comes *after* this, once a reader wants to adopt what's here.

The most important are the last two: these aren't tips in a prompt, they're a persistent, versioned system that changes how the agent works. Everything else supports that claim.

## Designing and building code

1. **Human-in-the-loop design** — the AI generates the code; the human decides the few choices the design actually turns on, instead of reviewing everything or rubber-stamping.
2. **Every real decision surfaced as a choice** — decisions are put to you as options (or a prompt to accept one), never buried in prose or handed over as a done deal.
3. **Build one outcome at a time, test-first** — small, named increments, each driven by a test written first.
4. **A guard against the AI's averaging** — the method is built to counter the AI drifting toward the average of the code it has seen, and to provoke the human to originate the better answer.
5. **Tests that actually drive design** — no "passes the moment you write it" tests, which teach nothing.

## Running experiments

6. **Controlled experiments** — test a question about the code, or about the way of working, on its own branch, with a forecast written before and the outcome recorded after.
7. **A full experiment lifecycle** — every experiment reaches a clear verdict (affirmed / refuted / inconclusive / abandoned / superseded) or is paused; merging is gated on tests, and merging untested code needs your explicit say-so.

## Writing tests

8. **A consistent test style** — controls instead of factories/fixtures, "Is"-named tests, context nesting that mirrors the folder tree, so the suite reads as plain statements.
9. **Suite reports** — summarize the test suite and print its structure.

## Writing code

10. **A house Ruby style, applied automatically** — method naming, explaining variables, the build/new constructor split, robustness at the class interface — applied without reminders.
11. **Library reports** — classify a library by construct, layer, and how current its API is.

## Language and communication

12. **Precise language** — the exact established term over the loose one, on the premise that a word choice is a design decision.
13. **Plain, literal wording** — no slang, name things for what they are, no invented jargon or opaque labels — in the code *and* in conversation with you.

## Committing

14. **Commit conventions** — no AI co-author trailer, run the suite first, subject-first messages that describe the change to the code as a fact.

## Documentation

15. **Plan and design conventions** — how a plan and a design doc read; plans stay code-free so you direct the code yourself, interactively.

## Keeping a durable project record

16. **A decision log** — one file per decision, committed with the code: a skimmable record of *why* the project is the way it is.
17. **Working hypotheses** — a place for not-yet-binding thinking, so ideas aren't lost or enforced too early.
18. **A deferred-work queue** — park a change that surfaces mid-task without losing it or derailing the task in flight.
19. **Plans, designs, and experiments as first-class artifacts** — each with its own place and shape.

## Seeing where a project stands

20. **Whole-project reports** — a status summary, the next deferred item, test and library reports, the test tree.

## What makes all of it work

21. **Conventions as files the agent reads every session** — everything above is real files under `agent/`, versioned with the code and read at the start of each session, so the conventions persist, travel with the repo, and hold across sessions rather than living in a prompt or memory.
22. **Rules install a mindset** — the conventions shape *how* the agent works, not just check its output afterward.
