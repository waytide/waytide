# Agent Norms — Packaging Design

**Status:** Design. Architecture settled; per-rule placement of a few terms is still open (flagged below).

## Goal

Turn the agent directives currently living in the `constant` project into general-purpose, reusable **packages** that other projects can install. Some projects will use one or two packages, some will use all of them. Consolidate overlapping rules where possible, and keep the packages **live** — a rule refined while working in a consuming project must have a path back to the canonical package.

## Settled decisions

**The package is the unit of reuse.** A project depends on whole packages, never on individual files inside one. You turn a package on or off per project; you do not cherry-pick a single rule out of a package.

**Consolidate within a package; subset by package.** Because nobody takes a partial slice of a package, merging rules that are truly one idea (a single `substitutes` table, the "controls" rules, the hinge-presentation rules) costs nothing in reuse. The only boundary that must stay granular is the package boundary itself. Corollary: if you ever find yourself wanting half a package, that is the signal to split the package — not to leave its files unmerged.

**Distribution: one canonical git repo, pulled into each project with `git subtree`.** The whole system depends on rules being real files under `agent/rules/` that are read at session start and committed alongside code. `git subtree` preserves exactly that — the files physically live in each consuming project — while `git subtree pull` / `git subtree push` syncs them to this canonical repo. A refinement made mid-project is promoted back with a push, so it reaches every project. Submodules leave a pointer instead of files (breaking "read every file at session start"); symlinks do not survive a clone; a plain copy loses the push-back. Subtree is the only option that keeps files-in-repo *and* bidirectional live.

This "Agent Norms" folder is the canonical repo.

## Package types

Seven package types (plus `eventide`, held in reserve). Each rule has a type, and that type places it in one package — classifying a rule discovers its package rather than assigning it one. Commands are filed by the domain they report on, not gathered into a `commands` package: a project that adopts a domain's conventions wants that domain's commands, and a standalone `commands` package would fail the "never want half a package" test (a testing-only project would want the testing commands but not the ruby/foundation ones). `foundation` underlies everything; `vocabulary` underlies the method and testing packages.

