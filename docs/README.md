# Agent Norms — docs

Documentation conventions for a project's design and planning artifacts.

The rules in this package govern how design docs and implementation plans are
written:

- **Plans contain no code samples** — a plan describes intended work and
  outcomes in prose, and avoids pre-baking method names, file names, or other
  details that are decided later, interactively.
- **A section documenting a dependency on a package is titled "Package
  Dependency"** — not a bare "Dependency", which is overloaded.

This is a standalone package: it includes no other packages.

## Installing into a project

Install with `git subtree` — the files land in your project's `agent/rules/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix agent/rules/docs https://github.com/eventide-project/agent-norms-docs.git master --squash
git subtree pull --prefix agent/rules/docs https://github.com/eventide-project/agent-norms-docs.git master --squash
```

It has no dependencies.
