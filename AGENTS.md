## Waytide

This is the **Waytide authoring source** — the composite repo where every package
is developed under one shared history, then published to its own component repo by
`git subtree split` (see `CONTRIBUTING.md`). Its layout differs from a project that
*installs* the packages, so this file is hand-maintained for the composite and does
not match the one the installer generates.

**At the start of a session, read every rule file under `rules/` and follow them.**
The rule packages live at the top level of `rules/` — `rules/foundation/`,
`rules/language/`, and so on, including each package's `vocabulary.md` glossary (its
terms are binding and can't be applied unread). Read `rules/foundation/` first; it
defines the framework. The rules override default behavior where they conflict;
explicit user instructions still win.

The `waytide/` directory holds this project's own working state — `log/`,
`deferred/`, `observations/`, `design/`, `plans/`, `sessions/`, `loops/`,
`experiments/` — worked with as their conventions describe, not read as binding
rules at session start. (In a consuming project the installed packages live under
`waytide/rules/`; here in the source they are at `rules/`, and `waytide/` carries
working state only.)

**Do not run `rules/foundation/install.sh` in this repo.** It installs the packages
into a *consuming* project and generates that project's `waytide/rules/` AGENTS.md.
Running it here would append the consuming-project bootstrap to this file.
