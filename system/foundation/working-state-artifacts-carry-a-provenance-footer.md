# Working-state artifacts carry a provenance footer

- **Solubility:** 49
- **Original rank:** 52 of 106
- **Unclarity:** 0.52

Every working-state artifact under `waytide/` that is a document with a body ends with a **provenance footer**. That is the `Authored by … / Changed by …` block, in the record-a-rules-authorship-in-a-provenance-footer format, with a local human-readable datetime. This covers **implementation records (experiments and features), items (designs, plans, observations, and deferred work among them), loop records, and work session records**.

- **Same footer, different reason than the rule files.** The rule-file footer exists because `git subtree` strips the composite's per-file history when a package is installed into a consuming project, so `git blame` can't show a rule's author there. That reason does **not** apply to a working-state artifact: it lives in the project's own `waytide/` tree, is never shipped by subtree, and keeps its git history intact. The footer is here for a different reason. **The file should be useful on its own.** These artifacts are written to be read as self-contained documents, so a reader should not have to leave the file and query the git log to learn who wrote it and when.
- **The format is the record-a-rules-authorship-in-a-provenance-footer format.** `Authored by <name> on <local datetime>` for the original author, a `Changed by <name> on <local datetime>` line appended for each later change — oldest first, never rewritten. The datetime is the artifact's true authoring time. For a dated artifact whose ISO-8601-UTC filename prefix records when it was created, that prefix is the authoritative time (a later git add-date from a migration is a false trail).

**The one exception — the decision log.** `waytide/local/logs/log/` entries do **not** carry a footer. A log entry is deliberately one line: a `# <title>`, with no body and no template. See the the-log-holds-one-file-per-decision-with-a-one-line-title.

Its authoring time is already in its ISO-8601-UTC filename and its commit. A footer would contradict that shape and the log's no-reformat rule. The log records who and when by its filename and commit history, not by an in-file footer.

**Why:** a working-state artifact is a document meant to be read on its own. A narrative, a design, an experiment record. Its provenance — who wrote it, when, and who changed it since — is part of what a reader needs. So it belongs in the file rather than only in version-control history the reader would have to go query.

This is a different justification from the rule-file footer's (which recovers history that subtree strips). Stating it once, here, keeps every working-state convention from repeating it. The decision log is exempt because its one-line-per-file shape already carries its provenance in the filename, and a footer would break that shape.

**How to apply:** end a provenance footer on every one of these: an implementation record, whether an experiment or a feature; an item, whatever it is tagged; a loop record; and a work session record. The format is the record-a-rules-authorship-in-a-provenance-footer format: `Authored by` on creation, and an appended `Changed by` line on each later change. Do not add a footer to a `waytide/local/logs/log/` entry.

Related:

- the record-a-rules-authorship-in-a-provenance-footer rule — the footer's format and the rule-file case
- the the-log-holds-one-file-per-decision-with-a-one-line-title — the exempt one-line log
- the artifact conventions that reference this one — the-implementations-directory-records-each-implementations-lifecycle, the-items-directory-holds-the-projects-items-one-file-per-item, an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes, a-work-session-record-is-the-narrative-of-one-work-session, and DBE's a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature
