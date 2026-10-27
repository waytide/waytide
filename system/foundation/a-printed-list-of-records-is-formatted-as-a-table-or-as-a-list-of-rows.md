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

Related:

- the a-status-report-prints-a-fixed-whole-project-report rule — whose tables this agrees with
- the file-names rule — the prefix the handle column carries
- the `git` package's a-commits-sha-refers-to-the-work-the-commit-carries rule — what a SHA in those columns refers to when the engineer names one back
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the answer's form, which this does not displace
