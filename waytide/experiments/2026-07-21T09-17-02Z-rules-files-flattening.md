# Experiment — Can the rules files be flattened?

## Question

The suspicion under test: **the rules files could be flattened** — the per-package
subdirectories under `rules/` (`rules/foundation/`, `rules/testing/`, …) collapsed
so the rule files sit together in a single flat `rules/` directory, with no package
subdirectory. Is that feasible, and at what cost?

## Setup

- **Upstream branch:** `master`
- **Experiment branch:** `experiment/rules-files-flattening`
- **Base:** `4764a6ca713c6857f460179a4040ac71af21a9c1` (master HEAD at start)
- **Kind:** observation-only. Per the hard constraint on the `flatten-the-rules-files`
  deferred item (2026-07-21), **no on-disk rules-file change is made** — not even on
  this isolated branch. Flattenability is *determined by analysis*, not by trial
  flattening. There is therefore nothing to merge; on affirmation, the findings are
  copied into `waytide/log/`.

## Forecast (committed before the work)

Prediction, made before looking:

- **The rule `.md` files, considered alone, probably do not collide.** They carry
  ISO-8601-UTC filename prefixes, which are near-unique, so moving just the rule
  files into one flat `rules/` likely produces no filename clashes among them. This
  narrow claim I expect to hold.
- **But flattening the `rules/` tree as a whole is blocked**, by four things I
  expect to find:
  1. **`README.md` collides.** Every package has one (7 READMEs). They cannot
     coexist in a flat directory.
  2. **Install scripts collide / orphan.** Several packages carry
     `install-dependencies.sh`; foundation carries `install.sh`. Same-named files
     across packages clash, and they are package-scoped anyway.
  3. **`vocabulary.md` is package-scoped.** design-by-efferent's glossary belongs to
     its package; loose in a flat `rules/` it loses its owner.
  4. **Distribution breaks.** The `git subtree split --prefix=rules/<package>`
     publish keys on the per-package directory. Flatten it away and there is no
     slice to split — the seven component repos can no longer be produced.
  5. **The convention's package/local distinction is erased.** `agent-rules-convention`
     defines installed packages as subdirectories and the project's own rules as
     loose top-level files in `rules/`; a fully flat `rules/` removes the signal for
     which package a rule belongs to, and the package-vs-local boundary.
- **Predicted verdict:** the suspicion is **refuted for the distributed `rules/`
  tree** — flattening is not feasible without dismantling the package model and
  redesigning distribution. The narrow "the rule `.md` files alone would not
  name-collide" is expected to be **affirmed**, but that is not the same as
  flattening the rules files as they are packaged and shipped.
- **Where I expect to be wrong (self-forecast of misses):** possibly a real rule-file
  name collision I did not anticipate (two packages authored a file in the same
  second, or share a basename); possibly more per-package non-rule files than the
  four kinds above; possibly a flatten variant that keeps the package boundary some
  other way (e.g. a package prefix folded into each filename) that changes the
  verdict from "refuted" to "feasible with a renaming scheme."

## What actually happened

Determined by analysis of the working tree at the base commit (no rules file moved).

| Forecast | Outcome |
|---|---|
| Rule `.md` files alone do not name-collide | **Held.** 78 rule files, 78 unique basenames — zero basename collisions if gathered into one flat `rules/`. |
| `README.md` collides | **Confirmed — ×7** (one per package). |
| Install scripts collide / orphan | **Confirmed** — `install-dependencies.sh` ×4 (language, testing, code/ruby, design-by-efferent) and `install.sh` ×1 (foundation). |
| `vocabulary.md` is package-scoped | **Confirmed** — ×1 (design-by-efferent). |
| Distribution breaks (`--prefix=rules/<package>` split) | **Confirmed** structurally — established earlier this session that the publish keys on the per-package directory. Flatten it and there is no slice to split. |
| Convention's package/local distinction erased | **Confirmed** — `agent-rules-convention` carries package identity in the directory, not the filename. |

**Miss (the informative part):** I forecast "near-unique" filename *prefixes*. In fact
the timestamp prefix is **not** unique — **77 distinct ISO prefixes for 78 files**:
`rules/design-by-efferent/2026-07-17T03-44-29Z-what-each-hinge-displays.md` and
`rules/language/2026-07-17T03-44-29Z-solubility.md` share the second. Their *slugs*
differ, so full basenames stay unique — but this shows filename uniqueness already
leans on the slug, not the timestamp. Any flatten scheme that keyed on the timestamp
alone would collide; one that preserves full basenames is safe.

