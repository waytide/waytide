# A record may be tagged with square-bracket tags

**Any record may carry tags**, such as `[idea]`. Put them on a `**Tags:**` line at the head of the record, after `**State:**` where there is one: `**Tags:** [idea] [decision]`. To tag one list item, prefix it: `- [idea] My idea`.

**Write a tag lower-case in square brackets**, with dashes between words: `[legal-matter]`.

**Tags are optional and freeform.** Add one when it is useful. Nothing checks them, and there is no fixed list.

**Some tags have lifecycle states**, such as `[experiment]`, `[feature]`, `[observation]`, and `[work-item]`. Each one's own rule states its states.

**Why:** a tag costs nothing to add, shows in plain text, and is found by an ordinary search.

**How to apply:** where a record is worth marking, add a `**Tags:**` line at its head.

## Compression

- Solubility 95, clarity 1.00 (2026-10-28)
- Compression 0.09, change 0.17 (2026-10-27)
- 8 directives, 8 kept, 0 less precise, 0 lost (2026-10-28)

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — where a log entry's `**Tags:**` line goes
- the a-log-entry-recording-an-engineers-decision-is-tagged-decision rule — what `[decision]` means
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — what `[suspended]` means
- the the-implementations-directory-holds-one-record-per-implementation rule — the states of `[experiment]` and `[feature]`
- the the-items-directory-holds-one-file-per-item rule — the states of an item, and of `[work-item]`
- the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes rule — the one state of `[observation]`
- the `journal` package's a-journal-entry-has-a-human-readable-datetime-line-under-its-title rule — where a journal entry's `**Tags:**` line sits
