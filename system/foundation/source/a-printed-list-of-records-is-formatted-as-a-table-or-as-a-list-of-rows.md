# A printed list of records is formatted as a table or as a list of rows

**When the engineer asks for a list of records, render it as a table where every field is short, and as rows where a field runs to a sentence.** A table presents the fields in headed columns. Rows present one record to a line, its fields in sequence, with no columns. **A list is called a table only where it is formatted as columns.** That reaches any record — items, implementation records, log entries, loop records, work session records, migration records, journal entries, and commits.

**The first column is the record's handle and carries no heading.** That is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit. The columns after it are headed.

**A list of items opens with an ordinal**, a number from 1 in the order the rows are printed, ahead of the handle. The engineer refers to a row by that number.

**Two SHA columns follow the handle: the commit that created the record, and the last to touch it.** They are standing columns rather than chosen ones, in every list but a list of items and a list of commits.

```
|              | created   | changed   | implementation              | state     |
|--------------|-----------|-----------|-----------------------------|-----------|
| `2026-08-25` | `159985b` | `ed7ec4a` | Feature — Self-Explanation  | Abandoned |
| `2026-10-21` | `d27a638` | `66d2ea2` | Feature — "Item" replaces "idea" | Completed |
```

A list of items takes the ordinal and no SHA columns:

```
| # |              | item                        | state  |
|---|--------------|-----------------------------|--------|
| 1 | `2026-08-10` | A Generalized Description   | Active |
| 2 | `2026-08-23` | Waytide for content and web | Open   |
```

**A record never amended shows the same SHA twice, and that is the point.** The pair says whether a record has been touched since it was written. One that has not, and whose subject has moved since, is the stale case a reader is looking for.

**The last column is chosen for the question.** A list of items or implementations takes the state. A list of commits asked about for their subject widths takes the width. A column nobody asked for is padding.

**A list of commits takes no SHA columns**, because the handle is already the SHA and a commit has no creation distinct from itself. **A list of items takes none either**, at the engineer's direction. Its rows are referred to by their ordinal.

## Keep every column short

**A field that is a sentence does not belong in a table.** Column widths are fixed against the widest cell, so one long field narrows every other column and wraps every row. What was a scannable grid becomes prose in boxes.

**Where the engineer asks for a table, render one, in rows and columns, whatever the length of its fields.** The request settles the form.

**Where a record's summary is wanted, the answer is rows rather than a table.** That is not a failure of this rule. Rows are the form where a field runs to a sentence, and the two forms answer to the length of what is in them.

## What this does not reach

**The status report's tables are already tables**, and the a-status-report-prints-a-fixed-whole-project-report rule says so. The two rules agree.

**An answer that is not a list of records.** The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs how a **set of records** is presented, and the two do not overlap: a table is a list, rendered for a reader who is looking for one row.

**Why:** a record list is scanned rather than read. The reader has a record in mind and is looking for its row, or is comparing one field across rows. A table puts the same field in the same place on every row, so the eye goes down a column instead of parsing each line to find where the field sits.

Rows are the better form where a field is long, and that is the whole of the exception. The two forms are not in competition — they answer to the length of what is in them.

**How to apply:** on a request for a list of records, render a table where every field is short, and rows where a field runs to a sentence. Do not call a list a table unless it is formatted as columns. Where the engineer asks for a table, render one in rows and columns. In a table, put the handle first with no heading, then the creating commit and the last commit to touch it, then the title, then one column for the fact that was asked about. Give a list of commits no SHA columns. Give a list of items an ordinal ahead of the handle, and no SHA columns.

Keep every column short. Where a field runs to a sentence, use rows instead.

## Compressed

1. When the engineer asks for a list of records, render it as a table where every field is short, and as rows where a field runs to a sentence. A table presents the fields in headed columns. Rows present one record to a line, with its fields in sequence and no columns. A list is called a table only where it is formatted as columns.
2. This applies to any record type. That includes items, implementation records, log entries, loop records, work session records, migration records, journal entries, and commits.
3. The first column is the record's handle and has no heading.
4. The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit.
5. Every column after the handle has a heading.
6. Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it. A list of items takes no SHA columns, and opens with an ordinal ahead of the handle, which the engineer refers to a row by. The ordinal counts from 1, in the order the rows are printed.
7. These two SHA columns are always present. They are not chosen per request.
8. After the SHA columns comes the title. Then comes one column for the fact asked about.

```
|              | created   | changed   | implementation              | state     |
|--------------|-----------|-----------|-----------------------------|-----------|
| `2026-08-25` | `159985b` | `ed7ec4a` | Feature — Self-Explanation  | Abandoned |
| `2026-10-21` | `d27a638` | `66d2ea2` | Feature — "Item" replaces "idea" | Completed |
```

A list of items takes the ordinal and no SHA columns:

```
| # |              | item                        | state  |
|---|--------------|-----------------------------|--------|
| 1 | `2026-08-10` | A Generalized Description   | Active |
| 2 | `2026-08-23` | Waytide for content and web | Open   |
```

9. A record that was never amended shows the same SHA in both columns. This is intended, since it shows the record has not been touched since it was written.
10. Choose the last column to fit the question.
11. A list of items or implementations takes the state as its last column.
12. A list of commits asked about for their subject widths takes the width.
13. Do not add a column nobody asked for.
14. A list of commits takes no SHA columns.

## Keep every column short

1. Keep every column short.
2. Do not put a field that runs to a sentence in a table. Present rows instead, unless the engineer asks for a table, which is then rendered in rows and columns.
3. Where a record's summary is wanted, present rows instead of a table. This is part of the rule, not a failure of it.

## What this does not reach

1. This rule does not reach the status report's tables. They stay tables, under the a-status-report-prints-a-fixed-whole-project-report rule.
2. This rule does not govern an answer that is not a list of records.
3. The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs only how a set of records is presented.
4. **Why:** a record list is scanned, not read. A table puts each field in the same place on every row, so the reader can find one row or compare a field down a column. Rows are better only where a field is long.

## Compression

- 2026-10-24, compressed: compression 0.26, change 0.56, solubility 37 → 69, clarity 0.33 → 0.75, 14 directives, 14 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-27, re-checked: 24 directives, 21 kept, 3 less precise, 0 lost, 3 repairs, re-checked kept

## History

Until Sun Oct 25 2026 this rule was named a-record-list-is-a-table and titled "A list of records presented on request is a table".

Until 2026-10-25 the rule opened by saying to render a list of records as a table, and gave rows, the form for a field that runs to a sentence, only in a later section. The engineer settled that the opening and How to apply say which form a printed list takes, and when.

The engineer also settled the same day that a list is not called a table unless it is formatted as columns.

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Tue Oct 27 2026 a list of items took the two SHA columns and no ordinal, and a field that runs to a sentence sent a list to rows even where the engineer asked for a table. The engineer settled that a list of items takes an ordinal and no SHA columns, and that a table asked for is rendered in rows and columns.

Related:

- the a-status-report-prints-a-fixed-whole-project-report rule — whose tables this agrees with
- the file-names rule — the prefix the handle column carries
- the `git` package's a-commits-sha-refers-to-the-work-the-commit-carries rule — what a SHA in those columns refers to when the engineer names one back
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the answer's form, which this does not displace

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:22:25 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:07:00 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:04:26 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:16:48 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:26 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 8:12:20 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 8:12:44 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 8:14:47 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:47:00 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
