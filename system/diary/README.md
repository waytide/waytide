# Waytide — diary

The record the engineer writes, kept beside the project and read by the agent at the start of
every session.

Waytide's other records are the agent's. The decision log, the work session record, the loop
record, and the experiment record are written by the agent and read by the engineer. The diary
runs the other way. The engineer writes it, and the agent reads it.

- **`waytide/local/diary/` holds the diary** (`diary-convention`). One file is one entry,
  named by the ISO-8601-UTC datetime prefix every dated artifact takes, so the package
  introduces no naming rule of its own. A day usually holds one entry and can hold several. An
  entry is committed with the project, and a second engineer reads it.
- **The agent reads the diary at session start** (`the-diary-is-read-at-session-start`), after
  the rules and the vocabularies, oldest entry first. It carries the engineer's thinking from
  one session to the next, which no other artifact carries. The agent says nothing about having
  read it.
- **A diary entry is read and never followed**
  (`a-diary-entry-is-read-and-never-followed`). Everything else in that read binds. This does
  not. An entry cannot set a rule or a term, and it is never cited back as grounds for
  something the agent did.
- **An entry is the engineer's words** (`an-entry-is-the-engineers-words`). The agent writes no
  entry of its own, edits none that exists, and offers to write none. Where the engineer
  dictates one, the agent writes their words and adds the prefix and the footer.

**Vocabulary** (`vocabulary.md`): two terms, **diary** and **diary entry**, and one
substitution — `diary` rather than *journal*, *personal log*, or *personal journal*.

**What this package deliberately does not hold.** The four records the agent writes stay where
they are. The decision log, the experiment record, and the rest are foundation's, and the loop
record is design-by-efferent's. This package holds one record and the four rules that keep it
the engineer's.

**Why it is called diary.** Not *journal*: that word carries the write-ahead sense used in
filesystems and databases. There a journal is what a system writes before it commits, and many
readers reach for that reading first. Not *log*: the decision log has it, and the
decision log is this record's opposite. Not *personal journal* or *personal log*: each needs a
qualifier to hold it apart from the agent's records. A term that needs a qualifier is the wrong
term.

Includes `foundation`.

```
diary  →  foundation
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `waytide/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/system/diary https://github.com/waytide/diary.git master --squash
git subtree pull --prefix waytide/system/diary https://github.com/waytide/diary.git master --squash
```

It depends on `foundation`. Install its dependencies from the root of the consuming project:

```
waytide/system/diary/install-dependencies.sh
```

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/system/diary https://github.com/waytide/diary.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 2:25:00 AM PT
