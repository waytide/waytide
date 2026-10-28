# `~/.local/share/waytide/journal/<project>/` — a private journal, kept outside the project

**A private journal is a journal kept outside the project's repository.** Its entries are not committed with the project, so the project's other writers and the readers of its repository do not reach them. A journal in `waytide/local/journal/<username>/` is the **shared journal**, and the journal-convention governs it.

**Every private journal is under one root, `~/.local/share/waytide/journal/`.** XDG puts the data a program keeps for a user under `~/.local/share/`, and an entry is data. Per-machine settings stay under `~/.config/waytide/`, which this root does not share.

**Each project with a private journal has one directory under the root, named for that project.** The name is the name of the project whose repository holds the shared journal — `~/.local/share/waytide/journal/some-project/`. One file in that directory is one entry.

**A private journal has no `<username>` directory.** It sits in one user's home directory, so it belongs to one user by definition. A shared journal holds a directory per writer because a project can have several writers, and a private journal cannot.

**The directory may not exist, and its absence is ordinary.** It is made when the first private entry for that project is written.

## A private entry is started by one of three commands

- `New private journal entry`
- `New private entry`
- `Private note`

**Nothing else writes a private entry.** The shared journal's directive is `new entry`, and an entry started by that directive goes to the shared journal.

## A private entry takes a shared entry's shape

**A private entry follows the shared journal's rules for its filename, its datetime line, its summary, and its footer.** That is the journal-entries rule, the ask-for-entry-time-or-omit-it rule, the datetime-stamp-line rule, the omit-body-when-same-as-title rule, and the journal-convention's `Authored by` footer. The an-entry-is-the-writers-words rule holds too: the agent writes the writer's words and none of its own.

**A private entry takes no commit.** It is not in the project's repository. Whether the private journal is under version control is the engineer's decision, and nothing here asks for it or forbids it.

## A private entry becomes shared only when it is moved

**A private entry becomes shared only on the engineer's command to move it from the private journal to the shared journal.** The file moves into `waytide/local/journal/<username>/` with its filename and content unchanged, and it is removed from the private journal. It is then a shared entry, committed as `Journal: <subject>` like any other.

**Nothing else moves an entry, and the agent does not offer to.** Moving an entry publishes it to every reader of the project's repository.

## What private does not promise

**A private entry is kept out of the project's repository and out of the session-start read.** That is the whole of what private means here.

**It does not keep an entry on the machine.** An entry the agent writes or reads is plain text in the session. From there it reaches the model provider, the local transcript, and any hook a project or an employer deploys.

**Why:** a journal committed with the project is read by every writer on it and by everyone who reads its repository. Some of what a writer thinks about the work is not for those readers. A private journal gives that thinking a place that stays the writer's, and keeps it organized by project so it is read back against the work it is about.

Keeping the private journal outside the repository, rather than in an ignored file inside it, means no `.gitignore` has to stay correct. It also means a reader of the repository cannot see that private entries exist.

**How to apply:** on `New private journal entry`, `New private entry`, or `Private note`, write the entry in `~/.local/share/waytide/journal/<project>/`, named for the project that holds the shared journal. Make the directory where it is absent. Give the entry the shared journal's filename, datetime line, summary, and footer, and ask for its time as a shared entry's time is asked for. Commit nothing.

Move a private entry to the shared journal only on the engineer's command, unchanged, and remove it from the private journal. Do not offer to move one.

Related:

- the journal-convention — the shared journal, and the one this is kept apart from
- the a-private-journal-is-read-only-on-command rule — when the agent reads a private journal
- the journal-entries, ask-for-entry-time-or-omit-it, datetime-stamp-line, and omit-body-when-same-as-title rules — the entry's shape
- the an-entry-is-the-writers-words rule — who writes an entry
- the foundation package's a-project-does-not-name-its-consumers rule — per-machine configuration under `~/.config/`, beside which this keeps data

---

Authored by Scott Bellware on Wed Oct 28 2026 at 3:55:30 PM PT
