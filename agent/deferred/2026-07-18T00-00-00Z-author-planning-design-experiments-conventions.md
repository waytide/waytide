# Author planning, design, and experiments conventions

The packages address these only lightly (`docs`'s `plans-no-code-samples`; `plans/` and `design/` referenced in foundation's conventions but not defined; experiments not covered). Return to author them.

**Settled placement:**
- **foundation** — the *directory* conventions: `agent/plans/`, `agent/design/`, `agent/experiments/` exist, what each holds, naming. Foundation owns the `agent/` framework and already references `plans/`/`design/`.
- **docs** — the *writing* conventions: how a plan or design doc reads (format, sections). `docs` already holds `plans-no-code-samples`.

**Open:** where "experiments" goes depends on what it is — an `agent/experiments/` artifact directory → foundation; throwaway scratch/exploration tied to the design method → `design-by-efferent`. Decide before authoring.

Suspended 2026-07-18 at Scott's direction; resume later.

---

## Source examples in `constant` (surveyed 2026-07-18)

`constant` has worked examples of all three directories — the natural basis for the conventions. Paths under `/Users/sbellware/projects/eventide/constant`:

- **`agent/plans/`** (2) — `2026-05-29T17-39-17Z-constant-class.md`, `2026-06-29T19-49-18Z-constant-literal-restructure.md`
- **`agent/design/`** (2) — `2026-05-22T18-59-14Z-constant-class-design.md` (a *feature/component* design), `2026-06-20T18-50-55Z-human-in-the-loop-tdd-design.md` (a *methodology* design)
- **`agent/experiments/`** (1) — `2026-06-26T21-19-51Z-name-feature-run-1.md`
- Also present, outside this item's three: `agent/sessions/` (worth surveying later for a fuller artifact set).

### Observed conventions — plans

