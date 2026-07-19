# Agent Norms — Phase B Checklist (exact commands, in order)

Literal command sequence for the runbook (`2026-07-17-agent-norms-phase-b-runbook.md`). Run top to bottom. Every `gh repo` and `git push` writes to public infrastructure — **run only on go-ahead.** Each command block is one step; the comment after a command says what to expect.

> **Status: executed 2026-07-17.** This ran once end to end — all seven repos are published and on `master`. Steps 2 (rename) and 6 (create) were one-time; a future re-publish of a single package is just its split-and-push-to-`master` block plus the prove-the-pull.

## 0 — Preflight

- [ ] Move to the composite repo and confirm clean state on `master`:
```
cd /Users/sbellware/projects/eventide/agent-norms
git symbolic-ref --short HEAD      # expect: master
git status                         # expect: nothing to commit, working tree clean
```
- [ ] Confirm credentialed access with raw git (credentials come from the macOS keychain helper — no `gh` needed):
```
git ls-remote https://github.com/eventide-project/agent-norms-foundation.git HEAD
```
Expect a commit hash followed by `HEAD`, exit 0. If it prompts for a username/password or errors, fix the stored credential before continuing.

> **SSH instead of HTTPS?** If you push over SSH, swap every `https://github.com/eventide-project/<repo>.git` URL below for `git@github.com:eventide-project/<repo>.git`.

> **git stays raw; `gh` only touches GitHub.** Every push and pull below is raw `git` on your keychain credential — unchanged. `gh` is used for exactly two things raw git can't do: rename a repo (step 2) and create one (step 6). Both are GitHub-side API calls that do **not** add a remote or alter credentials in this repo. **Do not run `gh auth setup-git`** — that is the one `gh` command that rewrites git's credential config, and it is deliberately omitted. If you'd rather not use `gh` at all, do those two actions in the GitHub web UI instead (noted inline).

## 1 — foundation (re-publish)

- [ ] Split and push:
```
git subtree split --prefix=foundation -b split-foundation
git push https://github.com/eventide-project/agent-norms-foundation.git split-foundation:master
git branch -D split-foundation
```
- [ ] Prove the pull:
```
rm -rf /tmp/prove-foundation
git init /tmp/prove-foundation
git -C /tmp/prove-foundation commit --allow-empty -m init
git -C /tmp/prove-foundation subtree add --prefix agent/rules/foundation https://github.com/eventide-project/agent-norms-foundation.git master --squash
ls /tmp/prove-foundation/agent/rules/foundation      # expect rules + README.md, no log/
rm -rf /tmp/prove-foundation
```

## 2 — language (rename repo, then reset)

`vocabulary/` → `language/` changed the split path, so this repo **resets** (force-push). Rename first.

