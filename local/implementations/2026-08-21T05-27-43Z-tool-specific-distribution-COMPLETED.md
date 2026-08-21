# Feature — Tool-Specific Distribution

## Intent

**A tool-named package leaves Waytide's default distribution, and a distribution of its own
installs it along with the rest.** `code/ruby` is the case that exists. What is built here is the
mechanism, and Ruby is the first thing carried by it.

**Renamed on 2026-08-21**, from *Language-Specific Distribution*. The axis is a tool rather than a
language — see *The grouping is `tool/`, not a language*. The creation log entry names the branch
this was started on, and it is left as written.

The idea this realizes is *The Ruby package leaves the default distribution, and a `waytide-ruby`
distribution installs it with the rest*, in `local/ideas/`. That idea is **Open**, and it is open
on the mechanism rather than the direction: whether the distribution is a package with no rules, a
script beside `install-all.sh`, or a repository carrying only an installer. **Those are hinges,
and they are decided in the loop.**

- **State:** Completed
- **Tags:** [feature]

## Setup

- **Upstream branch:** `master`
- **Implementation branch:** `feature/tool-specific-distribution`, renamed from
  `feature/language-specific-distribution` on 2026-08-21
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

## Where it stands

**The five hinges are complete and the work is built.** What it reaches, below, was named at the
start from the idea's own account. What actually changed is in the migration record *The Ruby
package moves to `tools-ruby-lang`* and in the loop record's fourteen cycles.

**The intent widened during the work, and the record says so rather than being rewritten.** It was
written as a package leaving the default distribution. On 2026-08-21 the engineer directed that the
Ruby rules leave the composite entirely and that the `tool/` idea be taken on here, so the package
also moved repositories and changed its installed path to `tools/ruby-lang`.

**2026-08-21 — Completed.** The branch merged into `master`, which is a feature's ordinary
conclusion. `master` was merged in first and the test run against the combined state, so the
combination was exercised before `master` saw it.

**One migration increment is outstanding at the conclusion**, and that is deliberate rather than
an oversight. The migration record's ordering puts it last, and it is the engineer's to run.

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
Changed by Scott Bellware on Thu Aug 20 2026 at 10:58:07 PM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 9:11:01 AM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 9:19:51 AM PT
