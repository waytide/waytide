# Where should the "/sup?" alias feature be built? It merges into master, from commit 6d815c56. — Branch only, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Where should the "/sup?" alias feature be built? It merges into master, from commit 6d815c56.

The options:

- **Branch only** — Create the branch feature/sup-alias and switch this working tree to it. At the conclusion this working tree switches back.
- **Branch and worktree** — Create the branch as feature/worktree/sup-alias and check it out in a new worktree: a second working directory at ../waytide-feature-worktree-sup-alias. This working tree stays on master.
- **The current branch** — Build it where the working tree already is, creating nothing. There is no branch to switch back to and nothing to merge.

The engineer's answer: **Branch only**