- [ ] Rename the GitHub repo (GitHub-side only — does not touch this repo's git config):
```
gh repo rename agent-norms-language -R eventide-project/agent-norms-vocabulary
```
Web-UI alternative: `github.com/eventide-project/agent-norms-vocabulary` → Settings → rename to `agent-norms-language`. GitHub keeps a redirect from the old name either way.
- [ ] Split and force-push (history reset is expected):
```
git subtree split --prefix=language -b split-language
git push --force https://github.com/eventide-project/agent-norms-language.git split-language:master
git branch -D split-language
```
- [ ] Prove the pull:
```
rm -rf /tmp/prove-language
git init /tmp/prove-language
git -C /tmp/prove-language commit --allow-empty -m init
git -C /tmp/prove-language subtree add --prefix agent/rules/language https://github.com/eventide-project/agent-norms-language.git master --squash
ls /tmp/prove-language/agent/rules/language          # expect 14 rules + README.md + log/
rm -rf /tmp/prove-language
```

## 3 — testing (re-publish)

- [ ] Split and push:
```
git subtree split --prefix=testing -b split-testing
git push https://github.com/eventide-project/agent-norms-testing.git split-testing:master
git branch -D split-testing
```
- [ ] Prove the pull:
```
rm -rf /tmp/prove-testing
git init /tmp/prove-testing
git -C /tmp/prove-testing commit --allow-empty -m init
git -C /tmp/prove-testing subtree add --prefix agent/rules/testing https://github.com/eventide-project/agent-norms-testing.git master --squash
ls /tmp/prove-testing/agent/rules/testing            # expect rules + README.md + log/
rm -rf /tmp/prove-testing
```

## 4 — code/ruby (re-publish)

Split prefix is the nested path `code/ruby`; the repo is `agent-norms-code-ruby`; the install path is `agent/rules/code/ruby`.

- [ ] Split and push:
```
git subtree split --prefix=code/ruby -b split-code-ruby
git push https://github.com/eventide-project/agent-norms-code-ruby.git split-code-ruby:master
git branch -D split-code-ruby
```
- [ ] Prove the pull:
```
rm -rf /tmp/prove-code-ruby
git init /tmp/prove-code-ruby
git -C /tmp/prove-code-ruby commit --allow-empty -m init
git -C /tmp/prove-code-ruby subtree add --prefix agent/rules/code/ruby https://github.com/eventide-project/agent-norms-code-ruby.git master --squash
ls /tmp/prove-code-ruby/agent/rules/code/ruby        # expect rules + README.md, no log/
rm -rf /tmp/prove-code-ruby
```

## 5 — git (re-publish)

- [ ] Split and push:
```
git subtree split --prefix=git -b split-git
git push https://github.com/eventide-project/agent-norms-git.git split-git:master
git branch -D split-git
```
- [ ] Prove the pull:
```
rm -rf /tmp/prove-git
git init /tmp/prove-git
git -C /tmp/prove-git commit --allow-empty -m init
git -C /tmp/prove-git subtree add --prefix agent/rules/git https://github.com/eventide-project/agent-norms-git.git master --squash
ls /tmp/prove-git/agent/rules/git                    # expect rules + README.md, no log/
rm -rf /tmp/prove-git
```

## 6 — design-by-efferent (new repo)

- [ ] Create the repo (GitHub-side only — does not touch this repo's git config):
```
gh repo create eventide-project/agent-norms-design-by-efferent --public -d "Agent Norms — Design By Efferent: the human-in-the-loop, efferent-first design method"
```
Web-UI alternative: New repository → owner `eventide-project`, name `agent-norms-design-by-efferent`, Public, **no** README / .gitignore / license (it must be empty so the split pushes cleanly to `master`).
- [ ] Split and push:
```
git subtree split --prefix=design-by-efferent -b split-dbe
git push https://github.com/eventide-project/agent-norms-design-by-efferent.git split-dbe:master
git branch -D split-dbe
```
- [ ] Prove the pull:
```
rm -rf /tmp/prove-dbe
git init /tmp/prove-dbe
git -C /tmp/prove-dbe commit --allow-empty -m init
git -C /tmp/prove-dbe subtree add --prefix agent/rules/design-by-efferent https://github.com/eventide-project/agent-norms-design-by-efferent.git master --squash
ls /tmp/prove-dbe/agent/rules/design-by-efferent     # expect rules + vocabulary.md + README.md + log/
rm -rf /tmp/prove-dbe
```

## 7 — After all publishes (authoring, back in the composite repo)

- [ ] Add a composite `agent/log/` entry recording the Phase B batch (what shipped, the language reset, the new DBE repo).
- [ ] Update the state-of-the-work note: all seven packages published, none carrying unpublished changes, `agent-norms-language` live.
- [ ] Conform `agent-norms-vocabulary` → `agent-norms-language` in the packaging design and classification table repo lists.
- [ ] Commit those doc updates.

## If a push is rejected (non-fast-forward)

Applies to steps 1, 3, 4, 5 (the plain re-publishes — these must fast-forward). **Do not add `--force`.** A rejection means the component repo received a direct commit, which the downstream-only rule forbids. Stop and investigate that repo before continuing. (Step 2 force-pushes by design; that is the only intended force.)
