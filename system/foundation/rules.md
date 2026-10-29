# A date in a record's title is written as the day, the date, and the 24-hour time

Source: system/foundation/source/a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time.md

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

1. A design is an item tagged `[design]`.
2. A design may have a section documenting a dependency on a package.
3. A package means a gem, a library, or another installable package.
4. Title that section **Package Dependency**.
5. Do not title it just "Dependency".
6. Use plain "Dependency" only for sections about something other than a package.

# A log entry is written for an implementation record, and the concluding entry depends on whether the work merged

Source: system/foundation/source/a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged.md

## An implementation record takes a log entry

1. An implementation record pairs with a one-line entry in `waytide/local/logs/log/`.
2. Write the entry when the record is created.
3. Write another entry on each change of the canonical `**State:**` line.

## The concluding entry depends on whether the work reached `master`

1. The concluding entry takes one of two forms. Which one is not a matter of taste.
2. The form is decided by whether the work merged.
3. Merged work means an affirmed experiment merged into its upstream branch, or a completed feature integrated. An affirmed experiment merges, and a completed feature integrates.
4. For merged work, the entry is a summary marker. It names the record and its state, and stops there.
5. Unmerged work means a refuted, inconclusive, abandoned, or superseded experiment, or an abandoned or superseded feature. That work is never merged, and its branch is deleted only on confirmation. Its record is kept, marked with its state, as evidence.
6. For unmerged work, the entry carries the finding, and only where there is one.
7. For an unmerged experiment that reached a verdict, the entry states the question, the verdict, and what was found.
8. For abandoned work, the entry states the intent, that it was abandoned, and the reasoning given for stopping.
9. An abandoned-work entry does not reproduce the plan, the increments, or the design the work produced. A careful tense is not enough (see the the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done rule).
10. The entry carries the substance whenever the branch did not merge, whether or not the record reached `master` by another route.
11. Do not rely on the practice of committing the record to `master` while the work is on a branch.
12. Write the findings, and for abandoned work the reasoning given for stopping, into the entry, so that `master` holds them without the record.

## What is already required, and not restated

1. An affirmed experiment still copies its own log into the project's log, as an-implementation-runs-on-a-branch-to-a-declared-end rule requires.
2. The summary marker sits beside those copied entries. It does not replace them.
3. A completed feature has no affirmation and no log copy. Its marker is the whole of what its conclusion writes.

## What is not logged

1. Write no log entry for a confirmation the lifecycle records.
2. Those confirmations are the working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion. They are recorded in the record.
3. Write no log entry for a turn of the work.
4. The hinges, the cycles, and the runs belong to the loop record and the implementation record.

# A log entry is written for an item on creation, on each settled resolution, and on a change of state

Source: system/foundation/source/a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state.md

1. An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`.
2. Write the entry at three moments, and at no others.
3. The item's tag makes no difference.
4. Write the entry on the item's creation.
5. Write the entry on each dated `Settled` resolution added after the item is created.
6. Write the entry on each change of the item's `**State:**` line.
7. A change of state is the line reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item.
8. A change of state is also the line taking back Realized, Deferred, Open, or a work item's Done.
9. An observation is `Stated` and never moves, so it takes a creation entry only.
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
23. Carry the same mood into the commit subject the entry travels in.
24. Fix no wording template. *X is recorded as an item, Open because …* and *X is realized* are forms in use.
25. This rule states the obligation once, for every item.
26. The an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes rule, the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule, and the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule state their own entries.
27. The the-items-directory-holds-one-file-per-item rule points here and keeps no second copy.
28. The the-log-holds-one-file-per-entry-with-a-one-line-title rule's general trigger is to log whenever in doubt. It rests on each writer's judgment, so it does not make the entries reliable.

# A log entry recording an engineer's decision is tagged `[decision]`

Source: system/foundation/source/a-log-entry-recording-an-engineers-decision-is-tagged-decision.md

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
# The README item settles that the README's content is addressed with Waytide's website, and waits for it

**Tags:** [decision]
```

3. An entry may carry other tags beside this one.
4. An engineer's decision to stop doing something is tagged `[decision] [suspended]`.
5. What `[decision]` marks is fixed here.
6. The set of the engineer's decisions is read from this tag.

# A package's vocabulary holds its terms, and the most specific one decides

Source: system/foundation/source/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md

1. A package's `vocabulary.md` holds the terms that package defines and the word substitutions it enforces.
2. It is binding.
3. Use its terms and substitutions in code, tests, rules, designs, commits, records, and dialogue.
4. Give a package a vocabulary only when its domain has specialized words.
5. A package whose subject is written in ordinary words has no vocabulary. The absence is correct, not missing.
6. `git` and `ext/ruby-lang` have none. Six packages do.
7. Put a term in the vocabulary of the package whose domain it belongs to.
8. Put a domain-less term or substitution in `language`. Put a domain-specific substitution in its own package's vocabulary.

## What a vocabulary holds

1. **Terms** are the concepts the package defines, such as `solubility`, `efferent`, `hinge`, `precondition`.
2. A term is a glossary entry, and it says what the concept is.
3. **Substitutions** name a word not to write, and the word to write instead. Examples: `conform` rather than "sweep", `verified` rather than "green".
4. **Discontinuations** name a word removed from use with nothing in its place. `discriminator` went because the concept went.
5. A substitution names two words. A discontinuation names one.
6. Keep substitutions and discontinuations under separate headings. Do not file one under the other's heading.
7. A word Waytide did not coin is still a term where the vocabulary says what it means, and is entered as one. Examples: `load-bearing`, `cradle`, `preserve`.
8. Where a word was taken rather than coined, the entry says so in its own prose.
9. That statement is an **origin**, not a kind of entry.

## Every word in a vocabulary is approved or reserved

1. Every word in a vocabulary is approved or reserved. This holds for its terms and for the Use column of its substitutions.
2. An approved word is approved in the STE dictionary and used with its approved meaning. Nothing further is required.
3. A reserved word is a technical noun or verb in a category its entry names: STE Rule 1.5, 1.6, or 1.12, or an ETE category. The vocabulary that holds it is the approval STE Rule 1.8 requires.
4. A reserved word's entry states what the STE dictionary says about it: absent, refused with an alternative, or approved with a meaning Waytide does not use. The last is governed by the ete-fixes-the-meaning-of-a-word-in-its-category rule.
5. Reserve a word by the sequence the a-word-is-reserved-in-six-steps rule gives, in the `language` package's `ete/` directory.
6. A definition with no STE note reserves a term absent from the dictionary. A substitution's Use word with no STE note is ordinary vocabulary, not reserved and not rewritten.
7. One line at a vocabulary's head says that every word in it is approved or reserved, and cites this rule. The vocabulary does not repeat the rule.

## Which vocabulary decides

1. Four levels hold terms, and a word can appear in more than one.
2. They stand in this order, from the most general to the most specific, which decides:
   1. **The STE dictionary**, and Waytide's reserved terms where the approved word means something else. The `language` package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule states this level and its exception.
   2. **The `language` package's vocabulary**: the terms and substitutions that belong to no domain. The `language` vocabulary says so itself.
   3. **An individual package's vocabulary**: the terms and substitutions of one domain.
   4. **The project's own vocabulary**, in `waytide/local/vocabulary.md`, which a project writes for itself.
3. When a word appears in two vocabularies, the more specific one decides.

## A project's own vocabulary is `waytide/local/vocabulary.md`

1. It is one file, beside `rules/`, holding the terms and substitutions a project settles for itself.
2. It has the same shape as a package's `vocabulary.md`.
3. It takes no datetime prefix. It is a structural file, not a dated decision. See the file-names rule.
4. It is read at session start, with `waytide/system/` and `waytide/local/rules/`. That read makes it binding.
5. `session-start.sh` names it in the read instruction. The `AGENTS.md` bootstrap names it too.
6. It is optional, and its absence is not a defect.
7. Write no such file until there is a term to write.
8. It is not a rule. Do not put it in `rules/`.

## Specialization is not conflict

1. A package can narrow a general term rather than contradict it. The narrower entry rests on the general one and does not displace it.
2. Example: `language` defines `actuation` as the invocation of a unit from its use site. `design-by-efferent` adds that the actuation is written before any implementation.
3. Where a package narrows a term, its entry names the general term it narrows.
4. Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason.
5. A reader must not have to work out which case an entry is. The entry says whether it narrows or replaces the general term.

# A paragraph is one line, and the reader's editor wraps it

Source: system/foundation/source/a-paragraph-is-one-line-and-the-readers-editor-wraps-it.md

1. Write each paragraph as a single line. This holds for vocabulary entries too.
2. Insert no newline to hold a column width.
3. Leave wrapping to the reader's editor, which soft-wraps to the width the reader has chosen.
4. Re-wrap nothing after an edit.

## What still stands on its own line

1. A structural element is not prose and keeps its own line.
2. Structural elements are a heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block.
3. A list item is one line, however long.
4. Fold a list item's continuation into the item rather than leaving it hanging under it.
5. Each line of the provenance footer stays its own line: `Authored by …` and every `Changed by …` beneath it.
6. Do not join the footer lines. They are a running history, and joining them would lose the record.

