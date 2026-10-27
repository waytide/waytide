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

## Compressed

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
25. **Why:** a structural change is ordered, and is the operation most likely to lose content unrecoverably. The kept record leaves the trail of where content went, and why, where a reader looks first.

## History

Until 2026-10-25 the Related entry for the logs-directory rule said a migration record "is written to be executed rather than to account for what happened", while the body says the record also holds how the move actually went. The engineer settled that the record is written ahead of the move and then records what happened against the plan.

Until Sun Oct 25 2026 this rule was named migration-convention and titled "`waytide/local/migration/` — execution plans for transitions of content between repository boundaries".

Until Mon Oct 26 2026 this rule called the records under `logs/` "the running records". The engineer settled that they are the contemporaneous, historical records.

Until Mon Oct 26 2026 this rule was named the-migration-directory-holds-the-plans-for-moving-content-across-a-repository-boundary and titled "The migration directory holds the plans for moving content across a repository boundary".

Until Mon Oct 26 2026 a migration was defined as a move of content across a repository boundary, and work inside the repository went to an ordinary item. The engineer settled that a migration is a structural change, which includes restructuring content within one repository.

Related:

- the project's planning records — a migration sequences a change to where existing content lives, where those sequence a build, and a migration may realize a settled item or be mechanical enough to need none
- the file-names rule — the filename prefix
- the working-state-artifacts-carry-a-provenance-footer rule
- the the-logs-directory-holds-the-contemporaneous-historical-records rule — the contemporaneous, historical records, which a migration record is not: it is one document rather than entries that accrue, it is revised while the migration runs, and it is written ahead of the move to be executed, then records what happened against the plan as the move runs

---

Authored by Scott Bellware on Sun Aug 2 2026 at 8:13:27 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 1:03:00 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 10:57:02 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:21:42 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:50:46 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 2:36:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:19 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:25 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:12:23 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:13:10 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:16:22 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:18:41 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
