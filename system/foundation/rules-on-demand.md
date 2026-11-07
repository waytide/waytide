# A bare /slasher offers topics to learn about

Source: system/foundation/source/a-bare-slasher-offers-topics-to-learn-about.md

Trigger: When the engineer types a bare `/slasher`, with nothing after it

1. A bare `/slasher` offers topics to learn about, through the selection interface: *Items*, *Features*, *Experiments*, and *Commands*. The free-text option takes any other topic.
2. Explain a topic selected or typed briefly, as *Briefly explain <topic>* would. Lead with the point, and keep it short.
3. For *Commands*, print the command domain table word for word, and nothing else.
4. Offer no other topics.

# A command takes its subcommand first, asks when it has none, and its domain takes help

Source: system/foundation/source/a-command-takes-its-subcommand-first-asks-when-it-has-none-and-its-domain-takes-help.md

Trigger: When running or writing a Slasher slash command

1. A Slasher command is typed `/<command> [<subcommand>] [<arguments>]`. The first word after the name is the subcommand, and the rest are its arguments, as in `/item list current`. Every command reads its words this way.
2. With no subcommand, the command asks which one is meant, through the selection interface, unless its help gives the bare command a meaning of its own, as a bare `/journal` writes an entry.
3. Where a command has more than four subcommands, the question groups them, and asks again within the group selected.
4. An alias does exactly what the command it names does, as `/idea` does `/item idea`. Its arguments pass to that command unchanged.
5. Each command domain, a group of root commands under one heading in the Slasher help, has one help command, which prints the domain's part of the help text. It is the domain's own root command where it has one, as `/log help`, and otherwise a command that takes only `help`, as `/process help`.
6. Any other command in the domain takes no `help`. `/next help` says so, names `/process help`, and does nothing more.
7. A subcommand that is not the command's own is not guessed at. The command says so, and asks which one is meant, through the selection interface. Where the command's help gives it words of its own, as `/log <message>` does, a first word that is not a subcommand starts those words. `/log The cart keeps its contents for 30 days` writes that entry, and `/log summary` still summarizes.
8. A command's skill only reads the words typed, and hands the act to the rule that governs it. That rule says what the act is. This rule does not, and governs only how a command is typed and how its words are read.
9. `help` is always the subcommand, never an argument. `/reserve help` does not reserve the word "help".

# A date in a record's title is written as the day, the date, and the 24-hour time

Source: system/foundation/source/a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time.md

Trigger: When writing a date into a working-state record's title

1. A working-state record's title may carry a date, as the work session record's `# Work Session — <name> (<date>)` does.
2. In any record whose title is dated, write the date in this form:

```
Mon Jan 1 2026 18:06
```

3. The order is day-of-week, month, day, year, then 24-hour hours and minutes.
4. Do not write `at`, AM/PM, or seconds.
5. Do not add a timezone abbreviation or any other timezone marker.
6. The time is the author's local time.
7. The date is the record's authoring time. It is the same instant as its ISO-8601-UTC filename prefix, rendered in local time.
8. For a record covering work over more than one day, the title still names the single moment the record was written.
9. Do not write a date range.
10. Render the date with the command `date "+%a %b %-d %Y %H:%M"`.
11. This title form is distinct from the other two record date formats. Each format is used only where it is specified.
12. The filename prefix stays machine-sortable UTC to the second, such as `2026-07-24T18-16-22Z-…`, per the file-names rule.
13. The provenance footer stays local time to the second with a zone abbreviation, such as `Fri Jul 24 2026 at 11:58:56 AM PT`, per the record-a-rules-authorship-in-a-provenance-footer rule.
14. The title is the one exception to the a-time-value-carries-minutes-and-seconds rule. Every other datetime written into a file carries seconds.
15. The exception is narrow and covers only the title's date.

# A design section documenting a package dependency is titled "Package Dependency"

Source: system/foundation/source/a-design-section-documenting-a-package-dependency-is-titled-package-dependency.md

Trigger: When writing a section of a [design] item that documents a dependency on a package

1. A design is an item tagged `[design]`.
2. A design may have a section documenting a dependency on a package.
3. A package means a gem, a library, or another installable package.
4. Title that section **Package Dependency**.
5. Do not title it just "Dependency".
6. Use plain "Dependency" only for sections about something other than a package.

# A log entry is written for an implementation record, and the concluding entry depends on whether the work merged

Source: system/foundation/source/a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged.md

Trigger: When creating an implementation record, or changing its **State:** line

## An implementation record takes a log entry

1. An implementation record pairs with a one-line entry in `slasher/local/logs/log/`.
2. Write the entry when the record is created.
3. Write another entry on each change of the canonical `**State:**` line.

## The concluding entry depends on whether the work reached `master`

1. The concluding entry takes one of two forms. Which one is not a matter of taste.
2. The form is decided by whether the work merged.
3. Merged work means affirmed work merged into its upstream branch, or completed work integrated, whatever the kind.
4. For merged work, the entry is a summary marker. It names the record and its state, and stops there.
5. Unmerged work means refuted, inconclusive, abandoned, or superseded work, whatever the kind. That work is never merged, and its branch is deleted only on confirmation. Its record is kept, marked with its state, as evidence.
6. For unmerged work, the entry states the question or the intent, and the verdict or the outcome. It carries the finding, and only where there is one.
7. For unmerged work that reached a verdict, the entry states the question or the intent, the verdict, and what was found.
8. For abandoned work, the entry states the intent, that it was abandoned, and the reasoning given for stopping.
9. An abandoned-work entry does not reproduce the plan, the increments, or the design the work produced. A careful tense is not enough (see the the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done rule).
10. The entry carries the substance whenever the branch did not merge, whether or not the record reached `master` by another route.
11. Do not rely on the practice of committing the record to `master` while the work is on a branch.
12. Write the findings, and for abandoned work the reasoning given for stopping, into the entry, so that `master` holds them without the record.

## What is already required, and not restated

1. Affirmed work still copies its own log into the project's log, as an-implementation-runs-on-a-branch-to-a-declared-end rule requires.
2. The summary marker sits beside those copied entries. It does not replace them.
3. Work without a verdict has no affirmation and no log copy. Completed work's marker is the whole of what its conclusion writes.

## What is not logged

1. Write no log entry for a confirmation the lifecycle records.
2. Those confirmations are the working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion. They are recorded in the record.
3. Write no log entry for a turn of the work.
4. The hinges, the cycles, and the runs belong to the loop record and the implementation record.

# A log entry is written for an item on creation, on each settled resolution, and on a change of state

Source: system/foundation/source/a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state.md

Trigger: When creating an item, adding a dated Settled resolution to it, changing its **State:** line, or closing a work session with a reconciliation

1. An item in `slasher/local/items/` pairs with a one-line entry in `slasher/local/logs/log/`.
2. Write the entry at three moments, and at no others.
3. The item's kind tag, such as `[design]`, `[plan]`, or `[aspiration]`, makes no difference, and an item with no kind tag takes the same entries.
4. Write the entry on the item's creation.
5. Write the entry on each dated `Settled` resolution added after the item is created.
6. Write the entry on each change of the item's `**State:**` line.
7. A change of state is the line reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Obsolete, or Done for a work item.
8. A change of state is also the line taking back Realized, Deferred, Open, or a work item's Done.
9. An observation is `Recorded` and never moves, so it takes a creation entry only.
10. Do not log a completed checkbox task, because it carries out a direction already settled.
11. Do not log prose that settles nothing either. Examples are reconciling a Background & Motivation section, correcting a summary, and rewording a section.
12. The provenance footer records those unlogged changes.
13. Log one reconciliation, though nothing changed: a reconciliation at a work session's close that finds the direction still standing.
14. Name what that reconciliation was read against, as in `The aspirations stand against …`.
15. Log it because nothing in the artifacts records that it happened.
16. The entry names the record and what happened to it: the record was written, or its state reached a word.
17. What the record settles may follow, attributed to the record.
18. Never state an unbuilt direction in the indicative mood.
19. *The check runs at the engineer's first prompt* says the system does that. While the item is `Open` or `Active`, it does not.
20. The `git` package's commit-message rules ask for the changed thing in its new state. That form is right for a change to the software.
21. An item is not a change to the software, so do not use that form for it.
22. The fact about an item is that it was recorded, or that its state moved.
23. Carry the same into the commit subject the entry travels in: name the record, attribute what it settles to the record, and keep the mood. An entry corrected while its commit subject makes the same claim is half corrected.
24. Fix no wording template. *X is recorded as an item, Open because …* and *X is realized* are forms in use.
25. This rule states the obligation once, for every item.
26. The an-observation-is-a-working-hypothesis-whose-one-state-recorded-never-changes rule, the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule, and the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule state their own entries.
27. The the-items-directory-holds-one-file-per-item rule points here and keeps no second copy.
28. The the-log-holds-one-file-per-entry-with-a-one-line-title rule's general trigger is to log whenever a real decision is made, and when in doubt. It rests on each writer's judgment, so it does not make the entries reliable.

# A log entry recording an engineer's decision is tagged `[decision]`

Source: system/foundation/source/a-log-entry-recording-an-engineers-decision-is-tagged-decision.md

Trigger: When writing a log entry that records a decision

1. When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`.
2. The tag says who decided. Every log entry states a decision, so the tag marks the engineer's.
3. An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work.
4. The engineer's decision is the engineer's own choice. It may be stated in the engineer's words.
5. It may also be made by choosing among options the agent puts forward.
6. An act the agent takes under a rule is not an engineer's decision, even when the engineer approved it.
7. Do not tag an entry for an act the agent took under a rule. Do not tag such an entry `[decision]`.

## The tag

1. The entry carries the tag under its title, separated by a blank line.
2. The tag uses the one form every record uses:

```
# The README item settles that the README's content is addressed with Slasher's website, and waits for it

