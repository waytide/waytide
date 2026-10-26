# A journal entry may be private

- **State:** Abandoned
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

## Settled

- **2026-10-26** — A private entry lives in `~/.local/share/waytide/journal/`, outside the project's repository. That directory is a git repository of its own, synced to a private remote. XDG puts data a program keeps for the user under `~/.local/share/`, and settings under `~/.config/`. An entry is data, and `~/.config/waytide/` holds per-machine settings that should not be synced with it. In a project with many people, the presence of private entries in its repository would itself be a disclosure, even with their contents and names encrypted, so they are kept out of it.

## Abandoned — 2026-10-26

**The engineer abandoned the item.** In the engineer's words: "It doesn't seem like secure, private journal entries are a realistic expectation. It seems like that journal should be on a separate machine controlled exclusively by the user."

**What the discussion had established before the decision:** an entry the agent writes or reads is plain text in the session, whether or not it is encrypted at rest. From there it reaches the model provider, the local transcript, and any hook the project or an employer deploys. On a machine or a Claude account an employer manages, the employer's tools can reach it too. Nothing was built.

## History

As the engineer first stated it: "Idea: Private journal entries"

---

Authored by Scott Bellware on Sun Oct 25 2026 at 3:18:21 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:00:13 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:24:23 PM PT
