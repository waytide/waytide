# Session — Waytide Announces Its Own Load, Then Provenance Goes Into Every Working-State File (2026-07-22)

A short, focused session on the **Waytide** framework. It opened with a status check, turned into a design question — *should Waytide print a notice when it loads into a session?* — and resolved into a built and published feature: a one-line load notice, listing the packages present, carried by committed content so it prints on every developer's machine, with an environment-variable opt-out. The reasoning that shaped it was a distinction the engineer's constraints ultimately settled: an honest deterministic banner was not available under those constraints, so the notice is an **agent-printed self-report**, grounded by enumerating the real package directories — and the rule says so plainly.

From there the session ran a second thread: whether a session record — and then every working-state artifact — should carry a **provenance footer**. It settled on a plain principle from the engineer: a file must be **useful on its own**, without querying the git log. That reason is deliberately kept distinct from the rule-file footer's (which recovers history that `git subtree` strips), and it was written into a single rule so the seven conventions that use it need not each restate it.

This is the communicable record of that session: a chronological tour of what was asked and concluded at each step. The durable records are the source of truth — the foundation rules, the changed bootstrap, `AGENTS.md`, and artifact conventions, and the decision-log entries under `waytide/log/`; this narrative points to them, it does not replace them.

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

## 7. Do session records carry a footer?

The engineer asked whether session records have provenance footers. The answer, grounded in the conventions: **no** — the footer was scoped to **rule files** only (the record-rule-authorship-in-a-footer rule opens "Every rule file ends with a provenance footer"), and the sessions convention said nothing about one. The reasoning held up: the rule-file footer exists because `git subtree` strips a package's per-file history in a consuming project, so `git blame` can't show a rule's author there; a session record lives in `waytide/sessions/`, is never shipped by subtree, and keeps its git history intact — so the provenance a footer reconstructs is already present.

## 8. Footers into the session files — a different reason

The engineer overrode that default: **session files should carry footers anyway**, because *the files themselves should be useful without having to query the git logs.* This is a **different rationale** from the rule-file footer's — not recovering stripped history, but self-contained readability. The sessions convention was changed to require the footer, and the two existing session records — the framework-reshaping record and this one — were backfilled with `Authored by` footers at their true authoring times. Committed as `64a0472`; foundation published (`95e6049..2aa2f21`).

## 9. Generalizing the footer to every working-state artifact

The engineer widened it once more: **generalize the footer to the other working-state artifacts.** Rather than repeat the rationale in each convention — the fragmentation the framework consolidates away — a single rule was written, `working-state-artifacts-carry-a-provenance-footer`, as the one home of the convention and its "useful on its own" reason. It covers experiments, designs, plans, observations, deferred items, loop records, and session records; each artifact convention — including DBE's loop-records — now points at it, and the sessions convention was slimmed from its inline rationale (added in step 8) to that pointer.

One artifact is **exempt: the decision log.** Its entries are one line, no body, no template, and their author-and-time already live in the ISO-8601-UTC filename and the commit; a footer would contradict that shape and the log's no-reformat protection. The exemption is stated in both the general rule and the decision-log convention.

The existing deferred and experiment records were backfilled with footers at their **true** authoring times — recovered from the ISO-8601-UTC filename prefixes, not the later migration git-add dates that would misattribute the time. Committed as `c9fd44b`; foundation (`2aa2f21..605f242`) and design-by-efferent (`63e9fd1..491e1fc`) both published.

## 10. Asking about the record itself — through the selection UI

A final rule closed the loop on the session records themselves. The engineer set it: **when the agent asks whether to record a session, it must put the choice through the AskUserQuestion selection UI**, not a prose question, offering three options — write a new session record, append the previous one, or write none. The rule went into the sessions convention, kept self-contained in foundation (which cannot depend on the design-by-efferent package, where the general "present every prompt through the selection UI" rule lives). Committed as `0f20e6b`; foundation published (`605f242..3cc44f3`). Its **first exercise was this very section**: rather than assume, the agent asked through the UI, the engineer chose **append**, and the work landed here — the rule applied to its own first instance.

---

## Takeaways

- **Waytide has no runtime.** It "loads" only in that the committed root `AGENTS.md` bootstrap, written once at git-install time, is *read* by the agent at each session start. There are two moments — install writes the instruction; the session obeys it.
- **The carrier decides the mechanism.** "Print on every developer's machine, harness-neutral, no `.claude/` dependency" leaves only the committed `AGENTS.md` prose, which is read by the agent — so the notice is necessarily an **agent-printed self-report**, not a deterministic harness banner. That's the honest tradeoff of those constraints, and the rule states it rather than hiding it.
- **Enumerating the packages present grounds the self-report.** Listing the real directories under `waytide/framework/` requires reading them, so the notice does a little unfakeable work instead of a bare claim. It still is not proof the rules were internalized — that comes from the work honoring them.
- **The opt-out lives in the developer's environment.** `WAYTIDE_QUIET` decouples silencing from `.claude/`; default-on travels with the repo, opt-out stays personal.
- **Every working-state artifact carries a provenance footer** — for a different reason than a rule file: not to recover history that subtree strips (these keep their history), but so the file is **useful on its own**, without querying the git log.
- **The footer convention lives in one rule, not repeated per artifact.** `working-state-artifacts-carry-a-provenance-footer` is the single home; each artifact convention points at it. The **decision log is the sole exception** — its one-line shape carries provenance in the filename already.
- **A footer's datetime is the artifact's true authoring time** — for a dated artifact, the ISO-8601-UTC filename prefix, not a later migration git-add date.
- **When the agent asks whether to record a session, it asks through the AskUserQuestion selection UI** — three options (a new record, appending the previous, or none), not a prose question. A direct instruction to record needs no prompt.