**Tags:** [decision]
```

3. An entry may carry other tags beside this one.
4. An engineer's decision to stop doing something is tagged `[decision] [suspended]`.
5. What `[decision]` marks is fixed here.
6. The set of the engineer's decisions is read from this tag.

# When an implementation's phase starts, its goal is stated, and the phases are listed with the current one marked

Source: system/foundation/source/a-phase-starts-by-stating-its-goal.md

Trigger: When starting a phase of an experiment or a feature, or when the engineer asks for the current phase or the list of phases, as with `/experiment status` or `/feature status`

1. At the start of an experiment's or a feature's phase, state the phase's goal to the engineer, before its work, in the response that starts it.
2. The goal is the phase's question or intent, whichever it has, whatever the kind. For a question, it is what the phase is to establish. For an intent, it is what the phase is to build. Say how it serves the implementation's question or intent.
3. List the implementation's phases with it, in the order the record names them, and mark the current phase, so the engineer sees which phases are done and which are still to come.
4. State the goal and the list at each phase's start, not only when the record is written. The record's naming of the phases, and a phase's forecast, do not stand in for them.
5. When the engineer asks for the current phase, as with `/phase` or `/phase current`, print its goal and its branch.
6. When the engineer asks for the phases, as with `/phases`, list them in the record's order, with the current phase emphasized.
7. `/experiment status` and `/feature status` print the phases in the record's order, the current one emphasized, and the current phase's goal. Without phases, they print the implementation's question or intent, and its state.

# A printed list of records is formatted as a table or as a list of rows

Source: system/foundation/source/a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows.md

Trigger: When the engineer asks for a list of records, as with `/item list`, `/list`, or `/report`

1. When the engineer asks for a list of records, render it as a table where every field is short, and as rows where a field runs to a sentence. A table presents the fields in headed columns. Rows present one record to a line, with its fields in sequence and no columns. A list is called a table only where it is formatted as columns.
2. This applies to any record type. That includes items, implementation records, log entries, loop records, work session records, migration records, journal entries, and commits.
3. The first column is the record's handle and has no heading.
4. The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit.
5. Every column after the handle has a heading.
6. Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it. A list of items takes no SHA columns, and opens with an ordinal ahead of the handle, which the engineer refers to a row by. The ordinal counts from 1, in the order the rows are printed.
7. These two SHA columns are always present, in every list but a list of items or a list of commits. They are not chosen per request.
8. After the SHA columns comes the title. Then comes one column for the fact asked about.

```
|                        | created   | changed   | implementation                   | state     |
|------------------------|-----------|-----------|----------------------------------|-----------|
| `2026-08-25T00-36-18Z` | `159985b` | `ed7ec4a` | Feature — Self-Explanation       | Abandoned |
| `2026-10-21T05-44-56Z` | `d27a638` | `66d2ea2` | Feature — "Item" replaces "idea" | Completed |
```

A list of items takes the ordinal and no SHA columns:

```
| # |                        | item                        | state  |
|---|------------------------|-----------------------------|--------|
| 1 | `2026-08-10T20-54-51Z` | A Generalized Description   | Active |
| 2 | `2026-08-23T06-58-41Z` | Slasher for content and web | Open   |
```

9. A record that was never amended shows the same SHA in both columns. This is intended, since it shows the record has not been touched since it was written.
10. Choose the last column to fit the question.
11. A list of items or implementations takes the state as its last column.
12. A list of commits asked about for their subject widths takes the width.
13. Do not add a column nobody asked for.
14. A list of commits takes no SHA columns.

## Listing items by state

1. A list of items may be asked for by state, and lists the items whose `**State:**` line reads that state.
2. `current` asks for the Open and Active items together. It is not a state, and it leaves out Suspended items.

## The report command

1. `/report` lists the current items, then, under a heading of their own, the current implementations.
2. The current implementations are the features and experiments whose `**State:**` line reads Active or Suspended.
3. Present each current implementation as one row: its handle, its title, and its state. The title is the record's own, as in `Feature — The current command`. Give it no ordinal and no SHA columns.
4. Where no implementation is current, print the one line *No current feature or experiment.* under the summary's heading, in place of the rows.
5. In the items table `/report` prints, put a kind column between the title and the state. It names the kind each tag gives as a word, not a tag: *Idea* for `[idea]`, *Legal matter* for `[legal-matter]`. Several tags are named each, separated by commas. Other lists of items take no kind column unless it is asked for.
6. `/report` takes an optional number *n*, as in `/report 5`. It then lists only the *n* most recently created current items, by handle, oldest first, with ordinals from 1. It lists the current implementations in full.

## Keep every column short

1. Keep every column short.
2. Do not put a field that runs to a sentence in a table. Present rows instead, unless the engineer asks for a table, which is then rendered in rows and columns.
3. Where a record's summary is wanted, present rows instead of a table. This is part of the rule, not a failure of it.

## What this does not reach

1. This rule does not reach the status report's tables. They stay tables, under the a-status-report-prints-a-fixed-whole-project-report rule.
2. This rule does not govern an answer that is not a list of records.
3. The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs only how a set of records is presented.

# A record carrying a state line ends its filename with the state in upper case

Source: system/foundation/source/a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case.md

Trigger: When creating, renaming, changing the state of, or referencing an item or implementation record

1. Where a record carries a canonical `**State:**` line, its filename ends with that state word in upper case.
2. The state word is appended to the name with a dash, before the extension.

```
2026-07-27T07-09-02Z-the-feature-capability-REALIZED.md
2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md
2026-08-06T04-32-50Z-ooda-mode-COMPLETED.md
```

3. This reaches every record that carries a state line: an implementation record, whether experiment or feature, and an item.
4. Each convention fixes its own state words. This rule fixes only where the word is rendered.
5. Every item and every implementation record carries a suffix. Each carries a state line from the moment it is written, and the in-progress state of each is **Active**.
6. A name with no suffix is a defect.
7. An observation's suffix is always `-RECORDED`.
8. The file's contents are unchanged. Add no suffix to any file's contents.
9. The state inside the file is the `**State:**` line and nothing else.
10. The file still ends with its provenance footer.

## Upper case, and the exception it takes

1. The suffix is the stated exception to the file-names rule's dash-separated, lower-case name.
2. The upper case marks the state as not part of the record's subject. `…-ooda-terminology-REFUTED.md`, not `…-ooda-terminology-refuted.md`.
3. The dash is the ordinary separator. Nothing else about the name changes.
4. The ISO-8601-UTC prefix is untouched, so the directory still sorts chronologically.

## The `**State:**` line stays the only authoritative statement

1. The name is derived from the line. It changes only when the line changes.
2. Where name and line disagree, the line is right and the name is stale.
3. A state change renames the file, using `git mv`.
4. When a reversible word is taken back, rename the file to the state the record returns to, **ACTIVE** or **OPEN**.
5. The reversible words are **Realized**, **Deferred**, **Open**, and a work item's **Done**, as the the-items-directory-holds-one-file-per-item rule sets out.
6. A reference to a record omits its state suffix and extension, and keeps the prefix and name. A rename then breaks no reference.
7. A reader finds the record by that prefix and name.
8. Leave historical records as written.

# A record may be tagged with square-bracket tags

Source: system/foundation/source/a-record-may-be-categorized-with-square-bracket-tags.md

Trigger: When adding a tag to a record or a list item

1. Any record may carry tags, such as `[idea]`.
2. Put them on a `**Tags:**` line at the head of the record, after `**State:**` where there is one: `**Tags:** [idea] [decision]`.
3. To tag one list item, prefix it: `- [idea] My idea`.
4. Write a tag lower-case in square brackets, with dashes between words: `[legal-matter]`.
5. Tags are optional and freeform. Add one when it is useful.
6. Nothing checks tags, and there is no fixed list.
7. Some tags have lifecycle states, such as `[experiment]`, `[feature]`, `[observation]`, and `[work]`. Each one's own rule states its states.

# A rule's compressed text is written in its source, checked against it, and its figures recorded below the body

Source: system/foundation/source/a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body.md

Trigger: When editing a source rule's body, or writing, revising, or checking a rule's compressed text

1. A source rule may carry a compressed text: the rule restated with the same effect and outcome, in fewer words.
2. Write it in a `## Compressed` section below the body. It shares the source's title and `Related:` list.
3. The body stays the authority. Never edit the compressed text apart from it.

## The compressed text

1. Write the compressed text as numbered lists. Each point is one or two short sentences, carrying one directive.
2. Headings within the section group the points, and each group's list numbers from 1.
3. Carry no reasons. They stay in the body. Where a reason constrains what is done, state that constraint as a directive.
4. Keep a fenced example the directives depend on.
5. A change to the body reaches the compressed text in the same commit.
6. A point keeps its number where it can, so a check's verdicts and a reader's references still find it.
7. `./compile.sh` writes each package's `rules-pre-loaded.md`, at the package root, holding every rule in its `source/`: each rule's title, a `Source:` line with its source path, and its compressed text, or its body where it has none.
8. The rules file carries no `## Compressed` heading, no figures, no `## History` section, no `Related:` list, and no provenance footer.

## The check

1. A compressed text stands only after it is checked against its source. The check has two parts, each done by its own fresh agent that has not seen the compression.
2. A lister lists the source's directives from its body, without the Compressed section, the Compression section, and the footer.
3. A checker judges each directive against the title, the compressed text, and the `Related:` list, as kept, less precise, or lost.
4. Repair a lost directive, and a materially less precise one, with the smallest clause that closes the gap. Check the repaired rule again in full.
5. Where two checkers disagree on a directive, the source decides.
6. Record a less precise directive left as it is, and why.
7. Check a compressed text again after any change to it, except a swap of one term for another the engineer settled.

## The figures

1. Record each compression, revision, and check of a compressed text in its source, in a `## Compression` section below the Compressed section.
2. One line records each event. A later event adds a line, and the earlier lines stay as written.
3. A line gives the date, the event, and its figures.
4. A **compressed** line gives the size rank, the clarity score, and the solubility before and after, the change, the compression, and the directive counts: how many, and how many kept, less precise, and lost.
5. A **revised** line gives the size rank, the clarity score, and the solubility before and after, and the directive counts of the check that followed.
6. A **re-checked** line gives the directive counts and the number of repairs.
7. Name restorations, where a compression put back text it had dropped, on the line of the event that made them.
8. Leave out a figure that was not measured. Do not estimate it.
9. Size rank is the rule's rank by characters among the compiled rules, from 0 for the smallest to 1 for the largest.
10. Clarity score is 1 − unclarity. Unclarity is the mean of six ranks among the compiled rules: average sentence length, share of sentences over 25 words, and history words, asides, citations, and negations per sentence.
11. Solubility is (1 − the mean of the size rank and the unclarity) × 100, as a whole number. Higher is easier to process.
12. Change is the share of the body's words removed, added, or replaced, from a word-level comparison of the body and the compressed text.
13. Compression is the share of the body's characters the compressed text removes.
14. Rank each rule among the compiled rules as they stood at one fixed point in time, commit `770c7eb`, so figures measured at different times compare. The rule-reduction experiment's record, `2026-10-22T04-51-25Z-rule-reduction`, sets out each measure.
15. The process that compresses, revises, or checks the text writes the figures, in the same commit.
16. The package's rules file carries no figures. They stay in the source.

