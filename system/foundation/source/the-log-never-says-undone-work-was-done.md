# The log records the reasoning for an abandonment, and never conveys that something was done when it was not

**A decision log entry never conveys that something was done when it was not done.** That is the whole prohibition, and it holds whatever the entry is about.

**As the engineer stated it:** if work is abandoned, the decision log can record any reasoning given for the abandonment, but the decision log should never make a record that conveys that something was done when in fact it was not done. The log on `master` shouldn't convey that work from an abandoned branch landed on `master`.

## What an abandonment entry carries

**The reasoning, where reasoning was given.** Why the work stopped is what a later reader reconsidering it decides against, and it is the part nothing else on `master` holds once the branch is gone.

**Where no reason was given, the entry says so and invents none.** An agent's reading of why the engineer stopped is not the engineer's reason.

**What it does not carry is the unfinished work.** Not the plan that was never executed, not the increments that were never run, not the design that was never built. Those were produced on a branch that is gone, and reproducing them in the log makes the project appear to hold as settled knowledge what it holds as nothing at all.

## Why the mood is not enough

**Careful tense is necessary and does not settle it.** *It would have taken the package to `ext/`* claims nothing was done, and an entry written entirely that way still puts a body of unexecuted planning into the durable record.

**The reader's question is what the project knows**, and the log is where they ask it holding nothing else. A plan recorded at length reads as a plan the project has, however conditionally each sentence is phrased.

**So the test is not the grammar but the subject.** Reasoning for stopping belongs in the log. Work that stopped does not.

**Why:** the log is the one durable record on `master` for work whose branch is deleted, which is what makes it tempting to pour the branch into it. That temptation runs directly at what the log is for. A reader reaches the log to learn what this project decided, and an abandonment is a decision — the decision to stop, and the reason for it. The steps that were never taken are not a second decision, and putting them there converts a record of what the project did into a record of what it considered.

The failure it prevents is specific and hard to see from inside. Every sentence can be conditional, every claim true, and the entry can still leave a reader believing the project worked something out. Nothing in the entry says otherwise, because the reader has no branch to compare it against.

**How to apply:** when work is abandoned, write the log entry as the decision to stop and the reasoning given for it. Say plainly that nothing merged and where the work was.

Write no reason that was not given. Do not reproduce the plan, the increments, or the design the abandoned work produced. Where an entry needs more than a line, it takes a body — see the the-log-holds-one-file-per-decision-with-a-one-line-title.

## Compressed

1. A decision log entry never conveys that something was done when it was not done.
2. This prohibition holds whatever the entry is about.
3. The log on `master` never conveys that work from an abandoned branch landed on `master`.

## What an abandonment entry carries

1. When work is abandoned, write the entry as the decision to stop and the reasoning given for it.
2. Where no reason was given, the entry says so.
3. Write no reason that was not given. An agent's reading of why the engineer stopped is not the engineer's reason.
4. Say plainly that nothing merged.
5. Say plainly where the work was.
6. Do not carry the unfinished work: not the unexecuted plan, the unrun increments, or the unbuilt design.
7. Where an entry needs more than a line, it takes a body, as the the-log-holds-one-file-per-decision-with-a-one-line-title describes.

## Why the mood is not enough

1. Careful tense is necessary but not sufficient.
2. An entry written entirely in conditional mood, such as *It would have taken the package to `ext/`*, still must not record unexecuted planning.
3. The test is the entry's subject, not its grammar.
4. Reasoning for stopping belongs in the log. Work that stopped does not.
5. **Why:** A reader consults the log, with no branch to compare against, to learn what the project decided. Recording unexecuted work makes it read as settled knowledge the project holds.

Related:

- the the-log-holds-one-file-per-decision-with-a-one-line-title — the entry's shape, and when it takes a body
- the implementation-records-take-a-log-entry rule — the substance an unmerged **experiment's verdict** carries, which this holds apart from abandoned work
- the an-item-takes-a-log-entry-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — the same prohibition for an item, stated as the mood an entry is written in
- the an-implementation-runs-on-a-branch-to-a-declared-end rule — the branch deletion that leaves the log as the only durable trace

---

Authored by Scott Bellware on Tue Aug 25 2026 at 10:59:12 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