- **foundation** — the `agent/` artifact framework itself: the `rules/observations/deferred/log` directories and how to work with them, the one-line decision-log format, and the ISO-8601-UTC filename convention. (The `loops/` directory is *not* here — a "loop" is a DBE concept, so `design-by-efferent` contributes it.) Commands over framework state: `next-deferred-item` (list `agent/deferred/` and prompt) and `status-report` (a whole-project summary of plans + deferred + log + `agent/` map + suite line; convention-aware of `testing`, so its suite section degrades if a project hasn't adopted the testing conventions). Everything depends on this. (Today this lives mostly as prose in `AGENTS.md` plus the `process/` rules.)

- **vocabulary** — the cross-cutting phrasing discipline: name concepts literally (no analogies, codes, or jargon), no slang, and the single canonical **`substitutes`** table (see Consolidations). Holds only substitutions that are *not* specific to the design method or the test framework.

- **design-by-efferent** — the human-in-the-loop, efferent-oriented design method (directory: `design-by-efferent`; **DBE** in prose): hinges and gates, the actuation-first cycle, one-outcome-at-a-time, no green-on-arrival, coverage-protects-vs-design, prompting every choice through the selection UI, and the method's own **vocabulary** (loop, hinge, gate, cradle, efferent, actuation, solubility, subtle, load-bearing, mechanical). Contributes the `loops/` artifact directory: the loop-record format (`loop-records`) and the auto-recording of design dialogue (`auto-record-tdd-dialogue`). Includes `foundation`, `vocabulary`, and `testing` (DBE is test-driven design and uses testing terms like controls, verified, and protect).

- **testing** — controls-based test-writing conventions (not tied to the TestBench API): the `control_` variable prefix, actuate-once / assert-in-nested-context structure, context nesting mirrors folders, test naming ("Is", predicate context, single-case-for-feature), assertion-only blocks, `assert_raises` naming, control string values. Commands over the suite: `test-report` (classify the suite along general lenses and print it) and `test-tree` (print the de-duped two-level context tree). Includes `vocabulary`. (Reserve the name `testbench` for genuinely TestBench-API-specific rules, of which there are currently none.)

- **code/ruby** — prescriptive Ruby style (installed from an Eventide resource, so its provenance is understood without naming it in the package): name methods for the action with no prepositions, bind call results to explaining variables rather than inlining, default optional params to nil in the signature and assign real defaults in the body, tight `=` on positional defaults, domain mixin before infrastructure mixin, and the `build`-normalizes / `new`-is-strict constructor design. Command over the source: `lib-report` (classify the library by Ruby construct, layer, and API currency — parallel to `test-report` over the suite). Includes `vocabulary` (for prose terms). (`code/` is a language-grouping namespace, not a package — future `code/sh`, `code/sql` are separate packages, since a project wants only the languages it uses. See the half-a-package note.)

- **git** — commit conventions: no Claude co-author trailer, run the suite before considering a commit, state the fact ("Task 9 is done") rather than "mark done."

- **eventide** — reserved for genuinely Eventide-specific material. Empty for now (the constructor design lives in `code/ruby` as prescriptive Ruby, not here).

- **docs** — documentation conventions: implementation plans contain no code samples; a package-dependency section is titled "Package Dependency."

Commands generalize because their axes are general *lenses* that recompute from the current project's files — only the example buckets were `constant`-specific. Each is filed above with the domain it reports on rather than in a `commands` package.

### Dependency graph

```
foundation ──► (everything below)

vocabulary ──► testing
vocabulary ──► code/ruby
vocabulary, testing ──► design-by-efferent

git      (standalone)
docs     (standalone)
eventide (reserved; would depend on code/ruby)
```

## Consolidations to perform (within a package type)

**Per-package `substitutes` tables.** Today the "retired term → substitute" mapping is scattered across three homes: the TDD-lexicon rule's "Retired terms" section, the no-slang-mediates table, and roughly eight standalone "say X not Y" files. Consolidate — but into one `substitutes` table *per package*, not a single master table, since terms follow the domain they serve: the `vocabulary` package's `substitutes` (name-literally, no-slang, normal-path/happy-path, arm/scenario, cut/increment, sweep/conform, install/vendor, convey/thread, sent-to), the `testing` package's `substitutes` (controls/fixtures, verified/green, protect/guard), and the DBE **vocabulary** (efferent, actuation, hinge, gate, etc. — terms with meanings, distinct from a `substitutes` say-X-not-Y table). `constant`-specific terms (mediates, literal-constant) go to `local/`.

**The "controls" rules → one (vocabulary or testing).** `controls-not-factories`, `controls-not-fixtures`, and `say-control-not-arrange` all say the same thing; the third already re-covers "fixtures." Merge to one rule: *controls — never factories, fixtures, or "arrange."*

**The hinge-presentation rules → one (DBE).** `actuation-hinge-shows-contexts`, `assertion-hinge-shows-actuation`, and `controls-hinge-shows-actuation` each state "at hinge N, show X" and cross-reference each other constantly. Merge into one "what each hinge displays" table, companion to the hinge-cycle rule.

**Close out stale supersessions.** Fold each corrected rule into its corrector and retire the stale text: "mediates for" → "mediates" (patch the no-prepositions example, retire the mediates-for log reference); `hinge-choices-via-AskUserQuestion` into the broader `present-every-prompt` rule that already says it generalizes it; `actuation-not-call` and `efferent-not-caller` into the DBE vocabulary that already defines both; the `assert_raises` "Is an error" naming into the "Is"-naming rule as its stated exception.

## Stays project-local (`local/`)

Project-specific rules live under a `local/` directory that mirrors the package-type categories and is **never pulled or pushed by subtree**, so a `constant`-only rule can't leak upstream. These are `constant`-specific:

- `local/vocabulary/` — the "literal constant" terminology.
- `local/testing/` — the namespace-variable-suffix rule (reserves "constant" for `Constant` instances).
- `local/code/ruby/` — the string-outputs/permissive-inputs rule (about constant names) and the intra-`Constant`-family `new` privilege half of the constructor rule.

The five commands are **not** local. They generalize — their axes are general lenses and only the example buckets were `constant`-specific — so each is filed in the domain it reports on (`test-report`/`test-tree` → `testing`, `lib-report` → `code/ruby`, `status-report`/`next-deferred-item` → `foundation`). The report specs are rewritten to state the lenses generically and derive buckets from the current project's files.

## Consuming-project workflow (git subtree)

**Repos.** Each package is its own git repo on a shared account, named with the `agent-norms-` prefix: `agent-norms-foundation`, `agent-norms-vocabulary`, `agent-norms-design-by-efferent`, `agent-norms-testing`, `agent-norms-code-ruby` (future `agent-norms-code-sh`, `agent-norms-code-sql`), `agent-norms-git`, `agent-norms-docs`, and `agent-norms-eventide` (reserved). The `code/` namespace flattens to `code-` in the repo name, while the subtree *prefix* keeps the real path (`agent/rules/code/ruby`). `local/` packages get no repo — they never leave their project.

A project pulls the packages it needs into its own `agent/rules/` tree. Sketch of the operations (for `agent-norms-testing`):

- **Add a package:** `git subtree add --prefix agent/rules/testing agent-norms-testing main --squash`
- **Update from canonical:** `git subtree pull --prefix agent/rules/testing agent-norms-testing main --squash`
- **Promote a local refinement back:** `git subtree push --prefix agent/rules/testing agent-norms-testing main`

Because the files are physically present and committed in the project, the session-start "read every file in `agent/rules/`" behavior works unchanged. Dependencies are declared per package (an `include: …` line, e.g. `design-by-efferent` needs `foundation`, `vocabulary`, `testing`) so a project knows the full set to add.

## Settled decisions (design questions resolved)

- **Composite repo authoring, split distribution.** The canonical "Agent Norms" repo is the single source of truth, holding every package as a top-level directory with its own full history. Each `agent-norms-*` component repo is a *regenerated one-package view*, produced by `git subtree split --prefix=<package>` and pushed to its own repo in the org. Sync is one-directional (composite repo → component repo), deterministic and incremental. You commit in the composite repo; a release is "re-split the changed packages and push." Chosen over authoring each component repo separately because the packages are tightly interrelated and the migration is heavily cross-package, so atomic cross-package commits and one place to read/grep/consolidate are worth the split step.
- **Filename convention for term artifacts:** each package carries `vocabulary.md` (its terms with meanings) and/or `substitutes.md` (its retired → substitute table), alongside its rules, so everything travels as one prefix.
- **No package-manifest format.** The directory *is* the package, and nothing would consume a manifest — `git subtree` is manual, so there's no dependency resolver to feed. Instead, each package directory carries a single `include: …` line in a `package.md` file (the package's mechanical declaration, kept separate from the informative `README.md`) so a puller knows the transitive set; the full graph also lives in this doc. Adding a formal manifest would be a convention nothing enforces.
- **`auto-record-tdd-dialogue` and `loop-records` are both `design-by-efferent`,** which also contributes the `loops/` artifact directory (foundation keeps only `rules/observations/deferred/log`).
- **Term placement follows the domain a term serves:** controls/fixtures, verified/green, protect/guard → `testing`; normal-path/happy-path → `vocabulary`. Cross-cutting substitutions with no home domain (arm/scenario, cut/increment, sweep/conform, install/vendor, convey/thread, sent-to) stay in `vocabulary`.

## Next steps

1. Build the classification table — every rule pinned to a package, merges marked, `local/` flagged.
2. Initialize this repo (`git init`) and lay out one directory per package plus the `local/` mirror.
3. Migrate and consolidate the rules per their classification, writing a decision-log entry for each consolidation in your ISO-8601-UTC format.
4. Prove the subtree workflow by pulling one package (e.g. `git`) into a test project.
