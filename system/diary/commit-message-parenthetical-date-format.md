# Commit messages for log entries end with a parenthetical date formatted `Ddd Mon D YYYY`

When committing an experience-log entry, the commit message's trailing parenthetical date uses the format `Ddd Mon D YYYY` — abbreviated weekday, abbreviated month, day-of-month with no leading zero, four-digit year. Example: `(Tue Jun 16 2026)`. Not `(June 17)`.

The date is the entry's local-time date, derived from its filename stamp (see [[experience-log-entries]]). It matches the weekday/month/day/year portion of the entry's in-content datetime line, minus the `at HH:MM`.

**Why:** User preference — a consistent, weekday-bearing date in commit messages, matching the readable datetime style used inside entries.

**How to apply:** When writing a commit message for a log entry, format the parenthetical date with `date -j -f "%Y-%m-%d %H:%M:%S" "<filename-stamp>" "+%a %b %e %Y"` and collapse any double space, e.g. `Log entry: <subject> (Tue Jun 16 2026)`.
