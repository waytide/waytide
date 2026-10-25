# A timeline view lists every journal entry by its datetime

Where the writer asks for the timeline — *show the timeline*, *list the entries* — list every journal entry in the active writer's journal directory, `waytide/local/journal/<username>/`. Those are the `20*.md` files there, and `<username>` is resolved by the the-writers-identity-resolves-through-a-fixed-override-chain rule. List them in chronological order, oldest first.

Format each as a single bullet, `- **<datetime>** — <title>`. The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is. The `<title>` is the entry's `# ` heading with the leading `# ` removed. End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*. Output the list alone, with no preamble.

**The view is computed every time it is asked for, and it is stored nowhere.** Not the bullets, not the count, and not the date span. There is no `TIMELINE.md` and none is written.

**It is a projection**, in the sense the foundation package's vocabulary gives that term. It reads the entries without destroying them, and it is regenerated rather than maintained. That term already settles what happens to a derived artifact somebody keeps: it goes stale the moment it is not updated.

**A stored index was kept until 2026-08-14, and it was maintained by two directives.** One ordered-inserted a row when an entry was written. The other rebuilt the file from scratch, and it existed because the first could not see a rename, an edited title, or a deletion. A view that needs a repair directive is a view that drifts, and the entries are what a reader would then have to check it against.

**The entry files are the record, and reading them is cheap.** A journal directory is one small markdown file per entry. Nothing about listing them wants a cache.

**Why:** the timeline says nothing the entries do not. It is an ordering and a rendering of material that is already on disk, so a second copy of it buys a reader nothing and can only disagree with the first. Computing it on request means it is correct by construction, and it cannot be stale.

**How to apply:** resolve the active `<username>` by the the-writers-identity-resolves-through-a-fixed-override-chain rule. Read the `20*.md` files in `waytide/local/journal/<username>/`, sort them by their datetime line, emit the bullets, and append the computed count and date span. Write nothing to a file.

## Compressed

1. When the writer asks for the timeline, such as *show the timeline* or *list the entries*, list every journal entry in the active writer's journal directory.
2. The directory is `waytide/local/journal/<username>/`.
3. Resolve `<username>` by the the-writers-identity-resolves-through-a-fixed-override-chain rule.
4. The entries are the `20*.md` files in that directory.
5. Sort the entries by their datetime line, oldest first.
6. Format each entry as a single bullet: `- **<datetime>** — <title>`.
7. The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is.
8. The `<title>` is the entry's `# ` heading with the leading `# ` removed.
9. End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*.
10. Output the list alone, with no preamble.
11. Compute the view each time it is asked for.
12. Store none of it: not the bullets, not the count, and not the date span.
13. There is no `TIMELINE.md`, and none is written.
14. Write nothing to a file.
15. The view is a projection, in the sense of the foundation package's vocabulary. It reads the entries without destroying them and is regenerated, not maintained.
16. **Why:** the timeline only orders and renders entries already on disk. A stored copy can only drift from them, while a computed view cannot be stale.

## History

Until Sun Oct 25 2026 this rule was named timeline-view and titled "Timeline view: on request, list every journal entry chronologically, each row led by its datetime".

Related:

- the the-writers-identity-resolves-through-a-fixed-override-chain rule — how `<username>` is resolved
- the a-journal-entry-carries-a-human-readable-datetime-line-under-its-title rule — the line each bullet is led by
- the journal-entries-live-in-the-writers-journal-directory-one-file-per-entry rule — the entries this reads, and the *new entry* directive that writes one
- the foundation package's vocabulary — the projection term

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:54:20 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 10:16:13 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:41 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:56 PM PT
