# Timeline view: on request, list every diary entry chronologically, each row led by its datetime

Where the writer asks for the timeline — *show the timeline*, *list the entries* — list every
diary entry in the active writer's diary directory, `waytide/local/diary/<username>/`. Those
are the `20*.md` files there, and `<username>` is resolved by the identity-resolution-contract
rule. List them in chronological order, oldest first.

Format each as a single bullet, `- **<datetime>** — <title>`. The `<datetime>` is the
human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is. The
`<title>` is the entry's `# ` heading with the leading `# ` removed. End with a one-line count
and date span, as *15 entries, spanning Jun 15–17, 2026*. Output the list alone, with no
preamble.

**The count and date span is computed when the timeline is displayed**, and is stored nowhere.
The materialized index holds the bullets alone.

The bullet list is also materialized to `waytide/local/diary/<username>/TIMELINE.md`, one index
per writer, in that writer's directory. The *new entry* and *reindex* directives maintain it —
see the new-entry-trigger-rebuilds-timeline-index rule. Asked to show the timeline, still
regenerate the view from the entry files rather than echoing `TIMELINE.md`. The displayed view
is then correct even where the materialized index is momentarily stale, and the computed line
is appended to it.

**Why:** the view is regenerated on demand from the entry files, so it never drifts out of
agreement with them. A materialized `TIMELINE.md` is kept as well, for reference outside a
session. Storing the bullets alone means adding an entry is a single-line insertion with
nothing to recompute. The count and date span is the one part that changes on every addition,
so it is derived when the timeline is shown.

**How to apply:** resolve the active `<username>` by the identity-resolution-contract rule.
Read the `20*.md` files in `waytide/local/diary/<username>/`, sort them by their datetime line,
emit the bullets, and append the computed count and date span. That writer's `TIMELINE.md`
holds the same bullets without it.

Related:

- the new-entry-trigger-rebuilds-timeline-index rule — how the index is maintained
- the identity-resolution-contract rule — how `<username>` is resolved
- the datetime-stamp-line rule — the line each bullet is led by

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
