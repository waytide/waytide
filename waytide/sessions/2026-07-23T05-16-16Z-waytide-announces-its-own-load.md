# Session — Waytide Announces Its Own Load: A Session-Start Notice, Carried by Committed Content (2026-07-22)

A short, focused session on the **Waytide** framework. It opened with a status check, turned into a design question — *should Waytide print a notice when it loads into a session?* — and resolved into a built and published feature: a one-line load notice, listing the packages present, carried by committed content so it prints on every developer's machine, with an environment-variable opt-out. The reasoning that shaped it was a distinction the engineer's constraints ultimately settled: an honest deterministic banner was not available under those constraints, so the notice is an **agent-printed self-report**, grounded by enumerating the real package directories — and the rule says so plainly.

This is the communicable record of that session: a chronological tour of what was asked and concluded at each step. The durable records are the source of truth — the foundation rule, the changed bootstrap and `AGENTS.md`, and the decision-log entry under `waytide/log/`; this narrative points to them, it does not replace them.

---

## 1. Status check

The session opened by asking the state of the work. The tree was clean and up to date with `origin/master`; the prior session (the framework reshaping — flattening, vocabulary, layout, provenance) was complete and recorded, with three deferred initiatives waiting and nothing in flight. That cleared the ground for new work.

## 2. The question — should Waytide announce its load?

The engineer floated an idea: should Waytide print a message in a session it's loaded into — `Waytide loaded from …`? The first response drew the distinction that would run through the rest of the session: a bare, agent-printed "loaded" line is the **weak version** — the agent vouching for itself, which the framework's own discipline should distrust. The **honest version** is a notice the harness prints deterministically, which is evidence rather than a claim. So: worth doing, but the mechanism matters.

## 3. Clarifying what "loaded" even means

The engineer asked a sharp question: what is "foundation's install output" — is it a git-install-time thing, or a session-start thing? This forced a correction of loose wording. Waytide has **no runtime**: `install.sh` runs once at git-install time and writes a bootstrap section into the project-root `AGENTS.md`; that committed prose is then *read* by the agent at every session start. Two distinct moments — install writes the instruction once, the instruction is obeyed each session — and the earlier "add a SessionStart hook to what install.sh generates" had blurred two different artifacts: `AGENTS.md` prose (read by the agent) versus a `.claude/settings.json` hook (executed by the harness).

## 4. The constraints that settled the mechanism

The engineer set the deciding constraints: **avoiding a dependency on `.claude/` content** (it's to be gitignored), the notice must **print on every developer's machine that checks out the consuming repo**, and a `.claude/settings.json` opt-out to *disable* the notice is fine. Also: the notice should **list the component packages present**.

These constraints resolve the mechanism with no remaining choice. Deterministic session-start execution *is* harness-specific config, and that config is exactly what's being gitignored — so the honest deterministic banner is not available here. The only committed, harness-neutral carrier read at session start is the `AGENTS.md` bootstrap, and that is read as prose. So the notice is necessarily **agent-printed**. The self-report weakness raised in step 2 becomes, here, the accepted cost of the engineer's priorities — legitimate priorities that outweigh mechanism-purity. Enumerating the actual package directories keeps it grounded: to list them, the agent must read the directory, so the notice does a small amount of unfakeable work rather than asserting a load.

## 5. The opt-out — an environment variable, not `.claude/`

The one open fork was the opt-out mechanism. The recommendation, accepted: an **environment variable, `WAYTIDE_QUIET`**, rather than tying the opt-out to `.claude/` at all. Waytide doesn't *depend* on `.claude/`; it honors an env var that a developer can set however they like — shell profile, `direnv`, or a personal `.claude/settings.json` `env` block, which becomes just one convenient way to set it. Default-on travels with the repository; silencing stays a per-developer preference in the developer's own environment.

## 6. Building and publishing

Four changes, committed together as `b5679b2`:
- the foundation `install.sh` bootstrap (the text written into a consuming project's root `AGENTS.md`),
- the composite's own root `AGENTS.md` (worded for its `framework/` path, seven packages),
- a new foundation rule, `announce-waytide-at-session-start`, recording the convention with its provenance footer,
- the decision-log entry.

The commit followed the house rules — software-first subject, no Claude coauthor trailer. Then **foundation was published** to its component repo by the guarded `git subtree split` fast-forward (`57e7012..95e6049`), clean because the `framework/foundation` path is unchanged.

---

## Takeaways

- **Waytide has no runtime.** It "loads" only in that the committed root `AGENTS.md` bootstrap, written once at git-install time, is *read* by the agent at each session start. There are two moments — install writes the instruction; the session obeys it.
- **The carrier decides the mechanism.** "Print on every developer's machine, harness-neutral, no `.claude/` dependency" leaves only the committed `AGENTS.md` prose, which is read by the agent — so the notice is necessarily an **agent-printed self-report**, not a deterministic harness banner. That's the honest tradeoff of those constraints, and the rule states it rather than hiding it.
- **Enumerating the packages present grounds the self-report.** Listing the real directories under `waytide/framework/` requires reading them, so the notice does a little unfakeable work instead of a bare claim. It still is not proof the rules were internalized — that comes from the work honoring them.
- **The opt-out lives in the developer's environment.** `WAYTIDE_QUIET` decouples silencing from `.claude/`; default-on travels with the repo, opt-out stays personal.

## Glossary (settled or applied this session)

- **load notice** — the one-line `Waytide loaded from … — N packages: …` an agent prints at session start after reading the rules, enumerating the package directories actually present.
- **agent-printed self-report** — a notice carried by `AGENTS.md` prose and emitted by the agent; it confirms the framework was read far enough to reach the instruction and that the package directories exist, but does not prove every rule was internalized. Contrast a **deterministic harness banner** (a harness-executed hook), which is honest evidence but harness-specific.
- **carrier** — the artifact that conveys an instruction to session start: committed `AGENTS.md` prose (harness-neutral, read by the agent) versus `.claude/settings.json` config (harness-specific, executed by the harness). The choice of carrier determines whether a notice can be deterministic.
- **`WAYTIDE_QUIET`** — the environment variable that, set to any non-empty value, silences the load notice; the opt-out that keeps default-on in committed content and silencing in the developer's own environment.

## Where the durable records live

- **The new rule:** `framework/foundation/announce-waytide-at-session-start.md` — the convention, including the plain statement that the notice is a grounded self-report, not proof.
- **The bootstrap and activation prose:** `framework/foundation/install.sh` (the `bootstrap()` text placed into a consuming project's root `AGENTS.md`) and the composite root `AGENTS.md`.
- **The decision log:** `waytide/log/2026-07-23T05-13-10Z-announce-waytide-at-session-start.md`.
- **The commit and publish:** composite `b5679b2` on `master`; foundation published to `github.com/waytide/foundation` at `95e6049` (fast-forward from `57e7012`).

## A note on the session itself

The turn that did the work was the engineer's question in step 3 — *is this a git thing or a session thing?* — which caught loose wording and forced the two moments apart. Once that was clear, the constraints in step 4 did the rest: they did not leave a menu of mechanisms to weigh, they eliminated all but one. The remaining honesty concern wasn't resolved so much as **placed** — written into the rule as the acknowledged cost of a deliberate tradeoff, where a later reader can see it, rather than smoothed over.

---

Authored by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
