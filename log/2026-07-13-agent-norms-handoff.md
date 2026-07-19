# Agent Norms — Handoff / Resume Note

Resume point for continuing this work in a fresh session. Read this first, then the two companion docs in this folder:

- `2026-07-13-agent-norms-packaging-design.md` — the full design (package types, dependency graph, subtree/composite repo workflow, settled decisions).
- `2026-07-13-agent-norms-classification-table.md` — every source rule pinned to a package, with merges and `local/` flagged.

Source rules live in the `constant` repo under `agent/rules/` (a separate mounted folder).

## Working norm (important)

**Do not execute Phase B without an explicit go-ahead.** Present a plan and wait for Scott's unambiguous affirmation before creating or re-splitting any component repo, or pushing. A settled design decision is *not* permission to execute. Authoring in the composite repo (Phase A) is the ongoing work; distribution (Phase B) is gated.

## The goal

Turn `constant`'s `agent/rules/` directives into reusable, general-purpose packages other projects install via `git subtree`, consolidating overlaps, kept live.

## Settled decisions

- **Package = unit of reuse.** Projects depend on whole packages; consolidate *within* a package.
- **Composite repo authoring + split distribution.** This "Agent Norms" folder is the canonical composite repo (packages as root-level dirs, own full history). Each `agent-norms-<package>` component repo is a regenerated one-package view via `git subtree split --prefix=<package>`, pushed to its own repo in `eventide-project`. Sync is one-directional (composite → component).
- **Repo prefix:** `agent-norms-` (e.g. `agent-norms-testing`). `code/` flattens to `code-` in repo names; the subtree prefix keeps the real path `agent/rules/code/ruby`. `code/` groups by *programming* language and is not a package.
- **Package types:** `foundation`, `language`, `design-by-efferent` (DBE), `testing`, `code/ruby`, `git`, `docs` (plus `eventide`, reserved). `code/` and `local/` are grouping namespaces, not packages.
- **Dependencies:** everything → `foundation`; `testing` & `code/ruby` → `language`; `design-by-efferent` → `foundation`, `language`, `testing`. `git`, `docs` standalone.
- **`local/` mirror** holds `constant`-specific rules, never subtree'd, mirrors package categories (`local/code/ruby`, `local/language`, `local/testing`). Stays in `constant` only.
- **Term artifacts per package:** one rule per substitute (no `substitutes.md` table). A cohesive glossary of interlocking terms-with-meanings may be a `vocabulary.md` (DBE is the one package that has one); a standalone term-with-meaning is a rule (e.g. `language`'s `solubility`). Terms placed by the domain they serve.
- **No manifest format;** a package with dependencies carries an `install-dependencies.sh` that installs them (standalone packages carry none); the composite carries `install-all.sh`. A package's structural files — `README.md`, `vocabulary.md`, `install-dependencies.sh` — are exempt from the ISO-8601 filename prefix; its dated artifacts (rules, `log/` entries) always take it. (The former one-line `include:` `package.md` manifest was dropped 2026-07-18.)
- **Each package's `log/` carries only rule-content decisions** (consumer provenance; distributed with the package). **Migration/packaging/authoring history is undistributed** — it stays in the composite repo's top-level `agent/log/` (never split/pushed). Distinct from the *project* decision log (foundation's `agent/log/` convention for a consuming project's own decisions). A package log starts empty.

## Consolidations (during migration)

- **M1** controls trio → one rule (`testing`) — done, published.
- **M2** hinge-presentation trio → one rule, `what-each-hinge-displays` (DBE) — done, not yet published.
- **M3** ~~substitutes tables~~ → one rule per substitute (no table); DBE keeps its `vocabulary.md` glossary — done.
- **M4** stale supersessions closed out (mediates-for → mediates; hinge-choices → present-every-prompt; efferent/actuation-not-caller → DBE `vocabulary.md`; error tests named "Fails"/"Doesn't fail" as of 2026-07-17, the `assert_raises`-into-"Is" fold reversed).

## Status

**Phase A (authoring) is complete for all seven packages.** Every package exists as a root-level directory with its rules, `README.md`, and (where applicable) `install-dependencies.sh` and `log/`. Working tree is clean on `master`.

**Phase B (distribution) — COMPLETE as of 2026-07-17.** All seven packages are published to their component repos and each pull was proved. No package carries unpublished changes.

| Package | Component repo | State |
|---|---|---|
| `docs` | `agent-norms-docs` | published (untouched this round) |
| `foundation` | `agent-norms-foundation` | re-published (fast-forward) |
| `language` | `agent-norms-language` | repo **renamed** from `agent-norms-vocabulary`, then force-pushed (history reset — path changed `vocabulary/`→`language/`) |
| `testing` | `agent-norms-testing` | re-published (fast-forward) |
| `code/ruby` | `agent-norms-code-ruby` | re-published (fast-forward) |
| `git` | `agent-norms-git` | re-published (fast-forward) |
| `design-by-efferent` | `agent-norms-design-by-efferent` | **created** and first-published |

The four fast-forward re-publishes each passed a `merge-base --is-ancestor` guard before pushing; `language` force-pushed by design (the only intended force); `design-by-efferent` created `main` fresh. Runbook and checklist: `2026-07-17-agent-norms-phase-b-runbook.md`, `2026-07-17-agent-norms-phase-b-checklist.md`.

**Release 2026-07-19 — planning/design/experiments conventions.** Authored six new rules and re-published the two packages that carry them, both clean fast-forwards to `master`:

- `foundation` (`agent-norms-foundation`, `488c600 → 503d688`) — added `agent-plans-convention`, `agent-design-convention`, `agent-experiments-convention`, and `experiment-runs-on-its-own-branch`, plus a README update naming the new `plans`/`design`/`experiments` work-artifact directories.
- `docs` (`agent-norms-docs`, `e990d90 → 04d99b3`) — added `plan-document-format` and `design-document-format`, plus a README update.

Both were proved by a throwaway pull. The rules were drafted from `constant`'s worked examples of `agent/plans/`, `agent/design/`, and `agent/experiments/`. Experiments carry a full branch lifecycle: their own `experiment/<subject>` branch, a single-branch-to-a-verdict default (runs optional), the states **affirmed / refuted / inconclusive / abandoned / superseded** (plus **suspended**), a test-gated merge on affirmation that also copies the experiment's log into `agent/log/`, and user-confirmed branch deletion. The originating deferred item was resolved (deleted, with an `agent/log/` entry). One follow-up remains parked as its own deferred item: surveying `constant`'s `agent/sessions/` for a possible fourth convention — gated behind finishing agent-norms before returning to `constant`.

## What this session did (2026-07-17)

Built the DBE package (Phase A), then a cascade of conformance work it exposed:

- **DBE package authored** — the methodology rules relocated with the TDD→DBE genus relabeling, the M2 merge, the M4 folds, the `tdd-lexicon` consolidated as the DBE `vocabulary.md`, the `loops/` contribution, and hinge 2 renamed **assertion → observation**.
- **`vocabulary` package renamed to `language`** — a vocabulary is a set of words; the package governs how language is *used*. Frees "vocabulary" for the glossary artifact (DBE's). Its governing premise, `language-is-precise-here`, was authored: precision is the **extant term**, obscured from two sides — **colloquialism** that buries the established technical term (what the substitutions recover), and **dramatic jargon** that buries meaning under ceremony.
- **`say-obsolete-not-dead` added** to `language` — never "dead" for something no longer used/inactive/obsolete; "obsolete" is the fallback, the exact word (unresolvable / retired / never fires) preferred.
- **solubility (b) enacted** — `solubility` added to `language` as a rule; `name-literally`'s dangling cross-repo reference repointed.
- **Systemic conformance sweep** — see the pattern below.

## The pattern to watch

Every re-publish in the queue traces to one of two recurring faults, and both will keep surfacing:

1. **A package contradicts a rule it includes.** A rule added after the prose it governs, with the prose never conformed. This session found four: green-on-arrival vs. verified-not-green (kept as a deliberate exception), "arrange" vs. controls-not-arrange, "swept" vs. conform-not-sweep, "dead" vs. the new obsolete-not-dead. Each surfaced one at a time, downstream of the word — itself an instance of `language-is-precise-here`.
2. **Obsolete `constant`-layout paths.** The path-trim pass had only ever run on `code/ruby`; `testing`, `language`, `foundation`, and `git` all still carried `agent/rules/…` paths that resolve nowhere for a consumer. Now swept across every package. **Rule settled:** cross-references *by name* are informational pointers and are kept across packages in both directions; only *paths* go obsolete.

Before Phase B, worth one deliberate pass per package asking "does this contradict a rule it includes?" rather than waiting for the next one to surface.

## Open, not blocking

- **`Constant` examples** remain in the relocated `testing` and `code/ruby` rules, deferred to a later generalization pass (noted in their publish logs).
- The `constant` repo's own deferred item `conform-efferent-oriented-design-to-dbe` still covers `constant`'s observations, design docs, and README — not closed by the package work here.

## Next steps

The migration is functionally done — all seven packages authored, consolidated, conformed, and published. What remains is optional cleanup, none of it blocking:

1. **Reconcile the lagging design docs.** The classification table and packaging design predate the DBE build's detail and the `vocabulary`→`language` rename in a few descriptive spots (not the repo-name list, which is conformed). A pass to bring them level with the built state.
2. **~~`Constant`-example generalization~~ — DONE (2026-07-17).** The `testing` and `code/ruby` rules now illustrate with the neutral **`Upload`** domain (a useful object: dependency, `build` factory, `call` actuator) and its value object **`Upload::Result`** (build-normalizes/new-strict) — one example matching the Doctrine of Useful Objects. Both packages re-published. The build-constructor rule's supertype-as-factory-of-subtypes sub-point — formerly on hold — now uses an `Upload::Result` family (`Success`/`Rejected`); no `Constant` remains in any package.
3. **`constant`'s own deferred item** `conform-efferent-oriented-design-to-dbe` still covers `constant`'s observations, design docs, and README — a `constant`-side task, not part of the package work here.
4. **Ongoing:** new rules and refinements are authored here in the composite repo (Phase A) and released by re-running the relevant package's steps in the checklist (Phase B). The fast-forward guard makes re-publishing safe and repeatable.
