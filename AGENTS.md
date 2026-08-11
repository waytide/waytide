## Waytide

This is the **Waytide authoring source**. It is the composite repo where every package
is developed under one shared history, then published to its own component repo by
`git subtree split`. See `CONTRIBUTING.md`. Its layout differs from a project that
*installs* the packages. So this file is hand-maintained for the composite, and does not
match the one the installer generates.

**At the start of a session, read every rule file under `system/` and under `local/rules/`.
Read `local/vocabulary.md` too, which is this project's own vocabulary. Follow them.** That file
does not exist here yet, and its absence is ordinary. It is named unconditionally for the same
reason `local/rules/` is. `local/rules/` was empty here until 2026-08-04, and was named unconditionally
anyway, because the read instruction and the binding rule name it without a condition. That
is why its first rule needed no change to this file beyond this sentence.

The rule packages live at the top level of `system/`: `system/foundation/`,
`system/language/`, and so on. Each package's `vocabulary.md` glossary is included where it
has one, and its terms are binding and cannot be applied unread. Not every package has one, and
its absence is not a defect. Read `system/foundation/` first. It
defines the system. The rules override default behavior where they conflict.
Explicit user instructions still win.

**The session-start notice is printed by the harness, not by you — do not print one.** A `SessionStart` hook in `.claude/settings.json` runs `system/foundation/session-start.sh`. That script reads the package directories actually present and emits the `Waytide installed at system/ — N packages: …` notice. The notice closes with a line telling the engineer to type `load waytide`. That command asks for the read instruction the hook carries to be acted on now. `system/foundation/statusline.sh`
keeps the system's presence in the status line for the rest of the session. It sits beside the
working directory, the branch, and any uncommitted, untracked, or unpushed work. Neither can be
silenced. In a consuming project `install.sh` places the equivalent `.claude/settings.json`. Here in the source it
is committed like this file.

The `local/` directory holds this project's own working state. That is `log/`,
`deferred/`, `aspiration/`, `intention/`, `work-sessions/`, and `experiments/`. They are worked
with as their conventions describe, not read as binding rules at session start.

**This repository drops the `waytide/` wrapper that a consuming project has.** There,
the two directories sit under it — `waytide/system/` for the installed packages and
`waytide/local/` for the project's own work. Here they are at the root, `system/` and `local/`, for the same reason the packages are. This *is* Waytide, so wrapping it in
its own name says nothing. Every rule states the consuming-project path. Read
`waytide/system/` as `system/` and `waytide/local/` as `local/` when applying one here.

`local/migration/` is now defined by a rule, foundation's migration-convention. That rule makes it
the place every Waytide project writes execution plans for transitions of content across a
repository boundary. What it holds *here* is one such transition: the design and execution
records of migrating `constant`'s rules into the Waytide packages. **Its files predate the
convention** and keep their date-only names, since a datetime is not revised to a resolution it
never had. New records take the ISO-8601-UTC prefix. `CONTRIBUTING.md` still points at its
phase-B runbook for the publish procedure — a live procedure sitting in a historical record,
which wants relocating.

**Do not run `system/foundation/install.sh` in this repo.** It installs the packages
into a *consuming* project and generates that project's `waytide/system/` AGENTS.md.
Running it here would append the consuming-project bootstrap to this file.

The root `CLAUDE.md` is a one-line `@AGENTS.md` import. Claude Code reads `CLAUDE.md`,
not `AGENTS.md`, so the import is what makes this bootstrap load in a Claude Code session.
In a consuming project `install.sh` places the same `CLAUDE.md` bridge alongside the
generated `AGENTS.md`. Here in the source it is hand-maintained like this file.
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:37:36 PM PT
