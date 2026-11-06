# Each command group has a one-sentence description

- **State:** Open
- **Tags:** [work]

**Each command group gets a short, one-sentence description of what its commands are for.** The sentence goes in two places:

- **At the top of the root command's help output,** under its heading, ahead of the first command line. That is the `help.md` in the command's skill, printed by `/<command> help` and as part of `/slasher help`.
- **Under the group's heading in `scratch/skills.md`,** ahead of its first command line.

The groups are the fourteen headings in `scratch/skills.md`: ITEMS, FEATURES, EXPERIMENTS, PHASE, PROCESS, LOG, JOURNAL, FREEWRITING, TESTS, PROJECTS, VERSIONING, PACKAGES, LANGUAGE, and LOAD.

It carries out the idea `2026-11-04T21-08-46Z-each-command-group-in-the-help-text-is-described-under-its-heading`.

- [ ] Each group's description is written, one sentence each.
- [ ] Each root command's `help.md` opens with its group's description under its heading.
- [ ] `scratch/skills.md` carries the same description under each heading.

**Not yet settled:** where a group holds several root commands, such as PROCESS with `/next`, `/next?`, and `/work-status`, whether each command's help carries the group's sentence or a sentence of its own.

## History

As the engineer first stated it: "New work item: Each one of these headings needs a scentence of short description at the top of their root command's help output, and that text should be under the respective HEADING in skills.md"

---

Authored by Scott Bellware on Thu Nov 5 2026 at 11:57:00 PM PT
