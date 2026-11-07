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
3. **The machine paths.** Every script reads `~/.config/slasher/` and `~/.local/share/slasher/`.
4. **The prose.** The rules, the vocabularies, the help, the READMEs, `CONTRIBUTING.md`, `AGENTS.md`, and the scripts' messages say Slasher and name the new paths. Each changed rule is compiled.
5. **The repositories.** The engineer renames the GitHub organization and the two repositories. Then every URL in this repository names `github.com/slasher-bot/`, and this repository's `origin` remote follows.

## What is true in between

- **Until the feature merges, `master` is unchanged.** It says Waytide, reads `waytide/`, and names `github.com/waytide/`. The feature branch is authoritative only for the rename.
- **Between the first increment and the fourth, the branch's scripts read `slasher/` while its prose still names `waytide/`.** The scripts are authoritative for the paths.
- **Between the organization rename and the URL change, the URLs in this repository name the old organization.**

## Not yet settled

- Whether the machine paths are moved where they exist under the old name, as the project layout is, or only read under the new name.
- Whether the plugin, already named Slasher, keeps its name now that the product shares it.

## What happened

- **2026-11-06** — The engineer renamed the GitHub organization `waytide` to `slasher-bot`, with the display name Slasher. This came ahead of the first increment, so the repositories step is under way before the scripts change. Every URL in this repository still names `github.com/waytide/`. The repositories `waytide` and `waytide-ruby` keep their names for now, as `slasher-bot/waytide` and `slasher-bot/waytide-ruby`.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 5:26:11 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 5:32:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 6:04:30 PM PT
