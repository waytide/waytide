# Resolving a deferred item leaves references to it stranded

The deferred convention's resolution step is: act on the item, delete the file, log that
it was done. It says nothing about what else points at the file. Other artifacts refer to
a deferred item — by `[[link]]` or by prose title — and deleting it leaves those
references pointing at nothing, with no signal that it happened.

Two instances exist, one of them long predating its discovery:

- **`add-the-eventide-common-interest-license-to-each-package`** closes with
  `Related: [[2026-07-19T05-22-32Z-pending-release-republish-all-seven-packages]]`. That
  item was carried out — the republication is logged at
  `waytide/local/log/2026-07-20T23-40-45Z-all-seven-component-repos-republished-from-the-rules-package-layout.md`
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
- **What the correction is — settled 2026-07-27.** Write `(deleted)` after the name, and
  add what the deleted item decided:

  > see the git-worktree item (deleted) — settled 2026-07-26: the working location is
  > chosen at every initiation, in `experiment-runs-on-its-own-branch`

  Both parts are needed. Without the mark, the name reads as a live pointer and the reader
  only finds out by going to look. Without the decision, the mark leaves a name that cannot
  be looked up. Where the item was **discarded** rather than carried out, say that and
  point at its log entry, which is the only durable trace of it.
- **Whether it is a step in the convention, a mechanical check, or both.** A `[[link]]` to
  a nonexistent file is findable mechanically; a prose reference by title ("the deferred
  item on considering a git worktree for experiments") is not, short of a name match.
  Whether the session-start check should report stranded links the way it now reports
  unconcluded experiments is part of this question.
- **Whether the gap exists anywhere else — answered 2026-07-28: yes.** An observation is
  promoted and *kept* as the discovery record rather than deleted, so it strands nothing,
  and that had left the deferred queue looking like the only directory whose convention
  deletes on resolution. **Removing a system rule does the same thing**, and did:
  `auto-record-design-dialogue` was removed from `design-by-efferent` on 2026-07-28, and
  two live artifacts pointed at it — the package `README.md`'s summary line and the
  `loop-records` rule's `Related:` list. Both were found by grep and corrected in the same
  turn, so nothing was left stranded, but nothing *required* that search either. So the
  fix is **not** local to the deferred queue: it belongs wherever a convention deletes an
  artifact other artifacts cite. Rule removal has no written resolution step at all, which
  is a second gap this one exposes.
- **What the correction is when the deleted artifact is a rule.** The `(deleted)` +
  what-it-decided form settled above suits a queue item whose decision a reader still needs
  to find. A rule's `Related:` list is a set of live pointers, so a removed rule was simply
  **dropped** from it rather than marked — a permanent `(deleted)` entry in a Related list
  is clutter, and the log entry is the durable trace. That is a judgment made in the
  moment, not a settled convention, and it is part of what this item should settle.

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
Changed by Scott Bellware on Mon Jul 27 2026 at 10:05:20 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 12:21:11 AM PT
