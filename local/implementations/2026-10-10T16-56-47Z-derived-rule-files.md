# Experiment — Derived rule files

**Tags:** [experiment]

## Question

**Does a session that reads derived rule files read faster, and still honor the rules?**

**It tests one first cut of a derived file, not the open question of what a derived file carries.** The reducing-rule-files-to-their-essential-directives idea leaves that question open, and its reordered plan runs this experiment before the question is settled so the findings can inform it. A refuted result may say the cut was wrong rather than that derived files are, and the findings are to say which.

## Setup

- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/derived-rule-files`
- **Base:** `f53081153fde6596327cbb909f2c5d042da57ca7`, from `master`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Rests on:** the reducing-rule-files-to-their-essential-directives idea — its section on a package structure with source and derived rules, and its reordered plan.

## The first cut

**A derived file drops** the provenance footer and the dated history clauses.

**A derived file keeps** the directive, the `**Why:**` passage, and the worked instances.

**The read leaves out** the package `README.md` files. `vocabulary.md` is read as it is.

**The layout** is the one the idea describes: derived files at the package root under each rule's name, the full rules in a source subdirectory. The source subdirectory's name is not settled.

**Narrowed 2026-10-12: the first cut drops the footer only.** The engineer chose to keep the dated history clauses in this cut. Removing a footer is mechanical, and removing a history clause is not, so the cut's results come from the footers and the README files alone, and no directive can be lost from its read. The history clauses become a second cut, measured and judged the same way once this one is. Its generator lists every sentence it drops, for the engineer to check for directives.

**The source subdirectory is `source/`**, chosen by the engineer on 2026-10-12.

## Starting point

**Measured 2026-10-10:** 667,009 characters across 126 files, of which provenance footers are 74,524 and package `README.md` files are 59,006.

**Measured 2026-10-12, after the startup display change:** 667,402 characters across 126 files, by the same count. The 393 added are the rules reconciled to that change.

**Measured 2026-10-12:** the read's duration and tool calls, over five fresh sessions on `claude-opus-5-5`, run one after another between 18:53 and 18:58 UTC on this branch at `7105e2e`.

| session | start (UTC) | duration | tool calls |
|---|---|---|---|
| `575d2bc6` | 18:53:49 | 32.4 s | 13 |
| `0a584d79` | 18:54:48 | 36.3 s | 10 |
| `3cc93dd4` | 18:55:39 | 29.5 s | 10 |
| `1797e07f` | 18:56:27 | 20.5 s | 8 |
| `d18d0e73` | 18:57:11 | 45.1 s | 12 |

- **Median:** 32.4 seconds and 10 tool calls.
- **Range:** 20.5 to 45.1 seconds, and 8 to 13 tool calls.
- **One session is left out.** In `d69c4f94` the command was typed `laod waytide`, so the startup display hook did not run, and the read was not started by the measured command.
- **The spread is large against the saving forecast.** The longest read takes more than twice as long as the shortest, which bears on forecast item 2.

## Measurement method

**The read is measured from Claude Code's own session transcripts.** Each session writes one, and every entry carries a timestamp, so the tool calls and the duration are counted rather than timed by hand.

1. **A fresh session is opened in this repository and given `load waytide` and nothing else.** The hook carries the read instruction, and the agent reads.
2. **The session's transcript is found.** Claude Code writes each session to `~/.claude/projects/-Users-sbellware-projects-waytide-waytide/<session-id>.jsonl`, one entry per line — the engineer's message, an assistant step, or a tool result.
3. **Three numbers are taken.**
   - **Duration** — from the `load waytide` entry to the last assistant entry before the engineer's next message.
   - **Tool calls** — the `tool_use` blocks in that span.
   - **Characters read** — the size of the files the read covers, taken from the files rather than the transcript.
4. **It is repeated over three to five sessions**, and the median and the spread are recorded. The agent's grouping of the reads varies between sessions, and forecast item 2 expects that variance to be as large as the saving.
5. **The derived read is measured the same way**, so the two sides are compared by one method.

**What the method rests on.**

- **The transcript format is Claude Code's working state, not a documented interface.** An update could change it and break the extraction.
- **The extraction is `measure-session-start-read.sh`, at the root of this branch.** The engineer chose to treat it as a disposable measurement tool on 2026-10-10, so it was written directly and is not tested. Its figures for session `b3cce9f3` — 47.1 seconds and 15 tool calls, from 16:24:45.787 to 16:25:32.916 UTC — match the transcript's entries read by hand.
- **Duration depends on the model and on server load.** The sessions compared run on the same model and close together in time.

## Forecast

Committed before the work. Each item carries the agent's confidence.

1. **The derived read is between 450,000 and 520,000 characters**, about a quarter smaller. The footers and README files account for 133,530 of the reduction and the history clauses for the rest. *Moderate confidence — the history clauses have not been measured, and the estimate rests on the footers and README files.*
2. **The read's duration falls roughly in proportion to its size**, since the number of tool calls is unchanged by this experiment. *Low confidence — the agent's grouping of the reads varies between sessions, and that variance may be as large as the saving.*
3. **Removing the footers is mechanical and reliable.** A footer is a run of lines below the last `---` divider, starting `Authored by` or `Changed by`. *High confidence.*
4. **Removing the history clauses is not mechanical.** A sentence carrying a date can carry a directive — *every commit written before 2026-08-18 stands as written* is one. A generator that strips by date pattern will remove directives, and one that does not will keep history. *High confidence, and this is the item most likely to shape what a derived file can be.*
5. **Adherence holds for rules whose directive and `**Why:**` are kept**, which is most of them. *Moderate confidence.*
6. **Where adherence slips, it slips on a prohibition whose force came from the account of what it replaced** — the alternative that was tried and failed. The announce-waytide-at-session-start rule's no-quotation-marks and no-opt-out passages are the predicted cases. *Low confidence.*
7. **The README files cost nothing to leave out**, because each summarizes rules the read already carries. *Moderate confidence.*

**Added 2026-10-12, after the first cut was narrowed.** The items above stand as committed. Item 1 was forecast for a cut that also drops the history clauses, so it is judged against the second cut. Item 4 is likewise tested by the second cut. The first cut's read is about 533,000 characters, the starting point less the footers and the README files. At the starting point's spread, a read about a fifth smaller saves some 6 seconds at the median, which five sessions may not separate from the variance.

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| Working location | Branch only | Sat Oct 10 2026 at 9:56:47 AM PT |
| Participation | Attended | Sat Oct 10 2026 at 9:56:47 AM PT |
| Drift — work on `master` while open on branch only | Suspend | Sat Oct 10 2026 at 10:03:25 AM PT |
| Source subdirectory name | `source/` | Mon Oct 12 2026 at 12:02:30 PM PT |
| History clauses in the first cut | Kept — footers only, history clauses a second cut | Mon Oct 12 2026 at 12:02:30 PM PT |
| The generator's name | `compile`, for now | Mon Oct 12 2026 at 12:47:12 PM PT |
| Actuation | `(cd "$repository" && ./compile.sh)` — no argument | Mon Oct 12 2026 at 12:47:12 PM PT |
| Controls | The repository's own source rules, copied into a control repository | Mon Oct 12 2026 at 12:47:12 PM PT |
| Observation | Each compiled rule is the start of its source, and the rest of the source is footer lines only | Mon Oct 12 2026 at 12:47:12 PM PT |
| Implementation | Written directly | Mon Oct 12 2026 at 12:47:12 PM PT |
| Naming | Is its source rule without the footer | Mon Oct 12 2026 at 12:47:12 PM PT |
| Statements of the read changed | The four that direct it, the deployed bootstrap included | Mon Oct 12 2026 at 1:00:17 PM PT |

## What actually happened

Nothing yet.

### Suspended — 2026-10-10

**The experiment is suspended so work can be done on `master` first.** The engineer switched to `master` while the experiment was open on branch only, and selected suspension over adding a worktree. The branch `experiment/derived-rule-files` is kept, and nothing on it is deleted. No step of the experiment had run: the starting point's tool calls and duration were not yet measured, and no generator was written.

**The record's two later commits from the branch were applied to `master`** — the base and the measurement method — so the record here is whole. They touch this record and nothing else.

### Resumed — 2026-10-10

**The experiment is resumed on its branch, and its `**State:**` line is removed**, which is how an experiment under way is recorded. `master` was merged into the branch first, in `52c5b1c`. That brought in the startup display change, `7778142`.

**That change alters the read this experiment measures.** The agent no longer opens the initialization-rule first or prints the display. So the starting point is measured with the read as it now stands, and the derived read is compared against that measurement rather than against any read taken before 2026-10-10.

### Earlier reads — 2026-10-10

**Four reads taken before the startup display change, measured by the tool.** They are not the starting point, since the read instruction has changed since. They show the spread the forecast expected.

| session | model | duration | tool calls |
|---|---|---|---|
| `68b0d608`, Aug 28 | `claude-opus-5` | 116.9 s | 25 |
| `ab7f9d8c`, Oct 7 | `claude-opus-5-5` | 40.4 s | 18 |
| `f9c2fd39`, Oct 7 | `claude-opus-5-5` | 48.8 s | 21 |
| `b3cce9f3`, Oct 10 | `claude-opus-5-5` | 47.1 s | 15 |

### The compiler — 2026-10-12

**The generator is `compile.sh`, at the repository root, beside `report-direct-commits.sh`.** The engineer named it `compile`, at least for now, over `derive`, `extract`, and `generate`. It takes no argument, and compiles every package under the `system/` of the repository it runs in.

**Each package's rules are moved into `source/`**, 108 in all, with `git mv` so their history follows them. `README.md` and `vocabulary.md` stay at the package root. `language/ete/` becomes `language/source/ete/`, and its compiled rules return to `language/ete/`.

**The compiled rule is the source rule with the footer removed.** The compiler cuts from the end only: the `Authored by` and `Changed by` lines, the `---` divider, and the blank lines around them. A survey of the footers found 118 rule files of one standard shape, the six README files of another, and one rule — record-rule-authorship-in-a-footer — whose body carries example footers in fenced blocks. Cutting from the end keeps those.

**Its test is `test/automated/compile.sh`, built from the repository's own rules rather than a literal control.** The engineer chose the real rules as the control. For that reason the observation reads each compiled rule as the start of its source, with only footer lines beyond it, not the absence of footer lines anywhere. The test was shown to fail against three broken compilers: one that copies the source, one that cuts at the first `---`, and one that writes empty files.

**Two defects in the test were found in passing.** An empty alternative in a `grep -E` pattern is an error on macOS, and the error made the check pass, so the first run was green for the wrong reason. `head -n 0` is an error on macOS too. Both were corrected before the commit.

**The read is not yet pointed at the compiled rules.** Until it is, a session on this branch reads both the source and the compiled rules.

### The read is pointed at the compiled rules — 2026-10-12

**Every statement that directs the read now leaves out each package's `source/` directory and `README.md`.** There are four:

- the instruction `session-start.sh` carries
- `AGENTS.md`, this repository's hand-maintained bootstrap
- the rules-convention's line directing the read, compiled again after the edit
- the bootstrap `install.sh` writes into a consuming project's `AGENTS.md`, and its account of that bootstrap

**The engineer included `install.sh` so the branch behaves in a deployed project as it does here.** The compiled rules and `session-start.sh` reach a consuming project inside the packages, but that project's `AGENTS.md` comes from `install.sh`. Left unchanged, it would tell a deployed session to read every rule file while the hook told it otherwise. The change was checked in a temporary repository, with `install.sh bootstrap` and with `install.sh agents-md` against an existing `AGENTS.md`. The installer was not run in this repository.

**Two rules still describe the read as every rule file**, and are left until the result is known: the initialization-rule's account of the loading line, and the announce-waytide-at-session-start rule. They describe the read and direct nothing.

**The compiled read is 550,582 characters across 119 files, by the starting point's count**, against 667,402. The 116,820 removed are the README files, 59,090, and the compiled rules' footers. It is larger than the forecast's 533,000 because that figure took every footer in the read, and about 11,400 of it is in files that are not compiled: the vocabularies and the local rules. The README footers were also counted in both the footer and the README figures.

### The compiled read is measured — 2026-10-12

**Five fresh sessions on `claude-opus-5-5`, run one after another between 00:36 and 00:40 UTC on 2026-10-13, on this branch at `21316ac`.** Each was started with `claude --model claude-opus-5-5 "load waytide"`, so the command could not be mistyped.

| session | start (UTC) | duration | tool calls |
|---|---|---|---|
| `ecd566ed` | 00:36:32 | 25.7 s | 8 |
| `d7601df5` | 00:37:05 | 47.2 s | 20 |
| `285718c5` | 00:38:07 | 29.6 s | 10 |
| `dace18d9` | 00:38:43 | 30.9 s | 8 |
| `1dce8ac9` | 00:39:22 | 26.8 s | 8 |

| | starting point | compiled read |
|---|---|---|
| characters | 667,402 | 550,582 |
| median duration | 32.4 s | 29.6 s |
| duration range | 20.5–45.1 s | 25.7–47.2 s |
| median tool calls | 10 | 8 |
| tool call range | 8–13 | 8–20 |

- **No session opened a source rule or a README.** Each transcript's tool calls were checked. Every mention of `source/` or `README.md` was an exclusion in a `find` or a `grep -v`.
- **The startup display printed in all five.**
- **The median fell 2.8 seconds, about 9%, against a read 17.5% smaller.** The two ranges overlap almost entirely, so five sessions do not separate the change from the variance between sessions. This is what the forecast's addendum of 2026-10-12 expected for this cut.
- **The outlier, `d7601df5`, is in how the agent grouped its reads, not in what it read.** It printed the foundation rules in several batches whose output Claude Code saved to files, then opened those files, and then wrote the other packages to its scratchpad and opened those. That is 20 tool calls against 8 in three of the other sessions.

---

Authored by Scott Bellware on Sat Oct 10 2026 at 9:56:47 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:59:24 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 10:03:25 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 10:26:18 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 10:56:59 AM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 11:58:56 AM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 12:02:30 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 12:47:12 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 1:00:17 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 5:40:40 PM PT
