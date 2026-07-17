# Agent Norms — Migration Plan: `foundation` package

Execution plan for the second migration increment — the `foundation` package, which every other package includes. Companion to the packaging design (`2026-07-13-agent-norms-packaging-design.md`) and the classification table (`2026-07-13-agent-norms-classification-table.md`). Follows the same Phase A (local) → Phase B (distribution) shape as the docs+git plan.

**Working norm:** this plan is not permission to execute. Present and wait for an explicit go-ahead before creating files, moving entries, or publishing. Phase B needs the GitHub org (already known: `eventide-project`).

## Scope

`foundation` is the base of the dependency graph — everything includes it, and it includes nothing (`include: (none)`). Unlike docs+git, it is not a pure relocation: its core content currently lives as prose inside `constant`'s `AGENTS.md` and must be **authored into standalone rule files**, not copied.

Contents, by origin:

- **Authored from `AGENTS.md` framework prose** — the `agent/` artifact framework: the `rules` / `observations` / `deferred` / `log` directories and how to work with them, and the one-line decision-log format. This is the one increment with genuine authoring; the exact rule breakdown is settled during the work, not pre-named here (per the plans-no-code-samples / no-over-prescription norm).
- **Relocated unchanged** — `status-report` and `next-deferred-item` (from `commands/`), `agent-file-names-iso8601` (from `process/`), `rules-install-a-mindset` (from `methodology/`).
- **Amended on relocation** — `agent-file-names-iso8601` gains the `package.md` / `README.md` exemption note settled during the docs+git increment.

## Per-package decision logs (folded in)

Each package carries its **own** `log/` directory, and that log travels with the package when a project installs it (landing at `agent/rules/<package>/log/`). A package-local decision — why a rule in the package is shaped the way it is — is provenance that belongs with the package. This is open source; distributing the reasoning alongside the rules is a feature. (The git package already demonstrates this: `git/log/` carries the `subject-first` re-home entry.)

Two distinct log concepts, not to be conflated:

- **A project's own decision log** — the `foundation` convention a consuming project follows: `agent/log/` for *that project's* decisions. Consumer-facing; stays a foundation rule.
- **A package's authoring log** — `<package>/log/`, recording decisions about *that package's* rules, traveling with the package as provenance. A packaging-structure convention (recorded in the packaging design), not a consumer rule.

**Relocating the existing composite-level entries.** The composite repo's top-level `agent/log/` currently holds four entries. As part of this increment, the framework/convention ones move into **`foundation/log/`**, where they belong (they are foundation decisions):

- `include:` / `package.md` adoption → `foundation/log/`
- `package.md` / `README.md` ISO-prefix exemption → `foundation/log/`
- composite / component repo naming → `foundation/log/`
- the per-package-log convention itself → `foundation/log/`

The composite top-level `agent/log/` then retains only pure **migration-milestone** entries (e.g. the docs+git publish-and-prove record) — the transitional record of the migration, distinct from any package's authoring history.

## Phase A — Local

1. **Create `foundation/`** as a top-level package directory.
2. **Relocate** the four unchanged rules from their `constant` source folders.
3. **Amend** `agent-file-names-iso8601` with the `package.md`/`README.md` exemption note.
4. **Author** the framework rules from `AGENTS.md` prose (rules/observations/deferred/log conventions, decision-log format). Prerequisite: read `constant`'s `AGENTS.md` to scope the extraction before writing.
5. **`package.md`** (`include: (none)`) and an informative **`README.md`**.
6. **`foundation/log/`** — move the four framework/convention entries here from the composite top-level `agent/log/`.
7. **Commit**, following the git package's own conventions.

## Phase B — Distribution

1. Create `eventide-project/agent-norms-foundation` (public, consistent with docs/git).
2. `git subtree split --prefix=foundation` and push to `main` (composite → component, one-directional).
3. Prove the pull into a throwaway project — files land at `agent/rules/foundation/` with names intact, including `foundation/log/`.

## Open questions (resolve before / during execution)

1. **`AGENTS.md` extraction scope** — how much framework prose becomes how many rule files. Determined by reading `AGENTS.md`; not pre-named here.
2. **Framework-rule naming** — settled during authoring, per the no-over-prescription norm.

## Not done without explicit go-ahead

Any file create/move, the `AGENTS.md` extraction, and all of Phase B.
