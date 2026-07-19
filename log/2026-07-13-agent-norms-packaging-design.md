# Agent Norms — Packaging Design

**Status:** Built and published (2026-07-17). All seven packages are live as component repos on `master`; this doc is the design of record. Examples in `testing`/`code/ruby` use the neutral `Upload` domain.

## Goal

Turn the agent directives currently living in the `constant` project into general-purpose, reusable **packages** that other projects can install. Some projects will use one or two packages, some will use all of them. Consolidate overlapping rules where possible, and keep the packages **live** — a rule refined while working in a consuming project must have a path back to the canonical package.

## Settled decisions

**The package is the unit of reuse.** A project depends on whole packages, never on individual files inside one. You turn a package on or off per project; you do not cherry-pick a single rule out of a package.

**Consolidate within a package; subset by package.** Because nobody takes a partial slice of a package, merging rules that are truly one idea (a single `substitutes` table, the "controls" rules, the hinge-presentation rules) costs nothing in reuse. The only boundary that must stay granular is the package boundary itself. Corollary: if you ever find yourself wanting half a package, that is the signal to split the package — not to leave its files unmerged.

**Distribution: one canonical git repo, pulled into each project with `git subtree`.** The whole system depends on rules being real files under `agent/rules/` that are read at session start and committed alongside code. `git subtree` preserves exactly that — the files physically live in each consuming project — while `git subtree pull` / `git subtree push` syncs them to this canonical repo. A refinement made mid-project is promoted back with a push, so it reaches every project. Submodules leave a pointer instead of files (breaking "read every file at session start"); symlinks do not survive a clone; a plain copy loses the push-back. Subtree is the only option that keeps files-in-repo *and* bidirectional live.

This "Agent Norms" folder is the canonical repo.

## Package types

Seven package types (plus `eventide`, held in reserve). Each rule has a type, and that type places it in one package — classifying a rule discovers its package rather than assigning it one. Commands are filed by the domain they report on, not gathered into a `commands` package: a project that adopts a domain's conventions wants that domain's commands, and a standalone `commands` package would fail the "never want half a package" test (a testing-only project would want the testing commands but not the ruby/foundation ones). `foundation` underlies everything; `language` underlies the method and testing packages.

