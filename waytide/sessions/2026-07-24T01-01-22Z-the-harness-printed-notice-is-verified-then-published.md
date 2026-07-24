# Session — The Harness-Printed Notice Is Verified, Then Published (2026-07-23)

A verification-and-publication session, continuing directly from [the load-notice session](2026-07-23T05-16-16Z-waytide-announces-its-own-load.md). It opened with the engineer reporting that both harness surfaces work — the session-start notice and the status line — and ended with the foundation package published and the finished mechanism installed from GitHub into a scratch project and observed working. In between it produced one new installer behavior, fixed one defect that every new developer would have seen, and corrected two claims: one of mine, and one made by a background task.

The session designed nothing. Its whole substance was closing the distance between *the mechanism works on this machine* and *the mechanism works for someone who installs it* — which turned out to be a series of specific, checkable gaps rather than one act of publishing.

This is the communicable record of that session: a chronological tour of what was asked and concluded at each step. The durable records are the source of truth — the `announce-waytide-at-session-start` rule, `install.sh`, the two notice scripts, the decision-log entries under `waytide/log/`, and the deferred item — and this narrative points to them rather than replacing them.

---

## 1. The confirmation, and what it did not cover

The session opened with a report, not a question: the Waytide startup notice works, as does the status line. That confirmed the prior session's open item — which had ended *inconclusive*, because the check had been run inside a session whose first prompt was itself about Waytide, exactly the condition under which the claim cannot be observed.

The confirmation was accepted, and its boundary named at once: it covers the **authoring source** only. The committed `.claude/settings.json` in this repo points at `framework/foundation/…`; the settings file `install.sh` writes into a consuming project points at `waytide/framework/foundation/…`. Nothing had exercised the second path. That distinction set the agenda for the rest of the session.

## 2. The change set is committed

The prior sitting's work was still uncommitted — nine files spanning the two notice scripts, the committed `.claude/settings.json`, the rewritten `announce-waytide-at-session-start` rule, this repo's `AGENTS.md`, both install scripts, and two decision-log entries. Offered as one commit or two, the engineer chose one: the change is a single idea — the notice moves from the agent to the harness — and splitting it would have made two commits neither of which stood on its own.

Committed as `a0f8ae7`. There is no test suite in this repo, so the `git` package's run-suite-before-commit rule had nothing to run.

## 3. Why a personal settings file suddenly became visible

Committing `.claude/settings.json` changed something unrelated to the notice, and the engineer asked what it meant. The explanation needed two corrections before it was any good.

The mechanism, stated plainly: **git prints one line for a directory when nothing in it is tracked, and one line per file once something in it is tracked.** Before the commit, `git status` reported `?? .claude/` and named nothing inside; afterward it names `.claude/settings.local.json` individually. I had first described this as git "collapsing" the directory, which is a word for the behavior rather than a description of it, and the engineer said so. Demonstrating it in a throwaway repository — the same two files present in both runs, only the reporting different — did what the word had not.

The second correction was mine. I had called the consequence *untracked noise*, and that understated it. Appearing in `git status` is a nuisance; being swept up by `git add -A` is the actual exposure, because a developer's personal permission allowlist then enters the shared repository and takes effect for everyone who checks it out.

## 4. The installer warns when git ignores the settings file

The engineer's next question ran the concern in the other direction: if `.claude/settings.local.json` is added to a `.gitignore`, does the notice still activate for a new installer? It does — a `.gitignore` at this repo's root is not part of any package, and `git subtree split` publishes only the `framework/foundation/` prefix, so nothing at the composite root ever reaches a consuming project.

But the question surfaced a real gap on the consuming side. Many projects already ignore the whole `.claude/` directory. In one of those, `install.sh` creates `.claude/settings.json`, the notice works for whoever ran the install, and the file is never committed — so it reaches nobody else on the team. The install reports success; the failure is silent. Neither install script consulted `.gitignore` at all.