# A suspension is a log entry tagged `[suspended]`, and nothing is moved

Source: system/foundation/source/a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved.md

Trigger: When removing a rule, procedure, or report

1. When the project stops doing something, log it and tag the entry `[suspended]`. That is the whole act.
2. Nothing moves to any directory. Nothing is kept beside the entry, and no copy is kept anywhere.
3. Anything the project *did* can be suspended: a rule that became ceremony, a procedure nobody runs, a report nobody reads, a step that costs more than it is worth. Only what the project did is suspended this way.
4. Something the project only wanted is not suspended this way.
5. An item set aside takes `**State:** Suspended` and stays where it is. That is a different act with a different record.
6. Do not tag an item's log entry `[suspended]`.
7. When something the project does is no longer justified, remove it.

## What the entry carries

1. Like every log entry, the title states what was suspended and why.
2. The why gives what it cost and what it stopped buying.
3. Reconcile whatever cites the removed thing. The entry names, in its own clause, what else changed.
4. For example, removing a rule means dropping it from the package README's summary.
5. The suspended thing's file is removed in the same commit as the entry.
6. Git holds the removed text, reachable by path from `master`'s history.

## The tag

1. The entry carries `**Tags:** [suspended]` under its title, separated by a blank line:

```
# The no-stored-recap rule is suspended, its one sentence folded into the log convention

**Tags:** [suspended]
```

2. This is the one form every record uses, per the a-record-may-be-categorized-with-square-bracket-tags rule. A log entry's tags sit where an item's and an implementation record's do.
3. A log entry may carry other tags beside this one.
4. What `[suspended]` marks is fixed here.
5. The set of suspensions is read from this tag.

# A vocabulary entry says what a term means, not what it was or where to read more

Source: system/foundation/source/a-vocabulary-entry-says-what-a-term-means-not-what-it-was-or-where-to-read-more.md

Trigger: When writing or revising an entry in a vocabulary.md file

1. A vocabulary entry states the term's current meaning and stops there.
2. Write the entry in the present tense, saying what the term means now.
3. Give any distinction against a neighbouring term.
4. An entry records no lifecycle history.
5. Do not record what the term used to name, or what directory it used to sit in.
6. Do not record when the term changed, or what governed it before.
7. When a term changes meaning, moves, or stops being used, write the change in the log, per the the-log-holds-one-file-per-entry-with-a-one-line-title rule.
8. Leave the entry saying only what is true now.
9. An entry carries no pointers.
10. Do not write *Its rule is …* or *see the … rule*. Name no rule the reader should go and read.
11. Send the reader to no other vocabulary, and to no section elsewhere in the file.

## What is not lifecycle history

1. The reason a substitution exists is part of the entry. Say why a substitution substitutes.
2. Example: *`log` is taken by the project's log, and `personal journal` needs a qualifier to hold the two apart*.
3. The STE note stays whole: what the STE dictionary says, the reserved category, and the reservation mechanism its note names.
4. The STE note's own citation is part of the note, not a pointer.
5. A distinction against a neighbouring term stays, and is not a pointer even when it names the neighbour.
6. The test is the tense. A clause carrying a date, an *until*, a *was*, or a *no longer* records a change, and belongs in the log.

## Where the history goes

1. History goes to the log.
2. A discontinuation is not an exception.
3. A discontinuation's entry names the word and says it is not used.
4. It does not narrate when the word was dropped or what carried it before.

# A vocabulary file holds terms, substitutions, and discontinuations, and each word is approved or reserved

Source: system/foundation/source/a-vocabulary-file-holds-terms-substitutions-and-discontinuations-and-each-word-is-approved-or-reserved.md

Trigger: When writing, revising, or creating a `vocabulary.md` file

1. This rule governs writing a vocabulary. The a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule governs using one.
2. Give a package a vocabulary only when its domain has specialized words.
3. A package whose subject is written in ordinary words has no vocabulary. The absence is correct, not missing.
4. `git` and `ext/ruby-lang` have none. Six packages do.
5. Put a term in the vocabulary of the package whose domain it belongs to.
6. Put a domain-less term or substitution in `language`. Put a domain-specific substitution in its own package's vocabulary.

## What a vocabulary holds

1. **Terms** are the concepts the package defines, such as `solubility`, `efferent`, `hinge`, `precondition`.
2. A term is a glossary entry, and it says what the concept is.
3. **Substitutions** name a word not to write, and the word to write instead. Examples: `conform` rather than "sweep", `verified` rather than "green".
4. **Discontinuations** name a word removed from use with nothing in its place, because the concept went, as `discriminator` did.
5. A substitution names two words. A discontinuation names one.
6. Keep substitutions and discontinuations under separate headings. Do not file one under the other's heading.
7. A word Slasher did not coin is still a term where the vocabulary says what it means, and is entered as one. Examples: `load-bearing`, `cradle`, `preserve`.
8. Where a word was taken rather than coined, the entry says so in its own prose.
9. That statement is an **origin**, not a kind of entry.

## Every word in a vocabulary is approved or reserved

1. Every word in a vocabulary is approved or reserved. This holds for its terms and for the Use column of its substitutions.
2. An approved word is approved in the STE dictionary and used with its approved meaning. Nothing further is required.
3. A reserved word is a technical noun or verb in a category its entry names: under STE Rule 1.5 for a noun the dictionary omits, STE Rule 1.6 for a noun it lists and refuses, STE Rule 1.12 for a verb, or an ETE category under the ete-declares-its-own-categories rule. The vocabulary that holds it is the approval STE Rule 1.8 requires.
4. A reserved word's entry states what the STE dictionary says about it: absent, refused with an alternative, or approved with a meaning Slasher does not use. The last is governed by the ete-fixes-the-meaning-of-a-word-in-its-category rule.
5. Reserve a word by the sequence the a-word-is-reserved-in-six-steps rule gives, in the `language` package's `ete/` directory.
6. A definition with no STE note reserves a term absent from the dictionary. A substitution's Use word with no STE note is ordinary vocabulary, which is not reserved and not rewritten.
7. One line at a vocabulary's head says that every word in it is approved or reserved, and cites this rule. The vocabulary does not repeat the rule.

## A project's own vocabulary is `slasher/local/vocabulary.md`

1. It is one file, beside `rules/`, holding the terms and substitutions a project settles for itself.
2. It has the same shape as a package's `vocabulary.md`.
3. It takes no datetime prefix. It is a structural file, not a dated decision. See the file-names rule.
4. It is read at session start and binds, as the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule says. That is why it sits beside `rules/`, not in a working directory.
5. It is optional, and its absence is not a defect.
6. Write no such file until there is a term to write.
7. It is not a rule. Do not put it in `rules/`.

## Saying how an entry relates to a general term

1. Where a package narrows a term, its entry names the general term it narrows.
2. Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason.
3. A reader must not have to work out which case an entry is. The entry says whether it narrows or replaces the general term.

# An implementation runs on a branch to a declared end

Source: system/foundation/source/an-implementation-runs-on-a-branch-to-a-declared-end.md

Trigger: When starting, adding a worktree to, suspending, or concluding an experiment or feature implementation

1. An implementation runs on its own branch, designed through the five hinges by DBE, to a declared state.
2. It is never left silently open.
3. Whether the work reaches a verdict decides the parts that differ. The tag names the record and the branch, and decides nothing else.
4. Either kind opens with a question or an intent, and whether it reaches a verdict is chosen at the start (see the the-implementations-directory-holds-one-record-per-implementation rule).
5. A clause below names work with or without a verdict only because of that difference. Every other clause holds for both.

## The branch

1. Name it `experiment/<subject>` or `feature/<subject>`, matching the tag.
2. The subject is short, lower-case, and dash-separated, and names literally what is tested or built.
3. Add `-run-<n>` only where the work has more than one run.
4. With a worktree, the name carries `worktree/`: `experiment/worktree/<subject>`, `feature/worktree/<subject>`.
5. A branch checked out in a worktree cannot be checked out in the main working tree, and `git branch` is where that question comes up.
6. Adding a worktree to work under way renames the branch.
7. The rename is confirmed, and the record carries it.
8. Keep the upstream branch out of the name, since a branch can outlive its upstream target. The record names it.
9. A worktree is the one fact the name carries, because `git branch` has no other answer for it.
10. The rename keeps that fact current.
11. Record the branch, its upstream, and its base. Record the base as its commit SHA and the ref it came from.
12. Make no git tag for the base.
13. A later run branches from the recorded commit.

## Phases

1. An experiment or a feature may run in phases. Each phase is a question or an intent that serves the implementation's.
2. The record names the phases and their order at the start.
3. Whether a phase reaches a verdict is chosen for that phase when it is added, whatever its implementation chose. A phase that reaches a verdict states its forecast before its work. One without states none.
4. A phase's branch is the implementation's branch, a dot, and the phase's name: `experiment/rule-reduction.flattening`, `feature/worktree/skills.slash-commands`.
5. Git refuses a slash here, because no branch can sit beneath another branch's name.
6. A `worktree/` segment carries into each phase's name.
7. A phase branches from the implementation's branch and concludes into it.
8. Where the phase reaches a verdict, it is affirmed, refuted, or inconclusive only on the engineer's declaration.
9. An affirmed phase merges back into the implementation's branch.
10. The record carries each phase's verdict and findings.
11. Where the phase reaches no verdict, it concludes Completed, with no verdict, and merges back into the implementation's branch.
12. One phase runs at a time, in the record's order, each from the implementation's branch as the earlier phases left it.
13. A phase merges nowhere else.
14. The implementation concludes after its phases, and only then merges to its upstream branch.

## The working location

1. Put the working location through the selection interface at every start, with no default.
2. Each option states what it creates:

> **Branch only** — Create the branch and switch this working tree to it. At the conclusion this
> working tree switches back.
>
> **Branch and worktree** — Create the branch as `<kind>/worktree/<subject>` and check it out in a
> new worktree: a second working directory at `<path>`. This working tree stays on
> `<upstream branch>`.
>
> **The current branch** — Build it where the working tree already is, creating nothing. There is
> no branch to switch back to and nothing to merge.

