# Agent Norms — Migration Plan: `design-by-efferent` package

Execution plan for the sixth and final package increment — `design-by-efferent` (DBE): the human-in-the-loop, efferent-first design method. Companion to the packaging design and classification table. The largest increment: it carries **M2**, two **M4** folds, the **DBE vocabulary** consolidation, the **`loops/`** artifact directory, and the queued **solubility (b)** cross-package work.

**Working norm:** this plan is not permission to execute. Present and wait for explicit go-ahead before creating files, publishing, or re-publishing `vocabulary`.

## Scope

DBE is the methodology these rules describe — hinges and gates, the actuation-first cycle, coverage-vs-design, and the method's own lexicon. It `include: foundation, vocabulary, testing` (it is test-driven design and uses testing terms). It is the last package; nothing includes it.

## Contents (composite repo)

**Methodology rules — relocate (Constant examples + `TDD`/`tdd-` naming flagged; see conformance question):**
- `tdd-as-design-tool`, `tdd-first-turn-test-file`, `tdd-human-in-the-loop`
- `actuation-gate-options-or-chat`, `one-outcome-at-a-time-name-via-options`
- `show-the-test-after-implementing`, `show-feature-test-output-after-implementation-hinge`
- `hinge-cycle`, `no-green-on-arrival-tests`
- `never-ask-to-start-test-first`
- `tdd-designs-coverage-protects-never-break-implementation`, `hinges-gate-the-design-of-a-test-including-coverage`
- `first-implementation-may-run-a-contained-red-green-loop`
- `present-every-prompt-through-askuserquestion` — **absorbs** `hinge-choices-numbered-list` (M4).

**M2 merge — one new rule:**
- **"What each hinge displays"** — merge `actuation-hinge-shows-contexts` + `assertion-hinge-shows-actuation` + `controls-hinge-shows-actuation` into one rule (a table: at hinge N, show X), companion to `hinge-cycle`. The three each state "at hinge N, show X" and cross-reference each other constantly.

**M4 folds:**
- `hinge-choices-numbered-list` → into `present-every-prompt` (which already says it generalizes it). Not a separate file.
- `efferent-not-caller` + `actuation-not-call` → into the DBE vocabulary (the lexicon already defines both terms). Not separate files.

**The `loops/` artifact directory (DBE contributes it):**
- `loop-records` — the loop-record format and the `agent/loops/` directory convention.
- `auto-record-tdd-dialogue` — auto-recording substantive design dialogue.

**The DBE vocabulary (the lexicon):**
- `tdd-lexicon` becomes the DBE **`vocabulary.md`** — a cohesive glossary of terms-with-meanings (loop, hinge, gate, cradle, efferent, actuation, subtle, load-bearing, mechanical), the distributed-OODA framing, and the retired-terms note. It **absorbs** `efferent-not-caller` and `actuation-not-call` (M4) as the efferent/actuation entries, and **references the general `solubility` term** in `vocabulary` rather than defining it (solubility (b)).
- `design-by-efferent` — the methodology's name (retires "efferent-oriented design"). As the package README's subject and a `vocabulary.md` entry.

**Package files:** `package.md` (`include: foundation, vocabulary, testing`) and an informative `README.md`.

## solubility (b) — cross-package work

Per the (b) decision, enacted here:
1. Add a general **`solubility`** term to the **`vocabulary`** package (a `vocabulary.md` glossary entry, or a rule), and **re-split/push `vocabulary`**.
2. Repoint `vocabulary`'s `name-literally` reference (currently "the solubility criterion… TDD lexicon") to the local `solubility` term.
3. Have the DBE `vocabulary.md` lexicon **reference** `solubility` rather than define it.

This touches an already-published package (`vocabulary`), so it is a deliberate re-publish, logged.

## No `local/` for DBE

DBE has no `constant`-specific rules — the methodology is general. (The `local/` mirror is `vocabulary`/`testing`/`code-ruby` only, and stays `constant`-side.)

## Where the merges/folds are logged

M2, the M4 folds, the lexicon consolidation, and the solubility enactment are **migration/authoring** events → composite top-level `agent/log/`. Any genuine rule-content decision made about DBE's rules → `design-by-efferent/log/`.

## Phase A — Local

1. Create `design-by-efferent/` in the composite repo.
2. Relocate the ~13 methodology rules (with `present-every-prompt` absorbing `hinge-choices`).
3. Author the **M2** merged "what each hinge displays" rule.
4. Relocate `loop-records` and `auto-record-tdd-dialogue` (the `loops/` contribution).
5. Consolidate the DBE **`vocabulary.md`** (lexicon + efferent/actuation + name; reference solubility).
6. Enact **solubility (b)**: add `solubility` to `vocabulary`, repoint `name-literally`.
7. `package.md` (`include: foundation, vocabulary, testing`) + `README.md`.
8. Commit; log the merges/folds/solubility to the composite `agent/log/`.

## Phase B — Distribution

- Create `eventide-project/agent-norms-design-by-efferent` (public), `git subtree split --prefix=design-by-efferent`, push, prove the pull.
- **Re-split/push `vocabulary`** (it gained `solubility`).

## Open questions

1. **DBE vocabulary structure** — consolidate the lexicon into a single **`vocabulary.md`** glossary (recommended, per the design's provision for a cohesive glossary), absorbing `efferent`/`actuation` and referencing `solubility`; keep `design-by-efferent` (the name) as a glossary entry + the README subject.
2. **~~TDD → DBE conformance~~ — RESOLVED (2026-07-17): selective, by the genus test.** DBE *comprises* TDD, so "TDD" stays where it genuinely names the general practice (the genus). But anything labeled "TDD" that is **not strictly general TDD** and would otherwise fall into DBE is **relabeled DBE**. Applied per rule during the build (most `tdd-*` rules are DBE-specific — built on the cradle/solubility/efferent/hinge machinery — so they relabel to DBE; `tdd-lexicon` becomes the DBE lexicon; "TDD" is kept only where it names the general red-green cycle the method builds on, chiefly `tdd-designs-coverage-protects`). Borderline calls surfaced at review. Sharpens the `design-by-efferent` name rule.
3. **solubility (b) enactment** — confirm re-publishing `vocabulary` now to add `solubility` (recommended — it closes the dangling reference and the lexicon needs it), vs. defining `solubility` inside DBE after all.
4. **M2 merged rule form** — a "what each hinge displays" table companion to `hinge-cycle` (recommended).

## Not done without explicit go-ahead

Any file create, all of Phase B, and the `vocabulary` re-publish.
