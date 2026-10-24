# `waytide/local/migration/` — execution plans for transitions of content between repository boundaries

`waytide/local/migration/` holds **migration records**: the execution plans for moving content **across a repository boundary**, and the record of how the move actually went. Content leaving this repository for another, or arriving from one, is planned and recorded here.

- **When to use:** content is to cross out of this repository or into it. A library extracted into its own repository, a body of work moved to a project that will own it, one repository split into several or several merged into one, or existing conventions migrated into an installed system. If the content ends up under a different repository's root, it belongs here.
- **What distinguishes it from an item that sequences work.** Such an item sequences a build **inside** this repository, against something this repository settled. A migration plan sequences work that **crosses out of it**: the increments land in two repositories, the order matters because content is unavailable or duplicated in between, and the plan is not finished when this repository's part is done.
- **The record stays after the content has gone.** This is the reason the directory is separate and the reason a migration record is not deleted on completion. When content leaves, the trail of **where it went and why** leaves with it unless something here holds that trail. A reader asking what became of something finds the answer in the repository they are already in, rather than having to know which repository to look in next.
- **Format:** the same frontmatter-free markdown as rules — a `# <title>`, then prose. State the **source and destination repositories** outright, the **increments in order**, and what is true in between — what is duplicated, what is unavailable, and what is authoritative while the move is under way. Record what actually happened against the plan as the work proceeds.
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **Naming:** the filename follows the ISO-8601-UTC prefix convention (see the file-names rule). **Records written before this convention reached a project keep the names they were given** — a datetime is not revised to a resolution it never had, per the a-time-value-carries-minutes-and-seconds rule.

**Why:** a transition across a repository boundary is the operation most likely to lose content and least likely to be recoverable when it does. It is ordered. Content has to arrive before it can be depended on. It has to stop being authoritative in one place before it becomes authoritative in another. And the state in between is a state no single repository fully describes.

Planning it in the repository the content is leaving puts the plan where the content still is. Keeping the record afterward leaves a trail from the place a reader will look first. Without a named home, such a plan goes in with the project's items, where it reads as ordinary build work. Or it goes into a chat, where it does not survive the session.

**How to apply:** before moving content across a repository boundary, write a record here. It names the source and destination, the increments in order, and what is true while the move is under way. Record what happened against it as the work proceeds, and **keep the record** once the content has gone. Do not use an ordinary item for a move that crosses out of the repository. Do not delete a migration record on completion.

## Compressed

1. `waytide/local/migration/` holds migration records.
2. A migration record is the execution plan for moving content across a repository boundary, and the record of how the move actually went.
3. Plan and record here any content leaving this repository for another, or arriving from one.
4. Use it when content ends up under a different repository's root.
5. Examples: a library extracted into its own repository, or work moved to a project that will own it.
6. Further examples: one repository split into several, several merged into one, or existing conventions migrated into an installed system.
7. Do not use an ordinary item for a move that crosses out of the repository.
8. An item sequences a build inside this repository, against something this repository settled.
9. A migration plan sequences work whose increments land in two repositories.
10. Its order matters because content is unavailable or duplicated in between.
11. The plan is not finished when this repository's part is done.
12. A migration may realize a settled item, or be mechanical enough to need none.
13. A migration record is one document, not entries that accrue like the running records under `logs/`.
14. Revise the record while the migration runs.
15. Write it before moving the content.
16. Use the same frontmatter-free markdown as rules: a `# <title>`, then prose.
17. State the source and destination repositories outright.
18. State the increments in order.
19. State what is true in between: what is duplicated, what is unavailable, and what is authoritative while the move is under way.
20. Record what actually happened against the plan as the work proceeds.
21. Keep the record after the content has gone. Do not delete it on completion.
22. End the file with the `Authored by … / Changed by …` footer, per the working-state-artifacts-carry-a-provenance-footer rule.
23. The filename follows the ISO-8601-UTC prefix convention of the file-names rule.
24. Records written before this convention reached a project keep their names. A datetime is not revised to a resolution it never had.
25. **Why:** a move across a repository boundary is ordered, and is the operation most likely to lose content unrecoverably. The kept record leaves the trail of where content went, and why, in the repository a reader looks in first.

Related:

- the project's planning records — a migration sequences work that crosses *out of* this repository, where those sequence work within it, and a migration may realize a settled item or be mechanical enough to need none
- the file-names rule — the filename prefix
- the working-state-artifacts-carry-a-provenance-footer rule
- the logs-directory rule — the running records, which a migration record is not: it is one document rather than entries that accrue, it is revised while the migration runs, and it is written to be executed rather than to account for what happened

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
