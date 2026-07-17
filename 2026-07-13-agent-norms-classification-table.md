# Agent Norms — Classification Table

Companion to the packaging design. Every current rule in `constant`'s `agent/rules/` (plus the `AGENTS.md` framework prose) pinned to a package, with merges and `local/` flagged. Ordered by current folder so nothing is missed; a per-package tally follows.

**Merge legend:** **M1** controls trio → one rule (testing) · **M2** hinge-presentation trio → one rule (DBE) · **M3** ~~`substitutes` table~~ → **one rule per substitute, no table** (revised 2026-07-16; each substitution relocates/splits into its own rule file — see the packaging design); DBE keeps its cohesive **vocabulary** glossary · **M4** stale supersessions closed out.

## `AGENTS.md` (framework prose)

| Content | Package | Merge | Notes |
|---|---|---|---|
| `rules/observations/deferred/log` framework, decision-log format, artifact conventions | foundation | — | the `loops/` portion goes to DBE, not foundation |

## `code/`

| Rule | Package | Merge | Notes |
|---|---|---|---|
| string-outputs-permissive-inputs | **local/code/ruby** | — | `constant`-specific (constant names) |
| no-prepositions-in-method-names | code/ruby | M4 | patch the "mediates for" → "mediates" example |
| no-inline-method-call-arguments | code/ruby | — | |
| optional-params-default-in-body | code/ruby | — | |
| positional-default-no-spaces | code/ruby | — | |
| include-domain-mixin-before-infrastructure | code/ruby | — | |
| build-constructor-normalizes-new-is-strict | code/ruby | — | general build/new → code/ruby; the intra-`Constant`-family `new` privilege half → **local/code/ruby** |

## `commands/`

| Rule | Package | Merge | Notes |
|---|---|---|---|
| status-report-format | foundation | — | generalize axes; drop the "memory retired" note; convention-aware of testing |
| test-report-format | testing | — | generalize axes; drop `constant` buckets |
| lib-report-format | code/ruby | — | generalize axes; parallel to test-report |
| test-tree-command | testing | — | |
| next-deferred-item-command | foundation | — | operates on `agent/deferred/` |

## `docs/`

| Rule | Package | Merge | Notes |
|---|---|---|---|
| plans-no-code-samples | docs | — | |
| package-dependency-heading | docs | — | |

## `git/`

| Rule | Package | Merge | Notes |
|---|---|---|---|
| no-claude-coauthor | git | — | |
| run-suite-before-commit | git | — | |
| commit-says-task-is-done-not-mark-done | git | — | |

## `methodology/`

| Rule | Package | Merge | Notes |
|---|---|---|---|
| tdd-as-design-tool | design-by-efferent | — | |
| tdd-first-turn-test-file | design-by-efferent | — | |
| tdd-human-in-the-loop | design-by-efferent | — | |
| actuation-gate-options-or-chat | design-by-efferent | — | |
| one-outcome-at-a-time-name-via-options | design-by-efferent | — | |
| show-the-test-after-implementing | design-by-efferent | — | |
| hinge-cycle | design-by-efferent | — | |
| no-green-on-arrival-tests | design-by-efferent | — | |
| controls-hinge-shows-actuation | design-by-efferent | M2 | hinge-presentation trio → one |
| assertion-hinge-shows-actuation | design-by-efferent | M2 | hinge-presentation trio → one |
| actuation-hinge-shows-contexts | design-by-efferent | M2 | hinge-presentation trio → one |
| never-ask-to-start-test-first | design-by-efferent | — | |
| hinge-choices-numbered-list | design-by-efferent | M4 | fold into present-every-prompt (already generalizes it) |
| show-feature-test-output-after-implementation-hinge | design-by-efferent | — | |
| tdd-designs-coverage-protects-never-break-implementation | design-by-efferent | — | stays DBE (settled) |
| hinges-gate-the-design-of-a-test-including-coverage | design-by-efferent | — | |
| present-every-prompt-through-askuserquestion | design-by-efferent | M4 | absorbs hinge-choices |
| first-implementation-may-run-a-contained-red-green-loop | design-by-efferent | — | |
| assert-error-message-only-as-sole-discriminator | **testing** | — | general testing rule, not DBE |
| do-not-test-the-platform | **testing** | — | general testing rule, not DBE |
| subject-first-commit-messages | **git** | — | commit-message convention; belongs with the other `git/` commit rules (mis-filed under `methodology/` at source — a live case of rules-install-a-mindset) |
| rules-install-a-mindset-purpose-over-category | **foundation** | — | meta-rule about the rule system itself (folder = surface, not purpose) |

## `process/`

