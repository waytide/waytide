# A journal entry may be private

- **State:** Open
- **Tags:** [idea]

**A writer may keep a journal entry private, where every entry is now shared.** The journal-convention commits the journal with the project and says that a second writer reads it, "which is what makes it a record rather than a private note". A private entry would be the writer's own, kept from the other readers an ordinary entry reaches.

**Each reader an entry now reaches is a place privacy could apply:**
- the other writers on the project, who read the committed journal
- anyone who reads the repository, since repositories are public and the journal is published with the project
- the agent, which reads every entry at session start under the the-journal-is-read-at-session-start rule

**Not yet settled:**
- which of those readers a private entry is kept from
- where a private entry lives, if it is not committed. The a-project-does-not-name-its-consumers rule already puts per-machine data under `~/.config/`, outside the repository, rather than in a gitignored file.
- how an entry is marked private, such as by a reserved tag, and whether it can later be made shared
- how this sits with the journal-convention's statement that the journal is a record rather than a private note

## History

As the engineer first stated it: "Idea: Private journal entries"

---

Authored by Scott Bellware on Sun Oct 25 2026 at 3:18:21 PM PT
