# A suspension is a log entry tagged `[suspended]`, and nothing is moved

**When the project stops doing something, log it and tag the entry `[suspended]`.** That is the whole of the act. There is no directory the thing moves to, and nothing is kept beside the entry.

**What can be suspended** is anything the project *did*: a rule that became ceremony, a procedure nobody runs, a report nobody reads, a step that costs more than it is worth. **Not** something the project only wanted — an item set aside takes `**State:** Suspended` and stays where it is, which is a different act with a different record.

## What the entry carries

**A title stating what was suspended and why**, like every log entry — what it cost, and what it stopped buying. The reason is the substance, because it is what a later reader is deciding against.

**Name what else changed.** Stopping something is never one file: removing a rule means dropping it from the `Related:` lists that cite it and from the package README's summary, per the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory. The entry says so in its own clause. That is the record of the whole act rather than of its first step.

**The file is removed in the same commit.** Git holds the text, reachable by path from `master`'s history, which is the ordinary case this system relies on everywhere else.

## The tag

**The entry carries `**Tags:** [suspended]` under its title**, separated by a blank line:

```
# The no-stored-recap rule is suspended, its one sentence folded into the log convention

**Tags:** [suspended]
```

**That is the one form every record uses.** The a-record-may-be-categorized-with-square-bracket-tags rule excludes no record and offers no second shape, so a log entry's tags sit where an item's and an implementation record's do.

**A log entry may carry other tags beside this one.** Nothing here reserves the line, and nothing excludes any record from tagging.

**`[suspended]` is a reserved tag.** What it marks is fixed here, and the set of suspensions is read from it.

**Why:** an undo queue held the suspended thing itself under `waytide/local/suspended/`, with a return address and a list of reconciliations to reverse. It ran from 2026-08-03 to 2026-08-18 and accumulated eleven entries. **Not one was restored.** The mechanism was built for a reversal that never happened, and its cost was paid on every suspension: a file to place, four canonical lines to write, and a growing directory that a reader had to be told the purpose of.

What the queue was really protecting against is a thing coming back different, reconstructed from memory and argument. The log entry protects against that at a fraction of the cost. It names what was stopped, why, and what else changed — which is what someone reconsidering the decision needs. The text itself is in git, where every other removed file in this project already is.

**How to apply:** when something the project does is no longer justified, remove it, reconcile what cites it, and write one log entry tagged `[suspended]` saying what was stopped, why, and what else changed. Commit the removal and the entry together.

Do not keep a copy of the removed thing. Do not tag an item's log entry this way — an item set aside carries `**State:** Suspended` and is not removed.

## Compressed

1. When the project stops doing something, log it and tag the entry `[suspended]`. That is the whole act.
2. Nothing moves to any directory. Nothing is kept beside the entry.
3. Anything the project *did* can be suspended: a rule that became ceremony, a procedure nobody runs, a report nobody reads, a step that costs more than it is worth. Only what the project did is suspended this way.
4. Something the project only wanted is not suspended this way.
5. An item set aside takes `**State:** Suspended` and stays where it is. That is a different act with a different record.

## What the entry carries

1. Like every log entry, the title states what was suspended and why.
2. The why gives what it cost and what it stopped buying.
3. The entry names, in its own clause, what else changed.
4. For example, removing a rule means dropping it from the `Related:` lists that cite it and from the package README's summary, per the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.
5. The file is removed in the same commit as the entry.
6. Git holds the removed text, reachable by path from `master`'s history.

## The tag

1. The entry carries `**Tags:** [suspended]` under its title, separated by a blank line:

```
# The no-stored-recap rule is suspended, its one sentence folded into the log convention

**Tags:** [suspended]
```

2. This is the one form every record uses, per the a-record-may-be-categorized-with-square-bracket-tags rule. A log entry's tags sit where an item's and an implementation record's do.
3. A log entry may carry other tags beside this one.
4. `[suspended]` is a reserved tag. What it marks is fixed here.
5. The set of suspensions is read from this tag.

## How to apply

1. When something the project does is no longer justified, remove it.
2. Reconcile what cites it.
3. Write one log entry tagged `[suspended]`, saying what was stopped, why, and what else changed.
4. Commit the removal and the entry together.
5. Do not keep a copy of the removed thing.
6. Do not tag an item's log entry this way. An item set aside carries `**State:** Suspended` and is not removed.
7. **Why:** a former undo queue under `waytide/local/suspended/` held eleven suspended things and none was restored. Its cost was paid on every suspension. The log entry guards against a thing returning reconstructed from memory, naming what was stopped, why, and what else changed, while git holds the text.

## History

A leading-tag form was written on 2026-08-18 and superseded the same day.

Until Sun Oct 25 2026 this rule was named a-suspension-is-a-log-entry and titled "A suspension is a log entry tagged `[suspended]`, and nothing is moved anywhere".

Related:

- the a-record-may-be-categorized-with-square-bracket-tags rule — the universal tag protocol, and its one form
- the the-log-holds-one-file-per-entry-with-a-one-line-title — the entry's form
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory — removing a rule, and the reconciliation the entry names
- the the-items-directory-holds-one-file-per-item — the `Suspended` **state**, which is what an item takes instead

---

Authored by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 3:04:41 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:30:23 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
