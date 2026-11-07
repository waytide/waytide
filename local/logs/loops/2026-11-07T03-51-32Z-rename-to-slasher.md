# Loop record — Waytide is renamed Slasher

The feature `2026-11-06T21-42-05Z-rename-to-slasher` renames Waytide to Slasher, following the migration record `2026-11-07T01-26-11Z-waytide-is-renamed-slasher`. The first increment, the scripts reading `slasher/`, was mechanical and passed no hinge, because the item had already settled the directory's name. This record starts with the second increment: the installer moves a consuming project's `waytide/` to `slasher/`.

**Mode:** attended.

## Cycle 1 — Actuation, outcome 1: an old `waytide/` is moved to `slasher/`

- **Hinge:** how the test actuates the installer so that it moves the directory. An old project's refresh ends by telling the engineer to run `waytide/system/foundation/install.sh agents-md`, and a full install would add a second copy of every package unless the move comes first.
- **Options:** `sh "$installer" agents-md`, the move first in agents-md. `sh "$installer"`, the move first in a full install. `sh "$installer" move-layout`, a subcommand of its own.
- **Decision / chat:** the engineer selected `sh "$installer" agents-md`.

## Cycle 2 — Observation, outcome 1

- **Hinge:** what the test reads after the installer runs.
- **Options:** arrived and gone — the record is under `slasher/local/` and `waytide/` no longer exists. Arrived only. Same text.
- **Decision / chat:** the engineer asked to clarify, then said they did not understand the question. The agent restated it: the test sets up a project with a `waytide/` folder holding one record, runs the installer, and checks the project. The three checks were restated in those terms, with a recommendation of arrived and gone, since a move means the old folder is gone. The engineer selected arrived and gone.

## Cycle 3 — Controls, outcome 1

- **Hinge:** what the project holds before the installer runs.
- **Options:** one record in `waytide/local/items/`. The record and `waytide/system/foundation/` holding the real plugin directory.
- **Decision / chat:** the engineer selected the record and the packages.

## Cycle 4 — Implementation, outcome 1

- **Hinge:** how the move comes about.
- **Options:** a direct, working implementation, `migrate_layout` with the narrow semantics of the installer's other moves. Red, green, refactor.
- **Decision / chat:** the engineer selected the direct implementation.
- **Outcome:** `migrate_layout` in `install.sh` runs before the subtree step and before `AGENTS.md` is placed. It moves `waytide/` to `slasher/` only where `slasher/` is absent, and updates the directory the installer runs from, so `place_plugin` still finds `assemble-plugin.sh`. The automated tests pass. The test is unnamed until the feature's close.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 7:51:32 PM PT
