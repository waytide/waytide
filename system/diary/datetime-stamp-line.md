# Experience log entries carry a human-readable datetime line under the title

Every experience log entry includes a datetime stamp in its content, on its own line directly under the `# title` heading — above the `**Tags:**` line (if any), the `**Summary:**` line (if any), and the body.

Format: `Ddd Mon D YYYY at HH:MM` — abbreviated weekday, abbreviated month, day-of-month with no leading zero, four-digit year, the literal word `at`, then 24-hour `HH:MM`. Example: `Mon Jun 1 2026 at 13:40`.

The datetime is derived from the entry's filename stamp, which is **local time** (see [[experience-log-entries]]). Parse the filename's `YYYY-MM-DDTHH-MM-SS` as local time — do not convert time zones. The trailing `Z` in the filename is a literal token, not a UTC assertion.

The structure of a full entry is therefore: `# title`, then the datetime line, then optional `**Tags:**`, then optional `**Summary:**`, then the body (omitted when it would duplicate the title).

**Why:** Surfaces the entry's date and time in a readable form right in the content and in Quick Look preview, without making the reader decode the filename stamp.

**How to apply:** When creating an entry, compute the datetime line from the local-time filename stamp with `date -j -f "%Y-%m-%d %H:%M:%S" "<stamp>" "+%a %b %e %Y at %H:%M"` and collapse any double space. Place it under the title, above any Tags/Summary lines.