3. Offer the current branch only to work without a verdict, whatever the kind.
4. The changes of work that reaches a verdict must not reach the branch it deviates from before it is affirmed, and its own branch is what keeps them out.
5. Work without a verdict is the main line.
6. Offer the current branch last, because a first option reads as recommended, and the current branch gives up isolation.
7. The current branch's cost: there is no isolation, partial work sits where others read, and abandoning means reverting rather than deleting a branch.
8. On the current branch, the record still carries the intent, the state, and the confirmations.
9. Place a worktree beside the repository directory, named `<repository-name>-<branch, each slash as a dash>`, as in `slasher-experiment-state-suffix-legibility`.
10. A worktree inside the repository would show as untracked content in the work's own `git status`.
11. Create a branch-only implementation with `git switch -c <branch>`, and a worktree implementation with `git worktree add -b <branch> <path>`, where `-b` is required.
12. Use `git worktree add <path> <branch>` only to add a worktree to work under way, since it fails on a branch that does not exist.
13. Change the location only by adding a worktree.
14. Add one only on one of two triggers: other work arrives that the engineer means to work alongside.
15. Or the work is escalated, needing more isolation than it was taken for.
16. Confirm the addition.
17. Add a line to the record, and keep the original.
18. The conclusion follows the location as it then stands.
19. Never collapse a worktree back.

## Participation

1. Put attended or unattended through the selection interface beside the working location.
2. Attended is the default.
3. The design-by-efferent attended-or-unattended-is-chosen-when-the-work-is-started rule states why the two sit at one gate, and what changes between them.
4. Record both choices.

## The verdict

1. Put whether the work reaches a verdict through the selection interface at the start, beside the working location and the participation, and record it as a confirmation.
2. Work that reaches a verdict forecasts before its work and ends Affirmed, Refuted, or Inconclusive.
3. Work without a verdict ends Completed.
4. The selection follows neither the kind nor whether the work opens with a question or an intent.
5. Its two options read, in these words: *Conclude with an engineer's verdict* and *Conclude without an engineer's verdict*.

## The end

1. Every implementation ends in a declared state, or is suspended, which pauses it.
2. The words are the the-implementations-directory-holds-one-record-per-implementation rule's.
3. Work that reaches a verdict is affirmed only on the engineer's explicit declaration.
4. On affirmation, its log is copied into the project log.
5. Where it produced implementation, its branch merges to the upstream branch, after the tests pass.
6. Where no test covers the work, the merge also waits for specific confirmation.
7. Observation-only work's affirmation is the log copy alone.
8. Work that reaches a verdict and will merge brings what master needs to conform to it: every rule its practice needs, and every other change, on its branch before it merges.
9. Work without a verdict merges with no gate, because every commit was verified under the run-the-test-suite-after-changes-before-considering-whether-to-commit rule.
10. The merged result can still break the suite, and that is fixed from there.
11. Work without a verdict has no affirmation.
12. Refuted, inconclusive, abandoned, and superseded work keeps its record, marked with its state, so the attempt and its findings survive.
13. Refuted, inconclusive, abandoned, and superseded work does not merge.
14. Supersession runs through suspension.
15. The superseded implementation stays Suspended, its branch kept, until the engineer concludes it as superseded.
16. The two records name each other.
17. A child supersedes its parent by preserving it.
18. The child merges the parent first, taking every commit the parent made after the child branched.
19. The parent is then parked Superseded, and the records name each other.
20. The child takes the parent's upstream.
21. The parent branch is deleted only on confirmation.
22. This is the one supersession that merges the superseded branch.
23. Conclude in the main working tree, on the upstream branch.
24. Under branch only, the working tree switches back.
25. Under a worktree, end the session in the main working tree, never in the removed directory.
26. On the current branch there is nothing to return from.
27. Branch deletion takes one confirmation from the engineer, through the selection interface. It covers the worktree removal too. Do not prompt twice.
28. Remove the worktree first, since git refuses to delete a branch checked out in a worktree.
29. Suspension deletes no branch and removes no worktree.

## The agent never raises the end of work that reaches a verdict

1. Do not offer to conclude, affirm, refute, or merge one: not as a next step, an option, or a precondition.
2. Report what is settled and what is open, and stop.
3. The length of work that reaches a verdict is the engineer's judgment, not readable from the work done.
4. Work without a verdict is not covered, because its completion is ordinary.

## Drift

1. While work that reaches a verdict is open under branch only, watch for main-sequence work starting, and surface it.
2. Offer two recourses through the selection interface: suspend the implementation, where the intent is to stop working it for now, or add a worktree, where the intent is to keep working it alongside.
3. Neither recourse ends the implementation, and the engineer's intent decides.
4. The watch rests on the branch name in the status line and on a judgment of whether the work serves the recorded question or intent.
5. The watch is a practice, not a guarantee.
6. Under a worktree there is nothing to watch. The session-start notice reports every implementation that has not concluded.
7. Work without a verdict has no watch, since starting other work during it is ordinary.

# An item that sequences work contains no code samples

Source: system/foundation/source/an-item-that-sequences-work-contains-no-code-samples.md

Trigger: When writing or revising an item in slasher/local/items/ that sequences work

1. An item in `slasher/local/items/` that sequences work must never contain code samples, whatever its tags name it.
2. Such a plan contains no code blocks.
3. It contains no literal method bodies.
4. It contains no "write this content" snippets.
5. Describe each step's intent and expected outcome in prose only.
6. Avoid over-prescription. Do not commit up front to specific method names, file names, or other implementation details not yet known or decided.
7. State the goal and the behavior only at the altitude that is genuinely settled.
8. Leave the rest open rather than inventing names to fill the plan.
9. This applies when writing a plan and when revising one.
10. At implementation time, generate code only on the user's explicit instruction.
11. Generate it in the increments the user chooses.

# An observation is a working hypothesis whose one state, Recorded, never changes

Source: system/foundation/source/an-observation-is-a-working-hypothesis-whose-one-state-recorded-never-changes.md

Trigger: When recording or revising an observation in slasher/local/items/

Lines 1–6 below are the opening statements, which come before any section heading.

1. `slasher/local/items/` holds working hypotheses, definitions, and methods that are not yet binding.
2. They are rule-candidates surfaced during open-ended discovery, before the thinking has stabilized.
3. They are not read as binding at session start, the way rules are.
4. An observation lives in `slasher/local/items/`.
5. An observation is tagged `[observation]`.
6. The tag is what makes a record an observation.

## `Recorded` is an observation's only state, and it never changes

1. An observation carries `**State:** Recorded` from the moment it is written.
2. It keeps that state for the rest of its life.
3. Its filename ends `-RECORDED`.
4. It carries no `**Why this state:**` line.
5. An observation has no lifecycle.
6. It is never realized, abandoned, obsolete, superseded, or suspended.
7. An observation that no longer holds is not retracted.
8. A later observation states the later thinking.
9. The earlier observation stays as what was thought at the time.
10. An observation is not promoted.
11. Where the thinking stabilizes into a binding convention, write the rule in `slasher/local/rules/` the way any rule is written.
12. Do not change the observation. It takes no line naming the rule.
13. The the-items-directory-holds-one-file-per-item rule needs no exception, because an observation also carries a state from the moment it is written. Its state is fixed, not absent.

## The shape

1. **When to use:** use an observation for material worth keeping that is still under active discovery.
2. Also use one for a method or definition the engineer has not ratified as a convention.
3. When in doubt between a rule and an observation, prefer an observation.
4. **Format:** use the same frontmatter-free markdown as rules.
5. The file starts with a `# <title>`, then a `**State:** Recorded` line.
6. Next comes a `**Tags:**` line carrying `[observation]`, then the content in prose.
7. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
8. The filename ends `-RECORDED`.
9. **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
10. **Recording one:** add the file.
11. Add a matching one-line entry to `slasher/local/logs/log/`.
12. The entry notes that it was recorded as an observation, and why it is not yet a rule.
13. Never change an observation's state.
14. Where the thinking moves, write a later observation and leave the earlier one as written.

# Brainstorming records points as they are said, and organizes them at the end

Source: system/foundation/source/brainstorming-records-points-as-they-are-said-and-organizes-them-at-the-end.md

Trigger: When the engineer begins, ends, suspends, or resumes brainstorming (`/brainstorm`)

1. Brainstorming is the engineer saying points as they occur, in no order, for the agent to organize at the end. `/brainstorm begin`, or a bare `/brainstorm`, starts it, and `/brainstorm end` ends it.
2. Create a collection file at `/brainstorm begin`, under `~/.local/share/slasher/collections/<project>/`, outside the repository, where `<project>` is the name of the project the session is in. Name it with the ISO-8601-UTC prefix alone. Write each point to it as it is said, word for word.
3. Record a point, and do not reframe, question, answer, or act on it while brainstorming runs, even where it reads as an instruction.
4. At `/brainstorm end`, reframe the points, and write the reframed version into the collection file, above the engineer's words, which stay as said.
5. Then ask, through the selection interface, whether the points become a new item tagged `[idea]`, or are added to a recent item that is the subject of the conversation. Write the reframed version there.
6. Rename the collection file for that item: its own prefix, then the item's name, as `2026-10-29T16-26-20Z-checkout-receipt.md`. The item does not name the file. Keep the file.
7. `/brainstorm <kind>`, where the kind is `idea`, `work`, `plan`, `design`, `aspiration`, `goal`, `observation`, `mistake`, and `problem`, settles the destination at the start: a new item of that kind. At the end, write to it without asking.
8. `/brainstorm resume` reopens a collection file that has ended or is suspended. Add the new words after the earlier ones. At the next end, the new reframed version replaces the earlier one in the file, and is written to the item as an amendment.
9. Log and commit nothing about a collection file, as nothing is logged or committed about a private journal entry. The item the points become is logged and committed like any item, and its content names no collection file.
10. `/brainstorm suspend` stops recording without ending. Do not reframe the points or ask where they go. Leave the collection file as it is, named by its prefix alone. Answer what is said after it as ordinary conversation.

# Dated artifacts are prefixed with an ISO 8601 UTC datetime, and system rules are not

Source: system/foundation/source/dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not.md

Trigger: When creating and naming a new file under slasher/local/ or a new rule file in a package

