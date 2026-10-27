# A timeline view lists every journal entry by its datetime

Where the writer asks for the timeline — *show the timeline*, *list the entries* — list every journal entry in the active writer's journal directory, `waytide/local/journal/<username>/`. Those are the `20*.md` files there, and `<username>` is resolved by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule. List them in chronological order, oldest first.

Format each as a single bullet, `- **<datetime>** — <title>`. The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is. The `<title>` is the entry's `# ` heading with the leading `# ` removed. End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*. Output the list alone, with no preamble.

**The view is computed every time it is asked for, and it is stored nowhere.** Not the bullets, not the count, and not the date span. There is no `TIMELINE.md` and none is written.

**It is a projection**, in the sense the foundation package's vocabulary gives that term. It reads the entries without destroying them, and it is regenerated rather than maintained. That term already settles what happens to a derived artifact somebody keeps: it goes stale the moment it is not updated.

**A stored index would need two directives to maintain it.** One would insert a row in order when an entry is written. The other would rebuild the file from scratch, because the first cannot see a rename, an edited title, or a deletion. A view that needs a repair directive is a view that drifts, and the entries are what a reader would then have to check it against.

**The entry files are the record, and reading them is cheap.** A journal directory is one small markdown file per entry. Nothing about listing them wants a cache.

**Why:** the timeline says nothing the entries do not. It is an ordering and a rendering of material that is already on disk, so a second copy of it buys a reader nothing and can only disagree with the first. Computing it on request means it is correct by construction, and it cannot be stale.

**How to apply:** resolve the active `<username>` by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule. Read the `20*.md` files in `waytide/local/journal/<username>/`, sort them by their datetime line, emit the bullets, and append the computed count and date span. Write nothing to a file.

## Compression

- Solubility 83, clarity 0.78 (2026-10-24)
- Compression 0.44, change 0.64 (2026-10-24)
- 15 directives, 15 kept, 0 less precise, 0 lost (2026-10-24)

Related:

- the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule — how `<username>` is resolved
- the a-journal-entry-has-a-human-readable-datetime-line-under-its-title rule — the line each bullet is led by
- the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule — the entries this reads, and the *new entry* directive that writes one
- the foundation package's vocabulary — the projection term
