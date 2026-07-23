# Session — The Framework Reshapes Itself: Flattening, Vocabulary, Layout, and Provenance (2026-07-20 – 2026-07-22)

A working session on the **Waytide** framework itself — the composite repo that authors the installable rule packages. It began as a walk through the framework's own concepts (experiments, DBE, planning, loops, sessions), turned into an experiment on the framework's *own* rule files, and from there widened into a run of reshaping: consolidating the substitution rules into per-package vocabularies, renaming the framework's directories twice, giving every rule an authorship footer, and finally writing the sessions convention this very record is the first instance of. Throughout, the framework kept turning its own tools — experiments, precise language, the decision log — on itself.

This document is the communicable record of that session: a chronological guided tour of what was asked and concluded at each step, with settled terms defined as they arise. The durable records are the source of truth — the binding rules under `framework/`, the experiment record, and the decision log under `waytide/log/`; this narrative points to them, it does not replace them.

---

## 0. Where we started — concepts, then a reorganization

The session opened with the engineer asking the framework to explain its own conventions: **experiments** (forecast-first tests of a question, on their own branch), **Design By Efferent** (the AI generates and gates at hinges for the human to deliberate), **planning** (design settles direction, a plan sequences it), **loops** (the distributed-OODA record), and **sessions** (then undefined).

The first concrete work: the composite repo held its packages loose at the root, so they were grouped under a top-level `rules/` directory to mirror the installed `waytide/rules/` layout. This was published to the seven component repos — the first hint that a directory move forces a `git subtree split` **path change** (a force-reset of every component repo), a thread that would recur.

## 1. The rules-files-flattening experiment

The engineer suspected the rule files "could be flattened" and asked for an experiment to determine it. An **observation-only** experiment was opened (`waytide/experiments/…-rules-files-flattening.md`): question, setup, and a forecast committed *before* the analysis. The determination: the rule `.md` files themselves flatten without name collision, but the packaged `rules/` tree does not — blocked by per-package scaffolding (READMEs, install scripts, vocabularies), the subtree-split boundary, and package identity living in the directory.

Then the first directed on-disk step, under a hard constraint (no on-disk change without explicit direction): **strip the ISO datetime prefixes from the rule filenames**. All 78 rule files were renamed to their slug alone.

## 2. "Flatten" reframed — consolidate duplicate or fragmented rules

A pivotal correction: by "flatten," the engineer did **not** mean collapsing directories. It meant finding **duplicate or fragmented** rule files and consolidating them for cohesion. This reset the experiment's direction.

## 3. The substitution lexicon, and the consolidation criterion

