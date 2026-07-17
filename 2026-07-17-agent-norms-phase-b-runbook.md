# Agent Norms — Phase B Runbook (distribution)

Step-by-step for publishing packages from this composite repo to their component repos. Phase A (authoring) is complete for all seven packages; this is the release. **Gated: run only with explicit go-ahead — every push here writes to a public repo under `eventide-project`.**

## What Phase B does

Each package lives here as a top-level directory under one shared history. A **component repo** holds one package's files at its root and is what consuming projects install. `git subtree split` regenerates a component repo's history from this composite repo's slice of it; the push sends it out. **Sync is one-way: composite → component.** Component repos are downstream-only — never commit to them directly; the next split would orphan or conflict with it.

## Preconditions

1. On `master`, working tree clean: `git -C <composite> status` shows nothing.
2. `gh auth status` logged in, and the account can **push to `eventide-project`** (org membership / write access — confirm this; `gh` being authenticated as `sbellware` does not by itself prove org write access).
3. `gh auth setup-git` has run once, so `git push https://github.com/...` uses the gh credential.
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

For `foundation`, `testing`, `code/ruby`, `git` — the prefix path is unchanged since the last publish, so the deterministic split **fast-forwards** the component's `main`:

```
PKG=foundation            # or testing, git
DIR=$PKG                  # code/ruby: DIR=code/ruby, REPO=agent-norms-code-ruby
REPO=agent-norms-$PKG

git subtree split --prefix="$DIR" -b publish-tmp
git push "https://github.com/eventide-project/$REPO.git" publish-tmp:main
git branch -D publish-tmp
```

If the push is **rejected (non-fast-forward)**, stop — do not force. It means the component repo diverged (a direct commit, the thing the downstream-only rule forbids). Investigate before proceeding.

### code/ruby note

The split prefix is the composite path `code/ruby`; the repo flattens to `agent-norms-code-ruby`; the consumer install prefix is `agent/rules/code/ruby`. Set `DIR=code/ruby` and `REPO=agent-norms-code-ruby` in the block above.

## The rename case — language (do this one carefully)

`vocabulary/` was renamed to `language/` this session. Two consequences: the GitHub repo must be renamed, and the new `--prefix=language` split is a **different history** than the old `agent-norms-vocabulary` `main` (subtree split follows the exact path, so it starts at the rename — it does not share the old synthetic commits). So this repo **resets**, not fast-forwards.

```
# 1. Rename the repo (GitHub keeps a redirect from the old name)
gh repo rename agent-norms-language -R eventide-project/agent-norms-vocabulary

# 2. Regenerate and force-push (history reset is expected and acceptable)
git subtree split --prefix=language -b publish-tmp
git push --force "https://github.com/eventide-project/agent-norms-language.git" publish-tmp:main
git branch -D publish-tmp
```

**Why the force is safe here:** component repos are regenerated artifacts, not authoring sources, and per the handoff there are no real consumers yet (each prior publish was proved only with a throwaway project). The reset costs nothing real. If a consumer had installed `agent-norms-vocabulary`, they would re-add under the new name — note it if that ever changes.

## The new-repo case — design-by-efferent

```
gh repo create eventide-project/agent-norms-design-by-efferent --public \
  -d "Agent Norms — Design By Efferent: the human-in-the-loop, efferent-first design method"

git subtree split --prefix=design-by-efferent -b publish-tmp
git push "https://github.com/eventide-project/agent-norms-design-by-efferent.git" publish-tmp:main
git branch -D publish-tmp
```

## Prove each pull

After each publish, confirm the package lands correctly by pulling it into a throwaway project (does not touch the component repo):

```
PKG=foundation; REPO=agent-norms-$PKG; INSTALL=agent/rules/$PKG   # adjust for code/ruby, language
D=$(mktemp -d); git -C "$D" init -q
git -C "$D" subtree add --prefix "$INSTALL" \
  "https://github.com/eventide-project/$REPO.git" main --squash
ls "$D/$INSTALL"        # expect the package's rules + package.md + README.md (+ log/ where present)
rm -rf "$D"
```

Check: files present with names intact, `package.md` `include:` line correct, no `log/` for packages whose log is empty (`foundation`, `code/ruby`, `git`), `log/` present for `testing`, `language`, `design-by-efferent`.

## Suggested order

Include-order, so a later package's proof can pull its dependencies if you want to check include resolution: **foundation → language → testing → code/ruby → git → design-by-efferent**. Publishing order is not strictly required (repos are independent), but this keeps the mental model clean. `docs` is skipped.

## After all publishes

1. Log a composite `agent/log/` entry per re-publish/publish (or one entry covering the batch), recording what shipped — consistent with the earlier per-package publish logs.
2. Update the handoff: all seven packages published, none carrying unpublished changes, `agent-norms-language` live.
3. The classification table and packaging design still say `agent-norms-vocabulary` in the repo list — conform to `agent-norms-language`.

## Nothing here is run without go-ahead

Every `gh repo` and `git push` command writes to public infrastructure. Present, confirm, then run.
