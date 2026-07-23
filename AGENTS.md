## Waytide

This is the **Waytide authoring source** — the composite repo where every package
is developed under one shared history, then published to its own component repo by
`git subtree split` (see `CONTRIBUTING.md`). Its layout differs from a project that
*installs* the packages, so this file is hand-maintained for the composite and does
not match the one the installer generates.

**At the start of a session, read every rule file under `framework/` and follow them.**

The rule packages live at the top level of `framework/` — `framework/foundation/`,
`framework/language/`, and so on, including each package's `vocabulary.md` glossary (its
terms are binding and can't be applied unread). Read `framework/foundation/` first; it
defines the framework. The rules override default behavior where they conflict;
explicit user instructions still win.

**The load notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in `.claude/settings.json` runs `framework/foundation/session-start.sh`,
which reads the package directories actually present and emits the one-line
`Waytide loaded from framework/ — N packages: …` notice; `framework/foundation/statusline.sh`
carries the same count in the status line for the rest of the session. Setting the
`WAYTIDE_QUIET` environment variable to any non-empty value silences both. In a consuming
project `install.sh` places the equivalent `.claude/settings.json`; here in the source it
is committed like this file.

The `waytide/` directory holds this project's own working state — `log/`,
`deferred/`, `observations/`, `design/`, `plans/`, `sessions/`, `loops/`,
`experiments/` — worked with as their conventions describe, not read as binding
rules at session start. (In a consuming project the installed packages live under
`waytide/framework/`; here in the source they are at `framework/`, and `waytide/` carries
working state only.)

**Do not run `framework/foundation/install.sh` in this repo.** It installs the packages
into a *consuming* project and generates that project's `waytide/framework/` AGENTS.md.
Running it here would append the consuming-project bootstrap to this file.

The root `CLAUDE.md` is a one-line `@AGENTS.md` import: Claude Code reads `CLAUDE.md`,
not `AGENTS.md`, so the import is what makes this bootstrap load in a Claude Code session.
In a consuming project `install.sh` places the same `CLAUDE.md` bridge alongside the
generated `AGENTS.md`; here in the source it is hand-maintained like this file.
