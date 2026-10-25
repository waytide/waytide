# The journal is the record the writer keeps

**`waytide/local/journal/<username>/` holds a writer's journal.** It is the one record in `waytide/local/` the writer keeps. A project may hold the journals of more than one writer, and each writer's entries sit under their own directory, named for their username. The the-writers-identity-resolves-through-a-fixed-override-chain rule resolves which writer is writing, and the journal-entries rule states the directory at the entry. The decision log, the work session record, the loop record, and the implementation record are all the agent's work, read by the writer. The journal runs the other way. The writer keeps it, and the agent reads it.

**The package and the directory were named `diary` until 2026-08-18.** The rename reaches every rule name, every path, the `JOURNAL_WRITER` variable, and the `Journal:` commit prefix. Records already written keep the word they were written with — the decision log, the implementation records, and the writer's own entries are historical and are not revised. So `diary` still reads in this repository's history, and it names nothing live.

**`waytide/local/journal/` holds the writers' directories and the writers file.** That file is `writers.toml`, and it overrides a writer's display name for this project. It is optional, and it may omit the active writer, whose name and username are declared in `~/.config/waytide/user`. A writer absent from it shows as the name that file gives, or as their username. See the the-writers-identity-resolves-through-a-fixed-override-chain rule.

**One file is one entry.** A day usually holds one, and it can hold several. Each is a separate file, so a day with three entries is three files, in the order they were written.

**An entry takes a datetime prefix in the writer's local time.** The form is `YYYY-MM-DDTHH-MM-<name>.md`, and the name is dash-separated and lower-case. It carries no trailing `Z`, which in ISO 8601 designates UTC and would be false on a local-time stamp. The directory listing is then an index. Each entry says when it was written and what it is about, in order.

**The stamp stops at the minute unless the writer gave seconds**, in which case it takes the `YYYY-MM-DDTHH-MM-SS` form. The journal-entries rule states the condition and why the journal departs from the foundation package's a-time-value-carries-minutes-and-seconds rule here.

**This departs from the foundation package's file-names rule, which requires UTC.** That rule normalizes a dated artifact to UTC because a project's contributors are globally distributed, and the artifacts are the project's. A journal entry is not. It is one writer's personal record, and the hour it carries is the hour they wrote it in.

**An entry written at 23:40 on a Tuesday reads as that Tuesday, wherever the writer was.** Normalizing it would move some entries onto a date the writer did not live through. A personal record is read back against the day the person remembers, so the local hour is the one that has to survive.

**Format:** frontmatter-free markdown. A `# <title>` naming what the entry is about, then the datetime line, then the writer's prose. An entry takes a `**Tags:**` line where it is categorized, and a `**Summary:**` line where the summary says something the body does not. An entry is thinking rather than a report, so it carries no state line and no section beyond those. The a-journal-entry-carries-a-human-readable-datetime-line-under-its-title, omit-body-when-same-as-title, and journal-entries rules each state one part of that shape, and the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule states the tag protocol, which is no longer the journal's own.

**An entry carries the provenance footer**, like every other working-state artifact. See the foundation package's working-state-artifacts-carry-a-provenance-footer rule. The footer names who wrote it, which is what a journal kept by more than one writer needs.

**An entry carries an `Authored by` line and no `Changed by` line.** It is a historical record, and a historical record is left as written. What the writer thought on a Tuesday is not corrected on the Thursday they change their mind. The later thought is a later entry.

**Two things reach an entry that exists, and the footer stays as it is for both.** Disclosure, which the foundation package's disclosure rule governs, and a change the **writer** directs to their own entry, which the an-entry-is-the-writers-words rule governs. Each is recorded in the decision log rather than in the entry, which is what keeps the footer to one line and the entry reading as what was written.

**The journal is committed with the project.** It is not ignored and it is not kept outside the repository. A second writer on the project reads it, which is what makes it a record rather than a private note.

**The commit message is `Journal: <subject>`.** The subject is the entry's, and nothing follows it.