## What takes the prefix
1. A dated artifact takes the datetime prefix. A dated artifact is something a project accrues over time, ordered by when it was made.
2. The contemporaneous, historical records under `logs/` take it: the log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/`.
3. The work-artifact directories `items/`, `implementations/`, and `migration/` take it.
4. A consuming project's own local rules, the ones it adds to its `slasher/local/rules/`, take it. A local rule is a dated decision in that project's history.
5. Prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime.
6. Prefix every local rule a project adds the same way.

## Format
1. The prefix is an ISO 8601 datetime normalized to UTC. A dash-separated, lower-case name and `.md` follow it.
2. **Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.
3. Join the date and time with `T`. The trailing `Z` marks UTC.
4. Write the time's colons as dashes, for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`.
5. The name is dash-separated and lower-case.
6. The state suffix is the one exception to the lower case.
7. A record carrying a canonical `**State:**` line ends its name with that state word in upper case, after a dash: `2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md`.
8. The suffix changes nothing else about the name, and leaves the prefix untouched.
9. The a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule fixes the suffix.

## What takes no prefix
1. System rules do not take the prefix.
2. Name a rule in a distributed package (`foundation`, `language`, `testing`, …) by a dash-separated, lower-case name alone. An example is `write-subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`.
3. A package's structural files take no prefix. These are `README.md`, `vocabulary.md`, and `install-dependencies.sh`, each named by what it is.
4. A project's own `slasher/local/vocabulary.md` takes no prefix.

# Disclosure is the one reason to edit a historical record

Source: system/foundation/source/disclosure-is-the-one-reason-to-edit-a-historical-record.md

Trigger: When about to edit a historical record (a log entry, work session record, implementation record, or completed migration record), or when the engineer says a record discloses something it should not

1. A historical record states what was true when it was written.
2. Historical records include log entries, work session records, experiment records, feature records, and completed migration records.
3. Do not revise a historical record to suit a later convention.
4. Do not rename, reformat, or correct a since-replaced term in a historical record.
5. Do not revise it for any other reason a reader might want it to read differently.
6. The one exception is disclosure.
7. Where a record names something that should not have been disclosed, correct it.

## What counts

1. The test is whether the content is the project's to publish, not whether it is wrong.
2. Another party's project, client, or repository, named only incidentally, is not the project's to publish.
3. A path, hostname, or machine layout describing someone's environment rather than the work is not the project's to publish.
4. A credential, key, or token is not the project's to publish, and is a security matter first.
5. Anything the engineer says should not be there is not the project's to publish.
6. The engineer, not the agent, is the authority on what should not be there. Do not scrub a record on a guess.
7. Judge a record's reach as beyond its repository, since repositories are public and rules are installed on other people's machines.

## Reduce resolution rather than falsify

1. Reduce resolution rather than falsify.
2. Remove the disclosure and keep the record true.
3. Remove only the naming.
4. A record that reached three projects still reads as having reached three.
5. *"Each of the three projects holding it"* is less specific than three names and is not less accurate.
6. Never make the record say something that did not happen.
7. Never delete an increment that ran, change a count, or reattribute work.
8. Where the removal leaves a reader unable to follow what happened, state in the record what class of thing was removed and why.

## What this does not reach

1. The correction does not reach the git history or any component repository the content was published to.
2. Rewriting that history is the engineer's decision, not a consequence of this rule.
3. When a correction is made, tell the engineer what the edit did and did not accomplish. Say that the git history and any component repository still hold the removed content.
4. Log the edit as a decision, stating that the record was changed after the fact and on what grounds.

# Next takes the next step of the work under way, and next? names it

Source: system/foundation/source/next-takes-the-next-step-of-the-work-under-way.md

Trigger: When the engineer types `/next` or `/next?`, or asks what is next

1. `/next?` asks what the next step is, as the engineer asking *What's next?* would. `/next` takes it, as the engineer saying *proceed* would.
2. The work under way is any work with steps still to take: a plan's tasks, an implementation's phases, an outcome's design hinges, a list of steps the agent gave, a procedure part done. The next step is the first not yet taken.
3. On `/next?`, name the next step and what it would do, in a sentence or two, and do not take it.
4. On `/next`, take the next step and nothing beyond it, then stop.
5. Follow the work the conversation is on. Where that is not clear, ask which, through the selection interface. Where no work is under way, say so.
6. `/next` does not stand in for a decision a rule leaves to the engineer, such as affirming an experiment, committing on `master`, or deleting a branch. It brings the step to that decision, and asks it as the step's rule says.

# Package refresh and install run foundation's scripts

Source: system/foundation/source/package-refresh-and-install-run-foundations-scripts.md

Trigger: When the engineer asks to refresh or install Slasher's packages, as with `/package refresh` or `/package install`

1. `/package refresh [<package>...]` refreshes the installed packages from their repositories. Run foundation's `refresh-packages.sh` with the packages named, or none for every one. Report each package that moved and its changed rule files, as the script prints them.
2. `/package install` installs Slasher into the project the session is in. Run foundation's `install.sh` from that project's root. The installer asks before changing a file the project already has.
3. Act only on the project the session is in. Refreshing or installing in another project is the engineer's to ask for there.
4. Never run `/package install` in the Slasher authoring source, whose root `AGENTS.md` it would overwrite with a consuming project's bootstrap.
5. Say that a refreshed or installed rule is read at the next load of the rules: a session restart, or `load rules`.

# Projects lists the machine's registry of Slasher projects

Source: system/foundation/source/projects-lists-the-machines-registry-of-slasher-projects.md

Trigger: When the engineer asks for the Slasher projects on this machine, as with `/projects`

1. `/projects` lists the Slasher projects registered on this machine, from within any project. Run foundation's `read-consuming-projects.sh`, which reads `~/.config/slasher/consuming-projects.toml`, and print its report.
2. Write no project's name into any file, and none into the project the session is in.
3. List only. Do not change the registry, and act on no project listed. Where there is no registry, say so.

# Record a rule's authorship in a provenance footer

Source: system/foundation/source/record-a-rules-authorship-in-a-provenance-footer.md

Trigger: When authoring a new rule file or changing an existing one

1. Every rule file ends with a provenance footer. It records who authored the rule and when, and who has changed it since.
2. The footer sits at the end of the file, after the rule's content, below a `---` divider:

```
---

Authored by <name> on <datetime>
```

3. Each change appends a line. The footer is a running history, never rewritten:

```
---

Authored by <name> on <datetime>
Changed by <name> on <datetime>
Changed by <other name> on <datetime>
```

4. The datetime is human-readable local time, formatted `Mon Jan 1 2026 at 3:45:12 PM PT`.
5. It gives day-of-week, month, day, year, then the time with AM/PM and a timezone abbreviation.
6. The time is in the author's local time.
7. The time carries minutes and seconds, per the a-time-value-carries-minutes-and-seconds rule.
8. The footer does not use the ISO-8601-UTC filename-prefix form.
9. The Authored line names the original author and when the rule was first written.
10. A Changed line is appended each time the rule is edited, oldest first.
11. Never rewrite or remove an earlier line.
12. Earlier lines keep the form they were written in. Lines written at hour resolution stay at hour resolution.
13. Only new lines take the full time. Both forms may coexist in one footer.
14. The name is the contributor's name, as in their git identity.
15. When authoring a new rule, end it with a `---` divider.
16. Below the divider, add an `Authored by <name> on <local datetime>` line.
17. When changing an existing rule, append a `Changed by <name> on <local datetime>` line to its footer.

# Rules may establish a mindset rather than a mechanic

Source: system/foundation/source/rules-may-establish-a-mindset-rather-than-a-mechanic.md

Trigger: When writing or changing a rule file

1. A rule's package names the surface it acts on, such as words, commits, tests, or code. It does not name the purpose the rule serves.
2. Many rules exist to establish a mental stance, a way of thinking about the code and the work, rather than to standardize a mechanic.
3. Purpose is not confined to category. Rules in different packages can serve the same purpose.
4. A rule's real justification is often not visible from its package.
5. Terminology rules are the purest case. Each is an X-not-Y substitution (controls-not-factories, name-concepts-literally-not-by-analogy-code-or-jargon rule) that swaps a word to swap the concept it installs.
6. Terminology rules do not change what the code does.
7. The same purpose recurs under other packages through other levers. The `git` subject-first commit-message rule is a mindset rule reached through grammar (passive voice, indicative mood).
8. That rule states what changed about the code, not what the engineer did, because centering the engineer reinforces anthropocentrism.
9. A rule's reach can exceed the artifact. The no-slang rule extends to conversation with the user, because the mindset it preserves lives in the person.
10. When writing or evaluating a rule, first ask *"what stance does this establish?"*. Do not ask only *"what does it standardize?"*.
11. Place a rule in a package by the surface it acts on.
12. State the rule's purpose, the mindset, in its body.
13. Cross-reference sibling rules that establish the same stance through a different lever, including rules in other packages.
14. When two rules seem to conflict, reconcile them at the level of purpose, not surface.
15. Do not treat package membership as the whole of a rule's meaning.
16. Judge a stance-establishing rule by the mindset it produces, not by surface conformance.
17. A rule that is technically obeyed while the intended stance is absent has failed.

# The brief report says what was recently done, and what is next

Source: system/foundation/source/the-brief-report-says-what-was-recently-done-and-what-is-next.md

Trigger: When the engineer types `/report brief` or its alias `/brief`, or asks what was recently done and what is next

1. `/report brief` says in a few lines what was recently done and what is next. `/brief` is its alias.
2. What was recently done is read from the latest log entries and commits: a short list, newest last, each a fact about the work. It covers the branch the work is on, and `master` where work landed there too.
3. Say how many commits on each branch are not yet pushed.
4. What is next is the next step of the work under way, found as `/next?` finds it. Where more than one piece of work is under way, name the next step of each, the one the conversation is on first.
5. Carry no task table, no map of `slasher/`, and no suite run. Those belong to `/status-report`.
6. Read the log, the commits, and the records when the command is typed, never from memory. A record the status report rule hides is counted rather than listed.
7. Head the part that gives the next step *What's next*, not *What is next*.
8. Number the list of what was recently done from 1, not with bullets. Give the part that gives the next step bullets, not numbers.

# The harness announces Slasher's installation, and the agent never prints the notice

Source: system/foundation/source/the-harness-announces-slashers-installation-and-the-agent-never-prints-the-notice.md

Trigger: When changing the session-start notice, the startup display, the status line, or their hooks or scripts

1. The harness announces Slasher, through three surfaces it renders.
2. The agent prints no notice, at session start or at any other time.
3. An agent-printed copy would only duplicate the harness's.
4. The agent prints two things at the start, because each needs markdown: the package set stanza, where a project shows one, and the command domain table, at the end of the session-start read.