# A printed list of records is formatted as a table or as a list of rows

Source: system/foundation/source/a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows.md

1. When the engineer asks for a list of records, render it as a table where every field is short, and as rows where a field runs to a sentence. A table presents the fields in headed columns. Rows present one record to a line, with its fields in sequence and no columns. A list is called a table only where it is formatted as columns.
2. This applies to any record type. That includes items, implementation records, log entries, loop records, work session records, migration records, journal entries, and commits.
3. The first column is the record's handle and has no heading.
4. The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit.
5. Every column after the handle has a heading.
6. Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it. A list of items takes no SHA columns, and opens with an ordinal ahead of the handle, which the engineer refers to a row by. The ordinal counts from 1, in the order the rows are printed.
7. These two SHA columns are always present. They are not chosen per request.
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
| 2 | `2026-08-23T06-58-41Z` | Waytide for content and web | Open   |
```

9. A record that was never amended shows the same SHA in both columns. This is intended, since it shows the record has not been touched since it was written.
10. Choose the last column to fit the question.
11. A list of items or implementations takes the state as its last column.
12. A list of commits asked about for their subject widths takes the width.
13. Do not add a column nobody asked for.
14. A list of commits takes no SHA columns.

## Keep every column short

1. Keep every column short.
2. Do not put a field that runs to a sentence in a table. Present rows instead, unless the engineer asks for a table, which is then rendered in rows and columns.
3. Where a record's summary is wanted, present rows instead of a table. This is part of the rule, not a failure of it.

## What this does not reach

1. This rule does not reach the status report's tables. They stay tables, under the a-status-report-prints-a-fixed-whole-project-report rule.
2. This rule does not govern an answer that is not a list of records.
3. The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs only how a set of records is presented.

# A project declares which installed packages are active

Source: system/foundation/source/a-project-declares-which-installed-packages-are-active.md

## Declaring a set

1. A project may declare a package set.
2. The packages outside a declared set are deactivated.
3. Where no set is declared, every installed package is active, and nothing reports it.

## The record

1. A declaration is a record under `waytide/local/`.
2. Its name is the ISO-8601-UTC prefix and the declared names, hyphen-joined: `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`.
3. A new declaration writes a new record.
4. A new declaration edits no existing record.
5. At session start, read the record with the latest prefix. It holds, and the earlier ones are history.
6. Reverting is a declaration naming `default`.

## Three lines carry it

1. A record without the first two lines is not a declaration.

```
- **Package set:** content
- **Packages:** foundation, git, journal, language, versioning
- **Inactive:** design-by-efferent, testing
```

2. `**Package set:**` is what the engineer declared: a set name, package names, or both, in the grammar `install` takes.
3. `**Packages:**` is what that resolved to, recorded when declared rather than computed at session start.
4. `**Packages:**` is authoritative.
5. A package installed later is in neither line, so it stays inactive until a new declaration takes it up.
6. `**Inactive:**` is what was installed and not active then.
7. `**Inactive:**` is recorded, not inferred, so the record states the whole state it was made against.

## An include activates what it names

1. Where an active package's README includes another package, that package is active, named or not.
2. An include states a dependency, and `install` already treats it so.

## Every package is still read

1. A deactivated package's rules are read at session start like an active package's.
2. The declaration decides which rules are applied, not which are read.
3. The declaration does not narrow the unconditional read.
4. A rule that is read and withheld can be cited, weighed, and reactivated within the session.
5. `refresh-packages.sh` refreshes a deactivated package like any other, so nothing read is stale.

## What is printed

1. Print the packages at the head of the response that carries the read, because that text renders markdown.
2. The session-start notice and the startup display print none of it.
3. List every installed package, and hide none.
4. Show active packages in bold and deactivated packages in italic.
5. Follow the list with the set's name: `package set: content`.
6. Close with a count line: `(5 active of 8 installed)`.
7. The hidden-record rule does not apply, because nothing is withheld.

## When nothing is printed

1. Where no set is declared, print nothing about a set, not even a line saying so.
2. A declaration of `default` prints nothing where it deactivates nothing.
3. A declaration of `default` does print where the project holds a package that `default` does not name.

## Declaring during a session

1. A set declared during a session takes effect at the next session.
2. A declaration does not unload rules already read.
3. When the engineer declares a set, write the record.
4. Then say that the deactivated packages' rules stay in force for this session.
5. Also say that Claude must be restarted for those rules to stop applying.

# A project does not name its downstream consumers in its own files

Source: system/foundation/source/a-project-does-not-name-its-downstream-consumers-in-its-own-files.md

1. A project's own files do not name the projects that consume it.
2. This covers the installed packages under `waytide/system/`, the working state under `waytide/local/`, and the code and documentation beside them.
3. It holds for a library, a package, a rule system, or anything else other projects install.
4. A consumer is a project named only because it installed this one. That is the whole test.
5. Do not add a list of consumers for convenience.

## What it does not reach

1. The test is why the name is there, not whether the named project consumes this one.
2. A project named because a decision was about it may be named. Leave its name.
3. A project that is part of this project at large may be named, such as Waytide's `website`.
4. A reference project the method is shown through may be named, such as Waytide's `constant`.
5. Leave a historical record that already names a consumer as written. It is not revised to suit a later convention.
6. The one exception is disclosure, governed by the disclosure rule, not this one. A consumer's name already in a record is that rule's concern.
7. That correction removes the name and keeps every claim true by stating it at a lower resolution.
8. The engineer is the authority on what counts as a consumer.
9. This rule governs what is written from now on. It does not license going back through the records.

## Where the operational need goes instead

1. Where a tool must reach the consuming projects, such as to survey or refresh them, it reads per-machine configuration outside the repository.
2. That configuration lives under `~/.config/`, not in a gitignored file inside the repository.
3. Commit the tool. It names no consumer and only reads the configuration.

# A project's binding rules are recorded in its packages and its local rules directory

Source: system/foundation/source/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md

## Where binding rules live

1. The project's binding rules are read at the start of every session and followed.
2. Binding rules include naming conventions, terminology, plan-writing norms, commit conventions, and the like.
3. Binding rules live in two directories, separated by source.
4. **`waytide/system/`** holds the installed system packages, each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …).
5. Packages are installed with `git subtree` and refreshed by pulling.
6. A package's `vocabulary.md` glossary is part of its rules. Its terms are binding and cannot be applied unread.
7. **`waytide/local/rules/`** holds the project's own local rules, one per file. Every rule, system or local, is kept one per file.
8. Local rules are the project's own conventions, not installed from a package.

## Reading the rules

1. At the start of a session, run `waytide/system/foundation/load-rules.sh` and read its whole output. Follow the rules it prints.
2. Do not read a package's `source/` directory or its `README.md` at session start.
3. A package's `source/` holds its full rules, one per file. Edit a rule there.
4. A package's `rules.md`, at the package root, holds each rule's title, the path of its source, and its compressed text. `./compile.sh` writes it.
5. The package's `rules.md` is what is read.
6. The rules override default behavior where they conflict.
7. Explicit user instructions still win over the rules.
8. Read `waytide/system/foundation/` first. It defines the system.
9. Read `waytide/local/vocabulary.md` with the rules. It binds.
10. Its terms cannot be applied unread, exactly as a package's `vocabulary.md`.
11. Its terms decide over every package's terms.
12. It is not a rule and does not live in `rules/`.
13. The a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule settles where it sits and why.
14. It may not exist, and neither may `rules/`. Either absence is ordinary.

## Rules and work artifacts

1. Rules are kept separate from work artifacts.
2. `waytide/local/rules/` holds only rules. `waytide/system/` holds only the packages' rules and what packages them: each package's `README.md`, `source/`, and `LICENSE`, its `vocabulary.md` where it has one, and its scripts. Neither holds any of the project's working state.
3. The project's working state lives beside `rules/` under `waytide/local/`: `logs/` (holding `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, `migration/`.
4. Work with working state as its own conventions describe.
5. Do not read working state as binding rules at session start.
6. `waytide/local/vocabulary.md` sits beside working state but is not working state. It is read at session start and is the one thing there that binds.

## Purpose of a rule

1. A rule's package names the surface it acts on, not the purpose it serves. A rule's purpose is not confined to its category.
2. Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance. See the rules-establish-a-mindset rule.

## Format

1. A rule is frontmatter-free markdown.
2. It has a `# <title>` stating the rule, then the rule in prose, then short `**Why:**` and `**How to apply:**` lines.
3. Name a system package rule with a dash-separated, lower-case name.
4. Give a project's own local rule in `waytide/local/rules/` the ISO-8601-UTC datetime prefix in its file name. See the file-names rule.
5. Put a rule's history in a `## History` section, placed before `Related:`.
6. History is what the rule used to say, when it changed, what it was named, and where it sat.
7. The compiler leaves `## History` out of the package's rules file. The full rule in `source/` keeps it.
8. Reasoning the directive depends on is not history, even where it tells what failed before. Keep it in the body, where the `**Why:**` passage is.
9. A paragraph leads with its claim in bold. The sentences after it support that claim.
10. Where the support runs past six sentences, the next paragraph carries no bold lead. The absence marks it as continuation, not a new claim.
11. The six-sentence limit is STE Rule 6.6. See the language package's waytide-prose-conforms-to-the-ste-writing-rules rule.

