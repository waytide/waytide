# Foundation must ship the bootstrap that switches the framework on (root `AGENTS.md`)

Installing the packages via `git subtree` lands rule files under `agent/rules/foundation/`, `agent/rules/testing/`, etc. — but **nothing establishes the session-start behavior that reads them**. The whole framework depends on "read every file in `agent/rules/` at the start of a session and follow them," and that trigger cannot live inside `agent/rules/`: a rule there can't bootstrap the reading of its own directory. It must come from a **root-level `AGENTS.md`** (or `CLAUDE.md`) that the harness auto-loads.

So a fresh project that installs the packages **still won't load the rules** until a root bootstrap file is added. The packages provide the rules and the *description* of the framework (foundation's `agent-rules-convention` even states the read-and-follow instruction) — but not the one file that turns the framework on.

**Confirmed:** `constant`'s root `AGENTS.md` carries the line verbatim ("Read every file in `agent/rules/` at the start of a session and follow them"). Foundation's convention rules were *extracted from* that `AGENTS.md` prose, but the bootstrap pointer stayed at the root, because it has to.

**Draft:** a minimal bootstrap is drafted at `foundation/AGENTS.md.template` — it points at `agent/rules/`, states the override precedence, and defers the framework description to foundation's rules (kept minimal so it can't drift from them).

**Settled:** a **single root `AGENTS.md`** covers everything — it is loaded both by the `agents.md` standard and by **Claude Code** (which loads `AGENTS.md` as well as `CLAUDE.md`). No separate `CLAUDE.md` variant, note, or symlink is needed.

**The delivery-mechanism problem — no existing script fits cleanly.** `git subtree` only writes under its prefix (`agent/rules/foundation/`), so the one file that must sit at the project *root* is the one subtree can't place. And the existing scripts map badly onto the job:
- `install-all.sh` (composite-level) installs all seven packages from the project root, so it *could* drop the root `AGENTS.md` as a final step — but it only covers the "install everything" path, and it lives only in the composite repo (the consumer copies it).
- `<package>/install-dependencies.sh` is the wrong layer: only `language` / `testing` / `design-by-efferent` carry one, and it exists to pull a package's *dependencies*, not to bootstrap the root.
- A bare `git subtree add --prefix agent/rules/foundation …` runs **no script at all**.

The crux: **`foundation` owns the bootstrap, but `foundation` is standalone and by convention carries no install script** — so the package responsible for the on-switch has no per-package hook to place it.

**Recommendation:** give **`foundation` its own install script** (e.g. `foundation/install.sh`), breaking the "standalone packages carry no script" convention *deliberately*, because placing the root bootstrap is foundation's responsibility, not a dependency step. That script — `git subtree add` foundation, then create-or-append the root `AGENTS.md` — becomes the single canonical way to install the framework's base, and it directly covers the common "install foundation" path. `install-all.sh` then calls it (or repeats the root step) so the all-in path is covered too; the bare manual `subtree add` path is documented as needing the root file.

**Still open:**
- **Idempotence / non-clobber.** If a script writes the root file, it must not overwrite a project's existing `AGENTS.md` — append the bootstrap line if absent, leave the rest alone.
- Whether `install-all.sh` calls `foundation/install.sh` or just repeats the root-placement step itself.

**Gated on:** not blocking. `foundation` is already published, so shipping the bootstrap (whichever mechanism) is a `foundation` re-publish (Phase B) once the mechanism is decided — do that with explicit go-ahead.

**Why:** without the bootstrap, the packages are inert in a new project — installing them changes nothing until the root file exists. This is the one piece the distribution currently omits, and it's the piece that makes everything else run.

**How to apply:** when picked up, add `foundation/install.sh` (subtree-add foundation + create-or-append the root `AGENTS.md` from the drafted `foundation/AGENTS.md.template`, non-clobbering), have `install-all.sh` cover the root step too, document the manual `subtree add` path in foundation's README, then re-publish `foundation`. Related: foundation's `agent-rules-convention` (states the read-and-follow instruction the bootstrap enables), `install-all.sh` and the per-package `install-dependencies.sh` scripts (the existing install vehicles this extends), the drafted `foundation/AGENTS.md.template`, and the packaging design's session-start assumption.
