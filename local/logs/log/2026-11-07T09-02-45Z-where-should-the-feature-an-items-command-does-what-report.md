# Where should the feature "An /items command does what /report does" be worked? — Branch only, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the feature "An /items command does what /report does" be worked?

The options:

- **Branch only** — Create the branch feature/items-command and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/items-command and check it out in a new worktree: a second working directory at ../slasher-feature-worktree-items-command. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, on master, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch only**
