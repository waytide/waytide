# Agent Norms — foundation

The `agent/` artifact framework that every other package builds on.

All agent artifacts for a project live under a single top-level `agent/` folder, so
they are committed to git alongside the code and read at the start of each session
rather than recalled. Foundation defines the four core artifact directories and how
to work with them; each has its own rule in this package:

- **`agent/rules/`** — binding project rules, one per file, read and followed every
  session.
- **`agent/observations/`** — working hypotheses and rule-candidates still under
  discovery; not yet binding.
- **`agent/deferred/`** — design changes postponed until the current task finishes;
  a queue, not a permanent record.
- **`agent/log/`** — the decision log: one file per decision, a one-line title.

Two conventions cut across all of them: the **ISO-8601-UTC filename prefix**
(`agent-file-names`) that makes every artifact sort chronologically and declare its
timezone, and **purpose-over-category** (`rules-install-a-mindset`) — a rule's folder
names the surface it acts on, not the purpose it serves.

Foundation also provides project-wide commands: **status report** (a whole-project
summary) and **next deferred item**.

Other packages may contribute their own artifact directories (for example,
design-by-efferent contributes `agent/loops/`); foundation owns only
`rules`/`observations`/`deferred`/`log`.

This package includes no others — everything else includes it.

## Installing into a project

Install with `git subtree` — the files land in your project's `agent/rules/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix agent/rules/foundation https://github.com/eventide-project/agent-norms-foundation.git master --squash
git subtree pull --prefix agent/rules/foundation https://github.com/eventide-project/agent-norms-foundation.git master --squash
```

This package has no dependencies.