ISO-8601-UTC filename prefix. `# <Title> — Implementation Plan`. Sections seen:
- **Goal** — one paragraph, what the plan achieves.
- **Source design** — points at the `agent/design/` doc it realizes (the plan/design pair: design settles direction, plan sequences the build).
- **Supersedes** — can retire a prior plan while keeping its completed tasks as history (plan 2 supersedes plan 1's Tasks 10–12).
- **Architecture** — phases → tasks; each phase characterized (atomic/behavior-neutral vs. test-first build).
- **Tech Stack** — one line.
- **Process notes** — includes *"Code is not specified in this plan"* (the built `docs`/`plans-no-code-samples` rule was extracted from exactly this practice), "each task test-first," controls usage.
- **Commit policy** — one commit per task, no Claude trailer, decision-log entry only when a real decision was made.
- **Tasks** — `- [ ] Task N: <name>`, single checkbox each; intended *behavior* stated (no code); post-hoc notes record reworks, green-on-arrival drops, and supersessions inline on the task.

### Observed conventions — design

ISO-8601-UTC prefix. `# <Title> — Design`. Two flavors:
- **Feature/component design** (`constant-class-design`) — **Summary**, **Background & Motivation**, **Vocabulary**, numbered **Section N** blocks (Structure & File Layout, Construction, Query API, Class-Level API), **Equality**, **Error Handling**, **Testing**, **File-by-File Change Summary**, an **Intended Direction** section, **Settled (dated)** resolutions, **Out of Scope / Deferred**. Carries a **Package Dependency** heading (matches the built `docs`/`package-dependency-heading` rule).
- **Methodology design** (`human-in-the-loop-tdd-design`) — **Premise**, conceptual sections (where judgment lives — hinges, division-of-labor table, the loop as numbered steps, principles, net effect, related). More conceptual than a component design; this is the DBE method's own origin design.

Common spine: Title — Design; a summary/premise; substantive numbered or named sections; dated **Settled** resolutions; an **Out of Scope / Deferred** tail. A design settles *direction*; a plan *realizes* it.

### Observed conventions — experiments

ISO-8601-UTC prefix. `# Experiment — <name>` (the sole example adds `, Run N`, but see the run decision below). Sections:
- **Branch** (+ base tag), **Question** (the hypothesis under test).
- **The forecast** (made before the work) — tiers of expected decisions.
- **What actually happened** — a ratify/correct table, one row per decision.
- **Findings**, **Final state**, **Tally**, and post-hoc **misses** (the most informative data points).

The example is a *persisted, dated, structured* record — **not** throwaway scratch — but its content is thoroughly DBE-method-specific (gate forecasting, hinges, tiers, ratify-vs-correct, mean-bias, origination).

**Runs are optional, not the default (decided with Scott).** An experiment is normally **one branch worked to a verdict**, no run numbering. Split into runs (`Run 1`, `Run 2`, …) only when deliberately holding the question fixed and **varying one factor to compare** — each run its own branch from the same base, each with its own forecast. A run is a deliberate variation, not a retry.

**Branch naming (folded into `experiment-runs-on-its-own-branch`):** default `experiment/<subject>` (kebab slug of what's under test, named literally); add `-run-<n>` only when there are multiple runs. Upstream branch is **not** in the name (it lives in the record). **No base tag at all** — the baseline is recorded in the experiment record (base commit SHA + ref); a run branches straight from the recorded commit. Tags avoided to prevent `git tag`/remote clutter, and the record already names the base.

### Bearing on the open placement question

The examples *sharpen* rather than settle it, and point to a **split**:
- The `agent/experiments/` **directory convention** (it exists, holds dated experiment records, naming) behaves like `plans/` and `design/` → **foundation**, for consistency.
- The **experiment-record format** in the example (forecast → ratify/correct → findings) is an experiment *of the DBE method* — its vocabulary is entirely DBE → a **`design-by-efferent`** rule (or left as an illustrative example, not a rule).

Recommended resolution to confirm on resume: directory convention → foundation; the gate-forecasting experiment format → DBE (or illustrative). Plans and design conventions are unblocked (foundation directory rules + `docs` writing rules).

## Resolution (2026-07-18, drafted)

**Placement decided:** **all foundation** — both the `agent/experiments/` directory convention *and* the generic experiment-record format live in foundation; nothing new added to DBE. The DBE vocabulary in the sole example is just how this project filled the format.

Drafted five rules (Phase A, not yet committed): foundation `agent-plans-convention`, `agent-design-convention`, `agent-experiments-convention`, `experiment-runs-on-its-own-branch`; `docs` `plan-document-format`, `design-document-format`.

**Experiment lifecycle (Scott's requirements, folded into `experiment-runs-on-its-own-branch`):**
- Always run on a branch created for the experiment.
- Track the **upstream branch** it merges into — **not always `master`**, may be another topic branch — in the record.
- Merge upstream **only if the experiment's tests pass**.
- If no tests cover the implementation done in the experiment, the agent must get **specific user confirmation** before merging untested code upstream.
- **DBE is assumed** for an experiment; **suspending DBE requires specific user confirmation**.
- **All such user confirmations are recorded** in the experiment record.
- Agent **watches for the user starting main-sequence work** while an experiment is active and surfaces it.
- **States (verdict on the question, not the work):** an experiment **ends** as **affirmed** (question held), **refuted** (disproven), **inconclusive** (ran, no clear verdict), **abandoned** (dropped before a verdict), or **superseded** (replaced by another experiment); it may separately be **suspended** (paused). Never left silently open.
- **Affirmed is user-declared** (explicit confirmation). On affirmation: **merge** to upstream (under the test gate) **and copy the experiment log into the project decision log** (`agent/log/`). This resolves the earlier "which log" question — confirmations live in the experiment record; an *affirmed* experiment's log is copied into the project log.
- **Refuted / inconclusive / abandoned:** not merged; record **maintained, marked with the state**.
- **Superseded:** an experiment may be superseded by another; **both records cross-reference the counterpart**. A superseded experiment **must be concluded explicitly by the user** and **remains suspended until then**. Not merged; record kept.
- **Suspension:** branch **not removed**; record **characterized as suspended**.
- On **any** conclusion (affirmed / refuted / inconclusive / abandoned / suspended) the user should end up **on the upstream branch**.
- **Branch deletion** (local **and** remote) requires **explicit user confirmation**; suspension never deletes.
