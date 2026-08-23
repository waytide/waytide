# A list of records presented on request is a table

**When the engineer asks for a list of records, render it as a table.** That reaches any record —
ideas, implementation records, decision log entries, loop records, work session records, migration
records, journal entries, and commits.

**The first column is the record's handle and carries no heading.** That is the ISO-8601-UTC
filename prefix for a working-state artifact, or the short SHA for a commit. The columns after it
are headed, and they carry the record's title and whatever fact the question was actually about.

```
|           | subject                                    | chars |
|-----------|--------------------------------------------|-------|
| `376e64a` | Waytide for content and web is an idea     | 38    |
| `f7217dd` | The experiment and feature prediction      | 37    |
| `695367b` | The install taking a package set is an idea| 43    |
```

**The third column is chosen for the question rather than fixed.** A list of ideas takes the
state, a list of implementations takes the state, and a list of commits asked about for their
subject widths takes the width. A column nobody asked for is padding.

## Keep every column short

**A field that is a sentence does not belong in a table.** Column widths are fixed against the
widest cell, so one long field narrows every other column and wraps every row. What was a scannable
grid becomes prose in boxes.

**Where a record's summary is wanted, the answer is rows rather than a table.** That is not a
failure of this rule. It is the same reasoning the deferred queue's own rule gives, applied to a
case this rule does not reach.

## What this does not reach

**The session-start deferred queue print.** The print-the-deferred-queue-after-the-rule-read rule
fixes that one as rows — a title, a date, and a one-line summary — and argues the case: a rendered
table turns a scannable list into a grid to be parsed, in a terminal, at every session start. That
form stands and this rule leaves it alone.

**The status report's tables are already tables**, and the status-report-format rule says so. The
two rules agree.

**An answer that is not a list of records.** The `language` package's
an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's items. This
rule governs how a **set of records** is presented, and the two do not overlap: a table is a list,
rendered for a reader who is looking for one row.

**Why:** a record list is scanned rather than read. The reader has a record in mind and is looking
for its row, or is comparing one field across rows. A table puts the same field in the same place
on every row, so the eye goes down a column instead of parsing each line to find where the field
sits.

Rows are the better form where a field is long, and that is the whole of the exception. The
two forms are not in competition — they answer to the length of what is in them.

**How to apply:** on a request for a list of records, render a table. Put the handle first with no
heading, the title next, and one column for the fact that was asked about.

Keep every column short.
Where a field runs to a sentence, use rows instead. Leave the session-start deferred queue print in
the form its own rule fixes.

Related:

- the print-the-deferred-queue-after-the-rule-read rule — the one record list this does not reach,
  and the reasoning for its form
- the status-report-format rule — whose tables this agrees with
- the file-names rule — the prefix the handle column carries
- the `git` package's a-sha-names-the-work-rather-than-the-commit rule — what a SHA in that column
  refers to
- the `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule — the answer's
  form, which this does not displace

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:22:25 AM PT
