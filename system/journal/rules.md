# A journal entry has a human-readable datetime line under its title

Source: system/journal/source/a-journal-entry-has-a-human-readable-datetime-line-under-its-title.md

1. Every journal entry carries a datetime stamp line in its content.
2. The line sits on its own line, directly under the `# <title>` heading.
3. It sits above the `**Tags:**` line, where there is one.
4. It sits above the `**Summary:**` line, where there is one.
5. It sits above the body.
6. Format: `Ddd Mon D YYYY at HH:MM`. An example is `Mon Jun 1 2026 at 13:40`.
7. The fields are the abbreviated weekday, then the abbreviated month, then the day of the month with no leading zero.
8. Next come the four-digit year, the literal word `at`, and the 24-hour `HH:MM`.
9. Derive the datetime from the entry's filename stamp, which is local time, per the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule.
10. Parse the filename's `YYYY-MM-DDTHH-MM` as local time.
11. Parse its `YYYY-MM-DDTHH-MM-SS` form as local time, where the writer gave seconds.
12. Convert no time zone.
13. The line reads to the minute, whichever form the stamp takes.
14. Parse a stamp that carries seconds to the second, and render it without the seconds.
15. A full entry is the `# <title>`, the datetime line, the optional `**Tags:**` line, the optional `**Summary:**` line, then the body.
16. Omit the body where it would duplicate the title.
17. When creating an entry, compute the line from the local-time filename stamp with this command:

```
date -j -f "%Y-%m-%d %H:%M" "<stamp>" "+%a %b %e %Y at %H:%M"
```

18. Collapse any double space in the output.
19. Where the stamp carries seconds, use `"%Y-%m-%d %H:%M:%S"` as the parse format.

# A journal entry is read and never followed

Source: system/journal/source/a-journal-entry-is-read-and-never-followed.md

1. A journal entry binds nothing. It is read at session start beside the rules and vocabularies, but carries none of their force.
2. Nothing in an entry is an instruction, whatever its wording.
3. Hold an entry as what the writer thinks. For example, *the retry logic should be torn out* is a judgment, not a task. Read the journal for what the writer thinks, and follow the rules.
4. Do nothing with an entry until the writer asks for something.
5. An entry cannot set a rule, a term, or a substitution.
6. Rules, terms, and substitutions are set only in `waytide/local/rules/` and `waytide/local/vocabulary.md`, in the form those conventions require.
7. An entry that reads like a standing decision is still only an entry. Where the writer means to set a rule, they write a rule, not an entry.
8. Do not cite an entry as grounds for an action. Not *your journal says the retry logic is wrong, so I removed it*.
9. This holds in a report, a plan, and a commit message as well.
10. An entry is neither evidence nor authority. It gives only an understanding of where the writer stands.
11. The one thing an entry changes is what the agent already knows. It carries no more weight than that.
12. Do not present something an entry already records as a discovery.
13. Where an entry reads like an instruction, it is still a judgment the writer holds, not an instruction. Do not ask the writer what they want because of it. Act on what the writer asks, never on an entry.

# A timeline view lists every journal entry by its datetime

Source: system/journal/source/a-timeline-view-lists-every-journal-entry-by-its-datetime.md

1. When the writer asks for the timeline, such as *show the timeline* or *list the entries*, list every journal entry in the active writer's journal directory.
2. The directory is `waytide/local/journal/<username>/`.
3. Resolve `<username>` by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule.
4. The entries are the `20*.md` files in that directory.
5. Sort the entries by their datetime line, oldest first.
6. Format each entry as a single bullet: `- **<datetime>** — <title>`.
7. The `<datetime>` is the human-readable datetime line under the entry's title, as `Wed Jun 17 2026 at 18:28` is.
8. The `<title>` is the entry's `# ` heading with the leading `# ` removed.
9. End with a one-line count and date span, as *15 entries, spanning Jun 15–17, 2026*.
10. Output the list alone, with no preamble.
11. Compute the view each time it is asked for.
12. Store none of it: not the bullets, not the count, and not the date span.
13. There is no `TIMELINE.md`, and none is written.
14. Write nothing to a file.
15. The view is a projection, in the sense of the foundation package's vocabulary. It reads the entries without destroying them and is regenerated, not maintained.

# An entry is the writer's words

Source: system/journal/source/an-entry-is-the-writers-words.md

