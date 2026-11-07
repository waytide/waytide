# A phase's commits are squashed into the implementation branch

- **State:** Open
- **Tags:** [idea]

**When a phase concludes, its commits would be squashed into one commit on the implementation branch, rather than merged with their history.** Today a phase merges back into the implementation's branch, as the an-implementation-runs-on-a-branch-to-a-declared-end rule says, and every commit of the phase arrives with it.

**Not yet settled:** what the squashed commit's message says, whether the phase's branch is kept after the squash, and whether a refuted or inconclusive phase, which does not merge, is affected at all.

## History

As the engineer first stated it: "THe commits in phases are squash commited to the implementation branch"

---

Authored by Scott Bellware on Sat Nov 7 2026 at 12:27:35 AM PT
