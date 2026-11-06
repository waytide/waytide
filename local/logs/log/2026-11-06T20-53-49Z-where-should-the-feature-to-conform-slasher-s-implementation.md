# Where should the feature to conform Slasher's implementation to skills.md be worked? (skills.md's edits are uncommitted on master.) — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature to conform Slasher's implementation to skills.md be worked? (skills.md's edits are uncommitted on master.)

The options:

- **Branch only** — Create feature/conform-slasher-to-skills-md and switch this working tree to it, carrying the uncommitted skills.md edits. At the conclusion this working tree switches back.
- **Branch and worktree** — Create feature/worktree/conform-slasher-to-skills-md and check it out in a new worktree: a second working directory at ../waytide-feature-worktree-conform-slasher-to-skills-md. This working tree stays on master. The skills.md edits would be committed on master first, so the worktree has them.
- **The current branch** — Build it on master, creating nothing. There is no branch to switch back to and nothing to merge. No isolation: partial work sits on master, and abandoning means reverting.

The engineer's answer: **Branch and worktree**
