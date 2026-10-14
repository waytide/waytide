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
| README-only directives | Adherence sessions | Mon Oct 12 2026 at 5:53:01 PM PT |
| How history is told to the compiler | A `## History` section in the source rule | Mon Oct 12 2026 at 9:19:14 PM PT |
| Second outcome — observation | Two outcomes, each with its own check | Wed Oct 14 2026 at 1:26:07 PM PT |
| Second outcome — controls | The repository's own source rules | Wed Oct 14 2026 at 1:26:07 PM PT |
| Second outcome — implementation | Written directly | Wed Oct 14 2026 at 1:26:07 PM PT |
| Second outcome — naming | Removes only the History section | Wed Oct 14 2026 at 1:26:07 PM PT |
| The second cut | Built and reviewed, no duration sessions | Mon Oct 12 2026 at 9:09:53 PM PT |

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

### The README files are checked against the rules — 2026-10-12

**Each package's `README.md` was read against its rules and vocabulary for anything no rule states**, to test forecast item 7 without sessions. Three agents ran the check, one for foundation, one for git, language, testing and versioning, and one for design-by-efferent and journal.

**Forecast item 7 holds except for four directives that only a README states:**

- **foundation:** `waytide/system/` is "never edited in place". The rules-convention says where a package rule is edited, so the prohibition can be inferred, but no rule states it.
- **foundation:** a package's repository is its installed path with the slashes turned to dashes, and a package declares a different one on a `**Repository:**` line in its README. It concerns whoever creates or publishes a package.
- **versioning:** building and publishing belong to the distribution technology's package, not to `versioning`. Nothing else states it.
- **design-by-efferent:** read `vocabulary.md` before the rules. Only the order is at stake, since the vocabulary is still read.

**The language README's statement of where a package's terms go is not lost.** Foundation's vocabulary-convention carries it.

**Two README statements contradict their rules, and leaving them out removes the contradiction.** The language README says the precise word "is very often the plainest one", where the language-is-precise-here rule says precision "is not plainness either". The testing README says the package is "not tied to a specific test-framework API", where its rules use TestBench.

**The rest is for people:** install steps, dependency diagrams, history, and the license, with several stale passages, such as the foundation README's account of the retired `deferred/` directory.

**Two rules read a README as data rather than as reading:** the `Includes` line, by the a-citation-is-not-a-dependency and a-project-declares-its-package-set rules. `session-start.sh` computes the package set itself and hands it to the agent, so the session-start read does not need the README for it.

**The vocabulary-first directive was not followed in any of the ten sessions measured, with or without the README.** In all ten, the design-by-efferent rules were read before its vocabulary, including the three starting-point sessions whose read included that README.

### Adherence sessions for the README-only directives — committed before they run, 2026-10-12

**The engineer chose sessions over recording the gaps alone.** Each of the three remaining directives is put as a request to a fresh session with each read, and the answers are compared.

- **The full read** is the starting point, `7105e2e`, in a worktree at `../waytide-full`, detached. The experiment branch is not switched and `master` is not touched.
- **The compiled read** is this branch.
- **Each session** is started with `claude --model claude-opus-5-5 "load waytide"`, and given one request once the read finishes. Each request ends "Answer only; change nothing."
- **Six sessions**, one per request per read, so no answer is shaped by an earlier one.
- **The transcripts are graded against the expectations below**, and where the agent found its answer is noted — for example, whether it opened a README or `refresh-packages.sh`.

| request | expected answer |
|---|---|
| In a project that installs Waytide, I found a mistake in `waytide/system/git/commit-message-widths.md`. Where do I fix it? Answer only; change nothing. | In the authoring source, then published and refreshed into the project. The installed copy is not edited in place. |
| I'm adding a package at `system/tools/ruby-lang`. What will its component repository be called, and how would I give it a different name? Answer only; change nothing. | `tools-ruby-lang`. A different name is declared on a `**Repository:**` line in the package's README. |
| Add a rule to the versioning package for building and publishing a Ruby gem with `gem build` and `gem push`. Answer only; change nothing. | The steps do not belong in `versioning`. They belong to the Ruby distribution package. |

**What the result can and cannot say.** The same answer from the two reads means the directive is inferred from the rules or found on demand, so leaving the README out costs nothing for it. A difference is evidence that the README carried something the read needs. One session per side shows a difference but cannot show it is reliable, and a direct question is not the situation a directive was written for: an agent asked where to fix a file may reason to the answer where an agent mid-task would edit it.

### A second round of reads — 2026-10-12