## Findings

1. **The rule files themselves are flattenable without collision.** 78 rule `.md`
   files, 78 unique basenames. The suspicion holds *for the rule files as such*.
2. **But `rules/` is not only rule files.** It carries per-package scaffolding — 7
   `README.md`, 4 `install-dependencies.sh` + 1 `install.sh`, 1 `vocabulary.md` —
   none of which can coexist in a flat directory without renaming or relocation.
3. **Distribution is the hard blocker.** `git subtree split --prefix=rules/<package>`
   requires the per-package directory. A flat `rules/` has no per-package slice, so
   the seven component repos can no longer be produced. Flattening *entails a
   distribution redesign*, not just a file move.
4. **Package identity lives in the directory, not the filename.** Flattening erases
   which package a rule belongs to, and the package-vs-local-rule distinction the
   convention defines. Recovering it means folding identity into each filename (a
   renaming scheme) — workable, since names already carry a slug, but a real change.
5. **Net.** The rule `.md` files *could* be flattened; the packaged, shipped `rules/`
   tree *could not* be, without (a) relocating/renaming the per-package non-rule
   files, (b) redesigning distribution away from per-package subtree splits, and (c)
   re-encoding package identity into filenames.

## Final state

**Determination complete; awaiting the user's declaration** (affirmed is user-declared).
The verdict turns on which reading of "flatten the rules files" is intended:

- **Narrow — the rule `.md` files alone into one directory:** feasible, no collisions
  → would be **affirmed**.
- **Broad — flatten the shipped `rules/` tree in place:** not feasible without a
  distribution redesign and metadata handling → would be **refuted as infeasible
  without that redesign**.

No on-disk rules file was changed. Nothing to merge (observation-only); on an
affirmed narrow reading, these findings are copied to `waytide/log/`.

## Trial (active — per user direction, 2026-07-21)

After the determination, the user chose to enact a flattening approach directly, so
the experiment continues as an **active trial** on this branch — no longer
observation-only. The on-disk change is now explicitly directed, which satisfies the
`flatten-the-rules-files` deferred item's hard constraint. Steps are taken one at a
time; `master` stays untouched.

**Step 1 — strip the ISO-8601-UTC timestamp prefixes from the rule filenames.**
Working copy confirmed clean first. All 78 prefixed rule `.md` files under `rules/`
were renamed to the slug alone (e.g.
`2026-07-13T20-54-39Z-subject-first-commit-messages.md` →
`subject-first-commit-messages.md`); `README.md`, `vocabulary.md`, and the install
scripts carry no prefix and are untouched. Pre-checks: no within-package slug
collisions (rename cannot clobber), and all 78 stripped slugs are globally unique (a
later flatten of the rule files would not name-collide). This deliberately departs
from the `agent-file-names-use-iso8601-utc-prefix` rule — an experimental deviation,
isolated on the branch, not merged.

**Step 2 — consolidate the language substitution lexicon.** Per the
conceptual-cohesion authoring standard settled with the user (a glossary is one
cohesive unit; its entries are leaves, not separate concepts, so they consolidate,
while cross-referenced hubs stay separate), the ten language substitution rules —
`normal-path-not-happy-path`, `say-conform-not-sweep`, `say-convey-not-thread`,
`say-increment-not-cut`, `say-install-packages-not-vendor`, `say-mediates-not-wrap`,
`say-obsolete-not-dead`, `say-plainly-not-land`, `say-scenario-not-arm`,
`sent-to-phrasing` — are consolidated into one `rules/language/word-substitutions.md`
(title "Word Substitutions"): a table for the mechanical swaps plus prose notes for
the three with finer distinctions (mediates, obsolete, sent-to). No swap's content
or nuance is dropped. The ten source files are removed. The language README's "one
rule each" claim and its duplicated table are replaced with a single listing of the
lexicon rule. Cross-package back-references are repointed to the Word Substitutions
rule: the "sent to" phrasing rule (testing `control-prefix-test-vars`,
`test-name-is-prefix`; code/ruby `no-prepositions`) and "the de-slang rules in
language" (testing `say-verified-not-green`, `say-protect-not-guard`); a stale
`mediates-not-wrap` example in foundation `rules-install-a-mindset` is dropped. Hubs
(`name-literally`, `no-slang`, `solubility`) and the test/commit-domain substitutions
stay in place. Net: ten files → one, no dangling references.

