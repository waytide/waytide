# Agent Norms — Handoff / Resume Note

Resume point for continuing this work in a fresh session (Cowork or Claude Code). Read this first, then the two companion docs in this folder:

- `2026-07-13-agent-norms-packaging-design.md` — the full design (package types, dependency graph, subtree/composite repo workflow, settled decisions).
- `2026-07-13-agent-norms-classification-table.md` — every source rule pinned to a package, with merges and `local/` flagged.

Source rules live in the `constant` repo under `agent/rules/` (a separate mounted folder).

## Working norm (important)

**Do not execute without an explicit go-ahead.** Present a plan and wait for Scott's unambiguous affirmation before moving/creating files, creating repos, or running the migration. A settled design decision is *not* permission to execute. Design and documentation edits are fine; enacting the migration is gated.

## The goal

Turn `constant`'s `agent/rules/` directives into reusable, general-purpose packages other projects install via `git subtree`, consolidating overlaps, kept live.

## Settled decisions

- **Package = unit of reuse.** Projects depend on whole packages; consolidate *within* a package.
- **Composite repo authoring + split distribution.** This "Agent Norms" folder is the canonical composite repo (packages as root-level dirs, own full history). Each `agent-norms-<package>` component repo is a regenerated one-package view via `git subtree split --prefix=<package>`, pushed to its own repo in Scott's org. Sync is one-directional (composite repo → component repo).
- **Repo prefix:** `agent-norms-` on a shared account (e.g. `agent-norms-testing`). `code/` flattens to `code-` in repo names; subtree prefix keeps the real path `agent/rules/code/ruby`.
- **Package types:** `foundation`, `vocabulary`, `design-by-efferent` (DBE), `testing`, `code/ruby`, `git`, `docs` (plus `eventide`, reserved). `code/` and `local/` are grouping namespaces, not packages.
- **Dependencies:** everything → `foundation`; `testing` & `code/ruby` → `vocabulary`; `design-by-efferent` → `foundation`, `vocabulary`, `testing`. `git`, `docs` standalone.
- **`local/` mirror** holds `constant`-specific rules, never subtree'd, mirrors package categories (`local/code/ruby`, `local/vocabulary`, `local/testing`). Stays in `constant` only.
- **Term artifacts per package:** `vocabulary.md` (terms with meanings) and/or `substitutes.md` (retired → substitute). Terms placed by the domain they serve.
- **No manifest format;** each package dir carries an `include: …` line in a `package.md` file (separate from the informative `README.md`).
- **DBE contributes the `loops/` artifact dir;** foundation keeps `rules/observations/deferred/log`.

## Consolidations (during migration)

- **M1** controls trio → one rule (`testing`).
- **M2** hinge-presentation trio → one rule (DBE).
- **M3** per-package `substitutes` tables + the DBE `vocabulary`.
- **M4** stale supersessions closed out (mediates-for → mediates; hinge-choices → present-every-prompt; actuation/efferent-not-caller → DBE vocabulary; assert_raises "Is an error" → the "Is"-naming rule).

Most of the ~67 rules relocate unchanged; only these clusters merge. See the classification table for the row-by-row detail.

## Status (updated 2026-07-15)

- Design and classification: **complete.** All architectural decisions settled.
- Walk-through review of the classification table: **complete — all folders covered** (framework prose, `code/`, `commands/`, `docs/`, `git/`, `methodology/`, `process/`, `terminology/`, `test-writing/`). The 2026-07-15 pass on the final four folders reconciled the table against the 69 source files (was 67) and applied three corrections from the newer `2026-07-13` rules: added `subject-first-commit-messages` → **git** and `rules-install-a-mindset-purpose-over-category` → **foundation**; corrected the retired `say-efferent-oriented-design-not-development` row → `design-by-efferent` (DBE vocabulary). Coverage note bumped 67 → 69.
- **Canonical location:** this working folder (`/Users/sbellware/projects/eventide/agent-norms/`) is now the sole source of truth for all three docs. The former `~/Documents/Claude/Projects/Agent Norms/` mirror is discontinued.
- **Nothing executed yet** — no repo initialized, no files moved.

## Next steps

1. **`docs` + `git` execution** (queued, awaiting go-ahead): `git init` this folder as the composite repo; create root-level `docs/` and `git/`; copy the 2 + 3 rule files from `constant` unchanged; add a `package.md` (`include: (none)`) and an informative `README.md` to each; commit. Then (needs Scott's GitHub): create `agent-norms-docs`/`agent-norms-git`, `subtree split` + push.
2. Finish the classification-table walk-through for the remaining four folders.
3. Migrate + consolidate the rest per the classification table, one decision-log entry per consolidation (ISO-8601-UTC).
4. Prove the subtree workflow by pulling one package into a test project.