**Twelve sessions were run with `load waytide` alone, six with each read, and no request followed the read.** The adherence requests were not given, so they answer nothing about adherence. They are a second round of the read's measurement, and the first in which the two reads ran back to back: the full read from `../waytide-full` at `7105e2e` between 00:58 and 01:03 UTC on 2026-10-13, then the compiled read from this branch at `aaac29c` between 01:03 and 01:07 UTC.

| | full read | compiled read |
|---|---|---|
| median duration | 31.5 s | 28.9 s |
| duration range | 26.1–42.8 s | 24.2–39.1 s |
| median tool calls | 10 | 9 |
| tool call range | 8–16 | 7–15 |

| session | read | duration | tool calls |
|---|---|---|---|
| `f32cc5ec` | full | 42.8 s | 14 |
| `0f27aa0a` | full | 35.6 s | 16 |
| `ed2ac794` | full | 26.1 s | 9 |
| `87315241` | full | 26.1 s | 8 |
| `d902ef8f` | full | 33.7 s | 10 |
| `fb425f71` | full | 29.2 s | 10 |
| `8b58e217` | compiled | 30.3 s | 10 |
| `37a2be70` | compiled | 39.1 s | 15 |
| `d3d2d032` | compiled | 27.5 s | 9 |
| `716214cf` | compiled | 27.9 s | 9 |
| `0ff558a0` | compiled | 24.2 s | 7 |
| `a7ec9f05` | compiled | 29.9 s | 8 |

- **The second round repeats the first.** The compiled read's median is 2.6 seconds lower, against 2.8 in the first round.
- **Over both rounds, eleven sessions a side,** the medians are 32.4 seconds and 10 tool calls for the full read, and 29.6 seconds and 9 tool calls for the compiled read.
- **The ranges still overlap almost entirely.** Two rounds in the same direction make a real but small saving more likely, and do not establish one.

### The adherence sessions — 2026-10-12

**The two reads gave the same answer to each request.** Leaving the README files out changed no answer.

| request | full read | compiled read |
|---|---|---|
| Where a mistake in an installed rule is fixed | Met: in the authoring source, then published and refreshed. The installed copy is "never edited in place". No tool calls. (`8e906388`) | Met: the same answer, in the same words. Two tool calls, to check this branch's layout, and it added that on this branch the edit goes in `source/`. (`98e652e9`) |
| A package's repository name | Met: `tools-ruby-lang`, and a `**Repository:**` line in the README for another. Found by reading `refresh-packages.sh`, not the README. One tool call. (`2e5fea22`) | Met: the same, found in `CONTRIBUTING.md`, `install`, and `refresh-packages.sh`. Three tool calls. It went further, naming the installer's own table and a gap in `report-direct-commits.sh`. (`ce482602`) |
| A gem build and publish rule in `versioning` | Partly met: it said the rule belongs where the Ruby stack is settled, `ext/ruby-lang`, then drafted it for `versioning` anyway. (`bafc1db8`) | Partly met: the same objection, on the same grounds, then the same draft. (`f774783b`) |

- **Neither session found an answer in a README.** The full read had the README files in its read, and still found the repository rule in `refresh-packages.sh`, and the versioning boundary in the version-scheme rule's pointer to `ext/ruby-lang` and in the run-suite-before-commit rule.
- **The versioning boundary was half-honored by both reads.** Each objected and then complied. That is a gap in the rules, not in the read: no rule states that release mechanics stay out of `versioning`, and the README that says so did not change the outcome.
- **Forecast item 7 holds for these three directives**, within what one session a side can show.

**Found in passing: `report-direct-commits.sh` ignores the `**Repository:**` line.** It derives each repository name from the path alone, at line 50, so a package that declares another name is reported as having no `master` and skipped. Confirmed by reading the script. It is a defect on `master` as well, and outside this experiment.

### The history clauses are surveyed — 2026-10-12

**The compiled rules carry 56 sentences with a date, 8,357 characters, 1.5% of the compiled read.** They were counted outside fenced blocks, splitting each paragraph at sentence ends. "Until" leads 26 of them, and "on" 14.

- **Forecast item 1 is refuted by the files alone.** It put the read with the footers, the README files, and the history clauses removed at 450,000 to 520,000 characters. Removing the dated sentences takes the compiled read to about 542,000. The forecast assumed the history clauses were far larger than the dated ones are.
- **Forecast item 4's example is among them:** "Every commit written before 2026-08-18 stands as written" is a directive carrying a date.
- **Most of the history in the rules carries no date** — the accounts of what a rule replaced and of alternatives tried. A cut by date does not reach it.

