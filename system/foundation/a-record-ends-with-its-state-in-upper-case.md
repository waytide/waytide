# A record carrying a state line ends its filename with that state in upper case

Where a record carries a canonical `**State:**` line, its **filename** ends with that state word in **upper case**, appended to the name with a dash and sitting before the extension.

```
2026-07-27T07-09-02Z-the-feature-capability-REALIZED.md
2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md
2026-08-06T04-32-50Z-ooda-mode-COMPLETED.md
```

**It reaches every record that carries a state line** — an implementation record, whether an experiment or a feature, and an item. Each convention fixes its own words, and this rule fixes only where the word is rendered.

**Every item and every implementation record carries a suffix.** Each carries a state line from the moment it is written, and the in-progress state of each is **Active**. A name with no suffix is a defect, because a missing suffix and an oversight look the same. **An observation's suffix is always `-RECORDED`**, since that is its one state.

**The file's contents are unchanged.** The state is the `**State:**` line and nothing else, and the file still ends with its provenance footer. A suffix in the contents would put the same value in two places inside one artifact, for no reader who is asking for it there.

## Upper case, and the exception it takes

**The file-names rule requires a dash-separated, lower-case name.** This suffix is the stated exception, and the case is what earns it: the state is not part of what the record is *about*, and lower case would read as another word of the subject. `…-ooda-terminology-refuted.md` reads as a record about refuted OODA terminology. `…-ooda-terminology-REFUTED.md` reads as a record about OODA terminology, which was refuted.

**The dash is the ordinary separator**, so nothing else about the name changes. The ISO-8601-UTC prefix is untouched and the directory still sorts chronologically.

## The `**State:**` line stays the only authoritative statement

**The name is derived from the line and changes only when it changes.** Where the two disagree the line is right, and the name is stale.

**So a state change renames the file.** A record reaching a new word is renamed with `git mv`, and a reversible word taken back — **Realized**, **Deferred**, **Open**, or a work item's **Done**, as the items-convention sets out — renames it to the state the item returns to, **ACTIVE** or **OPEN**.

**A reference to a record omits its state suffix, so a state change breaks no reference.** The reference keeps the rest of the filename, the ISO-8601-UTC prefix and the name, as in `2026-10-24T20-42-50Z-a-rules-name-is-soluble`. That part does not change with the state, so a reference written before a state change still names the record after it. A reader finds the file by that prefix and name. The reference is not a path that opens directly, which is the cost of its staying true.

**Why:** a record's state is the thing most often wanted without reading the record, and a directory listing is where it is asked for. `local/implementations/` answers *which of these concluded* at a glance, in a file tree, in a shell, and in any editor's sidebar — none of which opens a file to show a line near its top.

The cost is a filename that mutates over a record's life, which is real and is why the suffix is confined to records that carry a state line at all.

**How to apply:** when a record reaches a state word, write the `**State:**` line and rename the file so its name ends with that word in upper case, after a dash.

When the state changes, rename it again. When a reversible state word is taken back, rename it to the state the record returns to, **ACTIVE** or **OPEN**. Write a reference to such a record without its state suffix or its extension, so no reference needs reconciling at a rename. Leave historical records as written. Add no suffix to any file's contents.

Related:

- the implementations-convention — the record whose in-progress state is Active, and the words each kind takes
- the items-convention — the other record that carries a state line, and which carries one from the moment it is written
- the file-names rule — the ISO-8601-UTC prefix and the lower-case name this takes an exception to
- the rules-convention — referencing by name rather than path, the same remedy for a rule that a suffix-free reference is for a record
- the an-item-takes-a-log-entry rule — the log entry a state change also takes
