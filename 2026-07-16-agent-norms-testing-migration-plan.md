# Agent Norms — Migration Plan: `testing` package

Execution plan for the fourth migration increment — the `testing` package: controls-based test-writing conventions. Companion to the packaging design and classification table. Same Phase A → Phase B shape.

**Working norm:** this plan is not permission to execute. Present and wait for explicit go-ahead before creating files or publishing.

## Scope

`testing` holds the controls-based test-writing conventions (not tied to a specific test-framework API). It `include: foundation, vocabulary` and is included by `design-by-efferent`, so it comes before DBE.

It is the first increment to exercise the **M1 redundant-rule merge** (the controls trio), and it carries an **M4 fold** (the `assert_raises` naming into the "Is"-naming rule) plus **command generalization** (`test-report`, `test-tree`).

## Contents (composite repo)

**Test-writing rules — relocate (Constant examples flagged for a later generalization pass):**
- `control-prefix-test-vars`
- `tdd-test-structure`
- `test-context-nesting-mirrors-folders`
- `single-case-test-named-for-feature`
- `test-block-is-assertion-only`
- `predicate-context-name`
- `control-string-value-starts-with-some`
- `context-only-for-local-instrumentation`
- `test-name-is-prefix` — relocate **with the M4 fold**: absorb the `assert_raises` "Is an error" naming as its stated exception (the condition promoted to a `context`, the test named "Is an error"). `assert-raises-test-named-is-an-error` does **not** become its own file.

**What-to-test rules — relocate (from `methodology/`):**
- `assert-error-message-only-as-sole-discriminator`
- `do-not-test-the-platform`

**Substitution rules (testing domain — one rule per substitute):**
- **controls — never factories, fixtures, or "arrange"** — NEW, the **M1** merge of `controls-not-factories` + `controls-not-fixtures` + `say-control-not-arrange` (three redundant rules, same replacement "controls"). One rule covering all three retired terms and the three angles they cover (the helpers, the example values, and the pre-actuation setup phase).
- `say-verified-not-green` (verified, not green) — relocate.
- `say-protect-not-guard-for-a-test` (protect, not guard) — relocate.

**Commands — relocate and generalize:**
- `test-report-format` — generalize: keep the classification *lenses*, drop the `Constant`/`Import`/`Define` example buckets (recompute from the project's files).
- `test-tree-command` — generalize: describe the command (run the suite, print a normalized de-duped context tree) generically; the `constant`-specific durable script (`test/automated/tree.rb`) is an implementation example, not part of the general rule.

**Package files:** `package.md` (`include: foundation, vocabulary`) and an informative `README.md`.

## Dependency declaration

`testing`'s `package.md` lists the **full set** it needs — `include: foundation, vocabulary` — following the design's convenience convention (a puller adds exactly the listed packages; cf. the DBE example listing all of foundation, vocabulary, testing). `foundation` is listed even though it also arrives via `vocabulary`.

## Not migrated — stays `constant`-local

- `namespace-variable-suffix` → `local/testing` — reserves "constant" for `Constant` instances and encodes the module/name/`Constant` suffix forms; entirely `Constant`-domain. Stays in `constant`, `local/`-side, out of scope for this increment.

## Generalization concerns (flagged, not blocking)

- Several test-writing rules use `Constant` examples (`Constant::Define`, `control_module`, etc.). Relocated as-is; genericizing the examples is a later pass (same posture as git's hardcoded `ruby test/automated.rb`).
- `test-report`/`test-tree` assume a `context`/`test` nesting structure (TestBench-shaped). The design reserves the name `testbench` for genuinely API-specific rules (none yet) and treats these as general enough; worth confirming they don't need a TestBench caveat.

## Where the M1 merge and M4 fold are logged

Both are **migration/authoring** events → composite top-level `agent/log/` (one entry each, or one combined), not `testing/log/`. `testing/log/` starts empty.

## Phase A — Local

1. Create `testing/` in the composite repo.
2. Relocate the eight test-writing rules (with `test-name-is-prefix` taking the M4 fold).
3. Relocate the two what-to-test rules from `methodology/`.
4. Author the **M1** merged controls rule; relocate `verified` and `protect`.
5. Relocate and generalize `test-report` and `test-tree`.
6. `package.md` (`include: foundation, vocabulary`) + `README.md`.
7. Commit; add the M1/M4 decision entries to the composite `agent/log/`.

## Phase B — Distribution

Create `eventide-project/agent-norms-testing` (public), `git subtree split --prefix=testing`, push to `main`, prove the pull.

## Open questions

1. **M1 merged controls rule** — confirm the single rule should cover all three angles the trio spans (the control *helpers*, the example *values*, and the pre-actuation *setup phase*), retiring factories/fixtures/arrange together.
2. **`test-tree` generalization** — describe the command generically and treat the `constant` `tree.rb` script as an example (recommended), vs. hold `test-tree` for a later pass since it leans hardest on a project-specific script.
3. **TestBench-shape of the commands** — accept `test-report`/`test-tree` as general (recommended, per the design's "no testbench rules yet"), or add a note that they assume a context/test structure.

## Not done without explicit go-ahead

Any file create, and all of Phase B.