## Recording a new local rule

1. When the user states a rule, or a decision sets a rule for future work, add it as a new file in `waytide/local/rules/`.
2. Add a matching one-line entry to `waytide/local/logs/log/`.
3. Edit a rule that belongs to a system package in that package and re-publish it. Do not add it to `waytide/local/rules/`.
4. When the project settles a term or a substitution of its own, write it in `waytide/local/vocabulary.md`. Do not write it as a rule.
5. Prefer an observation over a rule when the thinking has not stabilized. See the observations rule.

## Referencing a rule

1. Reference a rule by its name, never by its file path.
2. Write "the a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context rule", not `waytide/system/testing/a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context.md`.
3. Rename a rule when its name stops saying what it says. Its filename changes with it, so a recorded path then points at nothing.

## Removing a rule

1. Search for what cites the rule, and reconcile the live artifacts that cite it.
2. Then remove the rule and log the removal.
3. Where the rule is stopped rather than superseded, tag its log entry `[suspended]`.
4. In a `[suspended]` entry, name what the suspension cost and what else changed. See the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule.
5. Drop a removed rule from every `Related:` list. Do not mark it, such as with `(deleted)`.
6. The log entry is the durable trace of the removal. An item is never deleted. Its state changes and its record is kept.

# A project's durable context is recorded in its committed artifacts, never in an agent memory store

Source: system/foundation/source/a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store.md

1. Write every piece of context meant to survive a session into `waytide/`.
2. The rules bind that context, the working directories hold it, and git carries it.
3. An agent memory store is not one of those places.
4. Do not hold in a store anything that belongs in one of those places.
5. A binding convention is a rule in `waytide/local/rules/`.
6. A decision is a one-line entry in `waytide/local/logs/log/`.
7. Thinking that has not stabilized is an observation in `waytide/local/items/`.
8. The project's planning goes in an item.
9. Postponed work is a deferred item.
10. What the project stopped doing is suspended.
11. Each artifact follows its own convention.
12. A note on how the project's code is arranged belongs in an artifact. So does what was decided last week, or which approach was rejected.
13. Do not create an agent memory store.

## What it does not reach

1. A fact about the engineer rather than the project is outside this rule.
2. How the engineer wants to be answered, and what they want never offered, are such facts.
3. A machine-scoped fact goes to per-machine configuration under `~/.config/`, outside any repository, per the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule.
4. A preference not yet settled as a rule is outside this rule.
5. Ask about such a preference at once, per the ask-at-once-when-the-engineer-expresses-a-preference rule, rather than holding it.
6. The harness's own working state is outside this rule. That is a cache, a transcript, or an index of the repository.
7. Harness working state is not project context and is no substitute for an artifact.

# A record carrying a state line ends its filename with the state in upper case

Source: system/foundation/source/a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case.md

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
7. An observation's suffix is always `-STATED`.
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
7. Leave historical records as written. A reader following an unresolvable path uses git.

# A record may be tagged with square-bracket tags

Source: system/foundation/source/a-record-may-be-categorized-with-square-bracket-tags.md

1. Any record may carry tags, such as `[idea]`.
2. Put them on a `**Tags:**` line at the head of the record, after `**State:**` where there is one: `**Tags:** [idea] [decision]`.
3. To tag one list item, prefix it: `- [idea] My idea`.
4. Write a tag lower-case in square brackets, with dashes between words: `[legal-matter]`.
5. Tags are optional and freeform. Add one when it is useful.
6. Nothing checks tags, and there is no fixed list.
7. Some tags have lifecycle states, such as `[experiment]`, `[feature]`, `[observation]`, and `[work-item]`. Each one's own rule states its states.

# A rule's compressed text is written in its source, checked against it, and its figures recorded below the body

Source: system/foundation/source/a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body.md

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
7. `./compile.sh` writes each package's `rules.md`, at the package root, holding every rule in its `source/`: each rule's title, a `Source:` line with its source path, and its compressed text, or its body where it has none.
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
4. A **compressed** line gives the compression, the change, the solubility and the clarity score before and after, and the directive counts: how many, and how many kept, less precise, and lost.
5. A **revised** line gives the solubility and the clarity score before and after, and the directive counts of the check that followed.
6. A **re-checked** line gives the directive counts and the number of repairs.
7. Name restorations, where a compression put back text it had dropped, on the line of the event that made them.
8. Leave out a figure that was not measured. Do not estimate it.
9. Compression is the share of the body's characters the compressed text removes.
10. Change is the share of the body's words removed, added, or replaced, from a word-level comparison of the body and the compressed text.
11. Clarity score is 1 − unclarity. Unclarity is the mean of six ranks among the compiled rules: average sentence length, share of sentences over 25 words, and history words, asides, citations, and negations per sentence.
12. Solubility is (1 − the mean of the size rank and the unclarity) × 100, as a whole number. Higher is easier to process.
13. Take the ranks against the compiled rules at commit `770c7eb`, so later figures compare with earlier ones. The rule-reduction experiment's record, `2026-10-22T04-51-25Z-rule-reduction`, sets out each measure.
14. The process that compresses, revises, or checks the text writes the figures, in the same commit.
15. The package's rules file carries no figures. They stay in the source.

# A status report prints a fixed whole-project report

Source: system/foundation/source/a-status-report-prints-a-fixed-whole-project-report.md

1. When the user asks for a **status report** (or "project status"), produce a report with the five parts below, in order.
2. The report reads the project's planning records. These are the items that carry the work's tasks, whatever the project's kind tags name them.
3. Identify those records without naming a directory or a kind.
4. Part 1, **Task table**: the tasks those records carry, as a table of number, task, status (done / next / pending), and a terse note.
5. Mark the next task in the task table.
6. Include any out-of-sequence extras already built in the task table.
7. Part 2, **Waiting work table**: the items carrying a `**Waits for:**` line, with name, date, what it waits for, and a one-line gist.
8. Waiting items are off the task line until the wait ends.
9. Order waiting items by their `**Priority:**` rank where they carry one.
10. Do not list a hidden record in the waiting work table.
11. Part 3, **Waytide-directory orientation**: a basic map of `waytide/`.
12. The map shows that `waytide/system/` holds the installed rule packages (e.g. `foundation/`, `language/`).
13. The map shows that `waytide/local/rules/` holds the project's own local rules.
14. The map states that both are binding and both are read at session start.
15. The map shows the contemporaneous, historical records under `logs/` (`log/`, `loops/`, `work-sessions/`), alongside `rules/` under `waytide/local/`.
16. The map shows the work-artifact directories `items/`, `implementations/`, and `migration/`, also under `waytide/local/`.
17. The orientation says how to work with the directory. Rules are enforceable conventions.
18. The log is title-only ISO-8601-UTC decision entries.
19. A rule typically pairs with a log entry.
20. An item holds the task checklist where it sequences work.
21. A `**Waits for:**` line marks work that is not yet actionable.
22. Part 4, **Recent flows of work**: a brief of the recent direction, drawn from the latest log and commit entries.
23. Keep the brief to a few lines, not an exhaustive list.
24. Part 5, **Test suite**: this part is convention-aware of the testing package.
25. If the project has adopted the testing conventions, run the suite and report the count and pass/fail line.
26. Report the suite's context tree two levels deep, rendered hierarchically.
27. Each distinct top-level context is a tree root. Its distinct second-level contexts are indented as its branches.
28. Use an indented tree, such as a fenced block with `├─`/`└─` branches.
29. Stop at two levels. Do not descend into per-assertion contexts.
30. If the project has not adopted the testing conventions, degrade this part. Report whatever suite the project has, with its count and pass/fail.
31. If the project has no suite, note that there is none.

## A hidden record is counted rather than listed

1. A hidden record is one a report states the number of and does not otherwise show.
2. Omit a hidden record from the table or passage it would ordinarily sit in.
3. Put a line there giving the count and the kind.
4. The line says no more than that. It carries no *not listed*, no *withheld*, and no explanation.

```
3 suspended items
12 suspension log entries
```

5. Hiding applies to any summary of the project's state, not only the fixed status report.
6. That includes the *Recent flows of work* brief in part 4 and any ad-hoc account of where things stand.
7. A record hidden from one surface is hidden from all of them.
8. Two kinds are hidden today.
9. A record whose `**State:**` line reads `Suspended` is hidden.
10. A record carrying the `[suspended]` tag is hidden. That is a log entry, per the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule.
11. The two are different records, hidden for the same reason, and take the same treatment. Do not merge them.
12. A later rule may name another kind, and it becomes hidden by saying so.
13. The treatment is fixed: counted, not listed, and named by kind in the count.
14. Show hidden records when they are asked for.
15. *Include the suspended items*, *show what is hidden*, or a request for a suspended record by name each produce the full listing.
16. Never simply drop a hidden record. The count is what separates hiding from omitting.

## The report is rendered from current state

