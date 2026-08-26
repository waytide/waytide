# Work Session — The system is cut back to what it uses (Tue Aug 25 2026 13:35)

Seven days that began by moving one directory and ended by removing four mechanisms. The work started as ordinary maintenance — where a migration record belongs, what the system's description says — and turned into a distribution question when the Ruby package left the default set. Answering that produced **package sets**, which is the one thing built in the gap. Everything after it was subtraction: the deferred queue, the mode vocabulary, the observation lifecycle, and every hard-wrapped line came out. The last day closed eleven ideas, four of them by abandonment, and settled the largest question underneath them — the core of Waytide keeps Design By Efferent.

**This is the communicable record, and it covers a gap rather than a sitting.** The durable records are the source of truth: the rules under `system/` and `local/rules/`, the ideas in `local/ideas/`, the decision log in `local/logs/log/`, and the implementation records in `local/implementations/`. This narrative points at them and does not restate them. The gap runs from 2026-08-19, where *The record types collapse into three* left off, to 2026-08-25, and it holds 142 log entries. Its boundaries are the week rather than one discrete piece of work, which is what the engineer asked for.

## 1. A migration record moves under `logs/` and moves back the same day

`migration/` was made the fourth running record beside `log/`, `loops/`, and `work-sessions/`. Within hours it moved back out.

**What settled it was a paragraph.** The rule grouping the running records had to carry an exception explaining why a migration record was different — it arrives as a plan and stays as a trail, where the other three only ever accrue. The log entry names the tell: *an exception written for one member of a set is the tell that the membership is wrong*.

**The distinction it produced is `durable` against `chronological`.** A migration record is kept after the content has gone, and being kept is what made it look chronological. The `logs-directory` rule and the `migration-convention` each now state the boundary, so neither reader has to find it in the other.

## 2. The generalized description settles

*Waytide: Human-Agent Relations* was settled as the category line, with a description line under it. The aspiration *A Generalized Description of Waytide* came off `Deferred` and returned to `Active` with the README pass outstanding. That pass finished on the last day, and the record is now `Realized`.

## 3. Ruby leaves the default distribution

The Ruby package was the only one naming a language and it was installed by default, so a project that is not Ruby read its rules every session for nothing.

**The feature was renamed mid-flight** from Language-Specific Distribution to Tool-Specific Distribution — the axis is a tool rather than a language, since the package held RubyGems and TestBench conventions alongside the language's.

**The package left the composite entirely.** It is authored in `waytide/waytide-ruby` now, and nothing splits into it. Its dependency is every package this composite holds, which is what makes installing it enough for a Ruby project.

**One rule came out of the mechanics.** A package's repository is its installed path with the slashes flattened, and a package may declare a different one on a `**Repository:**` line that `refresh-packages.sh` reads. The Ruby package is the one that declares.

## 4. Package sets

This is the substantial build of the week, and it started as something else. The Content and Web feature was started to explore conventions for content aimed at the web, and eleven of its seventeen commits turned out to be about package sets. The engineer renamed the feature to match what it had become.

**A package set is a named list of packages, installable by name.** `install` takes a list where a name is a set or a package, and `content` is the first set beside `default`.

**A project declares which of its installed packages are active.** The declaration is a dated record under `local/`, carrying what was declared, what it resolved to, and what was inactive at that moment.

**Deactivation means read and not applied, not unread.** That was the load-bearing decision. The session-start read stays whole and unconditional, so a deactivated package's rules can still be cited, weighed, and reactivated inside a session. It also dissolved the objection a parked idea had raised against inventing a dormant package at all.

**A set declared mid-session takes effect at the next one**, and the engineer is told so at the moment they declare it — a mechanism whose effect is delayed and does not say so reads as one that did not work.

The record is `local/implementations/2026-08-23T08-09-02Z-package-sets-COMPLETED.md`.

## 5. The grouping becomes `ext/`

`tools/` was named for a tool and collected something else. It became `ext/`, for external and extension both.

**The migration crossed three repository boundaries** and produced the week's sharpest mechanical lesson: **a subtree's prefix is changed by removing the directory and re-adding at the new prefix, never by `git mv`**. Git records the prefix in a commit message, so moving the directory leaves that record naming the old path and the next pull reports `was never added`. The migration found this by failing at it.

**It also surfaced a live defect.** The Ruby package's installer fetched `install-all.sh`, which the composite had renamed to `install`, so every Ruby install had been failing with curl exit 56 since that rename reached `master`.

## 6. Tests are automated or interactive

`test/` holds `automated/`, `interactive/`, or both, and only the automated tests run before a commit. An interactive test needs a person, so nothing spends their attention on a schedule.

**The composite moved all three of its tests to `test/interactive/`** and now holds no automated suite at all. Each installs packages from real repositories over the network and drives an installer that writes a project tree. The pre-commit run has nothing to run, which is satisfied vacuously rather than violated — and every commit report since says so rather than claiming a suite passed.

A companion rule marks a suspended test file with a leading underscore, and states that the underscore does not exclude itself: a glob returns it, so whatever runs the suite excludes the mark explicitly.

## 7. The README is figurative for the uninitiated

A local rule settles that the root `README.md` is written for a reader who holds none of Waytide's terms, and reaches for a figure where a figure is what lands. An apparent contradiction with the `language` rules is not a defect there and is not reported as one.

