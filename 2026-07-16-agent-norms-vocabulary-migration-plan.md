# Agent Norms — Migration Plan: `vocabulary` package

Execution plan for the third migration increment — the `vocabulary` package: the cross-cutting phrasing discipline that `testing`, `code/ruby`, and `design-by-efferent` all include. Companion to the packaging design and classification table. Same Phase A (local) → Phase B (distribution) shape as before.

**Working norm:** this plan is not permission to execute. Present and wait for explicit go-ahead before creating files or publishing.

## Scope

`vocabulary` is the cross-cutting phrasing discipline. It `include: foundation` and unblocks three downstream packages, so it comes before them.

**One rule per substitute — no `substitutes.md` table.** (Decided 2026-07-16.) Each phrasing substitution is its own rule file, consistent with the one-rule-per-file convention and with `rules-install-a-mindset` (terminology rules are the purest stance-installing rules — each swaps a word to swap a concept, so each keeps its own `Why` and dating). This reduces M3-for-vocabulary from a consolidation to a **relocation-and-split**. (M1 — the redundant controls trio in `testing` — still merges; that is genuine duplication, not distinct substitutions.)

Its content is *not* method- or test-specific — only phrasing substitutions with no home domain. Domain-specific terms live elsewhere (controls/verified/protect → `testing`; efferent/actuation/hinge → the DBE vocabulary).

## Contents (composite repo)

Two principle rules:

- **`name-literally-not-by-analogy.md`** — relocated unchanged. Name concepts by literal description; no analogies/codes/academic jargon.
- **A no-slang principle rule** — NEW, authored from the principle half of `terminology-no-slang-mediates` (literal, non-slang phrasing, in prose *and* conversation), parallel to `name-literally`.

Nine one-substitution rules — four relocated unchanged, five split out of `terminology-no-slang-mediates`:

| Retired | Use instead | source | disposition |
|---|---|---|---|
| happy path | normal path | `normal-path-not-happy-path` | relocate unchanged |
| vendor | install packages | `say-install-packages-not-vendor` | relocate unchanged |
| thread | convey | `say-convey-not-thread` | relocate unchanged |
| "initialized with" / "passed to" | sent to | `sent-to-phrasing` | relocate unchanged |
| wrap / wrapper | mediates | `terminology-no-slang-mediates` | split out; genericize the `Constant` example |
| sweep | conform | `terminology-no-slang-mediates` | split out |
| "does that land?" | plain | `terminology-no-slang-mediates` | split out |
| arm | scenario | `terminology-no-slang-mediates` | split out |
| cut | increment | `terminology-no-slang-mediates` | split out |

Plus **`package.md`** (`include: foundation`) and an informative **`README.md`**.

## Not migrated — stays `constant`-local

**All substitutions in `terminology-no-slang-mediates` are universal** and become their own rules in the composite package — including **wrap → mediates** (the general verb for a mediating/accessor relationship). Only its *example* ("a `Constant` mediates a module") is `constant`-specific, and it is genericized on the way in; the substitution itself is not `constant`-domain.

One substitution is genuinely `constant`-domain and does **not** enter the composite package — it stays in `constant`, destined for its `local/vocabulary/` mirror:

- **literal constant** (`literal-constants-terminology`) — a constant bound to a non-module value; entirely `Constant`-domain.

The `local/` mirror lives in `constant`, never in this composite repo and never split/pushed. Reconciling it (pulling the vocabulary package into `constant`, moving these rows to `local/vocabulary/`) is `constant`-side work, done when `constant` adopts the packages — **out of scope for this increment**.

## Where the split is logged

The one-file-per-substitute decision and the `no-slang-mediates` split are **migration/authoring** events, so their decision-log entry goes in the composite repo's top-level `agent/log/` (undistributed), not `vocabulary/log/`. `vocabulary/log/` starts empty — per the rule-content-only log principle.

## Phase A — Local

1. Create `vocabulary/` in the composite repo.
2. Relocate the five unchanged rules: `name-literally`, `normal-path`, `install-packages`, `convey-not-thread`, `sent-to`.
3. Author the no-slang principle rule (principle half of `no-slang-mediates`).
4. Split the five substitutions out of `no-slang-mediates` into one rule file each (genericize the `mediates` example); leave only `literal-constant` for `constant`.
5. `package.md` (`include: foundation`) + `README.md`.
6. Commit; add one decision entry (the split) to the composite `agent/log/`.

## Phase B — Distribution

Create `eventide-project/agent-norms-vocabulary` (public), `git subtree split --prefix=vocabulary`, push to `main`, prove the pull into a throwaway project.

## Open questions

1. **~~No-slang principle placement~~ — RESOLVED (2026-07-16): its own rule**, parallel to `name-literally`.
2. **~~`substitutes.md` structure~~ — MOOT (2026-07-16):** one rule per substitute, no table.
3. **`sent-to`** — the classification pins it here (general), but it is Eventide messaging idiom; confirm it isn't `eventide`-reserved. *(Open.)*

## Not done without explicit go-ahead

Any file create, and all of Phase B.
