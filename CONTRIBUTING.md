# Contributing to Waytide

How the packages are authored and published. If you only want to *use* a package in your project, see the README.

## Two kinds of repository

**This composite repo is where all authoring happens.** It holds every package as a
directory under `system/` (`system/foundation`, `system/testing`, …) under one shared
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

**Before publishing, check for direct commits.** Run `./report-direct-commits.sh` from
the repository root. It reads each component repo's `master` and reports any commit whose
message this repository's history does not contain — that is, a commit made directly to the
component repo rather than produced by a split. It fetches and pushes nothing, and exits
non-zero when it finds something. Two such commits went unnoticed for days before the check
existed, found only when a publish was attempted; nothing else announces them.

**Check for partial planning directories too.** Run
`./report-partial-planning-directories.sh` from the repository root. It reports any file
under `system/` naming some but not all of a mode's planning directories — a rule naming
`plans/` and `intention/` but not `action/`, or naming `design/` alone. A rule that is
*about* one of those artifacts names every mode's directory and one that merely mentions it
names none, so a partial triple is a defect either way, and it is one that reviews,
publishes, and installs cleanly while being wrong in every project whose mode it omits. It
only reads, and exits non-zero when it finds something.

After committing a change here, re-publish the affected package by splitting its
directory and pushing to the component repo's `master`. A `git subtree split`'s
output history depends on the prefix path, so a package whose directory path is
unchanged fast-forwards, while a package whose path moved does not — its next
publish is a path-change case handled like the `vocabulary`→`language` rename.
**The composite's package directory is `system/`, reached
by a series of renames — root → `rules/` (2026-07-20) → `packages/` → `framework/`
(2026-07-22) → `system/` (2026-07-27) — each a force-reset, since a `git subtree split`'s
history depends on the prefix path. The earlier names are kept here as the record of what
the component repos previously tracked; do not restate them as `system/`. The component
repos now track the `system/<package>` split, and ordinary publishes fast-forward again —
no further reset is due unless a path moves once more.** For such an unchanged-path publish, the
deterministic split fast-forwards — guard for it before pushing:

```
git subtree split --prefix=system/testing -b publish-tmp
# confirm fast-forward, then push:
git merge-base --is-ancestor \
  "$(git ls-remote https://github.com/waytide/testing.git master | cut -f1)" \
  publish-tmp && \
git push https://github.com/waytide/testing.git publish-tmp:master
git branch -D publish-tmp
```

`code/ruby` splits from its nested path (`--prefix system/code/ruby`) into
the flat repo name `waytide/code-ruby`.

**A new package's first publish** has no `master` to fast-forward from, so the guard does not
apply — the push creates the branch. Create the repository, give it a description in the form
the others use, then split and push:

```
gh repo create waytide/<package> --public \
  -d "Waytide <package>. <What it governs>. By the Eventide Project."

git subtree split --prefix=system/<package> -b publish-tmp
git push https://github.com/waytide/<package>.git publish-tmp:master
git branch -D publish-tmp
```

`report-direct-commits.sh` handles the repository before its first publish on its own — it
reports `no master … — skipped` and carries on — so it needs no change when a package is added.
`install-all.sh` does: its package list is hardcoded, where the direct-commit check discovers
packages by finding READMEs.

**If a push is rejected, stop — do not force yet.** A rejection means the component repo
diverged, which the downstream-only rule forbids but does not prevent. Do not discard what
is there. The remedy, in order:

1. **Find what diverged** — `./report-direct-commits.sh`, or read the component's head
   directly.
2. **Adopt the change into the composite**, where it belongs, and reconcile it with any
   rule it conflicts with. This is a real authoring step, not a mechanical copy: the
   direct commit was written without the composite in view, so it may contradict something.
3. **Re-split, and confirm the content matches** what the component repo holds before
   pushing anything.
4. **Then force-push.** A commit made directly to a component repo can never become an
   ancestor of a split, so no amount of adopting makes the publish fast-forward. Forcing is
   correct once the content is safely in the composite, and only then — the commit object is
   replaced, and its content survives because step 2 put it here.

The one-time distribution that first created the component repositories is recorded in the
**Phase B runbook and checklist**, which are **suspended** under `local/suspended/` — superseded
by this document, and carrying a package map that no longer matches the packages. They are the
only record of how a repository rename and a mass re-publish after a path change were done; see
the suspended-convention for restoring them.

## Push-back (fallback only)

The normal way to change a rule is to edit it in the composite repo and
re-publish. Do **not** treat editing an installed package inside a consuming
project as a routine authoring path.

The one exception: you spot a fix while deep in a consuming project and don't want
to lose it. Two ways to capture it, preferred first:

1. **Make the fix in the composite repo** and `git subtree pull` it back down into
   the consuming project. Cleanest — the change originates where the source lives.
2. **Push it back from the consuming project.** Commit the edit in the project's
   `waytide/system/testing/`, then:

   ```
   git subtree push --prefix waytide/system/testing https://github.com/waytide/testing.git master
   ```

   This puts your commits on the component repo. It is a **fallback**: `subtree
   push` reconciles history awkwardly, and the change still has to be brought into
   the composite repo by hand (the component repo is downstream — the next
   composite split would otherwise overwrite it). Author in the composite whenever
   you can.