1. Keep each part tight.
2. Read current state before printing.
3. Do not report stale task counts, suite numbers, contexts, or deferred items from memory.
4. Render the parts from current files: the project's items, `waytide/local/logs/log/`, and git.
5. Confirm the suite count and the two-level context tree by running the suite, not by asserting them.
6. Take the two levels from the run's output, not from the `context "…"` declarations in the source.
7. A dynamic context reads as a placeholder in the source, and as its real value in a run.
8. An unnamed test appears in the source and emits no line.

# A suspension is a log entry tagged `[suspended]`, and nothing is moved

Source: system/foundation/source/a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved.md

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
4. For example, removing a rule means dropping it from the `Related:` lists that cite it and from the package README's summary, per the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule.
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

# A time value carries minutes and seconds

Source: system/foundation/source/a-time-value-carries-minutes-and-seconds.md

1. When a datetime written into a file includes a time of day, write that time to seconds.
2. Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`.
3. This rule governs only the time's resolution.
4. The convention that specifies the datetime settles the preceding fields, local versus UTC, and punctuation.
5. The ISO-8601-UTC filename prefix, `2026-07-01T20-40-00Z-some-name.md`, already carries seconds (see the file-names rule).
6. The provenance footer, `Mon Jan 1 2026 at 3:45:12 PM PT`, carries seconds because this rule requires it.
7. A date alone is not a time. A date-only convention, such as a design's **Settled** resolutions, gets no time added.
8. This rule applies only when a time is written.
9. A record's title is the first exception. A dated record title is written `Mon Jan 1 2026 18:06`: 24-hour, minutes, no seconds (see the a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time rule).
10. The title exception covers titles only. It reaches no other written time.
11. A journal entry's filename stamp is the second exception. It stops at the minute (see the `journal` package's journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry rule).
12. A journal filename stamp carries seconds only where the writer stated seconds. Do not supply a clock's seconds.
13. Only these two exceptions exist. Do not assume a third.
14. A format that wants a further exception must state its own case in its own rule. It must argue from what this rule's defect does not reach. The defect is a repeated line within one file, whose entries collide at the same resolution.
15. Never revise a recorded datetime to a resolution it never had, and do not supply minutes or seconds for a past event. Supplying missing minutes or seconds would falsify the record.
16. This rule applies to new values only. Leave coarser values already written as they are.
17. When specifying a new datetime format that includes a time of day, specify it to seconds.
18. This applies to rules, working-state artifacts, log entries, and any other file, except where this rule names an exception.

# A vocabulary entry says what a term means, not what it was or where to read more

Source: system/foundation/source/a-vocabulary-entry-says-what-a-term-means-not-what-it-was-or-where-to-read-more.md

1. A vocabulary entry states the term's current meaning and stops there.
2. Write the entry in the present tense, saying what the term means now.
3. Give the STE note, the category, and any distinction against a neighbouring term.
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
2. A discontinuation, under the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule's own heading, is not an exception.
3. A discontinuation entry names the word and says it is not used.
4. It does not narrate when the word was dropped or what carried it before.

# An implementation runs on a branch to a declared end

Source: system/foundation/source/an-implementation-runs-on-a-branch-to-a-declared-end.md

1. An implementation runs on its own branch, designed through the five hinges by DBE, to a declared state.
2. It is never left silently open.
3. Its tag decides the parts that differ.
4. An `[experiment]` is built to a question, and a `[feature]` to an intent (see the the-implementations-directory-holds-one-record-per-implementation rule).
5. A clause below names a kind only because of that difference. Every other clause holds for both.

## The branch

1. Name it `experiment/<subject>` or `feature/<subject>`, matching the tag.
2. The subject is short, lower-case, and dash-separated, and names literally what is tested or built.
3. Add `-run-<n>` only where an experiment has more than one run.
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

1. An experiment may run in phases, each a question that serves the experiment's.
2. The record names the phases and their order at the start.
3. The record states each phase's forecast before its work.
4. A phase's branch is the experiment's branch, a dot, and the phase's name: `experiment/rule-reduction.flattening`.
5. Git refuses a slash here, because no branch can sit beneath another branch's name.
6. A `worktree/` segment carries into each phase's name.
7. A phase branches from the experiment's branch and concludes into it.
8. A phase is affirmed, refuted, or inconclusive only on the engineer's declaration.
9. An affirmed phase merges back into the experiment's branch.
10. The record carries each phase's verdict and findings.
11. One phase runs at a time, in the record's order, each from the experiment's branch as the earlier phases left it.
12. A phase merges nowhere else.
13. The experiment concludes after its phases, and only then merges to its upstream branch.

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

3. Offer the current branch for a feature only.
4. An experiment's changes must not reach the branch it deviates from before it is affirmed, and its own branch is what keeps them out.
5. A feature is the main line.
6. Offer the current branch last, because a first option reads as recommended, and the current branch gives up isolation.
7. When offering it, state its cost plainly: there is no isolation, partial work sits where others read, and abandoning means reverting rather than deleting a branch.
8. On the current branch, the record still carries the intent, the state, and the confirmations.
9. Place a worktree beside the repository directory, named `<repository-name>-<branch, each slash as a dash>`, as in `waytide-experiment-state-suffix-legibility`.
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

## The end

1. Every implementation ends in a declared state, or is suspended, which pauses it.
2. The words are the the-implementations-directory-holds-one-record-per-implementation rule's.
3. An `[experiment]` is affirmed only on the engineer's explicit declaration.
4. On affirmation, its log is copied into the project log.
5. Where it produced implementation, its branch merges to the upstream branch, after the tests pass.
6. Where no test covers the work, the merge also waits for specific confirmation.
7. An observation-only experiment's affirmation is the log copy alone.
8. An `[experiment]` that will merge brings what master needs to conform to it: every rule its practice needs, and every other change, on its branch before it merges.
9. A `[feature]` merges with no gate, because every commit was verified under the run-the-test-suite-after-changes-before-considering-whether-to-commit rule.
10. The merged result can still break the suite, and that is fixed from there.
11. A feature has no affirmation.
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

## The agent never raises the end of an `[experiment]`

1. Do not offer to conclude, affirm, refute, or merge one: not as a next step, an option, or a precondition.
2. The precondition is the form that slips through, as in *this cannot be published until it merges*.
3. Report what is settled and what is open, and stop.
4. An experiment's length is the engineer's judgment, not readable from the work done.
5. A `[feature]` is not covered, because its completion is ordinary.

## Drift

1. While an `[experiment]` is open under branch only, watch for main-sequence work starting, and surface it.
2. Offer two recourses through the selection interface: suspend the experiment, where the intent is to stop working it for now, or add a worktree, where the intent is to keep working it alongside.
3. Neither recourse ends the experiment, and the engineer's intent decides.
4. The watch rests on the branch name in the status line and on a judgment of whether the work answers the recorded question.
5. The watch is a practice, not a guarantee.
6. Under a worktree there is nothing to watch.
7. The session-start notice reports every implementation not concluded.
8. A `[feature]` has no watch, since starting other work during one is ordinary.
9. A forgotten feature is reported by the same notice.

# An item that sequences work contains no code samples

Source: system/foundation/source/an-item-that-sequences-work-contains-no-code-samples.md

1. An item in `waytide/local/items/` that sequences work must never contain code samples, whatever its tags name it.
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

# An observation is a working hypothesis whose one state, Stated, never changes

Source: system/foundation/source/an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes.md

Lines 1–6 below are the opening statements, which come before any section heading.

1. `waytide/local/items/` holds working hypotheses, definitions, and methods that are not yet binding.
2. They are rule-candidates surfaced during open-ended discovery, before the thinking has stabilized.
3. They are not read as binding at session start, the way rules are.
4. An observation lives in `waytide/local/items/`.
5. An observation is tagged `[observation]`.
6. The tag is what makes a record an observation.

## `Stated` is an observation's only state, and it never changes

1. An observation carries `**State:** Stated` from the moment it is written.
2. It keeps that state for the rest of its life.
3. Its filename ends `-STATED`.
4. It carries no `**Why this state:**` line.
5. An observation has no lifecycle.
6. It is never realized, abandoned, lapsed, superseded, or suspended.
7. An observation that no longer holds is not retracted.
8. A later observation states the later thinking.
9. The earlier observation stays as what was thought at the time.
10. Promotion is not a state change.
11. When an observation stabilizes into a binding convention, write the rule in `waytide/local/rules/`.
12. When the rule is written, the observation takes one added line naming it, `**Promoted to:** the <name> rule`, under its `**Tags:**` line. The rule is its result. Everything else stays as it is, as the discovery record.
13. The the-items-directory-holds-one-file-per-item rule needs no exception, because an observation also carries a state from the moment it is written. Its state is fixed, not absent.

## The shape

1. **When to use:** use an observation for material worth keeping that is still under active discovery.
2. Also use one for a method or definition the engineer has not ratified as a convention.
3. When in doubt between a rule and an observation, prefer an observation.
4. **Format:** use the same frontmatter-free markdown as rules.
5. The file starts with a `# <title>`, then a `**State:** Stated` line.
6. Next comes a `**Tags:**` line carrying `[observation]`, then the content in prose.
7. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
8. The filename ends `-STATED`.
9. **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
10. **Promotion:** write the rule in `waytide/local/rules/`.
11. Name the observation in the rule, and add the `**Promoted to:**` line to the observation.
12. Add a `waytide/local/logs/log/` entry for the promotion.
13. Leave the rest of the observation as written.
14. **Recording one:** add the file.
15. Add a matching one-line entry to `waytide/local/logs/log/`.
16. The entry notes that it was recorded as an observation, and why it is not yet a rule.
17. Never change an observation's state.
18. Where the thinking moves, write a later observation and leave the earlier one as written.

