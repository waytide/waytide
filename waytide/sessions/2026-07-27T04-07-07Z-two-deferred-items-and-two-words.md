# Session — Two deferred items, and two words (2026-07-26)

The session began as a request to list the deferred queue, became the working-out of
two items in it, and ended with the experiment lifecycle gaining a working location.
Along the way it twice caught a word the framework's own rules forbid — both times
because the engineer asked what the word meant rather than reading past it. The
terminology corrections are not incidental to the work; they are the same work, and
they are why this record names them in its title.

*This is the communicable record — the guided tour. It is not the source of truth.
The durable records are the rules under `framework/`, the decision log under
`waytide/log/`, and the deferred queue under `waytide/deferred/`; this narrative
points to them and preserves the reasoning between them.*

## 1. The queue, listed

Eight items were parked. Three chores from Jul 19 (an example project on the `Upload`
domain, a website-content review, the Eventide Common Interest License), four
methodology questions raised in one sitting on Jul 24, and one investigation into test
output and test running. Four of the Jul 24 items turned out never to have been
committed; they were committed as `1dd49e8` before anything else proceeded.

## 2. The provenance footer, and the correction that outgrew it

The engineer initiated **the provenance footer datetime records no minutes**, and
immediately broadened it: the defect was not the footer's, it was any datetime whose
time is written without minutes and seconds.

The item's own account of the defect is what made the broadening obvious. The footer's
format resolved only to the hour, so two edits an hour apart were indistinguishable —
and worse, an edit made in the *same* hour as the previous one produced a `Changed by`
line identical to its predecessor. A duplicate-looking line reads as an error rather
than as provenance, so one had already gone **unwritten** rather than being questioned.
A format that cannot express its own instances is a defect, not merely a coarse choice.

**The hinge was where the general rule should live.** Three candidates were put up:
`foundation` as a new rule, `language` as a new rule (reaching conversation the way
`no-slang` does), or broadening the footer rule in place. The engineer chose a new
`foundation` rule, scoping its reach to datetimes written into files.

Settled and carried out: `framework/foundation/a-time-value-carries-minutes-and-seconds.md`,
with `record-rule-authorship-in-a-footer` conformed to it and the foundation README's
cross-cutting conventions going from two to three. Three log entries; the deferred file
deleted. Committed as `729e097`.

**Boundaries the rule states, because each was a real question:** a date-only
convention gains no time; a datetime already recorded coarsely is never revised,
because the minutes of a past event are not recoverable and supplying them would
falsify the record; and the ISO-8601-UTC filename prefix already satisfied it. Roughly
a hundred existing footer lines were left untouched, so the two forms now coexist in
the same footers — a cost accepted deliberately, and written into the footer rule so a
reader meeting both does not take the coarse ones for malformed.

## 3. The worktree question, already in the queue

The engineer raised working experiments in a git worktree. It was already deferred —
the Jul 24 item just committed — so the exchange started from what that item held
rather than from nothing.

One correction to the framing, and it set up everything after. The engineer's phrasing
was "worktree **instead of, or in addition to**, git branch." *Instead of* is not
available. A worktree is a second **checkout of** a branch, not an alternative to
branching; git will produce a detached worktree, but an experiment cannot use one,
because affirmation merges the experiment into its upstream branch and a detached
checkout gives that merge nothing to name. The live choice is worktree-plus-branch
versus `git switch`-plus-branch — where the experiment is worked, not whether it
branches.

## 4. The shape the engineer proposed

Rather than one answer for every experiment, **initiating an experiment offers two
choices, and the conclusion executes the git mechanics matching the one made.**

This resolved what the deferred item could not. The item treated the question as
having one answer and then could not produce it — because the trade-off it laid out is
**situational**: an experiment resolving in a sitting favors the single tree, one that
must coexist with main-sequence work favors a worktree. A choice that depends on the
experiment belongs at a gate, not in a rule.

**Settled:** the choice is gated at **every** initiation. No standing default, no
project-level default — both candidates are genuine, so the gate never has to
manufacture an option to reach the two-option floor.

## 5. "What is 'migration'"

Asked of a word this record's writer had introduced, four or five uses in, to mean
*changing an experiment's working location after initiation*. The answer is that it
was wrong, on the standard `name-literally-not-by-analogy` sets:

- **Nothing moves.** A migration transfers something. Here a second checkout of the
  same branch is *added*, or one is *removed*. The branch, its commits, and the record
  all stay where they are.
- **It imports baggage.** In software the word usually means a schema or platform
  migration — a structural, one-way conversion. None of that describes
  `git worktree add`.

Worth recording: the project's own uses of the word are literal. The
`log/2026-07-16-agent-norms-*-migration-plan.md` files describe files that genuinely
relocated into packages. The failure was this session's, not the project's.

The literal replacement needed no coined handle: **a worktree is added for an
experiment already under way**. The engineer's response — *"If you had said this, it
would have been understandable immediately"* — is the `name-literally` test stated as
an observation rather than a rule: can the reader understand it without being taught a
mapping.

## 6. The last open question, and how the cost argument collapsed

What is the recourse when main-sequence work arrives during a single-tree experiment?

The engineer asked why the working location would want to change at all. Working
through it produced one honest driver and disposed of the rest: the reason to have
preferred a worktree can materialize *after* initiation, when unrelated work arrives
while the experiment is half-formed. Collapsing a worktree back into the single tree
has no motivation. "The test runner broke outside the repo root" is correcting a bad
initial choice, not an evolving need.

