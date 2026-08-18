# The diary's timeline is computed on request and stored nowhere — the materialized `TIMELINE.md` is removed, and the `new-entry-trigger-rebuilds-timeline-index` rule that maintained it is suspended, since a stored index is a second copy of what the entry files hold and needed a *reindex* directive precisely because its incremental update could not see a rename, an edited title, or a deletion; the *new entry* directive, which is not about the index, moves into the diary-entries rule

**Tags:** [suspended]