| Rule | Package | Merge | Notes |
|---|---|---|---|
| auto-record-tdd-dialogue | design-by-efferent | — | settled |
| loop-records | design-by-efferent | — | contributes the `loops/` directory |
| agent-file-names-use-iso8601-utc-prefix | foundation | — | |

## `terminology/`

| Rule | Package | Merge | Notes |
|---|---|---|---|
| name-literally-not-by-analogy | vocabulary | — | stays its own rule (the governing principle) |
| sent-to-phrasing | vocabulary | M3 | vocabulary `substitutes` table |
| normal-path-not-happy-path | vocabulary | M3 | vocabulary table |
| say-install-packages-not-vendor | vocabulary | M3 | vocabulary table |
| say-convey-not-thread | vocabulary | M3 | vocabulary table |
| terminology-no-slang-mediates | vocabulary | M3 | all rows → vocabulary table (incl. wrap→mediates, a universal verb); only the `Constant`-mediates-a-module *example* is genericized |
| literal-constants-terminology | **local/vocabulary** | — | `constant`-specific |
| controls-not-factories | testing | M1, M3 | controls trio → one rule; testing table |
| controls-not-fixtures | testing | M1, M3 | controls trio → one rule |
| say-control-not-arrange | testing | M1, M3 | controls trio → one rule |
| say-verified-not-green | testing | M3 | testing table |
| say-protect-not-guard-for-a-test | testing | M3 | testing table |
| tdd-efferent-not-caller | design-by-efferent | M3, M4 | into DBE vocabulary |
| actuation-not-call | design-by-efferent | M3, M4 | into DBE vocabulary (amends efferent-not-caller) |
| design-by-efferent | design-by-efferent | M3 | **is** the methodology's name (retires/replaces the former `say-efferent-oriented-design-not-development` rule, removed on disk); into DBE vocabulary |
| tdd-lexicon | design-by-efferent | M3 | **is** the DBE vocabulary; its general "Retired terms" rows split to the `vocabulary` package's `substitutes` |

## `test-writing/`

| Rule | Package | Merge | Notes |
|---|---|---|---|
| control-prefix-test-vars | testing | — | |
| tdd-test-structure | testing | — | |
| test-name-is-prefix | testing | M4 | absorbs the assert_raises "Is an error" exception |
| test-context-nesting-mirrors-folders | testing | — | |
| single-case-test-named-for-feature | testing | — | |
| test-block-is-assertion-only | testing | — | |
| predicate-context-name | testing | — | |
| control-string-value-starts-with-some | testing | — | |
| context-only-for-local-instrumentation | testing | — | |
| assert-raises-test-named-is-an-error | testing | M4 | fold into test-name-is-prefix as its stated exception |
| namespace-variable-suffix | **local/testing** | — | `constant`-specific (reserves "constant" for `Constant` instances) |

## Per-package tally

- **foundation** — status-report, next-deferred-item, agent-file-names-iso8601, rules-install-a-mindset (meta-rule), + the `AGENTS.md` framework prose (`rules/observations/deferred/log`).
- **vocabulary** — the name-literally and no-slang principle rules + one rule per substitute (sent-to, normal-path, install/vendor, convey/thread, wrap/mediates, sweep/conform, land/plain, arm/scenario, cut/increment). No table.
- **design-by-efferent** — the methodology rules (incl. the M2 hinge-presentation merge and the M4 present-every-prompt merge), auto-record-tdd-dialogue, loop-records, the `loops/` directory, and the DBE **vocabulary** (tdd-lexicon + efferent/actuation/design-by-efferent). Includes foundation, vocabulary, testing.
- **testing** — the test-writing rules, test-report, test-tree, do-not-test-the-platform, assert-error-message, and one rule per substitute (the merged controls rule [M1], verified, protect). No table.
- **code/ruby** — the Ruby code-style rules, build/new, lib-report. (`code/` is a language-grouping namespace; future `code/sh`, `code/sql` are separate packages.)
- **git** — the four commit rules (no-claude-coauthor, run-suite-before-commit, commit-says-task-is-done, subject-first-commit-messages).
- **docs** — the two documentation rules.
- **local/** — `local/code/ruby/` (string-outputs, intra-`Constant` `new` privilege), `local/vocabulary/` (literal-constant), `local/testing/` (namespace-variable-suffix).
- **eventide** — reserved, empty.

## Coverage

69 rule files + the `AGENTS.md` framework prose, every one accounted for above. Merges collapse the two redundant trios (controls, hinge-presentation) to one rule each; the terminology substitutions relocate/split into one rule per substitute (no tables), leaving the DBE vocabulary glossary and the `local/` entries in place; the remaining ~50 rules relocate unchanged.
