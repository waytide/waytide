# Waytide — Phase B Runbook (distribution)

> **⚠️ Rebranded to Waytide (2026-07-19).** The org and repo names below are the **old** ones — this document records the 2026-07-17 release under `eventide-project/agent-norms-*`. The project has since moved to the **`waytide`** org with unprefixed repo names: the composite is `waytide/waytide` and each package is `waytide/<package>`. **Do not push to `eventide-project` / `agent-norms-*`.** The current release plan is the deferred item `agent/deferred/2026-07-19T05-22-32Z-pending-release-republish-all-seven-packages.md`. The split-and-push primitive and the proof step below still apply — substitute the new org and names.

Step-by-step for publishing packages from this composite repo to their component repos. **Gated: run only with explicit go-ahead — every push here writes to a public repo.**

> **Status: the 2026-07-17 release was executed under the old names** — all seven packages were published to `eventide-project/agent-norms-*` and every component repo is on `master`. That release is history; the first Waytide release (fresh repos under `waytide/*`) is the next one. The split-and-push primitive documented here is still the procedure.

## What Phase B does

Each package lives here as a top-level directory under one shared history. A **component repo** holds one package's files at its root and is what consuming projects install. `git subtree split` regenerates a component repo's history from this composite repo's slice of it; the push sends it out. **Sync is one-way: composite → component.** Component repos are downstream-only — never commit to them directly; the next split would orphan or conflict with it.

## Preconditions

1. On `master`, working tree clean: `git -C <composite> status` shows nothing.
2. Raw git can push to the component repos on your existing credential (macOS keychain helper). Confirm with `git ls-remote https://github.com/waytide/foundation.git HEAD` — a hash + `HEAD` at exit 0 means the credential works.
3. **git stays raw.** Every push/pull below is raw `git`. `gh` is used only for the two repo-management actions raw git can't do — rename (step for `language`) and create (step for `design-by-efferent`) — which are GitHub-side API calls that don't alter this repo's git config. **Do not run `gh auth setup-git`** (it rewrites git's credential config). Both actions can be done in the GitHub web UI instead if you prefer no `gh` at all.
4. Run every command from the composite repo root.

## Package → repo map

| Package | Split prefix (composite dir) | Component repo | Install prefix (consumer) | This release |
|---|---|---|---|---|
| foundation | `foundation` | `agent-norms-foundation` | `agent/rules/foundation` | re-publish |
| language | `language` | `agent-norms-language` | `agent/rules/language` | **rename repo + reset** |
| testing | `testing` | `agent-norms-testing` | `agent/rules/testing` | re-publish |
| code/ruby | `code/ruby` | `agent-norms-code-ruby` | `agent/rules/code/ruby` | re-publish |
| git | `git` | `agent-norms-git` | `agent/rules/git` | re-publish |
| design-by-efferent | `design-by-efferent` | `agent-norms-design-by-efferent` | `agent/rules/design-by-efferent` | **new repo** |
| docs | `docs` | `agent-norms-docs` | `agent/rules/docs` | **skip — unchanged** |

## The publish primitive (re-publish, unchanged prefix)

For `foundation`, `testing`, `code/ruby`, `git` — the prefix path is unchanged since the last publish, so the deterministic split **fast-forwards** the component's `master`:

```
PKG=foundation            # or testing, git
DIR=$PKG                  # code/ruby: DIR=code/ruby, REPO=agent-norms-code-ruby
REPO=agent-norms-$PKG

git subtree split --prefix="$DIR" -b publish-tmp
git push "https://github.com/eventide-project/$REPO.git" publish-tmp:master
git branch -D publish-tmp
```

If the push is **rejected (non-fast-forward)**, stop — do not force. It means the component repo diverged (a direct commit, the thing the downstream-only rule forbids). Investigate before proceeding.

### code/ruby note

The split prefix is the composite path `code/ruby`; the repo flattens to `agent-norms-code-ruby`; the consumer install prefix is `agent/rules/code/ruby`. Set `DIR=code/ruby` and `REPO=agent-norms-code-ruby` in the block above.

## The rename case — language (do this one carefully)

`vocabulary/` was renamed to `language/` this session. Two consequences: the GitHub repo must be renamed, and the new `--prefix=language` split is a **different history** than the old `agent-norms-vocabulary` repo held (subtree split follows the exact path, so it starts at the rename — it does not share the old synthetic commits). So this repo **resets**, not fast-forwards.

```
# 1. Rename the repo (GitHub keeps a redirect from the old name)
gh repo rename agent-norms-language -R waytide/vocabulary

# 2. Regenerate and force-push (history reset is expected and acceptable)
git subtree split --prefix=language -b publish-tmp
git push --force "https://github.com/waytide/language.git" publish-tmp:master
git branch -D publish-tmp
```

**Why the force is safe here:** component repos are regenerated artifacts, not authoring sources, and per the state-of-the-work note there are no real consumers yet (each prior publish was proved only with a throwaway project). The reset costs nothing real. If a consumer had installed `agent-norms-vocabulary`, they would re-add under the new name — note it if that ever changes.

## The new-repo case — design-by-efferent

```
gh repo create waytide/design-by-efferent --public \
  -d "Waytide — Design By Efferent: the human-in-the-loop, efferent-first design method"

git subtree split --prefix=design-by-efferent -b publish-tmp
git push "https://github.com/waytide/design-by-efferent.git" publish-tmp:master
git branch -D publish-tmp
```

## Prove each pull

After each publish, confirm the package installs correctly by pulling it into a throwaway project (does not touch the component repo):

```
PKG=foundation; REPO=agent-norms-$PKG; INSTALL=agent/rules/$PKG   # adjust for code/ruby, language
D=$(mktemp -d); git -C "$D" init -q
git -C "$D" subtree add --prefix "$INSTALL" \
  "https://github.com/eventide-project/$REPO.git" master --squash
ls "$D/$INSTALL"        # expect the package's rules + README.md (+ install-dependencies.sh / log/ where present)
rm -rf "$D"
```

Check: files present with names intact, `install-dependencies.sh` present for packages with dependencies (`language`, `testing`, `code/ruby`, `design-by-efferent`), no `log/` for packages whose log is empty (`foundation`, `code/ruby`, `git`), `log/` present for `testing`, `language`, `design-by-efferent`.

## Suggested order

Include-order, so a later package's proof can pull its dependencies if you want to check include resolution: **foundation → language → testing → code/ruby → git → design-by-efferent**. Publishing order is not strictly required (repos are independent), but this keeps the mental model clean. `docs` is skipped.

## After all publishes

1. Log a composite `agent/log/` entry per re-publish/publish (or one entry covering the batch), recording what shipped — consistent with the earlier per-package publish logs.
2. Update the state-of-the-work note: all seven packages published, none carrying unpublished changes, `agent-norms-language` live.
3. The classification table and packaging design still say `agent-norms-vocabulary` in the repo list — conform to `agent-norms-language`.

## Nothing here is run without go-ahead

Every `gh repo` and `git push` command writes to public infrastructure. Present, confirm, then run.
