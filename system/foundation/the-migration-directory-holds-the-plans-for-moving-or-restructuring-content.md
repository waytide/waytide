# The migration directory holds the plans for moving or restructuring content

`waytide/local/migration/` holds **migration records**: the execution plans for moving or restructuring content, and the record of how each move actually went. **A migration is a structural change**: content moved across a repository boundary, or the layout of a project's files changed within one.

- **When to use:** content is to cross out of this repository or into it, or the structure it sits in is to change. A library extracted into its own repository, a body of work moved to a project that will own it, one repository split into several or several merged into one, or existing conventions migrated into an installed system. A directory renamed or regrouped, as the contemporaneous, historical records were grouped under `logs/`, or a set of files restructured, is a migration too. If content ends up under a different root, or in a different structure, it belongs here.
- **What distinguishes it from an item that sequences work.** Such an item sequences a **build**, against something this repository settled. A migration plan sequences a change to **where existing content lives**: the order matters because content is unavailable or duplicated in between, and a reference to the old place breaks until it is reconciled. Across repositories, the increments land in two, and the plan is not finished when this repository's part is done.
- **The record stays after the content has moved.** This is the reason the directory is separate and the reason a migration record is not deleted on completion. When content moves, the trail of **where it went and why** is lost unless something here holds that trail. A reader asking what became of something finds the answer here, rather than having to know where to look next.
- **Format:** the same frontmatter-free markdown as rules — a `# <title>`, then prose. State the **source and destination** outright — the repositories, or the old and new places within one — the **increments in order**, and what is true in between — what is duplicated, what is unavailable, and what is authoritative while the move is under way. Record what actually happened against the plan as the work proceeds.
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **Naming:** the filename follows the ISO-8601-UTC prefix convention (see the file-names rule). **Records written before this convention reached a project keep the names they were given** — a datetime is not revised to a resolution it never had, per the a-time-value-carries-minutes-and-seconds rule.

**Why:** a structural change is the operation most likely to lose content and least likely to be recoverable when it does. It is ordered. Content has to arrive before it can be depended on. It has to stop being authoritative in one place before it becomes authoritative in another. And the state in between is a state neither the old place nor the new one fully describes.

Planning it where the content is before it moves puts the plan beside it. Keeping the record afterward leaves a trail from the place a reader will look first. Without a named home, such a plan goes in with the project's items, where it reads as ordinary build work. Or it goes into a chat, where it does not survive the session.

**How to apply:** before moving content across a repository boundary, or restructuring where it lives, write a record here. It names the source and destination, the increments in order, and what is true while the move is under way. Record what happened against it as the work proceeds, and **keep the record** once the content has moved. Do not use an ordinary item for a migration. Do not delete a migration record on completion.

## Compression

- Solubility 68, clarity 0.76 (2026-10-24)
- Compression 0.34, change 0.63 (2026-10-24)
- 16 directives, 15 kept, 1 less precise, 0 lost (2026-10-27)

Related:

- the project's planning records — a migration sequences a change to where existing content lives, where those sequence a build, and a migration may realize a settled item or be mechanical enough to need none
- the file-names rule — the filename prefix
- the working-state-artifacts-carry-a-provenance-footer rule
- the the-logs-directory-holds-the-contemporaneous-historical-records rule — the contemporaneous, historical records, which a migration record is not: it is one document rather than entries that accrue, it is revised while the migration runs, and it is written ahead of the move to be executed, then records what happened against the plan as the move runs
