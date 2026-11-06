# Work Session — The commands become skills, and the rules arrive before the first prompt (Thu Nov 5 2026)

This work session began with one skill to build, `/log`, and ended with the skills feature concluded and merged into `master`. Phase 1 built every command in the help text as a skill in a plugin, which came to be named `slasher` and to carry the whole session start. Phase 2 measured the session-start read, found the limit on what a hook can carry, and shrank the read by about 18%, with five rules now arriving before the first prompt. Along the way the engineer recorded several ideas, among them the base project.

This record is the guided tour. The durable records it points to are the source of truth: the feature record `local/implementations/2026-10-30T01-21-06Z-skills`, the log, the rules, and the commits on `feature/worktree/skills`.

## 1. The first skill, and the plugin's name

The engineer chose unattended work for the code of `/log`'s placement. The installer learned to assemble the active packages' skills into a plugin, with a test of three outcomes, and the loader learned to print a pre-loaded rule by name, so a skill could load the log rule. The command protocol gained an exception for a command whose words are its argument, as `/log <message>`. The plugin was named `we`, then `slash`, then `slasher`, with the display name Slasher; the engineer settled that a name a built-in also uses is set apart by the namespace. The loop record `local/logs/loops/2026-11-03T21-59-55Z-skills` holds the decisions.

## 2. The session start moves into the plugin

`/load` was built as the same command as `load waytide`, following the read instruction `session-start.sh instruction` prints, so the two follow one text. A test showed a plugin's own hooks run, and the engineer had the whole session start moved into the plugin's hooks, leaving `.claude/settings.json` the status line alone. The migration record `local/migration/2026-11-03T23-28-30Z-the-session-start-hooks-move-into-the-plugin` holds the plan. The startup display rule was renamed the-startup-display-prints-as-the-session-starts. The startup output was then reshaped over many turns: the display in two parts, the load line last, the figure on the first prompt under *Slasher is pre-loading its rules...*, blank lines where the engineer asked, and the typed command renamed `load rules`.

## 3. Every command group becomes a skill

The rest of phase 1 built the command groups one at a time, each a thin skill that hands its act to its rule: `/item` and its aliases, `/work-status` (a new rule, its `/status` alias added and then removed), `/feature`, `/experiment`, `/phase` and `/phases`, `/next` and `/next?` (renamed `/next-work` and back), `/log-this`, `/work-session`, `/journal`, `/freewrite` and `/freeform`, `/test` and its aliases, `/projects`, `/release`, `/package`, `/package-set`, and the language commands. The engineer left `/publish` and `/status-report` without skills. A skill name ending in `?` was found to load. A bare `/slasher` came to do nothing and `/slasher help` to print the full help, in the order of `scratch/skills.md`. Phase 1 concluded Completed.

## 4. Phase 2 measures the read

Phase 2 was started to reach a verdict, with a forecast that command domains' rules would leave the read and the hook would carry the rest. The findings: a hook carries at most 10,000 characters, the read was about 177,000, and few pre-loaded rules belonged to a command domain. A core of five rules was built into the hook, and a session confirmed it arrived whole before the first prompt. Two loader defects were found and fixed on the way.

## 5. Safe triggers

Moving rules to triggers raised whether the corpus grows less predictable. The engineer settled that a rule takes a trigger only where the trigger names a discrete act the agent itself takes, and a missed load is cheap and visible, and foundation's rule on binding rules now says so. An audit of 86 triggers reworded or reversed 13. The vocabulary rule was split into using and writing, two more rules took triggers, the work-session rule was pre-loaded again and taught to propose a record at each conclusion, and the vocabularies' compressed text dropped its STE notes. A session confirmed three of the new triggers loaded before their acts. The read came to about 145,000 characters. The engineer declared phase 2 Affirmed.

## 6. The feature concludes

The engineer first declared the feature Affirmed, and the record took a confirmation that it reaches a verdict, since it began before that choice was asked at a start. The engineer then corrected it: the feature is Completed. The record carries both confirmations and the correction, and the log carries an entry for each. The feature merged into `master`, keeping `master`'s help text where the two had both changed it, and the worktree and the branch were removed. The skills item was amended with the skills as built.

## Takeaways

- Waytide's commands are skills in the Slasher plugin, typed `/slasher:<command>` or bare where nothing else claims the name.
- The plugin carries the session start. `.claude/settings.json` keeps only the status line.
- A hook can carry at most 10,000 characters, so only a small core of rules arrives before the first prompt.
- A rule takes a trigger only where the trigger is safe.

## Glossary

- **core rules**: the five rules `foundation/core-rules` names, which the session-start hook carries so they hold before the first prompt.
- **safe trigger**: a trigger that names a discrete act the agent itself takes, such that a missed load is cheap and visible.
- **base project**: an idea, not built: a project at the level of a directory holding other projects, to which records can be added from within them. The **system project** is the single one for a machine.

## Where the durable records live

- The feature record, `local/implementations/2026-10-30T01-21-06Z-skills`, with both phases, their findings, and their verdicts.
- The loop record, `local/logs/loops/2026-11-03T21-59-55Z-skills`.
- The migration record, `local/migration/2026-11-03T23-28-30Z-the-session-start-hooks-move-into-the-plugin`.
- The log entries of 2026-11-03 to 2026-11-06 under `local/logs/log/`.
- The skills, under each package's `skills/`, and the plugin's parts, under `system/foundation/plugin/`.
- The items recorded on `master`: the command-group descriptions, the participation confidence, the low-confidence recommendation, the ETE package, and the base project.

---

Authored by Scott Bellware on Thu Nov 5 2026 at 9:44:09 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:55:42 PM PT
