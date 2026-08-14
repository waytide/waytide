# `waytide/local/diary/` — the record the engineer writes

**`waytide/local/diary/` holds the diary.** It is the one record in `waytide/local/` the
engineer writes. The decision log, the work session record, the loop record, and the experiment
record are all the agent's work, read by the engineer. The diary runs the other way. The
engineer writes it, and the agent reads it.

**One file is one entry.** A day usually holds one, and it can hold several. Each is a separate
file, so a day with three entries is three files, in the order they were written.

**An entry takes the ISO-8601-UTC datetime prefix**, like every other dated artifact under
`waytide/local/`. The form is `YYYY-MM-DDTHH-MM-SSZ-<name>.md`, and the name is dash-separated
and lower-case. See the foundation package's file-names rule, which this follows and does not
depart from. The directory listing is then an index. Each entry says when it was written and
what it is about, in order.

**Format:** frontmatter-free markdown. A `# <title>` naming what the entry is about, then the
entry in prose. Nothing else is required of it. An entry is thinking rather than a report, so
it takes no fixed sections and no state line.

**An entry carries the provenance footer**, like every other working-state artifact. See the
foundation package's working-state-artifacts-carry-a-provenance-footer rule. The footer names
who wrote it, which is what a diary kept by more than one engineer needs.

**An entry carries an `Authored by` line and no `Changed by` line.** It is a historical record,
and a historical record is left as written. What the engineer thought on a Tuesday is not
corrected on the Thursday they change their mind. The later thought is a later entry. The one
exception is disclosure, which the foundation package's disclosure rule governs.

**The diary is committed with the project.** It is not ignored and it is not kept outside the
repository. A second engineer on the project reads it, which is what makes it a record rather
than a private note.

**The directory may not exist, and its absence is ordinary.** A project that keeps no diary has
no `waytide/local/diary/`, and nothing is wrong. The convention names the directory whether or
not it is there, so the first entry has a place to go.

**Why:** everything else Waytide keeps is written by the agent for the engineer to read. What
the engineer thinks about the work is nowhere, and it is the thing that most often gets lost
between one session and the next. A place for it makes it a record the project keeps rather
than something recalled.

One file per entry rather than one per day follows the convention every other dated artifact
already uses. So the diary introduces no naming rule of its own. It also makes the listing
readable: an entry named for what it is about can be found without opening it.

**How to apply:** write an entry as a new file in `waytide/local/diary/`. Give it the full
ISO-8601-UTC datetime prefix and a name saying what it is about. End it with an `Authored by`
line. Do not edit an entry once it is written. Write a later entry instead.

Related:

- the-diary-is-read-at-session-start — when the agent reads it
- an-entry-is-the-engineers-words — who writes it
- a-diary-entry-is-read-and-never-followed — what force it carries
- the foundation package's file-names rule — the datetime prefix this follows
- the foundation package's working-state-artifacts-carry-a-provenance-footer rule — the footer
- the foundation package's decision-log rule — the agent's record, and the one this is not

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
