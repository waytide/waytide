# Feature — Private journals

**Tags:** [feature]

## Intent

**As the engineer stated it:** start a new implementation for this idea. Use a worktree.

**A writer may keep a private journal outside the project's repository, as the item settles.** Private journals are rooted at `~/.local/share/waytide/journal/`, one directory per project, named for the project whose repository holds the shared journal. An entry is started by `New private journal entry`, `New private entry`, or `Private note`, and follows the shared journal's rules for its filename, datetime line, summary, and footer. A private journal is read only on `Read private journal entries` or `Read private journal`, never at session start. A private entry becomes shared only on the engineer's command to move it. It realizes the item *Private journals*, `2026-10-28T21-49-39Z-private-journals`.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/private-journals`
- **Base:** `e10ab69`, from `master`
- **Working location:** branch and worktree, chosen at the start. The worktree is `../waytide-feature-worktree-private-journals`, and the main working tree stays on `master`.
- **Participation:** attended, chosen at the start.

**No forecast is stated.** A feature is built to an intent rather than to a question.

**What Design By Efferent governs here.** The rule and vocabulary text is content work, which this repository's local rule keeps outside the five hinges. Any script the work adds is code, and Design By Efferent governs that half.

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| Kind | Feature, taken by the agent from the item's settled intent rather than put as a question | Wed Oct 28 2026 at 3:53:38 PM PT |
| Working location | Branch and worktree, by the engineer's instruction | Wed Oct 28 2026 at 3:53:38 PM PT |
| Participation | Attended | Wed Oct 28 2026 at 3:53:38 PM PT |
| Pending item changes | Committed on `master` before the branch, as `e10ab69` | Wed Oct 28 2026 at 3:53:38 PM PT |

---

Authored by Scott Bellware on Wed Oct 28 2026 at 3:53:38 PM PT