# Ask at once when the engineer expresses a preference

Source: system/foundation/source/ask-at-once-when-the-engineer-expresses-a-preference.md

1. When the engineer expresses a preference about how the work is done, interrupt the work and ask what it changes, through the selection interface.
2. Do not carry the preference silently, and do not put the question off.
3. Where the preference corrects what the agent just did, fix the output as well.
4. A preference is not a rule until it is written. Held by the agent, it is lost at the session boundary.

## What counts

1. A statement about how the work is done, rather than about the artifact at hand, is a preference. *Answer in lists*, *never offer to conclude an experiment*, and *say writer rather than user* are each one.
2. A statement about this one artifact, such as *make that sentence shorter*, is an instruction. Carry it out, and do not ask about it.
3. The test is whether it would still hold next week. Where it would, it is a candidate for a rule. Where it would not, it is an instruction and nothing is asked.

## The candidates

1. Each candidate is genuine, and the selection carries only those that apply.
2. An amendment to an existing rule, offered only where a rule covers the subject. It is made in that rule's source, with its History.
3. A new rule in `waytide/local/rules/`, written with its `waytide/local/logs/log/` entry.
4. An observation in `waytide/local/items/`, where the thinking has not stabilized. It is preferred where there is doubt.
5. Neither, where the engineer does not want the preference recorded. It is taken without argument.
6. Do not ask again in the same session about a preference the engineer declined to record.
7. Record the engineer's own words, not a paraphrase or the agent's reading of them from memory.
8. Deferring is the engineer's choice, not the agent's. Work they want put off, a correction or anything else, they record as an idea.
9. The agent does not put off a preference, or the question about it, on its own.

# Dated artifacts are prefixed with an ISO 8601 UTC datetime, and system rules are not

Source: system/foundation/source/dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not.md

## What takes the prefix
1. A dated artifact takes the datetime prefix. A dated artifact is something a project accrues over time, ordered by when it was made.
2. The contemporaneous, historical records under `logs/` take it: the log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/`.
3. The work-artifact directories `items/`, `implementations/`, and `migration/` take it.
4. A consuming project's own local rules, the ones it adds to its `waytide/local/rules/`, take it. A local rule is a dated decision in that project's history.
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
4. A project's own `waytide/local/vocabulary.md` takes no prefix. It is a structural file, not a dated entry. See the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule.

# Disclosure is the one reason to edit a historical record

Source: system/foundation/source/disclosure-is-the-one-reason-to-edit-a-historical-record.md

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

# Present every prompt to the engineer through the selection UI

Source: system/foundation/source/present-every-prompt-to-the-engineer-through-the-selection-ui.md

1. Every time you prompt the engineer for a selection, a decision, or an answer, present it through the selection UI, the `AskUserQuestion` tool.
2. This holds for any prompt.
3. Never use a prose question or a hand-typed list.
4. Each genuine candidate is an option.
5. Do not add a free-text option of your own, such as "Chat about this".
6. The UI's built-in **"Other"** answer is how the engineer answers outside the option set. A closed list must never foreclose an answer only the engineer can produce.
7. Offer an `Explain` option on every prompt, not only where you judge the question hard.
8. `Explain` is not a free-text option. It lets the engineer ask what the question means before answering.
9. When `Explain` is selected, answer with a summary at the top, followed by a normal level of explanation.
10. That explanation must not restate the options or repeat the same framing.
11. Then display the same selection prompt again, with every other option unchanged.
12. On that second display, `Explain` is replaced by **`Explain briefly`**.
13. When `Explain briefly` is selected, answer with the summary alone: the shortest statement of what the question decides, with nothing under it.
14. Then display the prompt again, still carrying `Explain briefly`.
15. Do not invent a further variant. The option does not change again, however many times it is selected.
16. Word `Explain`'s description as *…then display this selection prompt again*.
17. Never word a description as *put this question again*.
18. `Explain briefly`'s description states its length: *…in a sentence or two, then display this selection prompt again*.
19. `Explain` takes one of the UI's four option slots, which leaves three for genuine candidates.
20. Where there are more than three genuine candidates, the question says so and directs the engineer to `Explain` to see them all. The first display carries three and `Explain`. The `Explain` answer gives every candidate. The prompt then shows the same three and `Explain briefly`, and a candidate beyond the third is chosen through the built-in "Other" answer.
21. Place `Explain` among the supplied options. Its position relative to the built-in free-text answer is not yours to choose, since the harness renders that answer last.
22. The UI requires at least two options. Do not invent an option to reach that floor.
23. Present every genuine candidate you find.
24. Where you find only one, the second option is `Explain`, an account of that candidate.
25. Do not search for options just to fill the second place.
26. Do not say that a lone candidate is the only possibility.
27. This applies whenever you would ask the engineer to decide or answer. That includes a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations.
28. Keep plain prose for statements, reports, and explanations that do not ask the engineer to choose.

# Record a rule's authorship in a provenance footer

Source: system/foundation/source/record-a-rules-authorship-in-a-provenance-footer.md

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

# The harness announces Waytide's installation, and the agent never prints the notice

Source: system/foundation/source/the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice.md

1. The harness announces Waytide, through three surfaces it renders.
2. The agent prints no notice, at session start or at any other time.
3. An agent-printed copy would only duplicate the harness's.
4. The one thing the agent prints at the start is the package set stanza, where a project shows one, because it needs markdown.

## The session-start notice

1. A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice:

```
Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git
3 implementations open: gate-forecasting (no state recorded), shipped-test-tree-script (suspended), upload-retries (suspended)

Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.

To load them now, type: load waytide.
```

2. The install line enumerates what is on disk.
3. A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it.
4. Nothing prints a fixed list.
5. The open line names experiments and features that have not concluded, read from each record's `**State:**` line under `waytide/local/implementations/`.
6. An experiment that is Affirmed, Refuted, Inconclusive, Abandoned, or Superseded has concluded.
7. A feature that is Completed, Abandoned, or Superseded has concluded.
8. One that is Active, Suspended, or carries no state line is reported.
9. With nothing open, the open line is absent.
10. The open line exists because an experiment must never be left silently open. One worked in a worktree leaves no trace in the main working tree.
11. The close is always present: the caveat, then the command on a line of its own, last.
12. A blank line precedes the close, after any open line, because the close asks and everything above it reports.
13. A second blank line stands the command alone, so it is read and copied without reading past anything.
14. The caveat says `a few moments`, because the read is a wait an engineer sees.
15. The command names the read outright, so an engineer new to the system can act on it.
16. Something the engineer types is required in any case, since the agent produces nothing until the engineer speaks.
17. This gives up a contentless foil word whose only effect came through the hook's channel. So that channel is no longer testable from ordinary use.
18. The trade of observability for legibility is deliberate.
19. The notice says `installed`, never `loaded`.
20. A hook runs before the session. It can observe that the packages are on disk and the configuration is live, and not that any rule was read.
21. The close's `are loaded` describes what the session does next, and reports no read.
22. Call it the session-start notice, not the load notice.
23. The status line reports the system active, a claim about the configuration rather than the agent.
24. The notice is plain text. The harness renders `systemMessage` literally, so markup reaches the engineer as punctuation.
25. The notice carries no mark. The startup display prints it (see the the-startup-display-prints-once-per-session rule).
26. Put no quotation marks, and no lone backslash, in anything the hook emits.
27. `printf` interpolates the notice and the instruction into a JSON string with no escaping.
28. A double quote ends the string, and a lone backslash begins an invalid escape.
29. Either way the harness fails to parse the output, and the notice disappears with no error.

## The read instruction

1. The same hook carries the read instruction to the agent on a separate channel.
2. The notice goes in `systemMessage`, for the engineer.
3. The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent and is never displayed.
4. They are different texts for different readers.
5. The read is unconditional. The apparent size of the first request is not a reason to defer it.
6. A session opened with a one-line request once skipped the read. It grew into rule edits and publishes governed by rules never read.
7. The hook carries the whole instruction, as the following points state.
8. Read `foundation/` first, and each package's `vocabulary.md`.
9. Run `foundation/load-rules.sh` in one command and read its whole output. It prints each package's `rules.md` and `vocabulary.md`, leaving out each package's `source/` directory and `README.md`. Read no rule file one by one.
10. Read the project's `local/rules/` and `local/vocabulary.md`, and never name `local/` as a whole.
11. Each is named whether or not it exists, and its absence is ordinary.
12. Name the other working directories and leave them out.
13. Do not print the startup display.
14. Print no package count.
15. Then wait for the engineer's request.
16. `load waytide` asks for exactly that read and nothing more. It is worded the same in the notice and the instruction.
17. This rule does not restate the directory list.
18. `session-start.sh` is the only place the list is enumerated, since a second copy drifted once.
19. The mark's art is not carried on this channel. The display hook reads it from the the-startup-display-prints-once-per-session rule.
20. Nothing verifies the read. The hook cannot observe what the agent does.
21. The instruction removes one excuse: an instruction buried in a file the agent may not open.
22. Instructing is not vouching: the notice still reports nothing about whether the agent read the rules.
23. The work honoring the rules is the verification.

## The status line

1. `waytide/system/foundation/statusline.sh` keeps the system's presence on screen all session:

```
waytide · master :: Waytide
waytide · master · uncommitted changes · untracked files · unpushed commits :: Waytide
```

2. The repository name leads, in bold. The bold is a terminal escape sequence the harness passes through.
3. The bold repository name is the only emphasis on the line.
4. A middle dot separates the engineer's segments.
5. The Waytide segment trails after a double colon, which separates and does nothing else. So the segment reads as an annotation on the line.
6. The Waytide segment is one word, with no package count.
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

1. When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`.
2. It prints the title, the copyright and license, the loading line, and the figure, read from the the-startup-display-prints-once-per-session rule.
3. It prints them once, on that command only.
4. The agent does not print it.

