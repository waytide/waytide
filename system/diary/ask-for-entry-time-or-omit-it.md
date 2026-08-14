# When an entry's time isn't specified, ask for it; if the user says to ignore the time, drop the time from the filename

When creating an experience log entry, if the user has not specified the time of the event, ask the user for it rather than choosing a default time. Do not invent or guess a placeholder time.

If the user indicates the time should be ignored (or isn't relevant), omit the `T HH-MM-SS` time portion from the ISO 8601 filename prefix. The filename becomes `YYYY-MM-DD-<kebab-slug>.md` (date only, no `T...Z` time block). Correspondingly, the in-content datetime line drops the `at HH:MM` and reads as a date only — `Ddd Mon D YYYY` (see [[experience-log-datetime-stamp-line]]).

The date itself still follows the [[experience-log-entries]] dating default (today unless the user signals otherwise) and is in local time.

**Why:** The user owns the timestamp. A guessed time is a fabricated fact; asking keeps the log accurate, and dropping the time cleanly is better than recording a fake one when the time genuinely doesn't matter.

**How to apply:** On a new entry, check whether the user gave a time. If not, ask. If the user says to ignore/omit the time, name the file `YYYY-MM-DD-<slug>.md` and write the datetime line as `Ddd Mon D YYYY` with no `at HH:MM`.
