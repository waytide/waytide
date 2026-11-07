# The command domain table prints when the rules have loaded

**When the session-start read concludes, print the command domain table below, word for word.** Print it in the response that carries the read, after the package set stanza where one prints, and ahead of anything else in that response. This holds for a read started by the session's first prompt, by `/load`, and by `load rules`. A read run again after a compaction prints no table, since the engineer asked for nothing.

| Command | Description |
|---|---|
| `/item` | Items hold the project's thinking: ideas, plans, designs, observations, and work to be done, each with a state. |
| `/feature` | A feature builds something the project needs, on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/experiment` | An experiment tests a question on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/phase` | Phases split a feature or an experiment into steps, run one at a time, each on its own sub branch. |
| `/process` | These commands move the work under way along: take its next step, or say what was done and what's next. |
| `/current` | This command lists the current items, then the current features and experiments. |
| `/work-status` | This command says what was recently done, and what's next. |
| `/log` | The log records what was decided and when, and a work session record tells the story of a stretch of work. |
| `/journal` | The journal is the writer's own record of what they think, either stored with the project or kept in a private journal. |
| `/brainstorm` | Brainstorming records points as they are said, freeform in no order, and organizes them when the writer is done. |
| `/test` | These commands run the project's tests and report on them. |
| `/projects` | This command lists the Slasher projects registered on this machine. The list helps move ideas, new patterns, and corrections into other projects. |
| `/release` | This command presents the candidates for a package's next version, for the engineer to choose. |
| `/package` | These commands manage the installed packages: which are active, refreshing them, and installing Slasher. |
| `/language` | These commands work on language: reserving a word, ETE, Slasher's implementation of STE and its extensions, and clarifying language, often the agent's. |
| `/load` | This command loads the rules now, without waiting for the first prompt. |

**Each row is one command domain, except the `/current` and `/work-status` rows.** A command domain is a group of root commands that share one heading, one description, and one help command in the Slasher help. The row names the domain's help command, and its description is the one under that heading. The help command is the command `/<command> help` runs on to print the domain's help. For a domain with no root command of its own name, it is the skill named for the domain, as `/process` for PROCESS and `/language` for LANGUAGE. `/current` and `/work-status` are root commands of the PROCESS domain, and each has a row of its own below the `/process` row. Its description is the one its line in the help gives. Print no other root command, alias, or subcommand in the table.

**After the table, run `/current 10`.** In the same response, below the table, print the ten most recently created current items and the current implementations, as the `/current` command prints them. Head the items *10 most recent items*. Where the project has no items directory, print nothing in place of it. A read run again after a compaction runs no `/current 10`, for the same reason it prints no table.

**A bare `/slasher` prints the table too, and so does `/command-table`.** Each prints the table word for word, and nothing else: no `/current 10` and no package set stanza. The engineer asks for it to see the commands again during a session. `/command-table` belongs to no command domain, so it has no row in the table. The help header names it, beside the bare `/slasher`.

**The agent prints the table, not the harness.** The harness renders its display as plain text, and the table needs markdown. That is the reason the package set stanza is the agent's too.

**Keep the table in line with the help.** When a domain's heading, its help command, or its description changes in the help text, change this table in the same commit.

**Why:** the engineer sees what the commands are for at the moment they can start using them. The table gives one line for each domain, so it shows the whole set at a glance, and `/slasher help` gives the detail. The current items and implementations show the engineer where the work stands before they make the first request.

**How to apply:** at the end of the session-start read, print the table as it stands here, once, run `/current 10` below it, and then turn to the engineer's request or wait for one.

## History

Until Fri Nov 6 2026 the read ran `/current 5`, and printed the five most recently created current items.

Until Fri Nov 6 2026 the items printed after the table took no heading of their own.

Until Fri Nov 6 2026 a bare `/slasher` printed nothing, and the table printed only when the rules loaded.

Until Fri Nov 6 2026 the `/process` row named only `/process`. For a time on that day it also named `/current` and `/work-status`, before each took a row of its own.

Until Fri Nov 6 2026 only a bare `/slasher` printed the table during a session. `/command-table` did not exist.

Related:

- the the-startup-display-prints-as-the-session-starts rule — the display the harness prints ahead of the read
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — what the agent prints at the start, and what it does not
- the the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin whose help the table follows
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — what `/current 10` prints

---

Authored by Scott Bellware on Fri Nov 6 2026 at 9:34:21 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:49:50 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:37:03 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:57:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:29:24 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:32:53 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:36:16 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:52:38 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:55:31 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:56:59 PM PT
