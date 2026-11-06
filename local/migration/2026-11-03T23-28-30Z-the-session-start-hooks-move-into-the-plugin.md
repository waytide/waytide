# The session-start hooks move into the plugin

The hooks that start a Waytide session move from a project's `.claude/settings.json` into the Slasher plugin, at `.claude/skills/slasher/`. That is the `SessionStart` hook, which prints the session-start notice and carries the read instruction, and the `UserPromptSubmit` hook, which prints the startup display on `load waytide` and `/load`. The plugin's `SessionStart` hook now prints the startup display too, ahead of the notice, in one message. `.claude/settings.json` keeps only the status line, because a plugin cannot set the main status line.

**As the engineer stated it:** reverse that decision and shift the actuation of the initialization in whole to the plugin's SessionStart hook.

## Source and destination

- **Source:** the `hooks` key of `.claude/settings.json`, with its `SessionStart` and `UserPromptSubmit` entries, which run `foundation/session-start.sh` and `foundation/startup-display.sh`.
- **Destination:** `hooks/hooks.json` in the plugin, assembled from `foundation/plugin/`, with two scripts beside it that locate the installed system and run the same two foundation scripts.
- **Stays:** the `statusLine` key of `.claude/settings.json`.

## Increments

1. `foundation/plugin/` holds the plugin's own parts: its manifest, its `hooks/hooks.json`, and the two hook scripts. The assembly copies it, then each active package's skills.
2. The assembly moves out of `install.sh` into `foundation/assemble-plugin.sh`, which `install.sh` runs and which `compile.sh` runs in this repository.
3. `session-start.sh` prints the startup display ahead of the notice, in the one message.
4. `install.sh` writes a new `.claude/settings.json` with the status line alone. Where an existing file still carries the hooks, it prints which keys to remove. It modifies no existing file, as before.
5. This repository's `.claude/settings.json` loses its hooks, and its plugin is assembled and committed.
6. The rules that describe the wiring are conformed: the session-start notice rule, the startup display rule, and the plugin rule. `AGENTS.md` and the bootstrap text `install.sh` writes are conformed too.

## In between

- **This repository:** the main working tree stays on `master`, wired by its `.claude/settings.json` hooks, until the feature merges. A session in the feature's worktree is wired by the plugin from increment 5.
- **A consuming project:** until the engineer removes the hooks from its `.claude/settings.json`, the plugin and the settings both run the session-start scripts. The notice and the read instruction then print twice. That is duplicated, not lost, and the installer's message names the keys to remove.
- **Authoritative:** the plugin's hooks, from increment 1 on.

## What happened

- Increments 1 to 5 were carried out in this repository on 2026-11-04, in the feature's phase branch. `refresh-packages.sh` runs `assemble-plugin.sh` too, and reports that the plugin is reassembled. Where `.claude/settings.json` still runs the session-start scripts, both `install.sh` and `refresh-packages.sh` name the entries to remove.
- The `UserPromptSubmit` hook moved with the `SessionStart` hook. The engineer selected that the display prints at session start and again on `load waytide` and `/load`.
- The startup display rule no longer says the display prints once per session, so the engineer named it the-startup-display-prints-as-the-session-starts. It was the-startup-display-prints-once-per-session.
- Increment 6 conformed the three rules, `AGENTS.md`, and the bootstrap text.
- No consuming project has been changed. Each changes at its next install or refresh.

---

Authored by Scott Bellware on Tue Nov 3 2026 at 3:28:30 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:37:47 AM PT
