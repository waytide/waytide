# Journal entries live in the writer's journal directory, one file per entry

The journal is kept as one markdown file per entry, in the writer's own journal directory `waytide/local/journal/<username>/`. The `<username>` is the active writer, resolved by the the-writers-identity-resolves-through-a-fixed-override-chain rule — `waytide/local/journal/scott-bellware/`, for example. A project may hold the journals of more than one writer, and each writer's entries live under their own directory. This is distinct from `waytide/local/logs/log/`, the decision log the agent writes, which is one record for the whole project.

Filename: `YYYY-MM-DDTHH-MM-<name>.md`, with the timestamp computed in **local time** by `date +%Y-%m-%dT%H-%M`. The colons of ISO 8601 are written as dashes for filename safety. Never use UTC for these entries, which is the writer's stated preference.

**The stamp carries seconds only where the writer gave seconds.** A time the writer states to the second takes the `YYYY-MM-DDTHH-MM-SS` form. Every other answer stops at the minute. That includes **Now**, which reads a clock that has a seconds value and drops it.

**A second the writer did not state is a resolution they did not give.** The moment of writing is knowable to the second. The entry's own time frequently is not, and the two are not the same value. An entry about last Tuesday's meeting has no seconds to recover, and supplying the clock's would record a precision nobody stated.

**This departs from the foundation package's a-time-value-carries-minutes-and-seconds rule**, which specifies a new datetime format to seconds. That rule answers a running history inside **one file**, whose entries collide at a coarse resolution. The later entry then goes unwritten rather than looking like a duplicate of the one above it. A journal is one file per entry, so that collision cannot arise. What the coarser stamp costs is two entries written in the same minute, which sort against each other by name rather than by moment.

**The form carries no trailing `Z`.** In ISO 8601 that character designates UTC, and this stamp is local time. It was kept until 2026-08-14, on the reasoning that it is a literal token of the form rather than a claim about a zone. A reader meets the filename and not the rule that says so, so every entry asserted something false and the correction sat somewhere they would never look. The foundation package's file-names rule keeps its `Z`, because its stamps are UTC and the character is true there.

**The local time reaches the journal entries alone.** The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two.

**Entry format:**

- **Voice:** first person, the writer's perspective — *I raised the concern …*.
- **Editing:** lightly cleaned up. Preserve the writer's words, their meaning, and their emphasis. Correct the grammar and the flow. Invent no fact, and embellish nothing.
- **Structure:** a `# <title>`, then the datetime line, then the optional `**Tags:**` line, then a bold `**Summary:**` one-line gist, then the narrative prose. See the a-journal-entry-carries-a-human-readable-datetime-line-under-its-title rule. The summary is what shows first in a Quick Look preview, so make it a standalone takeaway rather than a restatement of the title. **Omit the summary where it would be identical or nearly identical to the body**, as it is on a very short entry. The entry is then the title and the prose, with nothing repeated.

**The directive is *new entry*.** Where the writer opens with that phrase, write the entry by this rule, by the a-journal-entry-carries-a-human-readable-datetime-line-under-its-title, omit-body-when-same-as-title, and where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rules, and by the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule. Nothing else follows from it. Nothing beside the entry file is written, and no index is maintained — see the timeline-view rule.

**Dating default:** an entry is about **today** unless the writer signals otherwise. Where the writer refers to a different time, by an explicit date or by a phrase such as *last Tuesday's meeting* or *back in April*, date and stamp the entry to that time instead. Opening with *Today* is a signal, and it means today.

**This rule settles the date alone.** The **time** is the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule's, and that ask fires wherever the writer gave no time — including where they gave a day, since *yesterday* and *today* fix the day and say nothing about the hour.

**Why:** a consistent, sortable naming scheme keeps a long-running journal easy to skim, to sort chronologically, and to reference. Keeping each writer's entries under `waytide/local/journal/<username>/` separates one writer's record from another's. It separates all of them from the records the agent writes. The summary pays off in a Quick Look preview, which is where a reader meets the entry before opening it.

**How to apply:** when the writer dictates an event or an experience, resolve the active `<username>` by the the-writers-identity-resolves-through-a-fixed-override-chain rule. Create a new file in `waytide/local/journal/<username>/` with the local-time filename stamp, a `# <title>` heading, the datetime line, a `**Tags:**` line where the entry has tags, a `**Summary:**` line, and then the first-person narrative. Set the filename stamp to the referenced past time where the entry is not about today. Where the writer gave no time, ask by the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule and stamp the file to their answer. A day they named is not a time.

Stamp to the minute. Write seconds only where the writer stated seconds, and drop the clock's seconds under **Now**.

## Compressed

