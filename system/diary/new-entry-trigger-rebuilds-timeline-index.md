# "new entry" ordered-inserts a row into the timeline index, and "reindex" rebuilds it from scratch

The materialized timeline index lives at `waytide/local/diary/<username>/TIMELINE.md`, one
index per writer, in that writer's directory, where `<username>` is resolved by the
identity-resolution-contract rule. It holds one bullet per entry, `- **<datetime>** — <title>`,
oldest first. It is generated and never hand-edited. **The stored file holds the bullets
alone.** The count and date span is not stored, and is computed when the timeline is displayed
— see the timeline-view rule. Keeping it out of the file is what lets a new entry be a
single-line insertion with nothing else to recompute.

Two directives maintain it.

**"new entry"** — where the writer directs with the phrase *new entry*, create the diary entry
by the entry rules. Those are the diary-entries, datetime-stamp-line, and
ask-for-entry-time-or-omit-it rules. Then **ordered-insert** its row into `TIMELINE.md`. Take
the new entry's datetime from its filename stamp, find the first existing bullet later than it,
and insert the new bullet immediately above it. A date-only entry sorts to the start of its
day, which matches the filename sort, where `-` precedes `T`. Append at the end where no bullet
is later. There is no count line to recompute. Commit `TIMELINE.md` with the new entry, in one
commit.

An ordered insert touches only the row being added. It cannot reflect a change to another
entry, which is a rename, an edited title, a stripped time, or a deletion. A reindex heals
those.

**"reindex"** — where the writer asks to reindex, **fully regenerate** the active writer's
`waytide/local/diary/<username>/TIMELINE.md` from scratch. Read every `20*.md` entry file in
`waytide/local/diary/<username>/`, sort them chronologically oldest first, and overwrite the
file. This is the rebuild that heals any rename, edit, or deletion of an existing entry. Use it
after any hand-edit to the entry files.

This is the rule the writer chose in place of a `PostToolUse` hook. The index stays current
because adding an entry also updates it, and *reindex* is the explicit recourse for everything
an ordered insert cannot see.

**Why:** the index is kept current without a harness hook. The common path, which is adding an
entry, takes a cheap incremental update. The rarer case of editing an existing entry takes an
explicit full rebuild. For a pure addition the two produce identical output, and reindex exists
for the cases where they diverge.

**How to apply:** resolve the active `<username>` by the identity-resolution-contract rule
first. On *new entry*, write the entry file under `waytide/local/diary/<username>/`, then
ordered-insert its bullet into that directory's `TIMELINE.md`, and commit the two together. On
*reindex*, regenerate that `TIMELINE.md` from all the `20*.md` files in the directory.

Related:

- the timeline-view rule — the view this index materializes, and the computed count it omits
- the identity-resolution-contract rule — how `<username>` is resolved
- the diary-entries rule — the entry this inserts a row for

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
