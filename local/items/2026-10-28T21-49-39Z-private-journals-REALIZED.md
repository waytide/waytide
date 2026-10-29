# Private journals

- **State:** Realized
- **Tags:** [idea]

**A writer may keep journal entries private, where every entry is now committed with the project and shared.** This restores the idea of `local/items/2026-10-25T22-18-21Z-a-journal-entry-may-be-private-ABANDONED.md`. That item stays abandoned, since an abandoned item is not taken back, and this one carries the idea forward.

**What the abandoned item established, which this one starts from:**

- **Where a private entry would live:** in `~/.local/share/waytide/journal/`, outside the project's repository, as a git repository of its own synced to a private remote. This was settled on 2026-10-26.
- **Why it was abandoned:** an entry the agent writes or reads is plain text in the session, whether or not it is encrypted at rest. From there it reaches the model provider, the local transcript, and any hook a project or an employer deploys. The engineer judged that a truly private journal belongs on a separate machine the writer alone controls.

**Not yet settled:**

- what "private" promises, given that an entry the agent touches leaves the machine
- which readers a private entry is kept from: the project's other writers, the public repository, or the agent at session start
- how an entry is marked private, and whether it can later be made shared

## Settled

- **2026-10-28** — `~/.local/share/waytide/journal/` is the root of every private journal. Each project with a private journal has one directory under it, named for the project, as `~/.local/share/waytide/journal/some-project/`. A private journal belongs to one user by definition, so it has no `<username>` directory, which a journal in a project requires to keep its writers apart.
- **2026-10-28** — A new private journal entry is started by one of three commands: `New private journal entry`, `New private entry`, or `Private note`.
- **2026-10-28** — A private journal is not read when a project loads. It is read only when the engineer gives one of two commands: `Read private journal entries` or `Read private journal`.
- **2026-10-28** — A private entry follows the shared journal's rules for its filename, its datetime line, its summary, and its footer.
- **2026-10-28** — A project's private journal directory takes its name from the project whose repository holds the shared journal.
- **2026-10-28** — Whether git is used on the private journal does not bear on this item. The engineer decides it. The earlier item's resolution that the directory is a git repository synced to a private remote does not carry over.
- **2026-10-28** — A private entry becomes shared only when the engineer commands that it be moved from the private journal to the shared journal.
- **2026-10-28** — The engineer declared every other question settled. The **Not yet settled** list above no longer holds.

## History

As the engineer first stated it: "New idea: Private journals. This is a restoration of the idea that was abandoned."

The three resolutions of 2026-10-28, as the engineer stated them: "Use ~/.local/share/waytide/journal/ as the root of private journals. A private journal in this directory is by-definition for a single user, so it doesn't require any differentiation as do journals in a project. Each project with a private journal will be a directory under ~/.local/share/waytide/journal/. For example: ~/.local/share/waytide/journal/some-project. A new private journal entry is started with the command, "New private journal entry", "New private entry", or "Private note". Private journal entries are not read automatically when a project loads. A private journal is read when the user explicitly commands: "Read private journal entries", or "Read private journal"."

The later resolutions of 2026-10-28, as the engineer stated them: "A private entry follows the shared journal's rules for filename, the datetime line, the summary, and the footer. The project directory name comes from the source project where the shared journal is held. Any use of git on the private journal is entirely immaterial to this. The engineer can decide. A private entry can be made shared only by the user commanding that an entry be moved from the private journal to the shared journal. Consider all other matters settled."

---

Authored by Scott Bellware on Wed Oct 28 2026 at 2:49:39 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 3:21:16 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 3:45:50 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 3:51:08 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 4:57:39 PM PT
