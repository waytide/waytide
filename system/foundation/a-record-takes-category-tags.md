# A record may be tagged with square-bracket tags

**Any record may carry tags**, such as `[idea]`. Put them on a `**Tags:**` line at the head of the record, after `**State:**` where there is one: `**Tags:** [idea] [decision]`. To tag one list item, prefix it: `- [idea] My idea`.

**Write a tag lower-case in square brackets**, with dashes between words: `[legal-matter]`.

**Tags are optional and freeform.** Add one when it is useful. Nothing checks them, and there is no fixed list.

**Some tags have lifecycle states**, such as `[experiment]`, `[feature]`, `[observation]`, and `[work-item]`. Each one's own rule states its states.

**Why:** a tag costs nothing to add, shows in plain text, and is found by an ordinary search.

**How to apply:** where a record is worth marking, add a `**Tags:**` line at its head.

Related:

- the decision-log-convention rule — where a log entry's `**Tags:**` line goes
- the a-decision-the-engineer-made-is-tagged-decision rule — what `[decision]` means
- the a-suspension-is-a-log-entry rule — what `[suspended]` means
- the implementations-convention rule — the states of `[experiment]` and `[feature]`
- the items-convention rule — the states of an item, and of `[work-item]`
- the observations-convention rule — the one state of `[observation]`
- the `journal` package's datetime-stamp-line rule — where a journal entry's `**Tags:**` line sits
