# Contributing to Waytide

How the packages are authored and published. If you only want to *use* a package in your project, see the README.

## Two kinds of repository

**This composite repo is where all authoring happens.** It holds every package as a
directory under `rules/` (`rules/foundation`, `rules/testing`, …) under one shared
history. Add or refine a rule here. Because
the packages live together, a change spanning several packages is one atomic
commit, and the whole rule set can be read, grepped, and consolidated in one
place. This is the source of truth.

**Each package also has its own repository** in the `waytide` org — `foundation`,
`testing`, `git`, and so on (the `code/` namespace flattens to `code-` in the repo
name, e.g. `waytide/code-ruby`). Each holds a single package's files at its
root. These are how a consuming project installs a package.

The component repositories are **generated from this composite repo, not edited
directly.** Publishing a package is a `git subtree split` that extracts one
package's slice of the composite repo history and pushes it to that package's
repository. Sync runs one way only: composite repo → component repositories.

**The component repositories are downstream-only.** They only ever receive; they
are never an authoring source. Do not commit directly to a component repository —
its `master` is regenerated from this composite repo's history by `git subtree
split`, so a direct commit is not in that history and is lost or made to conflict
on the next release. All changes are made in the composite repo.

## Authoring

Author in the composite repo. You never edit a component repository directly. A
release re-splits the changed packages out to their repositories and pushes them —
the split is deterministic, so unchanged history keeps its commits and only new
work is added.

## Publishing a package

After committing a change here, re-publish the affected package by splitting its
directory and pushing to the component repo's `master`. A `git subtree split`'s
output history depends on the prefix path, so a package whose directory path is
unchanged fast-forwards, while a package whose path moved does not — its next
publish is a path-change case handled like the `vocabulary`→`language` rename (see
the Phase B checklist). **Every package moved from its root path into `rules/`, so
the first publish of each after that move is a path change, not a fast-forward.**
For an unchanged-path publish, the deterministic split fast-forwards — guard for it
before pushing:

```
git subtree split --prefix=rules/testing -b publish-tmp
# confirm fast-forward, then push:
git merge-base --is-ancestor \
  "$(git ls-remote https://github.com/waytide/testing.git master | cut -f1)" \
  publish-tmp && \
git push https://github.com/waytide/testing.git publish-tmp:master
git branch -D publish-tmp
```

`code/ruby` splits from its nested path (`--prefix rules/code/ruby`) into
the flat repo name `waytide/code-ruby`. If a push is **rejected**, stop — do not force; it means
the component repo diverged (a direct commit, which the downstream-only rule
forbids). The full step-by-step for every package — including the one-time repo
create/rename cases — is the **Phase B checklist**
(`log/2026-07-17-agent-norms-phase-b-checklist.md`) and its **runbook**.

## Push-back (fallback only)

The normal way to change a rule is to edit it in the composite repo and
re-publish. Do **not** treat editing an installed package inside a consuming
project as a routine authoring path.

The one exception: you spot a fix while deep in a consuming project and don't want
to lose it. Two ways to capture it, preferred first:

1. **Make the fix in the composite repo** and `git subtree pull` it back down into
   the consuming project. Cleanest — the change originates where the source lives.
2. **Push it back from the consuming project.** Commit the edit in the project's
   `waytide/rules/testing/`, then:

   ```
   git subtree push --prefix waytide/rules/testing https://github.com/waytide/testing.git master
   ```

   This puts your commits on the component repo. It is a **fallback**: `subtree
   push` reconciles history awkwardly, and the change still has to be brought into
   the composite repo by hand (the component repo is downstream — the next
   composite split would otherwise overwrite it). Author in the composite whenever
   you can.
