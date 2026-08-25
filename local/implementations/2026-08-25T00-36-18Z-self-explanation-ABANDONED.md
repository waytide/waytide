# Feature — Self-Explanation

## Intent

**When someone asks what Waytide is and what it does, the agent gives a reasonable high-level
answer.** The root `README.md` is the source that answer is distilled from.

**As the engineer stated it:** the "self-explanation" means that when a user asks for an
explanation of Waytide, and what it is and what it does, then a reasonable high-level answer is
given. Use the README as a source for this distilation.

**It realizes the interactive-chat half of *Waytide's Self-Explanation***, the aspiration at
`local/ideas/2026-08-03T00-45-18Z-waytide-self-explanation-ACTIVE.md`. That record settles the
premise — one source, two surfaces, the chat skewed toward explaining the system rather than the
engineer's project — and hands production and presentation to the `website` project. The chat's
behavior is the half whose home is here, because the agent and the rules are here.

**The README is the source rather than the rule corpus.** That is what the aspiration's
one-source premise asks for, and it is what keeps the answer from drifting: a description written
separately from the README would be the second copy the aspiration exists to prevent.

## State

- **State:** Abandoned

**Dropped before concluding, by the engineer's decision on 2026-08-25.** No reason is recorded,
because none was stated. A reason is what a later reader reconsidering this would decide against,
and inventing one would put the agent's reading in place of the engineer's.

**Nothing merged.** The branch carried no commits, and the rule and the `foundation` README change
it produced were discarded rather than taken to `master`. This record and its log entries are what
survive.

## Setup

- **Upstream branch:** `master`
- **Implementation branch:** `feature/self-explanation`
- **Base:** `434cc4d` on `master`
- **Working location:** branch only
- **Tags:** [feature]

## Confirmations

- **2026-08-25 — the working location was put through the selection interface and the engineer
  chose branch only.** The options were branch only, branch and worktree, and the current branch,
  offered last as a feature's alone.
- **2026-08-25 — the branch was deleted on the engineer's instruction.** There was no worktree to
  remove first, and no selection prompt was put: the instruction to delete is itself the
  confirmation the lifecycle asks for, and re-displaying it would ask the engineer to approve their
  own direction. The branch held no commits and pointed at `434cc4d`, so the deletion was lossless.
- **2026-08-25 — no attended-or-unattended selection was put, and that is deliberate.** The
  product is a rule file, which is prose, and the local rule *Design By Efferent does not govern
  content work* directs that the five hinges are not put, no loop record is opened, and the
  participation gate is not asked. The working location is `foundation`'s implementation-lifecycle
  rather than DBE's, so it was asked.

## What the work produced, and what became of it

**A `foundation` rule was written and discarded** — `waytide-explains-itself-from-its-readme`. It
settled that a request to explain Waytide is answered at a high level, distilled from the README:
the root `README.md` in Waytide's own repository, and the installed packages' READMEs in a project
that installed it, since the composite's root README does not travel. It refused three things —
composing the answer from the rule files, writing the description to any file, and closing with an
offer.

**It was exercised once and the answer was accepted.** The engineer asked for the description to be
printed, it was produced from the root `README.md`, and they called it decent for now.

**The `foundation` README was reconciled to carry it, and that change was discarded too.**

## What was settled during the work

- **2026-08-25 — it is a `foundation` rule**, on the engineer's decision, so the behavior reaches
  every project that installs Waytide. That decided the next question, since a `foundation` rule
  ships where the composite's root README does not.
- **2026-08-25 — high level fixes a source and an altitude, not a length.** The `language`
  package's an-answer-is-a-list-and-prose-must-justify-itself and
  lead-with-a-summary-before-details rules already govern the answer's shape, so the rule adds no
  second format.
- **2026-08-25 — the trigger is described rather than fixed as a form of words.** A question about
  what a system is arrives in whatever words the asker has.
- **2026-08-25 — the description is derived at each request and no file holds it.** A kept artifact
  at `system/foundation/description.md` was written and removed the same day, on the engineer's
  decision that a description on disk is not wanted.
- **2026-08-25 — what the removed artifact would have bought is stated rather than lost.** It
  travelled to a consuming project and read identically every time. What it cost is a second
  statement of what the README says, and two statements of one thing drift. The reproducibility is
  given up deliberately, and the rule says so.

---

Authored by Scott Bellware on Mon Aug 24 2026 at 5:36:18 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:41:34 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:44:16 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:47:27 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:55:24 PM PT