### Finding — consolidation is the exception, not the direction

Reviewing the remaining Tier-1 candidates sharpened the criterion: **consolidate
only when the distinction between the rules is inert.** The substitution lexicon
qualified because its ten entries are independent swaps with no interplay — a flat
glossary, nothing lost by gathering them. The other Tier-1 candidates were declined,
because their distinctions do real work:

- `show-the-test-after-implementing` vs.
  `show-feature-test-output-after-implementation-hinge` — the distinction *is* the
  content: **what** to show (the just-satisfied test) vs. the **whole feature's**
  output, at their own moments. Kept separate.
- `build-normalizes-new-strict` vs. `robustness-lives-at-the-class-interface` — one
  is a specific construction mechanic, the other a general design principle reaching
  past construction. Kept separate.

So a **useful (load-bearing) distinction earns its file**; only an inert distinction
consolidates. The lexicon is the **sole** Tier-1 consolidation. The rest of the rule
set is already at the right granularity — one concept per file — so for the rules,
"flatten" means the substitutions specifically, not a broad merge. Consolidation is
the exception, not the direction.

### Audit and reaffirmation (2026-07-22)

A deliberate duplication-and-fragmentation audit of every package — the hunt the
earlier cohesion pass had not done — surfaced apparent candidates that closer
reading made look real: the code/ruby `build` + `robustness` pair (the
strict-core/forgiving-perimeter core stated near-verbatim in both) and the DBE
`show-the-test` / `show-feature-test-output` pair (the feature-output rule a
near-superset). The two testing substitutions (`verified`, `protect`) also parallel
the lexicon.

On the user's judgment, all stay separate — each distinction does work:

- **build + robustness** touch two separate matters — the two construction paths
  (`build` normalizes, `new` is strict) versus where robustness lives (the general
  class-interface principle).
- **show-the-test pair** — one displays the test *implementation* (the test source,
  the cradle), the other the test *output*. Distinct matters.
- **testing substitutions** — distinct corrections, kept as their own files; a thin
  testing lexicon is optional and deferred.

So the substitution lexicon remains the **sole enacted consolidation**. The audit's
value was to confirm that: an apparent candidate merges only if its distinction is
truly inert, as the ten swaps were — and these are not.

### Step 3 — adopt the vocabulary.md model (language, testing)

Each package's terminology is gathered into a package `vocabulary.md` (a structural
file, prefix-exempt) with **Terms** and **Substitutions** sections — generalizing what
`design-by-efferent` already does. Enacted for two packages:

- `language/vocabulary.md`: Terms (a `solubility` gloss) + Substitutions (the general
  lexicon). `word-substitutions.md` folds in and is removed.
- `testing/vocabulary.md`: Terms (a `controls` gloss) + Substitutions (`verified`,
  `protect`). The two testing swap files fold in and are removed — the two-swap
  testing lexicon that had been optional, now done for cross-package consistency.
- `solubility` and `controls` **keep their standalone rules** — each is load-bearing
  (solubility a methodological principle, controls a hub with application guidance);
  the vocabulary glosses them and points to the rules rather than absorbing them.
  (solubility was briefly folded in, then restored on the note that it is a deeper
  methodological issue than vocabulary — a term with a rule behind it, not a mere
  lexicon entry.)
- Conventions updated: `agent-file-names` generalizes the `vocabulary.md` exemption
  beyond interlocking-glossary packages; the language and testing READMEs point to
  their `vocabulary.md`, and the "language is not a glossary" framing is dropped.
- Deferred: `design-by-efferent` already embodies the model; the single-swap packages
  (`git`, `plan`) and `foundation` / `code/ruby` are not yet given a `vocabulary.md`.
- **`efferent` and `actuation` promoted to `language`.** They are general design
  vocabulary — more fundamental than DBE (which is *named* after `efferent` but does
  not own it). So, like `solubility`, their definitions and the `caller→efferent` /
  `the call→actuation` substitutions move to `language/vocabulary.md`; DBE's glossary
  glosses them, points to `language`, and keeps the DBE-specific specialization
  (actuation written before implementation, the first gate). DBE's own `## Substitutions`
  section — briefly created for these two — is removed, as they were its only swaps.
