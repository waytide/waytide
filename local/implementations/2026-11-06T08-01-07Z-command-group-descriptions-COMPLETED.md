# Feature — Command group descriptions

**Tags:** [feature]

## Intent

**As the engineer stated it:** start a feature for the command domain headings.

**Each command group in the help text gets a one-sentence description of what its commands are for**, under its heading in `scratch/skills.md` and at the top of its root commands' help output. It carries out the work item `2026-11-06T07-57-00Z-each-command-group-has-a-one-sentence-description`, which lists the fourteen headings and their root commands.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/command-group-descriptions`
- **Base:** `db8f478`, from `master`
- **Working location:** branch only, chosen at the start. The working tree switches back to `master` at the conclusion.
- **Participation:** not asked. The work is help text, which is content, and the design-by-efferent-does-not-govern-content-work local rule leaves content work out of the loop.
- **Verdict:** none. The feature concludes Completed when the descriptions are written and in place.

## The work

- The engineer settled the fourteen descriptions, wording several, and settled that every root command in a group opens its help with the group's description.
- Each description sits under its heading in `scratch/skills.md`, and at the top of each of its root commands' help, under the help's heading. `/slasher help` carries them.
- Outside the feature's intent, and on its branch: the implementation rule now fixes the verdict question's options as *Conclude with an engineer's verdict* and *Conclude without an engineer's verdict*, and the idea that `/projects` carries ideas, patterns, and corrections into other projects is recorded.

## Confirmations

- **2026-11-06** — The working location is branch only, selected by the engineer at the start.
- **2026-11-06** — The feature reaches no verdict, selected by the engineer at the start.
- **2026-11-06** — The feature is Completed, at the engineer's direction, and merged into `master`.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 12:01:07 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:30:35 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:03:42 AM PT
