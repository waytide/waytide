## Waytide

This is the **Waytide authoring source** — the composite repo where every package
is developed under one shared history, then published to its own component repo by
`git subtree split` (see `CONTRIBUTING.md`). Its layout differs from a project that
*installs* the packages, so this file is hand-maintained for the composite and does
not match the one the installer generates.

**At the start of a session, read every rule file under `system/` and follow them.**

The rule packages live at the top level of `system/` — `system/foundation/`,
`system/language/`, and so on, including each package's `vocabulary.md` glossary (its
terms are binding and can't be applied unread). Read `system/foundation/` first; it
defines the system. The rules override default behavior where they conflict;
explicit user instructions still win.

**The session-start notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in `.claude/settings.json` runs `system/foundation/session-start.sh`,
which reads the package directories actually present and emits the
`Waytide installed at system/ — N packages: …` notice, closing with a line telling the
developer to type `load waytide` — the command that asks for the read instruction the hook
carries to be acted on now; `system/foundation/statusline.sh`
keeps the system's presence in the status line for the rest of the session, beside the
working directory, branch, and any uncommitted, untracked, or unpushed work. Setting the
`WAYTIDE_QUIET` environment variable to any non-empty value silences both. In a consuming
project `install.sh` places the equivalent `.claude/settings.json`; here in the source it
is committed like this file.

The `local/` directory holds this project's own working state — `log/`,
`deferred/`, `design/`, `plans/`, `sessions/`, `experiments/` — worked with as their
conventions describe, not read as binding rules at session start.

**This repository drops the `waytide/` wrapper that a consuming project has.** There,
the two directories sit under it — `waytide/system/` for the installed packages and
`waytide/local/` for the project's own work. Here they are at the root, `system/` and
`local/`, for the same reason the packages are: this *is* Waytide, so wrapping it in
its own name says nothing. Every rule states the consuming-project path; read
`waytide/system/` as `system/` and `waytide/local/` as `local/` when applying one here.

`local/migration/` is this repository's own, defined by no rule: the design and execution
records of migrating `constant`'s rules into the Waytide packages, kept because
`CONTRIBUTING.md` still points at its publish runbook. It is a record, not a live
convention.

**Do not run `system/foundation/install.sh` in this repo.** It installs the packages
into a *consuming* project and generates that project's `waytide/system/` AGENTS.md.
Running it here would append the consuming-project bootstrap to this file.

The root `CLAUDE.md` is a one-line `@AGENTS.md` import: Claude Code reads `CLAUDE.md`,
not `AGENTS.md`, so the import is what makes this bootstrap load in a Claude Code session.
In a consuming project `install.sh` places the same `CLAUDE.md` bridge alongside the
generated `AGENTS.md`; here in the source it is hand-maintained like this file.
