# Each command group has a one-sentence description

- **State:** Active
- **Tags:** [work]

**Each command group gets a short, one-sentence description of what its commands are for.** The sentence goes in two places:

- **At the top of the root command's help output,** under its heading, ahead of the first command line. That is the `help.md` in the command's skill, printed by `/<command> help` and as part of `/slasher help`.
- **Under the group's heading in `scratch/skills.md`,** ahead of its first command line.

The groups are the fourteen headings in `scratch/skills.md`: ITEMS, FEATURES, EXPERIMENTS, PHASE, PROCESS, LOG, JOURNAL, FREEWRITING, TESTS, PROJECTS, VERSIONING, PACKAGES, LANGUAGE, and LOAD.

It carries out the idea `2026-11-04T21-08-46Z-each-command-group-in-the-help-text-is-described-under-its-heading`.

- [x] Each group's description is written, one sentence each.
- [x] Each root command's `help.md` opens with its group's description under its heading.
- [x] `scratch/skills.md` carries the same description under each heading.

**Not yet settled:** where a group holds several root commands, such as PROCESS with `/next`, `/next?`, and `/work-status`, whether each command's help carries the group's sentence or a sentence of its own.

## The command domain headings

Added 2026-11-05. Each heading in `scratch/skills.md`, with the root commands it holds:

| Heading | Root commands |
|---|---|
| ITEMS | `/item`, and its aliases `/idea`, `/work`, `/work-item`, `/plan`, `/design`, `/aspiration`, `/goal`, `/observation`, `/observe`, `/mistake`, `/problem`, `/list`, `/current-items` |
| FEATURES | `/feature` |
| EXPERIMENTS | `/experiment` |
| PHASE | `/phase`, `/phases` |
| PROCESS | `/next`, `/next?`, `/work-status` |
| LOG | `/log`, `/log-this`, `/work-session` |
| JOURNAL | `/journal` |
| FREEWRITING | `/freewrite`, and its alias `/freeform` |
| TESTS | `/test`, and its aliases `/test-report`, `/test-tree` |
| PROJECTS | `/projects` |
| VERSIONING | `/release` |
| PACKAGES | `/package`, `/package-set` |
| LANGUAGE | `/reserve`, `/ete`, `/expand`, `/clarify` |
| LOAD | `/load` |

## Settled

- **2026-11-06** — Every root command in a group opens its help with the group's description, the same one that sits under the heading in `scratch/skills.md`. Some descriptions run to two sentences, at the engineer's wording.

## History

As the engineer first stated it: "New work item: Each one of these headings needs a scentence of short description at the top of their root command's help output, and that text should be under the respective HEADING in skills.md"

---

Authored by Scott Bellware on Thu Nov 5 2026 at 11:57:00 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 11:57:51 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:01:18 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:30:35 AM PT
