# Waytide is renamed Slasher

**This record plans the rename of Waytide to Slasher, in this repository, in the consuming projects' layout, on each machine, and on GitHub.** It realizes the item `2026-10-30T18-25-28Z-waytide-is-renamed-slasher`, which is the source of truth for what is settled. The work runs on the feature `2026-11-06T21-42-05Z-rename-to-slasher`.

## Source and destination

- **The name:** Waytide becomes Slasher in every live, forward-looking text. Historical records keep *Waytide*, because a rename does not reach a historical record.
- **The project layout:** a consuming project's `waytide/system/` and `waytide/local/` become `slasher/system/` and `slasher/local/`. This repository keeps `system/` and `local/` at its root.
- **The machine:** `~/.config/waytide/` becomes `~/.config/slasher/`, and `~/.local/share/waytide/` becomes `~/.local/share/slasher/`.
- **GitHub:** the organization `waytide` becomes `slasher-bot`, since `slasher` is taken. The composite repository `waytide/waytide` becomes `slasher-bot/slasher`, and `waytide/waytide-ruby` becomes `slasher-bot/slasher-ruby`. The package repositories keep their names, as `slasher-bot/foundation`.

## Increments

1. **The project paths in the scripts.** Every script reads `slasher/` where it read `waytide/`. The tests change first, and the scripts follow.
2. **The move of an old layout.** The installer and a refresh move a consuming project's `waytide/` to `slasher/` and regenerate its `AGENTS.md`. The tests change first.
3. **The machine paths.** Every script reads `~/.config/slasher/` and `~/.local/share/slasher/`. The installer moves a machine's old folders to the new names, settled 2026-11-06. Every script and rule that reads them honors `XDG_CONFIG_HOME` and `XDG_DATA_HOME`, falling back to `~/.config` and `~/.local/share`, settled 2026-11-06. Reversed 2026-11-06: the XDG settings are not honored, and the writer-name rule drops its XDG clause in the prose increment.
4. **The prose.** The rules, the vocabularies, the help, the READMEs, `CONTRIBUTING.md`, `AGENTS.md`, and the scripts' messages say Slasher and name the new paths. Each changed rule is compiled. Settled 2026-11-06: the five rules named with waytide are renamed, the `WAYTIDE_` settings become `SLASHER_` settings and the old names are no longer read, and the drafts in `scratch/` change too.
5. **The repositories.** The engineer renames the GitHub organization and the two repositories. Then every URL in this repository names `github.com/slasher-bot/`, and this repository's `origin` remote follows.

## What is true in between

- **Until the feature merges, `master` is unchanged.** It says Waytide, reads `waytide/`, and names `github.com/waytide/`. The feature branch is authoritative only for the rename.
- **Between the first increment and the fourth, the branch's scripts read `slasher/` while its prose still names `waytide/`.** The scripts are authoritative for the paths.
- **Between the organization rename and the URL change, the URLs in this repository name the old organization.**

## Not yet settled

- Whether the machine paths are moved where they exist under the old name, as the project layout is, or only read under the new name. Settled 2026-11-06: the installer moves them.
- Whether the plugin, already named Slasher, keeps its name now that the product shares it. Settled 2026-11-06: it keeps the name.

## What happened

- **2026-11-06** — The engineer renamed the GitHub organization `waytide` to `slasher-bot`, with the display name Slasher. This came ahead of the first increment, so the repositories step is under way before the scripts change. Every URL in this repository still names `github.com/waytide/`. The repositories `waytide` and `waytide-ruby` keep their names for now, as `slasher-bot/waytide` and `slasher-bot/waytide-ruby`.
- **2026-11-06** — The agent renamed `slasher-bot/waytide` to `slasher-bot/slasher` and `slasher-bot/waytide-ruby` to `slasher-bot/slasher-ruby`, with `gh repo rename`, at the engineer's selection. Every URL in this repository still names `github.com/waytide/`.
- **2026-11-06** — The first increment is done. The tests changed first, then the scripts. The increment reached further than the plan named: the plugin's hooks and the skills' instructions run commands by the project path, so they read `slasher/` too, and so do the messages and comments that name the folder. Left for later increments: the `WAYTIDE_ORIGIN` and `WAYTIDE_REGISTRY` settings, the temporary marker files named `waytide-…`, and the status line's `:: Waytide`, for the prose. `~/.config/waytide/`, for the machine paths. The `github.com/waytide/` addresses, for the repositories. The automated tests pass.
- **2026-11-06** — The second increment is done. The installer, in any mode but `bootstrap`, moves a project's `waytide/` to `slasher/` before it does anything else, and leaves both alone where both exist. It replaces an `AGENTS.md` section naming `waytide/system/` with the new one, keeping the text above it. The automated tests pass.
- **2026-11-06** — The third increment's reading half is done. The one script that reads a machine path, `read-consuming-projects.sh`, reads `~/.config/slasher/`. The writer's name and the private journal are read by the agent following rules, so their paths change with the prose. The installer's move of the old machine folders is still to come. The automated tests pass.
- **2026-11-06** — The installer moves a machine's `~/.config/waytide/` and `~/.local/share/waytide/` to the `slasher` names, and leaves both alone where both exist. It first honored the XDG settings, and the engineer then reversed that, so it reads `HOME` only. The XDG test was removed, and the fallback test took its name. The tests that run the installer use a temporary `HOME`. The automated tests pass.
- **2026-11-06** — The third increment is done. A test covers a machine with both the old and the new folder, which the installer leaves alone.
- **2026-11-06** — The fourth increment is done. Waytide became Slasher, `waytide` `slasher`, and `WAYTIDE_` `SLASHER_`, in the rules, the vocabularies, the help, the READMEs, `CONTRIBUTING.md`, `AGENTS.md`, `CLAUDE.md`, the scripts and their messages, the tests, and `scratch/`. Six rules were renamed: the five package rules and the local rule on examples. Left as written: the historical records, each rule's History section, quoted words of the engineer, the installer's handling of the old name and its tests, and the GitHub addresses and the two old repository names, for the repositories increment. The writer-name rule dropped its XDG clause. The automated tests pass.
- **2026-11-06** — The fifth increment is done. Every GitHub address in the live text names `slasher-bot`: `waytide/waytide` became `slasher-bot/slasher`, `waytide-ruby` became `slasher-ruby`, and each package repository is `slasher-bot/<package>`. Each repository answered at its new address. This repository's `origin` remote is `https://github.com/slasher-bot/slasher.git`, which master shares. The automated tests pass. Every increment in the plan is done on the feature branch.
- **2026-11-06** — The feature is completed, and its branch merges into `master`.
- **2026-11-06** — The branch merged into `master`, and the branch and its worktree were removed. On the engineer's machine, the agent moved `~/.config/waytide/` and `~/.local/share/waytide/` to the `slasher` names, at the engineer's selection, since the installer is not run in this repository.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 5:26:11 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 5:32:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 6:04:30 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 6:06:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 7:41:40 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:01:03 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:12:58 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:14:54 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:19:54 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:35:40 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:41:27 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:45:01 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:47 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:50:10 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:17:44 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:19:54 PM PT
