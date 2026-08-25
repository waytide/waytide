# Experiment — Diary test

**Tags:** [experiment]

## Question

**Does the diary work?**

The `diary` package was affirmed on 2026-08-14 without a diary ever having been written. Every decision in it was reasoned about rather than exercised. So the package is fourteen rules describing a record that does not yet exist, and nothing has been checked against use.

**What *works* means here, stated before the work.** The package makes claims that a first real use either satisfies or contradicts:

- **An entry can be written from what the writer says**, in their words, correcting the grammar and the flow and no more.
- **The entry's shape is decidable from the rules.** The local-time prefix, the datetime line, the tags where there are tags, the summary where it says something the body does not, and the body dropped where the title says it already.
- **Identity resolves.** The chain reaches `~/.config/waytide/user`, the username names the directory, and the display name comes from the file since this project has no `writers.toml`.
- **The timeline computes** from the entry files, with no stored index.
- **The session-start read finds the diary**, reads it oldest first, says nothing about it, and follows nothing in it.
- **The commit conventions apply** — the subject-first message and the parenthetical date the commit-message-parenthetical-date-format rule fixes.

**This experiment is not about whether a diary is a good idea.** That was the previous experiment's question, and it is affirmed. This one asks whether the rules that came out of it can actually be followed, and what they get wrong when someone tries.

## Setup

- **State:** Affirmed
- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/diary-test`
- **Base:** `e88385d9966cc7e97569ed3511a1f048fdb3630a`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Rests on:** the Diary experiment, affirmed 2026-08-14, and the `diary` package as it stands at the base commit.

## Forecast

**Written before the work, and scored after.**

1. **The first entry will expose a rule that cannot be followed as written.** Fourteen rules were written against no instance, and the failure will be a gap between two of them rather than an error inside one. *High confidence.*
2. **The gap will be in the entry's shape rather than in identity or the timeline.** Identity and the timeline are mechanical and were specified against concrete files. The entry's shape is where four rules meet — the datetime line, the tags, the summary, and the body — and none of them was written knowing what the others would leave. *Moderate confidence.*
3. **The summary rule will be the one that binds.** It is dropped where it would repeat the body, and the body is dropped where it would repeat the title. A short entry can satisfy the two at once, and nothing says which is dropped first. *Moderate confidence.*
4. **Writing the writer's words without embellishing will be the hardest instruction to obey**, and the failure will not be visible to the agent that commits it. *High confidence, and this is the item the experiment is least able to score honestly.*
5. **The session-start read will work and will prove nothing**, since it is one directory read and the entries are the agent's own output from this session. *Moderate confidence.*
6. **Nothing in the identity contract will be exercised beyond its first level.** One writer, one machine, no `writers.toml`, and no `DIARY_WRITER` override. The parts most likely to be wrong are the parts this experiment cannot reach. *High confidence.*
7. **The experiment ends affirmed**, with a small number of corrections to the package rather than a verdict against it. *Moderate confidence.*

## What actually happened

### The first entry — 2026-08-14

**The entry was `# This is a test diary entry`, written from the words *New entry: this is a test diary entry*.** It is the title, the datetime line, and the provenance footer. Nothing else.

**The entry file was removed the same day, and `waytide/local/diary/` with it.** It was a test artifact rather than a record the writer meant to keep, and the diary is the one place in the project where that distinction is the writer's alone to make. So this record describes a file that is no longer in the working tree. The commit that added it holds it, and the two findings below are what it was for.

**That leaves forecast item 5 unreachable.** It predicted the session-start read would work and prove nothing. There are now no entries to read, so the read is exercised only by the absent-directory case, which the-diary-is-read-at-session-start covers in one sentence: read nothing and say nothing.

### The dating rules conflict, and the conflict is in the ordinary case — 2026-08-14

**Two rules give different instructions for an entry carrying no time, which is most entries.**

