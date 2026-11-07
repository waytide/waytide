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

## Cycle 5 — Actuation, outcome 2: where both `waytide/` and `slasher/` exist, neither is touched

- **Hinge:** how the test actuates the installer for the clash.
- **Options:** `sh "$installer" agents-md`, as in outcome 1, and its negative.
- **Decision / chat:** the engineer selected the same actuation.

## Cycle 6 — Observation, outcome 2

- **Hinge:** what the test reads after the installer runs.
- **Options:** both untouched — the `waytide/` record is still there, the `slasher/` record is still there, and the `waytide/` record did not appear in `slasher/`. The old one kept.
- **Decision / chat:** the engineer asked to clarify, then said they did not understand the question. The agent restated it in terms of the project the test sets up, with a recommendation of both untouched, since *neither is touched* covers both folders. The engineer selected both untouched.

## Cycle 7 — Controls, outcome 2

- **Hinge:** what the project holds before the installer runs.
- **Options:** two records, one in each folder. The two records and the plugin directory in `waytide/system/foundation/`.
- **Decision / chat:** the engineer selected two records.

## Cycle 8 — Implementation, outcome 2

- **Hinge:** none to write. The test passed against the installer as it stood, because `migrate_layout` already carried the clash branch. The test is coverage, not design.
- **Options:** keep the test as coverage, or remove it.
- **Decision / chat:** the engineer kept it.
- **Outcome:** `test/automated/install-layout-move-clash.sh` is in the suite. The automated tests pass. The test is unnamed until the feature's close.

## Cycle 9 — Actuation, outcome 3: the old `AGENTS.md` section is replaced

- **Hinge:** how the test actuates the installer. An old project's `AGENTS.md` carries a section naming `waytide/system/`, and the installer would otherwise ask to add a second section, since it finds no `slasher/system/` in the file.
- **Options:** `sh "$installer" agents-md`, as in outcomes 1 and 2, and its negative.
- **Decision / chat:** the engineer selected the same actuation.

## Cycle 10 — Observation, outcome 3

- **Hinge:** what the test reads in `AGENTS.md` after the installer runs.
- **Options:** the exact file — the project's own line, then the new section as the installer prints it, recommended by the agent. Old gone, new present — the file no longer names `waytide/system/` and does name `slasher/system/`.
- **Decision / chat:** the engineer selected old gone, new present.

## Cycle 11 — Controls, outcome 3

- **Hinge:** what the project holds before the installer runs.
- **Options:** a `waytide/local/` folder and an `AGENTS.md` holding only a stand-in old section. The same, with a line of the project's own text above the section.
- **Decision / chat:** the engineer selected the old section only.

## Cycle 12 — Implementation, outcome 3

- **Hinge:** how the old section comes to be replaced. The test failed against the installer as it stood.
- **Options:** a direct implementation at the start of `place_agents_md`, replacing everything from the `## Waytide` heading to the end of the file where the file names `waytide/system/`. Red, green, refactor.
- **Decision / chat:** the engineer selected the direct implementation.
- **Outcome:** `place_agents_md` replaces the old section and keeps the text above its heading. The automated tests pass. The test is unnamed until the feature's close.

## Cycle 13 — Actuation, outcome 4: a machine's old folders are moved to the `slasher` names

- **Hinge:** how the test actuates the installer so that it moves the folders in a pretend home rather than the engineer's.
- **Options:** a pretend `HOME`, recommended by the agent. The XDG settings `XDG_CONFIG_HOME` and `XDG_DATA_HOME`, read by the installer with a fallback to `HOME`.
- **Decision / chat:** the engineer asked to clarify, then asked whether to start using the XDG variables. The agent recommended against it for this rename: the folders already sit at the XDG defaults, and every reader would have to honor the settings, including the rules the agent follows. The engineer decided that every script and rule reading the machine folders honors the settings, a decision recorded in the rename item. The actuation was then put again with that one candidate, both XDG settings pointing into a temporary home, and its negative. The engineer selected both XDG settings.

## Cycle 14 — Observation, outcome 4

- **Hinge:** what the test reads in the pretend home after the installer runs.
- **Options:** arrived and gone for both folders, recommended by the agent. Arrived only.
- **Decision / chat:** the engineer selected arrived and gone. The engineer asked, while the cycle ran, whether the XDG settings are honored with a fallback to `HOME`. The agent answered that this is what was decided, that none of it was built yet, and that the fallback takes a test of its own.

## Cycle 15 — Controls, outcome 4

- **Hinge:** what the pretend home holds before the installer runs.
- **Options:** one placeholder file in each old folder. The real file names: `consuming-projects.toml` and `user`, and a journal entry.
- **Decision / chat:** the engineer selected one file in each.

## Cycle 16 — Implementation, outcome 4

- **Hinge:** how the move comes about. The test failed against the installer as it stood. The agent noted that six other tests run the installer without a pretend home, so once the installer moves the machine folders, a suite run would move the engineer's own.
- **Options:** a direct implementation, `migrate_machine`, called after `migrate_layout`, with the six tests run under a temporary `HOME` and empty XDG settings. Red, green, refactor.
- **Decision / chat:** the engineer selected the direct implementation.
- **Outcome:** `migrate_machine` moves `waytide` to `slasher` under `XDG_CONFIG_HOME` and `XDG_DATA_HOME`, falling back to `HOME`, and leaves both alone where both exist. The six other installer tests run under a temporary `HOME`. The automated tests pass, and the engineer's own machine folders are untouched. The fallback to `HOME` is not yet tested. The test is unnamed until the feature's close.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 7:51:32 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 7:56:58 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:01:03 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:24:15 PM PT
