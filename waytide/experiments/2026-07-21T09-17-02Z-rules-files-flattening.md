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

_(recorded against the forecast, after the forecast is committed)_

## Findings

_(to be written)_

## Final state

_(to be declared: affirmed / refuted / inconclusive / abandoned / superseded / suspended)_
