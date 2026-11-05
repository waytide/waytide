# Work status says what was recently done, and what is next

**Trigger:** When the engineer types `/work-status`, or asks what was recently done and what is next

**`/work-status` answers two questions in a few lines: what was recently done, and what is next.** It has no alias.

**As the engineer stated it:** what was recently done, and what's next.

**What was recently done is read from the latest log entries and commits.** It is a short list of what changed, newest last, each a fact about the work: a skill built, a rule written, a decision recorded. It covers the branch the work is on, and `master` where work landed there too. It says which commits are not yet pushed, by branch, as a count.

**What is next is the next step of the work under way**, as the next-takes-the-next-step-of-the-work-under-way rule finds it for `/next?`. Where more than one piece of work is under way, the answer names the next step of each, the one the conversation is on first.

**It is not the status report.** The a-status-report-prints-a-fixed-whole-project-report rule's report adds a task table, a map of `waytide/`, and a run of the test suite. `/work-status` carries none of them. Where the engineer wants the whole project, `/status-report` gives it.

**It is read from current state, never from memory.** The log, the commits, and the records are read when the command is typed. A record that summary rule hides, such as a suspended item, is counted rather than listed here too.

**Why:** a session that works through many changes asks *what's recent* and *what's next* again and again. One command answers both, in the same shape each time, without the full report's weight.

**How to apply:** on `/work-status`, read the latest log entries and commits on the branches the work touches, list what was recently done, and give the next step of the work under way. Say what is not pushed. Keep it to a few lines, and leave the whole-project parts to `/status-report`.

## Compressed

1. `/work-status` says in a few lines what was recently done and what is next. It has no alias.
2. What was recently done is read from the latest log entries and commits: a short list, newest last, each a fact about the work. It covers the branch the work is on, and `master` where work landed there too.
3. Say how many commits on each branch are not yet pushed.
4. What is next is the next step of the work under way, found as `/next?` finds it. Where more than one piece of work is under way, name the next step of each, the one the conversation is on first.
5. Carry no task table, no map of `waytide/`, and no suite run. Those belong to `/status-report`.
6. Read the log, the commits, and the records when the command is typed, never from memory. A record the status report rule hides is counted rather than listed.

## Compression

- 2026-11-04, compressed: checked: 16 directives, 15 kept, 1 less precise, 0 lost. Left less precise: the examples of a fact about the work, which the requirement carries without them
- 2026-11-04, revised: the `/status` alias is removed, as the engineer directed; not re-checked

## History

On Wed Nov 4 2026 `/status` was an alias of `/work-status`, typed `/slasher:status` where Claude Code's own `/status` claimed the bare name. The engineer removed it the same day.

Related:

- the next-takes-the-next-step-of-the-work-under-way rule — what is next
- the a-status-report-prints-a-fixed-whole-project-report rule — the whole-project report, and the hidden records
- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-always-takes-help rule — how the command is read

---

Authored by Scott Bellware on Wed Nov 4 2026 at 8:49:42 PM PT
Changed by Scott Bellware on Wed Nov 4 2026 at 9:07:44 PM PT
