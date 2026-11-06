# Where is the feature "The current command lists the current items, then summarizes the current implementations" built? It merges into master. — Branch and worktree, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where is the feature "The current command lists the current items, then summarizes the current implementations" built? It merges into master.

The options:

- **Branch only** — Create the branch feature/current-command and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/current-command and check it out in a new worktree: a second working directory at ../waytide-feature-worktree-current-command. This working tree stays on master.
- **The current branch** — Build it on master, where the working tree already is, creating nothing. There is no isolation, partial work sits where others read, and abandoning means reverting.

The engineer's answer: **Branch and worktree**