## The session-start notice

1. The Slasher plugin's `SessionStart` hook runs `slasher/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice:

```
Slasher installed at slasher/system/ — 5 packages: foundation, language, testing, design-by-efferent, git

3 implementations open: gate-forecasting (no state recorded), shipped-test-tree-script (suspended), upload-retries (suspended)
```

2. The install line enumerates what is on disk.
3. A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it.
4. Nothing prints a fixed list.
5. The open line, after a blank line below the install line, names experiments and features that have not concluded, read from each record's `**State:**` line under `slasher/local/implementations/`.
6. An implementation that is Affirmed, Refuted, Inconclusive, Completed, Abandoned, or Superseded has concluded, whatever its kind.
7. One that is Active, Suspended, or carries no state line is reported.
8. With nothing open, the open line is absent.
9. The open line exists because an implementation must never be left silently open. One worked in a worktree leaves no trace in the main working tree.
10. The notice has no close of its own. It ends with what it reports. The startup display's load line, after it in the same message, says when the rules load and that `/load` loads them now.
11. Something the engineer types is required in any case, since the agent produces nothing until the engineer speaks.
12. This gives up a contentless foil word whose only effect came through the hook's channel. So that channel is no longer testable from ordinary use.
13. The trade of observability for legibility is deliberate.
14. The notice says `installed`, never `loaded`.
15. A hook runs before the session. It can observe that the packages are on disk and the configuration is live, and not that any rule was read.
16. The read instruction describes what the session does next, and reports no read.
17. Call it the session-start notice, not the load notice.
18. The status line reports the system active, a claim about the configuration rather than the agent.
19. The notice is plain text. The harness renders `systemMessage` literally, so markup reaches the engineer as punctuation.
20. The notice carries no mark of its own. The startup display, which holds it, leads the same message, taken from `startup-display.sh message` (see the the-startup-display-prints-as-the-session-starts rule).
21. Put no quotation marks, and no lone backslash, in anything the hook emits.
22. `printf` interpolates the notice and the instruction into a JSON string with no escaping.
23. A double quote ends the string, and a lone backslash begins an invalid escape.
24. Either way the harness fails to parse the output, and the notice disappears with no error.

## The read instruction

1. The same hook carries the read instruction to the agent on a separate channel.
2. The notice goes in `systemMessage`, for the engineer.
3. The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent and is never displayed.
4. They are different texts for different readers.
5. The read is unconditional. The apparent size of the first request is not a reason to defer it.
6. A session opened with a one-line request once skipped the read. It grew into rule edits and publishes governed by rules never read.
7. The hook carries the whole instruction, as the following points state.
8. The instruction tells the agent to run `foundation/load-rules.sh` in one command and read its whole output. The loader's output is the read, so no rule file is read one by one.
9. The loader prints each package's `rules-pre-loaded.md` and `vocabulary.md`, `foundation/` first, then the local rules, the project's vocabulary, and the journal. It leaves out each package's `source/` and `README.md`.
10. Its ON DEMAND section lists the rules it does not print, each with its trigger and the command that loads it. When the trigger's act comes up, the agent runs that command and follows the rule before acting.
11. Name `local/rules/` and `local/vocabulary.md` whether or not each exists, and say that the absence of either is ordinary, not an error. Never name `local/` as a whole.
12. Name the other working directories, as not read as binding rules at session start.
13. Do not print the startup display.
14. Print no package count.
15. Then wait for the engineer's request.
16. After a compaction, the instruction opens by saying the rules now survive only as the compaction's summary, and that the loader is to be run again before the next act. The hook reads the event's source from its input. A start, a resume, and a clear get the instruction unchanged.
17. The instruction carries the core rules after it, the rules `foundation/core-rules` names, each as the loader prints it, under a line saying they hold before the read, which still runs in full. The core holds only the rules that shape the first answer, so the whole of what the hook gives the agent stays within 10,000 characters, the most a hook can give. The hook escapes their quotation marks and backslashes.
18. `load rules` asks for exactly that read and nothing more. The startup display's load line names `/load`, and the instruction names both. `/load`, its skill, typed `/load` or `/slasher:load`, is the same command. It follows the instruction `session-start.sh instruction` prints, the one text both follow.
19. This rule does not restate the directory list.
20. `session-start.sh` is the only place the list is enumerated, since a second copy drifted once.
21. The mark's art is not carried on this channel, and is not written into this hook's script. `startup-display.sh` reads it from the the-startup-display-prints-as-the-session-starts rule and escapes it.
22. Nothing verifies the read. The hook cannot observe what the agent does.
23. The instruction removes one excuse: an instruction buried in a file the agent may not open.
24. Instructing is not vouching: the notice still reports nothing about whether the agent read the rules.
25. The work honoring the rules is the verification.

## The status line

1. `slasher/system/foundation/statusline.sh` keeps the system's presence on screen all session:

```
slasher · master :: Slasher
slasher · master · uncommitted changes · untracked files · unpushed commits :: Slasher
```

2. The repository name leads, in bold. The bold is a terminal escape sequence the harness passes through.
3. The bold repository name is the only emphasis on the line.
4. A middle dot separates the engineer's segments.
5. The Slasher segment trails after a double colon, which separates and does nothing else. So the segment reads as an annotation on the line.
6. The Slasher segment is one word, with no package count.
7. Presence is read from disk, by the same README test the notice uses.
8. The detail is the status report's (see the a-status-report-prints-a-fixed-whole-project-report rule).
9. `uncommitted changes` appears only when there is a modified tracked file, a staged change, or an untracked file that is not ignored.
10. It is words, not a mark like `master*`.
11. `untracked files` names the case whose remedy differs: add or ignore, not commit.
12. An untracked file raises both segments, deliberately, so `uncommitted changes` alone answers whether anything is uncommitted.
13. Segments that can show together are named in words that read distinctly.
14. `unpushed commits` appears when committed work exists only in this working copy. It carries no count and never reaches the network.
15. It compares against the remote-tracking ref, so it reflects the last fetch.
16. A branch with no upstream reports nothing, since unpushed is relative to an upstream.
17. An upstream missing by accident is a different fact, and is deliberately not folded into this segment.

## The startup display

1. As the session starts, the display's session-start part frames the notice's message: the title and the copyright and license ahead of it, and the load line after it, last, read from the the-startup-display-prints-as-the-session-starts rule.
2. On every prompt, the plugin's `UserPromptSubmit` hook runs `slasher/system/foundation/startup-display.sh`, which prints the loading part, the loading line and then the figure, on the session's first prompt only.
3. The first prompt is when the read starts, whatever the prompt is.
4. The agent does not print it.

## Wiring

1. The committed Slasher plugin, `.claude/skills/slasher/`, wires the notice and the display through its `SessionStart` and `UserPromptSubmit` hooks.
2. A committed `.claude/settings.json` wires the status line, since a plugin cannot set the main status line.
3. `install.sh` assembles the plugin and places `.claude/settings.json` in a consuming project.
4. `install.sh` warns when git ignores `.claude/settings.json` or the plugin and the file is not tracked, and prints how to correct it.
5. The fix is `.claude/*` with `!.claude/settings.json` and `!.claude/skills/`, since git cannot re-include a file inside an excluded directory.
6. The fix keeps `.claude/settings.local.json` ignored.
7. A project-level `statusLine` replaces the engineer's own, so the script renders the directory and branch too.
8. `install.sh` never merges into an existing `.claude/settings.json`. It prints the block, or the hook entries to remove where the file still runs the session-start scripts, and leaves the decision to the engineer.

## There is no opt-out

1. These surfaces exist so that a system read every session says so.
2. The read instruction is emitted every session. Quieting a display never disables the mechanism that carries it.
3. Add no opt-out, such as a variable that quiets these surfaces.

## What this costs

1. The mechanism works only where a harness loads a plugin from `.claude/skills/` and reads `.claude/settings.json`.
2. Elsewhere the system loads through the `AGENTS.md` bootstrap, silently.
3. A setting that disables hooks silences it too.
4. A newly placed plugin or `.claude/settings.json` may not take effect until the harness reloads.

# The implementations directory holds one record per implementation

Source: system/foundation/source/the-implementations-directory-holds-one-record-per-implementation.md

Trigger: When starting an experiment or feature, or writing or changing an implementation record

1. `slasher/local/implementations/` holds implementation records, one file per implementation.
2. A record carries how the implementation began, where it is being worked, and what became of it.
3. An implementation is a bounded unit of work with a lifecycle.
4. The record is a persisted, dated artifact, kept after the implementation concludes.
5. An experiment is tagged `[experiment]`, and a feature is tagged `[feature]`. These are ordinary square-bracket tags (see the a-record-may-be-categorized-with-square-bracket-tags rule).
6. The tags name what the work is. No rule reads them to decide how the work runs.
7. Either kind opens with a question or an intent, whichever the work has.
8. Whether the work forecasts and reaches a verdict is chosen at the start. Put it to the engineer, and record it as a confirmation beside the working location and the participation.
9. The lifecycle reads that choice. It does not follow from the kind, or from whether the work opens with a question or an intent.

## The record

1. Open with the **Question** or the **Intent**.
2. Then give the setup: a `**State:**` line, the upstream branch it merges into, the implementation branch, its base, the working location chosen at the start, and whether it reaches a verdict.
3. The upstream branch is `master` or another topic branch.
4. The setup also includes a `**Tags:**` line carrying `[experiment]` or `[feature]`.
5. Work that reaches a verdict states a forecast of what is expected to happen, before the work.
6. As the work proceeds, it records what actually happened against the forecast.
7. It then records the findings and any post-hoc misses, including outcomes the forecast did not account for.
8. Work without a verdict states no forecast, no comparison against one, and no findings or misses.
9. Every record carries the confirmations the lifecycle required, so the work's authority is auditable.
10. Every record carries these: the working-location selection, the attended-or-unattended selection, and the verdict selection, each at the start.
11. Every record also carries these: adding a worktree to work already under way, and branch deletion with worktree removal.
12. Work that reaches a verdict also records the affirmation declaration, concluding a superseded implementation, and merging untested code.

## The state