The clearest case: the ten language `say-X-not-Y` rules were each a tiny leaf sharing one rationale — a glossary fragmented into ten files. They were consolidated into one **Word Substitutions** table. A dedup/fragmentation audit of every package followed; it surfaced apparent candidates (the DBE show-the-test pair, the code/ruby build+robustness pair), but the engineer judged each to keep a **load-bearing distinction** and stay separate. The criterion settled: *consolidate only when the distinction between the files is inert; a distinction that does work earns its file.* (Recorded in the experiment record's findings.)

## 4. The vocabulary.md model

The engineer proposed generalizing what `design-by-efferent` already did — a per-package `vocabulary.md` — to hold each package's **Terms** and **Substitutions**. Adopted for `language` and `testing`. A key correction along the way: **`solubility` is a methodological principle, not mere vocabulary**, so it kept its own rule and is only glossed in the vocabulary. Then a deeper move: **`efferent` and `actuation` are more fundamental than DBE**, so — like `solubility` — their definitions and the `caller→efferent` / `the call→actuation` substitutions were promoted to `language`, with DBE specializing them.

## 5. Affirming and merging — and the no-prefix norm

The engineer declared the experiment **Affirmed** and directed the merge to `master`. Affirming made the prefix-stripping the **framework norm**: a rule file carries **no datetime prefix** (named by what it says), while working-state artifacts keep it. A second distinction was drawn: **framework/package rules are unprefixed; a consuming project's own local rules take the prefix** — and `waytide/rules/` in a consuming project holds the project's *own* rules, separate from the installed packages. The experiment branch was concluded and, on a confirmation put through the AskUserQuestion UI (a rule set this session), deleted.

## 6. Language discipline — the running thread

The framework's own language rules were applied *to the framework and to the assistant's prose*, repeatedly. New substitutions were settled and recorded in the language vocabulary: **impact** (not "what it costs"), **examine** (not "decode"), **initiate** (not "pick up"), **dash-separated, lower-case** (not "kebab-case"), **name** (not "slug"), and **what changed / what was affected** (not "what landed"). Two communication rules were added: **lead with a summary before the details**, and **no symbolic back-references** (name the thing, never "#2"). The assistant was corrected several times for slipping into slang — the framework holding itself to its own standard.

## 7. The directory renames — rules → packages → framework

Naming the installed directory for what it *is*: `waytide/rules/` was renamed to `waytide/packages/` (installed packages), with `waytide/rules/` repurposed for the project's own rules. Then, reconsidered, `packages/` was renamed again to `framework/` (the installed content *is* the framework). Both the consuming-project install target and the composite's own authoring directory were renamed each time. Each move was a subtree-split path change, so the seven component repos were force-reset onto the new split — the reset thread from §0, now understood and documented in `CONTRIBUTING`.

## 8. Provenance footers — authorship in the files

The engineer asked that each rule record its **author** and a **datetime**, human-readable and local (`Mon Jan 1 2026 at 3 PM PT`), deliberately unlike the UTC filename prefix — because a package installed by `git subtree` does not carry the composite's per-file history into a consuming project, so `git blame` cannot show authorship there. The `record-rule-authorship-in-a-footer` rule was written, and all 71 rule files were backfilled with an `Authored by` line — using each rule's **true** creation date, recovered from the stripped ISO prefixes (the git add-date was the migration commit, a false trail).

## 9. Protecting the decision log

When the "combine the migration notes" deferred item was raised, the engineer forbade it: **the decision log is never consolidated on the agent's initiative, never even proposed; only on explicit command, and even then confirmed with the project's stakeholders.** For a readable overview, ask for a *summary* — a read-time projection — not a consolidation. Recorded in `decision-log-convention`.

## 10. The sessions convention

Finally, the undefined `waytide/sessions/` was given a convention. `constant`'s one existing session record was surveyed as the de-facto template. The convention was written — first mistakenly split across foundation and the `plan` package, then corrected: `plan` governs forward-looking documents, but a session record is a record of the *past*, so its format lives with its directory convention in `agent-sessions-convention`, the way the experiment and loop-record formats do. This record is the first instance of it.

---

## Takeaways

- **The framework's rule files carry no datetime prefix** — a rule is named for what it says; the prefix is for dated working-state artifacts and a consuming project's own local rules.
- **Consolidate rules only when the distinction between them is inert.** The substitution lexicon was the sole case; a load-bearing distinction earns its file.
- **Per-package `vocabulary.md`** holds a package's Terms and Substitutions; a load-bearing *principle* (solubility) keeps its own rule; general design vocabulary (efferent, actuation) lives in `language`, specialized by the methods that build on it.
- **Installed content is separated from the project's own work by name**: `waytide/framework/` (installed) vs. `waytide/rules/` (the project's own).
- **Every rule records its authorship in a provenance footer** — in the file, because subtree install strips git history.
- **The decision log is append-only** — never consolidated on the agent's initiative; a summary is a read-time projection, not a rewrite.
- **A session record is a guided tour of the past** that points to the durable records; it is not itself a source of truth.

## Glossary (settled or applied this session)

- **flatten** (as the engineer meant it) — consolidate duplicate or fragmented rule files for cohesion; *not* collapsing directories.
- **inert distinction** — a separation between files that does no work; only an inert distinction may be consolidated.
- **framework rule** vs. **local rule** — a rule shipped in a package (unprefixed) vs. a consuming project's own rule (datetime-prefixed).
- **provenance footer** — the `Authored by … / Changed by …` block a rule file ends with, in local human time.
- **session record** — the narrative, chronological guided tour of a work session, pointing to the durable records.
- Substitutions settled: **impact** (not "what it costs"), **examine** (not "decode"), **initiate** (not "pick up"), **dash-separated, lower-case** (not "kebab-case"), **name** (not "slug"), **what changed / what was affected** (not "what landed").

## Where the durable records live

- **The experiment:** `waytide/experiments/2026-07-21T09-17-02Z-rules-files-flattening.md` — question, forecast, determination, trial steps, and the affirmed conclusion.
- **New / changed framework rules** (`framework/`): `foundation/agent-file-names-use-iso8601-utc-prefix.md` (the no-prefix-for-rules norm), `foundation/agent-rules-convention.md` (the packages/rules split), `foundation/record-rule-authorship-in-a-footer.md`, `foundation/agent-sessions-convention.md`, `foundation/decision-log-convention.md` (the no-consolidation rule), `language/vocabulary.md` (the substitution lexicon, terms, and `efferent`/`actuation`), `language/lead-with-a-summary-before-details.md`, `language/communicate-plainly-name-the-thing.md` (no symbolic back-references), `git/subject-first-commit-messages.md`, `testing/vocabulary.md`.
- **The decision log:** `waytide/log/` — one line per decision, in commit order (this session added many).
- **The published packages:** the seven component repos under `github.com/waytide/`, now on the `framework/<package>` split.

## A note on the session itself

The session was reflexive throughout: an experiment run on the framework's own rules, the framework's language discipline turned on the framework's own files and on the assistant's prose, the framework's decision log recording the reshaping of the framework. The durable conclusions are the assistant's generation; the corrections that made them right were the engineer's — reframing "flatten," rescuing `solubility` and `efferent` from being flattened into mere vocabulary, catching slang the assistant reached for, and placing the session format where it belonged. The above-the-mean element at work, on the framework that names it.
