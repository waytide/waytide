# Diary — Vocabulary

The diary package's vocabulary. Two terms, and one substitution that keeps them apart from the
records the agent writes. Binding — use these terms with these meanings in rules, entries, prose,
and dialogue.

**Every word here is one of two things.** This holds for the terms below, and for the **Say**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required,
  and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE
  noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE
  Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An
  ETE category is reserved under the ete-declares-its-own-categories rule. STE
  Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that
  approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from
the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it
with a meaning Waytide does not use. The last of the three is governed by the
ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**The sequence for reserving a word is the a-word-is-reserved-in-six-steps rule**, in the
`language` package's `ete/` directory.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note
names a term absent from the STE dictionary, and reserves it. A definition exists to name a term,
and a term names something in the subject field. A **substitution's Say word** with no STE note is
**ordinary vocabulary**, which is not reserved and not rewritten. See the `language` package's
ordinary-vocabulary-is-not-reserved-and-not-rewritten rule, and its
waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

## Terms

- **diary** — the record the **engineer** writes, held in `waytide/local/diary/`. It is the one
  record under `waytide/local/` the agent does not write. What it holds is what the engineer
  thinks about the work, rather than what happened. The agent reads it at session start and
  follows nothing in it. Its rules are the diary-convention,
  the-diary-is-read-at-session-start, a-diary-entry-is-read-and-never-followed, and
  an-entry-is-the-engineers-words. **STE: absent from the STE dictionary. Technical noun, ETE
  agent artifacts.**
- **diary entry** — one file in the diary, and one piece of the engineer's thinking. A day
  usually holds one entry, and it can hold several. Each is a separate file with the
  ISO-8601-UTC datetime prefix. An entry is written once and not edited. A later thought is a
  later entry. **STE: `entry` is approved as a noun, meaning a record of an event or a
  transaction. `diary` is absent and is reserved above.**

## Substitutions

| Say | Don't say | What it names |
| --- | --- | --- |
| **diary** | "journal", "personal log", "personal journal" | the engineer's record — see above. **journal** carries the write-ahead sense used in filesystems and databases, where a journal is what a system writes before it commits. That reading is the wrong one for a record a person writes, and it is a reading many readers of this system reach for first. **log** is taken by the decision log, which is the agent's record and the diary's opposite. **personal journal** and **personal log** each need a qualifier to hold the two apart, and a term that needs a qualifier is the wrong term |

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