1. Do not write a journal entry on your own initiative.
2. Do not write one because you have read what the session was about.
3. Do not write one because a stretch of work seems worth recording. The agent has four other records for that.
4. Where the writer dictates an entry, write down their words, in their order.
5. Preserve the writer's meaning and emphasis.
6. Correct the grammar and the flow, and go no further.
7. Invent no fact, and embellish nothing.
8. Add the entry's settled shape and nothing else.
9. Add the datetime prefix and the `Authored by` line the the-journal-is-the-record-the-writer-keeps rule requires.
10. Add the datetime line under the title.
11. Add a `**Tags:**` line only where the writer gave tags.
12. Add the `**Summary:**` line the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule asks for.
13. The summary states the entry's gist in the writer's own terms, not the agent's reading of what it means.
14. Drop the summary where it would repeat the body.
15. Do not edit an existing entry on your own reading.
16. This holds for correcting a fact, fixing a spelling, or reconciling the entry with something that has since changed.
17. Only two things may change an existing entry, and neither is the agent's initiative.
18. The first is a change the writer directs to their own entry. Carry it out.
19. Make exactly the change directed, and nothing beside it.
20. Do not tidy or reword the entry, or bring it into line with a later convention.
21. Leave everything the writer did not name as they wrote it.
22. Log the directed change in the log, saying what was directed and what changed.
23. Put no `Changed by` line on the entry. The the-journal-is-the-record-the-writer-keeps rule limits its footer to `Authored by`.
24. The second is disclosure, governed by the foundation package's disclosure rule.
25. Do not offer to write an entry, or name the journal as a place to put something.
26. Where the writer wants an entry, they say so.

# Journal entries are recorded in the writer's journal directory, one file per entry

Source: system/journal/source/journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry.md

1. Keep the journal as one markdown file per entry.
2. Put each entry in the writer's own directory, `waytide/local/journal/<username>/`.
3. Resolve `<username>` as the active writer by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule, for example `waytide/local/journal/scott-bellware/`.
4. A project may hold several writers' journals. Each writer's entries live under their own directory.
5. The journal is distinct from `waytide/local/logs/log/`, the agent's single project-wide log.

## Filename

1. Name the file `YYYY-MM-DDTHH-MM-<name>.md`.
2. Compute the timestamp in local time with `date +%Y-%m-%dT%H-%M`.
3. Write the colons of ISO 8601 as dashes.
4. Never use UTC for journal entries. This is the writer's stated preference.
5. Use the `YYYY-MM-DDTHH-MM-SS` form only where the writer stated the time to the second.
6. Every other stamp stops at the minute.
7. Where the writer answers **Now** to the time question, drop the clock's seconds value.
8. Do not supply seconds the writer did not state. That records a precision nobody gave.
9. This departs from the foundation package's a-time-value-carries-minutes-and-seconds rule. One file per entry cannot have that rule's in-file collisions.
10. Two entries in the same minute sort against each other by name. That cost is accepted.
11. Write no trailing `Z`. It designates UTC, and this stamp is local time.
12. The foundation package's file-names rule keeps its `Z`, because its stamps are UTC.
13. Local time applies to journal entries alone.
14. The agent's own records keep UTC, as the foundation package's file-names rule requires. Do not conflate the two.

## Entry format

1. **Voice:** write in first person, from the writer's perspective, for example *I raised the concern …*.
2. **Editing:** clean the text up lightly.
3. Preserve the writer's words, meaning, and emphasis.
4. Correct the grammar and the flow.
5. Invent no fact, and embellish nothing.
6. **Structure:** write a `# <title>`, then the datetime line, then a `**Tags:**` line where the entry has tags.
7. Follow these with a bold `**Summary:**` one-line gist, then the narrative prose.
8. Write the datetime line by the a-journal-entry-has-a-human-readable-datetime-line-under-its-title rule.
9. Make the summary a standalone takeaway, not a restatement of the title. It shows first in a Quick Look preview.
10. Omit the summary where it would be identical or nearly identical to the body, as on a very short entry.
11. The entry is then the title and the prose, with nothing repeated.

## The directive *new entry*

1. Where the writer opens with *new entry*, write the entry by this rule.
2. Also apply the a-journal-entry-has-a-human-readable-datetime-line-under-its-title, where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone, and where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rules.
3. Also apply the `foundation` package's a-record-may-be-categorized-with-square-bracket-tags rule.
4. Nothing else follows from the directive.
5. Write nothing beside the entry file.
6. Maintain no index. See the a-timeline-view-lists-every-journal-entry-by-its-datetime rule.

