# Agent Norms — Migration Plan: `docs` + `git` packages

Execution plan for the first migration increment — standing up the composite repo skeleton and the two standalone, no-dependency, no-merge packages. Companion to the packaging design (`2026-07-13-agent-norms-packaging-design.md`) and the classification table (`2026-07-13-agent-norms-classification-table.md`).

**Working norm:** this plan is not permission to execute. Present and wait for an explicit go-ahead before `git init`, copying/creating files, or committing. Phase B additionally needs GitHub org repos.

## Scope

Stand up the canonical composite repo (`git init` this folder) and migrate the `docs` and `git` packages. Both are standalone (`include: (none)`) and involve **no consolidations** (no M1–M4 merges) — pure relocations. Copies are one-directional: `constant` → composite repo. The source `constant` repo is not modified.

**Delta from the handoff's original "2 + 3 files":** the 2026-07-15 walk-through re-homed `subject-first-commit-messages` from `methodology/` into the **git** package, so git is now **4 files** (3 from `git/` + 1 from `methodology/`). Everything else is unchanged.

## Phase A — Local (no GitHub needed)

Fully reversible, self-contained, no network.

### A1. Initialize the composite repo

```
cd /Users/sbellware/projects/eventide/agent-norms
git init
```

The three planning docs already at root (handoff, classification table, packaging design) — plus this plan — stay at root as composite repo-level meta. They are outside every package, so no `subtree split` will include them.

### A2. Create `docs/` and copy its 2 rules (unchanged, ISO names preserved)

```
docs/
  README.md                                          ← new (informative intro to the package)
  package.md                                         ← new (include: (none))
  2026-06-05T17-38-18Z-plans-no-code-samples.md      ← from constant/agent/rules/docs/
  2026-06-12T17-42-40Z-package-dependency-heading.md ← from constant/agent/rules/docs/
```

### A3. Create `git/` and copy its 4 rules

```
git/
  README.md                                                       ← new (informative intro to the package)
  package.md                                                      ← new (include: (none))
  2026-06-05T17-38-26Z-no-claude-coauthor.md                      ← from constant/agent/rules/git/
  2026-06-28T07-12-02Z-run-suite-before-commit.md                 ← from constant/agent/rules/git/
  2026-06-29T18-55-35Z-commit-says-task-is-done-not-mark-done.md  ← from constant/agent/rules/git/
  2026-07-13T20-54-39Z-subject-first-commit-messages.md           ← from constant/agent/rules/methodology/  (re-homed)
```

`subject-first` already states in its own body that the other commit rules "live in `agent/rules/git/`," so re-homing it there makes the package internally consistent. Copied unchanged — no edit needed (the rule does not self-reference its own path).

### A4. `package.md` (mechanical) and `README.md` (informative)

Two package-level files, separated by concern:

- **`package.md`** — the mechanical dependency declaration; holds the `include:` line and nothing that needs prose:
  ```markdown
  # docs

  include: (none)
  ```
- **`README.md`** — an informative introduction to the package (what it's for, what conventions it installs). Human-facing prose, not a dependency manifest:
  ```markdown
  # Agent Norms — <docs|git>

  <a few sentences introducing the package and the conventions it carries.>
  ```

**Convention wrinkle (confirm):** the `agent-file-names-iso8601` rule requires every file in an `agent/**` subdir to carry an ISO-8601 prefix; neither `package.md` nor `README.md` does. Both are intentional exceptions — structural package files (a manifest and an intro), not agent artifacts, and the natural repo-root files for each component repo. **Recommendation: keep both names as-is.**

### A5. First commit (dogfoods the git package's own rules)

Following the migrated rules — no Claude co-author trailer, subject-first, passive/indicative, verb omitted for a new item:

```
git add -A
git commit -m "Docs and git agent-norm packages"
```

No decision-log entry is required for the relocations themselves (no merges). The one classification event worth recording is `subject-first`'s re-home from `methodology/` → `git` — pending the decision on whether this authoring repo carries its own `agent/log/` (see Open Questions).

## Phase B — Distribution (needs GitHub org)

Gated on the two repos existing/authorized on the shared account.

### B1. Create the component repos

`agent-norms-docs` and `agent-norms-git` in the org.

### B2. Split + push each package (one-directional, composite → component)

```
git subtree split --prefix=docs -b split-docs
git push git@github.com:<org>/agent-norms-docs.git split-docs:main

git subtree split --prefix=git -b split-git
git push git@github.com:<org>/agent-norms-git.git split-git:main
```

For docs/git the package dir name and repo name coincide (the `code/` → `code-` flattening only matters for the `code/*` packages later).

### B3. Prove the pull (handoff step 4, done early on the cheapest package)

In a throwaway test project:

```
git subtree add --prefix agent/rules/git git@github.com:<org>/agent-norms-git.git main --squash
```

Confirm the 4 files land at `agent/rules/git/` with names intact and are read at session start.

## Open questions (resolve before executing)

1. **~~ISO-prefix exception for `package.md` and `README.md`~~ — RESOLVED (2026-07-16): exempt.** Both structural package files are exempt from the `agent-file-names-iso8601` convention. The `foundation` package's copy of that rule gets an explicit exemption note when foundation is migrated. The filename `package.md` is settled for now (a better term may surface later).
2. **~~Does the authoring composite repo keep its own `agent/log/`~~ — RESOLVED (2026-07-16): yes.** The composite repo dogfoods the `foundation` `log/` convention. `agent/log/` created and backfilled with the first two migration decisions (the `subject-first` re-home and the `include:`/`package.md` adoption); M1–M4 merge decisions get one entry each as the consolidation increments run.
3. **~~Phase B timing~~ — RESOLVED (2026-07-16): done.** Org is `eventide-project`. Both repos created **public** (`agent-norms-docs`, `agent-norms-git`), split + pushed to `main`, and the pull proven into a throwaway project. Phase B complete.

## Not done without explicit go-ahead

`git init`, any file copy/create, any commit (Phase A); and all of Phase B.
