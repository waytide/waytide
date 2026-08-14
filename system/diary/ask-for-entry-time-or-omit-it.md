# Where an entry's time is not specified, ask for it. Where the writer says to ignore it, drop the time from the filename

When creating a diary entry, where the writer has not specified the time of the event, ask them
for it rather than choosing a default. Do not invent or guess a placeholder time.

Where the writer indicates the time should be ignored, or that it is not relevant, omit the
`T HH-MM-SS` portion from the ISO 8601 filename prefix. The filename becomes
`YYYY-MM-DD-<name>.md`, a date alone, with no `T…Z` time block. The in-content datetime line
drops the `at HH:MM` with it, and reads as a date alone — `Ddd Mon D YYYY`. See the
datetime-stamp-line rule.

The date itself still follows the diary-entries rule's dating default, which is today unless
the writer signals otherwise, and it is in local time.

**Why:** the writer owns the timestamp. A guessed time is a fabricated fact. Asking keeps the
diary accurate, and dropping the time cleanly is better than recording a false one where the
time genuinely does not matter.

**How to apply:** on a new entry, check whether the writer gave a time. Where they did not, ask
for it. Where the writer says to omit the time, name the file `YYYY-MM-DD-<name>.md` and write
the datetime line as `Ddd Mon D YYYY`, with no `at HH:MM`.

Related:

- the diary-entries rule — the filename stamp and the dating default
- the datetime-stamp-line rule — the in-content line that drops the time with it
- the foundation package's present-every-prompt-through-askuserquestion rule — how the writer is asked

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
