# Where is the feature "Waytide is renamed Slasher" worked? Its upstream is master. — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the feature "Waytide is renamed Slasher" worked? Its upstream is master.

The options:

- **Branch only** — Create the branch feature/rename-to-slasher and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/rename-to-slasher and check it out in a new worktree: a second working directory at ../waytide-feature-worktree-rename-to-slasher. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, on master, creating nothing. There is no branch to switch back to and nothing to merge. Offered only for work without a verdict.

The engineer's answer: **Branch and worktree**
