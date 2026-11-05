# Next-work takes the next step of the work under way, and next-work? names it

**Trigger:** When the engineer types `/next-work` or `/next-work?`, or asks what is next

**`/next-work?` asks what the next step is, and `/next-work` takes it.** `/next-work?` is the engineer asking *What's next?*, and `/next-work` is the engineer saying *proceed*. Neither names the work, because the work is the one the conversation is on.

**As the engineer stated it:** any kind of multi-step process. It stops me from having to say: What's next?

**The work under way is any work with steps still to take.** A plan's unchecked tasks, an implementation's phases, the design hinges of an outcome, a list of steps the agent gave, a procedure part done: each is one. The next step is the first one not yet taken.

**`/next-work?` names the next step and does not take it.** It says what the step is and what it would do, in a sentence or two.

**`/next-work` takes the next step, as the engineer saying proceed would.** It does what that step involves and nothing beyond it, and then stops, as it would after any step.

**Where more than one piece of work is under way, `/next-work` and `/next-work?` follow the one the conversation is on.** Where that is not clear, they ask which, through the selection interface. Where no work is under way, they say so.

**`/next-work` does not stand in for a decision a rule leaves to the engineer.** Where the next step is one the engineer has to decide or declare, such as affirming an experiment, committing on `master`, or deleting a branch, `/next-work` brings the step to that decision and asks it, as the step's own rule says.

**Why:** a conversation that works through steps asks *what's next* and says *proceed* again and again. A short command for each saves the engineer the words and keeps the meaning fixed: one asks, one acts, and neither decides for the engineer.

**How to apply:** on `/next-work?`, name the next step of the work the conversation is on, and stop. On `/next-work`, take that step, and stop. Ask which work is meant where it is not clear, and say so where none is under way. Where the step needs the engineer's decision, ask for it.

## Compressed

1. `/next-work?` asks what the next step is, as the engineer asking *What's next?* would. `/next-work` takes it, as the engineer saying *proceed* would.
2. The work under way is any work with steps still to take: a plan's tasks, an implementation's phases, an outcome's design hinges, a list of steps the agent gave, a procedure part done. The next step is the first not yet taken.
3. On `/next-work?`, name the next step and what it would do, in a sentence or two, and do not take it.
4. On `/next-work`, take the next step and nothing beyond it, then stop.
5. Follow the work the conversation is on. Where that is not clear, ask which, through the selection interface. Where no work is under way, say so.
6. `/next-work` does not stand in for a decision a rule leaves to the engineer, such as affirming an experiment, committing on `master`, or deleting a branch. It brings the step to that decision, and asks it as the step's rule says.

## Compression

- 2026-11-02, compressed: checked: 14 directives, 14 kept, 0 less precise, 0 lost
- 2026-11-05, revised: the commands are `/next-work` and `/next-work?`, a term swap the engineer settled; not re-checked

## History

Until Thu Nov 5 2026 the commands were `/next` and `/next?`.

Related:

- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-always-takes-help rule — how the command is read
- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the question where the work is unclear

---

Authored by Scott Bellware on Mon Nov 2 2026 at 8:46:33 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 1:03:01 PM PT
