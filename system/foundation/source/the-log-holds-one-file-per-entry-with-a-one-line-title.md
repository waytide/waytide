# The log holds one file per entry, with a one-line title

Record decisions made during sessions as one file per decision in `waytide/local/logs/log/`.

- **Trigger:** detect — write an entry whenever a real decision is made (the user picks among alternatives, accepts or rejects an approach, or sets a rule that will guide future work). Don't wait to be asked. When in doubt, log it. Over-logging is cheaper than under-logging here.
- **Filename:** the ISO-8601-UTC prefix convention (see the file-names rule), computed with `date -u +%Y-%m-%dT%H-%M-%SZ`. Contributors are globally distributed, so UTC is mandatory — never local time.
- **Content:** a `# <title>` that states the decision. **One line is the ordinary case**, and most entries are nothing else. **An entry takes a body where it carries reasoning that will not fit a title** — an abandonment is the case this was settled on, since the reason work stopped is what a later reader decides against and it is the one thing no other record on `master` holds. A body is prose under the title, and there is no template. It is never a place to put the work that did not happen — see the the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done rule. **An entry that carries tags takes a `**Tags:**` line under the title**, separated by a blank line, which is the one form every record uses — see the a-record-may-be-categorized-with-square-bracket-tags rule. An untagged entry with no body is one line, which is the ordinary case. Keep the title informative enough to skim. A log entry takes **no provenance footer** — it is the one working-state artifact exempt from the working-state-artifacts-carry-a-provenance-footer rule, because its one-line shape carries its author and time in the filename and commit already, and a footer would break that shape.
- **Commit:** include log entries in the same commit as the change they describe, or commit them separately with a `Log:` prefix. Don't sit on them.
- **The log is never consolidated on the agent's initiative.** Do not combine, merge, rewrite, or reformat log files, and do not propose doing so. The log is an append-only record of what was decided and when. Consolidating it destroys that granular history. Consolidation happens **only on the explicit command of the user, and even then only after it is confirmed with the project's stakeholders**. One file per decision is the record, not a draft to be tidied later. For a readable overview of the log, ask Claude for a **summary** — a projection generated at read-time — rather than consolidating the files. The summary reads the record without destroying it. **That summary is never written to a file.** A stored recap is a second copy of what the log and git already hold, it goes stale the moment it is not updated, and it is regenerated in the response instead.

**Why:** the reasoning and decisions of a project are easy to lose and expensive to reconstruct. A one-line-per-decision log, committed alongside the code, keeps a skimmable, durable record without the overhead of a template. Detecting and logging without being asked keeps the record complete rather than sampled.

**How to apply:** when a decision is made, write a titled entry under `waytide/local/logs/log/`, with a UTC filename. It is one line in the ordinary case, and takes a body where its reasoning will not fit the title. Commit it with the change, or with a `Log:` prefix.

## Compressed

1. Record each decision made during a session as its own file in `waytide/local/logs/log/`.
2. Write one file per decision.
3. Give each entry a one-line title.

## Trigger

1. Write an entry whenever a real decision is made.
2. A real decision is the user picking among alternatives, accepting or rejecting an approach, or setting a rule that will guide future work.
3. Do not wait to be asked.
4. When in doubt, log it.

## Filename

1. Use the ISO-8601-UTC prefix convention of the file-names rule.
2. Compute the prefix with `date -u +%Y-%m-%dT%H-%M-%SZ`.
3. Use UTC, never local time.

## Content

1. Start the entry with a `# <title>` that states the decision.
2. Keep the title informative enough to skim.
3. One line is the ordinary case.
4. An entry takes a body only where it carries reasoning that will not fit a title.
5. An abandonment takes a body, giving the reason the work stopped.
6. A body is prose under the title, with no template.
7. A body never holds the work that did not happen, per the the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done rule.
8. An entry that carries tags takes a `**Tags:**` line under the title, separated by a blank line, per the a-record-may-be-categorized-with-square-bracket-tags rule.
9. An untagged entry with no body is one line.
10. A log entry takes no provenance footer.
11. It is exempt from the working-state-artifacts-carry-a-provenance-footer rule, since its filename and commit already carry author and time.

## Commit

1. Commit a log entry in the same commit as the change it describes, or separately with a `Log:` prefix.
2. Do not hold entries uncommitted.

## Consolidation

1. Never consolidate the log on your own initiative.
2. Do not combine, merge, rewrite, or reformat log files. Treat the log as an append-only record of what was decided and when.
3. Do not propose doing so.
4. Consolidate only on the user's explicit command, and only after it is confirmed with the project's stakeholders.
5. For a readable overview, generate a summary of the log at read time instead.
6. Never write that summary to a file.
7. Give it in the response instead.

8. **Why:** a project's decisions are easy to lose and expensive to reconstruct. A one-line-per-decision log, append-only and committed with the code, keeps a complete, skimmable, durable record.

## History

Until 2026-10-25 the Content line said "An untagged entry is one line", and How to apply said to write "a titled one-line entry". Both read as barring the body the same line allows where reasoning will not fit a title, which an abandonment takes. The engineer settled that bodies stay and one line is the ordinary case.

Until Sun Oct 25 2026 this rule was named decision-log-convention and titled "`waytide/local/logs/log/` — one file per decision, a one-line title".

Until Mon Oct 26 2026 this rule was named the-log-holds-one-file-per-decision-with-a-one-line-title and titled "The log holds one file per decision, with a one-line title".

Until Mon Oct 26 2026 this rule called the records under `logs/` "the running records". The engineer settled that they are the contemporaneous, historical records.

Related:

- the file-names rule — the shared filename convention
- the binding-rules-live-in-the-installed-packages-and-the-projects-own-rules-directory — a new rule pairs with a log entry
- the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes — its recording step logs too
- the an-item-takes-a-log-entry-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — an item, deferred work included, logs on creation and on each change of state
- the the-logs-directory-holds-the-contemporaneous-historical-records rule — the contemporaneous, historical records this sits among
- the a-record-may-be-categorized-with-square-bracket-tags rule — the `**Tags:**` line an entry carries, in the one form
- the a-log-entry-recording-an-engineers-decision-is-tagged-decision rule — `[decision]`, the tag an engineer's decision carries

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 8 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 11:33:53 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 3:04:41 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:59:12 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:38:41 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 9:53:03 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 2:00:42 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:11:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:19 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:12:23 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:13:10 PM PT
