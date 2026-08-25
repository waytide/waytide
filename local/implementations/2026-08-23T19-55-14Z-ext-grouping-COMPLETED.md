# Feature — The `ext/` Grouping

## Intent

**The directory that groups Waytide's extensions and externals is `ext/`.** It is `tools/` today, and one Open idea proposed `tool/` in its place. `ext/` displaces the two. The word covers an external — something Waytide did not write and does not govern — and an extension — something that adds to Waytide for one stack or one kind of project. The grouping holds both, and no narrower word does.

- **State:** Completed
- **Tags:** [feature]

## Setup

- **Upstream branch:** `master`
- **Implementation branch:** `feature/ext-grouping`
- **Base:** `720b2a864f790f11bcc8cdae2776870b877af4b5`, from `master`
- **Working location:** branch only. This working tree switches back to `master` at the conclusion.

**No forecast is stated.** A feature is built to an intent rather than to a question, so there is nothing to predict and nothing to compare a prediction against. See the implementations-convention.

## Confirmations

- **2026-08-23 — Working location: branch only.** Put through the selection interface at the start, with branch and worktree and the current branch offered beside it. The engineer selected branch only.
- **2026-08-23 — Participation: unattended.** Put through the selection interface at the same gate, in the words the attended-or-unattended-is-chosen-at-the-start rule fixes. The engineer selected unattended. The agent decides each hinge and generates through, and the plan was presented before the work began.

## What this realizes

- *The grouping is `ext/`, for external and extension both*

## What this supersedes

- *The grouping is `tool/`, not a language* — the two ideas name each other, and the earlier one takes `**State:** Superseded`.

## Scope

**The composite's own naming.** The grouping is named in this repository's prose, its scripts, and the package rules that give it as an example. Those are what this feature changes.

**A historical record keeps `tools/`.** The decision log, the completed Tool-Specific Distribution record, its loop record, and the Ruby package's migration record state what was true when they were written. See the disclosure-is-the-one-reason-to-edit-a-historical-record rule.

**An idea is amended rather than rewritten.** A settled idea's prose keeps its wording and its date. What changes is the state line, and a dated addition says what changed.

**No repository is renamed.** The Ruby package declares its repository as `waytide-ruby`, which `install` already carries and which the flattening does not produce. So the path's name and the repository's name are independent here, and only the first moves.

**`install` keeps accepting `tools/ruby-lang`.** It already accepted the two names before this feature. The alias costs one line, and an install naming the old path still resolves to the right repository.

## 2026-08-23 — the scope widened, on the engineer's instruction

**Two decisions taken unattended are reversed by it.** The original wording stands above rather than being rewritten, and this states what changed.

- **`install` accepts `ext/ruby-lang` alone.** The alias is removed. The instruction is that `tools/` disappears from Waytide entirely, and an accepted old name is the grouping still being there.
- **The consuming projects are migrated.** The installed directory moves from `waytide/system/tools/ruby-lang` to `waytide/system/ext/ruby-lang`.

**A third repository is in the transition, and it was in no earlier reading of the scope.** The Ruby package's own `install.sh`, in `waytide/waytide-ruby`, carries `prefix="waytide/system/tools/ruby-lang"`. That repository is authored directly and nothing splits into it, so the installed path cannot move without a change there.

**So the transition crosses three parties** — this composite, `waytide/waytide-ruby`, and each project that holds the package. It is sequenced in the migration record *The `tools/` grouping becomes `ext/`*.

**The suite fails in between, by design.** `test/automated/tool-specific-distribution.sh` fetches the Ruby package's installer from `master` and asserts the installed layout. It expects `ext` from this commit and the installer still places `tools`, so it fails until that repository is changed. The migration record carries the order.

---
Authored by Scott Bellware on Sun Aug 23 2026 at 12:55:14 PM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:09:22 PM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:41:07 PM PT