## Wiring

1. A committed `.claude/settings.json` wires the three surfaces.
2. `install.sh` places it in a consuming project.
3. `install.sh` warns when git ignores `.claude/settings.json` and the file is not tracked, and prints how to correct it.
4. The fix is `.claude/*` with `!.claude/settings.json`, since git cannot re-include a file inside an excluded directory.
5. The fix keeps `.claude/settings.local.json` ignored.
6. A project-level `statusLine` replaces the engineer's own, so the script renders the directory and branch too.
7. `install.sh` never merges into an existing `.claude/settings.json`. It prints the block and leaves the decision to the engineer.

## There is no opt-out

1. These surfaces exist so that a system read every session says so.
2. The read instruction is emitted every session. Quieting a display never disables the mechanism that carries it.

## What this costs

1. The mechanism works only where a harness reads `.claude/settings.json`.
2. Elsewhere the system loads through the `AGENTS.md` bootstrap, silently.
3. A setting that disables hooks silences it too.
4. A newly placed `.claude/settings.json` may not take effect until the harness reloads.

# The implementations directory holds one record per implementation

Source: system/foundation/source/the-implementations-directory-holds-one-record-per-implementation.md

1. `waytide/local/implementations/` holds implementation records, one file per implementation.
2. A record carries how the implementation began, where it is being worked, and what became of it.
3. An implementation is a bounded unit of work with a lifecycle.
4. The record is a persisted, dated artifact, kept after the implementation concludes.
5. An experiment is tagged `[experiment]` and is built to a question.
6. A feature is tagged `[feature]` and is built to an intent.
7. These are ordinary square-bracket tags (see the a-record-may-be-categorized-with-square-bracket-tags rule).
8. The lifecycle turns on which one a record carries.
9. A question is forecast and reaches a verdict. An intent is not forecast and reaches no verdict.
10. Every difference between the two kinds follows from that one difference, and from nothing else.

## The record

1. Open with the **Question** or the **Intent**.
2. Then give the setup: a `**State:**` line, the upstream branch it merges into, the implementation branch, its base, and the working location chosen at the start.
3. The upstream branch is `master` or another topic branch.
4. The setup also includes a `**Tags:**` line carrying `[experiment]` or `[feature]`.
5. An `[experiment]` states a forecast of what is expected to happen, before the work.
6. As the work proceeds, an experiment records what actually happened against the forecast.
7. An experiment then records the findings and any post-hoc misses, including outcomes the forecast did not account for.
8. A `[feature]` states no forecast, no comparison against one, and no findings or misses.
9. Both kinds record the confirmations the lifecycle required, so the work's authority is auditable.
10. Both record these confirmations: the working-location selection at the start, and the attended-or-unattended selection at the start.
11. Both also record these: adding a worktree to work already under way, and branch deletion with worktree removal.
12. An experiment also records the confirmations of the affirmation declaration, concluding a superseded experiment, and merging untested code.

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
10. The state words both kinds take are these.
    - **Active**: the work is in progress.
    - **Abandoned**: dropped before concluding. It is not merged, and the record is kept.
    - **Superseded**: replaced by another implementation. Each of the two records names its counterpart.
    - **Suspended**: paused, not ended.
11. The words only an `[experiment]` takes are these, since each judges a question.
    - **Affirmed**: the question held. The user declares it.
    - **Refuted**: the question was disproven.
    - **Inconclusive**: it ran and gave no clear verdict either way.
12. The word only a `[feature]` takes is this.
    - **Completed**: integrated into the upstream branch. It is the ordinary conclusion.
13. A feature takes no verdict word, and an experiment takes no `Completed`. Neither is an oversight.

## Runs

1. Runs are optional.
2. Only an experiment has runs. A feature has none.
3. Split an implementation into runs only when the question is held fixed and one factor is varied to compare.
4. Each run is its own branch from the same base.
5. Each run carries its own forecast.
6. Runs are titled `Run 1`, `Run 2`, and so on.
7. A run is a deliberate variation, not a retry.

## It is the lifecycle record, not the design record

1. The same work's design belongs in a loop record under `waytide/local/logs/loops/`.
2. A loop record holds each cycle's hinge, the options put to the engineer, and the decision.
3. The implementation record and the loop record divide by concern. Each names the other.
4. Keep them as separate files. `waytide/local/logs/loops/` belongs to `design-by-efferent`, which includes `foundation`, not the reverse.
5. A foundation rule must not require fields in that directory. That dependency is refused.
6. Naming the loop record in prose is a citation and is permitted. It is the only reference permitted.

## Format

1. Use the same frontmatter-free markdown as rules: a title, then prose and tables.
2. The title is `# Experiment — <name>` or `# Feature — <name>`.
3. The kind reads in the title and is stated as data in the `**Tags:**` line.
4. The lifecycle reads the tag, not the title.
5. A record whose title and tag name different kinds is defective.
6. The filename takes the ISO-8601-UTC prefix (see the file-names rule).
7. The filename also takes the state suffix.
8. End the file with the provenance footer.
9. Pair the record with a log entry (see the a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged rule).

# The items directory holds one file per item

Source: system/foundation/source/the-items-directory-holds-one-file-per-item.md

1. `waytide/local/items/` holds the project's items, one file per item. Every record there is an item, and only an item.
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
20. `[observation]` and `[work-item]` mean what their rules say: the observations rule, and the work-item section below.
21. An item may carry two optional lines, `**Waits for:**` and `**Priority:**`, and most items carry neither.
22. `**Waits for:**` states what must finish before the item is actionable, and nothing more.
23. `**Priority:** N`, written as `- **Priority:** 3`, ranks the item from 1 to N, contiguous, one item to a number.
24. Rank 1 is worked next among the actionable items.
25. Ranking an item renumbers those below it. The several files that changes are the accepted cost.
26. A rank does not clear a wait.
27. Nothing derives from either line.
28. An item's content is point-in-time.
29. A reference in an item that time has overtaken is not a defect.
30. Do not chase such a reference.
31. Every item carries a `**State:**` line from the moment it is written, holding one of the words below and no other. Absence is not a state, and an item without the line is a defect.
32. **Open** — the work has not started. Start every item but an observation **Open**, whether its thinking is settled or not.
33. Make an item **Active** when its work starts. **Active** is the in-progress state.
34. An observation, and only an observation, starts and stays **Stated**.
35. **Realized** — what it describes exists.
36. **Deferred** — kept deliberately, with no date and no one working toward it.
37. An item merely waiting its turn is not **Deferred**. It carries `**Waits for:**` and whatever state its thinking has reached.
38. **Suspended** — paused, not ended.
39. **Superseded** — a later item replaced it, and the two name each other.
40. **Abandoned** — dropped by decision.
41. **Lapsed** — it lost its relevance over time, as the work moved past it with no one deciding. Where a decision dropped it, it is **Abandoned**.
42. Take `Realized`, `Deferred`, and `Open` back to `Active` or `Open` when the work resumes. The other states are not taken back. Conclude an item whose work is done on an experiment's branch when the work is done, as `Realized`, or `Done` for a work item. Do not wait for the merge, and name the branch.
43. At each change of state, change the `**State:**` line and rename the file.
44. At each change of state, write the log entry.
45. A work item, tagged `[work-item]`, is a piece of work to be done.
46. A work item takes `Open`, `Active`, `Deferred`, and `Suspended`.
47. A work item concludes `Done`, `Abandoned`, or `Superseded`.
48. A work item never takes `Realized` or `Lapsed`.
49. Take `Done` back to `Active` when the work reopens.
50. Supersede an item rather than rewrite it.
51. What a superseded item settled stays as written.
52. Amend an item by dated addition.
53. When amending, keep an outdated resolution's date and wording, and state what changed in a later resolution.
54. Answer a question that runs against what an item settled, and record the change.
55. Do not refuse to answer until the item is amended.
56. Reconcile a settled item against later work.
57. Never regenerate a settled item from later work. Where one item names another as what it realizes, the named item is the source of truth.

# The log holds one file per entry, with a one-line title

Source: system/foundation/source/the-log-holds-one-file-per-entry-with-a-one-line-title.md