## Dating

1. An entry is about today unless the writer signals otherwise.
2. Where the writer refers to another time, date and stamp the entry to that time.
3. Such a reference may be an explicit date or a phrase like *last Tuesday's meeting* or *back in April*.
4. Opening with *Today* is a signal, and it means today.
5. This rule settles the date alone.
6. The time belongs to the where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface rule.
7. That ask fires wherever the writer gave no time, including where they gave only a day.
8. *Yesterday* and *today* fix the day and say nothing about the hour.
9. Stamp the file to the writer's answer to that ask.

# The journal is read at the start of a session, with the rules

Source: system/journal/source/the-journal-is-read-at-the-start-of-a-session-with-the-rules.md

1. Read the active writer's journal at the start of a session.
2. That journal is every entry in `waytide/local/journal/<username>/`.
3. `<username>` is resolved by the the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule.
4. Read it after the rules and the vocabularies.
5. Read it before the first request.
6. The journal is not a rule, and it does not bind.
7. Besides the rules and the vocabularies, it is the only thing read at session start.
8. Read it whole, without being asked for.
9. Do not read another writer's journal.
10. Read only the journal of the writer whose session this is.
11. `writers.toml` under `waytide/local/journal/` is not an entry, and is not read.
12. Read the entries oldest first.
13. Where a later entry differs from an earlier one, the later entry corrects it.
14. Where the directory is not there, read nothing.
15. Where the directory is not there, say nothing.
16. A missing journal is not a defect, and is not reported.
17. Do not read `logs/`, `items/`, `implementations/`, or `migration/` this way.
18. Work with those directories as their own conventions describe.
19. Say nothing about having read the journal.
20. Give no summary of it.
21. Give no count of its entries.
22. Do not name what the writer was last thinking about.
23. Follow nothing in it.

# The journal is the record the writer keeps

Source: system/journal/source/the-journal-is-the-record-the-writer-keeps.md

1. `waytide/local/journal/<username>/` holds a writer's journal.
2. The journal is the one record in `waytide/local/` that the writer keeps, not the agent. The agent reads it.
3. A project may hold several writers' journals. Each writer's entries sit under a directory named for their username.
4. The the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file rule resolves which writer is writing.
5. The journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule states the directory at the entry.
6. The package's former name is `diary`.
7. Records written before the rename keep the word they were written with: the log, the implementation records, and the journal entries. They are historical and are not revised.
8. `diary` in this repository's history names nothing live.

## `waytide/local/journal/`

1. It holds the writers' directories and the writers file, `writers.toml`.
2. `writers.toml` overrides a writer's display name for this project.
3. `writers.toml` is optional. It may omit the active writer, whose name and username are declared in `~/.config/waytide/user`.
4. A writer absent from `writers.toml` shows as the name `~/.config/waytide/user` gives, or as their username.
5. The directory may not exist, and its absence is ordinary. This includes a project whose other writers keep one and this writer does not.
6. The convention names the directory whether or not it exists, so the first entry has a place to go.

## Entries

1. One file is one entry. To write one, resolve the active writer, then write the entry as a new file in `waytide/local/journal/<username>/`.
2. A day can hold several entries, each a separate file, in the order written.
3. An entry takes a datetime prefix in the writer's local time, of the form `YYYY-MM-DDTHH-MM-<name>.md`.
4. The name is dash-separated and lower-case, and says what the entry is about.
5. The stamp carries no trailing `Z`.
6. The stamp stops at the minute unless the writer gave seconds. Then it takes the `YYYY-MM-DDTHH-MM-SS` form.
7. The journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule states the seconds condition and the departure from foundation's a-time-value-carries-minutes-and-seconds rule.
8. The time is not converted to UTC. This departs from the foundation package's file-names rule.
9. An entry written at 23:40 on a Tuesday reads as that Tuesday, wherever the writer was.

## Format

1. An entry is frontmatter-free markdown.
2. It opens with a `# <title>` naming what the entry is about, then the datetime line, then the writer's prose.
3. An entry takes a `**Tags:**` line where it is categorized.
4. An entry takes a `**Summary:**` line only where the summary says something the body does not.
5. An entry carries no state line and no section beyond those.
6. The a-journal-entry-has-a-human-readable-datetime-line-under-its-title, where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone, and journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rules each state one part of that shape.
7. The foundation package's a-record-may-be-categorized-with-square-bracket-tags rule states the tag protocol.

