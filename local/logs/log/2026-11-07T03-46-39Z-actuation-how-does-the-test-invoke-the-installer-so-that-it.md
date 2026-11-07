# Actuation: how does the test invoke the installer so that it moves a project's waytide/ to slasher/? — agents-md, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Actuation: how does the test invoke the installer so that it moves a project's waytide/ to slasher/?

The options:

- **agents-md** — The move is the first thing agents-md does, before it places AGENTS.md. An old project's refresh already tells the engineer to run this.
- **Bare install** — The move is the first thing a full install does, before it adds or pulls the foundation package.
- **move-layout** — A subcommand of its own that only moves the folder. The other modes would have to call it, or the engineer runs it first.

The engineer's answer: **agents-md**