Then the engineer asked whether adding a worktree mid-experiment was difficult or
inappropriate, and the answer reshaped the question. **It is neither, and it costs
almost exactly what suspension costs.** Suspending is: return the main tree to
upstream, mark the record suspended. Adding a worktree is: return the main tree to
upstream, `git worktree add`. They differ by one command.

So the case for suspension as the sole recourse could not rest on the worktree being
expensive. It had to rest on something else, and there was one real thing:
**suspension is a declared state, and it makes dormancy legible.** An experiment left
nominally active in a worktree, untouched for a fortnight, is worse recorded than one
marked suspended.

Which meant the question was never *which recourse*. It was that these are two
situations distinguished by **intent** — stop working it, or keep working it alongside
— and naming either the universal answer would mislabel the other.

**The engineer settled it there: both are recourses, distinguished by intent.**

## 7. Carried out

`experiment-runs-on-its-own-branch` gained two bullets — the working location chosen at
every initiation, and the single trigger that changes it — and had four existing ones
made conditional on the choice: conclusion, suspension, branch deletion, and drift. A
new *Why* paragraph argues the gate and the two recourses.

`agent-experiments-convention` records the working location beside the upstream branch,
the experiment branch, and the base, and states it as a short history rather than a
single fact: on the one trigger the record **gains a line**; the original is not
rewritten.

`docs/experiments.md` and the foundation README were conformed, both describing the
lifecycle that changed. Five log entries; the deferred file deleted. Committed as
`9ad1b56`.

**Two calls made rather than asked**, the engineer having said to settle it. The
options are named **single tree** and **worktree**, not *Branch* and *Worktree* as
originally phrased — calling one option "Branch" implies the other does not branch,
the confusion already corrected in section 3. And worktree removal and branch deletion
take **one** confirmation, not two: git refuses to delete a branch checked out in a
worktree, so the order is forced and they are one cleanup act.

## 8. "Promoted"

The engineer put a summary statement up for confirmation, and it carried a second
misfitting word: an experiment on a branch can be **promoted** to a worktree. Two
problems, one of them structural:

- It **imports a value ordering the rule denies**. Promotion is advancement to a better
  state; neither working location is better, which is the entire reason the choice is
  gated rather than fixed.
- It **collides with an established term**. In this framework, *promotion* already
  names an observation stabilizing into a binding rule (`agent-observations-convention`).
  Two meanings on one word in one package.

The statement's *"optionally"* was also off — it reads as *branch by default, worktree
on request*, which is the arrangement the session had just rejected.

## Takeaways

- **A datetime written into a file carries its time of day to seconds.** A format that
  cannot express its own instances is a defect; hour resolution had already suppressed
  an entry rather than merely blurring one.
- **The experiment working location is gated at every initiation**, with no default,
  because the trade-off is situational rather than general.
- **Main-sequence work arriving during a single-tree experiment has two recourses,
  distinguished by intent** — suspend, or add a worktree — because they cost nearly the
  same and mark genuinely different situations.
- **The working location changes on one trigger only**, and the record gains a line
  rather than having its original rewritten.
- **A gate is the right home for a situational trade-off.** The worktree item could not
  be settled as one answer for two years' worth of experiments; it settled in an
  afternoon once it was posed as a choice made per experiment.
- **Two words were caught by the engineer asking what they meant.** Neither was caught
  by the writer re-reading. That is worth knowing about how the terminology rules
  actually take effect.

## Glossary

- **working location** — where an experiment's branch is worked: the single working
  tree, or a worktree. Chosen at initiation, recorded with the branch topology, and
  the thing the conclusion's mechanics dispatch on.
- **worktree** — a second working tree attached to the same repository: one object
  database, one set of branch refs, but its own HEAD, index, and uncommitted changes.
  Not a clone (which copies the database and then diverges) and not a copy of the
  branch (there is one branch; two directories look at it).
- **checkout**, as used in "a second checkout of that same branch" — the **noun**: a
  materialized directory of files at some commit. Not the verb `git checkout`.
- **a worktree is added for an experiment already under way** — the literal phrase for
  the one circumstance in which an experiment's working location changes after
  initiation. It replaces both **migration** (nothing moves) and **promotion**
  (imports a value ordering the rule denies, and collides with observation-to-rule
  promotion).

## Where the durable records live

- **Rules:** `framework/foundation/a-time-value-carries-minutes-and-seconds.md` (new),
  `record-rule-authorship-in-a-footer.md`, `experiment-runs-on-its-own-branch.md`,
  `agent-experiments-convention.md`, and the foundation `README.md`.
- **Decision log:** eight entries under `waytide/log/` dated 2026-07-26, three for the
  datetime resolution and five for the experiment working location.
- **Deferred queue:** two items resolved and deleted; six remain.
- **Documentation:** `docs/experiments.md`, conformed to the lifecycle change. The
  standing website-content review item still covers the page as a whole.
- **Commits:** `1dd49e8` (four uncommitted deferred items), `729e097` (the datetime
  resolution), `9ad1b56` (the experiment working location).

## A closing note

This session's subject was the framework, and the framework's rules were exercised on
the session's own prose twice — on *migration*, then on *promoted*. Both times the
correction arrived as a question from the engineer rather than as a catch by the
writer, and both times the replacement was a plain sentence rather than a better coined
term. The `name-literally-not-by-analogy` rule holds that a literal name is free at the
point of use because the name *is* the explanation. Two words that failed that test
were introduced by the party that had just finished reading the rule forbidding them,
which is a fair measure of how much the standard depends on being asked.

---

Authored by Scott Bellware on Sun Jul 26 2026 at 9:07:07 PM PT
