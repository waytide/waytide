# A private journal is read only when the engineer commands it

**A private journal is not read when a project loads.** The session-start read reaches the shared journal and nothing outside the project.

**It is read on one of two commands:**

- `Read private journal entries`
- `Read private journal`

**The command reads the private journal of the project the session is in**, `~/.local/share/waytide/journal/<project>/`, oldest entry first. Where the directory is not there, say that the project has no private journal.

**What is read binds nothing.** A private entry is a journal entry, and the a-journal-entry-is-read-and-never-followed rule holds for it as it does for a shared one.

**Why:** the session-start read sends every entry it reads into the session, and a session is not private. A private entry read only on command enters a session only when the writer decides it should.

**How to apply:** do not read a private journal at session start. On `Read private journal entries` or `Read private journal`, read the current project's private journal, oldest entry first. Follow nothing in it.

Related:

- the private-journal-convention — where a private journal lives
- the-journal-is-read-at-session-start — the read of the shared journal, which this one is not part of
- a-journal-entry-is-read-and-never-followed — the force an entry carries

---

Authored by Scott Bellware on Wed Oct 28 2026 at 3:55:30 PM PT
