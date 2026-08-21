# Feature — Language-Specific Distribution

## Intent

**A language-named package leaves Waytide's default distribution, and a distribution of its own
installs it along with the rest.** `code/ruby` is the case that exists. What is built here is the
mechanism, and Ruby is the first thing carried by it.

The idea this realizes is *The Ruby package leaves the default distribution, and a `waytide-ruby`
distribution installs it with the rest*, in `local/ideas/`. That idea is **Open**, and it is open
on the mechanism rather than the direction: whether the distribution is a package with no rules, a
script beside `install-all.sh`, or a repository carrying only an installer. **Those are hinges,
and they are decided in the loop.**

- **Tags:** [feature]

## Setup

- **Upstream branch:** `master`
- **Implementation branch:** `feature/language-specific-distribution`
- **Base:** `39765f84322fb09610a2437c334ee3d25b1d3e3a`, from `master`
- **Working location:** branch only. This working tree switches back to `master` at the
  conclusion.

**No forecast is stated.** A feature is built to an intent rather than to a question, so there is
nothing to predict and nothing to compare a prediction against. See the implementations-convention.

## Confirmations

- **2026-08-21 — Working location: branch only.** Put through the selection interface at the
  start, with branch and worktree and the current branch offered beside it. The engineer selected
  branch only.
- **2026-08-21 — Participation: attended.** Put through the selection interface at the same gate,
  in the words the attended-or-unattended-is-chosen-at-the-start rule fixes. The engineer selected
  attended, which is the default. The loop waits at every hinge.

## What this reaches

Named at the start from the idea's own account, and not a plan. What is actually changed is
settled at the hinges.

- **`install-all.sh`** — the only place the package set is asserted rather than read.
- **The root `README.md`** — the package count, the package list, and the Install Waytide section.
- **`CONTRIBUTING.md`** — the publish procedure, if a distribution repository joins the set that is
  split and pushed.
- **`system/code/ruby/README.md`** — its install instructions, if a project reaches it a new way.

**No rule requires `code/ruby`**, so no rule breaks when it leaves the default. The `git`
run-suite-before-commit rule and the `testing` test-tree-command rule each cite it for the Ruby
specifics and each is written to work without it.

---

Authored by Scott Bellware on Thu Aug 20 2026 at 10:27:43 PM PT
