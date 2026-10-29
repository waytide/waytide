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
4. A package's `rules-pre-loaded.md`, at the package root, holds each rule's title, the path of its source, and its compressed text. `./compile.sh` writes it.
5. The package's `rules-pre-loaded.md` is what is read.
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
9. Run `foundation/load-rules.sh` in one command and read its whole output. It prints each package's `rules-pre-loaded.md` and `vocabulary.md`, leaving out each package's `source/` directory and `README.md`. Read no rule file one by one.
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
