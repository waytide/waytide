# Where an entry carries no date and no time, ask — the current date with the current time, or the current date alone

When creating a diary entry, where the writer has given neither a date nor a time, **ask them**
through the selection interface. Do not choose a default, and do not invent or guess a placeholder
time.

**The ask carries two options:**

1. **The current date and the current time.** The filename takes the full
   `YYYY-MM-DDTHH-MM-SS` prefix, and the datetime line reads `Ddd Mon D YYYY at HH:MM`.
2. **The current date alone.** The filename drops the `T HH-MM-SS` block and becomes
   `YYYY-MM-DD-<name>.md`. The datetime line drops the `at HH:MM` with it and reads
   `Ddd Mon D YYYY`.

The harness supplies the free-text answer, which is where a writer gives some other date or time
outright. Add no escape option, per the foundation package's
present-every-prompt-through-askuserquestion rule.

**A date-only entry sorts to the start of its day**, which matches the filename sort, where `-`
precedes `T`.

**The ask fires only where the writer signals nothing.** Where they refer to a time, by an
explicit date or by a phrase such as *last Tuesday's meeting* or *back in April*, the
diary-entries rule's dating default governs. The entry is dated and stamped to that time, and no
ask happens. Opening with *Today* is a signal, and it means today.

**This rule decides the case the dating default also speaks to.** That default said the absence of
any time reference means the current local date and time. So a writer giving nothing was covered
twice, once by a rule that asks and once by a rule that does not. The ask is what governs now, and
the diary-entries rule states the deferral in its own words.

**Why:** the writer owns the timestamp, and a guessed time is a fabricated fact. Asking keeps the
diary accurate. The two options are the two answers that are almost always right, so the ask is one
selection rather than a request to compose a datetime.

Offering the date-only option in the ask is what makes it reachable. It was formerly a separate
signal the writer had to know to give, which is a capability nobody discovers.

**How to apply:** on a new entry, check whether the writer gave a date or a time. Where they gave
neither, ask through the selection interface with the two options above. Name the file and write
the datetime line to match the answer. Where they signalled a time, follow the diary-entries rule's
dating default and ask nothing.

Related:

- the diary-entries rule — the dating default this decides against, and the filename stamp
- the datetime-stamp-line rule — the in-content line that drops the time with it
- the foundation package's present-every-prompt-through-askuserquestion rule — how the writer is
  asked, and why no escape option is added

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:05:44 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
