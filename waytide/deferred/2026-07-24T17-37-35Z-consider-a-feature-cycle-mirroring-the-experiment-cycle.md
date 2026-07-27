# Consider a feature cycle that mirrors the experiment cycle

An **experiment** has a full lifecycle: its own branch (`experiment/<subject>`), a
recorded base and upstream branch, a record carrying the question and forecast, a fixed
set of declared end states (affirmed, refuted, inconclusive, abandoned, superseded, or
suspended), a test-gated merge, user confirmations recorded at each lifecycle decision,
and a rule that the user ends up back on the upstream branch. A **feature** has no
equivalent. Whether feature work should carry a mirroring cycle is an open question.

What a feature currently has, and what it lacks:

- **It has a design method.** The five hinges (actuation → observation → controls →
  implementation → naming) govern how a feature is designed, and the loop record
  (`waytide/loops/`) captures each pass's hinge, options, and decision. So the *inside*
  of a feature is well governed.
- **It has a completion criterion.** The human-in-the-loop rule's "exit on solubility,
  not coverage" is the stopping condition.
- **It lacks a branch convention, declared end states, and a merge gate.** There is no
  `feature/<subject>` naming, nothing that says a feature *ends* in a named state, and no
  point at which a feature is declared done and rejoined — the `git` package's
  run-suite-before-commit rule gates every commit rather than a merge.

What has to be weighed — and the central question is whether the experiment lifecycle's
*justification* transfers at all:

- **The experiment lifecycle exists because an experiment is a deviation from the main
  line.** The rule says so plainly: it must be isolated (its own branch), reversible (the
  branch survives suspension), and honest about what it proved before rejoining (the test
  gate). A feature is not a deviation — it *is* the main line. So the reasons that
  produce the experiment's machinery do not automatically produce a feature's, and
  mirroring the structure without the justification would be ceremony of the kind DBE
  retires.
- **The state vocabulary does not map.** The experiment states name a verdict on the
  experiment's **question** — affirmed, refuted, inconclusive. A feature has no question;
  it has an intent. Any feature states would have to be derived from what actually
  becomes of a feature (delivered, abandoned, superseded by a different design), not
  borrowed from the experiment's verdict vocabulary. Deciding *which* parts mirror is
  most of this question.
- **"Main-sequence drift" needs rethinking if features branch.** The experiment rule asks
  the agent to watch for main-sequence work starting while an experiment is open. If
  feature work is itself branched, the "main sequence" is no longer simply the upstream
  branch, and that protection has to be restated in terms that still mean something.
- **The cost is borne on ordinary work.** Branch-and-merge overhead on every feature is
  paid constantly, where the experiment's is paid rarely. This composite repo's own
  history is direct-to-`master` main-sequence work; a feature cycle would change the
  default rhythm of the project, not just add an option to it.
- **It interacts with the worktree question, which is now answered for experiments.**
  Settled 2026-07-26: an experiment's **working location** — the single working tree or a
  worktree — is chosen at every initiation with no default, because the trade-off is
  situational; it changes afterward on two triggers, an interruption or an escalation
  (see the experiment-runs-on-its-own-branch rule). If features become branched, the same
  question arises for them, and the experiment's answer is available to copy or to
  reject. Rejecting it is a live option: the experiment's gate is affordable because
  experiments are rare, and a per-feature working-location prompt would be paid on
  ordinary work, which is the same objection the cost bullet above raises about branching
  features at all.

**Gated on:** nothing in flight blocks it; it is a methodology question about the
framework's work lifecycle, not a task. Which parts of the experiment cycle a feature
should mirror is settled — including whether the answer is *none* — before any rule is
written or changed.

**Why:** the experiment lifecycle is the framework's one worked-out answer to "how does a
bounded unit of work begin, get recorded, and end," and feature work has no such answer —
a feature currently starts and stops without a declared state, which makes it hard to say
what is in flight and what concluded. But the experiment's machinery follows from its
being a *deviation*, and a feature is not one; copying the structure across without the
reason would install ceremony rather than governance. The question is worth settling
deliberately, in either direction, rather than left as an asymmetry nobody examined.

**How to apply:** settle the question first — decide which parts of the experiment cycle,
if any, a feature should mirror (branch convention, a record with declared end states, a
merge gate, recorded confirmations), derive any feature states from what becomes of a
feature rather than from the experiment's verdict vocabulary, and record the decision in
`waytide/log/`. Only then write or change the governing rules, restating main-sequence
drift if features become branched. Delete this file when it is carried out, and log that
it was done. Related: the experiment-runs-on-its-own-branch rule (the lifecycle being
mirrored) and the agent-experiments-convention (its record), the design-by-efferent
hinge-cycle and human-in-the-loop rules (what already governs the inside of a feature),
the loop-records rule (the per-feature record that exists), the agent-plans-convention,
the `git` run-suite-before-commit rule (the gate that exists today), and the deferred item
on a git worktree for experiments.

---

Authored by Scott Bellware on Fri Jul 24 2026 at 10 AM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 11:33:20 PM PT