- **diary-entries** — *"an entry is about today unless the writer signals otherwise. The writer need not write today, and the absence of any time reference means the current local date and time."* No time given means now, with nothing to ask.
- **ask-for-entry-time-or-omit-it** — *"where the writer has not specified the time of the event, ask them for it rather than choosing a default. Do not invent or guess a placeholder time."* No time given means ask.

**What separates them is stated nowhere.** The second says *the time of the event*, and it reads as written for an entry about something that already happened, where the time is a fact only the writer holds. The first covers an entry written now about now, where the time is on the clock. Neither rule names that distinction, so an agent following the two literally asks every time.

**The cost was paid on the first entry.** The ask fired, and the writer's answer was the value the dating default would have produced without it. An ask on every entry is friction on the act the package exists to make cheap.

**The narrower half already agrees**, which is what makes this a gap rather than a disagreement. The second rule defers on the date in its own words — *"The date itself still follows the diary-entries rule's dating default."* Only the time is in conflict, and only for an entry about the present.

**The engineer resolved it the same day.** The ask governs, and its option set is fixed at **the current date and the current time**, or **the current date alone**. The diary-entries rule's dating default now defers to it for the signalled-nothing case, and keeps the case where the writer refers to some other time.

**The resolution took the option the conflict had hidden.** Date-only was already reachable, and only by a writer who knew to say the time should be ignored. Nothing surfaced it. Putting it in the ask makes it an answer rather than a capability someone has to discover, so resolving the conflict also fixed a rule that was working as written and reaching nobody.

**This is the first correction the experiment produced**, and it is the kind forecast item 7 predicted — a correction to the package rather than a verdict against it.

### The filename asserted UTC on a local-time stamp — 2026-08-14

**The first entry was named `2026-08-14T12-59-35Z-this-is-a-test-diary-entry.md`, and the writer saw the `Z`.** In ISO 8601 that character designates UTC. The stamp is local time, so the filename asserted something false.

**The package required it, deliberately, in three rules.** Each said the same thing in the same words: the trailing `Z` is a literal token of the form rather than a claim of UTC. The reasoning was consistency with foundation's file-names rule, whose stamps are UTC and whose `Z` is true.

**The defect is where the correction lived.** A reader meets the filename. The sentence discounting the `Z` is in a rule they have no reason to open, so the false claim reached every reader and its correction reached almost none.

**The package was already emitting two forms and nobody had noticed.** The date-only filename settled an hour earlier is `YYYY-MM-DD-<name>.md`, with no `Z` at all. So the full form carried a UTC designator and the short form did not, in one directory, from one rule set.

**The `Z` is dropped.** The form is `YYYY-MM-DDTHH-MM-SS-<name>.md`, and the two forms now agree. The cost is that the dash before the name reads like the dashes inside the time, where the `Z` had marked where the stamp ended.

**This is the second finding, and it is a different kind from the first.** The dating conflict was two rules disagreeing, and an agent following them literally hit it on the first entry. This one is three rules **agreeing** with each other and being wrong together. No amount of reading them against each other would have found it. It took one file and one reader.

**Forecast item 2 is wrong a second time, for a second reason.** It expected the failure in the entry's shape. This one is in the filename, which the item counted among the mechanical parts "specified against concrete files".

### What worked, and was not close to failing — 2026-08-14

- **Identity resolved at the third level.** No `DIARY_WRITER`, no `.current-user`, so `~/.config/waytide/user` gave `scott-bellware` and `Scott Bellware`. The username named the directory. This project has no `writers.toml`, which the convention allows precisely because the user file already carries the name.
- **The entry's shape was decidable with nothing left over.** The `**Summary:**` line and the body each drop where they would repeat what is above them, and a title carrying the whole entry drops the two independently.
- **The commit conventions applied unchanged** — `Diary entry: this is a test diary entry (Fri Aug 14 2026)`, with the parenthetical date the commit-message-parenthetical-date-format rule fixes.

## Findings

