# Pending release — re-publish all seven packages (puts-not-lands changes)

All seven packages carry **unpublished changes** and need a Phase B re-publish at the next release. Left unpublished deliberately (2026-07-19, at Scott's direction) — batch it later rather than push now.

**What's pending (commit `a00f76c`, "Say 'puts' not 'lands' for placement throughout"):**
- **Every package README** — the install line changed to "`git subtree` — it puts the files in your project's `agent/rules/` tree…" (all seven: foundation, language, docs, git, testing, code/ruby, design-by-efferent).
- **`foundation` rules** — `agent-deferred-convention` ("is put into code or rules"), `rules-install-a-mindset` and `experiment-runs-on-its-own-branch` ("goes into" / "is just the log copy").
- **`language` rule** — `no-slang` ("goes into the codebase").

**Also pending in `language` (new rule):** `communicate-plainly-name-the-thing` — a new principle rule beneath the `language-is-precise-here` premise: speak and write plainly, name the actual thing, no invented labels or unexplained jargon. The language README's principle-rule list gains it.

So the component repos are behind the composite — `foundation` for the phrasing changes (and later the bootstrap `install.sh`), and `language` also for the new principle rule.

**How to re-publish:** the routine fast-forward path in `log/2026-07-17-agent-norms-phase-b-runbook.md` — the prefixes are unchanged, so `git subtree split --prefix=<pkg>` fast-forwards each component `master`. All seven are plain re-publishes (no rename/create). Prove each pull. (Note: `foundation` and `docs` were last published earlier this session with the new planning/design/experiments conventions; this release carries only the phrasing changes on top.)

**Batch with, if decided by then:** the `foundation` bootstrap `install.sh` (see [[2026-07-19T02-56-52Z-foundation-must-ship-the-bootstrap-that-switches-the-framework-on]]) — it also re-publishes `foundation`, so shipping both at once saves a round.

**Gated on:** explicit go-ahead (every push writes to public component repos). Not blocking — purely a distribution step.

**Why:** the composite is the source of truth and already conformed; the component repos just need the next deterministic re-publish to catch up. Recorded so the pending release survives beyond the session in which the changes were made.

**How to apply:** when releasing, follow the Phase B runbook for all seven packages (fast-forward re-publish, prove each pull), log a composite `agent/log/` entry, and update the state-of-the-work note. Delete this item once done.