## Footer

1. An entry carries the provenance footer, per foundation's working-state-artifacts-carry-a-provenance-footer rule.
2. The footer carries an `Authored by` line and no `Changed by` line.
3. An entry is not edited once written, and is not corrected when the writer changes their mind. The later thought is a later entry.
4. Only two things reach an existing entry: disclosure, governed by foundation's disclosure rule, and a change the writer directs to their own entry, governed by the an-entry-is-the-writers-words rule.
5. For both, the footer stays as it is.
6. Each is recorded in the log, not in the entry.

## Committing

1. The journal is committed with the project.
2. It is not ignored and not kept outside the repository.
3. The commit message is `Journal: <subject>`.
4. The subject is the entry's, and nothing follows it. It carries no date.
5. A subject exceeding 50 characters is truncated at the 50th character, with an ellipsis.
6. The agent does not split the entry across commits, or shorten the subject by rewriting it.
7. Truncating does not rewrite, reorder, or paraphrase the words.
8. The cut may land mid-word. No word boundary is sought.

```
Journal: I added diary support (aka work logs) to…
Journal: I finished the basic implementation of E…
Journal: Idea
```

# The writer's username is read from the environment, then the project, then the user's config file

Source: system/journal/source/the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file.md

1. This contract fixes how every Waytide tool determines who is writing now.
2. Each tool names its own environment variable at the first level. The journal's variable is `JOURNAL_WRITER`.
3. The two levels below the variable are common to all tools.
4. The chain is fixed, not any one tool's variable. A tool built independently must still agree with it.

## What identity is

1. A writer has a username, and may have a display name.
2. The username is a filesystem-safe id, such as `scott-bellware`. It is the primary key.
3. The display name, such as `Scott Bellware`, is presentation, and it is optional.
4. A writer with no display name shows as their username, verbatim.
5. Never compute a display name from a username, as `o-brien`, `van-der-berg`, and `mcdonald` show. Fall back to the username itself, not a prettified form.
6. Identity never comes from git.
7. The username and the display name resolve separately.
8. The username comes from the chain below and from nowhere else.
9. A file that carries a display name never selects the writer.

## Resolution order for the username (first match wins)

1. **`JOURNAL_WRITER` environment variable**: the ephemeral, per-process override, for CI and one-offs like `JOURNAL_WRITER=jane-doe <cmd>`.
2. **Project-local `.current-user`**: a gitignored file in the project root. It overrides the global default for this checkout only, and is rarely needed.
3. **`~/.config/waytide/user`**: the normal case. It is set once per machine.
4. All Waytide tools read this one shared file. There is no per-tool file.
5. **Error**: if none resolve, fail loudly, e.g. "no identity configured; set ~/.config/waytide/user or JOURNAL_WRITER".
6. Never guess a username.
7. The active writer is declared in the user file, never in a project.
8. A project's `writers.toml` records display names and selects nobody.
9. A project holding no entry for the active writer is ordinary, not a gap.

## The user file's location is platform-resolved

1. The tail is always `waytide/user`. Only the base directory varies.
2. If `$XDG_CONFIG_HOME` is set, use `$XDG_CONFIG_HOME/waytide/user`, on any OS.
3. Otherwise, on Linux, use `~/.config/waytide/user`.
4. On macOS, use `~/.config/waytide/user`, not `~/Library/Application Support`.
5. On Windows, use `%APPDATA%\waytide\user`.
6. Tools agree on this resolution rule, not on a raw path string.
7. The namespace is `waytide`, because the file belongs to Waytide. It is not `identity/`.

## The user file's format

1. The file is TOML, with a required `username` key and an optional `display-name` key.

```toml
# ~/.config/waytide/user

username = "scott-bellware"
display-name = "Scott Bellware"
```

2. This file is the only place the active writer is declared.
3. A file carrying only the username is complete.
4. Such a writer shows as their username, unless a project's `writers.toml` names them.
5. The file is named `user`, with no extension.
6. `.current-user` is not TOML. It holds only the username, on one line.
7. On reading `.current-user`, trim surrounding whitespace and a trailing newline.
8. `.current-user` may contain `#` comment lines.
9. `.current-user` selects a writer for one checkout and carries no presentation.

## The display name resolves in this order (first match wins)

