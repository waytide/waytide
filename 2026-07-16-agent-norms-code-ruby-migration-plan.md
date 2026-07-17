# Agent Norms — Migration Plan: `code/ruby` package

Execution plan for the fifth migration increment — the `code/ruby` package: prescriptive Ruby style. Companion to the packaging design and classification table. Same Phase A → Phase B shape.

**Working norm:** this plan is not permission to execute. Present and wait for explicit go-ahead before creating files or publishing.

## Scope

`code/ruby` holds prescriptive Ruby style. It `include: foundation, vocabulary` (vocabulary for prose terms), is independent of `testing` and `design-by-efferent`, and is **the first package under a grouping namespace** — `code/` is not a package, it is a language grouping; `code/ruby` is the package (future `code/sh`, `code/sql` would be siblings). The composite-repo directory is the nested path `code/ruby/`; the component repo flattens to `agent-norms-code-ruby`; the subtree prefix keeps the real path `agent/rules/code/ruby`.

## Contents (composite repo)

**Ruby-style rules — relocate (Constant examples + project-specific `log/`/`design` cross-refs flagged for a later generalization pass):**
- `no-prepositions-in-method-names` — **M4** is already reflected in the source (the relation verb is the bare "mediates", not "mediates for"); relocate as-is, trimming the `constant`-specific log cross-references.
- `no-inline-method-call-arguments`
- `optional-params-default-in-body` — a large rule with three parts (default in the body with `||=`; don't default an argument you only delegate; default with `.nil?` for a settable payload that may be legitimately falsy). All general Ruby; relocate whole.
- `positional-default-no-spaces`
- `include-domain-mixin-before-infrastructure`
- `build-constructor-normalizes-new-is-strict` — the general **`build` normalizes / `new` is strict** distinction. See the split below.

**Command — relocate and generalize:**
- `lib-report-format` — keep the classification lenses (role/layer, Ruby construct, method style, API currency, error taxonomy, idioms), drop the `Constant`-specific buckets; recompute from the project's `lib/`.

**Package files:** `package.md` (`include: foundation, vocabulary`) and an informative `README.md`.

## The `build`/`new` split

`build-constructor-normalizes-new-is-strict` has two parts:

1. **General** — `build` is the normalizing constructor; `new` is the strict initializer. → `code/ruby`.
2. **The intra-family-factory privilege** — a supertype that acts as a factory of its subtypes may call a subtype's `new` directly when it already holds the strict, normalized form. The classification table pinned this half to `local/code/ruby` as `Constant`-specific.

**Open question (below):** that privilege reads as a *general* OO/factory principle illustrated with `Constant` — the same shape as `wrap→mediates` (universal, only the example was `Constant`-specific), which we recently reclassified from local to general. It may belong in `code/ruby` with a genericized example rather than in `local/`.

## Not migrated — stays `constant`-local

- `string-outputs-permissive-inputs` → `local/code/ruby` — the robustness principle (liberal in what it accepts, uniform in what it returns) applied specifically to **constant names** (anchored on `Module#name`/`#constants`). `Constant`-domain. (The general robustness principle underneath could later be extracted as its own `code/ruby` rule; not in scope here.)
- The intra-family-factory-privilege half of the `build`/`new` rule — **pending the open question**; local if it stays `Constant`-specific, `code/ruby` if judged general.

## Generalization concerns (flagged, not blocking)

- The style rules lean on `Constant` examples (`Constant::Define`, `Constant.get`, `Module#const_get`) and cross-reference project-specific `agent/log/` and `agent/design/` files. Relocated as-is; genericizing examples and trimming dead cross-refs is a later pass (same posture as prior increments).
- Cross-references reach into `vocabulary` (name-literally, sent-to, no-slang) — valid, that's an included package — and into DBE's lexicon (solubility/precision) — soft `Related:` pointers that dangle if DBE isn't installed. Acceptable.

## Where the migration decisions are logged

Relocations, the `build`/`new` split, and the intra-family-privilege placement are **migration/authoring** events → composite top-level `agent/log/`. `code/ruby/log/` starts empty (it gains an entry only on a genuine decision about a `code/ruby` rule's content).

## Phase A — Local

1. Create `code/ruby/` (nested) in the composite repo.
2. Relocate the five straightforward style rules (trim `constant`-specific cross-refs where dead).
3. Relocate the general `build`/`new` distinction; place the intra-family-privilege half per the resolved open question.
4. Relocate and generalize `lib-report`.
5. `package.md` (`include: foundation, vocabulary`) + `README.md`.
6. Commit; add the split/placement decision entries to the composite `agent/log/`.

## Phase B — Distribution

Create `eventide-project/agent-norms-code-ruby` (public), `git subtree split --prefix=code/ruby`, push to `main`, prove the pull into `agent/rules/code/ruby`.

## Open questions

1. **Intra-family-factory privilege — general or `Constant`-local?** It reads as a general principle (supertype-as-factory may call a subtype's `new` directly when holding strict form) illustrated with `Constant` — parallel to the `wrap→mediates` reclassification. **Recommendation: general → `code/ruby`**, with the `Constant.namespace` example genericized; only the example was project-specific.
2. **`string-outputs-permissive-inputs`** — keep the whole rule `local` (recommended, per classification — it is about constant names specifically), or split out a general "robustness principle" `code/ruby` rule now? Recommend keeping local; extract later if a second use appears.
3. **`lib-report` generalization** — confirm the lenses generalize cleanly with the `Constant` buckets dropped (recommended, parallel to `test-report`).

## Not done without explicit go-ahead

Any file create, and all of Phase B.
