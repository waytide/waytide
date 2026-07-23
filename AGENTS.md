## Waytide

This is the **Waytide authoring source** — the composite repo where every package
is developed under one shared history, then published to its own component repo by
`git subtree split` (see `CONTRIBUTING.md`). Its layout differs from a project that
*installs* the packages, so this file is hand-maintained for the composite and does
not match the one the installer generates.

**At the start of a session, before responding to the first prompt, read every rule file
under `framework/` and follow them.** The first prompt arrives together with this file;
read the rules and print the notice below before answering it, rather than treating the
session-start reading as preamble to get to later.

The rule packages live at the top level of `framework/` — `framework/foundation/`,
`framework/language/`, and so on, including each package's `vocabulary.md` glossary (its
terms are binding and can't be applied unread). Read `framework/foundation/` first; it
defines the framework. The rules override default behavior where they conflict;
explicit user instructions still win.

**After reading the rules, and before answering the first prompt, print a one-line
notice that Waytide is loaded and which packages are present** — for example:
`Waytide loaded from framework/ — 7 packages: foundation, language, testing,
design-by-efferent, code/ruby, git, plan`. List the package directories actually
present under `framework/`, named and counted. The notice comes before the response
to what was asked, not after it. Skip the notice when the `WAYTIDE_QUIET`
environment variable is set to any non-empty value.

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