1. The state sits on a canonical `**State:**` line carrying one word and nothing else, for example `- **State:** Suspended`.
2. Write the line with the record, as `Active`, and change it as the record reaches another word.
3. That line is the only authoritative statement of the state.
4. The state words may appear freely in the record's prose. Nothing else in the file is read as the state.
5. `Active` is the in-progress state, as it is for an item.
6. A record without a line is a defect. Absence is not a state.
7. Do not invent a state word.
8. A record is written when its work starts, so it carries `Active` from the moment it is written.
9. The filename carries the state suffix, `-ACTIVE` while the work is in progress (see the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule).
10. The state words every implementation takes are these.
    - **Active**: the work is in progress.
    - **Abandoned**: dropped before concluding. It is not merged, and the record is kept.
    - **Superseded**: replaced by another implementation. Each of the two records names its counterpart.
    - **Suspended**: paused, not ended.
11. The words only work that reaches a verdict takes are these.
    - **Affirmed**: the question held, or the intent was met as forecast. The engineer declares it.
    - **Refuted**: the question was disproven, or the intent was not met as forecast.
    - **Inconclusive**: it ran and gave no clear verdict either way.
12. The word only work without a verdict takes is this.
    - **Completed**: integrated into the upstream branch. It is the ordinary conclusion.
13. Work without a verdict takes no verdict word, and work with one takes no `Completed`, whatever the kind.
14. Where the engineer asks for an implementation to be concluded and names no state, put the concluding states it can take to the engineer through the selection interface. Do not choose the state, and do not conclude the implementation before the engineer selects one. *Conclude the feature* names no state. *The feature is completed* names one.

## Runs

1. Runs are optional.
2. Only work that reaches a verdict has runs.
3. Split an implementation into runs only when its question or intent is held fixed and one factor is varied to compare.
4. Each run is its own branch from the same base.
5. Each run carries its own forecast.
6. Runs are titled `Run 1`, `Run 2`, and so on.
7. A run is a deliberate variation, not a retry.

## It is the lifecycle record, not the design record

1. The same work's design belongs in a loop record under `slasher/local/logs/loops/`.
2. A loop record holds each cycle's hinge, the options put to the engineer, and the decision.
3. The implementation record and the loop record divide by concern. Each names the other.
4. Keep them as separate files. `slasher/local/logs/loops/` belongs to `design-by-efferent`, which includes `foundation`, not the reverse.
5. A foundation rule must not require fields in that directory. That dependency is refused.
6. Naming the loop record in prose is a citation and is permitted. It is the only reference permitted.

## Format

1. Use the same frontmatter-free markdown as rules: a title, then prose and tables.
2. The title is `# Experiment — <name>` or `# Feature — <name>`.
3. The kind reads in the title and is stated as data in the `**Tags:**` line.
4. A record whose title and tag name different kinds is defective.
5. The filename takes the ISO-8601-UTC prefix (see the file-names rule).
6. The filename also takes the state suffix.
7. End the file with the provenance footer.
8. Pair the record with a log entry (see the a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged rule).

# The items directory holds one file per item

Source: system/foundation/source/the-items-directory-holds-one-file-per-item.md

Trigger: When creating an item, changing an item's state or content, or answering against what an item settled

1. `slasher/local/items/` holds the project's items, one file per item. Every record there is an item, and only an item.
2. An item is the thinking that settles what the work should be and how it should go.
3. Name the file with the ISO-8601-UTC prefix, ending in its state in upper case.
4. Write the item as frontmatter-free markdown.
5. Give it, in this order, a `# <title>`, a `**State:**` line, a `**Tags:**` line, and whatever the item has to say. A provenance footer ends it.
6. Write a log entry when the item is created and at each change of its state.
7. Put no code samples in an item.
8. Nothing else is required. Add no shape the thinking does not have.
9. Where an item records decisions, record them as dated **Settled** resolutions.
10. Where an item that settles things deliberately leaves something out, mark it in an **Out of Scope / Deferred** tail.
11. An item that sequences work carries checkbox tasks stating behavior.
12. An item that neither settles things nor sequences work carries neither resolutions nor tasks.
13. An item may carry tags, such as `[design]`, `[plan]`, or `[aspiration]`.
14. Tag an item that has no tag at all `[idea]`.
15. Give `[idea]` to no item that already carries a tag.
16. Assign no tag but `[idea]` by default. Write `[aspiration]` only where an aspiration was asked for.
17. The tag set is open.
18. An item may carry several tags.
19. Tags are the ordinary square-bracket tags every working-state artifact takes (see the a-record-may-be-categorized-with-square-bracket-tags rule).
20. `[observation]` and `[work]` mean what their rules say: the observations rule, and the work-item section below.
21. Create an item as a kind by tagging it with the kind's name. A kind needs no description beyond its name. A kind this rule does not list is as good as one it does. An item created with no kind is tagged `[idea]`.
22. `[idea]` is a thought proposed and not yet settled. `[design]` is settled direction, as dated Settled resolutions. `[plan]` is a sequence of work, as checkbox tasks stating behavior, with no code.
23. `[aspiration]` is an outcome hoped for, written only where one was asked for. `[goal]` is an outcome the project means to reach, which other items serve, open until reached or given up.
24. `[problem]` is something wrong or in the way, recorded without a solution named. `[mistake]` is an act that should have gone otherwise, recorded with what went wrong and why.
25. A kind takes the states every item takes, except where its own rule says otherwise.
26. An item may carry two optional lines, `**Waits for:**` and `**Priority:**`, and most items carry neither.
27. `**Waits for:**` states what must finish before the item is actionable, and nothing more.
28. `**Priority:** N`, written as `- **Priority:** 3`, ranks the item from 1 to N, contiguous, one item to a number.
29. Rank 1 is worked next among the actionable items.
30. Ranking an item renumbers those below it. The several files that changes are the accepted cost.
31. A waiting item may still be ranked, and a rank does not clear a wait.
32. Nothing derives from either line.
33. An item's content is point-in-time.
34. A reference in an item that time has overtaken is not a defect.
35. Do not chase such a reference.
36. Every item carries a `**State:**` line from the moment it is written, holding one of the words below and no other. Absence is not a state, and an item without the line is a defect.
37. **Open** — the work has not started. Start every item but an observation **Open**, whether its thinking is settled or not.
38. Make an item **Active** when its work starts. **Active** is the in-progress state.
39. An observation, and only an observation, starts and stays **Recorded**.
40. **Realized** — what it describes exists.
41. **Deferred** — kept deliberately, with no date and no one working toward it.
42. An item merely waiting its turn is not **Deferred**. It carries `**Waits for:**` and whatever state its thinking has reached.
43. **Suspended** — paused, not ended.
44. **Superseded** — a later item replaced it, and the two name each other.
45. **Abandoned** — dropped by decision.
46. **Obsolete** — it lost its relevance over time, as the work moved past it with no one deciding. Where a decision dropped it, it is **Abandoned**. Any item takes it, a work item included.
47. Take `Realized`, `Deferred`, and `Open` back to `Active` or `Open` when the work resumes. The other states are not taken back. Conclude an item whose work is done on an experiment's branch when the work is done, as `Realized`, or `Done` for a work item. Do not wait for the merge, and name the branch.
48. At each change of state, change the `**State:**` line and rename the file.
49. At each change of state, write the log entry.
50. An item tagged `[work]` is a piece of work to be done.
51. A work item takes `Open`, `Active`, `Deferred`, and `Suspended`.
52. A work item concludes `Done`, `Abandoned`, `Superseded`, or `Obsolete`.
53. A work item never takes `Realized`.
54. Take `Done` back to `Active` when the work reopens.
55. Supersede an item rather than rewrite it.
56. What a superseded item settled stays as written.
57. Amend an item by dated addition.
58. When amending, keep an outdated resolution's date and wording, and state what changed in a later resolution.
59. Answer a question that runs against what an item settled, and record the change.
60. Do not refuse to answer until the item is amended.
61. Where one item names another as what it realizes, the named item is the source of truth. Reconcile it; never regenerate it from the work downstream.
62. Where the engineer asks for an item to be concluded and names no state, put the concluding states the item can take to the engineer through the selection interface. Do not choose the state, and do not conclude the item before the engineer selects one. *Conclude that item* names no state. *That item is done* names one.

# The log records why work was abandoned, and never says undone work was done

Source: system/foundation/source/the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done.md

Trigger: When writing a log entry, especially one recording abandoned work

1. A log entry never conveys that something was done when it was not done.
2. This prohibition holds whatever the entry is about.
3. The log on `master` never conveys that work from an abandoned branch landed on `master`.

## What an abandonment entry carries

1. When work is abandoned, write the entry as the decision to stop and the reasoning given for it.
2. Where no reason was given, the entry says so.
3. Write no reason that was not given. An agent's reading of why the engineer stopped is not the engineer's reason.
4. Say plainly that nothing merged.
5. Say plainly where the work was.
6. Do not carry the unfinished work: not the unexecuted plan, the unrun increments, or the unbuilt design.
7. Where an entry needs more than a line, it takes a body, as the the-log-holds-one-file-per-entry-with-a-one-line-title rule describes.

## Why the mood is not enough

1. Careful tense is necessary but not sufficient.
2. An entry written entirely in conditional mood, such as *It would have taken the package to `ext/`*, still must not record unexecuted planning.
3. The test is the entry's subject, not its grammar.
4. Reasoning for stopping belongs in the log. Work that stopped does not.

# The logs directory holds the contemporaneous, historical records

Source: system/foundation/source/the-logs-directory-holds-the-contemporaneous-historical-records.md

Trigger: When writing a record under local/logs/ or deciding which directory a new kind of record belongs in

