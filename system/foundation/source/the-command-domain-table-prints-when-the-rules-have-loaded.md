# The command domain table prints when the rules have loaded

**When the session-start read concludes, print the command domain table below, word for word.** Print it in the response that carries the read, after the package set stanza where one prints, and ahead of anything else in that response. This holds for a read started by the session's first prompt, by `/load`, and by `load rules`. A read run again after a compaction prints no table, since the engineer asked for nothing.

| Command | Description |
|---|---|
| `/item` | Items hold the project's thinking: ideas, plans, designs, observations, and work to be done, each with a state. |
| `/feature` | A feature builds something the project needs, on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/experiment` | An experiment tests a question on its own branch or worktree, to a declared end. Features and experiments are both kinds of implementations. |
| `/phase` | Phases split a feature or an experiment into steps, run one at a time, each on its own sub branch. |
| `/current` | These commands move the work under way along: take its next step, or say what was done and what's next. |
| `/log` | The log records what was decided and when, and a work session record tells the story of a stretch of work. |
| `/journal` | The journal is the writer's own record of what they think, either stored with the project or kept in a private journal. |
| `/brainstorm` | Brainstorming records points as they are said, freeform in no order, and organizes them when the writer is done. |
| `/test` | These commands run the project's tests and report on them. |
| `/projects` | This command lists the Waytide projects registered on this machine. The list helps move ideas, new patterns, and corrections into other projects. |
| `/release` | This command presents the candidates for a package's next version, for the engineer to choose. |
| `/package` | These commands manage the installed packages: which are active, refreshing them, and installing Waytide. |
| `/clarify` | These commands work on language: reserving a word, ETE, Waytide's implementation of STE and its extensions, and clarifying language, often the agent's. |
| `/load` | This command loads the rules now, without waiting for the first prompt. |

**Each row is one command domain.** A command domain is a group of root commands that share one heading, one description, and one help command in the Slasher help. The row names the domain's first root command, and its description is the one under that heading. Print no other root command, alias, or subcommand in the table.

**After the table, run `/current 5`.** In the same response, below the table, print the five most recently created current items and the current implementations, as the `/current` command prints them. Where the project has no items directory, print nothing in place of it. A read run again after a compaction runs no `/current 5`, for the same reason it prints no table.

**The agent prints the table, not the harness.** The harness renders its display as plain text, and the table needs markdown. That is the reason the package set stanza is the agent's too.

**Keep the table in line with the help.** When a domain's heading, its first root command, or its description changes in the help text, change this table in the same commit.

**Why:** the engineer sees what the commands are for at the moment they can start using them. The table gives one line for each domain, so it shows the whole set at a glance, and `/slasher help` gives the detail. The current items and implementations show the engineer where the work stands before they make the first request.

**How to apply:** at the end of the session-start read, print the table as it stands here, once, run `/current 5` below it, and then turn to the engineer's request or wait for one.

Related:

- the the-startup-display-prints-as-the-session-starts rule — the display the harness prints ahead of the read
- the the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule — what the agent prints at the start, and what it does not
- the the-waytide-skills-are-delivered-as-a-plugin-named-slasher rule — the plugin whose help the table follows
- the a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows rule — what `/current 5` prints

---

Authored by Scott Bellware on Fri Nov 6 2026 at 9:34:21 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 10:49:50 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:37:03 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:57:41 PM PT