1. Keep the journal as one markdown file per entry.
2. Put each entry in the writer's own directory, `waytide/local/journal/<username>/`.
3. Resolve `<username>` as the active writer by the the-writers-identity-resolves-through-a-fixed-override-chain rule, for example `waytide/local/journal/scott-bellware/`.
4. A project may hold several writers' journals. Each writer's entries live under their own directory.
5. The journal is distinct from `waytide/local/logs/log/`, the agent's single project-wide decision log.

## Filename

1. Name the file `YYYY-MM-DDTHH-MM-<name>.md`.
2. Compute the timestamp in local time with `date +%Y-%m-%dT%H-%M`.
3. Write the colons of ISO 8601 as dashes.
4. Never use UTC for journal entries. This is the writer's stated preference.
5. Use the `YYYY-MM-DDTHH-MM-SS` form only where the writer stated the time to the second.
6. Every other stamp stops at the minute.
7. Where the writer answers **Now** to the time question, drop the clock's seconds value.
8. Do not supply seconds the writer did not state. That records a precision nobody gave.
9. This departs from the foundation package's a-time-value-carries-minutes-and-seconds rule. One file per entry cannot have that rule's in-file collisions.
10. Two entries in the same minute sort against each other by name. That cost is accepted.
11. Write no trailing `Z`. It designates UTC, and this stamp is local time.
12. The foundation package's file-names rule keeps its `Z`, because its stamps are UTC.
13. Local time applies to journal entries alone.
14. The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two.

## Entry format

1. **Voice:** write in first person, from the writer's perspective, for example *I raised the concern …*.
2. **Editing:** clean the text up lightly.
3. Preserve the writer's words, meaning, and emphasis.
4. Correct the grammar and the flow.
5. Invent no fact, and embellish nothing.
6. **Structure:** write a `# <title>`, then the datetime line, then the optional `**Tags:**` line.
7. Follow these with a bold `**Summary:**` one-line gist, then the narrative prose.
8. Write the datetime line by the a-journal-entry-carries-a-human-readable-datetime-line-under-its-title rule.
9. Make the summary a standalone takeaway, not a restatement of the title. It shows first in a Quick Look preview.
10. Omit the summary where it would be identical or nearly identical to the body, as on a very short entry.
11. The entry is then the title and the prose, with nothing repeated.

## The directive *new entry*

1. Where the writer opens with *new entry*, write the entry by this rule.
2. Also apply the a-journal-entry-carries-a-human-readable-datetime-line-under-its-title, omit-body-when-same-as-title, and where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rules.
3. Also apply the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule.
4. Nothing else follows from the directive.
5. Write nothing beside the entry file.
6. Maintain no index. See the timeline-view rule.

## Dating

1. An entry is about today unless the writer signals otherwise.
2. Where the writer refers to another time, date and stamp the entry to that time.
3. Such a reference may be an explicit date or a phrase like *last Tuesday's meeting* or *back in April*.
4. Opening with *Today* is a signal, and it means today.
5. This rule settles the date alone.
6. The time belongs to the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule.
7. That ask fires wherever the writer gave no time, including where they gave only a day.
8. *Yesterday* and *today* fix the day and say nothing about the hour.

## How to apply

1. When the writer dictates an event or experience, resolve `<username>` by the the-writers-identity-resolves-through-a-fixed-override-chain rule.
2. Create a new file in `waytide/local/journal/<username>/` with the local-time filename stamp.
3. Write the `# <title>` heading, the datetime line, a `**Tags:**` line where the entry has tags, and a `**Summary:**` line.
4. Then write the first-person narrative.
5. Set the filename stamp to the referenced past time where the entry is not about today.
6. Where the writer gave no time, ask by the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule. Stamp the file to their answer.
7. A day the writer named is not a time.
8. **Why:** a consistent, sortable naming scheme keeps a long-running journal easy to skim, sort chronologically, and reference. Per-writer directories separate each writer's record from others' and from the agent's records.

## History

Until Sun Oct 25 2026 this rule was named journal-entries and titled "Journal entries live in `waytide/local/journal/<username>/`, one file per entry".

Related:

- the the-writers-identity-resolves-through-a-fixed-override-chain rule — how `<username>` is resolved
- the the-journal-is-the-record-the-writer-keeps — the directory, the provenance footer, and what one entry is
- the a-journal-entry-carries-a-human-readable-datetime-line-under-its-title rule — the datetime line under the title
- the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule — the `**Tags:**` line and the tag protocol
- the omit-body-when-same-as-title rule — the body dropped where the title says it already
- the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule — where the writer gives no time
- the timeline-view rule — the on-demand listing of the entries this writes
- the foundation package's file-names rule — the UTC normalization this departs from

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:54:20 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:05:44 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:01:46 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:36:02 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:20 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:35 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:41 PM PT
