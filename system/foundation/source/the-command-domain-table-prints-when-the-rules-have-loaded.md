# The command domain table prints when the rules have loaded

**When the session-start read concludes, print the command domain table below, word for word.** Print it in the response that carries the read, after the package set stanza where one prints, and ahead of anything else in that response. This holds for a read started by the session's first prompt, by `/load`, and by `load rules`. A read run again after a compaction prints no table, since the engineer asked for nothing.

| Command | Description |
|---|---|
| `/slasher help` | Print the help of every Slasher command |
| `/?` | Print this table |
| `/.` | An alias of /recent |
| `/'` | An alias of /items |
| `/unattended` | Carry out a request on the agent's own, after a plan is proposed |
| `/item` | Items hold the project's thinking: ideas, plans, designs, observations, and work to be done, each with a state. |
| `/items` | Lists the current items, then the current features and experiments. |
| `/feature` | A feature builds something the project needs, on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/experiment` | An experiment tests a question on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/recent` | Says what was recently done, and what's next. |
| `/log` | The log records what was decided and when, and a work session record tells the story of a stretch of work. |
| `/journal` | The journal is the writer's own record of what they think, either stored with the project or kept in a private journal. |
| `/brainstorm` | Brainstorming records points as they are said, freeform in no order, and organizes them when the writer is done. |
| `/test` | Run the project's tests, or other compliance routines, quality checks, and report on them. |

**Each row is one command domain, except the `/slasher help`, `/?`, `/.`, `/'`, `/unattended`, `/items`, and `/recent` rows.** A command domain is a group of root commands that share one heading, one description, and one help command in the Slasher help. The row names the domain's help command, and its description is the one under that heading. The help command is the command `/<command> help` runs on to print the domain's help. For a domain with no root command of its own name, it is the skill named for the domain, as `/process` for PROCESS and `/language` for LANGUAGE. `/items` and `/recent` are root commands of the PROCESS domain. Each has a row of its own, `/items` below the `/item` row and `/recent` below the `/experiment` row, and its description is the one its line in the help gives. A description that opens with *This command* or *These commands* in the help drops those words in the table, and opens with its verb. Print no other root command, alias, or subcommand in the table. `/?`, `/.`, and `/'` are the only aliases with rows.

**After the table, run `/items 10`.** In the same response, below the table, print the ten most recently created current items and the current implementations, as the `/items` command prints them. Head the items *10 most recent items*. Where the project has no items directory, print nothing in place of it. A read run again after a compaction runs no `/items 10`, for the same reason it prints no table.

**The second row names `/?`, the third `/.`, the fourth `/'`, and the fifth `/unattended`.** `/?` is an alias of `/command-table`, `/.` is an alias of `/recent`, `/'` is an alias of `/items`, and `/unattended` is a root command of the PROCESS domain. They stand below `/slasher help`, apart from the `/items` and `/recent` rows.

**The PHASE, PROCESS, PROJECTS, RELEASE, PACKAGES, LANGUAGE, and LOAD domains have no row.** `/slasher help` still gives their help, and so does each one's own help command: `/phase help`, `/process help`, `/projects help`, `/release help`, `/package help`, `/language help`, and `/load help`.

**The first row names `/slasher help`, which prints the help of every Slasher command.** It names no command domain.

**`/command-table` prints the table too.** It prints the table word for word, and nothing else: no `/items 10` and no package set stanza. The engineer asks for it to see the commands again during a session. `/command-table` belongs to no command domain. It has no row, and the help header names it. `/commands` and `/?` are aliases of `/command-table`, and the help header names them too. `/commands` has no row either, and `/?` has the row that prints the table.

**The agent prints the table, not the harness.** The harness renders its display as plain text, and the table needs markdown. That is the reason the package set stanza is the agent's too.

**Keep the table in line with the help.** When a domain's heading, its help command, or its description changes in the help text, change this table in the same commit.