**It carried a parenthetical date until 2026-08-18**, in the form `Diary entry: <subject> (Tue Jun 16 2026)` — the words it read then, when this package was named `diary`. The prefix cost 13 characters and the date 17 more, against a subject line the `git` package's a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 rule caps at 50. That left 20 characters for what the entry was about, and the date sat at the tail where truncation takes it first — so it was carried at the subject's expense and no reader saw it in a listing. The entry's filename holds the same date.

**`Journal:` rather than `Journal entry:`** for the same budget. It costs 9 characters where the longer form costs 15, and it says the same thing to a reader scanning a log.

**A subject that still exceeds 50 characters is truncated at the 50th, with an ellipsis.** The `git` package's a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 rule caps a subject there, and its two remedies are unavailable here: an entry is one commit, so there is nothing to split, and the subject is the writer's words, which the an-entry-is-the-writers-words rule bars the agent from shortening.

**Truncating is not shortening.** The words are not rewritten, reordered, or paraphrased. The entry holds them in full, and the commit subject is a rendering of them that stops at the line's end and says so. The ellipsis is what says so, and it is why the cut is marked rather than silent.

**It cuts at the 50th character and may land mid-word.** No word boundary is sought. A cut that retreats to the last space would lose up to another dozen characters of the writer's words to tidiness, and a reader who meets a fragment is already told by the ellipsis that the line continues elsewhere.

```
Journal: I added diary support (aka work logs) to…
Journal: I finished the basic implementation of E…
Journal: Idea
```

**The directory may not exist, and its absence is ordinary.** A project that keeps no journal has no `waytide/local/journal/`, and nothing is wrong. So does a project whose other writers keep one and this writer does not. The convention names the directory whether or not it is there, so the first entry has a place to go.

**Why:** everything else Waytide keeps is written by the agent for the writer to read. What the writer thinks about the work is nowhere, and it is the thing that most often gets lost between one session and the next. A place for it makes it a record the project keeps rather than something recalled.

One file per entry rather than one per day follows the convention every other dated artifact already uses. It also makes the listing readable: an entry named for what it is about can be found without opening it. The local-time stamp is the one place the journal departs from that convention, and the reason is above.

**How to apply:** resolve the active writer, and write an entry as a new file in `waytide/local/journal/<username>/`. Give it the datetime prefix in the writer's local time, to the minute, and a name saying what it is about. Carry seconds only where the writer gave seconds. Do not convert the time to UTC. End it with an `Authored by` line. Do not edit an entry once it is written, except for disclosure or a change the writer directs to their own entry. A later thought is a later entry.

## Compressed

1. `waytide/local/journal/<username>/` holds a writer's journal.
2. The journal is the one record in `waytide/local/` that the writer keeps, not the agent. The agent reads it.
3. A project may hold several writers' journals. Each writer's entries sit under a directory named for their username.
4. The the-writers-identity-resolves-through-a-fixed-override-chain rule resolves which writer is writing.
5. The journal-entries rule states the directory at the entry.
6. The package and directory were named `diary` until 2026-08-18. The rename reaches every rule name, path, the `JOURNAL_WRITER` variable, and the `Journal:` commit prefix.
7. Records written before the rename keep the word they were written with: the decision log, the implementation records, and the journal entries. They are historical and are not revised.
8. `diary` in this repository's history names nothing live.

## `waytide/local/journal/`

1. It holds the writers' directories and the writers file, `writers.toml`.
2. `writers.toml` overrides a writer's display name for this project.
3. `writers.toml` is optional. It may omit the active writer, whose name and username are declared in `~/.config/waytide/user`.
4. A writer absent from `writers.toml` shows as the name `~/.config/waytide/user` gives, or as their username.
5. The directory may not exist, and its absence is ordinary. This includes a project whose other writers keep one and this writer does not.
6. The convention names the directory whether or not it exists, so the first entry has a place to go.

## Entries