The engineer directed the fix. `place_settings_json` now ends in `warn_ignored_settings_json`, which prints a correction when git ignores the path **and** the file is not already tracked — the second condition matters, because an ignore rule has no effect on an already-committed file, so warning there would be false. The correction it prints accounts for a git behavior that makes the obvious fix fail: **git will not re-include a file inside an excluded directory**, so adding `!.claude/settings.json` beneath a `.claude/` rule does nothing. The rule has to become `.claude/*` plus the negation, which still ignores each developer's personal `.claude/settings.local.json`.

Both halves of that advice were verified rather than asserted, and the warning was exercised in four project states — ignored, not ignored, ignored but already tracked, and outside a git repository. Committed as `2c87ef8` with a bullet added to the `announce-waytide-at-session-start` rule and a decision-log entry.

## 5. The full install is tested against a scratch project

The engineer then asked for the thing named in step 1: run the full install against a scratch project. Everything to that point had used `install.sh`'s `agents-md` mode, which skips the `git subtree` install entirely.

The technique: clone this repo to a throwaway, run `git subtree split` *there* to produce a **stand-in package repository** whose root is foundation's current content, then install from that into a fresh project. Cloning first keeps the engineer's repository untouched and leaves no split branch behind. The one deviation from a real install — the `repo=` line pointed at the local stand-in rather than GitHub — was stated rather than glossed, because it is exactly the part the test could not yet cover.

It passed on every count: the subtree add and pull, the three placed files, the generated bootstrap carrying *the load notice is printed by the harness, not by you*, and — the point of the exercise — both scripts resolving and running from the consuming project's root, with `WAYTIDE_QUIET` silencing them and a second run reporting all three files left unchanged.

## 6. "1 packages" — the defect every first install shows

The test surfaced one defect. Both scripts interpolated the package count into a fixed plural, so a foundation-only install read `1 packages`. This is not an edge case: `sh install.sh` on its own installs foundation and nothing else, so the wrong form is what every developer sees before adding a second package. `install-all.sh` had hidden it by installing seven.

## 7. A deferred item arrives, carrying an incorrect claim

A background task completed mid-session and recorded a deferred item asking whether **package** is the right name for Waytide's units of distribution, or whether **module** would be more accurate ([`waytide/deferred/2026-07-23T22-51-49Z-consider-renaming-packages-to-modules.md`](../deferred/2026-07-23T22-51-49Z-consider-renaming-packages-to-modules.md)). The item is well-formed, and it identifies the two places the term drives behavior rather than prose: the detection rule that a directory carrying a `README.md` is a package, and the printed notice wording.

Its report also stated that the scratch install test was unfinished with no project installed into. That was wrong — the install was complete, and re-checking found it still emitting its notice. The claim was corrected against the evidence rather than deferred to.

## 8. The singular fix and the deferred item are committed

Offered three ways to handle the plural — fix it now, fold it into the eventual rename pass, or leave it — the engineer chose to fix it now. Both scripts select the noun on the count; verified at one, two, and seven packages. Committed as `05d3ced` with a decision-log entry, and the deferred item separately as `af2f4a9` — two commits rather than one, because a defect fix and a parked question do not share a subject.

## 9. The composite and foundation are published

The engineer asked for foundation to be split and pushed. Before doing it, one fact needed surfacing: **this composite repository was six commits ahead of its own origin**, so publishing foundation would have made a generated package public while the source it is generated from was still only on one machine. `CONTRIBUTING.md` establishes the direction — the composite is the source of truth and component repositories are downstream-only — and the engineer chose to push the composite first.

The publish followed the documented procedure exactly: split to a temporary branch, run the **fast-forward guard** (`git merge-base --is-ancestor` against the published head), push only on a pass, and delete the temporary branch. The guard was re-run immediately before the push in case the remote had moved in between. It passed both times; no force was used at any point, as the procedure requires.

Composite `d36f7ef..af2f4a9`; foundation `3cc44f3..77cf59a`.

## 10. The mechanism is installed from GitHub and observed working

With foundation published, the test that had been impossible all session became available: a fresh project, `install.sh` downloaded from the published repository and run **unmodified** — no patched `repo=` line, no stand-in. It pulled `77cf59a` from GitHub, placed all three files, and both scripts ran from the project root, the notice reading `Waytide loaded from waytide/framework/ — 1 package: foundation`.

