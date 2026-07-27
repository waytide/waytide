# Resolving a deferred item leaves references to it stranded

The deferred convention's resolution step is: act on the item, delete the file, log that
it was done. It says nothing about what else points at the file. Other artifacts refer to
a deferred item — by `[[link]]` or by prose title — and deleting it leaves those
references pointing at nothing, with no signal that it happened.

Two instances exist, one of them long predating its discovery:

- **`add-the-eventide-common-interest-license-to-each-package`** closes with
  `Related: [[2026-07-19T05-22-32Z-pending-release-republish-all-seven-packages]]`. That
  item was carried out — the republication is logged at
  `waytide/log/2026-07-20T23-40-45Z-all-seven-component-repos-republished-from-the-rules-package-layout.md`
  — and its file deleted, so the link resolves to nothing. It has been stranded since
  **2026-07-20** and was found only by searching for it deliberately.
- **`consider-a-feature-cycle-mirroring-the-experiment-cycle`** referred twice to the
  git-worktree item, carried out **2026-07-26**. Both references were corrected by hand
  the same day, and only because that item happened to be named as the next one to be
  taken up. Nothing surfaced them.

What has to be settled:

- **Which artifacts are reconciled, and which are not.** A **live, forward-looking**
  artifact — another deferred item, an observation, a plan, a design — should be
  corrected, because it will be read as current. A **historical** record should not: a
  session record, an experiment record, or a log entry states what was true when written,
  and rewriting it erases the record. This is the same line the no-slang rule draws
  between live prose and a quoted historical decision.
- **What the correction is.** Not merely deleting the pointer. The referring item pointed
  at the other for a reason, and that reason usually survives resolution as a *settled
  answer* worth naming in its place. The feature-cycle correction replaced a pointer to an
  open question with the answer that question had received, which serves the reader better
  than the original did.
- **Whether it is a step in the convention, a mechanical check, or both.** A `[[link]]` to
  a nonexistent file is findable mechanically; a prose reference by title ("the deferred
  item on considering a git worktree for experiments") is not, short of a name match.
  Whether the session-start check should report stranded links the way it now reports
  unconcluded experiments is part of this question.
- **Whether the gap exists anywhere else.** An observation is promoted and *kept* as the
  discovery record rather than deleted, so it strands nothing. The deferred queue may be
  the only directory whose convention deletes on resolution — if so, the fix is local to
  it.

**Gated on:** nothing in flight blocks it; it is a convention question, not a task. What
gets reconciled and how is settled before `agent-deferred-convention` is changed.

**Why:** a stranded reference is cheap to fix and, for that reason, nothing forces it to
be found — one sat unnoticed for six days and surfaced incidentally. A queue whose items
cite each other, and whose convention deletes on resolution, produces stranded references
by construction. The reconciliation therefore belongs in the resolution step, not with
whoever happens to notice.

**How to apply:** settle what is reconciled and how, then add the step to
`agent-deferred-convention`'s resolution instruction and decide whether a mechanical check
should report stranded links. Correct the stranded ECIL reference as part of carrying this
out — it is deliberately left in place until the form of the correction is settled. Delete
this file when it is carried out, and log that it was done. Related: the
agent-deferred-convention (the resolution step this amends), the
agent-observations-convention (whose promotion keeps the record rather than deleting it),
the announce-waytide-at-session-start rule (the check that reports unconcluded
experiments), and the `language` no-slang rule (the live-versus-historical distinction).

---

Authored by Scott Bellware on Sun Jul 26 2026 at 11:40:06 PM PT
