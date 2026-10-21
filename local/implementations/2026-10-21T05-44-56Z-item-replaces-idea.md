# Feature — "Item" replaces "idea"

**Tags:** [feature]

## Intent

**As the engineer stated it:** Instead of "idea", use "item".

**The record kind now called an idea is called an item.** That is the word in the rules and vocabularies, the directory `waytide/local/ideas/`, and the scripts that read it. It realizes the idea *"Item" replaces "idea"*, `local/ideas/2026-10-21T05-24-46Z-item-replaces-idea-OPEN.md`.

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

## What actually happened

### The reach, and two decisions — 2026-10-20

**"Idea" reaches 30 source rules, 167 times**, two of them named for it — the ideas-convention and an-idea-takes-a-log-entry — and the directory `local/ideas/`, holding 37 records. The directory is named in the session-start read instruction, in `install.sh`'s bootstrap, and in `AGENTS.md`, and 14 records in `local/` cite paths in it.

**"Item" already means a list item, 36 times in the rules.** The engineer chose to keep "item" for the record and write the list sense as "list item" in full, so a bare "item" means the record. The vocabulary will say so.

**The directory becomes `items/`, and the installer migrates it**, as `migrate_work_sessions` and `migrate_logs` already do, and kept as those are. The engineer asked whether a migration stays in the installer for all time. It does: nothing states when one is removed, and both existing migrations still run on every install and refresh. A condition for removing migrations was offered — once every project in the consuming-projects registry has migrated — and not taken. A migration record is written, as the migration-convention requires of a change that crosses a repository boundary.

---

Authored by Scott Bellware on Tue Oct 20 2026 at 10:44:56 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 10:50:30 PM PT