1. **The project's `writers.toml`**, where it holds an entry for the resolved username.
2. **`~/.config/waytide/user`**, where that file's `username` is the resolved username.
3. **The username itself**, verbatim.
4. The project's entry wins, and that is the whole hierarchy. It overrides the display name and no other value.
5. The user file's display name applies only to the user file's username.
6. If `JOURNAL_WRITER` or `.current-user` resolves a different writer, the user file's display name does not apply.
7. That writer's name then comes from `writers.toml`, or from their username.

## Per-project registry

1. Each project is its own space of writers. It may commit a `writers.toml` giving display names.
2. The file lives at `waytide/local/journal/writers.toml`, beside the journal's per-writer directories.
3. It records a display name and nothing else.
4. It refuses nobody, selects nobody, and declares no identity.
5. It may omit the active writer.
6. Write an entry only where the project needs a name different from the user file's.
7. The file is optional. A project without one works.
8. Without the file, each writer shows as their user file's name, or as their username.
9. The shape is one TOML table per username, with the username as the table header.
10. TOML's refusal of a duplicate table is the only check the file gets. Nothing else validates it.

```toml
# The writers this project shows under a name their own
# ~/.config/waytide/user does not give. A writer absent from this
# file shows as that name, or as their username.

[scott-bellware]
display-name = "Scott Bellware"

[jane-doe]
display-name = "Jane Doe"
```

11. A writer's table may carry that writer's own settings in further keys.
12. The contract reads `display-name` and ignores every other key.
13. Nothing refuses an unknown username. A mistyped `JOURNAL_WRITER` resolves to a nonexistent writer.
14. A journal directory is then created for that writer, not refused.
15. The fourth level still fails loudly where no username resolves at all.

# Where an entry carries no time, ask for one through the selection interface

Source: system/journal/source/where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface.md

1. When creating a journal entry where the writer has not given a **time**, ask them through the selection interface.
2. Do not choose a default time.
3. Do not invent or guess a placeholder time.
4. A date does not settle the time. *Yesterday*, *today*, *last Tuesday*, and an explicit date each fix only the day.
5. The ask fires for each of those date references.
6. The answer decides only whether the entry carries a time and what it is.
7. Settle the date before the ask, by the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule's dating default.
8. Where the writer referred to a day, the entry takes that day. Where they referred to none, it takes today.
9. The ask does not revisit the date. Do not put the date to the writer.
10. This rule governs the time alone.

## The ask carries these options

1. **No time.** The filename drops the `T HH-MM` block and becomes `YYYY-MM-DD-<name>.md`.
2. Under **No time**, the datetime line drops the `at HH:MM` and reads `Ddd Mon D YYYY`.
3. **Now**, with the current time in the label, as in `Now (2:01 PM)`.
4. Under **Now**, the filename takes the `YYYY-MM-DDTHH-MM` prefix.
5. Under **Now**, the datetime line reads `Ddd Mon D YYYY at HH:MM`.
6. **Enter the time.** The writer gives the value.
7. A value stated to the second takes the `YYYY-MM-DDTHH-MM-SS` prefix.
8. Every other entered value stops at the minute.
9. **Explain**, per the foundation package's present-every-prompt-to-the-engineer-through-the-selection-ui rule.

## Applying the answer

1. Offer **Now** only for an entry about today.
2. For a back-dated entry, offer only **No time**, **Enter the time**, and **Explain**.
3. Hold **Now** to the minute. Drop the clock's seconds value from the stamp.
4. Write seconds in a filename only where the writer stated seconds. No answer produces a resolution the writer did not give.
5. **Enter the time** is an answer within the question, not an agent-supplied free-text option. Offering it does not break the present-every-prompt rule.
6. The harness's own free-text option remains for anything else.
7. A date-only entry sorts to the start of its day, matching the filename sort where `-` precedes `T`.
8. Name the file and write the datetime line to match the answer.

# Where an entry's body says the same thing as its title, keep the title alone

Source: system/journal/source/where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone.md

1. Where a journal entry's body would be identical or nearly identical to its `# <title>`, omit the body.
2. The entry is then the title heading, the datetime line, and a `**Tags:**` line where it has one. The datetime line stays, whatever else is dropped.
3. No prose repeats what the title already says. Omit the `**Summary:**` line where it would duplicate the body, as the journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule directs.
4. After drafting an entry, compare the title and the body.
5. Where the body adds no fact, no detail, and no framing beyond the title, drop the body and keep the title.