1. Record each decision made during a session as its own file in `waytide/local/logs/log/`.
2. Write one file per entry.
3. Give each entry a one-line title.

## Trigger

1. Write an entry whenever a real decision is made.
2. A real decision is the user picking among alternatives, accepting or rejecting an approach, or setting a rule that will guide future work.
3. Do not wait to be asked.
4. When in doubt, log it.

## Filename

1. Use the ISO-8601-UTC prefix convention of the file-names rule.
2. Compute the prefix with `date -u +%Y-%m-%dT%H-%M-%SZ`.
3. Use UTC, never local time.

## Content

1. Start the entry with a `# <title>` that states the decision.
2. Keep the title informative enough to skim.
3. One line is the ordinary case.
4. An entry takes a body only where it carries reasoning that will not fit a title.
5. An abandonment takes a body, giving the reason the work stopped.
6. A body is prose under the title, with no template.
7. A body never holds the work that did not happen, per the the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done rule.
8. An entry that carries tags takes a `**Tags:**` line under the title, separated by a blank line, per the a-record-may-be-categorized-with-square-bracket-tags rule.
9. An untagged entry with no body is one line.
10. A log entry takes no provenance footer.
11. It is exempt from the working-state-artifacts-carry-a-provenance-footer rule, since its filename and commit already carry author and time.

## Commit

1. Commit a log entry in the same commit as the change it describes, or separately with a `Log:` prefix.
2. Do not hold entries uncommitted.

## Consolidation

1. Never consolidate the log on your own initiative.
2. Do not combine, merge, rewrite, or reformat log files. Treat the log as an append-only record of what was decided and when.
3. Do not propose doing so.
4. Consolidate only on the user's explicit command, and only after it is confirmed with the project's stakeholders.
5. For a readable overview, generate a summary of the log at read time instead.
6. Never write that summary to a file.
7. Give it in the response instead.

# The log records why work was abandoned, and never says undone work was done

Source: system/foundation/source/the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done.md

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

