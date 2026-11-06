# Feature — Skills

**Tags:** [feature]

## Intent

**As the engineer stated it:** begin a feature for the slash commands. Then: change it to “skills”.

**Waytide's commands are delivered as Claude Code skills**, each typed as `/<name>`, as the item *Waytide skills*, `2026-10-29T16-24-42Z-waytide-skills`, records them. One command serves each kind of record, and its first argument is the subcommand. A command entered with no argument asks which subcommand is meant, through the selection interface.

## State

- **State:** Affirmed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/skills`
- **Base:** `ebc7c8e`, from `master`
- **Working location:** branch and worktree, chosen at the start. The worktree is `../waytide-feature-worktree-skills`, and the main working tree stays on `master`.
- **Participation:** not asked. A skill's body is prose instructions, which the design-by-efferent-does-not-govern-content-work local rule leaves out of the loop. A script a skill needs is code, and design-by-efferent governs it.

## Phases

1. **Slash commands** — the skills, each typed as `/<name>`, that the item *Waytide skills* records. Branch: `feature/worktree/skills.slash-commands`, created from `feature/worktree/skills` at `19c4e07`, in the feature's worktree. Started 2026-10-29. **Completed 2026-11-05**, with no verdict, and merged into `feature/worktree/skills`. Every command in the help text has its skill, apart from `/publish` and `/status-report`, which the engineer chose to leave out. The skills were built and tested by the automated suite. The engineer concluded the phase before trying each skill in a session.

**As the engineer stated it:** the first phase of this feature is the slash commands.

2. **Optimization** — its intent is to keep a strictly partitioned command domain's rules, needed only when its command runs, out of the rules pre-loaded at session start. Branch: `feature/worktree/skills.optimization`, created from `feature/worktree/skills` at `1de13ef`, in the feature's worktree. Started 2026-11-05. **It reaches a verdict**, selected by the engineer at its start. **Affirmed 2026-11-05**, on the engineer's declaration, and merged into `feature/worktree/skills`. Against its forecast, the findings below show the read shrank by about 18%, mostly through triggers by subject and compressed vocabularies rather than through skills, and that a core of five rules arrives with no prompt while the full read still needs the first one.

**Forecast, stated before its work:** the rules a command domain needs only when its command runs can leave the pre-loaded rules, loaded by their skills instead. That shrinks the session-start read enough for the session-start hook to carry the rules in the agent's context, so the rules load as the session starts, with no prompt typed.

**Findings, 2026-11-05:**

- A hook may add at most 10,000 characters to the agent's context. Over that, Claude Code saves the output to a file and gives the agent its path and a 2,000-character preview, and does not ask the agent to read it. No setting raises the limit, and the documentation gives plugin hooks no different one. Source: the Claude Code hooks documentation, read through a summarizing fetch.
- The session-start read is about 177,000 characters. Foundation's pre-loaded rules are about 43,000, testing's about 25,000, and language's about 22,000. The vocabularies, the local rules, the on-demand indexes, and the journal make up the rest.
- Few pre-loaded rules are needed only when a command runs. Most are standing practices, such as the log, the language rules, and the testing rules, which apply whether or not a command is typed. The savings that exist are by subject: the testing package's pre-loaded rules, about 25,000 characters, and most of the notice rule, about 10,000, could load on their triggers. Together that is about a fifth of the read.
- For the hook to carry the rules, the read would have to fit in 10,000 characters, under 6% of what it is.
- The engineer chose to build a core: the session-start hook carries five rules after the read instruction, so they hold before the first prompt. They are the rules that shape the first answer: present every prompt through the selection interface, clarify every response twice, lead with a summary, communicate plainly, and no slang. The hook's context comes to 8,905 characters in this repository, within the limit. The journal rule was left out, since the journal is read only with the full read. The rest still loads with the read on the first prompt.
- In a fresh session in the worktree, on 2026-11-05, the engineer asked the agent, before any command ran, which rules its session-start context held. It listed the five core rules, and said the context arrived inline in full, not saved to a file. The core holds before the first prompt. The engineer then typed `/load`. It ran two shell commands, the read instruction and the loader, read the loader's output from the file it was saved to, and waited for a request. The full read still runs after the core. Asked which open item to work on first, the session answered with the point first, in plain words, as a list, and closed with the expansion line, so the core rules and the read's rules both held.
- The read was shrunk by giving rules a trigger. The testing package's 13 pre-loaded rules load when a test is written, read, or run, and the notice rule loads when the notice, the display, the status line, or their hooks or scripts change. Its standing points are carried by the read instruction every session. The read went from 177,100 characters to 143,746, about a fifth smaller. It is still about fourteen times the hook's limit.
- The engineer wants triggers only where they are reliable. Foundation's rule on binding rules now says a rule takes a trigger only where the trigger names a discrete act the agent itself takes, and a missed load is cheap and visible. The testing rules' trigger became creating or editing a file under `test/`, and one testing rule, on which tests run before a commit, was pre-loaded again. An audit of the 86 triggers found 13 unsafe: two rules were pre-loaded again, the status report and migration rules, eight were reworded to name an act, two gained their command forms, and one was kept. The read is now 153,938 characters. The engineer then had the work-session rule pre-loaded, so the offer of a work session record at a session's close stands. The vocabulary rule was split, its part for writing a vocabulary moved to a new rule that loads when a vocabulary file is written, and the read came to about 156,000 characters. The commit-message rule and the ordinary-vocabulary rule then took safe triggers, and the journal rule stayed pre-loaded whole, since its standing part is most of it. The read is 154,486 characters.
- The engineer tried three of the new triggers in a fresh session in the worktree: drafting a commit message, editing a file under `test/`, and drafting a vocabulary entry. In each, the agent loaded the rule before the act.
- The six vocabularies' compressed text leaves out each entry's STE note, which matters only when a word is reserved or an entry written. The full text keeps the notes. The read is 144,925 characters, about 18% smaller than at the phase's start.

**As the engineer stated it:** the second phase of this feature is to figure how to keep strictly partitioned command domains from being pre-loaded.

**Its intent is to work out how.** **As the engineer stated it:** the intent is to figure it out.

**As the engineer later stated it:** phase 2 is just: optimization. The "command domains kept out of the pre-loaded rules" is the intent.

**Amended 2026-11-04:** phase 2's intent also takes in loading the rules at session start with no prompt typed. The session-start hook would carry the rules themselves in the context it gives the agent, so no read is needed. The loader's output is about 177,000 characters, and a hook's context is likely capped well below that, so the pre-loaded rules must shrink for the hook to carry them. **As the engineer stated it:** include this matter in phase 2's goals. The matter was whether there is a way to run the load at initialization without the user entering a prompt.

**Amended 2026-11-04, later:** phase 2 also takes in the session-start notice's closing line. With the plugin loaded, it would tell the engineer to type `/load` in place of `load waytide`. **As the engineer stated it:** with the plugin loaded, the startup output could say: type /load instead of "load waytide". This is also a matter for phase 2.

**Amended 2026-11-04, later still:** the notice's closing line is changed in phase 1 after all, not phase 2. It tells the engineer to type `/load`, at the bottom of the session-start message. **As the engineer stated it:** actually, put the load instructions at the bottom of the initialization display now. And it should instruct the user to use "/load" rather than "load waytide".

The later phases are not yet named.

## Delivery

**The skills are delivered as a skills-directory plugin named `we`**, settled by the engineer on 2026-10-30. `foundation` carries the plugin directory, and `install.sh` places it under a project's `.claude/skills/`. The skills are typed `/we:<command>`, and a bare `/<command>` works where nothing else claims the name.

**Amended 2026-11-03:** the plugin is called Slasher, and its name is `slash`, so a skill is typed `/slash:<command>`, as in `/slash:log`. It sits at `.claude/skills/slash/`. **As the engineer stated it:** this plugin will be called "Slasher". Its name will be "slash", as in "/slash:log".

**Amended 2026-11-03, later:** the plugin's name is `slasher`, the same as its product name, so a skill is typed `/slasher:log`, and it sits at `.claude/skills/slasher/`. Its `displayName` is `Slasher`. The engineer selected `slasher` over `slash`. **As the engineer stated it:** maybe I should just use "Slasher" for both.

## Plan for the slash-commands phase

Adopted by the engineer on 2026-10-30.

1. Master is merged into `feature/worktree/skills`, and that into the phase branch.
2. Each package carries its own skills, so a deactivated package's skills go with it.
3. A skill's body is thin: it reads the subcommand, loads the rules that govern the act with `load-rules.sh`, and follows them. With no subcommand it asks through the selection prompt, grouping where there are more than four.
**Amended 2026-10-30:** before any skill is built, every command in the help text has a rule behind it, so that each skill stays a thin delegator. **As the engineer stated it:** there are slash commands in the scratch document that are not represented in rules yet. Those must have rules backing them so that the skills implementations remain thin delegators. The commands with no rule yet are freewriting, the `[mistake]` and `[problem]` item kinds, the `current` list state, phase and status listing on request, `/projects`, `/package refresh` and `install`, `/test` and `/test interactive`, `/clarify`, the command protocol, and the `we` plugin's delivery.

4. `/log` is built first, end to end: its skill, its placement by `install.sh`, and an automated test of the skill.
5. `/item` and its aliases follow.
6. The other groups follow, one at a time.
7. Rules that name a typed directive name its skill as well.
8. The help text in `scratch/skills-help.md` becomes what a bare `/we` prints.

## Confirmations

- **2026-10-29** — The working location is branch and worktree, selected by the engineer at the start.
- **2026-10-29** — The feature is renamed from slash commands to skills, at the engineer's direction. The branch was `feature/worktree/slash-commands` and the worktree `../waytide-feature-worktree-slash-commands`. Claude Code calls a command defined this way a skill, and slash command names how it is typed.
- **2026-11-03** — The code of `/log`'s placement and its test runs unattended, selected by the engineer. The engineer first selected attended, then corrected it: do this unattended.
- **2026-11-05** — The feature reaches a verdict, selected by the engineer at its conclusion, since it began before that choice was asked at the start.
- **2026-11-05** — The feature is Affirmed, on the engineer's declaration, and merged into `master`.

---

Authored by Scott Bellware on Thu Oct 29 2026 at 6:21:06 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 6:26:38 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:04:41 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:12:57 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:30:17 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:31:01 PM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 12:37:25 AM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:16:59 AM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:17:46 AM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 11:31:39 AM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 1:59:55 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 2:24:30 PM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 2:55:18 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:47:09 AM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:48:03 AM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 11:51:33 AM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 6:16:27 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 6:27:34 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 6:32:33 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 6:40:38 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 8:02:30 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:43:14 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 9:49:39 PM PT
