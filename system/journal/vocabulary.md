# Journal — Vocabulary

The journal package's vocabulary. Three terms, and one substitution that keeps them apart from the records the agent writes. Binding — use these terms with these meanings in rules, entries, prose, and dialogue.

**Every word here is approved in the STE dictionary, or reserved in a category its entry names.** The a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule sets out what each means, what a reserved word's entry states, and what silence means in an entry.

## Terms

- **writer** — the person whose journal it is. This package says **writer** where the rest of Waytide says **engineer**, and the two name the same person in a different relation. The `language` vocabulary reserves `engineer` for the person the work is done with and for — at the loop, at a hinge, and as the reader the terminology is conveyed to. Every one of those is a relation to the **work**. A journal entry stands in relation to the **entry**, and what makes it trustworthy is that the person who thought it is the person who wrote it. That is what the an-entry-is-the-writers-words rule turns on, so the word names it. This **narrows** `engineer` and does not contradict it. Outside this package, write `engineer`. **STE: absent from the STE dictionary. Technical noun, STE category 11, professional roles, individuals, groups, organizations, and geopolitical entities** — the category `engineer` takes in the `language` vocabulary.
- **journal** — the record the **writer** keeps, held in `waytide/local/journal/<username>/`. It is the one record under `waytide/local/` the agent does not write. What it holds is what the writer thinks about the work, rather than what happened. The agent reads the active writer's journal at session start, and follows nothing in it. **STE: absent from the STE dictionary. Technical noun, ETE agent artifacts.**
- **journal entry** — one file in the journal, and one piece of the writer's thinking. A day usually holds one entry, and it can hold several. Each is a separate file with a datetime prefix in the writer's **local time**, which is where the journal departs from the foundation package's file-names rule. An entry is one writer's personal record, so the hour it carries is the hour they wrote it in. An entry is written once and not edited. A later thought is a later entry. **STE: `entry` is approved as a noun, meaning a record of an event or a transaction. `journal` is absent and is reserved above.**

## Substitutions

| Use | Don't use | Meaning |
| --- | --- | --- |
| **journal** | "diary", "personal log", "personal journal" | the writer's record — see above. **log** is taken by the project's log, which is the agent's record and the journal's opposite. **personal journal** and **personal log** each need a qualifier to hold the two apart, and a term that needs a qualifier is the wrong term |

**The write-ahead reading is real and is answered rather than avoided.** In filesystems and databases a journal is what a system writes before it commits, and that is a reading many readers of this system reach for first. What settles the reading is the package and the directory the word sits in, not the word alone: `waytide/local/journal/<username>/` names a person, and no write-ahead log is kept per user.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:11:21 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:14:56 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:59:11 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:29:25 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