1. `waytide/local/logs/` holds the project's contemporaneous, historical records, together. Every record here takes the ISO-8601-UTC prefix of the file-names rule.
2. `waytide/local/logs/log/` holds the log, one file per entry, with a one-line title (`the-log-holds-one-file-per-entry-with-a-one-line-title`).
3. `waytide/local/logs/loops/` holds the loop records, one file per feature, recording the cycles through the loop (`design-by-efferent`'s a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule).
4. `waytide/local/logs/work-sessions/` holds the narrative record of a work session (`the-work-sessions-directory-holds-one-record-per-work-session`).
5. Write a decision entry to `waytide/local/logs/log/`.
6. Write a loop record to `waytide/local/logs/loops/`.
7. Write a work session record to `waytide/local/logs/work-sessions/`.
8. A record belongs here only when it accrues chronologically and is never revised.
9. Each record here is a running account, entry after entry, in the order things happened, and it is reached by date.
10. Nothing here states what is currently true. Items, implementation records, and migration records do not belong here.
11. A migration record does not belong here. It is one document, revised while the migration runs, and prospective: steps written to be executed.
12. Keeping a record afterward makes it durable, not chronological. Durability does not qualify a record for this directory.
13. The three records keep their own names and their own conventions. This rule only groups them.
14. `log` stays `log`. Do not rename it to `decisions`, because every rule that says *write a log entry* means that directory.

## A fourth contemporaneous, historical record goes here

1. Put a contemporaneous, historical record this rule does not name under `waytide/local/logs/` too.
2. The convention that adds it names its directory under `waytide/local/logs/`.
3. That is all this rule asks of a later convention.

## The grouping crosses a package boundary, and does not invert it

1. `logs/loops/` is contributed by `design-by-efferent`, which includes `foundation`, not the reverse.
2. Foundation's naming of `logs/loops/` is only a citation.
3. Foundation requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it.
4. A project that installs only `foundation` has `logs/log/` and no `logs/loops/`, and nothing is missing.

# The migration directory holds the plans for moving or restructuring content

Source: system/foundation/source/the-migration-directory-holds-the-plans-for-moving-or-restructuring-content.md

1. `waytide/local/migration/` holds migration records.
2. A migration record is the execution plan for moving or restructuring content, and the record of how the move actually went. A migration is a structural change: content moved across a repository boundary, or the layout of a project's files changed within one.
3. Plan and record here any content leaving this repository for another, or arriving from one, and any change to the structure content sits in.
4. Plan a move here when content ends up under a different root, or in a different structure.
5. Examples: a library extracted into its own repository, or work moved to a project that will own it.
6. Further examples: one repository split into several, several merged into one, existing conventions migrated into an installed system, or a directory renamed or regrouped.
7. Do not use an ordinary item for a migration.
8. An item sequences a build, against something this repository settled.
9. A migration plan sequences a change to where existing content lives. Across repositories, its increments land in two.
10. Its order matters because content is unavailable or duplicated in between.
11. Across repositories, the plan is not finished when this repository's part is done. Within one, a reference to the old place breaks until it is reconciled.
12. A migration may realize a settled item, or be mechanical enough to need none.
13. A migration record is one document, not entries that accrue like the contemporaneous, historical records under `logs/`.
14. Revise the record while the migration runs.
15. Write it before moving the content.
16. Use the same frontmatter-free markdown as rules: a `# <title>`, then prose.
17. State the source and destination outright: the repositories, or the old and new places within one.
18. State the increments in order.
19. State what is true in between: what is duplicated, what is unavailable, and what is authoritative while the move is under way.
20. Record what actually happened against the plan as the work proceeds.
21. Keep the record after the content has moved. Do not delete it on completion.
22. End the file with the `Authored by … / Changed by …` footer, per the working-state-artifacts-carry-a-provenance-footer rule.
23. The filename follows the ISO-8601-UTC prefix convention of the file-names rule.
24. Records written before this convention reached a project keep their names. A datetime is not revised to a resolution it never had.

# The startup display prints once per session

Source: system/foundation/source/the-startup-display-prints-once-per-session.md

1. Five parts are printed once per session, verbatim. Four are always printed, in this file's order. The package set is printed only where the project has declared one.
2. The harness prints the four always-printed parts. The agent prints none of them.
3. When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints them as a `systemMessage`.
4. The display prints on `load waytide` and on no other prompt. A session opened with any other request shows no display.
5. The agent prints the package set, at the head of the response that carries the rule read.
6. The script reads the four from the fenced blocks of this rule's body, in its source file, by position. It stops at the `## Compressed` heading.
7. The first, third, fourth, and fifth fenced blocks are the title, the copyright and license, the loading line, and the figure.
8. The second fenced block is the package-set example, which the script skips.
9. Adding, removing, or reordering a fenced block in this rule's body changes what is printed, so the rule's sections stay where they are.
10. The automated test `test/automated/startup-display.sh` compares the printed display with the expected text. It fails when the two differ.
11. The fences mark where each printed part begins and ends. They are not printed.
12. First the title, on its own:

```
Waytide: Human-Agent Relations
```

13. The title leads. It is the first line of the display, and nothing the agent writes stands ahead of it.
14. The title stands alone. No subtitle or description is printed under it.
15. The title is the category line. The root `README.md` leads with the same line.
16. No description of Waytide is printed. What Waytide is and does belongs to the `README.md`.
17. The display carries nothing that argues for the system to a reader already using it.
18. The package set is described here, and prints after the display, where one is declared. The agent prints it after the harness has printed the display.
19. The stanza follows the display rather than sitting inside it.
20. Where no set is declared, this part is absent entirely. No line says there is none.
21. The declared set `default` prints nothing where nothing is deactivated.
22. The `default` set prints where it leaves an installed package deactivated, such as `ext/ruby-lang`.
23. The condition is that nothing is off, not that the name is `default`.
24. A suppressed stanza must never be the reason a deactivated package goes unmentioned.
25. A named set other than `default` prints even where nothing is deactivated.
26. The declaration is supplied to the agent by the read instruction, before any file is opened. The a-project-declares-which-installed-packages-are-active rule says where the record lives and what it carries.
27. The stanza takes this form:

```
*design-by-efferent*, **foundation**, **git**, **journal**, **language**, *testing*,
*ext/ruby-lang*, **versioning**
package set: content
(5 active of 8 installed)
```

28. The stanza's lines carry no gap between them.
29. The package list leads. The set's name follows it, above the count. The count closes the stanza.
30. The set is named in the engineer's own wording, as in `package set: content`, not in a restatement of it.
31. Every installed package is listed, in the order the session-start notice lists them.
32. Active packages are bold. Deactivated packages are italic.
33. No package is omitted, and none is replaced by a count.
34. The count line states how many are active and the installed total, in the form `(N active of M installed)`.
35. No legend is printed.
36. Emphasis is available on the package set stanza and nowhere else in the display.
37. The harness display is plain text, where markup reaches the engineer as literal asterisks.
38. Then one blank line, then the copyright notice and the license line, on consecutive lines with no gap between them:

```
Copyright © 2026 Scott Bellware
*Eventide Common Interest License*
```

39. The copyright and license belong on this display, not on the session-start notice. Any standing statement that never changes belongs here, not as a permanent segment of the notice.
40. The copyright line carries the owner and the year alone. It does not name the work.
41. The license line is the license's name alone, set in italics. It takes no leading words such as *Licensed under the*.
42. The block keeps the license line in italics. `startup-display.sh` removes the asterisks from a line wrapped in them, so it prints without them.
43. The gap falls after the license line, never between it and the copyright.
44. The printed license line points to the license. It does not carry the terms, and is not the place to put them.
45. The `LICENSE` file states the terms. A copy sits at this repository's root and in every package directory.
46. The year is the year of the notice, not of the session. It is written into this rule and printed verbatim.
47. The year is not computed. It changes only when the rule changes.
48. Then one blank line, then the loading line:

```
Loading Waytide will take a few moments.
```

49. The loading line says *Waytide* rather than *the rules*. It names the wait after `load waytide`, while the response loads every installed package's rules.
50. The loading line deliberately repeats the session-start notice's caveat. Neither statement is removed.
51. Then one blank line, then the block:

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

52. Each gap is one blank line. There are three: after the title, after the license line, and after the loading line.
53. The harness renders the display as plain text, so the lines print exactly as the blocks hold them.
54. A blank line prints as a blank line. The figure keeps its spacing without a fence.
55. These are the whole of what is printed. No greeting, no account of what is about to be read, and no name for the block accompany them.
56. The package set's absence is the ordinary case, not an omission.

# The work-sessions directory holds one record per work session

Source: system/foundation/source/the-work-sessions-directory-holds-one-record-per-work-session.md

1. `waytide/local/logs/work-sessions/` holds work session records.
2. A work session record is the chronological narrative of one discrete work session between an engineer and Claude.
3. A work session is a unit of the engineer's work. It may last hours, a day, or longer.
4. The discrete piece of work sets a work session's boundaries, not a fixed clock.
5. A work session record is the guided tour of the work session. It gives what was asked and concluded at each step, in order.
6. It defines settled vocabulary as that vocabulary arises.
7. It is written for a person to read. Its job is orientation and reasoning, not truth-of-record.
8. It is not the source of truth. The durable records are authoritative.
9. The durable records are the binding rules (`waytide/system/`, `waytide/local/rules/`), the items (`waytide/local/items/`), the log (`waytide/local/logs/log/`), and the implementation records (`waytide/local/implementations/`).
10. The record points to the durable records throughout. It does not restate them.
11. The record keeps the reasoning behind each fork in the work. It ties the durable records together as a narrative and keeps the arc.
12. Write a record at the close of a work session that produced substantial dialogue, decisions, or discovery worth keeping as a narrative.
13. Write it when the engineer asks. Or propose it when the agent sees the work session has built up such work.
14. A trivial work session needs no record. A record is not required for every session.
15. When the agent raises the question of recording, it asks through the **AskUserQuestion** selection UI. It does not ask in free-text prose.
16. The prompt offers three options, each naming a **work session record**: **write a new work session record**, **append the previous work session record**, or **don't write a work session record**.
17. The engineer's selection decides.
18. Every prompt this convention puts says "work session", never the shortened "session". That covers this prompt and the design reconciliation alike.
19. A direct instruction from the engineer to write or append a record needs no prompt.
20. Name a record with the ISO-8601-UTC filename prefix, per the file-names rule: `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.

## The shape of a work session record

1. Title the record `# Work Session — <name> (<date>)`.
2. Records written before 2026-08-03 are titled `# Session — …`. Keep those titles. Do not retitle them.
3. The parts appear in the order below.
4. **Opening summary**: a short paragraph naming what the work session was, as its arc. For example, it began as X, became Y, and ended with Z.
5. **Framing note**: states that this is the communicable record, or guided tour. It states that the durable records it points to are the source of truth.
6. **Chronological body**: numbered sections (`## 1.`, `## 2.`, …) walking the work session in order.
7. Each section states what was asked and concluded at that step.
8. Each section defines settled vocabulary as it arises.
9. Each section points inline to the durable records that step produced.
10. **Takeaways**: the settled conclusions, compressed to a few bullets.
11. **Glossary**: the terms settled during the work session, each with its literal definition.
12. **Where the durable records live**: pointers to the rules, observations, log entries, experiments, and code the work session produced.
13. Optionally, a **reflective closing note** on the work session itself.
14. A **provenance footer**: the record ends with the `Authored by … / Changed by …` footer, like every working-state artifact.
15. The footer follows the working-state-artifacts-carry-a-provenance-footer rule and the record-a-rules-authorship-in-a-provenance-footer format.
16. A work session record is not shaped like a plan. It records the past. This convention defines that format, alongside the directory.

## Reconcile the settled direction once the record is written

1. "Design" here means whichever settled item the work session bears on, whatever its kind tag.
2. After the record is written, ask the engineer about the design through the AskUserQuestion selection UI.
3. Ask whether the work session's output changes the design, or whether the design has fallen behind it.
4. Offer three options: **update the design**, **the design stands**, or **no design bears on this work session**.
5. Ask this every time a record is written. No other threshold applies.
6. Surface the candidates. Do not decide.
7. Name what the work session settled that the design does not reflect.
8. Name anything the design asserts that the work session contradicts.
9. Either side may be the stale one. Only the engineer can say which.
10. Change neither the design nor the records on your own initiative.
11. Reconcile a design. Never regenerate it from the records or the work downstream of it.
12. A design's Out of Scope / Deferred section and its settled-but-unbuilt direction exist nowhere in the records. So read the design against the records rather than rebuilding it.
13. Where no design exists, or nothing in the work session bears on one, say so and move on.
14. Do not invent a divergence to justify the prompt.

# When the work diverges from the plan, the work is definitive

Source: system/foundation/source/when-the-work-diverges-from-the-plan-the-work-is-definitive.md

1. When the work diverges from the plan, the work is definitive.
2. The plan need not be updated to reflect the work as if the plan had been perfectly prescient.
3. A plan that did not predict what happened is not defective.
4. A plan is not owed an amendment every time the work moves past it.
5. A divergence is not a pending reconciliation.
6. Where the work has simply gone further than the plan foresaw, nothing is outstanding.
7. Do not list such a plan as needing an update.
8. Leave such a plan as written. Do not list the divergence as a reconciliation, and do not offer to bring the plan into line.

## What this does not reach

1. Where the work shows the plan's intent is mistaken, not merely incomplete, correct the plan.
2. The test of whether the plan's direction is wrong is whether the plan still says what the work should be. It is not whether the plan says what the work turned out to be.
3. The engineer may amend a plan for their own reasons at any time. Amend it where the engineer asks. Every amendment, including a correction, is a dated addition.
4. This rule removes an obligation, not a permission.
5. Per the the-work-sessions-directory-holds-one-record-per-work-session rule, either side may be stale, and only the engineer can say which. A design may be right about a direction the work drifted from.
6. This rule settles the ordinary case and leaves that judgment with the engineer.

# Work in a downstream project is never offered, and its pending state is not reported

Source: system/foundation/source/work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported.md

1. A package change leaves every project that installed it on the previous version.
2. Do not offer to close that gap.
3. Do not report it.
4. This holds for a next step, a summary of what was done, an option among others, and a reason something else is incomplete.
5. It covers every act that moves a downstream project: a refresh, an install, a commit, a push, a regenerated bootstrap.
6. It covers the projects a machine registry names, and any other repository that consumes this one.
7. After changing a package, report what changed and stop. Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale.
8. Carry out downstream work when the engineer asks, and report what happened once it is done.
9. Answer a question about downstream state plainly and in full.

## A pending state named is the same offer

1. A trailing line reporting what is not done is a prompt, whatever its grammar.
2. *The other three projects still hold their commits unpushed* is forbidden. It asks for a push.
3. *The root `AGENTS.md` is stale in all four* is forbidden. It asks for a regeneration.
4. A sentence counts as a prompt even when it contains no question.
5. The precondition form is also forbidden, e.g. *That cannot take effect anywhere until the projects refresh*.
6. Do not write what a thing is blocked on when the block is only that the engineer has not asked for the next act.

## What this does not forbid

1. Doing the work, when the engineer asks for it.
2. Do it with no preamble weighing whether the instruction was wise.
3. Reporting what was done, after doing it.
4. A report of work carried out is a result. A report of work not carried out is a prompt.
5. To tell them apart, ask whether the sentence describes something that happened.
6. Answering a question about downstream state, such as *Are the consuming projects up to date*, plainly and in full.
7. Raising downstream state unbidden stays forbidden.
8. The session-start notice. The harness emits it, it reports only the current project's open experiments and features, and it names no other repository. See the the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule.

# Working-state artifacts carry a provenance footer

Source: system/foundation/source/working-state-artifacts-carry-a-provenance-footer.md

1. Every working-state artifact under `waytide/` that is a document with a body ends with a **provenance footer**.
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

1. Do not add a footer to a `waytide/local/logs/log/` entry.
2. A log entry is deliberately one line: a `# <title>`, with no body and no template. See the the-log-holds-one-file-per-entry-with-a-one-line-title rule.
3. A log entry records who and when by its ISO-8601-UTC filename and its commit history, not by an in-file footer.
