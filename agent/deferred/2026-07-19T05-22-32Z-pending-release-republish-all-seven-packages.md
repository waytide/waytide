# First Waytide release — publish all packages to the new `waytide` org

The project was renamed from "Agent Norms" to **Waytide**, and distribution moves to a new GitHub org. Nothing is published under the new names yet. This is the first Waytide release: publish the composite to **`waytide/waytide`** and each package to **`waytide/<package>`** in the **`waytide`** org. The old `eventide-project/agent-norms-*` repos are left behind (no real consumers — every prior publish was proved only with a throwaway pull).

Because the org and every repo name change, this is a **fresh first publish** of each repo, not a fast-forward re-publish or a rename. The per-package fast-forward / rename / force cases from the prior (Agent Norms) release no longer apply.

**What ships** (a fresh publish carries the whole current composite state, so everything accumulated since the last Agent Norms release goes out together):
- **All seven packages**, published to `waytide/foundation`, `waytide/language`, `waytide/testing`, `waytide/code-ruby`, `waytide/git`, `waytide/plan`, `waytide/design-by-efferent`.
- The composite pushed to `waytide/waytide`.
- Carried along: the "puts" not "lands" phrasing sweep; the two new `language` rules (`communicate-plainly-name-the-thing`, `expand-abbreviations-on-first-use`); the `docs` → `plan` package rename; and — if decided by then — the `foundation` bootstrap `install.sh` (see [[2026-07-19T02-56-52Z-foundation-must-ship-the-bootstrap-that-switches-the-framework-on]]).

**Procedure:**
1. ~~Create the `waytide` org and the eight repos.~~ **DONE 2026-07-19** — org created; all eight repos (`waytide/waytide` + one per package) created **public and empty** via `gh repo create`, confirmed `isEmpty=true`. (Publishing is still held — see below.)
2. **Push the composite** to `waytide/waytide` (`master`).
3. **For each package:** `git subtree split --prefix=<package> -b publish-tmp`, then `git push https://github.com/waytide/<package>.git publish-tmp:master`, then delete the temp branch. `code/ruby` splits from `--prefix=code/ruby` into `waytide/code-ruby`.
4. **Prove each pull** into a throwaway project (`git subtree add`); check the files, structural files, and `log/` presence match expectations.
5. Log a composite `agent/log/` entry, and update the state-of-the-work note (all seven live under `waytide/*`).

The runbook (`log/2026-07-17-agent-norms-phase-b-runbook.md`) still holds the split-and-push primitive and the proof step; only the org and repo names differ (`waytide/<package>`, no `agent-norms-` prefix).

**Gated on:** explicit go-ahead **and the license being ready** — the empty repos exist, but publishing the packages before the Eventide Common Interest License is in place would put them out all-rights-reserved (see [[2026-07-19T19-17-49Z-add-the-eventide-common-interest-license-to-each-package]]). Hold the publish until the license lands, or ship with a clear "license forthcoming" note. Every push writes to public repos.

**Why:** the composite is the source of truth and fully rebranded; the packages just need their first publish under the Waytide name. Recorded so the release survives beyond this session.

**How to apply:** once the org and repos exist, run the procedure above, prove each pull, log it, update the state-of-the-work note, and delete this item.