- **foundation** — the `agent/` artifact framework itself: the `rules/observations/deferred/log` directories and how to work with them, the one-line decision-log format, and the ISO-8601-UTC filename convention. (The `loops/` directory is *not* here — a "loop" is a DBE concept, so `design-by-efferent` contributes it.) Commands over framework state: `next-deferred-item` (list `agent/deferred/` and prompt) and `status-report` (a whole-project summary of plans + deferred + log + `agent/` map + suite line; convention-aware of `testing`, so its suite section degrades if a project hasn't adopted the testing conventions). Also carries the `rules-install-a-mindset` meta-rule (folder = surface, not purpose). Everything depends on this. (The `AGENTS.md` framework prose was built into four convention rules — `agent-rules`/`observations`/`deferred-convention` and `decision-log-convention` — plus the `agent-file-names-use-iso8601-utc-prefix` rule.)

- **language** — how language is used, precisely: the governing `language-is-precise-here` premise, the `name-literally` and `no-slang` principle rules beneath it, plus one rule per general phrasing substitution including `say-obsolete-not-dead` (see Consolidations — no `substitutes` table). (Renamed from `vocabulary`: the package governs language use, not a word list; a glossary of interlocking terms is a `vocabulary.md`, which DBE carries.) Holds only substitutions that are *not* specific to the design method or the test framework. Also holds general **terms-with-meanings** that are not method-specific — notably **solubility** (how readily a unit dissolves into use: usable, transparent, as simple as it should be), a general design-quality concept the DBE lexicon references rather than owns.

- **design-by-efferent** — the human-in-the-loop, efferent-first design method (directory: `design-by-efferent`; **DBE** in prose): hinges and gates, the actuation-first cycle, one-outcome-at-a-time, no green-on-arrival, coverage-protects-vs-design, prompting every choice through the selection UI, and the method's own **vocabulary** (loop, hinge, gate, deliberation, mechanical, subtle, cradle, efferent, actuation, observation, load-bearing, mean-bias, origination) — where **observation** names hinge 2 (the act of reading the outcome; an *assertion* is the mechanism that implements it, not the thing itself). **solubility** is a general design-quality term that lives in `language`, not owned here; the DBE glossary carries only a cross-reference pointer to it. Contributes the `loops/` artifact directory: the loop-record format (`loop-records`) and the auto-recording of design dialogue (`auto-record-design-dialogue`). Includes `foundation`, `language`, and `testing` (DBE is test-driven design and uses testing terms like controls, verified, and protect).

- **testing** — controls-based test-writing conventions (not tied to the TestBench API): the `control_` variable prefix, actuate-once / assert-in-nested-context structure, context nesting mirrors folders, test naming ("Is", predicate context, single-case-for-feature), assertion-only blocks, error-test naming ("Fails" / "Doesn't fail", the condition promoted to a context), control string values. Commands over the suite: `test-report` (classify the suite along general lenses and print it) and `test-tree` (print the de-duped two-level context tree). Includes `language`. (Reserve the name `testbench` for genuinely TestBench-API-specific rules, of which there are currently none.)

- **code/ruby** — prescriptive Ruby style (installed from an Eventide resource, so its provenance is understood without naming it in the package): name methods for the action with no prepositions, bind call results to explaining variables rather than inlining, default optional params to nil in the signature and assign real defaults in the body, tight `=` on positional defaults, domain mixin before infrastructure mixin, the `build`-normalizes / `new`-is-strict constructor design, and `robustness-lives-at-the-class-interface` (liberal-accept / uniform-return is a property of the class interface, never the strict instance core). Command over the source: `lib-report` (classify the library by Ruby construct, layer, and API currency — parallel to `test-report` over the suite). Includes `language` (for prose terms). (`code/` is a namespace grouping by programming language, not a package — future `code/sh`, `code/sql` are separate packages, since a project wants only the languages it uses. See the half-a-package note.)

- **git** — commit conventions: no Claude co-author trailer, run the suite before considering a commit, state the fact ("Task 9 is done") rather than "mark done," and subject-first commit messages (the subject of the change leads, in passive voice and indicative mood — about the code, not the developer).

- **eventide** — reserved for genuinely Eventide-specific material. Empty for now (the constructor design lives in `code/ruby` as prescriptive Ruby, not here).

- **docs** — documentation conventions: implementation plans contain no code samples; a package-dependency section is titled "Package Dependency."

Commands generalize because their axes are general *lenses* that recompute from the current project's files — only the example buckets were `constant`-specific. Each is filed above with the domain it reports on rather than in a `commands` package.

### Dependency graph

```
foundation ──► (everything below)

language ──► testing
language ──► code/ruby
language, testing ──► design-by-efferent

git      (standalone)
docs     (standalone)
eventide (reserved; would depend on code/ruby)
```

## Consolidations to perform (within a package type)

**One rule per substitute (no `substitutes` table).** (Revised 2026-07-16.) The "retired term → substitute" mapping is scattered across the TDD-lexicon rule's "Retired terms" section, the no-slang-mediates bundle, and roughly eight standalone "say X not Y" files. Rather than collapse these into a `substitutes` table per package, **each substitution stays its own rule file** — consistent with the one-rule-per-file convention and with `rules-install-a-mindset` (terminology rules are the purest stance-installing rules; a table would demote each from a rule to a row and drop its own `Why` and dating). Substitutions still follow the domain they serve — general phrasing (normal-path/happy-path, arm/scenario, cut/increment, sweep/conform, install/vendor, convey/thread, sent-to, wrap/mediates) in `language` alongside the `name-literally` and `no-slang` principle rules; controls/verified/protect in `testing`; the DBE **vocabulary** glossary (efferent, actuation, hinge, gate — terms *with meanings*, a cohesive lexicon rather than say-X-not-Y substitutions) stays in DBE. `constant`-specific terms (literal-constant) go to `local/`. (wrap→mediates is *not* `constant`-specific — "mediates" is a universal verb; only its example is genericized.) This changes **M3** from "build a substitutes table" to "relocate/split each substitution into its own rule"; the redundant-rule merges (M1 controls trio, M2 hinge trio) are unaffected.

**The "controls" rules → one (language or testing).** `controls-not-factories`, `controls-not-fixtures`, and `say-control-not-arrange` all say the same thing; the third already re-covers "fixtures." Merge to one rule: *controls — never factories, fixtures, or "arrange."*

**The hinge-presentation rules → one (DBE).** `actuation-hinge-shows-contexts`, `assertion-hinge-shows-actuation`, and `controls-hinge-shows-actuation` each state "at hinge N, show X" and cross-reference each other constantly. Merge into one "what each hinge displays" table, companion to the hinge-cycle rule.

**Close out stale supersessions.** Fold each corrected rule into its corrector and retire the stale text: "mediates for" → "mediates" (patch the no-prepositions example, retire the mediates-for log reference); `hinge-choices-via-AskUserQuestion` into the broader `present-every-prompt` rule that already says it generalizes it; `actuation-not-call` and `efferent-not-caller` into the DBE vocabulary that already defines both; the `assert_raises` naming stays its own rule (2026-07-17: an error test is named "Fails" / "Doesn't fail", condition promoted to a context — the earlier plan to fold it into the "Is"-naming rule is reversed, since "Fails" doesn't clash with "Is").

## Stays project-local (`local/`)

Project-specific rules live under a `local/` directory that mirrors the package-type categories and is **never pulled or pushed by subtree**, so a `constant`-only rule can't leak upstream. These are `constant`-specific:

- `local/language/` — the "literal constant" terminology.
- `local/testing/` — the namespace-variable-suffix rule (reserves "constant" for `Constant` instances).
- `local/code/ruby/` — the string-outputs/permissive-inputs rule (about constant names) and the intra-`Constant`-family `new` privilege half of the constructor rule.

The five commands are **not** local. They generalize — their axes are general lenses and only the example buckets were `constant`-specific — so each is filed in the domain it reports on (`test-report`/`test-tree` → `testing`, `lib-report` → `code/ruby`, `status-report`/`next-deferred-item` → `foundation`). The report specs are rewritten to state the lenses generically and derive buckets from the current project's files.

## Consuming-project workflow (git subtree)

**Repos.** Each package is its own git repo on a shared account, named with the `agent-norms-` prefix: `agent-norms-foundation`, `agent-norms-language`, `agent-norms-design-by-efferent`, `agent-norms-testing`, `agent-norms-code-ruby` (future `agent-norms-code-sh`, `agent-norms-code-sql`), `agent-norms-git`, `agent-norms-docs`, and `agent-norms-eventide` (reserved). The `code/` namespace flattens to `code-` in the repo name, while the subtree *prefix* keeps the real path (`agent/rules/code/ruby`). `local/` packages get no repo — they never leave their project.

A project pulls the packages it needs into its own `agent/rules/` tree. Sketch of the operations (for `agent-norms-testing`):

- **Add a package:** `git subtree add --prefix agent/rules/testing agent-norms-testing master --squash`
- **Update from canonical:** `git subtree pull --prefix agent/rules/testing agent-norms-testing master --squash`
- **Promote a local refinement back:** `git subtree push --prefix agent/rules/testing agent-norms-testing master`

Because the files are physically present and committed in the project, the session-start "read every file in `agent/rules/`" behavior works unchanged. A package that has dependencies carries an `install-dependencies.sh` that `subtree`-adds (and refreshes) each included package (e.g. `design-by-efferent` needs `foundation`, `language`, `testing`), so one run installs the full set; the composite carries `install-all.sh`. (See the settled decision below — the earlier one-line `include:` manifest was dropped once the install scripts made it redundant.)

## Settled decisions (design questions resolved)

- **Composite repo authoring, split distribution.** The canonical "Agent Norms" repo is the single source of truth, holding every package as a top-level directory with its own full history. Each `agent-norms-*` component repo is a *regenerated one-package view*, produced by `git subtree split --prefix=<package>` and pushed to its own repo in the org. Sync is one-directional (composite repo → component repo), deterministic and incremental. You commit in the composite repo; a release is "re-split the changed packages and push." Chosen over authoring each component repo separately because the packages are tightly interrelated and the migration is heavily cross-package, so atomic cross-package commits and one place to read/grep/consolidate are worth the split step.
- **Substitutions are one rule per file (no `substitutes.md` table).** A package with a cohesive glossary of terms-with-meanings (the DBE lexicon) may carry a `vocabulary.md`; say-X-not-Y substitutions do not tabulate — each is its own rule.
- **Dependencies are installed by a script, not declared in a manifest.** `git subtree` is manual — there's no dependency resolver to feed — so a package that has dependencies carries an `install-dependencies.sh` at its root that `subtree`-adds (and refreshes) each included package into the consuming project; a standalone package carries none. The full graph also lives in this doc, and the composite carries an `install-all.sh`. (Earlier a one-line `include:` in a `package.md` file declared the set; that manifest was dropped once the install scripts made it redundant — 2026-07-18.)
- **`auto-record-design-dialogue` and `loop-records` are both `design-by-efferent`,** which also contributes the `loops/` artifact directory (foundation keeps only `rules/observations/deferred/log`).
- **Term placement follows the domain a term serves:** controls/fixtures, verified/green, protect/guard → `testing`; normal-path/happy-path → `language`. Cross-cutting substitutions with no home domain (arm/scenario, cut/increment, sweep/conform, install/vendor, convey/thread, sent-to) stay in `language`.
- **A package's own decision log carries only rule-content decisions.** A `<package>/log/` directory travels with the package when a project installs it (placed at `agent/rules/<package>/log/`), so it holds only what is useful *provenance to a consumer*: genuine design decisions about that package's rule content. **Migration, packaging, and authoring history is kept undistributed** — it lives in the composite repo's top-level `agent/log/`, which is never split or pushed. So decisions like the dependency-install-script convention, composite/component naming, per-package-log placement, the ISO-prefix exemption, and each package's build/relocation are composite-log entries, not shipped to consumers. This is also distinct from the *project* decision log (the `foundation` convention: a consuming project's own `agent/log/` for its own decisions). A package log starts empty and gains an entry only when a real design choice is made about that package's rules.

## Status — done

All four original steps are complete: the classification table was built, the composite repo laid out, every package migrated/consolidated with per-consolidation decision-log entries, and the subtree workflow proved by pulling each package. All seven packages are published to their `agent-norms-*` component repos (`master`), and the composite repo is backed up at `eventide-project/agent-norms`. The formerly on-hold supertype-as-factory-of-subtypes sub-point of `code/ruby`'s build-constructor rule is done (2026-07-17), illustrated with the `Upload::Result` family (`Success` / `Rejected`); no work remains.