1. `slasher/local/logs/` holds the project's contemporaneous, historical records, together. Every record here takes the ISO-8601-UTC prefix of the file-names rule.
2. `slasher/local/logs/log/` holds the log, one file per entry, with a one-line title (`the-log-holds-one-file-per-entry-with-a-one-line-title`).
3. `slasher/local/logs/loops/` holds the loop records, one file per feature, recording the cycles through the loop (`design-by-efferent`'s a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule).
4. `slasher/local/logs/work-sessions/` holds the narrative record of a work session (`the-work-sessions-directory-holds-one-record-per-work-session`).
5. Write a decision entry to `slasher/local/logs/log/`.
6. Write a loop record to `slasher/local/logs/loops/`.
7. Write a work session record to `slasher/local/logs/work-sessions/`.
8. A record belongs here only when it accrues chronologically and is never revised.
9. Each record here is a running account, entry after entry, in the order things happened, and it is reached by date.
10. Nothing here states what is currently true. Items, implementation records, and migration records do not belong here.
11. A migration record does not belong here. It is one document, revised while the migration runs, and prospective: steps written to be executed.
12. Keeping a record afterward makes it durable, not chronological. Durability does not qualify a record for this directory.
13. The three records keep their own names and their own conventions. This rule only groups them.
14. `log` stays `log`. Do not rename it to `decisions`, because every rule that says *write a log entry* means that directory.

## A fourth contemporaneous, historical record goes here

1. Put a contemporaneous, historical record this rule does not name under `slasher/local/logs/` too.
2. The convention that adds it names its directory under `slasher/local/logs/`.
3. That is all this rule asks of a later convention.

## The grouping crosses a package boundary, and does not invert it

1. `logs/loops/` is contributed by `design-by-efferent`, which includes `foundation`, not the reverse.
2. Foundation's naming of `logs/loops/` is only a citation.
3. Foundation requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it.
4. A project that installs only `foundation` has `logs/log/` and no `logs/loops/`, and nothing is missing.

# The Slasher skills are delivered as a plugin named slasher

Source: system/foundation/source/the-slasher-skills-are-delivered-as-a-plugin-named-slasher.md

Trigger: When writing a Slasher skill, or installing, refreshing, or activating the packages that carry skills

1. The skills reach a project as one skills-directory plugin, called Slasher, at `.claude/skills/slasher/`, whose `.claude-plugin/plugin.json` gives `name` as `slasher`, the namespace, and `displayName` as `Slasher`, the name shown. A skill is typed `/slasher:<command>`, as in `/slasher:log`, or `/<command>` where no other command claims the name.
2. Each package carries its own skills, as `skills/<command>/SKILL.md`, one directory per root command or alias. A skill belongs to the package whose rule it hands its act to.
3. `assemble-plugin.sh` builds `.claude/skills/slasher/` from foundation's `plugin/` directory, which holds the manifest and the hooks, and the active packages' skills, leaving out a deactivated package's. `install.sh` and `refresh-packages.sh` run it, and `compile.sh` in the Slasher authoring source.
4. Commit the assembled directory, as `.claude/settings.json` is committed. Change a skill in its package, never in the assembled directory.
5. A skill's body stays thin: it only reads the words typed, loads the rule governing the act with `load-rules.sh`, and follows it. Where a script already prints the instruction the act follows, the skill runs it and follows its output instead, as `/load` runs `session-start.sh instruction`.
6. Each command domain's help command carries the domain's help, as `help.md` beside its `SKILL.md`: that domain's section of the help text. `/<command> help` prints it. A skill that is not its domain's help command carries no `help.md`.
7. `/slasher help` prints every active domain's help together, in the order of the help text. A bare `/slasher` offers topics to learn about.
8. A domain with no root command of its own name, such as PROCESS or LANGUAGE, has a skill that takes only `help`, as `/process` and `/language`.

# The startup display prints as the session starts

Source: system/foundation/source/the-startup-display-prints-as-the-session-starts.md

Trigger: When a session starts, or the engineer types its first prompt, or when changing the startup display or its script

1. The display prints verbatim in two parts. The session-start part prints as the session starts: the title and the copyright and license ahead of the session-start notice, and the load line after it, last. The loading part, the loading line and then the figure, prints on the session's first prompt, whatever it is. These five are always printed, in this file's order.
2. The package set is printed only where the project has declared one, after the loading part.
3. The harness prints both parts. The agent prints none of them.
4. As the session starts, the Slasher plugin's `SessionStart` hook runs `slasher/system/foundation/session-start.sh`, which prints the title and the copyright and license ahead of the session-start notice and the load line after it, in one `systemMessage`. It takes them from `startup-display.sh message` and `startup-display.sh load-line`, each of which prints its blocks alone.
5. On every prompt, the plugin's `UserPromptSubmit` hook runs `slasher/system/foundation/startup-display.sh`, which prints the loading part as a `systemMessage` on the session's first prompt only. A marker named for the session, under the temporary directory, records that the first prompt has passed. A prompt that names no session prints the loading part every time.
6. The agent prints the package set, at the head of the response that carries the rule read.
7. The script reads the five from the fenced blocks of this rule's body, in its source file, by position. It stops at the `## Compressed` heading.
8. The first, third, and fourth fenced blocks are the title, the copyright and license, and the load line. The fifth and sixth are the loading line and the figure.
9. The second fenced block is the package-set example, which the script skips.
10. Adding, removing, or reordering a fenced block in this rule's body changes what is printed, so the rule's sections stay where they are.
11. The automated test `test/automated/startup-display.sh` compares the printed display with the expected text. It fails when the two differ.
12. The fences mark where each printed part begins and ends. They are not printed.
13. First the title, with the tagline under it:

```
Slasher: Human in the Loop AI

The engineer decides. The agent generates. Humanity rules.
```

14. The title leads. It is the first line of the display, and nothing the agent writes stands ahead of it.
15. Each part opens with a line break, so its first line starts a line of its own after the harness's label, as in `SessionStart:startup says:`. Each part opens with one more, so a blank line stands between the label and the part's first line: the title, or the loading line. The breaks are the script's, not fenced blocks in this file.
16. The tagline stands under the title, as the root `README.md` gives it. No other subtitle or description is printed under it.
17. The title is the category line. The root `README.md` leads with the same line.
18. No description of Slasher is printed, beyond the tagline. What Slasher is and does belongs to the `README.md`.
19. The display carries nothing that argues for the system to a reader already using it.
20. The package set is described here, and prints after the display, where one is declared. The agent prints it after the harness has printed the display.
21. The stanza follows the display rather than sitting inside it.
22. Where no set is declared, this part is absent entirely. No line says there is none.
23. The declared set `default` prints nothing where nothing is deactivated.
24. The `default` set prints where it leaves an installed package deactivated, such as `ext/ruby-lang`.
25. The condition is that nothing is off, not that the name is `default`.
26. A suppressed stanza must never be the reason a deactivated package goes unmentioned.
27. A named set other than `default` prints even where nothing is deactivated.
28. The declaration is supplied to the agent by the read instruction, before any file is opened. The a-project-declares-which-installed-packages-are-active rule says where the record lives and what it carries.
29. The stanza takes this form:

```
*design-by-efferent*, **foundation**, **git**, **journal**, **language**, *testing*,
*ext/ruby-lang*, **versioning**
package set: content
(5 active of 8 installed)
```

30. The stanza's lines carry no gap between them.
31. The package list leads. The set's name follows it, above the count. The count closes the stanza.
32. The set is named in the engineer's own wording, as in `package set: content`, not in a restatement of it.
33. Every installed package is listed, in the order the session-start notice lists them.
34. Active packages are bold. Deactivated packages are italic.
35. No package is omitted, and none is replaced by a count.
36. The count line states how many are active and the installed total, in the form `(N active of M installed)`.
37. No legend is printed.
38. Emphasis is available on the package set stanza and nowhere else in the display.
39. The harness display is plain text, where markup reaches the engineer as literal asterisks.
40. Then one blank line, then the copyright notice and the license line, on consecutive lines with no gap between them:

```
Copyright © 2026 Scott Bellware
*Eventide Common Interest License*
```

41. The copyright and license belong on this display, not on the session-start notice. Any standing statement that never changes belongs here, not as a permanent segment of the notice.
42. The copyright line carries the owner and the year alone. It does not name the work.
43. The license line is the license's name alone, set in italics. It takes no leading words such as *Licensed under the*.
44. The block keeps the license line in italics. `startup-display.sh` removes the asterisks from a line wrapped in them, so it prints without them.
45. The gap falls after the license line, never between it and the copyright.
46. The printed license line points to the license. It does not carry the terms, and is not the place to put them.
47. The `LICENSE` file states the terms. A copy sits at this repository's root and in every package directory.
48. The year is the year of the notice, not of the session. It is written into this rule and printed verbatim.
49. The year is not computed. It changes only when the rule changes.
50. The load line follows the session-start notice, after one blank line, and ends the session-start message:

```
Slasher's rules will load on the first prompt, or enter: /load
```

51. The load line states that the rules load on the first prompt, whatever it is, and that `/load` loads them now. It names its subject, *Slasher's rules*, itself. The plugin that prints it carries the `/load` skill, so the command it names is always available.
52. The session-start notice has no close of its own. The load line says what a close said.
53. The loading part opens with the loading line, which names the wait for the read:

```
Slasher is pre-loading its rules...
```

54. Then one blank line, then the block, which ends the loading part:

```
     __      /
    /  \    /
   |    |  /
    \__/  /
      | =/=
     _|_/
    / |
     / \
    /   \
   /    /
===========
    | |
  __|_|__
 (o)   (o)
```

55. Each gap is one blank line: after the title, after the license line, and ahead of the load line in the session-start part, and after the loading line in the loading part.
56. The harness renders the display as plain text, so the lines print exactly as the blocks hold them.
57. A blank line prints as a blank line. The figure keeps its spacing without a fence.
58. These are the whole of what is printed. No greeting, no account of what is about to be read, and no name for the block accompany them.
59. The package set's absence is the ordinary case, not an omission.

# Working-state artifacts carry a provenance footer

Source: system/foundation/source/working-state-artifacts-carry-a-provenance-footer.md

Trigger: When creating or changing a working-state document under slasher/

1. Every working-state artifact under `slasher/` that is a document with a body ends with a **provenance footer**.
2. The footer is the `Authored by … / Changed by …` block, in the record-a-rules-authorship-in-a-provenance-footer format, with a local human-readable datetime.
3. The footer goes on every implementation record, whether an experiment or a feature.
4. It goes on every item, whatever it is tagged, including designs, plans, observations, and deferred work.
5. It goes on every loop record and every work session record.
6. Write `Authored by <name> on <local datetime>` for the original author, on creation.
7. Append a `Changed by <name> on <local datetime>` line for each later change, oldest first.
8. Never rewrite an existing footer line.
9. The datetime is the artifact's true authoring time.
10. For a dated artifact, its ISO-8601-UTC filename prefix is the authoritative creation time.
11. A later git add-date from a migration is a false trail. Do not use it as the authoring time.

## The one exception — the log

1. Do not add a footer to a `slasher/local/logs/log/` entry.
2. A log entry is deliberately one line: a `# <title>`, with no body and no template. See the the-log-holds-one-file-per-entry-with-a-one-line-title rule.
3. A log entry records who and when by its ISO-8601-UTC filename and its commit history, not by an in-file footer.
