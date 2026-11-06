# The current command lists the current items, then summarizes the current implementations

- **State:** Realized
- **Tags:** [idea]

**`/current-items` would be renamed `/current`.** It would still list the Open and Active items, in the same form.

**Below the items, it would summarize the current implementations.** These are the features and experiments that are under way, each with its state and what it is for.

**Not yet settled:** whether `/current-items` stays as an alias, what the summary of an implementation holds, and which implementation states count as current.

## Settled — 2026-11-06

**`/current-items` is removed.** `/current` replaces it, and the old name stops working.

**`/item current` and `/item list current` list the items only.** The summary of implementations belongs to `/current`.

**The summary shows each implementation's title and state.**

**An implementation counts as current when it is Active or Suspended.**

Realized on the branch `feature/worktree/current-command`.

## History

As the engineer first stated it: "Change current-items to current, and include a summary of current implementations at the bottom"

---

Authored by Scott Bellware on Fri Nov 6 2026 at 10:10:47 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:13:34 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:20:23 AM PT
