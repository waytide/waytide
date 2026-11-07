# Where should the feature for item 8 ("The participation question offers Unattended first") be built? — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature for item 8 ("The participation question offers Unattended first") be built?

The options:

- **Branch only** — Create the branch feature/participation-question-offers-unattended-first and switch this working tree to it. At the conclusion, this working tree switches back to master.
- **Branch and worktree** — Create the branch feature/worktree/participation-question-offers-unattended-first and check it out in a new worktree at ../slasher-feature-worktree-participation-question-offers-unattended-first. This working tree stays on master.
- **The current branch** — Build it on master, creating nothing. There is no isolation, and abandoning the work means reverting it rather than deleting a branch.

The engineer's answer: **Branch and worktree**
