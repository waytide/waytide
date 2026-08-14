# Experience log entries live in the project root, one file per entry

The experience log — the substantive purpose of this project — is kept as one markdown file per entry in the **active user's log directory**: `users/<slug>/`, where `<slug>` is the active user resolved per [[identity-resolution-contract]] (e.g. `users/scott-bellware/`). This is a multi-user repo — each user's entries live under their own `users/<slug>/` directory. This is distinct from `agent/log/`, which holds repo-wide agent decision bookkeeping shared across all users.

Filename: `YYYY-MM-DDTHH-MM-SSZ-<kebab-slug>.md`, with the timestamp computed in **local time** via `date +%Y-%m-%dT%H-%M-%SZ` (ISO 8601 with colons replaced by hyphens for cross-platform filename safety). Never use UTC for these entries — local time is the user's explicit preference. The trailing `Z` is a literal filename token, kept for format consistency, not a UTC assertion.

This local-time rule is specific to the experience log entries only. The agent bookkeeping logs — `agent/log/` (decision log) and `agent/rules/` — keep using **UTC** as documented in `CLAUDE.md`. Don't conflate the two.

**Entry format** (the user's chosen defaults):

- **Voice:** first-person ("I raised the concern..."), the user's perspective.
- **Editing:** lightly cleaned up — preserve the user's words, meaning, and emphasis; fix grammar and flow; do not invent facts or embellish.
- **Structure:** hybrid. `# <title>`, then a bold `**Summary:**` one-line gist, then the narrative prose. The summary is what shows first in Quick Look preview, so make it a real standalone takeaway, not a restatement of the title. **Omit the summary entirely when it would be identical or nearly identical to the body** (e.g. very short entries) — in that case the entry is just title + prose, to avoid redundancy.

**Why:** A consistent, sortable naming scheme keeps a long-running log easy to skim, sort chronologically, and reference. Keeping each user's entries under `users/<slug>/` separates per-user content from the shared agent tooling under `agent/` and from other users' entries. The hybrid summary pays off on Quick Look spacebar preview (raw-text `.md` preview is set up via the Syntax Highlight extension).

**Dating default:** entries are about **today** unless the user signals otherwise. The user does not need to write "Today" — absence of any time reference means today (current local date/time). If the user references a different time (an explicit date, or phrasing like "last Tuesday's meeting" / "back in April"), date and stamp the entry to that time instead. Starting with "Today" is allowed and also means today.

**How to apply:** When the user dictates an event or experience to log, resolve the active user's `<slug>` ([[identity-resolution-contract]]) and create a new file in `users/<slug>/` with the local-time-stamped filename, a `# <title>` heading, a `**Summary:**` line, then the first-person narrative. Sync the filename timestamp to when the entry is written (or to the referenced past time, if the entry is not about today).