**Why:** the engineer sees what the commands are for at the moment they can start using them. The table gives one line for each domain but PHASE, PROCESS, PROJECTS, RELEASE, PACKAGES, LANGUAGE, and LOAD, so it shows the whole set at a glance, and `/slasher help` gives the detail. The current items and implementations show the engineer where the work stands before they make the first request.

**How to apply:** at the end of the session-start read, print the table as it stands here, once, run `/items 10` below it, and then turn to the engineer's request or wait for one.

## History

Until Sat Nov 7 2026 the `/test` row read *Run the project's tests and report on them.*

Until Sat Nov 7 2026 the `/items` row stood below the `/experiment` row, above `/recent`.

Until Sat Nov 7 2026 the `/items`, `/recent`, and `/test` rows opened with *This command* or *These commands*, as the help does.

Until Sat Nov 7 2026 the PROJECTS, RELEASE, and PACKAGES domains had the `/projects`, `/release`, and `/package` rows, below the `/test` row.

Until Sat Nov 7 2026 the LANGUAGE domain had a `/language` row, below the `/package` row.

Until Sat Nov 7 2026 the LOAD domain had a `/load` row, the last in the table.

Until Sat Nov 7 2026 the PROCESS domain had a `/process` row, below the `/recent` row.

Until Sat Nov 7 2026 `/command-table` had the last row of the table. The engineer removed it, and `/?` has the row that prints the table.

Until Sat Nov 7 2026 the `/unattended` row ended *after a plan is accepted*.

Until Sat Nov 7 2026 the table had no `/'` row.

Until Sat Nov 7 2026 `/.` was an alias of `/items`, and its row said so. The engineer made it an alias of `/recent`.

Until Sat Nov 7 2026 `/?` answered *What are we doing?*, and its row said so. The engineer made it an alias of `/command-table`.

Until Sat Nov 7 2026 the table had no `/.` row, and named no alias.

Until Sat Nov 7 2026 the `/?` row stood below the `/recent` row, and `/unattended` stood second.

Until Sat Nov 7 2026 the table had no `/?` row.

Until Sat Nov 7 2026 the `/recent` row named `/brief`.

Until Sat Nov 7 2026 the table had no `/unattended` row, and `/item` stood second.

Until Sat Nov 7 2026 the rows of `/items` and `/brief` named `/report` and `/report brief`, and the read ran `/report 10`.

Until Sat Nov 7 2026 a bare `/slasher` printed the table. It now offers topics to learn about, under the a-bare-slasher-offers-topics-to-learn-about rule, and selecting *Commands* there prints the table.

Until Fri Nov 6 2026 the table had a `/phase` row, below the `/experiment` row.

Until Fri Nov 6 2026 the table opened with the `/item` row, and no row named `/slasher help`.

Until Fri Nov 6 2026 the rows of `/report` and `/report brief` named `/current` and `/work-status`, and the read ran `/current 10`.

Until Fri Nov 6 2026 the read ran `/current 5`, and printed the five most recently created current items.

Until Fri Nov 6 2026 the items printed after the table took no heading of their own.

Until Fri Nov 6 2026 a bare `/slasher` printed nothing, and the table printed only when the rules loaded.

Until Fri Nov 6 2026 the `/process` row named only `/process`. For a time on that day it also named `/current` and `/work-status`, before each took a row of its own. Those rows stood below the `/process` row before they moved above it.

Until Fri Nov 6 2026 only a bare `/slasher` printed the table during a session. `/command-table` did not exist. When it was first added, it had no row in the table.

Until Fri Nov 6 2026 `/command-table` had no alias. The engineer then made `/commands` its alias.

Related:

- the the-startup-display-prints-as-the-session-starts rule — the display the harness prints ahead of the read
- the the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice rule — what the agent prints at the start, and what it does not
- the the-slasher-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin whose help the table follows
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — what `/items 10` prints

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
Changed by Scott Bellware on Fri Nov 6 2026 at 9:58:45 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:02:30 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:03:18 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:00:59 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:08:55 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:35:54 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 11:36:20 PM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 12:00:17 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:04:28 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:17:53 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:27:22 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:34:55 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:42:33 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:43:22 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:46:44 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 2:48:15 AM PT
