# An item takes a log entry on creation, on each settled resolution, and on a change of state

- **Solubility:** 17
- **Original rank:** 2 of 106
- **Unclarity:** 0.77

An **item** in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`. The entry is written at three moments, and at no others.

**Whatever the item is tagged does not matter here.** A `[design]`, a `[plan]`, an `[aspiration]`, or an item carrying no kind tag at all takes the same entry at the same moments. The tag describes the item and decides nothing about the log.

- **On creation.** That the item was recorded at all is itself a decision, and the entry records the item rather than the word.
- **On each `Settled` resolution.** A dated resolution is the unit an item records decisions in, so each one is a decision the log carries.
- **On a change of state.** The canonical `**State:**` line reaching **Open**, **Active**, **Realized**, **Deferred**, **Suspended**, **Superseded**, **Abandoned**, or **Lapsed** — or **Done**, for a work item — is a decision. So is a reversible word being taken back — **Realized**, **Deferred**, **Open**, or a work item's **Done**, as the the-items-directory-holds-one-file-per-item sets out. **An observation is `Stated` and never moves**, so it takes a creation entry and no other.

## What the entry says

**The entry names the record and what happened to it.** That is the record being written, or its `**State:**` line reaching a word. What the record settles may follow, attributed to the record rather than stated as the system's behavior.

**An entry never states an unbuilt direction in the indicative mood.** An item settles a direction and builds nothing. *The check runs at the engineer's first prompt* says the system does that, and while the record is `Open` or `Active` the system does not.

**The pull comes from the commit conventions, and they are right about commits.** The `git` package's write-subject-first-commit-messages rule asks for the changed thing and its new state, in passive voice and indicative mood. Its a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rule asks for the fact rather than the clerical gesture. Each is written for a change to the software.

**An item is not a change to the software.** The fact about it is that it was recorded, or that its state moved. Writing what it settles in that grammar states a fact that did not happen, which is the one thing those rules never license.

**This reaches the commit subject the entry travels in**, which is the more-scanned surface. An entry corrected in the log while its commit subject carries the same claim is half corrected.

**No wording template is fixed.** *X is recorded as an item — Open because …* and *X is realized* are forms already in use. What is required is the record named and the mood honest, and a template would be the over-prescription the an-item-that-sequences-work-contains-no-code-samples rule warns against.

## What is not logged

**A completed task is not a decision.** An item's checkbox tasks are execution against direction already settled. Logging each one would put the build's every increment in a record whose unit is the decision, and the item already carries them.

**Prose that settles nothing is not a decision.** Reconciling a Background & Motivation section, correcting a summary, or rewording a substantive section changes how the artifact reads and changes no direction. The provenance footer records that the file was changed, which is what that footer is for.

**A reconciliation that finds nothing is the exception worth naming, and it is logged.** The a-work-session-record-is-the-narrative-of-one-work-session puts the design reconciliation to the engineer at each work session's close, and *the direction stands* is a real answer to it. That the artifacts were read against new work and found still standing is not recoverable from the artifacts, since nothing in them changed. This project's `The aspirations stand against …` entries are that case.

## Why the obligation is stated here rather than in each convention

**Three conventions state their own log entry in full, and the the-items-directory-holds-one-file-per-item points here.** The an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes, the binding-rules-live-in-the-installed-packages-and-the-projects-own-rules-directory, and the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule each state the pairing inline. The the-items-directory-holds-one-file-per-item requires the record, its dated resolutions, and its footer, and names the entry only by pointing to this rule.

**What reached the log anyway was the the-log-holds-one-file-per-entry-with-a-one-line-title's general trigger** — write an entry whenever a real decision is made, and when in doubt, log it. That is enough to produce the entries and not enough to make them reliable, since it rests on each writer reaching the same judgment about what counts.

**Stating it once covers every item.** The triggers above do not vary by what an item is tagged, and the exclusions are the more valuable half. Written into the the-items-directory-holds-one-file-per-item as well they would be two copies to keep true, which this system has already had drift on. This is the shape the working-state-artifacts-carry-a-provenance-footer rule takes for the same reason.

**Why:** the log is the project's record of what was decided and when, and direction is the most consequential thing a project decides. An artifact holds what the direction *is*. The log holds *when it moved*, which the artifact cannot carry — a resolution added today and one added in March read identically in the file, and their dates say when each was settled rather than what prompted it.

The exclusions are what keep the obligation worth having. A log that carried every completed task and every reworded paragraph would stop being skimmable, which is the one property a one-line-per-decision record is for.

**The mood is required because the log is the artifact a reader finds holding nothing else.** Every other record carries a `**State:**` line saying whether the thing exists. A log entry carries a title. Where the title asserts what a record only settles, the reader has nothing to weigh it against, and reads a proposal as the system's behavior.

**How to apply:** when an item is created, write a matching one-line entry in `waytide/local/logs/log/`. Write one for each `Settled` resolution added afterward, and one for each change of the `**State:**` line.

Write none for a completed task, and none for prose that settles nothing. Write one where a reconciliation finds the direction still standing, naming what it was read against.

Name the record in the entry, and say what happened to it. State what the record settles as the record's, never as the system's behavior, and carry that into the commit subject the entry travels in. Fix no template for the wording.

## Compressed

1. An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`.
2. Write the entry at three moments, and at no others.
3. The item's tag makes no difference.
4. Write the entry on the item's creation.
5. Write the entry on each dated `Settled` resolution added after the item is created.
6. Write the entry on each change of the item's `**State:**` line.
7. A change of state is the line reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item.
8. A change of state is also the line taking back Realized, Deferred, Open, or a work item's Done.
9. An observation is `Stated` and never moves, so it takes a creation entry only.
10. Do not log a completed checkbox task, because it carries out a direction already settled.
11. Do not log prose that settles nothing either. Examples are reconciling a Background & Motivation section, correcting a summary, and rewording a section.
12. The provenance footer records those unlogged changes.
13. Log one reconciliation, though nothing changed: a reconciliation at a work session's close that finds the direction still standing.
14. Name what that reconciliation was read against, as in `The aspirations stand against …`.
15. Log it because nothing in the artifacts records that it happened.
16. The entry names the record and what happened to it: the record was written, or its state reached a word.
17. What the record settles may follow, attributed to the record.
18. Never state an unbuilt direction in the indicative mood.
19. *The check runs at the engineer's first prompt* says the system does that. While the item is `Open` or `Active`, it does not.
20. The `git` package's commit-message rules ask for the changed thing in its new state. That form is right for a change to the software.
21. An item is not a change to the software, so do not use that form for it.
22. The fact about an item is that it was recorded, or that its state moved.
23. Carry the same mood into the commit subject the entry travels in.
24. Fix no wording template. *X is recorded as an item, Open because …* and *X is realized* are forms in use.
25. This rule states the obligation once, for every item.
26. The an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes, the binding-rules-live-in-the-installed-packages-and-the-projects-own-rules-directory, and the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule state their own entries.
27. The the-items-directory-holds-one-file-per-item points here and keeps no second copy.
28. The the-log-holds-one-file-per-entry-with-a-one-line-title's general trigger is to log whenever in doubt. It rests on each writer's judgment, so it does not make the entries reliable.
29. **Why:** the log holds when direction moved, which an artifact cannot carry. The exclusions keep the log skimmable. A log entry has no State line beside it, so an entry asserting what a record only settles is read as the system's behavior.


## History

Until Sun Oct 25 2026 this rule was named an-item-takes-a-log-entry and titled "An item takes a log entry — on creation, on each settled resolution, and on a change of state — and the entry names the record rather than asserting what the record settles".

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title — the entry's form, and the general trigger this makes specific
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — the entry a removal takes, which is the whole of that act
- the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes, binding-rules-live-in-the-installed-packages-and-the-projects-own-rules-directory, and a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved — the three that already state their own pairing
- the working-state-artifacts-carry-a-provenance-footer rule — the same shape, one obligation stated once across several conventions
- the a-work-session-record-is-the-narrative-of-one-work-session — the reconciliation prompt whose *the direction stands* answer is logged
- the `git` package's write-subject-first-commit-messages and a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done rules — the grammar that is right for a change to the software and wrong for a record that settles one
- the the-items-directory-holds-one-file-per-item — the record whose states an entry reports, and which this rule's name predates

---

Authored by Scott Bellware on Sun Aug 16 2026 at 2:04:53 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:19:18 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 3:38:02 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:32:07 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:32:53 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:33:23 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 4:15:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:49:53 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:27:16 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:39:29 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:49 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:43 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:14 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
