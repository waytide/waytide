# Foundation must ship the bootstrap that switches the framework on (root `AGENTS.md`)

Installing the packages via `git subtree` lands rule files under `agent/rules/foundation/`, `agent/rules/testing/`, etc. — but **nothing establishes the session-start behavior that reads them**. The whole framework depends on "read every file in `agent/rules/` at the start of a session and follow them," and that trigger cannot live inside `agent/rules/`: a rule there can't bootstrap the reading of its own directory. It must come from a **root-level `AGENTS.md`** (or `CLAUDE.md`) that the harness auto-loads.

So a fresh project that installs the packages **still won't load the rules** until a root bootstrap file is added. The packages provide the rules and the *description* of the framework (foundation's `agent-rules-convention` even states the read-and-follow instruction) — but not the one file that turns the framework on.

**Confirmed:** `constant`'s root `AGENTS.md` carries the line verbatim ("Read every file in `agent/rules/` at the start of a session and follow them"). Foundation's convention rules were *extracted from* that `AGENTS.md` prose, but the bootstrap pointer stayed at the root, because it has to.

**Draft:** a minimal bootstrap is drafted at `foundation/AGENTS.md.template` — it points at `agent/rules/`, states the override precedence, and defers the framework description to foundation's rules (kept minimal so it can't drift from them).

**Open questions — the delivery mechanism (decide before shipping):**
- **How is it delivered?** Ship the template for consumers to copy to their root; or have `install-dependencies.sh` / `install-all.sh` **offer to create or append** the bootstrap line to the project's root `AGENTS.md`; or just **document** it as a required manual step in foundation's README. (Any is compatible with the drafted content.)
- **`AGENTS.md` vs `CLAUDE.md`.** The `agents.md` standard uses `AGENTS.md`; **Claude Code auto-loads `CLAUDE.md`**. Decide how to cover both — a single `AGENTS.md` plus a note, a `CLAUDE.md` that defers to it, or a symlink.
- **Idempotence / non-clobber.** If the script writes the root file, it must not overwrite a project's existing `AGENTS.md`/`CLAUDE.md` — append the line if absent, leave the rest alone.

**Gated on:** not blocking. `foundation` is already published, so shipping the bootstrap (whichever mechanism) is a `foundation` re-publish (Phase B) once the mechanism is decided — do that with explicit go-ahead.

**Why:** without the bootstrap, the packages are inert in a new project — installing them changes nothing until the root file exists. This is the one piece the distribution currently omits, and it's the piece that makes everything else run.

**How to apply:** when picked up, settle the delivery-mechanism questions above, finalize `foundation/AGENTS.md.template` (or fold its content into an install step / README section), and re-publish `foundation`. Related: foundation's `agent-rules-convention` (states the read-and-follow instruction the bootstrap enables), `install-dependencies.sh` / `install-all.sh` (candidate delivery vehicles), and the packaging design's session-start assumption.