## Glossary (settled or applied this session)

- **load notice** — the one-line `Waytide loaded from … — N packages: …` an agent prints at session start after reading the rules, enumerating the package directories actually present.
- **agent-printed self-report** — a notice carried by `AGENTS.md` prose and emitted by the agent; it confirms the framework was read far enough to reach the instruction and that the package directories exist, but does not prove every rule was internalized. Contrast a **deterministic harness banner** (a harness-executed hook), which is honest evidence but harness-specific.
- **carrier** — the artifact that conveys an instruction to session start: committed `AGENTS.md` prose (harness-neutral, read by the agent) versus `.claude/settings.json` config (harness-specific, executed by the harness). The choice of carrier determines whether a notice can be deterministic.
- **`WAYTIDE_QUIET`** — the environment variable that, set to any non-empty value, silences the load notice; the opt-out that keeps default-on in committed content and silencing in the developer's own environment.
- **provenance footer (working-state artifact)** — the `Authored by … / Changed by …` block ending a working-state file; here it exists for **self-contained readability** (the file is useful on its own), a reason distinct from the rule-file footer's (recovering history that `git subtree` strips).
- **useful on its own** — the principle that a working-state file should give a reader what they need, including who wrote it and when, without leaving the file to query the git log; the reason these artifacts carry a footer.

## Where the durable records live

- **The new rule:** `framework/foundation/announce-waytide-at-session-start.md` — the convention, including the plain statement that the notice is a grounded self-report, not proof.
- **The bootstrap and activation prose:** `framework/foundation/install.sh` (the `bootstrap()` text placed into a consuming project's root `AGENTS.md`) and the composite root `AGENTS.md`.
- **The decision log:** `waytide/log/2026-07-23T05-13-10Z-announce-waytide-at-session-start.md`.
- **The commit and publish:** composite `b5679b2` on `master`; foundation published to `github.com/waytide/foundation` at `95e6049` (fast-forward from `57e7012`).
- **The generalized footer rule:** `framework/foundation/working-state-artifacts-carry-a-provenance-footer.md` — the single convention, its "useful on its own" reason, and the decision-log exemption.
- **Conventions updated to point at it:** `agent-sessions`, `agent-deferred`, `agent-design`, `agent-experiments`, `agent-observations`, `agent-plans`, `decision-log-convention` (the exemption), and DBE's `loop-records`.
- **The footer decision-log entries:** `waytide/log/2026-07-23T05-21-27Z-session-records-carry-a-provenance-footer.md` and `waytide/log/2026-07-23T05-27-41Z-provenance-footer-generalized-to-all-working-state-artifacts.md`.
- **The footer commits and publishes:** `64a0472` (session-record footers) and `c9fd44b` (the generalization); foundation at `2aa2f21` then `605f242`, design-by-efferent at `491e1fc`.
- **The session-recording prompt rule:** the `agent-sessions-convention` "How the recording is asked" clause; decision-log entry `waytide/log/2026-07-23T05-33-25Z-session-record-recording-is-asked-through-askuserquestion.md`; commit `0f20e6b`; foundation `605f242..3cc44f3`.

## A note on the session itself

The turn that did the work was the engineer's question in step 3 — *is this a git thing or a session thing?* — which caught loose wording and forced the two moments apart. Once that was clear, the constraints in step 4 did the rest: they did not leave a menu of mechanisms to weigh, they eliminated all but one. The remaining honesty concern wasn't resolved so much as **placed** — written into the rule as the acknowledged cost of a deliberate tradeoff, where a later reader can see it, rather than smoothed over.

The footer thread had the same shape. An engineer's plain principle — *the file should be useful on its own* — overrode a narrower default (footers were for rule files), and the reasoning was kept **distinct** from the one it superficially resembles rather than conflated with it: the rule-file footer recovers history that subtree strips; the working-state footer serves self-contained readability. Where the load-notice work placed an honesty caveat into a rule, the footer work placed a *reason* into a rule — one home for it, so the seven conventions that rely on it don't each carry their own copy. Twice in one session, the framework's own consolidation discipline was applied to the framework: name the distinction that does work, and refuse to duplicate the rationale that doesn't. And the session closed on a third reflexive turn — a rule for how to *ask* about recording a session, exercised on its own first instance, so this very record was appended by the mechanism the rule had just introduced.

---

Authored by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