1. One file is one entry.
2. A day can hold several entries, each a separate file, in the order written.
3. An entry takes a datetime prefix in the writer's local time, of the form `YYYY-MM-DDTHH-MM-<name>.md`.
4. The name is dash-separated and lower-case, and says what the entry is about.
5. The stamp carries no trailing `Z`.
6. The stamp stops at the minute unless the writer gave seconds. Then it takes the `YYYY-MM-DDTHH-MM-SS` form.
7. The journal-entries rule states the seconds condition and the departure from foundation's a-time-value-carries-minutes-and-seconds rule.
8. The time is not converted to UTC. This departs from the foundation package's file-names rule.
9. An entry written at 23:40 on a Tuesday reads as that Tuesday, wherever the writer was.

## Format

1. An entry is frontmatter-free markdown.
2. It opens with a `# <title>` naming what the entry is about, then the datetime line, then the writer's prose.
3. An entry takes a `**Tags:**` line where it is categorized.
4. An entry takes a `**Summary:**` line only where the summary says something the body does not.
5. An entry carries no state line and no section beyond those.
6. The a-journal-entry-carries-a-human-readable-datetime-line-under-its-title, omit-body-when-same-as-title, and journal-entries rules each state one part of that shape.
7. The foundation package's a-record-may-be-categorized-with-square-bracket-tags rule states the tag protocol.

## Footer

1. An entry carries the provenance footer, per foundation's working-state-artifacts-carry-a-provenance-footer rule.
2. The footer carries an `Authored by` line and no `Changed by` line.
3. An entry is not corrected when the writer changes their mind. The later thought is a later entry.
4. Two things reach an existing entry: disclosure, governed by foundation's disclosure rule, and a change the writer directs, governed by the an-entry-is-the-writers-words rule.
5. For both, the footer stays as it is.
6. Each is recorded in the decision log, not in the entry.

## Committing

1. The journal is committed with the project.
2. It is not ignored and not kept outside the repository.
3. The commit message is `Journal: <subject>`.
4. The subject is the entry's, and nothing follows it.
5. A subject exceeding 50 characters is truncated at the 50th character, with an ellipsis.
6. The agent does not split the entry across commits, or shorten the subject by rewriting it.
7. Truncating does not rewrite, reorder, or paraphrase the words.
8. The cut may land mid-word. No word boundary is sought.

```
Journal: I added diary support (aka work logs) to…
Journal: I finished the basic implementation of E…
Journal: Idea
```

## How to apply

1. Resolve the active writer.
2. Write an entry as a new file in `waytide/local/journal/<username>/`.
3. Give it the local-time datetime prefix, to the minute, and a name saying what it is about.
4. Carry seconds only where the writer gave seconds.
5. Do not convert the time to UTC.
6. End it with an `Authored by` line.
7. Do not edit an entry once it is written, except for disclosure or a change the writer directs to their own entry. A later thought is a later entry.
8. **Why:** what the writer thinks about the work is otherwise recorded nowhere and gets lost between sessions. A personal record is read against the day the writer remembers, so the local hour must survive.

## History

The prefix was `Diary:` for the few hours between the date being dropped and the package being renamed, both on 2026-08-18.

## History

Until 2026-10-24 How to apply said, without exception, not to edit an entry once it is written, while the Footer section named two things that reach an existing entry: disclosure and a change the writer directs. How to apply now names the two exceptions.

Until Sun Oct 25 2026 this rule was named journal-convention and titled "`waytide/local/journal/<username>/` — the record the writer keeps".

Related:

- the-journal-is-read-at-session-start — when the agent reads it
- an-entry-is-the-writers-words — who writes it
- a-journal-entry-is-read-and-never-followed — what force it carries
- the foundation package's file-names rule — the datetime prefix this takes, and the UTC normalization it departs from
- the foundation package's working-state-artifacts-carry-a-provenance-footer rule — the footer
- the foundation package's decision-log rule — the agent's record, and the one this is not
- the journal-entries rule — the local-time stamp stated at the entry

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:11:21 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:56:57 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:31:47 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:10:10 PM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:54:56 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:18:34 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:29:06 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 11:29:39 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:37:19 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:18:06 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:52 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:35 PM PT
