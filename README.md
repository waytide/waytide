# Agent Norms

Reusable agent directives — the rules an AI coding agent reads at the start of a
session — organized into installable **packages**. A package is the unit of
reuse: a project adopts whole packages, never individual rules.

## Packages

- **foundation** — the `agent/` artifact framework: the
  `rules`/`observations`/`deferred`/`log` directories and how to work with them,
  the one-line decision-log format, and the ISO-8601-UTC filename convention.
  Everything includes it.
- **language** — how language is used: precisely. Words are load-bearing, so a
  word choice is a design decision. Name concepts literally, drop slang, and one
  rule per substitution.
- **design-by-efferent** — the human-in-the-loop, efferent-first design method
  (DBE): hinges and gates, the actuation-first cycle, and the method's own
  `vocabulary.md` lexicon. Contributes the `loops/` artifact directory.
- **testing** — controls-based test-writing conventions: variable prefixes, test
  structure and naming, assertion form.
- **code/ruby** — prescriptive Ruby style.
- **git** — commit conventions.
- **docs** — documentation conventions for design docs and implementation plans.

Each package declares its dependencies in a `package.md` file with an `include:`
line. Including a package pulls in the packages it includes.

```
foundation ──► (everything)

language ──► testing
language ──► code/ruby
language, testing ──► design-by-efferent

git   (standalone)
docs  (standalone)
```

## Two kinds of repository

**This composite repo is where all authoring happens.** It holds every package as a
top-level directory under one shared history. Add or refine a rule here. Because
the packages live together, a change spanning several packages is one atomic
commit, and the whole rule set can be read, grepped, and consolidated in one
place. This is the source of truth.

**Each package also has its own repository** — `agent-norms-foundation`,
`agent-norms-testing`, `agent-norms-git`, and so on (the `code/` namespace
flattens to `code-` in the repo name). Each holds a single package's files at its
root. These are how a consuming project installs a package.

The component repositories are **generated from this composite repo, not edited
directly.** Publishing a package is a `git subtree split` that extracts one
package's slice of the composite repo history and pushes it to that package's
repository. Sync runs one way only: composite repo → component repositories.

**The component repositories are downstream-only.** They only ever receive; they
are never an authoring source. Do not commit directly to a component repository —
its `master` is regenerated from this composite repo's history by `git subtree split`, so
a direct commit is not in that history and is lost or made to conflict on the
next release. All changes land in the composite repo. A change discovered while working
in a consuming project is promoted back into the composite repo (via `git subtree
push` from that project, then reconciled here) and re-published outward.

## Working as a contributor

Author in the composite repo. You never edit a component repository directly. A release
re-splits the changed packages out to their repositories and pushes them — the
split is deterministic, so unchanged history keeps its commits and only new work
is added.

A refinement discovered while working inside a consuming project is promoted back
into the composite repo and re-published outward, so the rules stay live without the
component repositories ever becoming independent sources.

### Push-back (fallback only)

The normal way to change a rule is to edit it in the composite repo and re-publish.
Do **not** treat editing an installed package inside a consuming project as a
routine authoring path.

The one exception: you spot a fix while deep in a consuming project and don't want
to lose it. Two ways to capture it, preferred first:

1. **Make the fix in the composite repo** and `git subtree pull` it back down into
   the consuming project. Cleanest — the change originates where the source lives.
2. **Push it back from the consuming project.** Commit the edit in the project's
   `agent/rules/<package>/`, then:

   ```
   git subtree push --prefix agent/rules/testing https://github.com/eventide-project/agent-norms-testing.git master
   ```

   This lands your commits on the component repo. It is a **fallback**: `subtree
   push` reconciles history awkwardly, and the change still has to be brought into
   the composite repo by hand (the component repo is downstream — the next
   composite split would otherwise overwrite it). Author in the composite whenever
   you can.

## Using a package in a project

A consuming project installs a package with `git subtree`, which places the
package's files physically into the project's `agent/rules/` tree so they are
committed alongside the code and read at session start:

```
git subtree add  --prefix agent/rules/testing https://github.com/eventide-project/agent-norms-testing.git master --squash
git subtree pull --prefix agent/rules/testing https://github.com/eventide-project/agent-norms-testing.git master --squash
```

Consult a package's `package.md` for the packages it includes, and add those too.

## Project-local rules

Rules specific to a single project live under a `local/` directory that mirrors
the package categories (`local/language`, `local/testing`, `local/code/ruby`)
and is never split or pushed, so a project-specific rule cannot leak upstream.
