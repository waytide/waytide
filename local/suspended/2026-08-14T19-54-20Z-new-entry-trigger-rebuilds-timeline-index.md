- **Origin:** waytide/system/journal/new-entry-trigger-rebuilds-timeline-index.md
- **Kind:** rule
- **Suspended:** 2026-08-14T19-54-20Z
- **Renamed:** 2026-08-18 — the `diary` package became `journal`. Every path and rule name
  below is rewritten to match, so the return address resolves. The record is a live undo
  queue entry, not a historical one
- **Reconciliations:**
  - waytide/system/journal/timeline-view.md — its materialization paragraphs are removed. The view
    is computed on request and stored nowhere. It gained a paragraph naming this rule as
    suspended, and a paragraph naming the view a projection
  - waytide/system/journal/journal-entries.md — gained the *new entry* directive, which this rule
    carried and which is not about the index. It gained the timeline-view rule in its Related
    list
  - waytide/system/journal/the-journal-is-read-at-session-start.md — named `TIMELINE.md` as a second
    thing under the journal directory that is not read. It now names `writers.toml` alone, and its
    Related entry for the timeline-view rule is reworded
  - waytide/system/journal/README.md — named `TIMELINE.md` beside `writers.toml` in the same
    sentence. The name is removed
  - this file's own Related list still names the timeline-view rule, which no longer materializes
    anything. A restore reinstates that rule's materialization paragraphs

**Reason for suspension.** The stored index was a second copy of what the entry files already
hold, and it could only ever disagree with them. It needed two directives to stay current, and
the second existed because the first could not see a rename, an edited title, or a deletion. A
view that needs a repair directive is a view that drifts. The timeline is a **projection** in the
sense the foundation vocabulary gives that term, and a projection is regenerated rather than
maintained.

**What would bring it back.** A journal large enough that reading every entry file to list them is
too slow to do on request. Nothing about a directory of small markdown files is near that today.

---

# "new entry" ordered-inserts a row into the timeline index, and "reindex" rebuilds it from scratch

The materialized timeline index lives at `waytide/local/journal/<username>/TIMELINE.md`, one
index per writer, in that writer's directory, where `<username>` is resolved by the
identity-resolution-contract rule. It holds one bullet per entry, `- **<datetime>** — <title>`,
oldest first. It is generated and never hand-edited. **The stored file holds the bullets
alone.** The count and date span is not stored, and is computed when the timeline is displayed
— see the timeline-view rule. Keeping it out of the file is what lets a new entry be a
single-line insertion with nothing else to recompute.

Two directives maintain it.

**"new entry"** — where the writer directs with the phrase *new entry*, create the journal entry
by the entry rules. Those are the journal-entries, datetime-stamp-line, and
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
`waytide/local/journal/<username>/TIMELINE.md` from scratch. Read every `20*.md` entry file in
`waytide/local/journal/<username>/`, sort them chronologically oldest first, and overwrite the
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
first. On *new entry*, write the entry file under `waytide/local/journal/<username>/`, then
ordered-insert its bullet into that directory's `TIMELINE.md`, and commit the two together. On
*reindex*, regenerate that `TIMELINE.md` from all the `20*.md` files in the directory.

Related:

- the timeline-view rule — the view this index materializes, and the computed count it omits
- the identity-resolution-contract rule — how `<username>` is resolved
- the journal-entries rule — the entry this inserts a row for

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