**The engineer chose to build the dated cut and review what it drops, without duration sessions.** A 17.5% smaller read moved the median by under 3 seconds, within the variance, so a 1.5% cut would measure noise. The review tests forecast item 4.

### History is marked in the source — 2026-10-12

**The engineer does not want the compiler's correctness to depend on inspecting the corpus by hand.** A cut by date cannot meet that. A date does not say what a sentence does: "Every commit written before 2026-08-18 stands as written" is a directive, and "It read `a moment` until 2026-07-28" is history, and the two match one pattern. Forecast item 4 is affirmed by the design, before any code: removing history is not mechanical.

**Dated sentences outside code, by what they do:**

- **History**, most of them.
- **Directives:** commit-message-widths' commits before 2026-08-18, work-sessions-convention's records before 2026-08-03, and a-suspension-is-a-log-entry's `Suspended` as the one reserved tag since 2026-08-25.
- **An illustration:** a-vocabulary-entry-says-what-a-term-means' *it was X until 2026-08-25*, its example of what an entry must not carry.
- **A current fact:** tests-are-automated-or-interactive's composite repository "as of 2026-08-24".
- **And a sentence-level cut orphans what follows.** A history passage often runs over several sentences with the date only in the first, so the next sentence begins with an "It" that refers to nothing.

**So history is marked in the source, in a `## History` section before `Related:`.** The engineer chose it over marking the dated sentences to be kept. The author decides once what is history, the compiler drops the section, and the test checks that the footer and that section were removed and nothing else. Whole passages move, so nothing is orphaned, and undated history can move with them. Marking the exceptions would leave a dated directive written later, unmarked, dropped silently.

### History is moved into History sections — 2026-10-14

**The engineer chose to move all plain history, dated or not, with the agent making every call.** The rule for a call: a passage moves only when it is plainly history and the directive reads whole without it, and anything in doubt stays. A wrong call can then only leave history in the read, never take a directive out of it. Six agents worked the packages in parallel to one brief, and the convention went into the rules-convention first: a rule's history goes in a `## History` section before `Related:`.

**4,218 characters moved, from 10 of the 108 rules, about 0.8% of the compiled read.**

| package | rules edited | rules read |
|---|---|---|
| foundation | 7 | 39 |
| journal | 2 | 10 |
| git | 1 | 7 |
| design-by-efferent, language, testing, versioning | 0 | 52 |

- **Most dated passages stayed, as reasoning or directive.** The agents left in place every passage whose account of a past form is the reason a directive holds — the announce-waytide-at-session-start rule's account of the bold command, the foil request, and the hyphen among them — and every dated directive.
- **The edits are moves.** A word count of each edited rule against its last commit shows nothing removed but a leading "It", "That", or "So", each replaced by what it named so the passage reads on its own in its new place. One paragraph in ideas-convention was left as a bare bold lead, and its lead was joined to its passage in the History section.
- **Undated history turned out to be scarce.** The design-by-efferent, language, and testing agents found none they judged plain.

**Found in passing: tests-are-automated-or-interactive contradicts itself.** It places the composite "in that second state as of 2026-08-24", with no automated suite, and then says the first automated test arrived on 2026-10-10. The second sentence was added on 2026-10-10 without the first being revised. It is a defect on `master` as well.

### The compiler leaves out the History section — 2026-10-14

**The compiled rule leaves out the History section as well as the footer.** The section runs from a `## History` line to the `Related:` line or the footer's `---`. The compiler skips it as it reads, then trims the footer from what is left.

**The test has two outcomes, each with its own check, chosen by the engineer over one combined check.**

- **Is its source rule without the footer** now reads each compiled rule against its source with the History section left out.
- **Removes only the History section** reads that no compiled rule keeps a `## History` line, and that every line removed lies in the section or the footer.

**The test was shown to fail against three broken compilers:** the previous one, which keeps History; one that cuts from `## History` to the end of the file; and one that drops the heading and keeps the section.

**The section first ran to the end of a rule with no `Related:`.** For initialization-rule that took in the footer, and the footer check found no footer removed. The section now ends at the footer's `---` too, in the test and in the compiler alike; the compiled output is the same.

**The compiled read is 547,006 characters across 119 files**, 3,576 fewer than with the footers alone: the 4,218 characters of history, less the convention line the rules-convention gained.

**The compiler's correctness is established by the test alone.** History is marked in the source, so no reading of the output is needed — which is what the engineer asked for.

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
Changed by Scott Bellware on Mon Oct 12 2026 at 5:53:01 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 6:07:51 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 6:20:35 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 9:09:53 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 9:19:14 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:16:20 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:26:07 PM PT
