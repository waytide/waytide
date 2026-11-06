# Feature — Observation state migration

**Tags:** [feature]

## Intent

**As the engineer stated it:** When this feature is deployed to consuming projects, it will have to change any observations' "STATED" state to "RECORDED".

**The foundation installer carries a consuming project's observations from `Stated` to `Recorded`.** For each `waytide/local/items/*-STATED.md`, it renames the file to end `-RECORDED.md` and changes its `**State:** Stated` line to `**State:** Recorded`. Where the new name is already present, it reports the two files and changes neither. It follows the observations-convention change committed on `master` as `02b25ba`.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/observation-state-migration`
- **Base:** `02b25ba`, from `master`
- **Working location:** branch and worktree, chosen at the start. The worktree is `../waytide-feature-worktree-observation-state-migration`, and the main working tree stays on `master`.
- **Participation:** unattended, chosen at the start.

**No forecast is stated.** A feature is built to an intent rather than to a question.

**What Design By Efferent governs here.** The installer function and its tests are code, and Design By Efferent governs them, unattended.

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| Kind | Feature, taken by the agent from the engineer's statement of intent | Wed Oct 28 2026 at 5:41:28 PM PT |
| Working location | Branch and worktree | Wed Oct 28 2026 at 5:41:28 PM PT |
| Participation | Unattended | Wed Oct 28 2026 at 5:41:28 PM PT |
| Verdict | None: the feature is built to an intent, and concludes Completed | Thu Nov 5 2026, at the engineer's conclusion |
| Conclusion | Completed, merged into `master`, its automated tests passing on its branch and on the merged result | Thu Nov 5 2026 |

---

Authored by Scott Bellware on Wed Oct 28 2026 at 5:41:28 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:59:05 PM PT