**It came from a preference the engineer stated after the agent reported one.** The rule names what it gives up: the README stops being an example of the system's own standard, and a reader who adopts Waytide from it meets the vocabulary in tension. What it does not license is a false statement, or slang in place of an available plain word.

## 8. A log entry names the record, and does not assert what it settles

The engineer observed that log entries pertaining to an idea were written as though the idea had been implemented. It was true: six entries for an `Open` idea stated unbuilt behavior in the indicative mood, and their commit subjects carried the same claim.

**The corpus already held both forms.** Earlier entries read *X is recorded as an idea — Open because …*. The recent batch had drifted from a rule already on the books.

**The pull has a source worth naming.** The `git` package asks for the changed thing stated as fact in indicative mood, and that is right for a change to the software. An idea is not one. The fact about it is that it was recorded.

The six entries were corrected on instruction, and the rule that carries the obligation is `an-idea-takes-a-log-entry`.

## 9. The realization sweep, and four abandonments

The last day closed eleven ideas. Seven were realized, several of which had been finished for days with nobody updating the record — *The Ruby package leaves the default distribution* was done on 2026-08-21 and still read `Open`.

**Four were abandoned, and they shared one shape.** A settled *how* stopped by an unsettled *whether*. *Design By Efferent is an `ext/` package* knew its destination, its increments, and its costs; what stopped it was whether the move should happen at all.

**Two features were started and abandoned in the same day.** Self-Explanation produced a `foundation` rule that was exercised once and discarded. The `ext/design-by-efferent` feature produced a migration record and no increments. Neither branch merged, and both were deleted.

## 10. Four mechanisms come out

**The deferred queue.** Its session-start print, its convention, and its `next-deferred-item` command are all suspended. What made it a queue was the print and the command, and `**Waits for:**` and `**Priority:**` are now two optional lines any idea may carry, with no tag reserved for them.

**The mode vocabulary.** A project once worked in one of three modes, and the mode fixed what a planning record was called. The mechanism was decommissioned in July and its six words outlived it as a tag set that still read as exhaustive. An idea is an idea now; a tag may describe one, and **none is assigned by default**.

**The observation lifecycle.** An observation's state is `Stated` and never changes. Sixteen sat at `Open` and moved nowhere, because there was nowhere for them to move.

**Every hard-wrapped line.** A paragraph is one line and the reader's editor wraps it. 84 rule files, then 87 records, then one journal entry on the writer's instruction.

## 11. The core keeps Design By Efferent

The question underneath the `ext/` abandonment was answered: the core should not be without the method, at least for now, and the decision may be revisited. That makes the abandonment a decision rather than a deferral, and it keeps the local rule holding the method off content work in this repository — reversing what that rule expected of itself.

## Takeaways

- **An exception written for one member of a set is the tell that the membership is wrong.** The migration record's day under `logs/` is the worked case.
- **Deactivation is read and not applied.** Keeping the read whole is what let a package be switched off without weakening the mechanism that carries the rules.
- **A rule's name is part of what it says.** `direction-and-sequencing-artifacts-take-a-log-entry` had the mode vocabulary in its name, and removing the vocabulary meant renaming the rule.
- **A careful tense is not enough.** An entry can be conditional in every sentence and still leave a reader believing the project worked something out. The test is the subject, not the grammar.
- **Most of the week was subtraction, and the system reads better for it.** Four mechanisms out, four rules written, and one thing built.

## Glossary

- **package set** — a named list of packages, written down and installable by that name. `default` and `content` are the two.
- **deactivation** — a package's rules read at session start and not applied. Not unread.
- **`ext/`** — the grouping for what is external to a project or an extension of it, named for what a thing is to the project rather than what kind of thing it is.
- **`Stated`** — an observation's one state, carried from the moment it is written and never changed.
- **distributable rule** and **local rule** — how a rule travels, and whose it is. Neither is `system rule`, which is where it sits.
- **hard wrap** — a newline inserted to hold a column width, as against the paragraph break between two paragraphs.

## Where the durable records live

- **The rules** — `system/foundation/`, `system/journal/`, `system/testing/`, and the local rules in `local/rules/`. Written in the gap: `a-project-declares-its-package-set`, `a-record-list-is-a-table`, `a-sha-names-the-work-rather-than-the-commit`, `tests-are-automated-or-interactive`, `a-suspended-test-file-is-named-with-a-leading-underscore`, `prose-is-not-hard-wrapped`, `a-vocabulary-entry-says-what-a-term-means-not-what-it-was`, `the-log-never-says-undone-work-was-done`, and the local `the-readme-is-figurative-for-the-uninitiated`.
- **The implementation records** — `local/implementations/`, for Tool-Specific Distribution, Package Sets, the ext grouping, and the two abandoned features.
- **The migration records** — `local/migration/`, for the Ruby package's move and the `tools/`-to-`ext/` rename.
- **The ideas** — `local/ideas/`, all of which now carry a terminal state.
- **The decision log** — `local/logs/log/`, 142 entries for this gap.

## A closing note

The week's shape is worth naming because it was not planned. One directory move exposed a membership question, which exposed a distribution question, which produced the only thing built. Everything after that was the system noticing what it was carrying and putting it down. The four mechanisms removed had one property in common — each was built for a case that then stopped arriving, and each kept costing something every session until somebody said so.

---

Authored by Scott Bellware on Tue Aug 25 2026 at 1:35:31 PM PT