That closes the boundary drawn in step 1, and it closes the prior session's inconclusive check by a different route: rather than trying to observe the notice inside a Waytide-shaped session, the mechanism was installed somewhere neutral and watched there.

## 11. The other packages are checked

Finally, whether anything else was stale. Each remaining package was split locally and compared against its published head — without creating a branch, since `git subtree split` prints the resulting commit and leaves no reference behind. All six hash identically to their published `master`. Nothing else needed publishing, and nothing was pushed.

---

## Takeaways

- **The confirmation that a mechanism works is scoped to the path that was exercised.** Both surfaces working in the authoring source said nothing about the consuming-project path, and the gap between them held two real defects.
- **A silent success is the failure mode worth engineering against.** The ignore case did not error — it installed, reported success, and worked for one person. The warning exists because nothing else would have revealed it.
- **Verify the advice, not just the code.** The obvious `.gitignore` correction does not work; only running it showed that a negation cannot re-include a file inside an excluded directory.
- **The first install is the one every developer sees.** `1 packages` survived because the composite's own seven-package view never showed it.
- **A report from a background task is evidence, not fact.** One arrived contradicting work that had actually been done; checking settled it in seconds.
- **Publish the source before what is generated from it.** The composite being six commits behind its own origin was invisible until the push order was considered explicitly.

## Glossary (settled or applied this session)

- **Stand-in package repository** — a throwaway clone whose `master` is set to a `git subtree split` of one package, used to install *current* package content into a test project without touching the authoring repository or publishing anything.
- **Fast-forward guard** — the `git merge-base --is-ancestor` check `CONTRIBUTING.md` requires before publishing a package: it confirms the published head is an ancestor of the new split, so the push adds commits rather than replacing history. A failure means the component repository diverged, and the response is to stop, never to force.
- **Downstream-only** — the standing property of a component repository: it only ever receives from the composite. A direct commit to one is lost or made to conflict at the next publish.
- **Untracked-directory reporting** — git's behavior of naming a directory once when nothing in it is tracked, and naming each file individually once something is. Described plainly rather than by a coined term, after the first attempt was rejected as one.

## Where the durable records live

- **Rule** — `framework/foundation/announce-waytide-at-session-start.md`, extended with the bullet on a project that ignores `.claude/`.
- **Scripts** — `framework/foundation/session-start.sh` and `statusline.sh` (the notice, the status line, the singular form); `framework/foundation/install.sh` (`place_settings_json` and `warn_ignored_settings_json`).
- **Harness configuration** — `.claude/settings.json`, committed in this repo.
- **Decision log** — `waytide/log/2026-07-23T22-46-48Z-install-warns-when-git-ignores-the-committed-settings-json.md` and `waytide/log/2026-07-23T22-54-50Z-the-notice-uses-the-singular-for-a-one-package-install.md`. The two entries committed in `a0f8ae7` were written in the prior sitting.
- **Deferred** — `waytide/deferred/2026-07-23T22-51-49Z-consider-renaming-packages-to-modules.md`.
- **Commits** — `a0f8ae7`, `2c87ef8`, `05d3ced`, `af2f4a9`.
- **Published** — `waytide/waytide` at `af2f4a9`; `waytide/foundation` at `77cf59a`; the other six component repositories unchanged and in sync.

## A note on the session itself

The prior session ended with an honest non-result: the notice could not be verified from inside a session that was itself about Waytide. This session did not solve that problem so much as step around it — the mechanism was installed into a project that knows nothing about Waytide, where the notice either appears or does not, and no interpretation is required. The observation problem was never in the notice; it was in the choice of where to stand while looking at it.

The rest of the session has a single shape repeated. Each step began with something that appeared finished — the work confirmed, the change committed, the install tested, the package ready to publish — and each time the remaining gap was not in the mechanism but in the distance between the machine it was built on and the machine it was for. The ignore case, the consuming-project script paths, the singular form, the unpushed composite: four instances of the same distance, none visible from where the work was done. What made them findable was not care in the abstract but a specific habit — running the thing in a place that had none of the local conditions, and each time naming what the run still had not covered.

---

Authored by Scott Bellware on Thu Jul 23 2026 at 6 PM PT
