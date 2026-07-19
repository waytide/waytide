# Agent Norms — docs

Documentation conventions for a project's design and planning artifacts.

The rules in this package govern how design docs and implementation plans are
written:

- **An implementation plan reads in a settled order** — Goal, Source design,
  Architecture, Process notes, Tasks, and so on (`plan-document-format`).
- **A design doc shares a common spine** — summary or premise, motivation,
  substantive sections, dated Settled resolutions, and an Out of Scope / Deferred
  tail (`design-document-format`).
- **Plans contain no code samples**. A plan describes intended work and
  outcomes in prose, and avoids pre-baking method names, file names, or other
  details that are decided later, interactively.
- **A section documenting a dependency on a package is titled "Package
  Dependency"**. Not a bare "Dependency", which is overloaded.

This is a standalone package: it includes no other packages.

```
docs  →  (nothing — standalone)
```

## Installing into a project

Install with `git subtree` — it puts the files in your project's `agent/rules/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix agent/rules/docs https://github.com/eventide-project/agent-norms-docs.git master --squash
git subtree pull --prefix agent/rules/docs https://github.com/eventide-project/agent-norms-docs.git master --squash
```

It has no dependencies.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix agent/rules/docs https://github.com/eventide-project/agent-norms-docs.git master --squash
```