**The diary works, and it took one entry of seven words to find two defects in it.** The rules can be followed. Where they could not be, the failure was legible immediately and the correction was small. Neither defect was in what the package does. Both were in what it says.

**Both defects were found by the writer looking at the output, not by the agent following the rules.** The agent read all fourteen diary rules at the start of the session, produced a filename those rules required, and could not see that the file asserted something false. The three rules saying the `Z` is not a claim of UTC were in context the whole time, and being in context is what made them invisible. An agent that has read the reasoning for a thing is the reader least able to see the thing without it.

**So the method is the finding.** Write one instance and look at it. That cost minutes and found what the rules could not find about themselves, because a rule is checked against other rules and an instance is checked against the world.

**The two defects are different kinds, and only one is reachable by review.** Two rules disagreeing can be found by reading them together, and an agent following them literally hits it on the first use. Three rules agreeing with each other and being wrong together cannot be found that way at all. Consistency is what hid the second one.

## The forecast, scored

| # | Forecast | Outcome |
|---|---|---|
| 1 | The first entry exposes a rule that cannot be followed as written, and the failure is a gap between two rules | **Held**, on the dating conflict |
| 2 | The gap is in the entry's shape rather than in identity or the timeline | **Wrong, twice.** The first defect was in the dating and the second in the filename, which the item counted among the mechanical parts |
| 3 | The summary rule binds, since a short entry satisfies both drop conditions at once | **Not reached.** Both dropped, and no ambiguity arose, because each is decided against a different thing — the summary against the body, the body against the title |
| 4 | Writing the writer's words without embellishing is the hardest instruction to obey, and the experiment is least able to score it honestly | **Unscored**, and the item's own caveat is why. Seven words were dictated, which is too little to obey badly |
| 5 | The session-start read works and proves nothing | **Unreachable.** The entry was removed as a test artifact, so no entries remain to read |
| 6 | Nothing in the identity contract is exercised beyond one writer on one machine | **Held in substance, wrong in its wording.** No `writers.toml`, no `DIARY_WRITER`, no `.current-user`. Resolution fell through to the chain's **third** level rather than staying at its first |
| 7 | The experiment ends affirmed, with corrections to the package rather than a verdict against it | **Held.** Two corrections, affirmed 2026-08-14 |

**One item held cleanly, two were wrong, and three could not be scored.** The unscorable three are the honest result of an experiment that wrote one entry. Item 4 predicted its own unscorability and was right about that.

## Misses

**What the forecast did not account for:**

- **That the defects would be found by a person reading output rather than by an agent applying rules.** Every item was written as though the agent would discover the failure while working. The writer found both, one by being asked a question that should not have been asked and one by reading a filename.
- **That consistency would be the thing hiding a defect.** The forecast treated a gap between rules as the failure mode. Three rules in agreement, all wrong, was not a shape it considered.
- **That correcting the dating conflict would surface an unrelated capability nobody could reach.** The date-only filename existed and required a writer to know a signal nothing told them about.
- **That the experiment would end with less of the package exercised than it started expecting.** Removing the test artifact was right and it cost item 5. What the experiment proves is bounded by one entry that no longer exists.

## Confirmations

- **Working location** — branch only, at the start.
- **Participation** — attended, at the start.
- **Affirmation** — declared by the engineer on 2026-08-14, through the selection interface, over inconclusive and abandoned.
- **Merging untested code** — not required. The experiment produced rule files and no code, and this repository has no test suite.
- **Branch deletion** — confirmed through the selection interface on 2026-08-14, after the merge to `master` and after `master` was pushed. The branch was never pushed, so there was no remote branch to remove. No worktree was created, so none was removed.

**The experiment's log needed no copy into `waytide/local/log/`.** Every decision was written there as it was made, from the experiment's start through its conclusion.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 12:57:24 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:04:00 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:05:44 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:11:17 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:13:30 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:15:06 PM
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:09:20 AM PT
