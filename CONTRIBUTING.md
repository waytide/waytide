# Contributing to Waytide

How the packages are authored and published. If you only want to *use* a package in your project, see the README.

## Two kinds of repository

**This composite repo is where all authoring happens.** It holds every package as a
directory under `system/` (`system/foundation`, `system/testing`, …) under one shared
history. Add or refine a rule here. A change spanning
several packages is one atomic commit, since the packages live together. The
whole rule set can be read, grepped, and consolidated in one place. This is the source of truth.

**Each package also has its own repository** in the `waytide` org — `foundation`, `testing`, `git`, and so on. A grouped package's repository is its installed path with the slash flattened to a dash, so a grouped `ext/some-tool` gives `waytide/ext-some-tool`. A package may declare a different one, and the Ruby package does. Each holds a single package's files at its
root. These are how a consuming project installs a package.

**One package is not authored here.** `ext/ruby-lang` moved out of this composite on 2026-08-21 and is authored in `waytide/waytide-ruby` directly. Nothing splits into it, so it is not downstream-only and the rule below does not reach it. Its dependency is every package this composite holds, which is what makes installing it enough for a Ruby project. See the migration record *The Ruby package moves to `tools-ruby-lang`*.

The component repositories are **generated from this composite repo, not edited
directly.** Publishing a package is a `git subtree split` that extracts one
package's slice of the composite repo history and pushes it to that package's
repository. Sync runs one way only: composite repo → component repositories.

**The component repositories are downstream-only.** They only ever receive. They
are never an authoring source. Do not commit directly to a component repository.

Its `master` is regenerated from this composite repo's history by `git subtree split`. So a direct commit is not in that history. It is lost, or made to conflict, on the next release. All changes are made in the composite repo.

## Authoring

Author in the composite repo. You never edit a component repository directly. A release re-splits the changed packages out to their repositories and pushes them. The split is deterministic, so unchanged history keeps its commits and only new work is added.

## Publishing a package

**Before publishing, check for direct commits.** Run `./report-direct-commits.sh` from
the repository root. It reads each component repo's `master` and reports any commit whose
message this repository's history does not contain. That is a commit made directly to the
component repo rather than produced by a split.

It fetches and pushes nothing, and exits
non-zero when it finds something. Two such commits went unnoticed for days before the check
existed, found only when a publish was attempted. Nothing else announces them.

**The planning-directories check was decommissioned on 2026-08-18**, with the mode mechanism it
existed for. It reported a file naming some but not all of a mode's planning directories, and one
directory leaves that defect no way to arise.

After the work merges to the upstream branch, re-publish the affected package by splitting its directory and pushing to the component repo's `master`. Publish from the upstream branch, never from an experiment branch or a feature branch. A `git subtree split`'s
output history depends on the prefix path. So a package whose directory path is
unchanged fast-forwards, and a package whose path moved does not. Its next publish is a path-change case handled like the `vocabulary`→`language` rename.

**The composite's package directory is `system/`, reached
by a series of renames** — root → `rules/` (2026-07-20) → `packages/` → `framework/`
(2026-07-22) → `system/` (2026-07-27). Each was a force-reset, since a `git subtree split`'s
history depends on the prefix path. The earlier names are kept here as the record of what
the component repos previously tracked. Do not restate them as `system/`.

The component
repos now track the `system/<package>` split, and ordinary publishes fast-forward again —
no further reset is due unless a path moves once more.** For such an unchanged-path publish, the
deterministic split fast-forwards — guard for it before pushing:

```
git subtree split --prefix=system/testing -b publish-tmp
# confirm fast-forward, then push:
git merge-base --is-ancestor \
  "$(git ls-remote git@github.com:waytide/testing.git master | cut -f1)" \
  publish-tmp && \
git push git@github.com:waytide/testing.git publish-tmp:master
git branch -D publish-tmp
```

No package in this composite is nested today. A grouped one would split from its nested
path — `--prefix system/<group>/<name>` — into the flattened repo name, which is what
`ext/ruby-lang` did before it moved out.

**A new package's first publish** has no `master` to fast-forward from, so the guard does not
apply — the push creates the branch. Create the repository, give it a description in the form
the others use, then split and push:

```
gh repo create waytide/<package> --public \
  -d "Waytide <package>. <What it governs>. By the Eventide Project."

git subtree split --prefix=system/<package> -b publish-tmp
git push git@github.com:waytide/<package>.git publish-tmp:master
git branch -D publish-tmp
```

`report-direct-commits.sh` handles the repository before its first publish on its own. It
reports `no master … — skipped` and carries on, so it needs no change when a package is added.
`install` does: its package sets are written into the script, where the direct-commit check
discovers packages by finding READMEs.

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
   correct once the content is safely in the composite, and only then. Step 2 put the content
   here, so replacing the commit object does not lose it.

The one-time distribution that first created the component repositories was recorded in the
**Phase B runbook and checklist**. Those were suspended on 2026-08-03, superseded by this
document, and removed on 2026-08-18 with the suspension mechanism itself. They carried a package
map that no longer matched the packages. They were the only record of how a repository rename and
a mass re-publish after a path change were done, and git holds them — see the log entry
`2026-08-03T05-30-10Z-the-phase-b-runbook-and-checklist-are-suspended`.

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
   git subtree push --prefix waytide/system/testing git@github.com:waytide/testing.git master
   ```

   This puts your commits on the component repo. It is a **fallback**. `subtree push` reconciles history awkwardly, and the change still has to be brought into the composite repo by hand. The component repo is downstream, and the next composite split would otherwise overwrite it. Author in the composite whenever
   you can.
