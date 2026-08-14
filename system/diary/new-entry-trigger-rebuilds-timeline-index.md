# "new entry" ordered-inserts a row into the timeline index; "reindex" rebuilds it from scratch

The materialized timeline index lives at `users/<slug>/TIMELINE.md` — one index per user, in that user's directory, where `<slug>` is the active user resolved per [[identity-resolution-contract]]: one bullet `- **<datetime>** — <title>` per entry, oldest first. It is generated, never hand-edited. **The stored file holds bullets only — no footer.** The count + date-span line is *not* stored; it is computed at display time when the timeline is shown ([[timeline-view]]). Keeping it out of the file is what lets a new entry be a clean single-line insertion with nothing else to recompute.

Two directives maintain it:

**"new entry"** — when the user directs with the phrase "new entry" (e.g. "new entry: ...", "here's a new entry"), create the experience log entry per the entry rules ([[experience-log-entries]], [[experience-log-datetime-stamp-line]], [[ask-for-entry-time-or-omit-it]]), then **ordered-insert** its row into `TIMELINE.md`: using the new entry's datetime (from its filename stamp), find the first existing bullet later than it and insert the new bullet immediately before it (a date-only entry sorts to the start of its day, matching the filename sort where `-` precedes `T`); append at the end if none is later. There is no footer to recompute. Commit `TIMELINE.md` with the new entry in the same commit.

Ordered insert only touches the row being added — it cannot reflect changes to *other* entries (a rename, edited title, stripped time, or deletion). Those are healed by a reindex.

**"reindex"** — when the user asks to reindex (e.g. "reindex", "reindex the timeline", "rebuild the index"), **fully regenerate** the active user's `users/<slug>/TIMELINE.md` from scratch: read every `20*.md` entry file in `users/<slug>/` (not `agent/log/` or `agent/rules/`), sort chronologically oldest-first, and overwrite the file. This is the from-scratch rebuild that self-heals any rename, edit, or deletion of existing entries. Use it after any hand-edit to the entry files.

This is the rule-based alternative the user chose instead of a `PostToolUse` hook. The index stays current because adding an entry (via "new entry") also updates it, and "reindex" is the explicit escape hatch for everything ordered-insert can't see.

**Why:** The user wants the index kept current without a settings.json hook, with cheap incremental updates on the common path (adding an entry) and an explicit full rebuild for the rarer case of editing existing entries. For a pure addition, ordered-insert and a full rebuild yield identical output; reindex exists for the cases they diverge.

**How to apply:** Resolve the active `<slug>` ([[identity-resolution-contract]]) first. On "new entry", write the entry file under `users/<slug>/`, then ordered-insert its bullet into `users/<slug>/TIMELINE.md` (no footer to recompute); commit both together. On "reindex", regenerate `users/<slug>/TIMELINE.md` from all `20*.md` files in `users/<slug>/`.
