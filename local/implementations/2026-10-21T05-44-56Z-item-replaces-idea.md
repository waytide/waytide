# Feature — "Item" replaces "idea"

**Tags:** [feature]

## Intent

**As the engineer stated it:** Instead of "idea", use "item".

**The record kind now called an idea is called an item.** That is the word in the rules and vocabularies, the directory `waytide/local/ideas/`, and the scripts that read it. It realizes the idea *"Item" replaces "idea"*, `local/items/2026-10-21T05-24-46Z-item-replaces-idea-OPEN.md`.

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/item-replaces-idea`
- **Base:** `2444c95f42f6ad69c8caf9ec988d588328369481`, from `master`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.

**No forecast is stated.** A feature is built to an intent rather than to a question.

**What Design By Efferent governs here.** The rule and vocabulary text is content work, which this repository's local rule keeps outside the five hinges. The scripts that name the directory — `session-start.sh` among them — are code, and Design By Efferent governs that half.

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| Kind | Feature | Tue Oct 20 2026 at 10:44:56 PM PT |
| Working location | Branch only | Tue Oct 20 2026 at 10:44:56 PM PT |
| Participation | Attended | Tue Oct 20 2026 at 10:44:56 PM PT |
| "Item" against "list item" | Item for the record; list item written in full | Tue Oct 20 2026 at 10:50:30 PM PT |
| The directory | Rename to `items/`; the installer migrates it, and keeps the migration | Tue Oct 20 2026 at 10:50:30 PM PT |
| Actuation | `(cd "$project" && sh "$installer" agents-md)` | Wed Oct 21 2026 at 1:04:27 PM PT |
| Observation | The record is in items/, and ideas/ is gone | Wed Oct 21 2026 at 1:04:27 PM PT |
| Controls | This repository's installer, in a bare directory | Wed Oct 21 2026 at 1:04:27 PM PT |
| Implementation | Written directly | Wed Oct 21 2026 at 1:04:27 PM PT |
| Naming | Moves ideas to items | Wed Oct 21 2026 at 1:04:27 PM PT |
| `[idea]` | A kind tag for an item of no other kind, new items included | Wed Oct 21 2026 at 2:39:48 PM PT |
| This repository's no-kind items | Tag three; leave the content-project item, then tag it too | Wed Oct 21 2026 at 2:39:48 PM PT |
| Tagging — observation | Each moved file, whole, against its expected text | Wed Oct 21 2026 at 2:50:55 PM PT |
| Tagging — controls | No Tags line; a non-kind tag; a kind | Wed Oct 21 2026 at 2:50:55 PM PT |
| Tagging — implementation | Written directly | Wed Oct 21 2026 at 2:50:55 PM PT |
| Tagging — naming | Tags an item without a kind as an idea | Wed Oct 21 2026 at 2:50:55 PM PT |

## What actually happened

### The reach, and two decisions — 2026-10-20

**"Idea" reaches 30 source rules, 167 times**, two of them named for it — the ideas-convention and an-idea-takes-a-log-entry — and the directory `local/ideas/`, holding 37 records. The directory is named in the session-start read instruction, in `install.sh`'s bootstrap, and in `AGENTS.md`, and 14 records in `local/` cite paths in it.

**"Item" already means a list item, 36 times in the rules.** The engineer chose to keep "item" for the record and write the list sense as "list item" in full, so a bare "item" means the record. The vocabulary will say so.

**The directory becomes `items/`, and the installer migrates it**, as `migrate_work_sessions` and `migrate_logs` already do, and kept as those are. The engineer asked whether a migration stays in the installer for all time. It does: nothing states when one is removed, and both existing migrations still run on every install and refresh. A condition for removing migrations was offered — once every project in the consuming-projects registry has migrated — and not taken. A migration record is written, as the migration-convention requires of a change that crosses a repository boundary.

### The content half — 2026-10-21

**The word, the directory, and the two rules are renamed.** `local/ideas/` is `local/items/`, with `git mv`. The ideas-convention is the items-convention and an-idea-takes-a-log-entry is an-item-takes-a-log-entry, also with `git mv`, and their old compiled copies are removed. Every source rule, vocabulary, README, local rule, `AGENTS.md`, and the read instruction in `session-start.sh` and the bootstrap in `install.sh` say *item*.

**Seven uses of *idea* are kept, because they are not the record.** Three are the ordinary sense — "the actual idea", "its own idea of what identity is", and "One idea in each list item". One is a writer's commit subject quoted in the journal-convention, `Journal: Idea`. Three are freeform tag examples in a-record-takes-category-tags, `[idea]` and `[ideas]`, which the rule uses to show tags that carry no fixed meaning.

**The list sense of *item* is written "list item" in full**, in nine places across five rules and the `language` README. **Six general-sense uses are reworded**, since a bare *item* now means the record: the initialization-rule's "item" of the display becomes a "part", a status-line "item" becomes a "segment", git's "a task or item" becomes "a task or a piece of work", "a new item" becomes "something new", and the undo queue's "eleven items" become "eleven entries". *Deferred item*, *suspended items*, and *forecast item* are kept: the first two now name the record exactly, and the third is qualified.

**STE already approves `ITEM (n)`**, as *a thing that is determined or specified*. So *item* is a word ETE fixes the meaning of, and the foundation vocabulary's new entry quotes STE's meaning and states Waytide's, per the ete-fixes-the-meaning-of-a-word-in-its-category rule. The entry also says a bare *item* means the record and the list sense is written in full.

**Historical records are left as written**, among them the log entries and the concluded implementation records that cite `local/ideas/` paths. Of the live records, only this one cited a path, and it is repointed.

**The installer's migration of a consuming project's `ideas/` is not yet written.** That is code, and Design By Efferent governs it.

### The code half — 2026-10-21

**`install.sh` gains `migrate_items`**, which renames a project's `waytide/local/ideas/` to `waytide/local/items/`. It follows `migrate_work_sessions` and `migrate_logs` in its semantics — a move only when the old directory is present and the new one absent, anything else reported and left alone, and a plain `mv` — and runs after them.

**Its test is `test/automated/install.sh`**, designed through the hinges. Actuation: the installer run in a project with `agents-md`, which fetches nothing, so the test is automated and runs offline. Observation: the control record is in `items/`, and `ideas/` is gone. Controls: this repository's installer, run by absolute path in a temporary directory holding one literal record. Implementation: written directly. Naming: *Moves ideas to items*. Before the implementation the test failed with "not in items/"; after it, the suite passes.

**At the naming hinge the agent offered three names that said the same thing**, against the rule settled in the obsolete-rules experiment's passage 42. The engineer did not understand the difference, because there was none. The hinge was put again with the one candidate and `Explain`.

**No migration record is written, correcting the decision above.** The agent said the migration-convention requires one of a change that crosses a repository boundary. This change does not cross one: each project's directory is renamed inside that project, and no content leaves a repository. The convention's record is for a move such as a package leaving for its own repository. The two earlier directory migrations, to `work-sessions/` and to `logs/`, wrote none either.

### `[idea]` is a kind tag — 2026-10-21

**As the engineer stated it:** In consuming projects, idea items should be tagged [idea].

**`[idea]` is the kind an item takes when it is no other**, beside `[design]`, `[plan]`, `[aspiration]`, and `[observation]`. The engineer chose that new items take it too, not only records moved from a project's `ideas/`, and that it marks only an item of no other kind. A tag that marks something other than the kind — `[deferred]`, `[vocabulary]` — does not stand in for one. The items-convention says so, replacing its sentence that an item nobody called anything carries no kind tag.

**Three of this repository's items are tagged `[idea]`**: *Explore Claude Code output styles*, *Reducing rule files to their essential directives*, and *"Item" replaces "idea"*. **The fourth with no kind, *A content project does not start with Design By Efferent active*, is left untagged**, by the engineer's choice: it records a decision that it carries no kind the engineer never named.

**The migration does not yet tag what it moves.** That is code, and goes through the hinges.

**The engineer then tagged the fourth as well.** *A content project does not start with Design By Efferent active* is tagged `[idea]`, with a dated note in it saying the engineer named its kind, and its earlier note against an unnamed kind left as written. All four of this repository's items of no other kind carry `[idea]`.

### The migration tags what it moves — 2026-10-21

**`migrate_items` tags each moved record of no other kind `[idea]`**, after the move: added to the front of its Tags line, or a Tags line added under its State line where it has none. A record of a kind — `[design]`, `[plan]`, `[aspiration]`, `[observation]`, or already `[idea]` — is written back unchanged, and a record with neither line is left as it is.

**A second outcome of the same test, through the hinges.** The actuation stood. Observation: each moved file, whole, against its expected text, chosen after the engineer asked to see the control records and what the test would observe. Controls: three literal records — one with no Tags line, one tagged only `[deferred]`, and one tagged `[design]`. Implementation: written directly. Naming: *Tags an item without a kind as an idea*, the engineer's own wording. The test failed before the implementation, passes after it, and fails again with the kind check removed.

---

Authored by Scott Bellware on Tue Oct 20 2026 at 10:44:56 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 10:50:30 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:38:14 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 1:04:27 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 1:04:46 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 2:39:48 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 2:40:05 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 2:50:55 PM PT
