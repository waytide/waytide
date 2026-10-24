# Rule reduction — the `foundation` batch, its prompts and answers

The appendix to the experiment record's `foundation` batch. Each rule's compression, directive list, and two checkers' answers are given word for word, with the re-check of each repaired rule.

## The compression guidance

    You are compressing one rule of a rule system that governs an AI coding agent. Write a shorter version of the rule's body, as a numbered list of points, that has exactly the same effect: everything the source requires, forbids, or permits must still be required, forbidden, or permitted.

    - Keep every directive, including small ones, qualifiers, examples that fix a form, and anything stated only in a section heading. A directive stated only in a heading becomes a point of its own as well.
    - Write one directive per point: one thing to do, not to do, or that holds.
    - Keep a section heading that sets scope or carries a directive, as a `## ` heading, with its points beneath it. Number the points under each heading from 1. Do not restate a heading's context in each point.
    - Write each point as a plain sentence or two, of 25 words or fewer each, averaging about 15. Do not pack several directives into one sentence with dashes or semicolons.
    - Keep quoted interface text, commands, formats, code blocks, and examples word for word. A code block may sit between points.
    - Drop restatement, history, and argument. Keep a reason only where it constrains what is done. Make the **Why:** the last point, prefixed `**Why:**`.
    - If the source contradicts itself, keep both statements as the source has them, and report the contradiction after the text.
    - Write the body only: no title, no attribute lines, no Related list, no footer.

    Answer with the numbered body, then a line `CONTRADICTIONS:` followed by any contradiction you found in the source, or `none`.

## The listing prompt

The prompt for `a-decision-the-engineer-made-is-tagged-decision`. The other rules' prompts differ only in the path.

    Read the file /private/tmp/claude-501/batch-fnd/a-decision-the-engineer-made-is-tagged-decision/source.md. It is a rule that governs an AI coding agent and the scripts of the project it works in.

    List every directive the rule contains. A directive is any statement of what must, must not, or may be done, or of what something must be, say, contain, or leave out. Include the directives stated only in passing, inside explanations, and in the How to apply section.

    - Number them, one directive per line.
    - Make each self-contained, so it can be understood without the rule. Keep the rule's own wording where you can.
    - Do not merge two directives into one line, and do not split one into two.
    - Leave out history and justification, except where a reason itself constrains what is done.
    - Where the rule states the same directive more than once, list it once.

    Use no tool except reading that one file. Answer with the numbered list only.

## The checking prompt

The prompt for the same rule. The checker's `compressed.md` holds the rule's title, its compressed text, and its Related list.

    Read the file /private/tmp/claude-501/batch-fnd/a-decision-the-engineer-made-is-tagged-decision/directives.md, a numbered list of the directives in a rule. Then read the file /private/tmp/claude-501/batch-fnd/a-decision-the-engineer-made-is-tagged-decision/compressed.md, a shorter version of the same rule.

    For each directive in the list, judge whether the shorter version carries it:

    - **kept** — the shorter version states it, or states something that requires the same behavior
    - **less precise** — the shorter version states part of it, or states it less strictly, or makes it ambiguous
    - **lost** — the shorter version does not state it and nothing in it requires it

    Answer with one line per directive, in the list's order: its number, the verdict, and, for kept or less precise, the words in the shorter version that carry it, quoted. For less precise or lost, add what is missing in a few words. Judge only from the two files. Use no tool except reading those two files.

## a-decision-the-engineer-made-is-tagged-decision

### The compressor's answer

    1. When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`.
    2. The tag says who decided. Every log entry states a decision, so the tag marks the engineer's.
    3. An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work.
    4. The engineer's decision is the engineer's own choice. It may be stated in the engineer's words.
    5. It may also be made by choosing among options the agent puts forward.
    6. An act the agent takes under a rule is not an engineer's decision, even when the engineer approved it.
    7. Do not tag an entry for an act the agent took under a rule.

    ## The tag

    1. The entry carries the tag under its title, separated by a blank line.
    2. The tag uses the one form every record uses:

    ```
    # The README item settles that the README's content is addressed with Waytide's website, and waits for it

    **Tags:** [decision]
    ```

    3. An entry may carry other tags beside this one.
    4. An engineer's decision to stop doing something is tagged `[decision] [suspended]`.
    5. `[decision]` is a reserved tag. What it marks is fixed here.
    6. The set of the engineer's decisions is read from this tag.
    7. **Why:** the log carries agent acts and engineer decisions in the same form. An engineer's decision is changed by the engineer, while an agent's act is corrected against its rule, so one search must find the engineer's decisions.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the engineer makes a decision, the log entry that records it must carry `**Tags:** [decision]`.
    2. An entry tagged `[decision]` must record a choice the engineer made (such as a direction set, a question settled, or work held for a later piece of work).
    3. The engineer's decision must be the engineer's own choice, either stated in the engineer's words or made by choosing among options the agent puts forward.
    4. An act the agent takes under a rule is not an engineer's decision, even when the engineer approved it, and its log entry must not be tagged `[decision]`.
    5. The `[decision]` tag must sit under the entry's title, separated from it by a blank line, in the form `**Tags:** [decision]`, the one form every record uses.
    6. A log entry may carry other tags beside `[decision]`.
    7. An engineer's decision to stop doing something must be tagged `[decision] [suspended]`.
    8. `[decision]` is a reserved tag: what it marks is fixed by this rule, and the set of the engineer's decisions is read from it.

### Checker A

    1. kept: "When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`."
    2. kept: "An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work."
    3. kept: "The engineer's decision is the engineer's own choice. It may be stated in the engineer's words." / "It may also be made by choosing among options the agent puts forward."
    4. less precise: "An act the agent takes under a rule is not an engineer's decision, even when the engineer approved it." / "Do not tag an entry for an act the agent took under a rule." Missing: it does not name `[decision]` as the forbidden tag. Read literally, it forbids every tag on such an entry, not just `[decision]`.
    5. kept: "The entry carries the tag under its title, separated by a blank line." / "The tag uses the one form every record uses:" plus the example block showing `**Tags:** [decision]` under the title.
    6. kept: "An entry may carry other tags beside this one."
    7. kept: "An engineer's decision to stop doing something is tagged `[decision] [suspended]`."
    8. kept: "`[decision]` is a reserved tag. What it marks is fixed here." / "The set of the engineer's decisions is read from this tag."

### Checker B

    1. kept: "When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`."
    2. kept: "An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work."
    3. kept: "The engineer's decision is the engineer's own choice. It may be stated in the engineer's words." / "It may also be made by choosing among options the agent puts forward."
    4. less precise: "An act the agent takes under a rule is not an engineer's decision, even when the engineer approved it." / "Do not tag an entry for an act the agent took under a rule." Missing: the ban does not name `[decision]`. As written, "Do not tag" can be read as forbidding any tag on such an entry, not only `[decision]`.
    5. kept: "The entry carries the tag under its title, separated by a blank line." / "The tag uses the one form every record uses:" with the example line "**Tags:** [decision]"
    6. kept: "An entry may carry other tags beside this one."
    7. kept: "An engineer's decision to stop doing something is tagged `[decision] [suspended]`."
    8. kept: "`[decision]` is a reserved tag. What it marks is fixed here." / "The set of the engineer's decisions is read from this tag."

### The re-check, after the repairs

    1. kept — "When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`."
    2. kept — "An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work."
    3. less precise — "The engineer's decision is the engineer's own choice. It may be stated in the engineer's words." / "It may also be made by choosing among options the agent puts forward." Missing: "may" makes the two ways permissive. The original's "either … or" limits the decision to those two ways.
    4. kept — "An act the agent takes under a rule is not an engineer's decision, even when the engineer approved it." / "Do not tag such an entry `[decision]`." (The sentence before it, "Do not tag an entry for an act the agent took under a rule", is broader than the original. It reads as a ban on any tag for such an entry.)
    5. kept — "The entry carries the tag under its title, separated by a blank line." / "The tag uses the one form every record uses:" followed by the example `**Tags:** [decision]`.
    6. kept — "An entry may carry other tags beside this one."
    7. kept — "An engineer's decision to stop doing something is tagged `[decision] [suspended]`."
    8. kept — "`[decision]` is a reserved tag. What it marks is fixed here." / "The set of the engineer's decisions is read from this tag."

## a-project-does-not-name-its-consumers

### The compressor's answer

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
    6. The one exception is disclosure, governed by the disclosure rule, not this one.
    7. That correction removes the name and keeps every claim true by stating it at a lower resolution.
    8. The engineer is the authority on what counts.
    9. This rule governs what is written from now on. It does not license going back through the records.

    ## Where the operational need goes instead

    1. Where a tool must reach the consuming projects, such as to survey or refresh them, it reads per-machine configuration outside the repository.
    2. That configuration lives under `~/.config/`, not in a gitignored file inside the repository.
    3. Commit the tool. It names no consumer and only reads the configuration.
    4. **Why:** a consumer list inverts the dependency direction, drifts silently, and discloses other parties' projects once the repository is public. Per-machine configuration keeps the capability without those costs.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A project's own files must not name the projects that consume it. This covers the installed packages under `waytide/system/`, the project's own working state under `waytide/local/`, and the code or documentation beside them.
    2. The prohibition on naming consumers applies to a library, a package, a rule system, or anything else other projects install.
    3. A project counts as a consumer only if it is named only because it installed this one. That is the whole of the test.
    4. Whether a name is allowed depends on why the name is there, not on whether the named project happens to consume this one.
    5. A project that is part of this project at large may be named.
    6. A reference project the method is shown through may be named.
    7. A project named because a decision was about it must be left in place, not removed.
    8. A historical record that already names a consumer is not revised to suit this later convention. It is left as written.
    9. A consumer's name already in a historical record is the disclosure rule's concern, not this rule's, and the disclosure rule governs it.
    10. Under the disclosure exception, the correction removes the name and keeps every claim true by stating it at a lower resolution.
    11. The engineer is the authority on what counts as a consumer.
    12. This rule governs what is written from now on. It does not license going back through the records to remove names.
    13. Do not add a list of downstream consumers to the project for convenience.
    14. Where a tool must reach the consuming projects, such as to survey them or drive a refresh over them, it must read per-machine configuration outside the repository, under `~/.config/`. A `.gitignore` staying correct must not be relied on to keep the list out.
    15. The tool that reaches consumers is committed, and it names no consumer.
    16. The consumer list stays local to the engineer's machine and is not committed with the tool.

### Checker A

    1. kept — "A project's own files do not name the projects that consume it." / "This covers the installed packages under `waytide/system/`, the working state under `waytide/local/`, and the code and documentation beside them."
    2. kept — "It holds for a library, a package, a rule system, or anything else other projects install."
    3. kept — "A consumer is a project named only because it installed this one. That is the whole test."
    4. kept — "The test is why the name is there, not whether the named project consumes this one."
    5. kept — "A project that is part of this project at large may be named, such as Waytide's `website`."
    6. kept — "A reference project the method is shown through may be named, such as Waytide's `constant`."
    7. kept — "A project named because a decision was about it may be named. Leave its name."
    8. kept — "Leave a historical record that already names a consumer as written. It is not revised to suit a later convention."
    9. less precise — "The one exception is disclosure, governed by the disclosure rule, not this one." / Related: "the disclosure-is-the-one-reason-to-edit-a-historical-record rule — a name already recorded". Missing: it does not plainly say that a consumer's name already in a record belongs to the disclosure rule. It presents disclosure as an exception to leaving the record alone.
    10. kept — "That correction removes the name and keeps every claim true by stating it at a lower resolution."
    11. less precise — "The engineer is the authority on what counts." Missing: "as a consumer". Coming right after the line about the correction, "what counts" has no stated object.
    12. kept — "This rule governs what is written from now on. It does not license going back through the records."
    13. kept — "Do not add a list of consumers for convenience."
    14. kept — "it reads per-machine configuration outside the repository." / "That configuration lives under `~/.config/`, not in a gitignored file inside the repository."
    15. kept — "Commit the tool. It names no consumer and only reads the configuration."
    16. kept — "per-machine configuration outside the repository" / "Commit the tool. It names no consumer and only reads the configuration." Configuration kept outside the repository cannot be committed with the tool.

### Checker B

    1. kept — "A project's own files do not name the projects that consume it." / "This covers the installed packages under `waytide/system/`, the working state under `waytide/local/`, and the code and documentation beside them."
    2. kept — "It holds for a library, a package, a rule system, or anything else other projects install."
    3. kept — "A consumer is a project named only because it installed this one. That is the whole test."
    4. kept — "The test is why the name is there, not whether the named project consumes this one."
    5. kept — "A project that is part of this project at large may be named, such as Waytide's `website`."
    6. kept — "A reference project the method is shown through may be named, such as Waytide's `constant`."
    7. kept — "A project named because a decision was about it may be named. Leave its name."
    8. kept — "Leave a historical record that already names a consumer as written. It is not revised to suit a later convention."
    9. less precise — "The one exception is disclosure, governed by the disclosure rule, not this one." (also Related: "the disclosure-is-the-one-reason-to-edit-a-historical-record rule — a name already recorded"). Missing: it does not say plainly that a consumer's name already in a historical record is entirely the disclosure rule's concern. It only calls disclosure an exception to leaving the record as written.
    10. kept — "That correction removes the name and keeps every claim true by stating it at a lower resolution."
    11. less precise — "The engineer is the authority on what counts." Missing: "as a consumer". "What counts" is left without an object, so it is ambiguous.
    12. kept — "This rule governs what is written from now on. It does not license going back through the records."
    13. kept — "Do not add a list of consumers for convenience."
    14. kept — "Where a tool must reach the consuming projects, such as to survey or refresh them, it reads per-machine configuration outside the repository." / "That configuration lives under `~/.config/`, not in a gitignored file inside the repository."
    15. kept — "Commit the tool. It names no consumer and only reads the configuration."
    16. kept — "it reads per-machine configuration outside the repository" / "lives under `~/.config/`, not in a gitignored file inside the repository". The list being outside the repository means it cannot be committed with the tool.

### The re-check, after the repairs

    1. kept — "A project's own files do not name the projects that consume it." / "This covers the installed packages under `waytide/system/`, the working state under `waytide/local/`, and the code and documentation beside them."
    2. kept — "It holds for a library, a package, a rule system, or anything else other projects install."
    3. kept — "A consumer is a project named only because it installed this one. That is the whole test."
    4. kept — "The test is why the name is there, not whether the named project consumes this one."
    5. kept — "A project that is part of this project at large may be named, such as Waytide's `website`."
    6. kept — "A reference project the method is shown through may be named, such as Waytide's `constant`."
    7. kept — "A project named because a decision was about it may be named. Leave its name."
    8. kept — "Leave a historical record that already names a consumer as written. It is not revised to suit a later convention."
    9. kept — "The one exception is disclosure, governed by the disclosure rule, not this one. A consumer's name already in a record is that rule's concern."
    10. kept — "That correction removes the name and keeps every claim true by stating it at a lower resolution."
    11. kept — "The engineer is the authority on what counts as a consumer."
    12. kept — "This rule governs what is written from now on. It does not license going back through the records." (The words "to remove names" are dropped, but the shorter wording is broader, so it still forbids the same behavior.)
    13. kept — "Do not add a list of consumers for convenience." ("downstream" appears in the title, and "to the project" is implied.)
    14. kept — "Where a tool must reach the consuming projects, such as to survey or refresh them, it reads per-machine configuration outside the repository." / "That configuration lives under `~/.config/`, not in a gitignored file inside the repository." (Ruling out a gitignored file inside the repository requires the same behavior as not relying on a `.gitignore` staying correct.)
    15. kept — "Commit the tool. It names no consumer and only reads the configuration."
    16. kept — "per-machine configuration outside the repository" / "lives under `~/.config/`, not in a gitignored file inside the repository" / "Commit the tool. It ... only reads the configuration." (Configuration outside the repository cannot be committed with the tool, so the list stays on the engineer's machine.)

    No directive is less precise or lost.

## a-record-ends-with-its-state-in-upper-case

### The compressor's answer

    1. Where a record carries a canonical `**State:**` line, its filename ends with that state word in upper case.
    2. The state word is appended to the name with a dash, before the extension.

    ```
    2026-07-27T07-09-02Z-the-feature-capability-REALIZED.md
    2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md
    2026-08-06T04-32-50Z-ooda-mode-COMPLETED.md
    ```

    3. This reaches every record that carries a state line: an implementation record, whether experiment or feature, and an item.
    4. Each convention fixes its own state words. This rule fixes only where the word is rendered.
    5. A record with no state line takes no suffix. Only an implementation record can lack one.
    6. An item always carries a suffix. Absence is not a state for an item.
    7. An observation's suffix is always `-STATED`.
    8. The file's contents are unchanged. Add no suffix to any file's contents.
    9. The state inside the file is the `**State:**` line and nothing else.
    10. The file still ends with its provenance footer.

    ## Upper case, and the exception it takes

    1. The suffix is the stated exception to the file-names rule's dash-separated, lower-case name.
    2. The upper case marks the state as not part of the record's subject. `…-ooda-terminology-REFUTED.md`, not `…-ooda-terminology-refuted.md`.
    3. The dash is the ordinary separator. Nothing else about the name changes.
    4. The ISO-8601-UTC prefix is untouched, so the directory still sorts chronologically.

    ## The `**State:**` line stays the only authoritative statement

    1. The name is derived from the line. It changes only when the line changes.
    2. Where name and line disagree, the line is right and the name is stale.
    3. A state change renames the file, using `git mv`.
    4. When a reversible word is taken back, rename the file to the state the record returns to, **ACTIVE** or **OPEN**.
    5. The reversible words are **Realized**, **Deferred**, **Open**, and a work item's **Done**, as the items-convention sets out.
    6. At a rename, reconcile the live artifacts that cite the old name.
    7. Leave historical records as written. A reader following an unresolvable path uses git.
    8. **Why:** a record's state is most often wanted from a directory listing, without opening the record. The mutating filename is the cost, so the suffix is confined to records carrying a state line.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Where a record carries a canonical `**State:**` line, its filename must end with that state word in upper case.
    2. The state word must be appended to the record's filename with a dash, and must sit before the extension.
    3. The upper-case state suffix applies to every record that carries a state line, meaning an implementation record (experiment or feature) and an item.
    4. Each convention fixes its own state words. This rule fixes only where the word is rendered in the filename.
    5. A record with no state line (now only an implementation record) takes no state suffix in its filename.
    6. An item must always carry a state suffix in its filename.
    7. An observation's filename suffix is always `-STATED`.
    8. Adding the state suffix to a filename must leave the file's contents unchanged. The state must be the `**State:**` line and nothing else.
    9. The file must still end with its provenance footer.
    10. The upper-case state suffix is the stated exception to the file-names rule's requirement of a dash-separated, lower-case name.
    11. The suffix is separated from the rest of the filename by the ordinary dash, and nothing else about the name changes.
    12. The filename's ISO-8601-UTC prefix is left untouched by the suffix, so the directory still sorts chronologically.
    13. The `**State:**` line is the only authoritative statement of a record's state. The filename is derived from it and changes only when the line changes.
    14. Where the filename's state suffix and the `**State:**` line disagree, the line is right and the name is stale.
    15. When a record's state changes, its file must be renamed.
    16. A record reaching a new state word must be renamed with `git mv`.
    17. When a reversible state word (**Realized**, **Deferred**, **Open**, or a work item's **Done**, as the items-convention sets out) is taken back, the file must be renamed to the state the record returns to, **ACTIVE** or **OPEN**.
    18. When a record's file is renamed, live artifacts that cite it must be reconciled at the rename.
    19. When a record's file is renamed, historical records that cite the old path must be left as written. A reader who follows an unresolvable path uses git.
    20. The state suffix is confined to records that carry a state line.
    21. When a record reaches a state word, write its `**State:**` line and rename the file so its name ends with that word in upper case, after a dash.
    22. Add no state suffix to any file's contents.

### Checker A

    1. kept: "Where a record carries a canonical `**State:**` line, its filename ends with that state word in upper case."
    2. kept: "The state word is appended to the name with a dash, before the extension."
    3. kept: "This reaches every record that carries a state line: an implementation record, whether experiment or feature, and an item."
    4. kept: "Each convention fixes its own state words. This rule fixes only where the word is rendered."
    5. kept: "A record with no state line takes no suffix. Only an implementation record can lack one."
    6. kept: "An item always carries a suffix. Absence is not a state for an item."
    7. kept: "An observation's suffix is always `-STATED`."
    8. kept: "The file's contents are unchanged." and "The state inside the file is the `**State:**` line and nothing else."
    9. kept: "The file still ends with its provenance footer."
    10. kept: "The suffix is the stated exception to the file-names rule's dash-separated, lower-case name."
    11. kept: "The dash is the ordinary separator. Nothing else about the name changes."
    12. kept: "The ISO-8601-UTC prefix is untouched, so the directory still sorts chronologically."
    13. kept: "The `**State:**` line stays the only authoritative statement" and "The name is derived from the line. It changes only when the line changes."
    14. kept: "Where name and line disagree, the line is right and the name is stale."
    15. kept: "A state change renames the file"
    16. kept: "A state change renames the file, using `git mv`."
    17. kept: "When a reversible word is taken back, rename the file to the state the record returns to, **ACTIVE** or **OPEN**." and "The reversible words are **Realized**, **Deferred**, **Open**, and a work item's **Done**, as the items-convention sets out."
    18. kept: "At a rename, reconcile the live artifacts that cite the old name."
    19. kept: "Leave historical records as written. A reader following an unresolvable path uses git."
    20. kept: "the suffix is confined to records carrying a state line."
    21. kept: "its filename ends with that state word in upper case", "The state word is appended to the name with a dash" and "A state change renames the file". The step of writing the `**State:**` line is not stated as an action. It is required anyway, because "The name is derived from the line."
    22. kept: "Add no suffix to any file's contents."

### Checker B

    1. kept: "Where a record carries a canonical `**State:**` line, its filename ends with that state word in upper case."
    2. kept: "The state word is appended to the name with a dash, before the extension."
    3. kept: "This reaches every record that carries a state line: an implementation record, whether experiment or feature, and an item."
    4. kept: "Each convention fixes its own state words. This rule fixes only where the word is rendered."
    5. kept: "A record with no state line takes no suffix. Only an implementation record can lack one."
    6. kept: "An item always carries a suffix. Absence is not a state for an item."
    7. kept: "An observation's suffix is always `-STATED`."
    8. kept: "The file's contents are unchanged." / "The state inside the file is the `**State:**` line and nothing else."
    9. kept: "The file still ends with its provenance footer."
    10. kept: "The suffix is the stated exception to the file-names rule's dash-separated, lower-case name."
    11. kept: "The dash is the ordinary separator. Nothing else about the name changes."
    12. kept: "The ISO-8601-UTC prefix is untouched, so the directory still sorts chronologically."
    13. kept: "The `**State:**` line stays the only authoritative statement" / "The name is derived from the line. It changes only when the line changes."
    14. kept: "Where name and line disagree, the line is right and the name is stale."
    15. kept: "A state change renames the file"
    16. kept: "using `git mv`"
    17. kept: "When a reversible word is taken back, rename the file to the state the record returns to, **ACTIVE** or **OPEN**." / "The reversible words are **Realized**, **Deferred**, **Open**, and a work item's **Done**, as the items-convention sets out."
    18. kept: "At a rename, reconcile the live artifacts that cite the old name."
    19. kept: "Leave historical records as written. A reader following an unresolvable path uses git."
    20. kept: "the suffix is confined to records carrying a state line."
    21. less precise: "A state change renames the file" / "its filename ends with that state word in upper case" / "appended to the name with a dash". Missing: an explicit instruction to write the `**State:**` line when the record reaches a state word. The shorter version only implies it, through "The name is derived from the line."
    22. kept: "Add no suffix to any file's contents."

## a-record-list-is-a-table

### The compressor's answer

    1. When the engineer asks for a list of records, render it as a table.
    2. This applies to any record type. That includes items, implementation records, decision log entries, loop records, work session records, migration records, journal entries, and commits.
    3. The first column is the record's handle and has no heading.
    4. The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit.
    5. Every column after the handle has a heading.
    6. Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it.
    7. These two SHA columns are always present. They are not chosen per request.
    8. After the SHA columns comes the title. Then comes one column for the fact asked about.

    ```
    |              | created   | changed   | item                              | state  |
    |--------------|-----------|-----------|-----------------------------------|--------|
    | `2026-08-10` | `f0b7769` | `e137863` | A Generalized Description         | Active |
    | `2026-08-23` | `376e64a` | `376e64a` | Waytide for content and web       | Open   |
    ```

    9. A record that was never amended shows the same SHA in both columns. This is intended, since it shows the record has not been touched since it was written.
    10. Choose the last column to fit the question.
    11. A list of items or implementations takes the state as its last column.
    12. A list of commits asked about for their subject widths takes the width.
    13. Do not add a column nobody asked for.
    14. A list of commits takes no SHA columns.

    ## Keep every column short

    1. Keep every column short.
    2. Do not put a field that runs to a sentence in a table.
    3. Where a record's summary is wanted, present rows instead of a table. This is part of the rule, not a failure of it.

    ## What this does not reach

    1. The status report's tables are already tables under the status-report-format rule, and this rule agrees with it.
    2. This rule does not govern an answer that is not a list of records.
    3. The `language` package's an-answer-is-a-list-and-prose-must-justify-itself rule governs the form of an answer's list items. This rule governs only how a set of records is presented.
    4. **Why:** a record list is scanned, not read. A table puts each field in the same place on every row, so the reader can find one row or compare a field down a column. Rows are better only where a field is long.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the engineer asks for a list of records (items, implementation records, decision log entries, loop records, work session records, migration records, journal entries, or commits), render it as a table.
    2. The first column of a record-list table is the record's handle: the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit.
    3. The handle column carries no heading.
    4. The columns after the handle column are headed.
    5. Two SHA columns follow the handle: the commit that created the record, then the last commit to touch it.
    6. The two SHA columns are standing columns, present in every record-list table (except a list of commits), not chosen ones.
    7. A record never amended shows the same SHA in both the created and changed columns.
    8. After the SHA columns comes the record's title column.
    9. The last column is one column chosen for the question asked, the fact that was asked about (for example, the state for a list of items or implementations, or the width for commits asked about for their subject widths).
    10. Do not add a column nobody asked for.
    11. A list of commits takes no SHA columns.
    12. Keep every column short.
    13. A field that is a sentence does not belong in a table.
    14. Where a record's summary is wanted, or any field runs to a sentence, present the records as rows rather than a table.

### Checker A

    1. kept — "When the engineer asks for a list of records, render it as a table." / "That includes items, implementation records, decision log entries, loop records, work session records, migration records, journal entries, and commits."
    2. kept — "The first column is the record's handle" / "The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit."
    3. kept — "and has no heading."
    4. kept — "Every column after the handle has a heading."
    5. kept — "Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it."
    6. kept — "These two SHA columns are always present. They are not chosen per request." together with "A list of commits takes no SHA columns."
    7. kept — "A record that was never amended shows the same SHA in both columns."
    8. kept — "After the SHA columns comes the title."
    9. kept — "Then comes one column for the fact asked about." / "Choose the last column to fit the question." / "A list of items or implementations takes the state as its last column." / "A list of commits asked about for their subject widths takes the width."
    10. kept — "Do not add a column nobody asked for."
    11. kept — "A list of commits takes no SHA columns."
    12. kept — "Keep every column short."
    13. kept — "Do not put a field that runs to a sentence in a table."
    14. less precise — "Where a record's summary is wanted, present rows instead of a table." Missing: the shorter version does not say to present rows when any field runs to a sentence. It only says to keep such a field out of the table, and does not name rows as the form to use instead.

### Checker B

    1. kept — "When the engineer asks for a list of records, render it as a table." / "That includes items, implementation records, decision log entries, loop records, work session records, migration records, journal entries, and commits."
    2. kept — "The first column is the record's handle" / "The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit."
    3. kept — "and has no heading."
    4. kept — "Every column after the handle has a heading."
    5. kept — "Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it."
    6. kept — "These two SHA columns are always present. They are not chosen per request." together with "A list of commits takes no SHA columns." (the exception lives in a separate line rather than in this one)
    7. kept — "A record that was never amended shows the same SHA in both columns."
    8. kept — "After the SHA columns comes the title."
    9. kept — "Then comes one column for the fact asked about." / "Choose the last column to fit the question." / "A list of items or implementations takes the state as its last column." / "A list of commits asked about for their subject widths takes the width."
    10. kept — "Do not add a column nobody asked for."
    11. kept — "A list of commits takes no SHA columns."
    12. kept — "Keep every column short."
    13. kept — "Do not put a field that runs to a sentence in a table."
    14. less precise — "Where a record's summary is wanted, present rows instead of a table." Missing: the shorter version does not say to present rows when any field runs to a sentence. It only bars such a field from a table, which leaves dropping the field as a reading.

### The re-check, after the repairs

    1. kept: "When the engineer asks for a list of records, render it as a table." plus "That includes items, implementation records, decision log entries, loop records, work session records, migration records, journal entries, and commits."
    2. kept: "The first column is the record's handle" and "The handle is the ISO-8601-UTC filename prefix for a working-state artifact, or the short SHA for a commit."
    3. kept: "and has no heading."
    4. kept: "Every column after the handle has a heading."
    5. kept: "Two SHA columns come right after the handle: the commit that created the record, then the last commit to touch it."
    6. kept: "These two SHA columns are always present. They are not chosen per request." with the exception carried by "A list of commits takes no SHA columns."
    7. kept: "A record that was never amended shows the same SHA in both columns."
    8. kept: "After the SHA columns comes the title."
    9. kept: "Then comes one column for the fact asked about." / "Choose the last column to fit the question." / "A list of items or implementations takes the state as its last column." / "A list of commits asked about for their subject widths takes the width."
    10. kept: "Do not add a column nobody asked for."
    11. kept: "A list of commits takes no SHA columns."
    12. kept: "Keep every column short."
    13. kept: "Do not put a field that runs to a sentence in a table."
    14. kept: "Present rows instead." and "Where a record's summary is wanted, present rows instead of a table."

## a-record-takes-category-tags

### The compressor's answer

    1. Any record may be categorized with square-bracket tags, as in `[idea]`.
    2. This is the system's one tagging protocol.
    3. The protocol is universal. No record is excluded from it, and no rule excludes one.
    4. Universal means every record, of every kind, anywhere.
    5. Examples are a working-state artifact under `waytide/local/`, a decision log entry, a rule file under `waytide/system/` or `waytide/local/rules/`, a journal entry, and a README.
    6. A tag applies to the whole record or to one list item.

    ## Where the tag goes

    1. There is one form, and every record uses it.
    2. For the whole record, tags go on a dedicated `**Tags:**` line among the canonical lines at the head.
    3. The `**Tags:**` line goes after `**State:**` where there is one.
    4. Several tags are separated by spaces, as in `**Tags:** [idea] [decision]`.
    5. For one list item, the tag prefixes that item's text, as in `- [idea] My great idea is thus`.
    6. A record with no head gains one.
    7. A decision log entry is only a title, so a `**Tags:**` line under its title is its whole head. A tagged entry is two lines.
    8. The leading-tag form is discontinued.
    9. No record is excluded by its shape. A short, one-line, generated, or historical record carries its tags on a `**Tags:**` line.
    10. Tags are lower-case, in square brackets.
    11. A multiword tag is dash-separated and lower-case, as in `[legal-matter]`.
    12. There is no controlled vocabulary. Tags are freeform and introduced as needed.
    13. Nothing validates a tag, and nothing enumerates the set.
    14. A tag used once is as legitimate as a tag used a hundred times.
    15. Tags are optional at every level.
    16. A record that is not categorized carries no `**Tags:**` line and no leading tag.
    17. A list that is not categorized carries no prefixes.
    18. The absence of tags claims nothing.
    19. Optional is not excluded. Every record may be tagged, and none must be.
    20. The `**Tags:**` line is the plain text data attribute form: a bold label, a colon, and a value. See this package's vocabulary.

    ## A reserved tag and a freeform tag

    1. Most tags are freeform, and a few are reserved.
    2. A freeform tag means only that the writer put it there.
    3. A reserved tag is one whose meaning a rule settles, and something follows from it.
    4. A rule reserves a tag by naming it and saying what follows. Nothing else reserves a tag.
    5. A tag that no rule names is freeform.
    6. Nothing is derived from a freeform tag: no filename suffix, no report, no check.
    7. A rule that wants a set of positions reserves the tags that carry them, or names a new line.
    8. The reserved set stays small, and each member is named in a rule a reader can find.
    9. The freeform space around reserved tags is left untouched.
    10. A writer needs to know a tag is reserved only when using it for what the rule says.
    11. Reserved and freeform tags sit in the same `**Tags:**` line. Do not put reserved words on a second line beside it.
    12. The cost is accepted: a reader cannot tell from the line alone whether a rule turns on a tag.
    13. Freeform tags that differ, like `[idea]` and `[ideas]`, do not categorize together. This is accepted rather than solved.
    14. **Why:** categorization that costs nothing gets done. A square-bracket tag shows in a raw-text preview and is found by plain text search. It also needs no taxonomy that someone has to maintain.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Any record may be categorized with square-bracket tags, as in `[idea]`.
    2. Square-bracket tags are the system's one tagging protocol; no other tagging protocol is used.
    3. No record is excluded from tagging, and no rule may exclude one; this covers every record, of every kind, anywhere (working-state artifacts, decision log entries, rule files, journal entries, READMEs).
    4. A tag applies either to the whole record or to one list item.
    5. There is one form of tagging, and every record uses it.
    6. Tags for a whole record go on a dedicated `**Tags:**` line among the canonical lines at the head of the record.
    7. The `**Tags:**` line goes after `**State:**` where the record has one.
    8. Several tags on a `**Tags:**` line are separated by spaces, as in `**Tags:** [idea] [decision]`.
    9. A tag for one list item prefixes that list item's text, as in `- [idea] My great idea is thus`.
    10. A record with no head gains one when tagged; for a decision log entry, a `**Tags:**` line goes under its title and is the entry's whole head, making a tagged entry two lines rather than one.
    11. The leading-tag form (a tag placed before a record's title or text in place of a `**Tags:**` line) is discontinued and must not be used.
    12. No record is excluded by its shape: a record that carries tags, whether short, one-line, generated, or historical, carries them on a `**Tags:**` line.
    13. Tags are written lower-case, in square brackets.
    14. A multiword tag is dash-separated and lower-case, as in `[legal-matter]`.
    15. There is no controlled vocabulary: tags are freeform, and a tag is introduced as it is needed.
    16. Nothing validates a tag and nothing enumerates the set of tags.
    17. A tag used once is as legitimate as a tag used a hundred times.
    18. Tags are optional at every level; no record must be tagged.
    19. A record that is not categorized carries no `**Tags:**` line and no leading tag.
    20. A list that is not categorized carries no tag prefixes on its items.
    21. The absence of tags claims nothing.
    22. The `**Tags:**` line takes the plain text data attribute form: a bold label, a colon, and a value.
    23. A tag that no rule names is freeform, and a freeform tag means only that the writer put it there.
    24. A rule reserves a tag by naming it and saying what follows from it; nothing else reserves a tag.
    25. Nothing is derived from a freeform tag: no filename suffix, no report, no check.
    26. A rule that wants a set of positions reserves the tags that carry them, or names a new line.
    27. The reserved set of tags stays small, each reserved tag is named in a rule a reader can find, and the freeform space around them is left untouched.
    28. Reserved tags and freeform tags sit in the same `**Tags:**` line; reserved words are not put on a second line beside `**Tags:**`.
    29. Where a categorization is worth marking, add a `**Tags:**` line at the head of the record.

### Checker A

    1. kept: "Any record may be categorized with square-bracket tags, as in `[idea]`."
    2. kept: "This is the system's one tagging protocol."
    3. kept: "The protocol is universal. No record is excluded from it, and no rule excludes one." / "Universal means every record, of every kind, anywhere." / "Examples are a working-state artifact under `waytide/local/`, a decision log entry, a rule file ..., a journal entry, and a README."
    4. kept: "A tag applies to the whole record or to one list item."
    5. kept: "There is one form, and every record uses it."
    6. kept: "For the whole record, tags go on a dedicated `**Tags:**` line among the canonical lines at the head."
    7. kept: "The `**Tags:**` line goes after `**State:**` where there is one."
    8. kept: "Several tags are separated by spaces, as in `**Tags:** [idea] [decision]`."
    9. kept: "For one list item, the tag prefixes that item's text, as in `- [idea] My great idea is thus`."
    10. less precise: "A record with no head gains one." / "a `**Tags:**` line under its title is its whole head. A tagged entry is two lines." Missing: the condition "when tagged". As written, it can be read as every headless record gaining a head.
    11. less precise: "The leading-tag form is discontinued." Missing: what the leading-tag form is (a tag before the title or text, in place of a `**Tags:**` line), and the explicit "must not be used".
    12. kept: "No record is excluded by its shape. A short, one-line, generated, or historical record carries its tags on a `**Tags:**` line."
    13. kept: "Tags are lower-case, in square brackets."
    14. kept: "A multiword tag is dash-separated and lower-case, as in `[legal-matter]`."
    15. kept: "There is no controlled vocabulary. Tags are freeform and introduced as needed."
    16. kept: "Nothing validates a tag, and nothing enumerates the set."
    17. kept: "A tag used once is as legitimate as a tag used a hundred times."
    18. kept: "Tags are optional at every level." / "Every record may be tagged, and none must be."
    19. kept: "A record that is not categorized carries no `**Tags:**` line and no leading tag."
    20. less precise: "A list that is not categorized carries no prefixes." Missing: "tag" and "on its items". "No prefixes" is ambiguous and could be read as banning any prefix.
    21. kept: "The absence of tags claims nothing."
    22. kept: "The `**Tags:**` line is the plain text data attribute form: a bold label, a colon, and a value."
    23. kept: "A tag that no rule names is freeform." / "A freeform tag means only that the writer put it there."
    24. kept: "A rule reserves a tag by naming it and saying what follows. Nothing else reserves a tag."
    25. kept: "Nothing is derived from a freeform tag: no filename suffix, no report, no check."
    26. kept: "A rule that wants a set of positions reserves the tags that carry them, or names a new line."
    27. kept: "The reserved set stays small, and each member is named in a rule a reader can find." / "The freeform space around reserved tags is left untouched."
    28. kept: "Reserved and freeform tags sit in the same `**Tags:**` line. Do not put reserved words on a second line beside it."
    29. less precise: "Any record may be categorized ..." / "tags go on a dedicated `**Tags:**` line among the canonical lines at the head." Missing: the direction to add a `**Tags:**` line wherever a categorization is worth marking. The shorter version only permits tagging; it does not prompt it.

### Checker B

    1. kept: "Any record may be categorized with square-bracket tags, as in `[idea]`."
    2. kept: "This is the system's one tagging protocol."
    3. kept: "No record is excluded from it, and no rule excludes one." / "Universal means every record, of every kind, anywhere." / "Examples are a working-state artifact under `waytide/local/`, a decision log entry, a rule file ..., a journal entry, and a README."
    4. kept: "A tag applies to the whole record or to one list item."
    5. kept: "There is one form, and every record uses it."
    6. kept: "For the whole record, tags go on a dedicated `**Tags:**` line among the canonical lines at the head."
    7. kept: "The `**Tags:**` line goes after `**State:**` where there is one."
    8. kept: "Several tags are separated by spaces, as in `**Tags:** [idea] [decision]`."
    9. kept: "For one list item, the tag prefixes that item's text, as in `- [idea] My great idea is thus`."
    10. less precise: "A record with no head gains one." / "a `**Tags:**` line under its title is its whole head. A tagged entry is two lines." Missing: the condition "when tagged". As written, the sentence reads as if every headless record gains a head, which conflicts with tags being optional.
    11. less precise: "The leading-tag form is discontinued." (with "no leading tag" in item 16). Missing: what the leading-tag form is (a tag placed before the title or text instead of a `**Tags:**` line), and an explicit "must not be used".
    12. kept: "No record is excluded by its shape. A short, one-line, generated, or historical record carries its tags on a `**Tags:**` line."
    13. kept: "Tags are lower-case, in square brackets."
    14. kept: "A multiword tag is dash-separated and lower-case, as in `[legal-matter]`."
    15. kept: "There is no controlled vocabulary. Tags are freeform and introduced as needed."
    16. kept: "Nothing validates a tag, and nothing enumerates the set."
    17. kept: "A tag used once is as legitimate as a tag used a hundred times."
    18. kept: "Tags are optional at every level." / "Every record may be tagged, and none must be."
    19. kept: "A record that is not categorized carries no `**Tags:**` line and no leading tag."
    20. kept: "A list that is not categorized carries no prefixes."
    21. kept: "The absence of tags claims nothing."
    22. kept: "The `**Tags:**` line is the plain text data attribute form: a bold label, a colon, and a value."
    23. kept: "A tag that no rule names is freeform." / "A freeform tag means only that the writer put it there."
    24. kept: "A rule reserves a tag by naming it and saying what follows. Nothing else reserves a tag."
    25. kept: "Nothing is derived from a freeform tag: no filename suffix, no report, no check."
    26. kept: "A rule that wants a set of positions reserves the tags that carry them, or names a new line."
    27. kept: "The reserved set stays small, and each member is named in a rule a reader can find." / "The freeform space around reserved tags is left untouched."
    28. kept: "Reserved and freeform tags sit in the same `**Tags:**` line. Do not put reserved words on a second line beside it."
    29. less precise: "Any record may be categorized with square-bracket tags" / "For the whole record, tags go on a dedicated `**Tags:**` line among the canonical lines at the head." Missing: the instruction to add the line where a categorization is worth marking. The shorter version only permits tagging; it never directs it.

### The re-check, after the repairs

    1 — kept — "Any record may be categorized with square-bracket tags, as in `[idea]`."
    2 — kept — "This is the system's one tagging protocol."
    3 — kept — "No record is excluded from it, and no rule excludes one." / "Universal means every record, of every kind, anywhere." / "Examples are a working-state artifact under `waytide/local/`, a decision log entry, a rule file ..., a journal entry, and a README."
    4 — kept — "A tag applies to the whole record or to one list item."
    5 — kept — "There is one form, and every record uses it."
    6 — kept — "For the whole record, tags go on a dedicated `**Tags:**` line among the canonical lines at the head."
    7 — kept — "The `**Tags:**` line goes after `**State:**` where there is one."
    8 — kept — "Several tags are separated by spaces, as in `**Tags:** [idea] [decision]`."
    9 — kept — "For one list item, the tag prefixes that item's text, as in `- [idea] My great idea is thus`."
    10 — kept — "A record with no head gains one when it is tagged." / "A decision log entry is only a title, so a `**Tags:**` line under its title is its whole head. A tagged entry is two lines."
    11 — kept — "The leading-tag form is discontinued. That form put a tag before the title or text in place of a `**Tags:**` line. Do not use it."
    12 — kept — "No record is excluded by its shape. A short, one-line, generated, or historical record carries its tags on a `**Tags:**` line."
    13 — kept — "Tags are lower-case, in square brackets."
    14 — kept — "A multiword tag is dash-separated and lower-case, as in `[legal-matter]`."
    15 — kept — "There is no controlled vocabulary. Tags are freeform and introduced as needed."
    16 — kept — "Nothing validates a tag, and nothing enumerates the set."
    17 — kept — "A tag used once is as legitimate as a tag used a hundred times."
    18 — kept — "Tags are optional at every level." / "Every record may be tagged, and none must be."
    19 — kept — "A record that is not categorized carries no `**Tags:**` line and no leading tag."
    20 — kept — "A list that is not categorized carries no tag prefixes on its items."
    21 — kept — "The absence of tags claims nothing."
    22 — kept — "The `**Tags:**` line is the plain text data attribute form: a bold label, a colon, and a value."
    23 — kept — "A tag that no rule names is freeform." / "A freeform tag means only that the writer put it there."
    24 — kept — "A rule reserves a tag by naming it and saying what follows. Nothing else reserves a tag."
    25 — kept — "Nothing is derived from a freeform tag: no filename suffix, no report, no check."
    26 — kept — "A rule that wants a set of positions reserves the tags that carry them, or names a new line."
    27 — kept — "The reserved set stays small, and each member is named in a rule a reader can find." / "The freeform space around reserved tags is left untouched."
    28 — kept — "Reserved and freeform tags sit in the same `**Tags:**` line. Do not put reserved words on a second line beside it."
    29 — kept — "Add a `**Tags:**` line wherever a categorization is worth marking." together with "tags go on a dedicated `**Tags:**` line among the canonical lines at the head"

    All 29 directives are kept. None are less precise or lost.

## a-suspension-is-a-log-entry

### The compressor's answer

    1. When the project stops doing something, log it and tag the entry `[suspended]`. That is the whole act.
    2. Nothing moves to any directory. Nothing is kept beside the entry.
    3. Anything the project *did* can be suspended: a rule that became ceremony, a procedure nobody runs, a report nobody reads, a costly step.
    4. Something the project only wanted is not suspended this way.
    5. An item set aside takes `**State:** Suspended` and stays where it is. That is a different act with a different record.

    ## What the entry carries

    1. Like every log entry, the title states what was suspended and why.
    2. The why gives what it cost and what it stopped buying.
    3. The entry names, in its own clause, what else changed.
    4. For example, removing a rule means dropping it from the `Related:` lists that cite it and from the package README's summary, per the rules-convention.
    5. The file is removed in the same commit as the entry.
    6. Git holds the removed text, reachable by path from `master`'s history.

    ## The tag

    1. The entry carries `**Tags:** [suspended]` under its title, separated by a blank line:

    ```
    # The no-stored-recap rule is suspended, its one sentence folded into the log convention

    **Tags:** [suspended]
    ```

    2. This is the one form every record uses, per the a-record-takes-category-tags rule. A log entry's tags sit where an item's and an implementation record's do.
    3. A log entry may carry other tags beside this one.
    4. `[suspended]` is a reserved tag. What it marks is fixed here.
    5. The set of suspensions is read from this tag.

    ## How to apply

    1. When something the project does is no longer justified, remove it.
    2. Reconcile what cites it.
    3. Write one log entry tagged `[suspended]`, saying what was stopped, why, and what else changed.
    4. Commit the removal and the entry together.
    5. Do not keep a copy of the removed thing.
    6. Do not tag an item's log entry this way. An item set aside carries `**State:** Suspended` and is not removed.
    7. **Why:** a former undo queue under `waytide/local/suspended/` held eleven suspended things and none was restored. Its cost was paid on every suspension. The log entry guards against a thing returning reconstructed from memory, naming what was stopped, why, and what else changed, while git holds the text.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the project stops doing something, log it in a log entry and tag that entry `[suspended]`.
    2. A suspension does not move the suspended thing to any directory.
    3. Nothing is kept beside the suspension log entry. In particular, do not keep a copy of the removed thing.
    4. Only something the project actually did can be suspended this way, such as a rule that became ceremony, a procedure nobody runs, a report nobody reads, or a step that costs more than it is worth.
    5. Something the project only wanted is not suspended this way. An item set aside takes `**State:** Suspended` and stays where it is, without being removed.
    6. The suspension log entry's title states what was suspended and why, meaning what it cost and what it stopped buying.
    7. The suspension log entry names, in its own clause, everything else that changed as part of the suspension.
    8. When a rule is suspended, remove it from the `Related:` lists that cite it and from the package README's summary, as the rules-convention requires.
    9. When something is suspended, reconcile whatever cites it.
    10. Remove the suspended thing's file in the same commit as the log entry, and rely on git to hold its text.
    11. The suspension log entry carries `**Tags:** [suspended]` under its title, separated from the title by a blank line.
    12. That tag line uses the one form every record uses, the same position and shape as an item's or an implementation record's tags.
    13. A suspension log entry may carry other tags beside `[suspended]`.
    14. `[suspended]` is a reserved tag. What it marks is fixed by this rule, and the set of suspensions is read from it.
    15. Do not tag an item's log entry `[suspended]`.

### Checker A

    1. kept — "When the project stops doing something, log it and tag the entry `[suspended]`."
    2. kept — "Nothing moves to any directory."
    3. kept — "Nothing is kept beside the entry." / "Do not keep a copy of the removed thing."
    4. less precise — "Anything the project *did* can be suspended: a rule that became ceremony, a procedure nobody runs, a report nobody reads, a costly step." Missing: the "only" restriction is stated as permission and is limited only indirectly, by line 4. "A costly step" is weaker than "costs more than it is worth".
    5. kept — "Something the project only wanted is not suspended this way." / "An item set aside takes `**State:** Suspended` and stays where it is." / "is not removed."
    6. kept — "the title states what was suspended and why." / "The why gives what it cost and what it stopped buying."
    7. kept — "The entry names, in its own clause, what else changed."
    8. less precise — "For example, removing a rule means dropping it from the `Related:` lists that cite it and from the package README's summary, per the rules-convention." Missing: it is framed as an example of what the entry names, not as a direct instruction to do the removal.
    9. kept — "Reconcile what cites it."
    10. kept — "The file is removed in the same commit as the entry." / "Git holds the removed text" / "Commit the removal and the entry together."
    11. kept — "The entry carries `**Tags:** [suspended]` under its title, separated by a blank line."
    12. kept — "This is the one form every record uses ... A log entry's tags sit where an item's and an implementation record's do."
    13. kept — "A log entry may carry other tags beside this one."
    14. kept — "`[suspended]` is a reserved tag. What it marks is fixed here." / "The set of suspensions is read from this tag."
    15. kept — "Do not tag an item's log entry this way."

### Checker B

    1. kept: "When the project stops doing something, log it and tag the entry `[suspended]`."
    2. kept: "Nothing moves to any directory."
    3. kept: "Nothing is kept beside the entry." / "Do not keep a copy of the removed thing."
    4. less precise: "Anything the project *did* can be suspended: a rule that became ceremony, a procedure nobody runs, a report nobody reads, a costly step." Missing: the word "only" (only things the project actually did), though "Something the project only wanted is not suspended this way" partly restores it. "A costly step" is also weaker than "a step that costs more than it is worth".
    5. kept: "Something the project only wanted is not suspended this way." / "An item set aside takes `**State:** Suspended` and stays where it is." / "An item set aside carries `**State:** Suspended` and is not removed."
    6. kept: "the title states what was suspended and why." / "The why gives what it cost and what it stopped buying."
    7. kept: "The entry names, in its own clause, what else changed."
    8. kept: "removing a rule means dropping it from the `Related:` lists that cite it and from the package README's summary, per the rules-convention." It is framed as "For example", but "means" still requires the behavior.
    9. kept: "Reconcile what cites it."
    10. kept: "The file is removed in the same commit as the entry." / "Git holds the removed text" / "Commit the removal and the entry together."
    11. kept: "The entry carries `**Tags:** [suspended]` under its title, separated by a blank line"
    12. kept: "This is the one form every record uses ... A log entry's tags sit where an item's and an implementation record's do."
    13. kept: "A log entry may carry other tags beside this one."
    14. kept: "`[suspended]` is a reserved tag. What it marks is fixed here." / "The set of suspensions is read from this tag."
    15. kept: "Do not tag an item's log entry this way."

### The re-check, after the repairs

    1. kept: "When the project stops doing something, log it and tag the entry `[suspended]`."
    2. kept: "Nothing moves to any directory."
    3. kept: "Nothing is kept beside the entry." / "Do not keep a copy of the removed thing."
    4. kept: "Anything the project *did* can be suspended: a rule that became ceremony, a procedure nobody runs, a report nobody reads, a step that costs more than it is worth. Only what the project did is suspended this way."
    5. kept: "Something the project only wanted is not suspended this way." / "An item set aside takes `**State:** Suspended` and stays where it is." / "An item set aside carries `**State:** Suspended` and is not removed."
    6. kept: "the title states what was suspended and why." / "The why gives what it cost and what it stopped buying."
    7. kept: "The entry names, in its own clause, what else changed."
    8. kept: "removing a rule means dropping it from the `Related:` lists that cite it and from the package README's summary, per the rules-convention." (It is introduced with "For example", but it still states the requirement.)
    9. kept: "Reconcile what cites it."
    10. kept: "The file is removed in the same commit as the entry." / "Git holds the removed text, reachable by path from `master`'s history." / "Commit the removal and the entry together."
    11. kept: "The entry carries `**Tags:** [suspended]` under its title, separated by a blank line"
    12. kept: "This is the one form every record uses, per the a-record-takes-category-tags rule. A log entry's tags sit where an item's and an implementation record's do."
    13. kept: "A log entry may carry other tags beside this one."
    14. kept: "`[suspended]` is a reserved tag. What it marks is fixed here." / "The set of suspensions is read from this tag."
    15. kept: "Do not tag an item's log entry this way."

## a-time-value-carries-minutes-and-seconds

### The compressor's answer

    1. When a datetime written into a file includes a time of day, write that time to seconds.
    2. Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`.
    3. This rule governs only the time's resolution.
    4. The convention that specifies the datetime settles the preceding fields, local versus UTC, and punctuation.
    5. The ISO-8601-UTC filename prefix, `2026-07-01T20-40-00Z-some-name.md`, already carries seconds (see the file-names rule).
    6. The provenance footer, `Mon Jan 1 2026 at 3:45:12 PM PT`, carries seconds because this rule requires it.
    7. A date alone is not a time. A date-only convention, such as a design's **Settled** resolutions, gets no time added.
    8. This rule applies only when a time is written.
    9. A record's title is the first exception. A dated record title is written `Mon Jan 1 2026 18:06`: 24-hour, minutes, no seconds (see the record-title-date-format rule).
    10. The title exception covers titles only. It reaches no other written time.
    11. A journal entry's filename stamp is the second exception. It stops at the minute (see the `journal` package's journal-entries rule).
    12. A journal filename stamp carries seconds only where the writer stated seconds. Do not supply a clock's seconds.
    13. Only these two exceptions exist. Do not assume a third.
    14. A format that wants a further exception must state its own case in its own rule. It must argue from what this rule's defect does not reach.
    15. Never revise a recorded datetime to a resolution it never had. Supplying missing minutes or seconds would falsify the record.
    16. This rule applies to new values only. Leave coarser values already written as they are.
    17. When specifying a new datetime format, specify it to seconds.
    18. This applies to rules, working-state artifacts, log entries, and any other file.
    19. **Why:** a timestamp is useful only while its resolution is finer than the rate of what it records. At hour resolution, footer edits in the same hour produced identical lines, so they went unwritten.

    CONTRADICTIONS: The "How to apply" paragraph says to write the seconds whenever a datetime includes a time of day, in any file, and names no exceptions. The body names two exceptions that do not carry seconds: record titles and journal filename stamps. I kept both as the source has them. Points 9 to 13 keep the exceptions, and point 18 keeps the unqualified scope.

### The directives, as the listing agent gave them

    1. Wherever a datetime written into a file includes a time of day, the time is written to seconds (for example `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`).
    2. This rule governs only the resolution of a written time; which fields precede the time, whether it is local or UTC, and how it is punctuated are left to the convention that specifies the datetime.
    3. The ISO-8601-UTC filename prefix (for example `2026-07-01T20-40-00Z-some-name.md`) carries seconds.
    4. The provenance footer (for example `Mon Jan 1 2026 at 3:45:12 PM PT`) carries seconds.
    5. A convention that records only a date, such as a design's Settled resolutions, is not made to add a time of day; the seconds requirement applies only when a time is written.
    6. A dated record title is written `Mon Jan 1 2026 18:06`: 24-hour, with minutes, and no seconds. This exception covers titles only.
    7. The record-title exception reaches no other written time.
    8. A journal entry's filename stamp stops at the minute and carries seconds only where the writer stated seconds.
    9. Only two exceptions to the seconds requirement exist, record titles and journal-entry filename stamps; a third exception is not assumed.
    10. A format that wants a third exception states its own case in the rule that takes the exception, arguing from what this rule's defect (repeated lines within one file that collide at the same resolution) does not reach.
    11. A recorded datetime is never revised to a resolution it never had; minutes and seconds are not supplied for a past event.
    12. The seconds requirement applies to new values only; coarser datetime values already written stay as they are.
    13. The seconds requirement applies to a datetime with a time of day in any file, including a rule, a working-state artifact, and a log entry.
    14. When specifying a new datetime format that includes a time of day, specify it to seconds.

### Checker A

    1. kept: "When a datetime written into a file includes a time of day, write that time to seconds." / "Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`."
    2. kept: "This rule governs only the time's resolution." / "The convention that specifies the datetime settles the preceding fields, local versus UTC, and punctuation."
    3. kept: "The ISO-8601-UTC filename prefix, `2026-07-01T20-40-00Z-some-name.md`, already carries seconds"
    4. kept: "The provenance footer, `Mon Jan 1 2026 at 3:45:12 PM PT`, carries seconds because this rule requires it."
    5. kept: "A date-only convention, such as a design's **Settled** resolutions, gets no time added." / "This rule applies only when a time is written."
    6. kept: "A dated record title is written `Mon Jan 1 2026 18:06`: 24-hour, minutes, no seconds" / "The title exception covers titles only."
    7. kept: "It reaches no other written time."
    8. kept: "A journal entry's filename stamp is the second exception. It stops at the minute" / "A journal filename stamp carries seconds only where the writer stated seconds."
    9. kept: "Only these two exceptions exist. Do not assume a third."
    10. less precise: "A format that wants a further exception must state its own case in its own rule. It must argue from what this rule's defect does not reach." Missing: the directive defines the defect as repeated lines within one file that collide at the same resolution. The shorter version only suggests it through the Why line's footer example ("footer edits in the same hour produced identical lines").
    11. kept: "Never revise a recorded datetime to a resolution it never had. Supplying missing minutes or seconds would falsify the record."
    12. kept: "This rule applies to new values only. Leave coarser values already written as they are."
    13. kept: "This applies to rules, working-state artifacts, log entries, and any other file." (with "When a datetime written into a file includes a time of day")
    14. less precise: "When specifying a new datetime format, specify it to seconds." Missing: the condition "that includes a time of day". Without it the line seems to require seconds in date-only formats too, which conflicts with line 7.

### Checker B

    1. kept — "When a datetime written into a file includes a time of day, write that time to seconds." / "Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`."
    2. kept — "This rule governs only the time's resolution." / "The convention that specifies the datetime settles the preceding fields, local versus UTC, and punctuation."
    3. kept — "The ISO-8601-UTC filename prefix, `2026-07-01T20-40-00Z-some-name.md`, already carries seconds"
    4. kept — "The provenance footer, `Mon Jan 1 2026 at 3:45:12 PM PT`, carries seconds because this rule requires it."
    5. kept — "A date-only convention, such as a design's **Settled** resolutions, gets no time added." / "This rule applies only when a time is written."
    6. kept — "A dated record title is written `Mon Jan 1 2026 18:06`: 24-hour, minutes, no seconds" / "The title exception covers titles only."
    7. kept — "It reaches no other written time."
    8. kept — "A journal entry's filename stamp is the second exception. It stops at the minute" / "A journal filename stamp carries seconds only where the writer stated seconds."
    9. kept — "Only these two exceptions exist. Do not assume a third."
    10. less precise — "A format that wants a further exception must state its own case in its own rule. It must argue from what this rule's defect does not reach." The defect is not defined as repeated lines within one file that collide at the same resolution. The Why line gives only the hour-resolution footer example.
    11. kept — "Never revise a recorded datetime to a resolution it never had. Supplying missing minutes or seconds would falsify the record."
    12. kept — "This rule applies to new values only. Leave coarser values already written as they are."
    13. kept — "This applies to rules, working-state artifacts, log entries, and any other file." (together with line 1's "includes a time of day")
    14. less precise — "When specifying a new datetime format, specify it to seconds." It drops "that includes a time of day", so it reads as if date-only formats must also go to seconds, which conflicts with line 7.

### The re-check, after the repairs

    All 14 directives are kept in the shorter version. None is less precise or lost.

    1. kept — "When a datetime written into a file includes a time of day, write that time to seconds." / "Write `3:45:12 PM PT`, not `3 PM PT` and not `3:45 PM PT`."
    2. kept — "This rule governs only the time's resolution." / "The convention that specifies the datetime settles the preceding fields, local versus UTC, and punctuation."
    3. kept — "The ISO-8601-UTC filename prefix, `2026-07-01T20-40-00Z-some-name.md`, already carries seconds"
    4. kept — "The provenance footer, `Mon Jan 1 2026 at 3:45:12 PM PT`, carries seconds because this rule requires it."
    5. kept — "A date-only convention, such as a design's **Settled** resolutions, gets no time added." / "This rule applies only when a time is written."
    6. kept — "A dated record title is written `Mon Jan 1 2026 18:06`: 24-hour, minutes, no seconds" / "The title exception covers titles only."
    7. kept — "It reaches no other written time."
    8. kept — "A journal entry's filename stamp is the second exception. It stops at the minute" / "A journal filename stamp carries seconds only where the writer stated seconds."
    9. kept — "Only these two exceptions exist. Do not assume a third."
    10. kept — "A format that wants a further exception must state its own case in its own rule. It must argue from what this rule's defect does not reach. The defect is a repeated line within one file, whose entries collide at the same resolution."
    11. kept — "Never revise a recorded datetime to a resolution it never had. Supplying missing minutes or seconds would falsify the record."
    12. kept — "This rule applies to new values only. Leave coarser values already written as they are."
    13. kept — "This applies to rules, working-state artifacts, log entries, and any other file."
    14. kept — "When specifying a new datetime format that includes a time of day, specify it to seconds."

## a-vocabulary-entry-says-what-a-term-means-not-what-it-was

### The compressor's answer

    1. A vocabulary entry states the term's current meaning and stops there.
    2. Write the entry in the present tense, saying what the term means now.
    3. Give the STE note, the category, and any distinction against a neighbouring term.
    4. An entry records no lifecycle history.
    5. Do not record what the term used to name, or what directory it used to sit in.
    6. Do not record when the term changed, or what governed it before.
    7. When a term changes meaning, moves, or stops being used, write the change in the decision log, per the decision-log-convention.
    8. Leave the entry saying only what is true now.
    9. An entry carries no pointers.
    10. Do not write *Its rule is …* or *see the … rule*. Name no rule the reader should go and read.
    11. Send the reader to no other vocabulary, and to no section elsewhere in the file.

    ## What is not lifecycle history

    1. The reason a substitution exists is part of the entry. Say why a substitution substitutes.
    2. Example: *`log` is taken by the decision log, and `personal journal` needs a qualifier to hold the two apart*.
    3. The STE note stays whole: what the STE dictionary says, the reserved category, and the reservation mechanism its note names.
    4. The STE note's own citation is part of the note, not a pointer.
    5. A distinction against a neighbouring term stays, and is not a pointer even when it names the neighbour.
    6. The test is the tense. A clause carrying a date, an *until*, a *was*, or a *no longer* records a change, and belongs in the log.

    ## Where the history goes

    1. History goes to the decision log.
    2. A discontinuation, under the vocabulary-convention's own heading, is not an exception.
    3. A discontinuation entry names the word and says it is not used.
    4. It does not narrate when the word was dropped or what carried it before.
    5. **Why:** a vocabulary is read to settle what a word means now. History clauses accumulate and invite doubt about whether the old meaning still applies.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A vocabulary entry states the term's current meaning and stops there.
    2. A vocabulary entry records no lifecycle history: not what the term used to name, what directory it used to sit in, when it changed, or what governed it before.
    3. Lifecycle history of a vocabulary term belongs in the decision log, not in the vocabulary entry.
    4. A vocabulary entry carries no pointers: not "Its rule is …", not "see the … rule", and not a reference sending the reader to another vocabulary or to a section elsewhere in the file.
    5. A vocabulary entry for a substitution may say why the substitution exists (why one word is written and another is not); that reason is not lifecycle history.
    6. The STE note in a vocabulary entry stays whole: what the STE dictionary says about the word, the category it is reserved in, and the reservation mechanism its note names.
    7. The STE note's own citation stays as part of the note and is not treated as a pointer out of the entry.
    8. A distinction against a neighbouring term stays in a vocabulary entry, and it is not a pointer even when it names the neighbouring term.
    9. Test a clause by its tense: a clause carrying a date, an "until", a "was", or a "no longer" is recording a change, and that change belongs to the decision log, not the entry.
    10. A term that changes meaning, moves, or stops being used is a decision, and is recorded in the decision log under the decision-log-convention.
    11. A discontinuation entry names the word and says it is not used; it does not narrate when the word was dropped or what carried it before.
    12. Write a vocabulary entry in the present tense, saying what the term means now.
    13. Give the STE note, the category, and any distinction against a neighbouring term in the vocabulary entry.
    14. Say why a substitution substitutes in its vocabulary entry.
    15. When a term changes, write the change in the decision log and leave the vocabulary entry saying only what is true now.
    16. Name no rule in a vocabulary entry that the reader should go and read; a reader who wants the rule finds it by the term.

### Checker A

    1. kept — "A vocabulary entry states the term's current meaning and stops there."
    2. kept — "An entry records no lifecycle history." / "Do not record what the term used to name, or what directory it used to sit in." / "Do not record when the term changed, or what governed it before."
    3. kept — "History goes to the decision log." / "belongs in the log"
    4. kept — "An entry carries no pointers." / "Do not write *Its rule is …* or *see the … rule*." / "Send the reader to no other vocabulary, and to no section elsewhere in the file."
    5. kept — "What is not lifecycle history" / "The reason a substitution exists is part of the entry."
    6. kept — "The STE note stays whole: what the STE dictionary says, the reserved category, and the reservation mechanism its note names."
    7. kept — "The STE note's own citation is part of the note, not a pointer."
    8. kept — "A distinction against a neighbouring term stays, and is not a pointer even when it names the neighbour."
    9. kept — "The test is the tense. A clause carrying a date, an *until*, a *was*, or a *no longer* records a change, and belongs in the log."
    10. kept — "When a term changes meaning, moves, or stops being used, write the change in the decision log, per the decision-log-convention."
    11. kept — "A discontinuation entry names the word and says it is not used." / "It does not narrate when the word was dropped or what carried it before."
    12. kept — "Write the entry in the present tense, saying what the term means now."
    13. kept — "Give the STE note, the category, and any distinction against a neighbouring term."
    14. kept — "Say why a substitution substitutes."
    15. kept — "write the change in the decision log" / "Leave the entry saying only what is true now."
    16. less precise — "Name no rule the reader should go and read." Missing: the reason given, that a reader who wants the rule finds it by the term.

### Checker B

    1. kept — "A vocabulary entry states the term's current meaning and stops there."
    2. kept — "An entry records no lifecycle history." / "Do not record what the term used to name, or what directory it used to sit in." / "Do not record when the term changed, or what governed it before."
    3. kept — "History goes to the decision log." / "write the change in the decision log"
    4. kept — "An entry carries no pointers." / "Do not write *Its rule is …* or *see the … rule*." / "Send the reader to no other vocabulary, and to no section elsewhere in the file."
    5. kept — "The reason a substitution exists is part of the entry. Say why a substitution substitutes." (under the heading "What is not lifecycle history")
    6. kept — "The STE note stays whole: what the STE dictionary says, the reserved category, and the reservation mechanism its note names."
    7. kept — "The STE note's own citation is part of the note, not a pointer."
    8. kept — "A distinction against a neighbouring term stays, and is not a pointer even when it names the neighbour."
    9. kept — "The test is the tense. A clause carrying a date, an *until*, a *was*, or a *no longer* records a change, and belongs in the log."
    10. kept — "When a term changes meaning, moves, or stops being used, write the change in the decision log, per the decision-log-convention." (It does not say the change "is a decision", but the required behavior is the same.)
    11. kept — "A discontinuation entry names the word and says it is not used." / "It does not narrate when the word was dropped or what carried it before."
    12. kept — "Write the entry in the present tense, saying what the term means now."
    13. kept — "Give the STE note, the category, and any distinction against a neighbouring term."
    14. kept — "Say why a substitution substitutes."
    15. kept — "write the change in the decision log, per the decision-log-convention." / "Leave the entry saying only what is true now."
    16. kept — "Name no rule the reader should go and read." (The reason clause "a reader who wants the rule finds it by the term" is left out. It is a justification, not a behavior.)

## ask-at-once-when-a-preference-is-expressed

### The compressor's answer

    1. When the engineer states a preference about how the work is done, interrupt the work and ask whether to record it.
    2. Ask through the selection interface, per the present-every-prompt-through-askuserquestion rule.
    3. Do not carry the preference silently.
    4. Do not wait for the task to finish before asking.
    5. A preference does not count as a rule until it is written down.

    ## What counts

    1. A statement about how the work is done, rather than about the artifact in front of you, is a preference.
    2. *Answer in lists*, *never offer to conclude an experiment*, and *say writer rather than user* are each a preference.
    3. A statement about this one artifact is an instruction.
    4. Carry out an instruction. Do not ask about it.
    5. *Make that sentence shorter* is an instruction.
    6. The test is whether the statement would still hold next week.
    7. If it would still hold, it is a candidate for a rule.
    8. If it would not, it is an instruction, and nothing is asked.

    ## The three candidates

    1. The selection offers all three candidates as real options.
    2. **A rule** goes in `waytide/local/rules/`, with the matching `waytide/local/logs/log/` entry that the rules-convention requires.
    3. **An observation** goes in `waytide/local/items/`, for when the thinking has not settled.
    4. Per the observations-convention, prefer an observation when in doubt.
    5. **Neither** applies when the engineer does not want the preference recorded.
    6. Accept "neither" without argument.
    7. If the engineer declines to record a preference, do not ask about it again in the same session.
    8. Record the engineer's own words, not a paraphrase.
    9. Capture the words when they are said. Do not write the rule later from memory.
    10. **Why:** The project-context-lives-in-the-committed-artifacts rule forbids holding a preference in an agent memory store. So the path to a written rule must be short enough that nothing needs holding. Asking at once keeps it short. If the ask waits until the end of the task, the engineer's wording is lost.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the engineer expresses a preference about how the work is done, interrupt the work and ask whether it is recorded.
    2. Ask through the selection interface, per the present-every-prompt-through-askuserquestion rule.
    3. Do not carry the engineer's preference silently.
    4. Do not wait for the task to finish before asking whether the preference is recorded.
    5. A statement about how the work is done, rather than about the artifact in front of you, counts as a preference to be asked about.
    6. A statement about this one artifact is an instruction, and it is carried out rather than asked about.
    7. Test whether a statement would still hold next week: where it would, it is a candidate for a rule; where it would not, it is an instruction and nothing is asked.
    8. The selection must carry all three candidates: a rule, an observation, and neither.
    9. A rule is recorded in `waytide/local/rules/`, with the matching `waytide/local/logs/log/` entry the rules-convention requires.
    10. An observation is recorded in `waytide/local/items/`, where the thinking has not stabilized.
    11. Where there is doubt, prefer recording an observation over a rule, per the observations-convention.
    12. Where the engineer does not want the preference recorded ("neither"), take that answer without argument.
    13. Do not ask again in the same session about a preference the engineer declined to record.
    14. Record the engineer's own words, not a paraphrase or the agent's own reading of the preference written from memory.
    15. Do not hold a preference in an agent memory store (forbidden by the project-context-lives-in-the-committed-artifacts rule); the path from preference to written rule must be short enough that nothing needs holding.

### Checker A

    1. kept — "When the engineer states a preference about how the work is done, interrupt the work and ask whether to record it." (the original says "whether it is recorded"; the shorter version says "whether to record it", which asks for the same thing)
    2. kept — "Ask through the selection interface, per the present-every-prompt-through-askuserquestion rule."
    3. kept — "Do not carry the preference silently."
    4. kept — "Do not wait for the task to finish before asking."
    5. kept — "A statement about how the work is done, rather than about the artifact in front of you, is a preference."
    6. kept — "A statement about this one artifact is an instruction." / "Carry out an instruction. Do not ask about it."
    7. kept — "The test is whether the statement would still hold next week." / "If it would still hold, it is a candidate for a rule." / "If it would not, it is an instruction, and nothing is asked."
    8. kept — "The selection offers all three candidates as real options." together with "**A rule**", "**An observation**", "**Neither**"
    9. kept — "**A rule** goes in `waytide/local/rules/`, with the matching `waytide/local/logs/log/` entry that the rules-convention requires."
    10. kept — "**An observation** goes in `waytide/local/items/`, for when the thinking has not settled."
    11. kept — "Per the observations-convention, prefer an observation when in doubt."
    12. kept — "**Neither** applies when the engineer does not want the preference recorded." / "Accept \"neither\" without argument."
    13. kept — "If the engineer declines to record a preference, do not ask about it again in the same session."
    14. kept — "Record the engineer's own words, not a paraphrase." / "Capture the words when they are said. Do not write the rule later from memory."
    15. kept — "The project-context-lives-in-the-committed-artifacts rule forbids holding a preference in an agent memory store. So the path to a written rule must be short enough that nothing needs holding."

### Checker B

    1. kept — "When the engineer states a preference about how the work is done, interrupt the work and ask whether to record it."
    2. kept — "Ask through the selection interface, per the present-every-prompt-through-askuserquestion rule."
    3. kept — "Do not carry the preference silently."
    4. kept — "Do not wait for the task to finish before asking."
    5. kept — "A statement about how the work is done, rather than about the artifact in front of you, is a preference."
    6. kept — "A statement about this one artifact is an instruction." / "Carry out an instruction. Do not ask about it."
    7. kept — "The test is whether the statement would still hold next week." / "If it would still hold, it is a candidate for a rule." / "If it would not, it is an instruction, and nothing is asked."
    8. kept — "The selection offers all three candidates as real options." together with the bolded "A rule", "An observation", "Neither"
    9. kept — "A rule goes in `waytide/local/rules/`, with the matching `waytide/local/logs/log/` entry that the rules-convention requires."
    10. kept — "An observation goes in `waytide/local/items/`, for when the thinking has not settled."
    11. kept — "Per the observations-convention, prefer an observation when in doubt."
    12. kept — "Neither applies when the engineer does not want the preference recorded." / "Accept "neither" without argument."
    13. kept — "If the engineer declines to record a preference, do not ask about it again in the same session."
    14. kept — "Record the engineer's own words, not a paraphrase." / "Capture the words when they are said. Do not write the rule later from memory."
    15. kept — "The project-context-lives-in-the-committed-artifacts rule forbids holding a preference in an agent memory store. So the path to a written rule must be short enough that nothing needs holding."

    Verdict: the shorter version carries all 15 directives. None are lost or less precise.

    Two close calls, both judged kept:
    - **Directive 1:** the original says "ask whether it is recorded" and the shorter version says "ask whether to record it". Both ask the same question, so the behavior is the same.
    - **Directive 14:** the original also excludes "the agent's own reading of the preference". The shorter version says "not a paraphrase" and "Capture the words when they are said". Together these still require the engineer's exact words.

## decision-log-convention

### The compressor's answer

    1. Record each decision made during a session as its own file in `waytide/local/logs/log/`.
    2. Write one file per decision.
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
    4. An entry takes a body where it carries reasoning that will not fit a title.
    5. An abandonment takes a body, giving the reason the work stopped.
    6. A body is prose under the title, with no template.
    7. A body never holds the work that did not happen, per the the-log-never-says-undone-work-was-done rule.
    8. An entry that carries tags takes a `**Tags:**` line under the title, separated by a blank line, per the a-record-takes-category-tags rule.
    9. An untagged entry is one line.
    10. A log entry takes no provenance footer.
    11. It is exempt from the working-state-artifacts-carry-a-provenance-footer rule, since its filename and commit already carry author and time.

    ## Commit

    1. Commit a log entry in the same commit as the change it describes, or separately with a `Log:` prefix.
    2. Do not hold entries uncommitted.

    ## Consolidation

    1. Never consolidate the log on your own initiative.
    2. Do not combine, merge, rewrite, or reformat log files.
    3. Do not propose doing so.
    4. Consolidate only on the user's explicit command, and only after it is confirmed with the project's stakeholders.
    5. For a readable overview, generate a summary of the log at read time instead.
    6. Never write that summary to a file.
    7. Give it in the response instead.

    8. **Why:** a project's decisions are easy to lose and expensive to reconstruct. A one-line-per-decision log, append-only and committed with the code, keeps a complete, skimmable, durable record.

    CONTRADICTIONS: The source says "An entry takes a body where it carries reasoning that will not fit a title" (bodies permitted), but also says "An untagged entry is one line" without qualification, and its How to apply says "write a titled one-line entry". Read literally, an untagged entry with a reasoning body (such as an abandonment) is both permitted and ruled out. Both statements are kept above as the source has them (Content points 4 and 9).

### The directives, as the listing agent gave them

    1. Record decisions made during sessions as one file per decision in `waytide/local/logs/log/`.
    2. Write a log entry whenever a real decision is made (the user picks among alternatives, accepts or rejects an approach, or sets a rule that will guide future work).
    3. Do not wait to be asked before writing a log entry for a decision.
    4. When in doubt whether something is a decision, log it.
    5. A log entry's filename follows the ISO-8601-UTC prefix convention of the file-names rule.
    6. Compute a log entry's filename prefix with `date -u +%Y-%m-%dT%H-%M-%SZ`.
    7. A log entry's filename uses UTC, never local time.
    8. A log entry contains a `# <title>` that states the decision.
    9. A log entry is ordinarily one line, the title and nothing else.
    10. A log entry takes a body only where it carries reasoning that will not fit in a title.
    11. An entry recording an abandonment takes a body that gives the reason the work stopped.
    12. A log entry's body is prose under the title, with no template.
    13. A log entry's body never holds the work that did not happen (see the the-log-never-says-undone-work-was-done rule).
    14. A log entry that carries tags takes a `**Tags:**` line under the title, in the one form every record uses (see the a-record-takes-category-tags rule).
    15. A log entry's `**Tags:**` line is separated from the title by a blank line.
    16. An untagged log entry is one line.
    17. Keep a log entry's title informative enough to skim.
    18. A log entry takes no provenance footer; it is exempt from the working-state-artifacts-carry-a-provenance-footer rule.
    19. Commit a log entry in the same commit as the change it describes, or commit it separately with a `Log:` prefix.
    20. Do not hold log entries uncommitted.
    21. Do not combine, merge, rewrite, or reformat log files on the agent's own initiative.
    22. Do not propose combining, merging, rewriting, or reformatting log files.
    23. Treat the log as an append-only record of what was decided and when.
    24. Consolidate the log only on the explicit command of the user, and only after the consolidation is confirmed with the project's stakeholders.
    25. For a readable overview of the log, give a summary generated at read time, in the response, rather than consolidating the files.
    26. Never write a summary of the log to a file.
    27. A new rule is paired with a log entry (per the rules-convention).
    28. The observations-convention's recording step writes a log entry.
    29. An item, deferred work included, takes a log entry on creation and on each change of its state (per the an-item-takes-a-log-entry rule).
    30. A decision the engineer made carries the `[decision]` tag (per the a-decision-the-engineer-made-is-tagged-decision rule).

### Checker A

    1. kept — "Record each decision made during a session as its own file in `waytide/local/logs/log/`."
    2. kept — "Write an entry whenever a real decision is made." / "A real decision is the user picking among alternatives, accepting or rejecting an approach, or setting a rule that will guide future work."
    3. kept — "Do not wait to be asked."
    4. kept — "When in doubt, log it."
    5. kept — "Use the ISO-8601-UTC prefix convention of the file-names rule."
    6. kept — "Compute the prefix with `date -u +%Y-%m-%dT%H-%M-%SZ`."
    7. kept — "Use UTC, never local time."
    8. kept — "Start the entry with a `# <title>` that states the decision."
    9. kept — "One line is the ordinary case." / "Give each entry a one-line title."
    10. less precise — "An entry takes a body where it carries reasoning that will not fit a title." Missing: "only". The body is no longer restricted to that case.
    11. kept — "An abandonment takes a body, giving the reason the work stopped."
    12. kept — "A body is prose under the title, with no template."
    13. kept — "A body never holds the work that did not happen, per the the-log-never-says-undone-work-was-done rule."
    14. kept — "An entry that carries tags takes a `**Tags:**` line under the title, ... per the a-record-takes-category-tags rule" (and Related: "in the one form").
    15. kept — "separated by a blank line"
    16. kept — "An untagged entry is one line."
    17. kept — "Keep the title informative enough to skim."
    18. kept — "A log entry takes no provenance footer." / "It is exempt from the working-state-artifacts-carry-a-provenance-footer rule"
    19. kept — "Commit a log entry in the same commit as the change it describes, or separately with a `Log:` prefix."
    20. kept — "Do not hold entries uncommitted."
    21. kept — "Never consolidate the log on your own initiative." / "Do not combine, merge, rewrite, or reformat log files."
    22. kept — "Do not propose doing so."
    23. less precise — "append-only and committed with the code" appears only in the **Why** rationale. Missing: a directive to treat the log as an append-only record of what was decided and when.
    24. kept — "Consolidate only on the user's explicit command, and only after it is confirmed with the project's stakeholders."
    25. kept — "For a readable overview, generate a summary of the log at read time instead." / "Give it in the response instead."
    26. kept — "Never write that summary to a file."
    27. kept — Related: "the rules-convention — a new rule pairs with a log entry"
    28. kept — Related: "the observations-convention — its recording step logs too"
    29. kept — Related: "the an-item-takes-a-log-entry rule — an item, deferred work included, logs on creation and on each change of state"
    30. kept — Related: "the a-decision-the-engineer-made-is-tagged-decision rule — `[decision]`, the tag an engineer's decision carries"

    Note on 27–30: the shorter version carries these only as annotations in its Related list, not as numbered directives. They are judged kept because the words state the requirement, and the originals were themselves pointers to other rules.

### Checker B

    1. kept — "Record each decision made during a session as its own file in `waytide/local/logs/log/`."
    2. kept — "Write an entry whenever a real decision is made." / "A real decision is the user picking among alternatives, accepting or rejecting an approach, or setting a rule that will guide future work."
    3. kept — "Do not wait to be asked."
    4. kept — "When in doubt, log it."
    5. kept — "Use the ISO-8601-UTC prefix convention of the file-names rule."
    6. kept — "Compute the prefix with `date -u +%Y-%m-%dT%H-%M-%SZ`."
    7. kept — "Use UTC, never local time."
    8. kept — "Start the entry with a `# <title>` that states the decision."
    9. kept — "One line is the ordinary case." / "Give each entry a one-line title."
    10. less precise — "An entry takes a body where it carries reasoning that will not fit a title." Missing: "only". The shorter version says when a body is allowed, but not that a body is limited to that case.
    11. kept — "An abandonment takes a body, giving the reason the work stopped."
    12. kept — "A body is prose under the title, with no template."
    13. kept — "A body never holds the work that did not happen, per the the-log-never-says-undone-work-was-done rule."
    14. kept — "An entry that carries tags takes a `**Tags:**` line under the title, ... per the a-record-takes-category-tags rule." (the Related list adds "in the one form")
    15. kept — "separated by a blank line"
    16. kept — "An untagged entry is one line."
    17. kept — "Keep the title informative enough to skim."
    18. kept — "A log entry takes no provenance footer." / "It is exempt from the working-state-artifacts-carry-a-provenance-footer rule"
    19. kept — "Commit a log entry in the same commit as the change it describes, or separately with a `Log:` prefix."
    20. kept — "Do not hold entries uncommitted."
    21. kept — "Never consolidate the log on your own initiative." / "Do not combine, merge, rewrite, or reformat log files."
    22. kept — "Do not propose doing so."
    23. less precise — "append-only and committed with the code" appears only in the **Why:** rationale. Missing: a directive to treat the log as an append-only record of what was decided and when.
    24. kept — "Consolidate only on the user's explicit command, and only after it is confirmed with the project's stakeholders."
    25. kept — "For a readable overview, generate a summary of the log at read time instead." / "Give it in the response instead."
    26. kept — "Never write that summary to a file."
    27. kept — "the rules-convention — a new rule pairs with a log entry" (in the Related list only)
    28. kept — "the observations-convention — its recording step logs too" (in the Related list only)
    29. kept — "the an-item-takes-a-log-entry rule — an item, deferred work included, logs on creation and on each change of state" (in the Related list only)
    30. kept — "the a-decision-the-engineer-made-is-tagged-decision rule — `[decision]`, the tag an engineer's decision carries" (in the Related list only)

### The re-check, after the repairs

    1. kept: "Record each decision made during a session as its own file in `waytide/local/logs/log/`."
    2. kept: "Write an entry whenever a real decision is made." / "A real decision is the user picking among alternatives, accepting or rejecting an approach, or setting a rule that will guide future work."
    3. kept: "Do not wait to be asked."
    4. kept: "When in doubt, log it."
    5. kept: "Use the ISO-8601-UTC prefix convention of the file-names rule."
    6. kept: "Compute the prefix with `date -u +%Y-%m-%dT%H-%M-%SZ`."
    7. kept: "Use UTC, never local time."
    8. kept: "Start the entry with a `# <title>` that states the decision."
    9. kept: "One line is the ordinary case." (with "Give each entry a one-line title.")
    10. kept: "An entry takes a body only where it carries reasoning that will not fit a title."
    11. kept: "An abandonment takes a body, giving the reason the work stopped."
    12. kept: "A body is prose under the title, with no template."
    13. kept: "A body never holds the work that did not happen, per the the-log-never-says-undone-work-was-done rule."
    14. kept: "An entry that carries tags takes a `**Tags:**` line under the title, ... per the a-record-takes-category-tags rule" (and in Related: "the `**Tags:**` line an entry carries, in the one form")
    15. kept: "separated by a blank line"
    16. kept: "An untagged entry is one line."
    17. kept: "Keep the title informative enough to skim."
    18. kept: "A log entry takes no provenance footer." / "It is exempt from the working-state-artifacts-carry-a-provenance-footer rule"
    19. kept: "Commit a log entry in the same commit as the change it describes, or separately with a `Log:` prefix."
    20. kept: "Do not hold entries uncommitted."
    21. kept: "Never consolidate the log on your own initiative." / "Do not combine, merge, rewrite, or reformat log files." (This is stated without the "on your own initiative" condition, which makes it stricter, not weaker.)
    22. kept: "Do not propose doing so."
    23. kept: "Treat the log as an append-only record of what was decided and when."
    24. kept: "Consolidate only on the user's explicit command, and only after it is confirmed with the project's stakeholders."
    25. kept: "For a readable overview, generate a summary of the log at read time instead." / "Give it in the response instead."
    26. kept: "Never write that summary to a file."
    27. less precise: "the rules-convention — a new rule pairs with a log entry". This appears only as a gloss in the Related list, not as a stated directive.
    28. less precise: "the observations-convention — its recording step logs too". This appears only as a gloss in the Related list, not as a stated directive.
    29. less precise: "the an-item-takes-a-log-entry rule — an item, deferred work included, logs on creation and on each change of state". This appears only as a gloss in the Related list, not as a stated directive.
    30. less precise: "the a-decision-the-engineer-made-is-tagged-decision rule — `[decision]`, the tag an engineer's decision carries". This appears only as a gloss in the Related list, not as a stated directive.

## disclosure-is-the-one-reason-to-edit-a-historical-record

### The compressor's answer

    1. A historical record states what was true when it was written.
    2. Historical records include decision-log entries, work session records, experiment records, feature records, and completed migration records.
    3. Do not revise a historical record to suit a later convention.
    4. Do not rename, reformat, or correct a since-replaced term in a historical record.
    5. Do not revise it for any other reason a reader might want it to read differently.
    6. The one exception is disclosure.
    7. Where a record names something that should not have been disclosed, correct it.

    ## What counts

    1. The test is whether the content is the project's to publish, not whether it is wrong.
    2. Another party's project, client, or repository, named only incidentally, is not the project's to publish.
    3. A path, hostname, or machine layout describing someone's environment rather than the work is not the project's to publish.
    4. A credential, key, or token is not the project's to publish, and is a security matter first.
    5. Anything the engineer says should not be there is not the project's to publish.
    6. The engineer, not the agent, is the authority on what should not be there.
    7. Judge a record's reach as beyond its repository, since repositories are public and rules are installed on other people's machines.

    ## Reduce resolution rather than falsify

    1. Reduce resolution rather than falsify.
    2. Remove the disclosure and keep the record true.
    3. Remove only the naming.
    4. A record that reached three projects still reads as having reached three.
    5. *"Each of the three projects holding it"* is less specific than three names and is not less accurate.
    6. Never make the record say something that did not happen.
    7. Never delete an increment that ran, change a count, or reattribute work.
    8. Where the removal leaves a reader unable to follow what happened, state in the record what class of thing was removed and why.

    ## What this does not reach

    1. The correction does not reach the git history or any component repository the content was published to.
    2. Rewriting that history is the engineer's decision, not a consequence of this rule.
    3. When a correction is made, tell the engineer what the edit did and did not accomplish.
    4. Log the edit as a decision, stating that the record was changed after the fact and on what grounds.
    5. **Why:** a record is left as written because it is evidence, but that does not extend to content the project had no standing to publish. Naming the engineer as the authority keeps an agent from either exposing something because records are immutable or scrubbing a record on a guess.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A historical record (a decision-log entry, a work session record, an experiment record, a feature record, or a completed migration record) states what was true when it was written and is not revised to suit a later convention. That includes renaming, reformatting, correcting a term the project has since replaced, and every other reason a reader might want it to read differently.
    2. Where a historical record names something that should not have been disclosed, it is corrected.
    3. Whether a record's content is a disclosure is decided by whether it is the project's to publish, not by whether it is wrong.
    4. Another party's project, client, or repository, named only incidentally, counts as content that is not the project's to publish.
    5. A path, hostname, or machine layout that describes someone's environment rather than the work counts as content that is not the project's to publish.
    6. A credential, key, or token in a record counts as content that is not the project's to publish, and is treated as a security matter before a disclosure one.
    7. Anything the engineer says should not be in a record counts as content that is not the project's to publish.
    8. The engineer, not the agent, is the authority on what should not be disclosed. The agent does not scrub a record on its own guess about what is sensitive.
    9. A record's reach is judged as public and extending to other people's machines, not limited to the repository it sits in.
    10. The correction removes the disclosure and keeps every claim the record makes true, by stating it at a lower resolution (for example, "each of the three projects holding it" in place of three names).
    11. Only the disclosing naming is removed. Everything else the record says stays.
    12. A correction never makes the record say something that did not happen: no deleting an increment that ran, changing a count, or reattributing work.
    13. Where the removal leaves a reader unable to follow what happened, the record itself says what class of thing was removed and why.
    14. Removing the disclosed content from git history, or from component repositories it was published to, is the engineer's decision and is not done as part of this correction.
    15. When a correction is made, the agent tells the engineer that the git history (and any component repository the content was published to) still holds the removed content.
    16. The edit is logged as a decision, and the log entry records that the record was changed after the fact and on what grounds.

### Checker A

    1. kept — "A historical record states what was true when it was written." / "Historical records include decision-log entries, work session records, experiment records, feature records, and completed migration records." / "Do not revise a historical record to suit a later convention." / "Do not rename, reformat, or correct a since-replaced term in a historical record." / "Do not revise it for any other reason a reader might want it to read differently."
    2. kept — "Where a record names something that should not have been disclosed, correct it."
    3. kept — "The test is whether the content is the project's to publish, not whether it is wrong."
    4. kept — "Another party's project, client, or repository, named only incidentally, is not the project's to publish."
    5. kept — "A path, hostname, or machine layout describing someone's environment rather than the work is not the project's to publish."
    6. kept — "A credential, key, or token is not the project's to publish, and is a security matter first."
    7. kept — "Anything the engineer says should not be there is not the project's to publish."
    8. kept — "The engineer, not the agent, is the authority on what should not be there." / "keeps an agent from ... scrubbing a record on a guess" (the ban on scrubbing by guess appears only in the Why paragraph, but it does state it)
    9. kept — "Judge a record's reach as beyond its repository, since repositories are public and rules are installed on other people's machines."
    10. kept — "Remove the disclosure and keep the record true." / "*"Each of the three projects holding it"* is less specific than three names and is not less accurate." / "Reduce resolution rather than falsify."
    11. kept — "Remove only the naming." (Read in context, "the naming" is the disclosing one, and "only" means everything else stays.)
    12. kept — "Never make the record say something that did not happen." / "Never delete an increment that ran, change a count, or reattribute work."
    13. kept — "Where the removal leaves a reader unable to follow what happened, state in the record what class of thing was removed and why."
    14. kept — "The correction does not reach the git history or any component repository the content was published to." / "Rewriting that history is the engineer's decision, not a consequence of this rule."
    15. less precise — "When a correction is made, tell the engineer what the edit did and did not accomplish." Missing: it never says outright that the agent must tell the engineer the git history and component repositories still hold the removed content. You can only infer it from the line above.
    16. kept — "Log the edit as a decision, stating that the record was changed after the fact and on what grounds."

### Checker B

    1. kept — "A historical record states what was true when it was written." / "Do not revise a historical record to suit a later convention." / "Do not rename, reformat, or correct a since-replaced term in a historical record." / "Do not revise it for any other reason a reader might want it to read differently." (the list of record types is on line 2)
    2. kept — "Where a record names something that should not have been disclosed, correct it."
    3. kept — "The test is whether the content is the project's to publish, not whether it is wrong."
    4. kept — "Another party's project, client, or repository, named only incidentally, is not the project's to publish."
    5. kept — "A path, hostname, or machine layout describing someone's environment rather than the work is not the project's to publish."
    6. kept — "A credential, key, or token is not the project's to publish, and is a security matter first."
    7. kept — "Anything the engineer says should not be there is not the project's to publish."
    8. less precise — "The engineer, not the agent, is the authority on what should not be there." / "keeps an agent from ... scrubbing a record on a guess". Missing: the ban on the agent scrubbing a record on its own guess appears only in the Why rationale, not as a directive.
    9. kept — "Judge a record's reach as beyond its repository, since repositories are public and rules are installed on other people's machines."
    10. kept — "Remove the disclosure and keep the record true." / "Reduce resolution rather than falsify." / "*\"Each of the three projects holding it\"* is less specific than three names and is not less accurate."
    11. kept — "Remove only the naming." (the context limits it to the disclosing naming, and "keep the record true" covers the rest)
    12. kept — "Never make the record say something that did not happen." / "Never delete an increment that ran, change a count, or reattribute work."
    13. kept — "Where the removal leaves a reader unable to follow what happened, state in the record what class of thing was removed and why."
    14. kept — "The correction does not reach the git history or any component repository the content was published to." / "Rewriting that history is the engineer's decision, not a consequence of this rule."
    15. less precise — "When a correction is made, tell the engineer what the edit did and did not accomplish." Missing: it does not say outright that the engineer must be told the git history and component repositories still hold the removed content. That can only be inferred from line 34.
    16. kept — "Log the edit as a decision, stating that the record was changed after the fact and on what grounds."

    Totals: 14 kept, 2 less precise (8 and 15), 0 lost.

### The re-check, after the repairs

    1. kept: "A historical record states what was true when it was written." / "Historical records include decision-log entries, work session records, experiment records, feature records, and completed migration records." / "Do not revise a historical record to suit a later convention." / "Do not rename, reformat, or correct a since-replaced term in a historical record." / "Do not revise it for any other reason a reader might want it to read differently."
    2. kept: "Where a record names something that should not have been disclosed, correct it."
    3. kept: "The test is whether the content is the project's to publish, not whether it is wrong."
    4. kept: "Another party's project, client, or repository, named only incidentally, is not the project's to publish."
    5. kept: "A path, hostname, or machine layout describing someone's environment rather than the work is not the project's to publish."
    6. kept: "A credential, key, or token is not the project's to publish, and is a security matter first."
    7. kept: "Anything the engineer says should not be there is not the project's to publish."
    8. kept: "The engineer, not the agent, is the authority on what should not be there. Do not scrub a record on a guess."
    9. kept: "Judge a record's reach as beyond its repository, since repositories are public and rules are installed on other people's machines."
    10. kept: "Reduce resolution rather than falsify." / "Remove the disclosure and keep the record true." / "*"Each of the three projects holding it"* is less specific than three names and is not less accurate."
    11. less precise: "Remove only the naming." Missing: it does not say outright that only the *disclosing* naming goes, and it does not say that everything else in the record stays. Both follow from context but are not stated.
    12. kept: "Never make the record say something that did not happen." / "Never delete an increment that ran, change a count, or reattribute work."
    13. kept: "Where the removal leaves a reader unable to follow what happened, state in the record what class of thing was removed and why."
    14. kept: "The correction does not reach the git history or any component repository the content was published to." / "Rewriting that history is the engineer's decision, not a consequence of this rule."
    15. kept: "When a correction is made, tell the engineer what the edit did and did not accomplish. Say that the git history and any component repository still hold the removed content."
    16. kept: "Log the edit as a decision, stating that the record was changed after the fact and on what grounds."

## downstream-work-is-never-offered

### The compressor's answer

    1. A package change leaves every project that installed it on the previous version.
    2. Do not offer to close that gap.
    3. Do not report it.
    4. This holds for a next step, a summary of what was done, an option among others, and a reason something else is incomplete.
    5. It covers every act that moves a downstream project: a refresh, an install, a commit, a push, a regenerated bootstrap.
    6. It covers the projects a machine registry names, and any other repository that consumes this one.

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
    8. The session-start notice. The harness emits it, it reports only the current project's open experiments and features, and it names no other repository. See the announce-waytide-at-session-start rule.

    ## How to apply

    1. After changing a package, report what changed and stop.
    2. Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale.
    3. Carry out any downstream work when the engineer asks, and report what happened once it is done.
    4. Raise none of it on your own initiative.
    5. **Why:** the engineer decides when other repositories move, and a package change does not reveal that decision. A report is where this fails, because an agent told not to ask still closes its summary with what it did not do.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Do not offer to close the gap between a changed package and the previous version held by every project that installed it.
    2. Do not report that a downstream project holds the previous version of a changed package.
    3. Do not offer or report the downstream gap as a next step, in a summary of what was done, as an option among others, or as the reason something else is incomplete.
    4. The prohibition on offering or reporting downstream work covers every act that moves a downstream project: a refresh, an install, a commit, a push, a regenerated bootstrap.
    5. The prohibition covers the projects a machine registry names and any other repository that consumes this one.
    6. Treat a trailing line reporting what is not done in a downstream project as a prompt, whatever its grammar, and do not write it.
    7. Do not write what a thing is blocked on where the block is that the engineer has not asked for the next act (the precondition form, e.g. "that cannot take effect anywhere until the projects refresh").
    8. The agent may do downstream work when the engineer asks for it.
    9. When the engineer instructs downstream work, carry it out without a preamble weighing whether the instruction was wise.
    10. The agent may report downstream work that was done, after doing it.
    11. To decide whether a sentence is permitted, ask whether it describes something that happened; a report of work not carried out is forbidden.
    12. When a question about downstream state is put, answer it plainly and in full.
    13. Do not raise downstream state unbidden.
    14. The session-start notice is not forbidden: it is emitted by the harness rather than the agent, reports only the open experiments and features of the project the session is in, and names no other repository.
    15. After changing a package, report what changed and stop.
    16. Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale.
    17. Run the refresh procedure (in the package's README) only on the engineer's instruction.

### Checker A

    1. kept: "A package change leaves every project that installed it on the previous version." / "Do not offer to close that gap."
    2. kept: "Do not report it."
    3. kept: "This holds for a next step, a summary of what was done, an option among others, and a reason something else is incomplete."
    4. kept: "It covers every act that moves a downstream project: a refresh, an install, a commit, a push, a regenerated bootstrap."
    5. kept: "It covers the projects a machine registry names, and any other repository that consumes this one."
    6. kept: "A trailing line reporting what is not done is a prompt, whatever its grammar." (under the heading "A pending state named is the same offer", with the examples marked "is forbidden")
    7. kept: "The precondition form is also forbidden, e.g. *That cannot take effect anywhere until the projects refresh*." / "Do not write what a thing is blocked on when the block is only that the engineer has not asked for the next act."
    8. kept: "Doing the work, when the engineer asks for it."
    9. kept: "Do it with no preamble weighing whether the instruction was wise."
    10. kept: "Reporting what was done, after doing it."
    11. kept: "A report of work not carried out is a prompt." / "To tell them apart, ask whether the sentence describes something that happened."
    12. kept: "Answering a question about downstream state, such as *Are the consuming projects up to date*, plainly and in full."
    13. kept: "Raising downstream state unbidden stays forbidden." / "Raise none of it on your own initiative."
    14. kept: "The session-start notice. The harness emits it, it reports only the current project's open experiments and features, and it names no other repository."
    15. kept: "After changing a package, report what changed and stop."
    16. kept: "Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale."
    17. less precise: "this package's README — the refresh procedure itself, which is run on the engineer's instruction" / "Carry out any downstream work when the engineer asks". Missing: the word "only". It appears only as a description in the Related list, so nothing directly forbids running the refresh when the engineer has not asked.

### Checker B

    1. kept: "Do not offer to close that gap." (the gap is defined in "A package change leaves every project that installed it on the previous version.")
    2. kept: "Do not report it."
    3. kept: "This holds for a next step, a summary of what was done, an option among others, and a reason something else is incomplete."
    4. kept: "It covers every act that moves a downstream project: a refresh, an install, a commit, a push, a regenerated bootstrap."
    5. kept: "It covers the projects a machine registry names, and any other repository that consumes this one."
    6. kept: "A trailing line reporting what is not done is a prompt, whatever its grammar." The heading "A pending state named is the same offer" and the "is forbidden" examples require not writing it. The words "in a downstream project" are left out, but the context of the rule supplies them.
    7. kept: "Do not write what a thing is blocked on when the block is only that the engineer has not asked for the next act." and "The precondition form is also forbidden, e.g. *That cannot take effect anywhere until the projects refresh*."
    8. kept: "Doing the work, when the engineer asks for it."
    9. kept: "Do it with no preamble weighing whether the instruction was wise."
    10. kept: "Reporting what was done, after doing it."
    11. kept: "To tell them apart, ask whether the sentence describes something that happened." and "A report of work not carried out is a prompt."
    12. kept: "Answering a question about downstream state, such as *Are the consuming projects up to date*, plainly and in full."
    13. kept: "Raising downstream state unbidden stays forbidden." and "Raise none of it on your own initiative."
    14. kept: "The session-start notice. The harness emits it, it reports only the current project's open experiments and features, and it names no other repository."
    15. kept: "After changing a package, report what changed and stop."
    16. kept: "Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale."
    17. less precise: "the refresh procedure itself, which is run on the engineer's instruction" and "Carry out any downstream work when the engineer asks". Missing: the word "only". The sentence sits in the Related list and describes the procedure rather than directing it, so it does not forbid running the procedure without an instruction.

### The re-check, after the repairs

    1. kept: "A package change leaves every project that installed it on the previous version." / "Do not offer to close that gap."
    2. kept: "Do not report it."
    3. kept: "This holds for a next step, a summary of what was done, an option among others, and a reason something else is incomplete."
    4. kept: "It covers every act that moves a downstream project: a refresh, an install, a commit, a push, a regenerated bootstrap."
    5. kept: "It covers the projects a machine registry names, and any other repository that consumes this one."
    6. kept: "A trailing line reporting what is not done is a prompt, whatever its grammar." (The words "in a downstream project" are not in the sentence, but the section heading "A pending state named is the same offer" and the "is forbidden" examples supply that scope and the ban on writing it.)
    7. kept: "The precondition form is also forbidden, e.g. *That cannot take effect anywhere until the projects refresh*." / "Do not write what a thing is blocked on when the block is only that the engineer has not asked for the next act."
    8. kept: "Doing the work, when the engineer asks for it."
    9. kept: "Do it with no preamble weighing whether the instruction was wise."
    10. kept: "Reporting what was done, after doing it."
    11. kept: "A report of work not carried out is a prompt." / "To tell them apart, ask whether the sentence describes something that happened."
    12. kept: "Answering a question about downstream state, such as *Are the consuming projects up to date*, plainly and in full."
    13. kept: "Raising downstream state unbidden stays forbidden." / "Raise none of it on your own initiative."
    14. kept: "The session-start notice. The harness emits it, it reports only the current project's open experiments and features, and it names no other repository."
    15. kept: "After changing a package, report what changed and stop."
    16. kept: "Name no downstream project as outstanding, unrefreshed, uninstalled, unpushed, or stale."
    17. kept: "this package's README — the refresh procedure itself, which is run on the engineer's instruction" / "Carry out downstream work only when the engineer asks"

## file-names-use-iso8601-utc-prefix

### The compressor's answer

    ## What takes the prefix
    1. A dated artifact takes the datetime prefix. A dated artifact is something a project accrues over time, ordered by when it was made.
    2. The running records under `logs/` take it: the decision log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/`.
    3. The work-artifact directories `items/`, `implementations/`, and `migration/` take it.
    4. A consuming project's own local rules, the ones it adds to its `waytide/local/rules/`, take it. A local rule is a dated decision in that project's history.
    5. Prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime.
    6. Prefix every local rule a project adds the same way.

    ## Format
    1. The prefix is an ISO 8601 datetime normalized to UTC. A dash-separated, lower-case name and `.md` follow it.
    2. **Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.
    3. Join the date and time with `T`. The trailing `Z` marks UTC.
    4. Write the time's colons as dashes, for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`.
    5. The name is dash-separated and lower-case.
    6. The state suffix is the one exception to the lower case.
    7. A record carrying a canonical `**State:**` line ends its name with that state word in upper case, after a dash: `2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md`.
    8. The suffix changes nothing else about the name, and leaves the prefix untouched.
    9. The a-record-ends-with-its-state-in-upper-case rule fixes the suffix.

    ## What takes no prefix
    1. System rules do not take the prefix.
    2. Name a rule in a distributed package (`foundation`, `language`, `testing`, …) by a dash-separated, lower-case name alone. An example is `subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`.
    3. A package's structural files take no prefix. These are `README.md`, `vocabulary.md`, and `install-dependencies.sh`, each named by what it is.
    4. A project's own `waytide/local/vocabulary.md` takes no prefix. It is a structural file, not a dated entry. See the vocabulary-convention rule.
    5. **Why:** The dated artifacts are a chronological record. One UTC-normalized, lexically-sortable prefix orders them in every directory, keeps their order within a day, and avoids timezone drift between machines. System rules are not a chronology. They are the current, durable conventions, each named for what it says.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Every dated artifact in `waytide/` must take an ISO 8601 UTC datetime prefix in its file name.
    2. Every new working-state artifact must get the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime prefix. Working-state artifacts are the running records under `logs/` (the decision log `logs/log/`, `logs/loops/`, `logs/work-sessions/`) and the work-artifact directories `items/`, `implementations/`, and `migration/`.
    3. Every local rule a consuming project adds to its `waytide/local/rules/` must get the same ISO 8601 UTC datetime prefix.
    4. The prefix must be an ISO 8601 datetime normalized to UTC.
    5. The prefix must be followed by a dash-separated, lower-case name and `.md`, in the format `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.
    6. In the prefix, the date and time must be joined by `T`.
    7. The prefix must end with a trailing `Z` to mark UTC.
    8. The colons in the prefix's time must be written as dashes for filesystem safety (e.g. `2026-07-01T20-40-00Z-some-name.md`).
    9. A dated artifact that carries a canonical `**State:**` line must end its name with that state word in upper case, after a dash (e.g. `2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md`). This is the only exception to the lower-case name.
    10. Adding the state suffix must not change anything else about the name, and must leave the prefix untouched.
    11. A system rule (a rule in a distributed package such as `foundation`, `language`, `testing`) must not take the datetime prefix. It is named by a dash-separated, lower-case name alone (e.g. `subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`).
    12. Package structural files (`README.md`, `vocabulary.md`, `install-dependencies.sh`) must not take the datetime prefix. They are named by what they are.
    13. A project's own `waytide/local/vocabulary.md` must not take the datetime prefix.

### Checker A

    1. kept — "Dated artifacts in `waytide/` take an ISO 8601 UTC datetime prefix"; "A dated artifact takes the datetime prefix."
    2. kept — "Prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime."; "The running records under `logs/` take it: the decision log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/`."; "The work-artifact directories `items/`, `implementations/`, and `migration/` take it."
    3. kept — "A consuming project's own local rules, the ones it adds to its `waytide/local/rules/`, take it."; "Prefix every local rule a project adds the same way."
    4. kept — "The prefix is an ISO 8601 datetime normalized to UTC."
    5. kept — "A dash-separated, lower-case name and `.md` follow it."; "**Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`."
    6. kept — "Join the date and time with `T`."
    7. kept — "The trailing `Z` marks UTC." (together with the format `YYYY-MM-DDTHH-MM-SSZ-`)
    8. kept — "Write the time's colons as dashes, for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`."
    9. kept — "A record carrying a canonical `**State:**` line ends its name with that state word in upper case, after a dash: `2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md`."; "The state suffix is the one exception to the lower case."
    10. kept — "The suffix changes nothing else about the name, and leaves the prefix untouched."
    11. kept — "System rules do not take the prefix."; "Name a rule in a distributed package (`foundation`, `language`, `testing`, …) by a dash-separated, lower-case name alone. An example is `subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`."
    12. kept — "A package's structural files take no prefix. These are `README.md`, `vocabulary.md`, and `install-dependencies.sh`, each named by what it is."
    13. kept — "A project's own `waytide/local/vocabulary.md` takes no prefix."

### Checker B

    1. kept: "A dated artifact takes the datetime prefix." (with the title, "Dated artifacts in `waytide/` take an ISO 8601 UTC datetime prefix")
    2. kept: "Prefix every new working-state artifact with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC datetime." and "The running records under `logs/` take it: the decision log (`logs/log/`), `logs/loops/`, and `logs/work-sessions/`." and "The work-artifact directories `items/`, `implementations/`, and `migration/` take it."
    3. kept: "Prefix every local rule a project adds the same way." (with "A consuming project's own local rules, the ones it adds to its `waytide/local/rules/`, take it.")
    4. kept: "The prefix is an ISO 8601 datetime normalized to UTC."
    5. kept: "A dash-separated, lower-case name and `.md` follow it." and "**Format:** `YYYY-MM-DDTHH-MM-SSZ-<name>.md`."
    6. kept: "Join the date and time with `T`."
    7. kept: "The trailing `Z` marks UTC." (the "Z" is also required by the format string `YYYY-MM-DDTHH-MM-SSZ-<name>.md`)
    8. kept: "Write the time's colons as dashes, for filesystem safety, as in `2026-07-01T20-40-00Z-some-name.md`."
    9. kept: "A record carrying a canonical `**State:**` line ends its name with that state word in upper case, after a dash: `2026-08-05T19-37-06Z-ooda-terminology-REFUTED.md`." and "The state suffix is the one exception to the lower case."
    10. kept: "The suffix changes nothing else about the name, and leaves the prefix untouched."
    11. kept: "System rules do not take the prefix." and "Name a rule in a distributed package (`foundation`, `language`, `testing`, …) by a dash-separated, lower-case name alone. An example is `subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`."
    12. kept: "A package's structural files take no prefix. These are `README.md`, `vocabulary.md`, and `install-dependencies.sh`, each named by what it is."
    13. kept: "A project's own `waytide/local/vocabulary.md` takes no prefix."

## implementation-records-take-a-log-entry

### The compressor's answer

    ## An implementation record takes a log entry

    1. An implementation record pairs with a one-line entry in `waytide/local/logs/log/`.
    2. Write the entry when the record is created.
    3. Write another entry on each change of the canonical `**State:**` line.

    ## The concluding entry depends on whether the work reached `master`

    1. The concluding entry takes one of two forms. Which one is not a matter of taste.
    2. The form is decided by whether the record itself is on `master`.
    3. Merged work means an affirmed experiment merged into its upstream branch, or a completed feature integrated.
    4. For merged work, the entry is a summary marker. It names the record and its state, and stops there.
    5. Unmerged work means a refuted, inconclusive, abandoned, or superseded experiment, or an abandoned or superseded feature.
    6. For unmerged work, the entry carries the finding, and only where there is one.
    7. For an experiment that reached a verdict, the entry states the question, the verdict, and what was found.
    8. For abandoned work, the entry states the intent, that it was abandoned, and the reasoning given for stopping.
    9. An abandoned-work entry does not reproduce the plan, the increments, or the design the work produced. A careful tense is not enough (see the-log-never-says-undone-work-was-done).
    10. The entry carries the substance whenever the branch did not merge, whether or not the record reached `master` by another route.
    11. Do not rely on the practice of committing the record to `master` while the work is on a branch.

    ## What is already required, and not restated

    1. An affirmed experiment still copies its own log into the decision log, as implementation-lifecycle requires.
    2. The summary marker sits beside those copied entries. It does not replace them.
    3. A completed feature has no affirmation and no log copy. Its marker is the whole of what its conclusion writes.

    ## What is not logged

    1. Write no log entry for a confirmation the lifecycle records.
    2. Those confirmations are the working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion. They are recorded in the record.
    3. Write no log entry for a turn of the work.
    4. The hinges, the cycles, and the runs belong to the loop record and the implementation record.

    ## How to apply

    1. At the conclusion, ask whether the work merged.
    2. Where it merged, write a summary marker naming the record and its state.
    3. Where it did not, write the question or the intent, the verdict or the outcome, and the findings, so `master` holds them without the record.

    **Why:** An unmerged branch is deleted on confirmation, so a record existing only there is lost. The log entry is then the only durable trace on `master`. The decision log answers what this project has decided, for a reader who holds nothing.

    CONTRADICTIONS:
    - The source says the concluding form "is decided by whether the record itself is on `master`", but later says the entry carries the substance "whenever the branch did not merge, whether or not the record happens to have reached `master` by another route". So one statement makes the record's location the test, and the other makes the merge the test.
    - The abandoned-work bullet says the entry states the intent, that it was abandoned, and the reasoning for stopping, and that it carries a finding "only where there is one". How to apply tells every unmerged case to write "the findings", and it does not mention the reasoning for stopping.

### The directives, as the listing agent gave them

    1. When an implementation record is created, write a matching one-line entry in `waytide/local/logs/log/`.
    2. Write a one-line entry in `waytide/local/logs/log/` for each change of an implementation record's canonical `**State:**` line.
    3. Decide the form of an implementation record's concluding log entry by whether the work merged, meaning whether the record itself is on `master`. The choice is not a matter of taste.
    4. An affirmed experiment merges into its upstream branch.
    5. A completed feature integrates.
    6. A refuted, inconclusive, abandoned, or superseded experiment is never merged.
    7. An abandoned or superseded feature is never merged.
    8. Where the work merged, the concluding entry is a summary marker. It names the record and its state and stops there.
    9. Where the work did not merge, the concluding entry carries the finding, and only where there is one, so that `master` holds it without the record.
    10. For an unmerged experiment that reached a verdict, the concluding entry states the question, the verdict, and what was found.
    11. For abandoned work, the concluding entry states the intent, that the work was abandoned, and the reasoning given for stopping.
    12. The concluding entry for abandoned work does not reproduce the plan, the increments, or the design the work produced.
    13. The concluding entry carries the substance whenever the branch did not merge, whether or not the record reached `master` by another route. Do not rely on the practice of committing the record to `master` while the work is on a branch.
    14. An unmerged branch is deleted only on confirmation.
    15. A refuted, inconclusive, abandoned, or superseded implementation record is kept, marked with its state, so the attempt and its findings survive as evidence.
    16. An affirmed experiment copies its own log into the decision log.
    17. The summary marker for an affirmed experiment sits beside the copied log entries and does not replace them.
    18. A completed feature's summary marker is the whole of what its conclusion writes to the log. A feature has no affirmation and no log copy.
    19. A confirmation the lifecycle records gets no log entry and is recorded in the implementation record instead. This covers the working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion.
    20. A turn of the work gets no log entry. The hinges, the cycles, and the runs belong to the loop record and the implementation record.

### Checker A

    1. kept: "An implementation record pairs with a one-line entry in `waytide/local/logs/log/`." / "Write the entry when the record is created."
    2. kept: "Write another entry on each change of the canonical `**State:**` line."
    3. kept: "The form is decided by whether the record itself is on `master`." / "Which one is not a matter of taste." / "At the conclusion, ask whether the work merged."
    4. less precise: "Merged work means an affirmed experiment merged into its upstream branch". This only defines merged work. It does not require an affirmed experiment to merge.
    5. less precise: "or a completed feature integrated". This only defines merged work. It does not require a completed feature to integrate.
    6. less precise: "Unmerged work means a refuted, inconclusive, abandoned, or superseded experiment". This only classifies the work. The ban on ever merging it is missing.
    7. less precise: "or an abandoned or superseded feature". This only classifies the work. The ban on ever merging it is missing.
    8. kept: "For merged work, the entry is a summary marker. It names the record and its state, and stops there."
    9. kept: "For unmerged work, the entry carries the finding, and only where there is one." / "so `master` holds them without the record"
    10. less precise: "For an experiment that reached a verdict, the entry states the question, the verdict, and what was found." The word "unmerged" is gone. Only the item's position under the unmerged-work lines implies it, and an affirmed (merged) experiment also reached a verdict.
    11. kept: "For abandoned work, the entry states the intent, that it was abandoned, and the reasoning given for stopping."
    12. kept: "An abandoned-work entry does not reproduce the plan, the increments, or the design the work produced."
    13. kept: "The entry carries the substance whenever the branch did not merge, whether or not the record reached `master` by another route." / "Do not rely on the practice of committing the record to `master` while the work is on a branch."
    14. less precise: "An unmerged branch is deleted on confirmation". This appears only in the Why paragraph, as rationale rather than a directive, and the word "only" is missing.
    15. lost: nothing says that a refuted, inconclusive, abandoned, or superseded record is kept, marked with its state, as evidence.
    16. kept: "An affirmed experiment still copies its own log into the decision log, as implementation-lifecycle requires."
    17. kept: "The summary marker sits beside those copied entries. It does not replace them."
    18. kept: "A completed feature has no affirmation and no log copy. Its marker is the whole of what its conclusion writes."
    19. kept: "Write no log entry for a confirmation the lifecycle records." / "Those confirmations are the working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion. They are recorded in the record."
    20. kept: "Write no log entry for a turn of the work." / "The hinges, the cycles, and the runs belong to the loop record and the implementation record."

### Checker B

    1. kept — "Write the entry when the record is created." / "pairs with a one-line entry in `waytide/local/logs/log/`"
    2. kept — "Write another entry on each change of the canonical `**State:**` line."
    3. kept — "The form is decided by whether the record itself is on `master`." / "Which one is not a matter of taste." / "ask whether the work merged"
    4. less precise — "Merged work means an affirmed experiment merged into its upstream branch". This only defines merged work. It does not say an affirmed experiment does merge.
    5. less precise — "or a completed feature integrated". This only defines merged work. It does not say a completed feature integrates.
    6. less precise — "Unmerged work means a refuted, inconclusive, abandoned, or superseded experiment". This defines the category but drops "never merged".
    7. less precise — "or an abandoned or superseded feature". This defines the category but drops "never merged".
    8. kept — "For merged work, the entry is a summary marker. It names the record and its state, and stops there."
    9. kept — "For unmerged work, the entry carries the finding, and only where there is one." / "so `master` holds them without the record"
    10. kept — "For an experiment that reached a verdict, the entry states the question, the verdict, and what was found." (This sits within the unmerged-work sequence.)
    11. kept — "For abandoned work, the entry states the intent, that it was abandoned, and the reasoning given for stopping."
    12. kept — "An abandoned-work entry does not reproduce the plan, the increments, or the design the work produced."
    13. kept — "The entry carries the substance whenever the branch did not merge, whether or not the record reached `master` by another route." / "Do not rely on the practice of committing the record to `master` while the work is on a branch."
    14. less precise — "An unmerged branch is deleted on confirmation". This is stated only in the Why paragraph, without "only".
    15. lost — nothing says that refuted, inconclusive, abandoned, or superseded records are kept and marked with their state as evidence.
    16. kept — "An affirmed experiment still copies its own log into the decision log"
    17. kept — "The summary marker sits beside those copied entries. It does not replace them."
    18. kept — "A completed feature has no affirmation and no log copy. Its marker is the whole of what its conclusion writes."
    19. kept — "Write no log entry for a confirmation the lifecycle records." / "Those confirmations are the working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion. They are recorded in the record."
    20. kept — "Write no log entry for a turn of the work." / "The hinges, the cycles, and the runs belong to the loop record and the implementation record."

### The re-check, after the repairs

    The shorter version keeps all 20 directives. None is less precise and none is lost.

    1. kept — "An implementation record pairs with a one-line entry in `waytide/local/logs/log/`." / "Write the entry when the record is created."
    2. kept — "Write another entry on each change of the canonical `**State:**` line."
    3. kept — "The concluding entry takes one of two forms. Which one is not a matter of taste." / "The form is decided by whether the record itself is on `master`." / "At the conclusion, ask whether the work merged."
    4. kept — "An affirmed experiment merges"
    5. kept — "a completed feature integrates"
    6. kept — "Unmerged work means a refuted, inconclusive, abandoned, or superseded experiment ... That work is never merged"
    7. kept — "or an abandoned or superseded feature. That work is never merged"
    8. kept — "For merged work, the entry is a summary marker. It names the record and its state, and stops there."
    9. kept — "For unmerged work, the entry carries the finding, and only where there is one." / "so `master` holds them without the record"
    10. kept — "For an unmerged experiment that reached a verdict, the entry states the question, the verdict, and what was found."
    11. kept — "For abandoned work, the entry states the intent, that it was abandoned, and the reasoning given for stopping."
    12. kept — "An abandoned-work entry does not reproduce the plan, the increments, or the design the work produced."
    13. kept — "The entry carries the substance whenever the branch did not merge, whether or not the record reached `master` by another route." / "Do not rely on the practice of committing the record to `master` while the work is on a branch."
    14. kept — "its branch is deleted only on confirmation"
    15. kept — "Its record is kept, marked with its state, as evidence."
    16. kept — "An affirmed experiment still copies its own log into the decision log"
    17. kept — "The summary marker sits beside those copied entries. It does not replace them."
    18. kept — "A completed feature has no affirmation and no log copy. Its marker is the whole of what its conclusion writes."
    19. kept — "Write no log entry for a confirmation the lifecycle records." / "Those confirmations are the working-location selection, the attended-or-unattended selection, a worktree added mid-flight, and branch deletion. They are recorded in the record."
    20. kept — "Write no log entry for a turn of the work." / "The hinges, the cycles, and the runs belong to the loop record and the implementation record."

## implementations-convention

### The compressor's answer

    1. `waytide/local/implementations/` holds implementation records, one file per implementation.
    2. A record carries how the implementation began, where it is being worked, and what became of it.
    3. An implementation is a bounded unit of work with a lifecycle.
    4. The record is a persisted, dated artifact, kept after the implementation concludes.
    5. An experiment is tagged `[experiment]` and is built to a question.
    6. A feature is tagged `[feature]` and is built to an intent.
    7. These are ordinary square-bracket tags (see the a-record-takes-category-tags rule).
    8. Both tags are reserved. The lifecycle turns on which one a record carries.
    9. A question is forecast and reaches a verdict. An intent is not forecast and reaches no verdict.
    10. Every difference between the two kinds follows from that one difference, and from nothing else.

    ## The record

    1. Open with the **Question** or the **Intent**.
    2. Then give the setup: a `**State:**` line, the upstream branch it merges into, the implementation branch, its base, and the working location chosen at the start.
    3. The upstream branch is `master` or another topic branch.
    4. The setup also includes a `**Tags:**` line carrying `[experiment]` or `[feature]`.
    5. An `[experiment]` states a forecast of what is expected to happen, before the work.
    6. As the work proceeds, an experiment records what actually happened against the forecast.
    7. An experiment then records the findings and any post-hoc misses.
    8. A `[feature]` states no forecast, no comparison against one, and no findings or misses.
    9. Both kinds record the confirmations the lifecycle required, so the work's authority is auditable.
    10. Both record these confirmations: the working-location selection at the start, and the attended-or-unattended selection at the start.
    11. Both also record these: adding a worktree to work already under way, and branch deletion with worktree removal.
    12. An experiment also records the affirmation declaration, concluding a superseded experiment, and merging untested code.

    ## The state

    1. The state sits on a canonical `**State:**` line carrying one word and nothing else, for example `- **State:** Suspended`.
    2. Add the line when the record reaches one of the state words, not when the work starts.
    3. That line is the only authoritative statement of the state.
    4. The state words may appear freely in the record's prose. Nothing else in the file is read as the state.
    5. Absence of the line is the in-progress state. Work still under way carries no line.
    6. Do not add a line to say the work is in progress.
    7. Do not invent a state word.
    8. Unlike an item, an implementation carries no state from the moment it is written. The session-start notice reports an open implementation.
    9. An open record takes no filename suffix (see the a-record-ends-with-its-state-in-upper-case rule).
    10. The concluding words both kinds take are these.
        - **Abandoned**: dropped before concluding. It is not merged, and the record is kept.
        - **Superseded**: replaced by another implementation. Each of the two records names its counterpart.
        - **Suspended**: paused, not ended.
    11. The words only an `[experiment]` takes are these, since each judges a question.
        - **Affirmed**: the question held. The user declares it.
        - **Refuted**: the question was disproven.
        - **Inconclusive**: it ran and gave no clear verdict either way.
    12. The word only a `[feature]` takes is this.
        - **Completed**: integrated into the upstream branch. It is the ordinary conclusion.
    13. A feature takes no verdict word, and an experiment takes no `Completed`. Neither is an oversight.

    ## Runs

    1. Runs are optional.
    2. Only an experiment has runs. A feature has none.
    3. Split an implementation into runs only when the question is held fixed and one factor is varied to compare.
    4. Each run is its own branch from the same base.
    5. Each run carries its own forecast.
    6. Runs are titled `Run 1`, `Run 2`, and so on.
    7. A run is a deliberate variation, not a retry.

    ## It is the lifecycle record, not the design record

    1. The same work's design belongs in a loop record under `waytide/local/logs/loops/`.
    2. A loop record holds each cycle's hinge, the options put to the engineer, and the decision.
    3. The implementation record and the loop record divide by concern. Each names the other.
    4. Keep them as separate files. `waytide/local/logs/loops/` belongs to `design-by-efferent`, which includes `foundation`, not the reverse.
    5. A foundation rule must not require fields in that directory. That dependency is refused.
    6. Naming the loop record in prose is a citation and is permitted.

    ## Format

    1. Use the same frontmatter-free markdown as rules: a title, then prose and tables.
    2. The title is `# Experiment — <name>` or `# Feature — <name>`.
    3. The kind reads in the title and is stated as data in the `**Tags:**` line.
    4. The lifecycle reads the tag, not the title.
    5. A record whose title and tag name different kinds is defective.
    6. The filename takes the ISO-8601-UTC prefix (see the file-names rule).
    7. Once the record concludes, the filename also takes the state suffix.
    8. End the file with the provenance footer.
    9. Pair the record with a log entry (see the implementation-records-take-a-log-entry rule).

    ## How to apply

    1. Record every implementation here, tagged `[experiment]` or `[feature]`.
    2. Update the state line as the state changes.
    3. **Why:** experiments and features share one lifecycle, and differ only by question against intent, which the tag states. One convention avoids wording drifting between duplicate rules.

    CONTRADICTIONS: The source lists **Suspended** among "the concluding words both kinds take", but defines it as "paused, not ended". Because it is listed as a concluding word, the source leaves open whether a Suspended record has "concluded" and so takes the state suffix in its filename ("once the record concludes, the state suffix"). The compressed text keeps both statements as the source has them.

### The directives, as the listing agent gave them

    1. Record every implementation in `waytide/local/implementations/`, one file per implementation.
    2. Each implementation record must carry how the implementation began, where it is being worked, and what became of it.
    3. Keep an implementation record after the implementation concludes.
    4. Tag an experiment record `[experiment]`. An experiment is built to a question.
    5. Tag a feature record `[feature]`. A feature is built to an intent.
    6. The `[experiment]` and `[feature]` tags are reserved, and the lifecycle depends on which one a record carries.
    7. The only differences between experiments and features are the ones that follow from question versus intent.
    8. An implementation record opens with the Question (for an experiment) or the Intent (for a feature), followed by the setup.
    9. The setup includes a `**State:**` line (when one applies).
    10. The setup includes the upstream branch the implementation merges into, either `master` or another topic branch.
    11. The setup includes the implementation branch.
    12. The setup includes the implementation branch's base.
    13. The setup includes the working location chosen at the start.
    14. The setup includes a `**Tags:**` line carrying `[experiment]` or `[feature]`.
    15. An `[experiment]` record states a forecast of what is expected to happen, before the work begins.
    16. As the work proceeds, an `[experiment]` record records what actually happened against the forecast.
    17. An `[experiment]` record records the findings and any post-hoc misses.
    18. A `[feature]` record states no forecast, no record of outcomes against a forecast, and no findings or post-hoc misses.
    19. Both kinds of record record the confirmations the lifecycle required, so that the work's authority can be audited.
    20. The confirmations recorded by both kinds include the working-location selection at the start, the attended-or-unattended selection at the start, adding a worktree to work already under way, and branch deletion with worktree removal.
    21. An experiment record also records the confirmations for the affirmation declaration, concluding a superseded experiment, and merging untested code.
    22. An implementation's state goes on a canonical `**State:**` line that carries one word and nothing else, e.g. `- **State:** Suspended`.
    23. Add the `**State:**` line when the record reaches one of the state words, not when the work starts.
    24. The `**State:**` line is the only authoritative statement of an implementation's state. Nothing else in the file may be read as the state, even where the same words appear in the record's prose.
    25. Work still in progress carries no `**State:**` line. The line's absence is the in-progress state.
    26. Do not add a `**State:**` line to say the work is in progress.
    27. Do not invent a state word.
    28. Either kind may take the state `Abandoned`: dropped before concluding, not merged, with the record kept.
    29. Either kind may take the state `Superseded`: replaced by another implementation. Both records name their counterpart.
    30. Either kind may take the state `Suspended`: paused, not ended.
    31. Only an `[experiment]` may take `Affirmed` (the question held), and the user declares it.
    32. Only an `[experiment]` may take `Refuted` (the question was disproven).
    33. Only an `[experiment]` may take `Inconclusive` (it ran and gave no clear verdict either way).
    34. Only a `[feature]` may take `Completed` (integrated into the upstream branch), its ordinary conclusion.
    35. A feature takes no verdict words (`Affirmed`, `Refuted`, `Inconclusive`), and an experiment does not take `Completed`.
    36. Runs are optional and only experiments may have them. A feature has no runs.
    37. Split an implementation into runs only when the question is held fixed and one factor is varied to compare.
    38. Each run is its own branch from the same base.
    39. Each run carries its own forecast.
    40. Runs are titled `Run 1`, `Run 2`, and so on.
    41. A run must be a deliberate variation, not a retry.
    42. The design of the same work belongs in a loop record under `waytide/local/logs/loops/` (each cycle's hinge, the options put to the engineer, and the decision), not in the implementation record.
    43. The implementation record and the loop record each name the other.
    44. A foundation rule must not require fields in `waytide/local/logs/loops/`. The implementation record may only cite the loop record in prose.
    45. Write an implementation record in the same frontmatter-free markdown as rules, with prose and tables.
    46. Title an implementation record `# Experiment — <name>` or `# Feature — <name>`.
    47. The record's kind appears in the title and is stated as data in the `**Tags:**` line.
    48. The lifecycle reads the tag, not the title.
    49. A record whose title names one kind and whose tag names the other has a defect.
    50. The record's filename takes the ISO-8601-UTC prefix (see the file-names rule).
    51. Once the record concludes, its filename takes the state suffix. An open record takes no suffix.
    52. End the implementation record file with the provenance footer.
    53. Pair each implementation record with a log entry (see the implementation-records-take-a-log-entry rule).
    54. Update the `**State:**` line as the state changes.

### Checker A

    I judged all 54 directives: 52 kept, 2 less precise, 0 lost. Quotes are from compressed.md, with section and item numbers.

    1. kept — "`waytide/local/implementations/` holds implementation records, one file per implementation" (intro 1); "Record every implementation here" (How to apply 1)
    2. kept — "A record carries how the implementation began, where it is being worked, and what became of it" (intro 2)
    3. kept — "kept after the implementation concludes" (intro 4)
    4. kept — "An experiment is tagged `[experiment]` and is built to a question" (intro 5)
    5. kept — "A feature is tagged `[feature]` and is built to an intent" (intro 6)
    6. kept — "Both tags are reserved. The lifecycle turns on which one a record carries" (intro 8)
    7. kept — "Every difference between the two kinds follows from that one difference, and from nothing else" (intro 10)
    8. kept — "Open with the **Question** or the **Intent**"; "Then give the setup" (The record 1–2)
    9. kept — "a `**State:**` line" (The record 2). The "when one applies" condition is carried by "Add the line when the record reaches one of the state words, not when the work starts" (The state 2).
    10. kept — "the upstream branch it merges into"; "The upstream branch is `master` or another topic branch" (The record 2–3)
    11. kept — "the implementation branch" (The record 2)
    12. kept — "its base" (The record 2)
    13. kept — "the working location chosen at the start" (The record 2)
    14. kept — "The setup also includes a `**Tags:**` line carrying `[experiment]` or `[feature]`" (The record 4)
    15. kept — "An `[experiment]` states a forecast of what is expected to happen, before the work" (The record 5)
    16. kept — "As the work proceeds, an experiment records what actually happened against the forecast" (The record 6)
    17. kept — "An experiment then records the findings and any post-hoc misses" (The record 7)
    18. kept — "A `[feature]` states no forecast, no comparison against one, and no findings or misses" (The record 8)
    19. kept — "Both kinds record the confirmations the lifecycle required, so the work's authority is auditable" (The record 9)
    20. kept — "the working-location selection at the start, and the attended-or-unattended selection at the start"; "adding a worktree to work already under way, and branch deletion with worktree removal" (The record 10–11)
    21. less precise — "An experiment also records the affirmation declaration, concluding a superseded experiment, and merging untested code" (The record 12). Missing: it does not call these confirmations, so it could be read as recording the acts themselves.
    22. kept — "The state sits on a canonical `**State:**` line carrying one word and nothing else, for example `- **State:** Suspended`" (The state 1)
    23. kept — "Add the line when the record reaches one of the state words, not when the work starts" (The state 2)
    24. kept — "That line is the only authoritative statement of the state"; "The state words may appear freely in the record's prose. Nothing else in the file is read as the state" (The state 3–4)
    25. kept — "Absence of the line is the in-progress state. Work still under way carries no line" (The state 5)
    26. kept — "Do not add a line to say the work is in progress" (The state 6)
    27. kept — "Do not invent a state word" (The state 7)
    28. kept — "**Abandoned**: dropped before concluding. It is not merged, and the record is kept" (The state 10)
    29. kept — "**Superseded**: replaced by another implementation. Each of the two records names its counterpart" (The state 10)
    30. kept — "**Suspended**: paused, not ended" (The state 10)
    31. kept — "The words only an `[experiment]` takes"; "**Affirmed**: the question held. The user declares it" (The state 11)
    32. kept — "**Refuted**: the question was disproven" (The state 11)
    33. kept — "**Inconclusive**: it ran and gave no clear verdict either way" (The state 11)
    34. kept — "The word only a `[feature]` takes is this. **Completed**: integrated into the upstream branch. It is the ordinary conclusion" (The state 12)
    35. kept — "A feature takes no verdict word, and an experiment takes no `Completed`" (The state 13)
    36. kept — "Runs are optional"; "Only an experiment has runs. A feature has none" (Runs 1–2)
    37. kept — "Split an implementation into runs only when the question is held fixed and one factor is varied to compare" (Runs 3)
    38. kept — "Each run is its own branch from the same base" (Runs 4)
    39. kept — "Each run carries its own forecast" (Runs 5)
    40. kept — "Runs are titled `Run 1`, `Run 2`, and so on" (Runs 6)
    41. kept — "A run is a deliberate variation, not a retry" (Runs 7)
    42. kept — "The same work's design belongs in a loop record under `waytide/local/logs/loops/`"; "A loop record holds each cycle's hinge, the options put to the engineer, and the decision" (lifecycle-not-design 1–2)
    43. kept — "Each names the other" (lifecycle-not-design 3)
    44. less precise — "A foundation rule must not require fields in that directory"; "Naming the loop record in prose is a citation and is permitted" (lifecycle-not-design 5–6). Missing: the word "only". A prose citation is permitted, but nothing says it is the only reference allowed.
    45. kept — "Use the same frontmatter-free markdown as rules: a title, then prose and tables" (Format 1)
    46. kept — "The title is `# Experiment — <name>` or `# Feature — <name>`" (Format 2)
    47. kept — "The kind reads in the title and is stated as data in the `**Tags:**` line" (Format 3)
    48. kept — "The lifecycle reads the tag, not the title" (Format 4)
    49. kept — "A record whose title and tag name different kinds is defective" (Format 5)
    50. kept — "The filename takes the ISO-8601-UTC prefix (see the file-names rule)" (Format 6)
    51. kept — "Once the record concludes, the filename also takes the state suffix" (Format 7); "An open record takes no filename suffix" (The state 9)
    52. kept — "End the file with the provenance footer" (Format 8)
    53. kept — "Pair the record with a log entry (see the implementation-records-take-a-log-entry rule)" (Format 9)
    54. kept — "Update the state line as the state changes" (How to apply 2)

### Checker B

    1. kept — "`waytide/local/implementations/` holds implementation records, one file per implementation"; "Record every implementation here"
    2. kept — "A record carries how the implementation began, where it is being worked, and what became of it."
    3. kept — "kept after the implementation concludes"
    4. kept — "An experiment is tagged `[experiment]` and is built to a question."
    5. kept — "A feature is tagged `[feature]` and is built to an intent."
    6. kept — "Both tags are reserved. The lifecycle turns on which one a record carries."
    7. kept — "Every difference between the two kinds follows from that one difference, and from nothing else."
    8. kept — "Open with the **Question** or the **Intent**." / "Then give the setup"
    9. kept — "Then give the setup: a `**State:**` line"; "Add the line when the record reaches one of the state words, not when the work starts."
    10. kept — "the upstream branch it merges into"; "The upstream branch is `master` or another topic branch."
    11. kept — "the implementation branch"
    12. kept — "its base"
    13. kept — "the working location chosen at the start"
    14. kept — "The setup also includes a `**Tags:**` line carrying `[experiment]` or `[feature]`."
    15. kept — "An `[experiment]` states a forecast of what is expected to happen, before the work."
    16. kept — "As the work proceeds, an experiment records what actually happened against the forecast."
    17. kept — "An experiment then records the findings and any post-hoc misses."
    18. kept — "A `[feature]` states no forecast, no comparison against one, and no findings or misses."
    19. kept — "Both kinds record the confirmations the lifecycle required, so the work's authority is auditable."
    20. kept — "the working-location selection at the start, and the attended-or-unattended selection at the start"; "adding a worktree to work already under way, and branch deletion with worktree removal"
    21. less precise — "An experiment also records the affirmation declaration, concluding a superseded experiment, and merging untested code." Missing: it does not say these are *confirmations* being recorded; it can be read as recording the declaration itself.
    22. kept — "a canonical `**State:**` line carrying one word and nothing else, for example `- **State:** Suspended`"
    23. kept — "Add the line when the record reaches one of the state words, not when the work starts."
    24. kept — "That line is the only authoritative statement of the state."; "The state words may appear freely in the record's prose. Nothing else in the file is read as the state."
    25. kept — "Absence of the line is the in-progress state. Work still under way carries no line."
    26. kept — "Do not add a line to say the work is in progress."
    27. kept — "Do not invent a state word."
    28. kept — "**Abandoned**: dropped before concluding. It is not merged, and the record is kept."
    29. kept — "**Superseded**: replaced by another implementation. Each of the two records names its counterpart."
    30. kept — "**Suspended**: paused, not ended."
    31. kept — "The words only an `[experiment]` takes ... **Affirmed**: the question held. The user declares it."
    32. kept — "**Refuted**: the question was disproven."
    33. kept — "**Inconclusive**: it ran and gave no clear verdict either way."
    34. kept — "The word only a `[feature]` takes is this. **Completed**: integrated into the upstream branch. It is the ordinary conclusion."
    35. kept — "A feature takes no verdict word, and an experiment takes no `Completed`."
    36. kept — "Runs are optional."; "Only an experiment has runs. A feature has none."
    37. kept — "Split an implementation into runs only when the question is held fixed and one factor is varied to compare."
    38. kept — "Each run is its own branch from the same base."
    39. kept — "Each run carries its own forecast."
    40. kept — "Runs are titled `Run 1`, `Run 2`, and so on."
    41. kept — "A run is a deliberate variation, not a retry."
    42. kept — "The same work's design belongs in a loop record under `waytide/local/logs/loops/`."; "A loop record holds each cycle's hinge, the options put to the engineer, and the decision."; "Keep them as separate files."
    43. kept — "Each names the other."
    44. less precise — "A foundation rule must not require fields in that directory."; "Naming the loop record in prose is a citation and is permitted." Missing: citation in prose is stated as permitted, not as the *only* allowed reference.
    45. kept — "Use the same frontmatter-free markdown as rules: a title, then prose and tables."
    46. kept — "The title is `# Experiment — <name>` or `# Feature — <name>`."
    47. kept — "The kind reads in the title and is stated as data in the `**Tags:**` line."
    48. kept — "The lifecycle reads the tag, not the title."
    49. kept — "A record whose title and tag name different kinds is defective."
    50. kept — "The filename takes the ISO-8601-UTC prefix (see the file-names rule)."
    51. kept — "Once the record concludes, the filename also takes the state suffix."; "An open record takes no filename suffix"
    52. kept — "End the file with the provenance footer."
    53. kept — "Pair the record with a log entry (see the implementation-records-take-a-log-entry rule)."
    54. kept — "Update the state line as the state changes."

### The re-check, after the repairs

    All 54 directives are carried by the shorter version: 54 kept, 0 less precise, 0 lost.

    1. kept — "`waytide/local/implementations/` holds implementation records, one file per implementation." / "Record every implementation here"
    2. kept — "A record carries how the implementation began, where it is being worked, and what became of it."
    3. kept — "kept after the implementation concludes"
    4. kept — "An experiment is tagged `[experiment]` and is built to a question."
    5. kept — "A feature is tagged `[feature]` and is built to an intent."
    6. kept — "Both tags are reserved. The lifecycle turns on which one a record carries."
    7. kept — "Every difference between the two kinds follows from that one difference, and from nothing else."
    8. kept — "Open with the **Question** or the **Intent**." / "Then give the setup" (that the Question goes with an experiment and the Intent with a feature follows from "built to a question" / "built to an intent")
    9. kept — "Then give the setup: a `**State:**` line" (the "when one applies" condition comes from "Add the line when the record reaches one of the state words" and "Work still under way carries no line")
    10. kept — "the upstream branch it merges into" / "The upstream branch is `master` or another topic branch."
    11. kept — "the implementation branch"
    12. kept — "its base"
    13. kept — "the working location chosen at the start"
    14. kept — "The setup also includes a `**Tags:**` line carrying `[experiment]` or `[feature]`."
    15. kept — "An `[experiment]` states a forecast of what is expected to happen, before the work."
    16. kept — "As the work proceeds, an experiment records what actually happened against the forecast."
    17. kept — "An experiment then records the findings and any post-hoc misses."
    18. kept — "A `[feature]` states no forecast, no comparison against one, and no findings or misses."
    19. kept — "Both kinds record the confirmations the lifecycle required, so the work's authority is auditable."
    20. kept — "the working-location selection at the start, and the attended-or-unattended selection at the start" / "adding a worktree to work already under way, and branch deletion with worktree removal"
    21. kept — "An experiment also records the confirmations of the affirmation declaration, concluding a superseded experiment, and merging untested code."
    22. kept — "The state sits on a canonical `**State:**` line carrying one word and nothing else, for example `- **State:** Suspended`."
    23. kept — "Add the line when the record reaches one of the state words, not when the work starts."
    24. kept — "That line is the only authoritative statement of the state." / "The state words may appear freely in the record's prose. Nothing else in the file is read as the state."
    25. kept — "Absence of the line is the in-progress state. Work still under way carries no line."
    26. kept — "Do not add a line to say the work is in progress."
    27. kept — "Do not invent a state word."
    28. kept — "**Abandoned**: dropped before concluding. It is not merged, and the record is kept."
    29. kept — "**Superseded**: replaced by another implementation. Each of the two records names its counterpart."
    30. kept — "**Suspended**: paused, not ended."
    31. kept — "The words only an `[experiment]` takes" / "**Affirmed**: the question held. The user declares it."
    32. kept — "**Refuted**: the question was disproven."
    33. kept — "**Inconclusive**: it ran and gave no clear verdict either way."
    34. kept — "The word only a `[feature]` takes is this." / "**Completed**: integrated into the upstream branch. It is the ordinary conclusion."
    35. kept — "A feature takes no verdict word, and an experiment takes no `Completed`."
    36. kept — "Runs are optional." / "Only an experiment has runs. A feature has none."
    37. kept — "Split an implementation into runs only when the question is held fixed and one factor is varied to compare."
    38. kept — "Each run is its own branch from the same base."
    39. kept — "Each run carries its own forecast."
    40. kept — "Runs are titled `Run 1`, `Run 2`, and so on."
    41. kept — "A run is a deliberate variation, not a retry."
    42. kept — "The same work's design belongs in a loop record under `waytide/local/logs/loops/`." / "A loop record holds each cycle's hinge, the options put to the engineer, and the decision." / "Keep them as separate files."
    43. kept — "Each names the other."
    44. kept — "A foundation rule must not require fields in that directory." / "Naming the loop record in prose is a citation and is permitted. It is the only reference permitted."
    45. kept — "Use the same frontmatter-free markdown as rules: a title, then prose and tables."
    46. kept — "The title is `# Experiment — <name>` or `# Feature — <name>`."
    47. kept — "The kind reads in the title and is stated as data in the `**Tags:**` line."
    48. kept — "The lifecycle reads the tag, not the title."
    49. kept — "A record whose title and tag name different kinds is defective."
    50. kept — "The filename takes the ISO-8601-UTC prefix (see the file-names rule)."
    51. kept — "Once the record concludes, the filename also takes the state suffix." / "An open record takes no filename suffix"
    52. kept — "End the file with the provenance footer."
    53. kept — "Pair the record with a log entry (see the implementation-records-take-a-log-entry rule)."
    54. kept — "Update the state line as the state changes."

## initialization-rule

### The compressor's answer

    1. Five parts are printed once per session, verbatim and in this order. Four are always printed. The package set is printed only where the project has declared one.
    2. The harness prints the four always-printed parts. The agent prints none of them.
    3. When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints them as a `systemMessage`.
    4. The display prints on `load waytide` and on no other prompt. A session opened with any other request shows no display.
    5. The agent prints the package set, at the head of the response that carries the rule read.
    6. The script reads the four from this file's fenced blocks, by position.
    7. The first, third, fourth, and fifth fenced blocks are the title, the copyright and license, the loading line, and the figure.
    8. The second fenced block is the package-set example, which the script skips.
    9. Adding, removing, or reordering a fenced block in this file changes what is printed.
    10. The automated test `test/automated/startup-display.sh` compares the printed display with the expected text. It fails when the two differ.
    11. The fences mark where each printed part begins and ends. They are not printed.
    12. First the title, on its own:

    ```
    Waytide: Human-Agent Relations
    ```

    13. The title leads. It is the first line of the display, and nothing the agent writes stands ahead of it.
    14. The title stands alone. Nothing is printed under it.
    15. The title is the category line. The root `README.md` leads with the same line.
    16. No description of Waytide is printed. What Waytide is and does belongs to the `README.md`.
    17. The display carries nothing that argues for the system to a reader already using it.
    18. Then the package set, where one is declared. The agent prints it after the harness has printed the display.
    19. The stanza follows the display rather than sitting inside it.
    20. Where no set is declared, this part is absent entirely. No line says there is none.
    21. The declared set `default` prints nothing where nothing is deactivated.
    22. The `default` set prints where it leaves an installed package deactivated, such as `ext/ruby-lang`.
    23. The condition is that nothing is off, not that the name is `default`.
    24. A suppressed stanza must never be the reason a deactivated package goes unmentioned.
    25. A named set other than `default` prints even where nothing is deactivated.
    26. The declaration is supplied by the read instruction. The a-project-declares-its-package-set rule says where the record lives and what it carries.
    27. The stanza takes this form:

    ```
    *design-by-efferent*, **foundation**, **git**, **journal**, **language**, *testing*,
    *ext/ruby-lang*, **versioning**
    package set: content
    (5 active of 8 installed)
    ```

    28. The stanza's lines carry no gap between them.
    29. The package list leads. The set's name follows it, above the count. The count closes the stanza.
    30. The set is named in the engineer's own wording, as in `package set: content`, not in a restatement of it.
    31. Every installed package is listed, in the order the session-start notice lists them.
    32. Active packages are bold. Deactivated packages are italic.
    33. No package is omitted, and none is replaced by a count.
    34. The count line states how many are active and the installed total.
    35. No legend is printed.
    36. Emphasis is available on the package set stanza and nowhere else in the display.
    37. The harness display is plain text, where markup reaches the engineer as literal asterisks.
    38. Then one blank line, then the copyright notice and the license line, on consecutive lines with no gap between them:

    ```
    Copyright © 2026 Scott Bellware
    *Eventide Common Interest License*
    ```

    39. The copyright and license belong on this display, not on the session-start notice.
    40. The copyright line carries the owner and the year alone. It does not name the work.
    41. The license line is the license's name alone, set in italics. It takes no leading words such as *Licensed under the*.
    42. The block keeps the license line in italics. `startup-display.sh` removes the asterisks from a line wrapped in them, so it prints without them.
    43. The gap falls after the license line, never between it and the copyright.
    44. The printed license line points to the license. It does not carry the terms, and is not the place to put them.
    45. The `LICENSE` file states the terms. A copy sits at this repository's root and in every package directory.
    46. The year is the year of the notice, not of the session. It is written into this rule and printed verbatim.
    47. The year is not computed. It changes when the rule changes.
    48. Then one blank line, then the loading line:

    ```
    Loading Waytide will take a few moments.
    ```

    49. The loading line says *Waytide* rather than *the rules*.
    50. The loading line deliberately repeats the session-start notice's caveat. Neither statement is removed.
    51. Then one blank line, then the block:

    ```
         __      /
        /  \    /
       |    |  /
        \__/  /
          | =/=
         _|_/
        / |
         / \
        /   \
       /    /
    ===========
        | |
      __|_|__
     (o)   (o)
    ```

    52. Each gap is one blank line. There are three: after the title, after the license line, and after the loading line.
    53. The harness renders the display as plain text, so the lines print exactly as the blocks hold them.
    54. A blank line prints as a blank line. The figure keeps its spacing without a fence.
    55. These are the whole of what is printed. No greeting, no account of what is about to be read, and no name for the block accompany them.
    56. The package set's absence is the ordinary case, not an omission.
    57. **Why:** An agent can skip a display it is told to print, or write it into its thinking, and nothing reports either. A harness-printed display does not depend on the agent. The package set alone needs markdown, so the agent prints it.

    CONTRADICTIONS: The source says the parts are printed "in this order" and places the package set second, between the title and the copyright ("First the title... Then the package set"). It also says the stanza is printed by the agent after the harness has printed the whole display, so it "follows the display rather than sitting inside it." In the same way, "Nothing is printed under it" for the title conflicts with that stated ordering, which puts the package set directly under the title.

### The directives, as the listing agent gave them

    1. The things the initialization display contains are printed once per session, verbatim, and in the order the rule gives.
    2. Four parts of the display (title, copyright and license, loading line, figure) are always printed. The package set is printed only where the project has declared a package set.
    3. The harness prints the four always-printed parts, and the agent prints none of them.
    4. When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints the four parts as a `systemMessage`.
    5. The agent prints the package set, at the head of the response that carries the rule read.
    6. `startup-display.sh` reads the four parts from the initialization rule's fenced blocks by position: the first is the title, the third is the copyright and license, the fourth is the loading line, and the fifth is the figure.
    7. `startup-display.sh` skips the initialization rule's second fenced block, which is the package-set example.
    8. Adding, removing, or reordering a fenced block in the initialization rule changes what is printed.
    9. The automated test `test/automated/startup-display.sh` compares the printed display with the expected text, and fails when the two differ.
    10. The display prints on `load waytide` and on no other prompt. A session opened with any other request shows no display.
    11. The title is printed first, as `Waytide: Human-Agent Relations`.
    12. The title stands alone, and nothing is printed under it.
    13. What the system is belongs to the `README.md`, not to the display.
    14. The agent prints the package-set stanza after the harness has printed the display. The stanza follows the display rather than sitting inside it.
    15. Where no package set is declared, nothing about a set is printed, including no line saying there is none.
    16. The declared set `default` prints no stanza where nothing is deactivated.
    17. The declared set `default` prints a stanza where it leaves an installed package deactivated (for example, `ext/ruby-lang`).
    18. The condition for leaving the stanza out is that nothing is deactivated, not that the set's name is `default`.
    19. A suppressed stanza must never be the reason a deactivated package goes unmentioned.
    20. A named set other than `default` prints a stanza even where nothing is deactivated.
    21. The package-set declaration is supplied to the agent by the read instruction, before any file is opened.
    22. The package-set stanza's lines (the package list, the set's name, and the count) carry no gap between them.
    23. In the package-set stanza the package list comes first and the set's name follows it.
    24. In the package-set stanza the set's name sits above the count line, and the count line closes the stanza.
    25. The set is named in the engineer's own wording, as `package set: <name>` (for example, `package set: content`), not in a restatement of it.
    26. Every installed package is listed in the stanza, in the order the session-start notice lists them.
    27. In the stanza, active packages are set in bold and deactivated packages in italic.
    28. No installed package is left out of the stanza, and none is replaced by a count.
    29. The stanza's count line states how many packages are active and how many are installed, in the form `(5 active of 8 installed)`.
    30. No legend for the bold and italic convention is printed.
    31. After the title there is one blank line, then the copyright notice `Copyright © 2026 Scott Bellware` and the license line `Eventide Common Interest License`, on consecutive lines.
    32. After the license line there is one blank line, then the loading line `Loading Waytide will take a few moments.`
    33. After the loading line there is one blank line, then the figure block, printed exactly as the rule holds it.
    34. Each gap in the display is exactly one blank line. There are three: after the title, after the license line, and after the loading line.
    35. The harness renders the display as plain text, so the lines print exactly as the fenced blocks hold them, and the figure keeps its spacing without a fence.
    36. The fences in the initialization rule mark where each printed part begins and ends, and they are not printed.
    37. The listed parts are the whole of what is printed. Nothing accompanies them: no greeting, no account of what is about to be read, and no name for the figure.
    38. The absence of the package set is the ordinary case and is not treated as an omission.
    39. The loading line names the wait that follows `load waytide`, in which the response opens every compiled rule in every installed package.
    40. The loading line deliberately repeats the session-start notice's caveat (*Loading the rules will take a few moments*), and neither statement is to be removed.
    41. The loading line says *Waytide* rather than *the rules*.
    42. The title leads the display. Nothing the agent writes can stand ahead of it.
    43. The title is the category line, the same line the root `README.md` leads with.
    44. No description of Waytide, and nothing that argues for the system, is printed in the display.
    45. The copyright line does not name the work. It carries the owner and the year alone.
    46. Emphasis is used on the package-set stanza and nowhere else in the display.
    47. Markup is not put into the plain-text display the harness prints, because there it reaches the engineer as literal asterisks.
    48. A standing statement that never changes, such as the copyright and license, belongs on this display and not as a permanent segment of the session-start notice.
    49. The license line sits directly under the copyright, with no blank line between them.
    50. The license line is the license's name alone, with no leading words such as *Licensed under the*.
    51. In the initialization rule's fenced block, the license line is kept in italics (wrapped in asterisks).
    52. `startup-display.sh` removes the asterisks from a line wrapped in them, so the display prints the license line without italics.
    53. The gap falls after the license line, never between the license line and the copyright.
    54. The printed license line points to the license and does not carry its terms. It is not the place to put them.
    55. A copy of the `LICENSE` file sits at the repository's root and in every package directory.
    56. The copyright year is the year of the notice, not of the session. It is written into the rule and printed verbatim, it is not computed, and it changes only when the rule changes.

### Checker A

    Verdicts, one line per directive. I judged only from directives.md and compressed.md.

    1. kept: "Five parts are printed once per session, verbatim and in this order."
    2. kept: "Four are always printed. The package set is printed only where the project has declared one." (the four parts are named in item 7)
    3. kept: "The harness prints the four always-printed parts. The agent prints none of them."
    4. kept: "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints them as a `systemMessage`."
    5. kept: "The agent prints the package set, at the head of the response that carries the rule read."
    6. kept: "The script reads the four from this file's fenced blocks, by position." / "The first, third, fourth, and fifth fenced blocks are the title, the copyright and license, the loading line, and the figure."
    7. kept: "The second fenced block is the package-set example, which the script skips."
    8. kept: "Adding, removing, or reordering a fenced block in this file changes what is printed."
    9. kept: "The automated test `test/automated/startup-display.sh` compares the printed display with the expected text. It fails when the two differ."
    10. kept: "The display prints on `load waytide` and on no other prompt. A session opened with any other request shows no display."
    11. kept: "First the title, on its own:" plus the block holding `Waytide: Human-Agent Relations`
    12. kept: "The title stands alone. Nothing is printed under it."
    13. kept: "What Waytide is and does belongs to the `README.md`."
    14. kept: "The agent prints it after the harness has printed the display." / "The stanza follows the display rather than sitting inside it."
    15. kept: "Where no set is declared, this part is absent entirely. No line says there is none."
    16. kept: "The declared set `default` prints nothing where nothing is deactivated."
    17. kept: "The `default` set prints where it leaves an installed package deactivated, such as `ext/ruby-lang`."
    18. kept: "The condition is that nothing is off, not that the name is `default`."
    19. kept: "A suppressed stanza must never be the reason a deactivated package goes unmentioned."
    20. kept: "A named set other than `default` prints even where nothing is deactivated."
    21. less precise: "The declaration is supplied by the read instruction." Missing: that it is supplied to the agent, and before any file is opened.
    22. kept: "The stanza's lines carry no gap between them."
    23. kept: "The package list leads. The set's name follows it"
    24. kept: "above the count. The count closes the stanza."
    25. kept: "The set is named in the engineer's own wording, as in `package set: content`, not in a restatement of it."
    26. kept: "Every installed package is listed, in the order the session-start notice lists them."
    27. kept: "Active packages are bold. Deactivated packages are italic."
    28. kept: "No package is omitted, and none is replaced by a count."
    29. kept: "The count line states how many are active and the installed total." (the form `(5 active of 8 installed)` comes from the example under "The stanza takes this form:")
    30. kept: "No legend is printed."
    31. kept: "Then one blank line, then the copyright notice and the license line, on consecutive lines with no gap between them:" plus the block. Item 52 places the gap "after the title". Item 18 lists the package set between the title and the copyright, but items 19 and 52 settle where the gap falls.
    32. kept: "Then one blank line, then the loading line:" plus the block holding `Loading Waytide will take a few moments.`
    33. kept: "Then one blank line, then the block:" / "the lines print exactly as the blocks hold them."
    34. kept: "Each gap is one blank line. There are three: after the title, after the license line, and after the loading line."
    35. kept: "The harness renders the display as plain text, so the lines print exactly as the blocks hold them." / "The figure keeps its spacing without a fence."
    36. kept: "The fences mark where each printed part begins and ends. They are not printed."
    37. kept: "These are the whole of what is printed. No greeting, no account of what is about to be read, and no name for the block accompany them."
    38. kept: "The package set's absence is the ordinary case, not an omission."
    39. lost. Missing: that the loading line names the wait after `load waytide`, in which the response opens every compiled rule in every installed package.
    40. kept: "The loading line deliberately repeats the session-start notice's caveat. Neither statement is removed."
    41. kept: "The loading line says *Waytide* rather than *the rules*."
    42. kept: "The title leads. It is the first line of the display, and nothing the agent writes stands ahead of it."
    43. kept: "The title is the category line. The root `README.md` leads with the same line."
    44. kept: "No description of Waytide is printed." / "The display carries nothing that argues for the system to a reader already using it."
    45. kept: "The copyright line carries the owner and the year alone. It does not name the work."
    46. kept: "Emphasis is available on the package set stanza and nowhere else in the display." ("available" is weaker than "used", but "nowhere else" holds the restriction.)
    47. kept: "The harness display is plain text, where markup reaches the engineer as literal asterisks." Read with item 36's "nowhere else in the display", this requires keeping markup out.
    48. less precise: "The copyright and license belong on this display, not on the session-start notice." Missing: the general principle that any standing, never-changing statement belongs here and not as a permanent segment of the notice.
    49. kept: "on consecutive lines with no gap between them"
    50. kept: "The license line is the license's name alone ... It takes no leading words such as *Licensed under the*."
    51. kept: "The block keeps the license line in italics."
    52. kept: "`startup-display.sh` removes the asterisks from a line wrapped in them, so it prints without them."
    53. kept: "The gap falls after the license line, never between it and the copyright."
    54. kept: "The printed license line points to the license. It does not carry the terms, and is not the place to put them."
    55. kept: "A copy sits at this repository's root and in every package directory."
    56. less precise: "The year is the year of the notice, not of the session. It is written into this rule and printed verbatim." / "The year is not computed. It changes when the rule changes." Missing: "only". As written, it can be read to mean the year changes whenever the rule changes.

### Checker B

    Verdicts for initialization-rule (directives.md against compressed.md). Totals: 49 kept, 6 less precise, 1 lost.

    1. kept — "Five parts are printed once per session, verbatim and in this order."
    2. kept — "Four are always printed. The package set is printed only where the project has declared one."
    3. kept — "The harness prints the four always-printed parts. The agent prints none of them."
    4. kept — "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints them as a `systemMessage`."
    5. kept — "The agent prints the package set, at the head of the response that carries the rule read."
    6. kept — "The script reads the four from this file's fenced blocks, by position." / "The first, third, fourth, and fifth fenced blocks are the title, the copyright and license, the loading line, and the figure."
    7. kept — "The second fenced block is the package-set example, which the script skips."
    8. kept — "Adding, removing, or reordering a fenced block in this file changes what is printed."
    9. kept — "The automated test `test/automated/startup-display.sh` compares the printed display with the expected text. It fails when the two differ."
    10. kept — "The display prints on `load waytide` and on no other prompt. A session opened with any other request shows no display."
    11. kept — "First the title, on its own:" plus the block "Waytide: Human-Agent Relations"
    12. kept — "The title stands alone. Nothing is printed under it."
    13. kept — "What Waytide is and does belongs to the `README.md`."
    14. kept — "The agent prints it after the harness has printed the display." / "The stanza follows the display rather than sitting inside it."
    15. kept — "Where no set is declared, this part is absent entirely. No line says there is none."
    16. kept — "The declared set `default` prints nothing where nothing is deactivated."
    17. kept — "The `default` set prints where it leaves an installed package deactivated, such as `ext/ruby-lang`."
    18. kept — "The condition is that nothing is off, not that the name is `default`."
    19. kept — "A suppressed stanza must never be the reason a deactivated package goes unmentioned."
    20. kept — "A named set other than `default` prints even where nothing is deactivated."
    21. less precise — "The declaration is supplied by the read instruction." Missing: that it is supplied to the agent, and before any file is opened.
    22. kept — "The stanza's lines carry no gap between them."
    23. kept — "The package list leads. The set's name follows it"
    24. kept — "above the count. The count closes the stanza."
    25. kept — "The set is named in the engineer's own wording, as in `package set: content`, not in a restatement of it."
    26. kept — "Every installed package is listed, in the order the session-start notice lists them."
    27. kept — "Active packages are bold. Deactivated packages are italic."
    28. kept — "No package is omitted, and none is replaced by a count."
    29. less precise — "The count line states how many are active and the installed total." Missing: the required form `(N active of M installed)` is shown only in the example and never stated as the form to use.
    30. kept — "No legend is printed."
    31. kept — "Then one blank line, then the copyright notice and the license line, on consecutive lines with no gap between them:" plus the block
    32. kept — "Then one blank line, then the loading line:" plus "Loading Waytide will take a few moments."
    33. kept — "Then one blank line, then the block:" / "the lines print exactly as the blocks hold them."
    34. kept — "Each gap is one blank line. There are three: after the title, after the license line, and after the loading line."
    35. kept — "The harness renders the display as plain text, so the lines print exactly as the blocks hold them." / "The figure keeps its spacing without a fence."
    36. kept — "The fences mark where each printed part begins and ends. They are not printed."
    37. kept — "These are the whole of what is printed. No greeting, no account of what is about to be read, and no name for the block accompany them."
    38. kept — "The package set's absence is the ordinary case, not an omission."
    39. lost — Missing: that the loading line names the wait after `load waytide`, during which the response opens every compiled rule in every installed package.
    40. kept — "The loading line deliberately repeats the session-start notice's caveat. Neither statement is removed."
    41. kept — "The loading line says *Waytide* rather than *the rules*."
    42. kept — "The title leads. It is the first line of the display, and nothing the agent writes stands ahead of it."
    43. kept — "The title is the category line. The root `README.md` leads with the same line."
    44. less precise — "No description of Waytide is printed." / "The display carries nothing that argues for the system to a reader already using it." Missing: the ban on arguing for the system is unqualified in the directive. The added "to a reader already using it" can be read as narrowing it.
    45. kept — "The copyright line carries the owner and the year alone. It does not name the work."
    46. kept — "Emphasis is available on the package set stanza and nowhere else in the display."
    47. kept — "The harness display is plain text, where markup reaches the engineer as literal asterisks." together with "nowhere else in the display."
    48. less precise — "The copyright and license belong on this display, not on the session-start notice." Missing: the general principle that any standing statement that never changes belongs here, and the point that it is not to be a *permanent segment* of the notice.
    49. kept — "on consecutive lines with no gap between them"
    50. kept — "The license line is the license's name alone ... It takes no leading words such as *Licensed under the*."
    51. kept — "The block keeps the license line in italics."
    52. kept — "`startup-display.sh` removes the asterisks from a line wrapped in them, so it prints without them."
    53. kept — "The gap falls after the license line, never between it and the copyright."
    54. kept — "The printed license line points to the license. It does not carry the terms, and is not the place to put them."
    55. kept — "A copy sits at this repository's root and in every package directory."
    56. less precise — "The year is the year of the notice, not of the session. It is written into this rule and printed verbatim." / "The year is not computed. It changes when the rule changes." Missing: "only". The year changes *only* when the rule changes.

### The re-check, after the repairs

    Of the 56 directives, 54 are kept, 2 are less precise and none are lost. I judged only from directives.md and compressed.md.

    1. kept: "Five parts are printed once per session, verbatim and in this order."
    2. kept: "Four are always printed. The package set is printed only where the project has declared one."
    3. kept: "The harness prints the four always-printed parts. The agent prints none of them."
    4. kept: "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints them as a `systemMessage`."
    5. kept: "The agent prints the package set, at the head of the response that carries the rule read."
    6. kept: "The script reads the four from this file's fenced blocks, by position." / "The first, third, fourth, and fifth fenced blocks are the title, the copyright and license, the loading line, and the figure."
    7. kept: "The second fenced block is the package-set example, which the script skips."
    8. kept: "Adding, removing, or reordering a fenced block in this file changes what is printed."
    9. kept: "The automated test `test/automated/startup-display.sh` compares the printed display with the expected text. It fails when the two differ."
    10. kept: "The display prints on `load waytide` and on no other prompt. A session opened with any other request shows no display."
    11. kept: "First the title, on its own:" followed by the block holding "Waytide: Human-Agent Relations"
    12. kept: "The title stands alone. Nothing is printed under it."
    13. kept: "What Waytide is and does belongs to the `README.md`."
    14. kept: "The agent prints it after the harness has printed the display." / "The stanza follows the display rather than sitting inside it."
    15. kept: "Where no set is declared, this part is absent entirely. No line says there is none."
    16. kept: "The declared set `default` prints nothing where nothing is deactivated."
    17. kept: "The `default` set prints where it leaves an installed package deactivated, such as `ext/ruby-lang`."
    18. kept: "The condition is that nothing is off, not that the name is `default`."
    19. kept: "A suppressed stanza must never be the reason a deactivated package goes unmentioned."
    20. kept: "A named set other than `default` prints even where nothing is deactivated."
    21. kept: "The declaration is supplied to the agent by the read instruction, before any file is opened."
    22. kept: "The stanza's lines carry no gap between them."
    23. kept: "The package list leads. The set's name follows it"
    24. kept: "The set's name follows it, above the count. The count closes the stanza."
    25. kept: "The set is named in the engineer's own wording, as in `package set: content`, not in a restatement of it."
    26. kept: "Every installed package is listed, in the order the session-start notice lists them."
    27. kept: "Active packages are bold. Deactivated packages are italic."
    28. kept: "No package is omitted, and none is replaced by a count."
    29. kept: "The count line states how many are active and the installed total." together with "The stanza takes this form:" and its example "(5 active of 8 installed)"
    30. kept: "No legend is printed."
    31. kept: "Then one blank line, then the copyright notice and the license line, on consecutive lines with no gap between them:" followed by the block holding "Copyright © 2026 Scott Bellware" and "*Eventide Common Interest License*"
    32. kept: "Then one blank line, then the loading line:" followed by the block holding "Loading Waytide will take a few moments."
    33. kept: "Then one blank line, then the block:" / "the lines print exactly as the blocks hold them."
    34. kept: "Each gap is one blank line. There are three: after the title, after the license line, and after the loading line."
    35. kept: "The harness renders the display as plain text, so the lines print exactly as the blocks hold them." / "The figure keeps its spacing without a fence."
    36. kept: "The fences mark where each printed part begins and ends. They are not printed."
    37. kept: "These are the whole of what is printed. No greeting, no account of what is about to be read, and no name for the block accompany them."
    38. kept: "The package set's absence is the ordinary case, not an omission."
    39. kept: "It names the wait after `load waytide`, while the response opens every compiled rule in every installed package."
    40. less precise: "The loading line deliberately repeats the session-start notice's caveat. Neither statement is removed." Missing: the caveat's own wording (*Loading the rules will take a few moments*), so which statement is meant is not identified.
    41. kept: "The loading line says *Waytide* rather than *the rules*."
    42. kept: "The title leads. It is the first line of the display, and nothing the agent writes stands ahead of it."
    43. kept: "The title is the category line. The root `README.md` leads with the same line."
    44. less precise: "No description of Waytide is printed." / "The display carries nothing that argues for the system to a reader already using it." Missing: the ban on arguing for the system is unqualified in the original, and the added "to a reader already using it" can be read as narrowing it.
    45. kept: "The copyright line carries the owner and the year alone. It does not name the work."
    46. kept: "Emphasis is available on the package set stanza and nowhere else in the display." Use on the stanza is required by "Active packages are bold. Deactivated packages are italic."
    47. kept: "Emphasis is available on the package set stanza and nowhere else in the display." / "The harness display is plain text, where markup reaches the engineer as literal asterisks."
    48. kept: "The copyright and license belong on this display, not on the session-start notice. Any standing statement that never changes belongs here, not as a permanent segment of the notice."
    49. kept: "on consecutive lines with no gap between them"
    50. kept: "The license line is the license's name alone ... It takes no leading words such as *Licensed under the*."
    51. kept: "The block keeps the license line in italics."
    52. kept: "`startup-display.sh` removes the asterisks from a line wrapped in them, so it prints without them."
    53. kept: "The gap falls after the license line, never between it and the copyright."
    54. kept: "The printed license line points to the license. It does not carry the terms, and is not the place to put them."
    55. kept: "A copy sits at this repository's root and in every package directory."
    56. kept: "The year is the year of the notice, not of the session. It is written into this rule and printed verbatim." / "The year is not computed. It changes only when the rule changes."

## logs-directory

### The compressor's answer

    The compressed rule body is below. The source contradicts itself nowhere. I dropped the source's Related list as the guidance requires, so the pointer to the file-names rule (the ISO-8601-UTC prefix every record here takes) is gone. That pointer only cites another rule and adds no directive of its own.

    ---

    1. `waytide/local/logs/` holds the project's running records, together.
    2. `waytide/local/logs/log/` holds the decision log, one file per decision, with a one-line title (`decision-log-convention`).
    3. `waytide/local/logs/loops/` holds the loop records, one file per feature, recording the cycles through the loop (`design-by-efferent`'s loop-records rule).
    4. `waytide/local/logs/work-sessions/` holds the narrative record of a work session (`work-sessions-convention`).
    5. Write a decision entry to `waytide/local/logs/log/`.
    6. Write a loop record to `waytide/local/logs/loops/`.
    7. Write a work session record to `waytide/local/logs/work-sessions/`.
    8. A record belongs here when it accrues chronologically and is never revised.
    9. Each record here is a running account, entry after entry, in the order things happened, and it is reached by date.
    10. Nothing here states what is currently true. Items, implementation records, and migration records do not belong here.
    11. A migration record does not belong here. It is one document, revised while the migration runs, and prospective: steps written to be executed.
    12. Keeping a record afterward makes it durable, not chronological. Durability does not qualify a record for this directory.
    13. The three records keep their own names and their own conventions. This rule only groups them.
    14. `log` stays `log`. Do not rename it to `decisions`, because every rule that says *write a log entry* means that directory.

    ## A fourth running record goes here

    1. Put a running record this rule does not name under `waytide/local/logs/` too.
    2. The convention that adds it names its directory under `waytide/local/logs/`.
    3. That is all this rule asks of a later convention.

    ## The grouping crosses a package boundary, and does not invert it

    1. `logs/loops/` is contributed by `design-by-efferent`, which includes `foundation`, not the reverse.
    2. Foundation's naming of the parent directory is only a citation.
    3. Foundation requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it.
    4. A project that installs only `foundation` has `logs/log/` and no `logs/loops/`, and nothing is missing.
    5. **Why:** Grouping the records puts the difference between a chronological account and a statement of current state into the path. It also gives a later running record an obvious place.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. The project's running records sit together under `waytide/local/logs/`.
    2. Decision log entries go in `waytide/local/logs/log/`, one file per decision, with a one-line title.
    3. Loop records go in `waytide/local/logs/loops/`, one file per feature, recording the cycles through the loop.
    4. Work session records (the narrative record of a work session) go in `waytide/local/logs/work-sessions/`.
    5. A record belongs under `waytide/local/logs/` only if it accrues chronologically and is never revised.
    6. Nothing under `waytide/local/logs/` is a statement of what is currently true. Items, implementation records, and migration records do not go there.
    7. A migration record does not go under `waytide/local/logs/`. It is one document, revised while the migration runs, and prospective. That it is kept afterward makes it durable, not chronological.
    8. The decision log, the loop records, and the work session records keep their own names and their own conventions. This rule only groups them and settles nothing else about them.
    9. The `log` directory stays named `log` and is not renamed to `decisions`.
    10. A later convention that adds a new running record names that record's directory under `waytide/local/logs/`, and says so in the convention itself.
    11. A running record that this rule does not name also goes under `waytide/local/logs/`.
    12. Foundation's naming of `logs/` as the parent of `logs/loops/` is only a citation. Foundation requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it.
    13. A project that installs `foundation` alone has `logs/log/` and no `logs/loops/`, and is not missing anything.
    14. Every record under `waytide/local/logs/` takes the ISO-8601-UTC file-name prefix (per the file-names rule).

### Checker A

    1 — kept — "`waytide/local/logs/` holds the project's running records, together."
    2 — kept — "`waytide/local/logs/log/` holds the decision log, one file per decision, with a one-line title" / "Write a decision entry to `waytide/local/logs/log/`."
    3 — kept — "`waytide/local/logs/loops/` holds the loop records, one file per feature, recording the cycles through the loop" / "Write a loop record to `waytide/local/logs/loops/`."
    4 — kept — "`waytide/local/logs/work-sessions/` holds the narrative record of a work session" / "Write a work session record to `waytide/local/logs/work-sessions/`."
    5 — less precise — "A record belongs here when it accrues chronologically and is never revised." Missing: "only if". "When" gives a sufficient condition, not a necessary one. Items 10–12 partly cover the exclusion.
    6 — kept — "Nothing here states what is currently true. Items, implementation records, and migration records do not belong here."
    7 — kept — "A migration record does not belong here. It is one document, revised while the migration runs, and prospective" / "Keeping a record afterward makes it durable, not chronological."
    8 — kept — "The three records keep their own names and their own conventions. This rule only groups them."
    9 — kept — "`log` stays `log`. Do not rename it to `decisions`"
    10 — kept — "The convention that adds it names its directory under `waytide/local/logs/`."
    11 — kept — "Put a running record this rule does not name under `waytide/local/logs/` too."
    12 — kept — "Foundation's naming of the parent directory is only a citation." / "Foundation requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it."
    13 — kept — "A project that installs only `foundation` has `logs/log/` and no `logs/loops/`, and nothing is missing."
    14 — less precise — "the file-names rule — the ISO-8601-UTC prefix every record here takes" (Related list only). Missing: it is never stated as a directive in the body. Only a Related pointer carries it, and the preamble says that pointer was dropped, which leaves it unclear whether it still binds.

### Checker B

    1 — kept — "`waytide/local/logs/` holds the project's running records, together."
    2 — kept — "`waytide/local/logs/log/` holds the decision log, one file per decision, with a one-line title"; "Write a decision entry to `waytide/local/logs/log/`."
    3 — kept — "`waytide/local/logs/loops/` holds the loop records, one file per feature, recording the cycles through the loop"; "Write a loop record to `waytide/local/logs/loops/`."
    4 — kept — "`waytide/local/logs/work-sessions/` holds the narrative record of a work session"; "Write a work session record to `waytide/local/logs/work-sessions/`."
    5 — less precise — "A record belongs here when it accrues chronologically and is never revised." Missing: "only if". "When" gives a sufficient condition, not a necessary one.
    6 — kept — "Nothing here states what is currently true. Items, implementation records, and migration records do not belong here."
    7 — kept — "A migration record does not belong here. It is one document, revised while the migration runs, and prospective"; "Keeping a record afterward makes it durable, not chronological."
    8 — kept — "The three records keep their own names and their own conventions. This rule only groups them."
    9 — kept — "`log` stays `log`. Do not rename it to `decisions`"
    10 — kept — "The convention that adds it names its directory under `waytide/local/logs/`."; "That is all this rule asks of a later convention."
    11 — kept — "Put a running record this rule does not name under `waytide/local/logs/` too."
    12 — kept — "Foundation's naming of the parent directory is only a citation."; "Foundation requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it."
    13 — kept — "A project that installs only `foundation` has `logs/log/` and no `logs/loops/`, and nothing is missing."
    14 — less precise — "the file-names rule — the ISO-8601-UTC prefix every record here takes" (Related list only). Missing: it is not stated as a directive in the body. The preamble also says this pointer was dropped, which contradicts the Related list that is still there, so whether it binds is ambiguous.

### The re-check, after the repairs

    All 14 directives are kept. None is less precise or lost.

    1. kept — "`waytide/local/logs/` holds the project's running records, together."
    2. kept — "`waytide/local/logs/log/` holds the decision log, one file per decision, with a one-line title" / "Write a decision entry to `waytide/local/logs/log/`."
    3. kept — "`waytide/local/logs/loops/` holds the loop records, one file per feature, recording the cycles through the loop" / "Write a loop record to `waytide/local/logs/loops/`."
    4. kept — "`waytide/local/logs/work-sessions/` holds the narrative record of a work session" / "Write a work session record to `waytide/local/logs/work-sessions/`."
    5. kept — "A record belongs here only when it accrues chronologically and is never revised."
    6. kept — "Nothing here states what is currently true. Items, implementation records, and migration records do not belong here."
    7. kept — "A migration record does not belong here. It is one document, revised while the migration runs, and prospective" / "Keeping a record afterward makes it durable, not chronological."
    8. kept — "The three records keep their own names and their own conventions. This rule only groups them." ("only groups them" requires that the rule settle nothing else about them.)
    9. kept — "`log` stays `log`. Do not rename it to `decisions`"
    10. kept — "The convention that adds it names its directory under `waytide/local/logs/`." (The convention naming the directory is the convention saying so itself.)
    11. kept — "Put a running record this rule does not name under `waytide/local/logs/` too."
    12. kept — "Foundation's naming of the parent directory is only a citation." / "Foundation requires nothing of what sits inside `loops/`, reads nothing there, and derives nothing from it."
    13. kept — "A project that installs only `foundation` has `logs/log/` and no `logs/loops/`, and nothing is missing."
    14. kept — "Every record here takes the ISO-8601-UTC prefix of the file-names rule."

## migration-convention

### The compressor's answer

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

    CONTRADICTIONS: The Related entry for the logs-directory rule says a migration record "is written to be executed rather than to account for what happened". The body says the directory holds "the record of how the move actually went", and directs "Record what actually happened against the plan as the work proceeds". Point 20 keeps the body's directive. Point 13 keeps only the Related entry's "one document" and "revised" distinctions, not its "rather than to account for what happened" clause.

### The directives, as the listing agent gave them

    1. Write the execution plan for moving content across a repository boundary (out of this repository or into it) as a migration record in `waytide/local/migration/`.
    2. Record in `waytide/local/migration/` how a move across a repository boundary actually went.
    3. Use a migration record when content is to cross out of this repository or into it. That covers a library extracted into its own repository, a body of work moved to a project that will own it, one repository split into several or several merged into one, and existing conventions migrated into an installed system. If the content ends up under a different repository's root, it belongs in `waytide/local/migration/`.
    4. Write a migration record before moving content across a repository boundary.
    5. Do not use an ordinary item (one that sequences work inside the repository) for a move that crosses out of the repository.
    6. Do not delete a migration record on completion. Keep it after the content has gone.
    7. A migration record is frontmatter-free markdown, like rules: a `# <title>`, then prose.
    8. A migration record states the source and destination repositories outright.
    9. A migration record states the increments of the move in order.
    10. A migration record states what is true while the move is under way: what is duplicated, what is unavailable, and what is authoritative.
    11. Record in the migration record what actually happened against the plan, as the work proceeds.
    12. End a migration record file with the `Authored by … / Changed by …` provenance footer, as the working-state-artifacts-carry-a-provenance-footer rule requires.
    13. A migration record's filename follows the ISO-8601-UTC prefix convention of the file-names rule.
    14. Migration records written before this convention reached a project keep the names they were given. Do not revise their datetime to a resolution it never had.

### Checker A

    The shorter version keeps all 14 directives. None is less precise and none is lost.

    1. kept — "`waytide/local/migration/` holds migration records." / "A migration record is the execution plan for moving content across a repository boundary" / "Plan and record here any content leaving this repository for another, or arriving from one."
    2. kept — "and the record of how the move actually went."
    3. kept — "Plan and record here any content leaving this repository for another, or arriving from one." / "Use it when content ends up under a different repository's root." / "Examples: a library extracted into its own repository, or work moved to a project that will own it." / "Further examples: one repository split into several, several merged into one, or existing conventions migrated into an installed system."
    4. kept — "Write it before moving the content."
    5. kept — "Do not use an ordinary item for a move that crosses out of the repository." / "An item sequences a build inside this repository"
    6. kept — "Keep the record after the content has gone. Do not delete it on completion."
    7. kept — "Use the same frontmatter-free markdown as rules: a `# <title>`, then prose."
    8. kept — "State the source and destination repositories outright."
    9. kept — "State the increments in order."
    10. kept — "State what is true in between: what is duplicated, what is unavailable, and what is authoritative while the move is under way."
    11. kept — "Record what actually happened against the plan as the work proceeds."
    12. kept — "End the file with the `Authored by … / Changed by …` footer, per the working-state-artifacts-carry-a-provenance-footer rule."
    13. kept — "The filename follows the ISO-8601-UTC prefix convention of the file-names rule."
    14. kept — "Records written before this convention reached a project keep their names. A datetime is not revised to a resolution it never had."

### Checker B

    All 14 directives are kept in the shorter version (compressed.md). None is less precise or lost.

    1. kept: "`waytide/local/migration/` holds migration records." / "A migration record is the execution plan for moving content across a repository boundary" / "any content leaving this repository for another, or arriving from one"
    2. kept: "and the record of how the move actually went."
    3. kept: "Plan and record here any content leaving this repository for another, or arriving from one." / "Use it when content ends up under a different repository's root." / "a library extracted into its own repository, or work moved to a project that will own it" / "one repository split into several, several merged into one, or existing conventions migrated into an installed system"
    4. kept: "Write it before moving the content."
    5. kept: "Do not use an ordinary item for a move that crosses out of the repository." / "An item sequences a build inside this repository"
    6. kept: "Keep the record after the content has gone. Do not delete it on completion."
    7. kept: "Use the same frontmatter-free markdown as rules: a `# <title>`, then prose."
    8. kept: "State the source and destination repositories outright."
    9. kept: "State the increments in order."
    10. kept: "State what is true in between: what is duplicated, what is unavailable, and what is authoritative while the move is under way."
    11. kept: "Record what actually happened against the plan as the work proceeds."
    12. kept: "End the file with the `Authored by … / Changed by …` footer, per the working-state-artifacts-carry-a-provenance-footer rule."
    13. kept: "The filename follows the ISO-8601-UTC prefix convention of the file-names rule."
    14. kept: "Records written before this convention reached a project keep their names. A datetime is not revised to a resolution it never had."

## observations-convention

### The compressor's answer

    Lines 1–6 below are the opening statements, which come before any section heading.

    1. `waytide/local/items/` holds working hypotheses, definitions, and methods that are not yet binding.
    2. They are rule-candidates surfaced during open-ended discovery, before the thinking has stabilized.
    3. They are not read as binding at session start, the way rules are.
    4. An observation lives in `waytide/local/items/`.
    5. An observation is tagged `[observation]`.
    6. The tag is what makes a record an observation.

    ## `Stated` is an observation's only state, and it never changes

    1. An observation carries `**State:** Stated` from the moment it is written.
    2. It keeps that state for the rest of its life.
    3. Its filename ends `-STATED`.
    4. It carries no `**Why this state:**` line.
    5. An observation has no lifecycle.
    6. It is never realized, abandoned, lapsed, superseded, or suspended.
    7. An observation that no longer holds is not retracted.
    8. A later observation states the later thinking.
    9. The earlier observation stays as what was thought at the time.
    10. Promotion is not a state change.
    11. When an observation stabilizes into a binding convention, write the rule in `waytide/local/rules/`.
    12. When the rule is written, the observation stays exactly as it is, as the discovery record.
    13. The items-convention needs no exception, because an observation also carries a state from the moment it is written. Its state is fixed, not absent.

    ## The shape

    1. **When to use:** use an observation for material worth keeping that is still under active discovery.
    2. Also use one for a method or definition the engineer has not ratified as a convention.
    3. When in doubt between a rule and an observation, prefer an observation.
    4. **Format:** use the same frontmatter-free markdown as rules.
    5. The file starts with a `# <title>`, then a `**State:** Stated` line.
    6. Next comes a `**Tags:**` line carrying `[observation]`, then the content in prose.
    7. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
    8. The filename ends `-STATED`.
    9. **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
    10. **Promotion:** write the rule in `waytide/local/rules/`.
    11. Note the promotion in the two files.
    12. Add a `waytide/local/logs/log/` entry for the promotion.
    13. Leave the observation as written.
    14. **Recording one:** add the file.
    15. Add a matching one-line entry to `waytide/local/logs/log/`.
    16. The entry notes that it was recorded as an observation, and why it is not yet a rule.
    17. Never change an observation's state.
    18. Where the thinking moves, write a later observation and leave the earlier one as written.
    19. **Why:** discovery produces valuable thinking before it is ready to bind. A place for non-binding hypotheses keeps that thinking without imposing it early as a rule.

    CONTRADICTIONS: The Promotion bullet says to "note the promotion in the two files". One of those two files is the observation, so the note would change it. The same bullet then says "Leave the observation as written". Elsewhere the rule says the observation "stays exactly as it is" and "Nothing about the observation changes when the rule appears". The "How to apply" section also says to "change nothing about the observation when you do". Both statements are kept above as the source has them.

### The directives, as the listing agent gave them

    1. An observation lives in `waytide/local/items/`.
    2. An observation is tagged `[observation]`; the tag is what makes a record an observation.
    3. Observations are not read as binding at session start the way rules are.
    4. An observation carries `**State:** Stated` from the moment it is written.
    5. An observation carries the state `Stated` for the rest of its life; never change an observation's state.
    6. An observation's filename ends `-STATED`.
    7. An observation carries no `**Why this state:**` line.
    8. An observation has no lifecycle: it is never realized, abandoned, lapsed, superseded, or suspended.
    9. An observation that no longer holds is not retracted; a later observation states the later thinking, and the earlier one stays as written, as what was thought at the time.
    10. Promotion of an observation is not a state change.
    11. When an observation stabilizes into a binding convention, the rule is written in `waytide/local/rules/`.
    12. When an observation is promoted, the observation stays exactly as it is, as the discovery record; nothing about the observation changes when the rule appears.
    13. The items-convention needs no exception for observations: an observation, like every item, carries a state from the moment it is written.
    14. Use an observation when the material is genuinely useful to keep but still under active discovery, or when it is a method or definition the engineer has not ratified as a convention.
    15. When in doubt between a rule and an observation, prefer an observation.
    16. An observation uses the same frontmatter-free markdown format as rules: a `# <title>`, a `**State:** Stated` line, a `**Tags:**` line carrying `[observation]`, then the content in prose.
    17. An observation's filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
    18. End an observation file with the `Authored by … / Changed by …` provenance footer, like every working-state artifact.
    19. When promoting an observation, note the promotion in the two files (the rule and the observation).
    20. When promoting an observation, add a `waytide/local/logs/log/` entry for the promotion.
    21. When recording an observation, add the file, and add a matching one-line entry to `waytide/local/logs/log/` noting it was recorded as an observation and why it is not yet a rule.

    Note: directive 19 ("note the promotion in the two files") conflicts with directive 12 and with "change nothing about the observation when you do" in How to apply. Both appear in the source as written.

### Checker A

    1. kept — "An observation lives in `waytide/local/items/`."
    2. kept — "An observation is tagged `[observation]`." / "The tag is what makes a record an observation."
    3. kept — "They are not read as binding at session start, the way rules are."
    4. kept — "An observation carries `**State:** Stated` from the moment it is written."
    5. kept — "It keeps that state for the rest of its life." / "Never change an observation's state."
    6. kept — "Its filename ends `-STATED`." (and "The filename ends `-STATED`.")
    7. kept — "It carries no `**Why this state:**` line."
    8. kept — "An observation has no lifecycle." / "It is never realized, abandoned, lapsed, superseded, or suspended."
    9. kept — "An observation that no longer holds is not retracted." / "A later observation states the later thinking." / "The earlier observation stays as what was thought at the time." / "write a later observation and leave the earlier one as written."
    10. kept — "Promotion is not a state change."
    11. kept — "When an observation stabilizes into a binding convention, write the rule in `waytide/local/rules/`."
    12. kept — "When the rule is written, the observation stays exactly as it is, as the discovery record." / "Leave the observation as written."
    13. kept — "The items-convention needs no exception, because an observation also carries a state from the moment it is written."
    14. kept — "use an observation for material worth keeping that is still under active discovery." / "Also use one for a method or definition the engineer has not ratified as a convention."
    15. kept — "When in doubt between a rule and an observation, prefer an observation."
    16. kept — "use the same frontmatter-free markdown as rules." / "The file starts with a `# <title>`, then a `**State:** Stated` line." / "Next comes a `**Tags:**` line carrying `[observation]`, then the content in prose."
    17. kept — "The filename follows the ISO-8601-UTC prefix convention (see the file-names rule)."
    18. kept — "end the file with the `Authored by … / Changed by …` footer, like every working-state artifact."
    19. kept — "Note the promotion in the two files." (The shorter version keeps the same conflict with directive 12 that the source has. Under **Promotion** it also says "Leave the observation as written.")
    20. kept — "Add a `waytide/local/logs/log/` entry for the promotion."
    21. kept — "**Recording one:** add the file." / "Add a matching one-line entry to `waytide/local/logs/log/`." / "The entry notes that it was recorded as an observation, and why it is not yet a rule."

    The shorter version carries all 21 directives. None is less precise and none is lost.

### Checker B

    1. kept: "An observation lives in `waytide/local/items/`."
    2. kept: "An observation is tagged `[observation]`." / "The tag is what makes a record an observation."
    3. kept: "They are not read as binding at session start, the way rules are."
    4. kept: "An observation carries `**State:** Stated` from the moment it is written."
    5. kept: "It keeps that state for the rest of its life." / "Never change an observation's state."
    6. kept: "Its filename ends `-STATED`." (also "The filename ends `-STATED`.")
    7. kept: "It carries no `**Why this state:**` line."
    8. kept: "An observation has no lifecycle." / "It is never realized, abandoned, lapsed, superseded, or suspended."
    9. kept: "An observation that no longer holds is not retracted." / "A later observation states the later thinking." / "The earlier observation stays as what was thought at the time." / "write a later observation and leave the earlier one as written"
    10. kept: "Promotion is not a state change."
    11. kept: "When an observation stabilizes into a binding convention, write the rule in `waytide/local/rules/`."
    12. kept: "When the rule is written, the observation stays exactly as it is, as the discovery record." / "Leave the observation as written."
    13. kept: "The items-convention needs no exception, because an observation also carries a state from the moment it is written."
    14. kept: "use an observation for material worth keeping that is still under active discovery." / "Also use one for a method or definition the engineer has not ratified as a convention."
    15. kept: "When in doubt between a rule and an observation, prefer an observation."
    16. kept: "use the same frontmatter-free markdown as rules." / "The file starts with a `# <title>`, then a `**State:** Stated` line." / "Next comes a `**Tags:**` line carrying `[observation]`, then the content in prose."
    17. kept: "The filename follows the ISO-8601-UTC prefix convention (see the file-names rule)."
    18. kept: "end the file with the `Authored by … / Changed by …` footer, like every working-state artifact."
    19. less precise: "Note the promotion in the two files." Missing: it does not say which two files they are (the rule and the observation). The source's conflict with directive 12 is carried over unchanged ("Leave the observation as written" sits next to it).
    20. kept: "Add a `waytide/local/logs/log/` entry for the promotion."
    21. kept: "**Recording one:** add the file." / "Add a matching one-line entry to `waytide/local/logs/log/`." / "The entry notes that it was recorded as an observation, and why it is not yet a rule."

### The re-check, after the repairs

    1. kept — "An observation lives in `waytide/local/items/`."
    2. kept — "An observation is tagged `[observation]`." / "The tag is what makes a record an observation."
    3. kept — "They are not read as binding at session start, the way rules are."
    4. kept — "An observation carries `**State:** Stated` from the moment it is written."
    5. kept — "It keeps that state for the rest of its life." / "Never change an observation's state."
    6. kept — "Its filename ends `-STATED`." (also "The filename ends `-STATED`.")
    7. kept — "It carries no `**Why this state:**` line."
    8. kept — "An observation has no lifecycle." / "It is never realized, abandoned, lapsed, superseded, or suspended."
    9. kept — "An observation that no longer holds is not retracted." / "A later observation states the later thinking." / "The earlier observation stays as what was thought at the time." / "write a later observation and leave the earlier one as written."
    10. kept — "Promotion is not a state change."
    11. kept — "When an observation stabilizes into a binding convention, write the rule in `waytide/local/rules/`."
    12. kept — "When the rule is written, the observation stays exactly as it is, as the discovery record." / "Leave the observation as written."
    13. kept — "The items-convention needs no exception, because an observation also carries a state from the moment it is written."
    14. kept — "use an observation for material worth keeping that is still under active discovery." / "Also use one for a method or definition the engineer has not ratified as a convention."
    15. kept — "When in doubt between a rule and an observation, prefer an observation."
    16. kept — "use the same frontmatter-free markdown as rules." / "The file starts with a `# <title>`, then a `**State:** Stated` line." / "Next comes a `**Tags:**` line carrying `[observation]`, then the content in prose."
    17. kept — "The filename follows the ISO-8601-UTC prefix convention (see the file-names rule)."
    18. kept — "end the file with the `Authored by … / Changed by …` footer, like every working-state artifact."
    19. kept — "Note the promotion in the two files, the rule and the observation."
    20. kept — "Add a `waytide/local/logs/log/` entry for the promotion."
    21. kept — "**Recording one:** add the file." / "Add a matching one-line entry to `waytide/local/logs/log/`." / "The entry notes that it was recorded as an observation, and why it is not yet a rule."

    All 21 directives are kept. The conflict the list flags between 19 and 12 is still in the shorter version. "Note the promotion in the two files, the rule and the observation" sits next to "the observation stays exactly as it is" and "Leave the observation as written". The shorter version keeps the conflict as the source has it and does not resolve it.

## package-dependency-heading

### The compressor's answer

    1. A design is an item tagged `[design]`.
    2. A design may have a section documenting a dependency on a package.
    3. A package means a gem, a library, or another installable package.
    4. Title that section **Package Dependency**.
    5. Do not title it just "Dependency".
    6. Use plain "Dependency" only for sections about something other than a package.
    7. **Why:** "Dependency" is overloaded. It can mean a code-level dependency, a runtime relationship, or an injected collaborator. "Package Dependency" names exactly what the section covers.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A design (an item tagged `[design]`) may have a section that documents a dependency on a package, meaning a gem, a library, or another installable package.
    2. Title a design's section that documents a dependency on a package (a gem, library, or other installable package) "Package Dependency", not just "Dependency".
    3. Use the heading "Package Dependency", not "Dependency", when writing a design section about depending on a gem, library, or package.
    4. Use the plain heading "Dependency" in a design only for sections that are genuinely about something other than a package.

### Checker A

    1. kept — "A design is an item tagged `[design]`." / "A design may have a section documenting a dependency on a package." / "A package means a gem, a library, or another installable package."
    2. kept — "Title that section **Package Dependency**." / "Do not title it just \"Dependency\"."
    3. kept — "Title that section **Package Dependency**." / "Do not title it just \"Dependency\"." (with "A package means a gem, a library, or another installable package.")
    4. kept — "Use plain \"Dependency\" only for sections about something other than a package." (only the intensifier "genuinely" is dropped, and the behavior required is the same)

### Checker B

    1. kept: "A design is an item tagged `[design]`." / "A design may have a section documenting a dependency on a package." / "A package means a gem, a library, or another installable package."
    2. kept: "Title that section **Package Dependency**." / "Do not title it just \"Dependency\"."
    3. kept: "Title that section **Package Dependency**." / "Do not title it just \"Dependency\"." / "A package means a gem, a library, or another installable package."
    4. kept: "Use plain \"Dependency\" only for sections about something other than a package." The shorter version drops "genuinely" and "in a design", but the rule's context still scopes it to designs, and dropping "genuinely" does not change the behavior required.

## plans-no-code-samples

### The compressor's answer

    1. An item in `waytide/local/items/` that sequences work must never contain code samples, whatever its tags name it.
    2. Such a plan contains no code blocks.
    3. It contains no literal method bodies.
    4. It contains no "write this content" snippets.
    5. Describe each step's intent and expected outcome in prose only.
    6. Do not commit up front to specific method names, file names, or other implementation details not yet decided.
    7. State the goal and the behavior only at the altitude that is genuinely settled.
    8. Leave the rest open rather than inventing names to fill the plan.
    9. This applies when writing a plan and when revising one.
    10. At implementation time, generate code only on the user's explicit instruction.
    11. Generate it in the increments the user chooses.
    12. **Why:** The user directs code generation interactively. Code samples and premature naming lock in decisions early and remove that incremental control.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A planning record in `waytide/local/items/` must never contain code samples, whatever its tags name it.
    2. A planning record must contain no code blocks.
    3. A planning record must contain no literal method bodies.
    4. A planning record must contain no "write this content" snippets.
    5. When writing or revising a plan, describe each step's intent and expected outcome in prose only.
    6. Plans should avoid over-prescription.
    7. A plan must not commit up front to specific method names, file names, or other implementation details that are not yet known or decided.
    8. A plan states the goal and the behavior at the altitude that is genuinely settled.
    9. A plan leaves the rest open rather than inventing names to fill it.
    10. When it is time to implement, generate code only on the user's explicit instruction, interactively, in the increments the user chooses.

### Checker A

    1. kept: "An item in `waytide/local/items/` that sequences work must never contain code samples, whatever its tags name it." ("an item that sequences work" stands for "planning record")
    2. kept: "Such a plan contains no code blocks."
    3. kept: "It contains no literal method bodies."
    4. kept: "It contains no \"write this content\" snippets."
    5. kept: "Describe each step's intent and expected outcome in prose only." together with "This applies when writing a plan and when revising one."
    6. less precise: "Do not commit up front to specific method names, file names, or other implementation details not yet decided." Missing: the general instruction to avoid over-prescription. Only its specific instances are stated.
    7. less precise: "Do not commit up front to specific method names, file names, or other implementation details not yet decided." Missing: "known". Only details "not yet decided" are covered, not those "not yet known".
    8. kept: "State the goal and the behavior only at the altitude that is genuinely settled."
    9. kept: "Leave the rest open rather than inventing names to fill the plan."
    10. kept: "At implementation time, generate code only on the user's explicit instruction." and "Generate it in the increments the user chooses." The "interactively" part appears only in the Why line: "The user directs code generation interactively."

### Checker B

    1. kept: "An item in `waytide/local/items/` that sequences work must never contain code samples, whatever its tags name it." The record is called "an item that sequences work" here, not a "planning record", but it means the same thing.
    2. kept: "Such a plan contains no code blocks."
    3. kept: "It contains no literal method bodies."
    4. kept: "It contains no "write this content" snippets."
    5. kept: "Describe each step's intent and expected outcome in prose only." and "This applies when writing a plan and when revising one."
    6. less precise: "Do not commit up front to specific method names, file names, or other implementation details not yet decided." Missing: the general instruction to avoid over-prescription. Only its specific cases are stated.
    7. kept: "Do not commit up front to specific method names, file names, or other implementation details not yet decided." "Known or" is dropped, but a detail that is not known is also not decided, so the behavior is the same.
    8. kept: "State the goal and the behavior only at the altitude that is genuinely settled."
    9. kept: "Leave the rest open rather than inventing names to fill the plan."
    10. kept: "At implementation time, generate code only on the user's explicit instruction.", "Generate it in the increments the user chooses." and "The user directs code generation interactively." The word "interactively" appears only in the Why line, not in a directive.

### The re-check, after the repairs

    1 — kept — "An item in `waytide/local/items/` that sequences work must never contain code samples, whatever its tags name it." It says "item that sequences work" where the list says "planning record", and both name the same thing.
    2 — kept — "Such a plan contains no code blocks."
    3 — kept — "It contains no literal method bodies."
    4 — kept — "It contains no \"write this content\" snippets."
    5 — kept — "Describe each step's intent and expected outcome in prose only." / "This applies when writing a plan and when revising one."
    6 — kept — "Avoid over-prescription."
    7 — kept — "Do not commit up front to specific method names, file names, or other implementation details not yet known or decided."
    8 — kept — "State the goal and the behavior only at the altitude that is genuinely settled."
    9 — kept — "Leave the rest open rather than inventing names to fill the plan."
    10 — kept — "At implementation time, generate code only on the user's explicit instruction." / "Generate it in the increments the user chooses." / "The user directs code generation interactively." The word "interactively" now appears only in the Why line, as a reason rather than an instruction. Waiting for the user's explicit instruction and working in the increments they choose still requires the same interactive behavior.

## present-every-prompt-through-askuserquestion

### The compressor's answer

    1. Every time you prompt the engineer for a selection, a decision, or an answer, present it through the selection UI, the `AskUserQuestion` tool.
    2. This holds for any prompt.
    3. Never use a prose question or a hand-typed list.
    4. Each genuine candidate is an option.
    5. Do not add a free-text option of your own, such as "Chat about this".
    6. The UI's built-in **"Other"** answer is how the engineer answers outside the option set.
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
    20. Where there are four genuine candidates, drop the fourth rather than `Explain`.
    21. Do not choose where `Explain` appears. The harness renders the built-in free-text answer last.
    22. The UI requires at least two options. Do not invent an option to reach that floor.
    23. Present every genuine candidate you find.
    24. Where you find only one, the second option is `Explain`, an account of that candidate.
    25. Do not search for options just to fill the second place.
    26. Do not say that a lone candidate is the only possibility.
    27. This applies whenever you would ask the engineer to decide or answer. That includes a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations.
    28. Use plain prose only for statements, reports, and explanations that do not ask the engineer to choose.
    29. **Why:** The selection UI makes responsibility transfer legibly and consistently, and it already supplies free text. The two-option floor pushes toward the real decision rather than a single proposal for approval. `Explain` handles a well-formed prompt the engineer does not understand. It must be an option because you cannot tell which of your own questions are unclear.

    CONTRADICTIONS: The source requires presenting every genuine candidate found ("Present every genuine candidate the agent finds"; "Present the genuine candidates you find"). It also says that where a prompt genuinely has four candidates, the fourth is dropped to keep `Explain`. Points 20 and 23 keep both statements as the source has them.

### The directives, as the listing agent gave them

    1. Every time you prompt the engineer to make a selection, a decision, or an answer, present it through the interactive selection UI (the `AskUserQuestion` tool); this holds for any prompt.
    2. Never use a prose question or a hand-typed list to prompt the engineer.
    3. Each genuine candidate is an option in the selection UI.
    4. Do not add a free-text option of your own (such as "Chat about this"), because the selection UI auto-supplies the built-in "Other" answer.
    5. A closed list of options must never foreclose an answer only the engineer can produce.
    6. Offer an `Explain` option on the selection prompt.
    7. When `Explain` is selected, treat it as if the engineer had asked for the question to be explained.
    8. Answer a selected `Explain` with a summary at the top followed by a normal level of explanation.
    9. The `Explain` answer must not be a restatement of the options, and not the same framing a second time.
    10. The explanation does not replace the decision: after answering `Explain`, display the same selection prompt again with the same options, so the engineer decides with the explanation in hand.
    11. On the second display, `Explain` is the one thing that changes: it reads `Explain briefly`, and every other option stays unchanged.
    12. When `Explain briefly` is selected, answer with the summary alone — the shortest statement of what the question decides, and nothing under it.
    13. After answering `Explain briefly`, display the prompt again, still carrying `Explain briefly`.
    14. Do not invent a further rung or third variant; the `Explain briefly` option does not change again however many times it is selected.
    15. The `Explain` option's own description must say *…then display this selection prompt again*.
    16. Never word an option's description as *put this question again*.
    17. `Explain briefly`'s description must state its own length — *…in a sentence or two, then display this selection prompt again*.
    18. Offer `Explain` on every prompt, not only where the agent judges the question hard.
    19. `Explain` takes one of the selection UI's at-most-four option slots, leaving three for genuine candidates.
    20. Where a prompt genuinely has four candidates, drop the fourth candidate rather than the `Explain` option.
    21. Place `Explain` among the supplied options; its position relative to the built-in free-text answer (rendered last by the harness) is not the agent's to choose.
    22. The UI requires at least two options; do not invent an option to reach that floor.
    23. Present every genuine candidate the agent finds.
    24. Where the agent finds only one genuine candidate, the second option is `Explain` — an account of that candidate — placed beside it.
    25. Do not search for options in order to fill the second place.
    26. Do not say or claim that a lone candidate is the only possibility.
    27. Use the selection UI whenever you would ask the engineer to decide or answer, including a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations.
    28. Reserve plain prose for statements, reports, and explanations that are not asking the engineer to choose.

### Checker A

    1. kept: "Every time you prompt the engineer for a selection, a decision, or an answer, present it through the selection UI, the `AskUserQuestion` tool." / "This holds for any prompt."
    2. kept: "Never use a prose question or a hand-typed list."
    3. kept: "Each genuine candidate is an option."
    4. kept: "Do not add a free-text option of your own, such as "Chat about this"." / "The UI's built-in **"Other"** answer is how the engineer answers outside the option set."
    5. less precise: "The UI's built-in **"Other"** answer is how the engineer answers outside the option set." Missing: it names the way to answer outside the options but never states the rule that a closed list must not foreclose an answer only the engineer can produce.
    6. kept: "Offer an `Explain` option on every prompt"
    7. kept: "It lets the engineer ask what the question means before answering." / "When `Explain` is selected, answer with a summary at the top, followed by a normal level of explanation."
    8. kept: "When `Explain` is selected, answer with a summary at the top, followed by a normal level of explanation."
    9. kept: "That explanation must not restate the options or repeat the same framing."
    10. kept: "Then display the same selection prompt again, with every other option unchanged." (The reason, that the explanation does not replace the decision, is dropped, but the required behavior is the same.)
    11. kept: "with every other option unchanged." / "On that second display, `Explain` is replaced by **`Explain briefly`**."
    12. kept: "When `Explain briefly` is selected, answer with the summary alone: the shortest statement of what the question decides, with nothing under it."
    13. kept: "Then display the prompt again, still carrying `Explain briefly`."
    14. kept: "Do not invent a further variant. The option does not change again, however many times it is selected."
    15. kept: "Word `Explain`'s description as *…then display this selection prompt again*."
    16. kept: "Never word a description as *put this question again*."
    17. kept: "`Explain briefly`'s description states its length: *…in a sentence or two, then display this selection prompt again*."
    18. kept: "Offer an `Explain` option on every prompt, not only where you judge the question hard."
    19. kept: "`Explain` takes one of the UI's four option slots, which leaves three for genuine candidates."
    20. kept: "Where there are four genuine candidates, drop the fourth rather than `Explain`."
    21. less precise: "Do not choose where `Explain` appears. The harness renders the built-in free-text answer last." Missing: it never says to place `Explain` among the supplied options. It also widens the ban: it reads as forbidding any choice of position, not just the choice relative to the built-in answer.
    22. kept: "The UI requires at least two options. Do not invent an option to reach that floor."
    23. kept: "Present every genuine candidate you find."
    24. kept: "Where you find only one, the second option is `Explain`, an account of that candidate."
    25. kept: "Do not search for options just to fill the second place."
    26. kept: "Do not say that a lone candidate is the only possibility."
    27. kept: "This applies whenever you would ask the engineer to decide or answer. That includes a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations."
    28. kept: "Use plain prose only for statements, reports, and explanations that do not ask the engineer to choose."

### Checker B

    1. kept — "Every time you prompt the engineer for a selection, a decision, or an answer, present it through the selection UI, the `AskUserQuestion` tool." / "This holds for any prompt."
    2. kept — "Never use a prose question or a hand-typed list."
    3. kept — "Each genuine candidate is an option."
    4. kept — "Do not add a free-text option of your own, such as "Chat about this"." / "The UI's built-in **"Other"** answer is how the engineer answers outside the option set."
    5. less precise — "The UI's built-in **"Other"** answer is how the engineer answers outside the option set." — it describes how "Other" works but drops the rule that a closed list must never foreclose an answer only the engineer can give.
    6. kept — "Offer an `Explain` option on every prompt"
    7. kept — "It lets the engineer ask what the question means before answering." / "When `Explain` is selected, answer with a summary at the top, followed by a normal level of explanation."
    8. kept — "When `Explain` is selected, answer with a summary at the top, followed by a normal level of explanation."
    9. kept — "That explanation must not restate the options or repeat the same framing."
    10. kept — "Then display the same selection prompt again, with every other option unchanged." (The stated reason, that the engineer decides with the explanation in hand, is gone, but the required behavior is the same.)
    11. kept — "with every other option unchanged." / "On that second display, `Explain` is replaced by **`Explain briefly`**."
    12. kept — "When `Explain briefly` is selected, answer with the summary alone: the shortest statement of what the question decides, with nothing under it."
    13. kept — "Then display the prompt again, still carrying `Explain briefly`."
    14. kept — "Do not invent a further variant. The option does not change again, however many times it is selected."
    15. kept — "Word `Explain`'s description as *…then display this selection prompt again*."
    16. kept — "Never word a description as *put this question again*."
    17. kept — "`Explain briefly`'s description states its length: *…in a sentence or two, then display this selection prompt again*."
    18. kept — "Offer an `Explain` option on every prompt, not only where you judge the question hard."
    19. kept — "`Explain` takes one of the UI's four option slots, which leaves three for genuine candidates."
    20. kept — "Where there are four genuine candidates, drop the fourth rather than `Explain`."
    21. less precise — "Do not choose where `Explain` appears. The harness renders the built-in free-text answer last." — it drops "place `Explain` among the supplied options". It also widens the rule from "its position relative to the free-text answer is not yours to choose" to "do not choose where `Explain` appears at all".
    22. kept — "The UI requires at least two options. Do not invent an option to reach that floor."
    23. kept — "Present every genuine candidate you find."
    24. kept — "Where you find only one, the second option is `Explain`, an account of that candidate." ("Placed beside it" is not stated, but being the second option implies it.)
    25. kept — "Do not search for options just to fill the second place."
    26. kept — "Do not say that a lone candidate is the only possibility." ("Or claim" is dropped, but "say" requires the same behavior.)
    27. kept — "This applies whenever you would ask the engineer to decide or answer. That includes a design decision, a "which approach", a confirmation to proceed or commit, and a clarification between interpretations."
    28. kept — "Use plain prose only for statements, reports, and explanations that do not ask the engineer to choose."

### The re-check, after the repairs

    All 28 directives are kept in the shorter version. None is less precise or lost.

    1. kept — "Every time you prompt the engineer for a selection, a decision, or an answer, present it through the selection UI, the `AskUserQuestion` tool." / "This holds for any prompt."
    2. kept — "Never use a prose question or a hand-typed list."
    3. kept — "Each genuine candidate is an option."
    4. kept — "Do not add a free-text option of your own, such as \"Chat about this\"." / "The UI's built-in **\"Other\"** answer is how the engineer answers outside the option set."
    5. kept — "A closed list must never foreclose an answer only the engineer can produce."
    6. kept — "Offer an `Explain` option on every prompt"
    7. kept — "It lets the engineer ask what the question means before answering." / "When `Explain` is selected, answer with a summary at the top, followed by a normal level of explanation."
    8. kept — "When `Explain` is selected, answer with a summary at the top, followed by a normal level of explanation."
    9. kept — "That explanation must not restate the options or repeat the same framing."
    10. kept — "Then display the same selection prompt again, with every other option unchanged."
    11. kept — "On that second display, `Explain` is replaced by **`Explain briefly`**." / "with every other option unchanged"
    12. kept — "When `Explain briefly` is selected, answer with the summary alone: the shortest statement of what the question decides, with nothing under it."
    13. kept — "Then display the prompt again, still carrying `Explain briefly`."
    14. kept — "Do not invent a further variant. The option does not change again, however many times it is selected."
    15. kept — "Word `Explain`'s description as *…then display this selection prompt again*."
    16. kept — "Never word a description as *put this question again*."
    17. kept — "`Explain briefly`'s description states its length: *…in a sentence or two, then display this selection prompt again*."
    18. kept — "Offer an `Explain` option on every prompt, not only where you judge the question hard."
    19. kept — "`Explain` takes one of the UI's four option slots, which leaves three for genuine candidates."
    20. kept — "Where there are four genuine candidates, drop the fourth rather than `Explain`."
    21. kept — "Place `Explain` among the supplied options. Its position relative to the built-in free-text answer is not yours to choose, since the harness renders that answer last."
    22. kept — "The UI requires at least two options. Do not invent an option to reach that floor."
    23. kept — "Present every genuine candidate you find."
    24. kept — "Where you find only one, the second option is `Explain`, an account of that candidate."
    25. kept — "Do not search for options just to fill the second place."
    26. kept — "Do not say that a lone candidate is the only possibility."
    27. kept — "This applies whenever you would ask the engineer to decide or answer. That includes a design decision, a \"which approach\", a confirmation to proceed or commit, and a clarification between interpretations."
    28. kept — "Use plain prose only for statements, reports, and explanations that do not ask the engineer to choose."

    Three directives were close calls, and I judged each one kept:
    - 19: "four option slots" drops the words "at-most", but "which leaves three for genuine candidates" still requires the four-option cap.
    - 24: "placed beside it" is not stated, but calling `Explain` "the second option" requires it to sit beside the candidate.
    - 26: "say or claim" became "say". The shorter version no longer names claiming the lone-candidate point without saying it outright.

## project-context-lives-in-the-committed-artifacts

### The compressor's answer

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
    3. A machine-scoped fact goes to per-machine configuration under `~/.config/`, outside any repository, per the a-project-does-not-name-its-consumers rule.
    4. A preference not yet settled as a rule is outside this rule.
    5. Ask about such a preference at once, per the ask-at-once-when-a-preference-is-expressed rule, rather than holding it.
    6. The harness's own working state is outside this rule. That is a cache, a transcript, or an index of the repository.
    7. Harness working state is not project context and is no substitute for an artifact.
    8. **Why:** conventions are committed with the code and read fresh each session, not recalled. A memory store is recall: unreviewed, undiffable, invisible to all but its writer, and it drifts silently.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Every piece of context meant to survive a session must be written into `waytide/`.
    2. Nothing that belongs in the rules, the working directories, or git may be held in an agent memory store instead.
    3. A binding convention must be a rule in `waytide/local/rules/`.
    4. A decision must be a one-line entry in `waytide/local/logs/log/`.
    5. Thinking that has not stabilized must be an observation in `waytide/local/items/`.
    6. The project's planning goes in an item.
    7. Postponed work must be a deferred item.
    8. What the project stopped doing must be suspended.
    9. An agent memory store must not stand in for any of the artifacts this package defines (rule, log entry, observation, item, deferred item, suspended thing).
    10. A note about how the project's code is arranged, what was decided, or which approach was rejected belongs in an artifact, not anywhere else.
    11. A fact about the engineer rather than the project (such as how they want to be answered, or what they want the agent never to offer) is outside this rule; it is not project context.
    12. A machine-scoped fact goes to per-machine configuration under `~/.config/`, outside any repository (per the a-project-does-not-name-its-consumers rule).
    13. A preference not yet settled as a rule is outside this rule and falls to the ask-at-once-when-a-preference-is-expressed rule.
    14. Nothing has to be held while a preference waits to become a written rule.
    15. The harness's own working state (a cache, a transcript, an index of the repository) is outside this rule, and must not be treated as project context or as a substitute for an artifact.
    16. Conventions must be read fresh each session rather than recalled.
    17. Write durable project context into the artifact whose convention covers it: a rule, a log entry, an observation, an item, or a suspended thing.
    18. Do not create an agent memory store.
    19. Where a preference is not yet a rule, ask about it at once rather than holding it.

### Checker A

    1. kept — "Write every piece of context meant to survive a session into `waytide/`."
    2. kept — "The rules bind that context, the working directories hold it, and git carries it." / "Do not hold in a store anything that belongs in one of those places."
    3. kept — "A binding convention is a rule in `waytide/local/rules/`."
    4. kept — "A decision is a one-line entry in `waytide/local/logs/log/`."
    5. kept — "Thinking that has not stabilized is an observation in `waytide/local/items/`."
    6. kept — "The project's planning goes in an item."
    7. kept — "Postponed work is a deferred item."
    8. kept — "What the project stopped doing is suspended."
    9. kept — "An agent memory store is not one of those places." / "Do not hold in a store anything that belongs in one of those places." / "Do not create an agent memory store."
    10. kept — "A note on how the project's code is arranged belongs in an artifact. So does what was decided last week, or which approach was rejected."
    11. kept — "A fact about the engineer rather than the project is outside this rule." / "How the engineer wants to be answered, and what they want never offered, are such facts."
    12. kept — "A machine-scoped fact goes to per-machine configuration under `~/.config/`, outside any repository, per the a-project-does-not-name-its-consumers rule."
    13. kept — "A preference not yet settled as a rule is outside this rule." / "Ask about such a preference at once, per the ask-at-once-when-a-preference-is-expressed rule"
    14. kept — "Ask about such a preference at once ... rather than holding it."
    15. kept — "The harness's own working state is outside this rule. That is a cache, a transcript, or an index of the repository." / "Harness working state is not project context and is no substitute for an artifact."
    16. kept — "conventions are committed with the code and read fresh each session, not recalled."
    17. kept — "Write every piece of context meant to survive a session into `waytide/`." together with lines 5–10 (rule, log entry, observation, item, deferred item, suspended) and "Each artifact follows its own convention."
    18. kept — "Do not create an agent memory store."
    19. kept — "Ask about such a preference at once, per the ask-at-once-when-a-preference-is-expressed rule, rather than holding it."

### Checker B

    1. kept: "Write every piece of context meant to survive a session into `waytide/`."
    2. kept: "The rules bind that context, the working directories hold it, and git carries it." / "Do not hold in a store anything that belongs in one of those places."
    3. kept: "A binding convention is a rule in `waytide/local/rules/`."
    4. kept: "A decision is a one-line entry in `waytide/local/logs/log/`."
    5. kept: "Thinking that has not stabilized is an observation in `waytide/local/items/`."
    6. kept: "The project's planning goes in an item."
    7. kept: "Postponed work is a deferred item."
    8. kept: "What the project stopped doing is suspended."
    9. kept: "Do not hold in a store anything that belongs in one of those places." / "Do not create an agent memory store."
    10. kept: "A note on how the project's code is arranged belongs in an artifact. So does what was decided last week, or which approach was rejected."
    11. kept: "A fact about the engineer rather than the project is outside this rule." / "How the engineer wants to be answered, and what they want never offered, are such facts."
    12. kept: "A machine-scoped fact goes to per-machine configuration under `~/.config/`, outside any repository, per the a-project-does-not-name-its-consumers rule."
    13. kept: "A preference not yet settled as a rule is outside this rule." / "Ask about such a preference at once, per the ask-at-once-when-a-preference-is-expressed rule"
    14. kept: "Ask about such a preference at once ... rather than holding it."
    15. kept: "The harness's own working state is outside this rule. That is a cache, a transcript, or an index of the repository." / "Harness working state is not project context and is no substitute for an artifact."
    16. less precise: "conventions are committed with the code and read fresh each session, not recalled". Missing: it appears only as the rationale under **Why**, a description, not a stated requirement.
    17. kept: "Each artifact follows its own convention." together with the mapping in items 5–10 ("A binding convention is a rule ...", "A decision is a one-line entry ...", and so on).
    18. kept: "Do not create an agent memory store."
    19. kept: "Ask about such a preference at once ... rather than holding it."

## prose-is-not-hard-wrapped

### The compressor's answer

    1. Write each paragraph as a single line.
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
    7. **Why:** the reader should set the width they read at, and a hard wrap gives that decision to the writer. Rendered markdown looks the same either way. A hard wrap makes a one-word edit reflow the whole paragraph in the diff.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A paragraph is written as a single line.
    2. No newline is inserted to hold a column width.
    3. The reader's editor must be allowed to soft-wrap prose to the reader's preferred width.
    4. Nothing is re-wrapped after an edit.
    5. A structural element is not prose and keeps its own line: a heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block.
    6. A list item is one line, however long.
    7. A list item's continuation is folded into the list item rather than left hanging under it.
    8. Each line of the provenance footer (`Authored by …` and every `Changed by …` beneath it) stays its own line and is not joined into a paragraph.
    9. Vocabulary entries are prose and follow the same one-line-per-paragraph rule.

### Checker A

    1. kept — "Write each paragraph as a single line."
    2. kept — "Insert no newline to hold a column width."
    3. kept — "Leave wrapping to the reader's editor, which soft-wraps to the width the reader has chosen."
    4. kept — "Re-wrap nothing after an edit."
    5. kept — "A structural element is not prose and keeps its own line." / "Structural elements are a heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block."
    6. kept — "A list item is one line, however long."
    7. kept — "Fold a list item's continuation into the item rather than leaving it hanging under it."
    8. kept — "Each line of the provenance footer stays its own line: `Authored by …` and every `Changed by …` beneath it." / "Do not join the footer lines."
    9. less precise — "the vocabulary-convention — the vocabularies, whose entries are prose the same way". Missing: this appears only as a note in the Related list and is not stated as a directive. It also never says outright that vocabulary entries follow the one-line-per-paragraph rule.

### Checker B

    1. kept: "Write each paragraph as a single line."
    2. kept: "Insert no newline to hold a column width."
    3. kept: "Leave wrapping to the reader's editor, which soft-wraps to the width the reader has chosen."
    4. kept: "Re-wrap nothing after an edit."
    5. kept: "A structural element is not prose and keeps its own line." and "Structural elements are a heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block."
    6. kept: "A list item is one line, however long."
    7. kept: "Fold a list item's continuation into the item rather than leaving it hanging under it."
    8. kept: "Each line of the provenance footer stays its own line: `Authored by …` and every `Changed by …` beneath it." and "Do not join the footer lines."
    9. less precise: "the vocabularies, whose entries are prose the same way". It appears only as a note in the Related list, not as a numbered directive. It also never says outright that vocabulary entries follow the one-line-per-paragraph rule.

### The re-check, after the repairs

    1. kept — "Write each paragraph as a single line."
    2. kept — "Insert no newline to hold a column width."
    3. kept — "Leave wrapping to the reader's editor, which soft-wraps to the width the reader has chosen."
    4. kept — "Re-wrap nothing after an edit."
    5. kept — "A structural element is not prose and keeps its own line." / "Structural elements are a heading, a list item, a table row, a blockquote line, a horizontal rule, and every line inside a fenced code block."
    6. kept — "A list item is one line, however long."
    7. kept — "Fold a list item's continuation into the item rather than leaving it hanging under it."
    8. kept — "Each line of the provenance footer stays its own line: `Authored by …` and every `Changed by …` beneath it." / "Do not join the footer lines."
    9. kept — "This holds for vocabulary entries too." (also "the vocabularies, whose entries are prose the same way")

## record-rule-authorship-in-a-footer

### The compressor's answer

    1. Every rule file ends with a provenance footer. It records who authored the rule and when, and who has changed it since.
    2. The footer sits at the end of the file, after the rule's content, below a `---` divider:

    ```
    ---

    Authored by <name> on <datetime>
    ```

    3. Each change appends a line. The footer is a running history, never rewritten:

    ```
    ---

    Authored by <name> on <datetime>
    Changed by <name> on <datetime>
    Changed by <other name> on <datetime>
    ```

    4. The datetime is human-readable local time, formatted `Mon Jan 1 2026 at 3:45:12 PM PT`.
    5. It gives day-of-week, month, day, year, then the time with AM/PM and a timezone abbreviation.
    6. The time is in the author's local time.
    7. The time carries minutes and seconds, per the a-time-value-carries-minutes-and-seconds rule.
    8. The footer does not use the ISO-8601-UTC filename-prefix form.
    9. The Authored line names the original author and when the rule was first written.
    10. A Changed line is appended each time the rule is edited, oldest first.
    11. Never rewrite or remove an earlier line.
    12. Earlier lines keep the form they were written in. Lines written at hour resolution stay at hour resolution.
    13. Only new lines take the full time. Both forms may coexist in one footer.
    14. The name is the contributor's name, as in their git identity.
    15. When authoring a new rule, end it with a `---` divider.
    16. Below the divider, add an `Authored by <name> on <local datetime>` line.
    17. When changing an existing rule, append a `Changed by <name> on <local datetime>` line to its footer.
    18. **Why:** Packages are installed by `git subtree`, which does not carry per-file history. The footer keeps authorship visible wherever the rule is read.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Every rule file must end with a provenance footer that records who authored the rule and when, and who has changed it since.
    2. The provenance footer must sit at the end of the rule file, after the rule's content, below a `---` divider.
    3. The footer's first line must read `Authored by <name> on <datetime>`. It names the original author and when the rule was first written.
    4. Each time a rule is edited, a `Changed by <name> on <datetime>` line must be appended to its footer.
    5. The footer is a running history and must never be rewritten. An earlier footer line must never be rewritten or removed.
    6. `Changed by` lines must be in oldest-first order.
    7. A footer datetime must be human-readable time in the author's local time, formatted like `Mon Jan 1 2026 at 3:45:12 PM PT`: day of the week, month, day, year, then the time with AM/PM and a timezone abbreviation.
    8. A new footer line's time must carry minutes and seconds (it is written to the second), so that two edits within one hour stay distinguishable.
    9. The footer datetime must not use the ISO-8601-UTC form of the filename prefix. It is provenance written for a person to read, not a machine-sortable UTC value.
    10. Earlier footer lines must keep the form they were written in. Lines written at hour resolution stay at hour resolution and are not converted, so both forms may appear in the same footer.
    11. The name in a footer line must be the contributor's name as it appears in their git identity.
    12. Authorship must be recorded in the rule file itself, not only in version-control history, because installing a package by `git subtree` does not carry the per-file history into the consuming project.

### Checker A

    All 12 directives are carried by the shorter version. Two of them lose the reason they give, though the required behavior is unchanged.

    1. kept — "Every rule file ends with a provenance footer. It records who authored the rule and when, and who has changed it since."
    2. kept — "The footer sits at the end of the file, after the rule's content, below a `---` divider"
    3. kept — "Authored by <name> on <datetime>" (the first line under the divider in the template); "The Authored line names the original author and when the rule was first written."
    4. kept — "A Changed line is appended each time the rule is edited"; "When changing an existing rule, append a `Changed by <name> on <local datetime>` line to its footer."
    5. kept — "The footer is a running history, never rewritten"; "Never rewrite or remove an earlier line."
    6. kept — "oldest first"
    7. kept — "The datetime is human-readable local time, formatted `Mon Jan 1 2026 at 3:45:12 PM PT`."; "It gives day-of-week, month, day, year, then the time with AM/PM and a timezone abbreviation."; "The time is in the author's local time."
    8. kept — "The time carries minutes and seconds, per the a-time-value-carries-minutes-and-seconds rule." (The reason, keeping two edits within one hour distinguishable, is not stated. It is left to the cited rule.)
    9. kept — "The footer does not use the ISO-8601-UTC filename-prefix form."; "human-readable" (The contrast with a machine-sortable UTC value is not stated.)
    10. kept — "Earlier lines keep the form they were written in. Lines written at hour resolution stay at hour resolution."; "Both forms may coexist in one footer."
    11. kept — "The name is the contributor's name, as in their git identity."
    12. kept — "Packages are installed by `git subtree`, which does not carry per-file history. The footer keeps authorship visible wherever the rule is read."

### Checker B

    All 12 directives are kept in the shorter version. None is less precise and none is lost.

    1. kept: "Every rule file ends with a provenance footer. It records who authored the rule and when, and who has changed it since."
    2. kept: "The footer sits at the end of the file, after the rule's content, below a `---` divider"
    3. kept: "The Authored line names the original author and when the rule was first written." / "Below the divider, add an `Authored by <name> on <local datetime>` line." The fenced example also shows the Authored line first.
    4. kept: "A Changed line is appended each time the rule is edited" / "When changing an existing rule, append a `Changed by <name> on <local datetime>` line to its footer."
    5. kept: "The footer is a running history, never rewritten" / "Never rewrite or remove an earlier line."
    6. kept: "A Changed line is appended each time the rule is edited, oldest first."
    7. kept: "The datetime is human-readable local time, formatted `Mon Jan 1 2026 at 3:45:12 PM PT`." / "It gives day-of-week, month, day, year, then the time with AM/PM and a timezone abbreviation." / "The time is in the author's local time."
    8. kept: "The time carries minutes and seconds" / "Only new lines take the full time." Only the reason (telling apart two edits within one hour) is left out, and that changes no behavior.
    9. kept: "The footer does not use the ISO-8601-UTC filename-prefix form." The reason (written for a person, not a machine-sortable value) is only implied by "human-readable".
    10. kept: "Earlier lines keep the form they were written in. Lines written at hour resolution stay at hour resolution." / "Both forms may coexist in one footer."
    11. kept: "The name is the contributor's name, as in their git identity."
    12. kept: "**Why:** Packages are installed by `git subtree`, which does not carry per-file history. The footer keeps authorship visible wherever the rule is read."

## record-title-date-format

### The compressor's answer

    1. A working-state record's title may carry a date, as the work session record's `# Work Session — <name> (<date>)` does.
    2. In any record whose title is dated, write the date in this form:

    ```
    Mon Jan 1 2026 18:06
    ```

    3. The order is day-of-week, month, day, year, then 24-hour hours and minutes.
    4. Do not write `at`, AM/PM, or seconds.
    5. Do not add a timezone abbreviation.
    6. The time is the author's local time.
    7. The date is the record's authoring time. It is the same instant as its ISO-8601-UTC filename prefix, rendered in local time.
    8. For a record covering work over more than one day, the title still names the single moment the record was written.
    9. Do not write a date range.
    10. Render the date with the command `date "+%a %b %-d %Y %H:%M"`.
    11. This title form is distinct from the other two record date formats. Each format is used only where it is specified.
    12. The filename prefix stays machine-sortable UTC to the second, such as `2026-07-24T18-16-22Z-…`, per the file-names rule.
    13. The provenance footer stays local time to the second with a zone abbreviation, such as `Fri Jul 24 2026 at 11:58:56 AM PT`, per record-rule-authorship-in-a-footer.
    14. The title is the one exception to the a-time-value-carries-minutes-and-seconds rule. Every other datetime written into a file carries seconds.
    15. The exception is narrow and covers only the title's date.
    16. **Why:** A title is read first and is how a record is referred to, so its date must be compact yet distinguish records written hours apart. A title appears once per file, so nothing collides with it, and the filename already carries the exact UTC instant.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A working-state record's title may carry a date.
    2. In the work session record's title (`# Work Session — <name> (<date>)`) and in any other record whose title is dated, the date is written as `Mon Jan 1 2026 18:06`.
    3. The title date gives the day of the week, the month, the day, the year, and then the time as 24-hour hours and minutes.
    4. The title date contains no `at`.
    5. The title date contains no AM/PM.
    6. The title date contains no seconds.
    7. The title date contains no timezone marker or abbreviation.
    8. The time in the title date is the author's local time.
    9. A reader takes the title date's time as local to whoever wrote the record.
    10. The moment in the title date is the record's authoring time: the same instant its ISO-8601-UTC filename prefix records, shown in local time.
    11. If a record covers work that spanned more than one day, the title still names the single moment the record was written and does not give a date range.
    12. A record's filename prefix is machine-sortable and in UTC (for example `2026-07-24T18-16-22Z-…`), as the file-names rule specifies.
    13. A record's provenance footer is human-readable local time with a zone abbreviation (for example `Fri Jul 24 2026 at 11:58:56 AM PT`), as record-rule-authorship-in-a-footer specifies.
    14. Each of the three date formats (filename prefix, provenance footer, title) is used only where it is specified and nowhere else.
    15. The title date is the one exception to the rule that every datetime written into a file carries its time of day to seconds (the a-time-value-carries-minutes-and-seconds rule). Every other datetime written into a file still carries seconds.
    16. The title-date exception to the seconds rule is narrow and covers only a record's title.
    17. To render a title date, use the command `date "+%a %b %-d %Y %H:%M"`.
    18. Keep the filename's UTC prefix as it is, to the second.
    19. Keep the footer's local time as it is, to the second.

### Checker A

    1 — kept — "A working-state record's title may carry a date"
    2 — kept — "as the work session record's `# Work Session — <name> (<date>)` does" / "In any record whose title is dated, write the date in this form: Mon Jan 1 2026 18:06"
    3 — kept — "The order is day-of-week, month, day, year, then 24-hour hours and minutes."
    4 — kept — "Do not write `at`"
    5 — kept — "Do not write ... AM/PM"
    6 — kept — "Do not write ... seconds."
    7 — less precise — "Do not add a timezone abbreviation." Missing: it does not ban a timezone marker that is not an abbreviation, such as `Z` or a UTC offset.
    8 — kept — "The time is the author's local time."
    9 — kept — "The time is the author's local time." Saying the time is the author's local time means a reader reads it that way, although the reader's side is not stated directly.
    10 — kept — "The date is the record's authoring time. It is the same instant as its ISO-8601-UTC filename prefix, rendered in local time."
    11 — kept — "For a record covering work over more than one day, the title still names the single moment the record was written." / "Do not write a date range."
    12 — kept — "The filename prefix stays machine-sortable UTC to the second, such as `2026-07-24T18-16-22Z-…`, per the file-names rule."
    13 — kept — "The provenance footer stays local time to the second with a zone abbreviation, such as `Fri Jul 24 2026 at 11:58:56 AM PT`, per record-rule-authorship-in-a-footer." The word "human-readable" is dropped, but the example shows that form.
    14 — kept — "This title form is distinct from the other two record date formats. Each format is used only where it is specified."
    15 — kept — "The title is the one exception to the a-time-value-carries-minutes-and-seconds rule. Every other datetime written into a file carries seconds."
    16 — kept — "The exception is narrow and covers only the title's date."
    17 — kept — "Render the date with the command `date \"+%a %b %-d %Y %H:%M\"`."
    18 — kept — "The filename prefix stays machine-sortable UTC to the second"
    19 — kept — "The provenance footer stays local time to the second"

### Checker B

    Of the 19 directives, 18 are kept and 1 is less precise. None are lost.

    1. kept: "A working-state record's title may carry a date"
    2. kept: "as the work session record's `# Work Session — <name> (<date>)` does" and "In any record whose title is dated, write the date in this form: ... Mon Jan 1 2026 18:06"
    3. kept: "The order is day-of-week, month, day, year, then 24-hour hours and minutes."
    4. kept: "Do not write `at`"
    5. kept: "Do not write ... AM/PM"
    6. kept: "Do not write ... seconds."
    7. less precise: "Do not add a timezone abbreviation." It does not ban a timezone marker that is not an abbreviation, such as `Z` or a UTC offset.
    8. kept: "The time is the author's local time."
    9. kept: "The time is the author's local time." This requires the reader to take the time as local to the writer, but the shorter version says it only from the writer's side.
    10. kept: "The date is the record's authoring time. It is the same instant as its ISO-8601-UTC filename prefix, rendered in local time."
    11. kept: "For a record covering work over more than one day, the title still names the single moment the record was written." and "Do not write a date range."
    12. kept: "The filename prefix stays machine-sortable UTC to the second, such as `2026-07-24T18-16-22Z-…`, per the file-names rule."
    13. kept: "The provenance footer stays local time to the second with a zone abbreviation, such as `Fri Jul 24 2026 at 11:58:56 AM PT`, per record-rule-authorship-in-a-footer." The word "human-readable" is gone, but the example carries it.
    14. kept: "This title form is distinct from the other two record date formats. Each format is used only where it is specified."
    15. kept: "The title is the one exception to the a-time-value-carries-minutes-and-seconds rule. Every other datetime written into a file carries seconds."
    16. kept: "The exception is narrow and covers only the title's date."
    17. kept: "Render the date with the command `date \"+%a %b %-d %Y %H:%M\"`."
    18. kept: "The filename prefix stays machine-sortable UTC to the second"
    19. kept: "The provenance footer stays local time to the second"

### The re-check, after the repairs

    1. kept — "A working-state record's title may carry a date"
    2. kept — "as the work session record's `# Work Session — <name> (<date>)` does" + "In any record whose title is dated, write the date in this form: Mon Jan 1 2026 18:06"
    3. kept — "The order is day-of-week, month, day, year, then 24-hour hours and minutes."
    4. kept — "Do not write `at`"
    5. kept — "Do not write ... AM/PM"
    6. kept — "Do not write ... seconds."
    7. kept — "Do not add a timezone abbreviation or any other timezone marker."
    8. kept — "The time is the author's local time."
    9. kept — "The time is the author's local time." (it states the fact, so a reader takes it the same way; the reader's side is not stated separately)
    10. kept — "The date is the record's authoring time. It is the same instant as its ISO-8601-UTC filename prefix, rendered in local time."
    11. kept — "For a record covering work over more than one day, the title still names the single moment the record was written." + "Do not write a date range."
    12. kept — "The filename prefix stays machine-sortable UTC to the second, such as `2026-07-24T18-16-22Z-…`, per the file-names rule."
    13. kept — "The provenance footer stays local time to the second with a zone abbreviation, such as `Fri Jul 24 2026 at 11:58:56 AM PT`, per record-rule-authorship-in-a-footer." (the word "human-readable" is dropped, but the example shows that form)
    14. kept — "This title form is distinct from the other two record date formats. Each format is used only where it is specified."
    15. kept — "The title is the one exception to the a-time-value-carries-minutes-and-seconds rule. Every other datetime written into a file carries seconds."
    16. kept — "The exception is narrow and covers only the title's date."
    17. kept — "Render the date with the command `date \"+%a %b %-d %Y %H:%M\"`."
    18. kept — "The filename prefix stays machine-sortable UTC to the second"
    19. kept — "The provenance footer stays local time to the second"

## rules-convention

### The compressor's answer

    ## Where binding rules live

    1. The project's binding rules are read at the start of every session and followed.
    2. Binding rules include naming conventions, terminology, plan-writing norms, commit conventions, and the like.
    3. Binding rules live in two directories, separated by source.
    4. **`waytide/system/`** holds the installed system packages, each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …).
    5. Packages are installed with `git subtree` and refreshed by pulling.
    6. A package's `vocabulary.md` glossary is part of its rules. Its terms are binding and cannot be applied unread.
    7. **`waytide/local/rules/`** holds the project's own local rules, one per file.
    8. Local rules are the project's own conventions, not installed from a package.

    ## Reading the rules

    1. Read every rule file under `waytide/system/` and `waytide/local/rules/` at the start of a session, and follow them.
    2. Do not read a package's `source/` directory or its `README.md`.
    3. A package's `source/` holds the full rules that its compiled rules are compiled from.
    4. Edit a rule in `source/`.
    5. The compiled rules at the package root are what is read.
    6. The rules override default behavior where they conflict.
    7. Explicit user instructions still win over the rules.
    8. Read `waytide/system/foundation/` first. It defines the system.
    9. Read `waytide/local/vocabulary.md` with the rules. It binds.
    10. Its terms cannot be applied unread, exactly as a package's `vocabulary.md`.
    11. Its terms decide over every package's terms.
    12. It is not a rule and does not live in `rules/`.
    13. The vocabulary-convention rule settles where it sits and why.
    14. It may not exist, like `rules/`. Its absence is ordinary.

    ## Rules and work artifacts

    1. Rules are kept separate from work artifacts.
    2. `waytide/system/` and `waytide/local/rules/` hold only rules.
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
    4. Give a project's own local rule in `waytide/local/rules/` the ISO-8601-UTC datetime prefix. See the file-names rule.
    5. Put a rule's history in a `## History` section, placed before `Related:`.
    6. History is what the rule used to say, when it changed, what it was named, and where it sat.
    7. The compiler leaves `## History` out of the compiled rule. The full rule in `source/` keeps it.
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
    2. Write "the tdd-test-structure rule", not `waytide/system/testing/tdd-test-structure.md`.
    3. A rule's filename changes when it is renamed, so a recorded path then points at nothing.

    ## Removing a rule

    1. Search for what cites the rule, and reconcile the live artifacts that cite it.
    2. Then remove the rule and log the removal.
    3. Where the rule is stopped rather than superseded, tag its log entry `[suspended]`.
    4. In a `[suspended]` entry, name what the rule cost and what else changed. See the a-suspension-is-a-log-entry rule.
    5. Drop a removed rule from a `Related:` list. Do not mark it, such as with `(deleted)`.
    6. The log entry is the durable trace of the removal.
    7. **Why:** the rules are the project's durable, in-repo conventions, committed with the code and read fresh each session, so they stay authoritative and current. One rule per file keeps each convention readable, referenceable, and revisable. Separating installed packages from local rules means refreshing a package never touches a local rule.

    CONTRACTIONS: none of note in wording; see below.

    CONTRADICTIONS: The source says `waytide/system/` and `waytide/local/rules/` "hold only rules", but it also says each package in `waytide/system/` has a `README.md` and a `source/` directory that are not read as rules. So `waytide/system/` holds files that are not rules. Both statements are kept as written above.

### The directives, as the listing agent gave them

    1. The project's binding rules (naming conventions, terminology, plan-writing norms, commit conventions, and the like) are read at the start of every session and followed.
    2. Binding rules live in two directories, separated by source: `waytide/system/` for the installed system packages, and `waytide/local/rules/` for the project's own local rules.
    3. Each installed system package sits in its own subdirectory of `waytide/system/` (for example `waytide/system/foundation/`, `waytide/system/language/`).
    4. System packages are installed with `git subtree` and refreshed by pulling.
    5. A package's `vocabulary.md` glossary is part of its rules: its terms are binding and cannot be applied unread.
    6. The rules in `waytide/local/rules/` are the project's own conventions, not rules installed from a package.
    7. Each rule is kept in its own file, one rule per file.
    8. Read every rule file under `waytide/system/` and `waytide/local/rules/` at the start of a session and follow them, except each package's `source/` directory and its `README.md`.
    9. A rule is edited in its package's `source/` directory, which holds the full rules that the compiled rules are compiled from.
    10. The compiled rules at the package root are what is read.
    11. The rules override default behavior where they conflict.
    12. Explicit user instructions win over the rules.
    13. Read `waytide/system/foundation/` first, because it defines the system.
    14. Read `waytide/local/vocabulary.md` (the project's own vocabulary) at session start together with the rules. It is binding, and its terms cannot be applied unread.
    15. The terms in `waytide/local/vocabulary.md` decide over the terms of every package's vocabulary.
    16. `waytide/local/vocabulary.md` is not a rule and does not live in `waytide/local/rules/`.
    17. `waytide/local/vocabulary.md` and `waytide/local/rules/` may not exist, and their absence is ordinary.
    18. `waytide/system/` and `waytide/local/rules/` hold only rules, kept separate from work artifacts.
    19. The project's working state lives beside `rules/` under `waytide/local/`: `logs/` (which holds `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, and `migration/`.
    20. Working-state directories are worked with as their own conventions describe, and are not read as binding rules at session start.
    21. `waytide/local/vocabulary.md` is not working state. It is the one thing beside `rules/` that binds.
    22. A rule's purpose is not confined to its category: the package a rule is in names the surface it acts on, not the purpose it serves.
    23. Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance.
    24. A rule is written as frontmatter-free markdown.
    25. A rule consists of a `# <title>` that states the rule, then the rule in prose, then short `**Why:**` and `**How to apply:**` lines.
    26. A system package rule is named by a dash-separated, lower-case name.
    27. A project's own local rule in `waytide/local/rules/` takes the ISO-8601-UTC datetime prefix in its file name.
    28. A rule's history goes in a `## History` section, placed before `Related:`.
    29. A rule's `## History` section holds what the rule used to say, when it changed, what it was named, and where it sat.
    30. The `## History` section is left out of the compiled rule, so the session-start read does not carry it. The full rule in `source/` keeps it.
    31. Reasoning that a rule's directive depends on is not history, even where it tells what failed before. It stays in the rule's body, where the `**Why:**` passage is.
    32. A paragraph leads with its claim in bold.
    33. The sentences after a paragraph's bold lead support that claim.
    34. Where the support for a bold claim runs past six sentences, the next paragraph carries no bold lead, which marks it as a continuation rather than a new claim.
    35. When the user states a rule, or a decision sets a rule for future work, add it as a new file in `waytide/local/rules/`, in the rule format.
    36. When a new local rule is recorded, add a matching one-line entry to `waytide/local/logs/log/`.
    37. A rule that belongs to a system package is edited in that package and re-published, not added to `waytide/local/rules/`.
    38. Reference a rule by its name, never by its file path (write "the tdd-test-structure rule", not `waytide/system/testing/tdd-test-structure.md`).
    39. A rule is renamed when its name stops saying what it says, and its filename changes with it.
    40. Before removing a rule, search for what cites it and reconcile the live artifacts that cite it. Then remove the rule.
    41. Log the removal of a rule.
    42. Where a rule is being stopped rather than superseded, tag its log entry `[suspended]`.
    43. A `[suspended]` log entry names what the rule cost and what else changed.
    44. A removed rule is dropped from every `Related:` list, not marked there (no `(deleted)` entry).
    45. An item is never deleted. Its state changes and its record is kept.
    46. Rules are committed alongside the code and read fresh each session, not recalled from memory.
    47. Refreshing a package never touches a local rule.
    48. When the project settles a term or a substitution of its own, write it in `waytide/local/vocabulary.md`, not as a rule.
    49. Prefer an observation over a rule when the thinking has not stabilized.

### Checker A

    1. kept: "The project's binding rules are read at the start of every session and followed." + "Binding rules include naming conventions, terminology, plan-writing norms, commit conventions, and the like."
    2. kept: "Binding rules live in two directories, separated by source." + "`waytide/system/` holds the installed system packages" + "`waytide/local/rules/` holds the project's own local rules"
    3. kept: "each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …)"
    4. kept: "Packages are installed with `git subtree` and refreshed by pulling."
    5. kept: "A package's `vocabulary.md` glossary is part of its rules. Its terms are binding and cannot be applied unread."
    6. kept: "Local rules are the project's own conventions, not installed from a package."
    7. less precise: "holds the project's own local rules, one per file" / "One rule per file keeps each convention readable…". The directive appears only for local rules. For every rule it shows only as a reason in the Why line, not as a directive.
    8. kept: "Read every rule file under `waytide/system/` and `waytide/local/rules/` at the start of a session, and follow them." + "Do not read a package's `source/` directory or its `README.md`."
    9. kept: "Edit a rule in `source/`." + "A package's `source/` holds the full rules that its compiled rules are compiled from."
    10. kept: "The compiled rules at the package root are what is read."
    11. kept: "The rules override default behavior where they conflict."
    12. kept: "Explicit user instructions still win over the rules."
    13. kept: "Read `waytide/system/foundation/` first. It defines the system."
    14. kept: "Read `waytide/local/vocabulary.md` with the rules. It binds." + "Its terms cannot be applied unread" + "It is read at session start"
    15. kept: "Its terms decide over every package's terms."
    16. kept: "It is not a rule and does not live in `rules/`."
    17. less precise: "It may not exist, like `rules/`. Its absence is ordinary." The text says outright only that the vocabulary's absence is ordinary. That the absence of `rules/` is also ordinary comes only from "like `rules/`".
    18. kept: "Rules are kept separate from work artifacts." + "`waytide/system/` and `waytide/local/rules/` hold only rules."
    19. kept: "The project's working state lives beside `rules/` under `waytide/local/`: `logs/` (holding `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, `migration/`."
    20. kept: "Work with working state as its own conventions describe." + "Do not read working state as binding rules at session start."
    21. kept: "`waytide/local/vocabulary.md` sits beside working state but is not working state. … the one thing there that binds."
    22. kept: "A rule's package names the surface it acts on, not the purpose it serves. A rule's purpose is not confined to its category."
    23. kept: "Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance."
    24. kept: "A rule is frontmatter-free markdown."
    25. kept: "It has a `# <title>` stating the rule, then the rule in prose, then short `**Why:**` and `**How to apply:**` lines."
    26. kept: "Name a system package rule with a dash-separated, lower-case name."
    27. less precise: "Give a project's own local rule in `waytide/local/rules/` the ISO-8601-UTC datetime prefix." It does not say the prefix goes in the file name. That is implied only by "See the file-names rule".
    28. kept: "Put a rule's history in a `## History` section, placed before `Related:`."
    29. kept: "History is what the rule used to say, when it changed, what it was named, and where it sat."
    30. kept: "The compiler leaves `## History` out of the compiled rule. The full rule in `source/` keeps it." It does not say outright that the session-start read therefore skips History. That follows from "The compiled rules at the package root are what is read."
    31. kept: "Reasoning the directive depends on is not history, even where it tells what failed before. Keep it in the body, where the `**Why:**` passage is."
    32. kept: "A paragraph leads with its claim in bold."
    33. kept: "The sentences after it support that claim."
    34. kept: "Where the support runs past six sentences, the next paragraph carries no bold lead. The absence marks it as continuation, not a new claim."
    35. less precise: "add it as a new file in `waytide/local/rules/`". It leaves out "in the rule format".
    36. kept: "Add a matching one-line entry to `waytide/local/logs/log/`."
    37. kept: "Edit a rule that belongs to a system package in that package and re-publish it. Do not add it to `waytide/local/rules/`."
    38. kept: "Reference a rule by its name, never by its file path." + "Write \"the tdd-test-structure rule\", not `waytide/system/testing/tdd-test-structure.md`."
    39. less precise: "A rule's filename changes when it is renamed". It leaves out when to rename: when the name stops saying what the rule says.
    40. kept: "Search for what cites the rule, and reconcile the live artifacts that cite it." + "Then remove the rule"
    41. kept: "remove the rule and log the removal"
    42. kept: "Where the rule is stopped rather than superseded, tag its log entry `[suspended]`."
    43. kept: "In a `[suspended]` entry, name what the rule cost and what else changed."
    44. less precise: "Drop a removed rule from a `Related:` list. Do not mark it, such as with `(deleted)`." It says "a" list instead of "every" list.
    45. lost. Nothing says that an item is never deleted, or that its state changes and its record is kept.
    46. less precise: "committed with the code and read fresh each session". This appears only as a reason in the Why line, not as a directive. "Not recalled from memory" is missing.
    47. kept: "refreshing a package never touches a local rule" (in the Why line)
    48. kept: "When the project settles a term or a substitution of its own, write it in `waytide/local/vocabulary.md`. Do not write it as a rule."
    49. kept: "Prefer an observation over a rule when the thinking has not stabilized."

    Line 83 of the shorter version is a stray line that belongs to no section: "CONTRACTIONS: none of note in wording; see below." It does not change any verdict above.

### Checker B

    1 kept: "The project's binding rules are read at the start of every session and followed." / "Binding rules include naming conventions, terminology, plan-writing norms, commit conventions, and the like."
    2 kept: "Binding rules live in two directories, separated by source." / "**`waytide/system/`** holds the installed system packages" / "**`waytide/local/rules/`** holds the project's own local rules"
    3 kept: "each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …)"
    4 kept: "Packages are installed with `git subtree` and refreshed by pulling."
    5 kept: "A package's `vocabulary.md` glossary is part of its rules. Its terms are binding and cannot be applied unread."
    6 kept: "Local rules are the project's own conventions, not installed from a package."
    7 less precise: "holds the project's own local rules, one per file" / "One rule per file keeps each convention readable" — one-per-file is stated as a directive only for local rules. For system rules it appears only in the Why rationale.
    8 kept: "Read every rule file under `waytide/system/` and `waytide/local/rules/` at the start of a session, and follow them." / "Do not read a package's `source/` directory or its `README.md`."
    9 kept: "Edit a rule in `source/`." / "A package's `source/` holds the full rules that its compiled rules are compiled from."
    10 kept: "The compiled rules at the package root are what is read."
    11 kept: "The rules override default behavior where they conflict."
    12 kept: "Explicit user instructions still win over the rules."
    13 kept: "Read `waytide/system/foundation/` first. It defines the system."
    14 kept: "Read `waytide/local/vocabulary.md` with the rules. It binds." / "Its terms cannot be applied unread" / "It is read at session start"
    15 kept: "Its terms decide over every package's terms."
    16 kept: "It is not a rule and does not live in `rules/`."
    17 less precise: "It may not exist, like `rules/`. Its absence is ordinary." — it says directly only that the vocabulary file's absence is ordinary. That `rules/` may be absent, and that its absence is ordinary, is only implied by "like `rules/`".
    18 kept: "Rules are kept separate from work artifacts." / "`waytide/system/` and `waytide/local/rules/` hold only rules."
    19 kept: "The project's working state lives beside `rules/` under `waytide/local/`: `logs/` (holding `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, `migration/`."
    20 kept: "Work with working state as its own conventions describe." / "Do not read working state as binding rules at session start."
    21 kept: "`waytide/local/vocabulary.md` sits beside working state but is not working state. It is read at session start and is the one thing there that binds."
    22 kept: "A rule's package names the surface it acts on, not the purpose it serves. A rule's purpose is not confined to its category."
    23 kept: "Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance."
    24 kept: "A rule is frontmatter-free markdown."
    25 kept: "It has a `# <title>` stating the rule, then the rule in prose, then short `**Why:**` and `**How to apply:**` lines."
    26 kept: "Name a system package rule with a dash-separated, lower-case name."
    27 less precise: "Give a project's own local rule in `waytide/local/rules/` the ISO-8601-UTC datetime prefix." — it does not say the prefix goes in the file name. It only points to "the file-names rule".
    28 kept: "Put a rule's history in a `## History` section, placed before `Related:`."
    29 kept: "History is what the rule used to say, when it changed, what it was named, and where it sat."
    30 kept: "The compiler leaves `## History` out of the compiled rule. The full rule in `source/` keeps it." Together with "The compiled rules at the package root are what is read", this means the session-start read does not carry it.
    31 kept: "Reasoning the directive depends on is not history, even where it tells what failed before. Keep it in the body, where the `**Why:**` passage is."
    32 kept: "A paragraph leads with its claim in bold."
    33 kept: "The sentences after it support that claim."
    34 kept: "Where the support runs past six sentences, the next paragraph carries no bold lead. The absence marks it as continuation, not a new claim."
    35 kept: "When the user states a rule, or a decision sets a rule for future work, add it as a new file in `waytide/local/rules/`." The words "in the rule format" are gone, but the Format section applies to every rule, so it requires the same behavior.
    36 kept: "Add a matching one-line entry to `waytide/local/logs/log/`."
    37 kept: "Edit a rule that belongs to a system package in that package and re-publish it. Do not add it to `waytide/local/rules/`."
    38 kept: "Reference a rule by its name, never by its file path." / "Write "the tdd-test-structure rule", not `waytide/system/testing/tdd-test-structure.md`."
    39 less precise: "A rule's filename changes when it is renamed" — the trigger is missing: nothing says to rename a rule when its name stops saying what it says.
    40 kept: "Search for what cites the rule, and reconcile the live artifacts that cite it." / "Then remove the rule"
    41 kept: "remove the rule and log the removal."
    42 kept: "Where the rule is stopped rather than superseded, tag its log entry `[suspended]`."
    43 kept: "In a `[suspended]` entry, name what the rule cost and what else changed."
    44 kept: "Drop a removed rule from a `Related:` list. Do not mark it, such as with `(deleted)`."
    45 lost — nothing says an item is never deleted, or that its state changes and its record is kept.
    46 kept: "committed with the code and read fresh each session, so they stay authoritative and current" — this sits only in the Why rationale, and "not recalled from memory" is not stated, but "read fresh" requires the same behavior.
    47 kept: "Separating installed packages from local rules means refreshing a package never touches a local rule." (stated in the Why rationale)
    48 kept: "When the project settles a term or a substitution of its own, write it in `waytide/local/vocabulary.md`. Do not write it as a rule."
    49 kept: "Prefer an observation over a rule when the thinking has not stabilized."

    Separate from the verdicts: line 83 of compressed.md holds a stray line that is not rule content: "CONTRACTIONS: none of note in wording; see below."

### The re-check, after the repairs

    The shorter version keeps all 49 directives. None is less precise and none is lost.

    1. kept: "The project's binding rules are read at the start of every session and followed." / "Binding rules include naming conventions, terminology, plan-writing norms, commit conventions, and the like."
    2. kept: "Binding rules live in two directories, separated by source." / "**`waytide/system/`** holds the installed system packages" / "**`waytide/local/rules/`** holds the project's own local rules"
    3. kept: "each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …)"
    4. kept: "Packages are installed with `git subtree` and refreshed by pulling."
    5. kept: "A package's `vocabulary.md` glossary is part of its rules. Its terms are binding and cannot be applied unread."
    6. kept: "Local rules are the project's own conventions, not installed from a package."
    7. kept: "Every rule, system or local, is kept one per file."
    8. kept: "Read every rule file under `waytide/system/` and `waytide/local/rules/` at the start of a session, and follow them." / "Do not read a package's `source/` directory or its `README.md`."
    9. kept: "A package's `source/` holds the full rules that its compiled rules are compiled from." / "Edit a rule in `source/`."
    10. kept: "The compiled rules at the package root are what is read."
    11. kept: "The rules override default behavior where they conflict."
    12. kept: "Explicit user instructions still win over the rules."
    13. kept: "Read `waytide/system/foundation/` first. It defines the system."
    14. kept: "Read `waytide/local/vocabulary.md` with the rules. It binds." / "Its terms cannot be applied unread" / "It is read at session start"
    15. kept: "Its terms decide over every package's terms."
    16. kept: "It is not a rule and does not live in `rules/`."
    17. kept: "It may not exist, and neither may `rules/`. Either absence is ordinary."
    18. kept: "Rules are kept separate from work artifacts." / "`waytide/system/` and `waytide/local/rules/` hold only rules."
    19. kept: "The project's working state lives beside `rules/` under `waytide/local/`: `logs/` (holding `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, `migration/`."
    20. kept: "Work with working state as its own conventions describe." / "Do not read working state as binding rules at session start."
    21. kept: "`waytide/local/vocabulary.md` sits beside working state but is not working state. It is read at session start and is the one thing there that binds."
    22. kept: "A rule's package names the surface it acts on, not the purpose it serves. A rule's purpose is not confined to its category."
    23. kept: "Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance."
    24. kept: "A rule is frontmatter-free markdown."
    25. kept: "It has a `# <title>` stating the rule, then the rule in prose, then short `**Why:**` and `**How to apply:**` lines."
    26. kept: "Name a system package rule with a dash-separated, lower-case name."
    27. kept: "Give a project's own local rule in `waytide/local/rules/` the ISO-8601-UTC datetime prefix in its file name."
    28. kept: "Put a rule's history in a `## History` section, placed before `Related:`."
    29. kept: "History is what the rule used to say, when it changed, what it was named, and where it sat."
    30. kept: "The compiler leaves `## History` out of the compiled rule. The full rule in `source/` keeps it." The words "so the session-start read does not carry it" are not there, but that follows from "The compiled rules at the package root are what is read."
    31. kept: "Reasoning the directive depends on is not history, even where it tells what failed before. Keep it in the body, where the `**Why:**` passage is."
    32. kept: "A paragraph leads with its claim in bold."
    33. kept: "The sentences after it support that claim."
    34. kept: "Where the support runs past six sentences, the next paragraph carries no bold lead. The absence marks it as continuation, not a new claim."
    35. kept: "add it as a new file in `waytide/local/rules/`". The words "in the rule format" are not there, but the Format section requires that format for every rule ("A rule is frontmatter-free markdown." / "It has a `# <title>` stating the rule…").
    36. kept: "Add a matching one-line entry to `waytide/local/logs/log/`."
    37. kept: "Edit a rule that belongs to a system package in that package and re-publish it. Do not add it to `waytide/local/rules/`."
    38. kept: "Reference a rule by its name, never by its file path." / "Write "the tdd-test-structure rule", not `waytide/system/testing/tdd-test-structure.md`."
    39. kept: "Rename a rule when its name stops saying what it says. Its filename changes with it"
    40. kept: "Search for what cites the rule, and reconcile the live artifacts that cite it." / "Then remove the rule"
    41. kept: "Then remove the rule and log the removal."
    42. kept: "Where the rule is stopped rather than superseded, tag its log entry `[suspended]`."
    43. kept: "In a `[suspended]` entry, name what the rule cost and what else changed."
    44. kept: "Drop a removed rule from every `Related:` list. Do not mark it, such as with `(deleted)`."
    45. kept: "An item is never deleted. Its state changes and its record is kept."
    46. kept: "committed with the code and read fresh each session". This is stated only in the `**Why:**` line, and the words "not recalled from memory" are not there. "read fresh each session" and the session-start read directive require the same behavior.
    47. kept: "refreshing a package never touches a local rule". This is stated only in the `**Why:**` line.
    48. kept: "When the project settles a term or a substitution of its own, write it in `waytide/local/vocabulary.md`. Do not write it as a rule."
    49. kept: "Prefer an observation over a rule when the thinking has not stabilized."

## rules-establish-a-mindset-purpose-over-category

### The compressor's answer

    1. A rule's package names the surface it acts on, such as words, commits, tests, or code. It does not name the purpose the rule serves.
    2. Many rules exist to establish a mental stance, a way of thinking about the code and the work, rather than to standardize a mechanic.
    3. Purpose is not confined to category. Rules in different packages can serve the same purpose.
    4. A rule's real justification is often not visible from its package.
    5. Terminology rules are the purest case. Each is an X-not-Y substitution (controls-not-factories, name-literally-not-by-analogy) that swaps a word to swap the concept it installs.
    6. Terminology rules do not change what the code does.
    7. The same purpose recurs under other packages through other levers. The `git` subject-first commit-message rule is a mindset rule reached through grammar (passive voice, indicative mood).
    8. That rule states what changed about the code, not what the engineer did, because centering the engineer reinforces anthropocentrism.
    9. A rule's reach can exceed the artifact. The no-slang rule extends to conversation with the user, because the mindset it preserves lives in the person.
    10. When writing or evaluating a rule, first ask *"what stance does this establish?"*. Do not ask only *"what does it standardize?"*.
    11. Place a rule in a package by the surface it acts on.
    12. State the rule's purpose, the mindset, in its body.
    13. Cross-reference sibling rules that establish the same stance through a different lever, including rules in other packages.
    14. When two rules seem to conflict, reconcile them at the level of purpose, not surface.
    15. Do not treat package membership as the whole of a rule's meaning.
    16. Judge a stance-establishing rule by the mindset it produces, not by surface conformance.
    17. A rule that is technically obeyed while the intended stance is absent has failed.
    18. **Why:** Read as local conventions, these rules look like an arbitrary do-this-not-that list. Naming their purpose keeps them coherent and prevents contradictory rules from accreting in other packages.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When writing or evaluating a rule, ask first "what stance does this establish?"
    2. When writing or evaluating a rule, do not ask only "what does it standardize?"
    3. Place a rule by the surface it acts on, which is its package.
    4. State a rule's purpose, the mindset it establishes, in the rule's body.
    5. Cross-reference sibling rules that establish the same stance through a different lever, even where they live in other packages.
    6. When two rules seem to conflict, reconcile them at the level of purpose, not surface.
    7. Do not treat package membership as the whole of a rule's meaning.
    8. Judge a rule that establishes a stance by the mindset it produces, not by surface conformance.
    9. Treat a rule as failed if it is technically obeyed while the intended stance is absent.
    10. Do not let contradictory rules accrete in other packages; naming the purpose is what prevents it.
    11. Apply the no-slang rule to conversation with the user too, not only to what goes into the codebase.
    12. Commit messages state what changed about the code, not what the engineer did (the subject-first commit-message rule, reached through passive voice and indicative mood).

### Checker A

    1. kept — "When writing or evaluating a rule, first ask *"what stance does this establish?"*."
    2. kept — "Do not ask only *"what does it standardize?"*."
    3. kept — "Place a rule in a package by the surface it acts on." / "A rule's package names the surface it acts on"
    4. kept — "State the rule's purpose, the mindset, in its body."
    5. kept — "Cross-reference sibling rules that establish the same stance through a different lever, including rules in other packages."
    6. kept — "When two rules seem to conflict, reconcile them at the level of purpose, not surface."
    7. kept — "Do not treat package membership as the whole of a rule's meaning."
    8. kept — "Judge a stance-establishing rule by the mindset it produces, not by surface conformance."
    9. kept — "A rule that is technically obeyed while the intended stance is absent has failed."
    10. kept — "Naming their purpose keeps them coherent and prevents contradictory rules from accreting in other packages." (given as the rule's rationale rather than a separate directive, and the directive to name the purpose in line 12 is what produces it)
    11. kept — "The no-slang rule extends to conversation with the user, because the mindset it preserves lives in the person."
    12. kept — "The `git` subject-first commit-message rule is a mindset rule reached through grammar (passive voice, indicative mood)." / "That rule states what changed about the code, not what the engineer did"

### Checker B

    1. kept: "When writing or evaluating a rule, first ask *"what stance does this establish?"*."
    2. kept: "Do not ask only *"what does it standardize?"*."
    3. kept: "Place a rule in a package by the surface it acts on." with "A rule's package names the surface it acts on"
    4. kept: "State the rule's purpose, the mindset, in its body."
    5. kept: "Cross-reference sibling rules that establish the same stance through a different lever, including rules in other packages."
    6. kept: "When two rules seem to conflict, reconcile them at the level of purpose, not surface."
    7. kept: "Do not treat package membership as the whole of a rule's meaning."
    8. kept: "Judge a stance-establishing rule by the mindset it produces, not by surface conformance."
    9. kept: "A rule that is technically obeyed while the intended stance is absent has failed."
    10. kept: "Naming their purpose keeps them coherent and prevents contradictory rules from accreting in other packages." (This appears as rationale under **Why:**, not as a prohibition. The behavior it needs, naming the purpose, is required by item 12.)
    11. kept: "The no-slang rule extends to conversation with the user, because the mindset it preserves lives in the person."
    12. kept: "That rule states what changed about the code, not what the engineer did" with "The `git` subject-first commit-message rule is a mindset rule reached through grammar (passive voice, indicative mood)."

## status-report-format

### The compressor's answer

    1. When the user asks for a **status report** (or "project status"), produce a report with the five parts below, in order.
    2. The report reads the project's planning records. These are the items that carry the work's tasks, whatever the project's kind tags name them.
    3. Identify those records without naming a directory or a kind.
    4. Part 1, **Task table**: the tasks those records carry, as a table of number, task, status (done / next / pending), and a terse note.
    5. Mark the next task in the task table.
    6. Include any out-of-sequence extras already built in the task table.
    7. Part 2, **Waiting work table**: the items carrying a `**Waits for:**` line, with name, date, what it waits for, and a one-line gist.
    8. Waiting items are off the task line until the wait ends.
    9. Order waiting items by their `**Priority:**` rank where they carry one.
    10. Do not list a hidden record in the waiting work table.
    11. Part 3, **Waytide-directory orientation**: a basic map of `waytide/`.
    12. The map shows that `waytide/system/` holds the installed rule packages (e.g. `foundation/`, `language/`).
    13. The map shows that `waytide/local/rules/` holds the project's own local rules.
    14. The map states that each is binding and each is read at session start.
    15. The map shows the running records under `logs/` (`log/`, `loops/`, `work-sessions/`), alongside `rules/` under `waytide/local/`.
    16. The map shows the work-artifact directories `items/`, `implementations/`, and `migration/`.
    17. The orientation says how to work with the directory. Rules are enforceable conventions.
    18. The log is title-only ISO-8601-UTC decision entries.
    19. A rule typically pairs with a log entry.
    20. An item holds the task checklist where it sequences work.
    21. A `**Waits for:**` line marks work that is not yet actionable.
    22. Part 4, **Recent flows of work**: a brief of the recent direction, drawn from the latest log and commit entries.
    23. Keep the brief to a few lines, not an exhaustive list.
    24. Part 5, **Test suite**: this part is convention-aware of the testing package.
    25. If the project has adopted the testing conventions, run the suite and report the count and pass/fail line.
    26. Report the suite's context tree two levels deep, rendered hierarchically.
    27. Each distinct top-level context is a tree root. Its distinct second-level contexts are indented as its branches.
    28. Use an indented tree, such as a fenced block with `├─`/`└─` branches.
    29. Stop at two levels. Do not descend into per-assertion contexts.
    30. If the project has not adopted the testing conventions, degrade this part. Report whatever suite the project has, with its count and pass/fail.
    31. If the project has no suite, note that there is none.

    ## A hidden record is counted rather than listed

    1. A hidden record is one a report states the number of and does not otherwise show.
    2. Omit a hidden record from the table or passage it would ordinarily sit in.
    3. Put a line there giving the count and the kind.
    4. The line says no more than that. It carries no *not listed*, no *withheld*, and no explanation.

    ```
    3 suspended items
    12 suspension log entries
    ```

    5. Hiding applies to any summary of the project's state, not only the fixed status report.
    6. That includes the *Recent flows of work* brief in part 4 and any ad-hoc account of where things stand.
    7. A record hidden from one surface is hidden from all of them.
    8. Two kinds are hidden today.
    9. A record whose `**State:**` line reads `Suspended` is hidden.
    10. A record carrying the `[suspended]` tag is hidden. That is a log entry, per the a-suspension-is-a-log-entry rule.
    11. The two are different records and take the same treatment. Do not merge them.
    12. A later rule may name another kind, and it becomes hidden by saying so.
    13. The treatment is fixed: counted, not listed, and named by kind in the count.
    14. Show hidden records when they are asked for.
    15. *Include the suspended items*, *show what is hidden*, or a request for a suspended record by name each produce the full listing.
    16. Never simply drop a hidden record. The count is what separates hiding from omitting.

    ## How to apply

    1. Keep each part tight.
    2. Read current state before printing.
    3. Do not report stale task counts, suite numbers, contexts, or deferred items from memory.
    4. Render the parts from current files: the project's items, `waytide/local/logs/log/`, and git.
    5. Confirm the suite count and the two-level context tree by running the suite, not by asserting them.
    6. Take the two levels from the run's output, not from the `context "…"` declarations in the source.
    7. A dynamic context reads as a placeholder in the source, and as its real value in a run.
    8. An unnamed test appears in the source and emits no line.
    9. **Why:** a status report is a recurring request with a known shape. A fixed format makes it repeatable and complete, and steers reading toward in-repo sources of truth rather than recollection.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the user asks for a status report (or "project status"), produce a report with these five parts, in this order: Task table, Waiting work table, Waytide-directory orientation, Recent flows of work, Test suite.
    2. The status report reads the project's planning records, meaning the items that carry the work's tasks, whatever the project's kind tags name them, and does not depend on any particular directory or kind.
    3. The Task table shows the tasks the planning records carry as a table with these columns: number, task, status (done / next / pending), and a terse note.
    4. In the Task table, mark the next task.
    5. In the Task table, include any out-of-sequence extras already built.
    6. The Waiting work table lists the items carrying a `**Waits for:**` line, with these columns: name, date, what it waits for, and a one-line gist.
    7. Items carrying a `**Waits for:**` line are off the task line until the wait ends.
    8. Order the Waiting work table by each item's `**Priority:**` rank where the item carries one.
    9. A hidden record is not listed in the Waiting work table.
    10. The Waytide-directory orientation gives a basic map of `waytide/`: `waytide/system/` holds the installed rule packages (e.g. `foundation/`, `language/`), and `waytide/local/rules/` holds the project's own local rules, each binding and each read at session start; alongside `rules/` under `waytide/local/` are the running records under `logs/` (`log/`, `loops/`, `work-sessions/`) and the work-artifact directories `items/`, `implementations/`, and `migration/`.
    11. The Waytide-directory orientation says how to work with the directory: rules are enforceable conventions; the log is title-only ISO-8601-UTC decision entries; a rule typically pairs with a log entry; an item holds the task checklist where it sequences work; and a `**Waits for:**` line marks work that is not yet actionable.
    12. The Recent flows of work part is a brief of the recent direction, drawn from the latest log and commit entries, a few lines long and not an exhaustive list.
    13. The Test suite part is convention-aware of the testing package.
    14. If the project has adopted the testing conventions, run the suite and report the count and the pass/fail line.
    15. In the Test suite part, report the suite's context tree two levels deep, rendered hierarchically, with each distinct top-level context as a tree root and its distinct second-level contexts indented as its branches.
    16. Render the context tree as an indented tree, such as a fenced block with `├─`/`└─` branches.
    17. Stop the context tree at two levels; do not descend into per-assertion contexts.
    18. If the project has not adopted the testing conventions, degrade the Test suite part: report whatever suite the project has, with its count and pass/fail, or note that there is none.
    19. A hidden record is left out of the table or passage it would ordinarily sit in, and is not otherwise shown.
    20. Where hidden records are left out, a line in that table or passage gives their count and their kind (e.g. "3 suspended items", "12 suspension log entries").
    21. The line that counts hidden records says nothing more than the count and the kind: no "not listed", no "withheld", no explanation.
    22. A record hidden from the status report is hidden from every summary of the project's state, including the Recent flows of work brief and any ad-hoc account of where things stand.
    23. A record whose `**State:**` line reads `Suspended` is hidden.
    24. A record carrying the `[suspended]` tag is hidden.
    25. A `Suspended`-state record and a `[suspended]`-tagged record are hidden for the same reason and by the same means, but they stay different records and are not merged.
    26. A later rule may name another kind of hidden record, and that kind becomes hidden when the rule says so; the treatment stays the same: counted, not listed, and named by kind in the count.
    27. Show the full listing of hidden records when it is asked for, for example by "include the suspended items", by "show what is hidden", or by a request for a suspended record by name.
    28. Keep each part of the status report tight.
    29. Read the current state before printing the status report; do not report stale task counts, suite numbers, contexts, or deferred items from memory.
    30. Render the status report's parts from current files: the project's items, `waytide/local/logs/log/`, and git.
    31. Confirm the suite count and the two-level context tree by running the suite rather than asserting them.
    32. Take the two levels of the context tree from the run's output, not from the `context "…"` declarations in the source.

### Checker A

    1. kept: "When the user asks for a **status report** (or "project status"), produce a report with the five parts below, in order." The parts are named in order as "Part 1, **Task table**" through "Part 5, **Test suite**".
    2. kept: "The report reads the project's planning records. These are the items that carry the work's tasks, whatever the project's kind tags name them." / "Identify those records without naming a directory or a kind."
    3. kept: "Part 1, **Task table**: the tasks those records carry, as a table of number, task, status (done / next / pending), and a terse note."
    4. kept: "Mark the next task in the task table."
    5. kept: "Include any out-of-sequence extras already built in the task table."
    6. kept: "Part 2, **Waiting work table**: the items carrying a `**Waits for:**` line, with name, date, what it waits for, and a one-line gist."
    7. kept: "Waiting items are off the task line until the wait ends."
    8. kept: "Order waiting items by their `**Priority:**` rank where they carry one."
    9. kept: "Do not list a hidden record in the waiting work table."
    10. less precise: "The map shows that `waytide/system/` holds the installed rule packages (e.g. `foundation/`, `language/`)." / "The map shows that `waytide/local/rules/` holds the project's own local rules." / "The map states that each is binding and each is read at session start." / "The map shows the running records under `logs/` (`log/`, `loops/`, `work-sessions/`), alongside `rules/` under `waytide/local/`." / "The map shows the work-artifact directories `items/`, `implementations/`, and `migration/`." Missing: because the "binding and read at session start" clause is split into its own line, "each" no longer clearly means each local rule. It could also be read as the two directories.
    11. kept: "The orientation says how to work with the directory. Rules are enforceable conventions." / "The log is title-only ISO-8601-UTC decision entries." / "A rule typically pairs with a log entry." / "An item holds the task checklist where it sequences work." / "A `**Waits for:**` line marks work that is not yet actionable."
    12. kept: "Part 4, **Recent flows of work**: a brief of the recent direction, drawn from the latest log and commit entries." / "Keep the brief to a few lines, not an exhaustive list."
    13. kept: "Part 5, **Test suite**: this part is convention-aware of the testing package."
    14. kept: "If the project has adopted the testing conventions, run the suite and report the count and pass/fail line."
    15. kept: "Report the suite's context tree two levels deep, rendered hierarchically." / "Each distinct top-level context is a tree root. Its distinct second-level contexts are indented as its branches."
    16. kept: "Use an indented tree, such as a fenced block with `├─`/`└─` branches."
    17. kept: "Stop at two levels. Do not descend into per-assertion contexts."
    18. kept: "If the project has not adopted the testing conventions, degrade this part. Report whatever suite the project has, with its count and pass/fail." / "If the project has no suite, note that there is none."
    19. kept: "Omit a hidden record from the table or passage it would ordinarily sit in." / "A hidden record is one a report states the number of and does not otherwise show."
    20. kept: "Put a line there giving the count and the kind." The example block gives "3 suspended items" and "12 suspension log entries".
    21. kept: "The line says no more than that. It carries no *not listed*, no *withheld*, and no explanation."
    22. kept: "Hiding applies to any summary of the project's state, not only the fixed status report." / "That includes the *Recent flows of work* brief in part 4 and any ad-hoc account of where things stand." / "A record hidden from one surface is hidden from all of them."
    23. kept: "A record whose `**State:**` line reads `Suspended` is hidden."
    24. kept: "A record carrying the `[suspended]` tag is hidden."
    25. less precise: "The two are different records and take the same treatment. Do not merge them." Missing: it does not say the two are hidden for the same reason. Only the same means of hiding is stated.
    26. kept: "A later rule may name another kind, and it becomes hidden by saying so." / "The treatment is fixed: counted, not listed, and named by kind in the count."
    27. kept: "Show hidden records when they are asked for." / "*Include the suspended items*, *show what is hidden*, or a request for a suspended record by name each produce the full listing."
    28. kept: "Keep each part tight."
    29. kept: "Read current state before printing." / "Do not report stale task counts, suite numbers, contexts, or deferred items from memory."
    30. kept: "Render the parts from current files: the project's items, `waytide/local/logs/log/`, and git."
    31. kept: "Confirm the suite count and the two-level context tree by running the suite, not by asserting them."
    32. kept: "Take the two levels from the run's output, not from the `context "…"` declarations in the source."

### Checker B

    Directive-by-directive verdicts, judged from directives.md against compressed.md:

    1. kept — "When the user asks for a **status report** (or "project status"), produce a report with the five parts below, in order." (Parts 1 to 5 are named in the original's order.)
    2. kept — "The report reads the project's planning records. These are the items that carry the work's tasks, whatever the project's kind tags name them." / "Identify those records without naming a directory or a kind."
    3. kept — "Part 1, **Task table**: the tasks those records carry, as a table of number, task, status (done / next / pending), and a terse note."
    4. kept — "Mark the next task in the task table."
    5. kept — "Include any out-of-sequence extras already built in the task table."
    6. kept — "Part 2, **Waiting work table**: the items carrying a `**Waits for:**` line, with name, date, what it waits for, and a one-line gist."
    7. kept — "Waiting items are off the task line until the wait ends."
    8. kept — "Order waiting items by their `**Priority:**` rank where they carry one."
    9. kept — "Do not list a hidden record in the waiting work table."
    10. kept — "Part 3, **Waytide-directory orientation**: a basic map of `waytide/`." / "`waytide/system/` holds the installed rule packages (e.g. `foundation/`, `language/`)" / "`waytide/local/rules/` holds the project's own local rules" / "each is binding and each is read at session start" / "the running records under `logs/` (`log/`, `loops/`, `work-sessions/`), alongside `rules/` under `waytide/local/`" / "the work-artifact directories `items/`, `implementations/`, and `migration/`"
    11. kept — "The orientation says how to work with the directory. Rules are enforceable conventions." / "The log is title-only ISO-8601-UTC decision entries." / "A rule typically pairs with a log entry." / "An item holds the task checklist where it sequences work." / "A `**Waits for:**` line marks work that is not yet actionable."
    12. kept — "Part 4, **Recent flows of work**: a brief of the recent direction, drawn from the latest log and commit entries." / "Keep the brief to a few lines, not an exhaustive list."
    13. kept — "Part 5, **Test suite**: this part is convention-aware of the testing package."
    14. kept — "If the project has adopted the testing conventions, run the suite and report the count and pass/fail line."
    15. kept — "Report the suite's context tree two levels deep, rendered hierarchically." / "Each distinct top-level context is a tree root. Its distinct second-level contexts are indented as its branches."
    16. kept — "Use an indented tree, such as a fenced block with `├─`/`└─` branches."
    17. kept — "Stop at two levels. Do not descend into per-assertion contexts."
    18. kept — "If the project has not adopted the testing conventions, degrade this part. Report whatever suite the project has, with its count and pass/fail." / "If the project has no suite, note that there is none."
    19. kept — "Omit a hidden record from the table or passage it would ordinarily sit in." / "one a report states the number of and does not otherwise show"
    20. kept — "Put a line there giving the count and the kind." (with the example block "3 suspended items / 12 suspension log entries")
    21. kept — "The line says no more than that. It carries no *not listed*, no *withheld*, and no explanation."
    22. kept — "Hiding applies to any summary of the project's state, not only the fixed status report." / "That includes the *Recent flows of work* brief in part 4 and any ad-hoc account of where things stand." / "A record hidden from one surface is hidden from all of them."
    23. kept — "A record whose `**State:**` line reads `Suspended` is hidden."
    24. kept — "A record carrying the `[suspended]` tag is hidden."
    25. less precise — "The two are different records and take the same treatment. Do not merge them." Missing: the shorter version does not say the two are hidden for the same reason. "Same treatment" covers "by the same means". This changes no behavior.
    26. kept — "A later rule may name another kind, and it becomes hidden by saying so." / "The treatment is fixed: counted, not listed, and named by kind in the count."
    27. kept — "Show hidden records when they are asked for." / "*Include the suspended items*, *show what is hidden*, or a request for a suspended record by name each produce the full listing."
    28. kept — "Keep each part tight."
    29. kept — "Read current state before printing." / "Do not report stale task counts, suite numbers, contexts, or deferred items from memory."
    30. kept — "Render the parts from current files: the project's items, `waytide/local/logs/log/`, and git."
    31. kept — "Confirm the suite count and the two-level context tree by running the suite, not by asserting them."
    32. kept — "Take the two levels from the run's output, not from the `context "…"` declarations in the source."

    Overall: 31 kept, 1 less precise (25), 0 lost.

### The re-check, after the repairs

    1. kept — "When the user asks for a **status report** (or "project status"), produce a report with the five parts below, in order." plus "Part 1, **Task table**" … "Part 5, **Test suite**"
    2. kept — "The report reads the project's planning records. These are the items that carry the work's tasks, whatever the project's kind tags name them." / "Identify those records without naming a directory or a kind."
    3. kept — "Part 1, **Task table**: the tasks those records carry, as a table of number, task, status (done / next / pending), and a terse note."
    4. kept — "Mark the next task in the task table."
    5. kept — "Include any out-of-sequence extras already built in the task table."
    6. kept — "Part 2, **Waiting work table**: the items carrying a `**Waits for:**` line, with name, date, what it waits for, and a one-line gist."
    7. kept — "Waiting items are off the task line until the wait ends."
    8. kept — "Order waiting items by their `**Priority:**` rank where they carry one."
    9. kept — "Do not list a hidden record in the waiting work table."
    10. kept — "Part 3, **Waytide-directory orientation**: a basic map of `waytide/`." / "`waytide/system/` holds the installed rule packages (e.g. `foundation/`, `language/`)" / "`waytide/local/rules/` holds the project's own local rules" / "both are binding and both are read at session start" / "the running records under `logs/` (`log/`, `loops/`, `work-sessions/`), alongside `rules/` under `waytide/local/`" / "the work-artifact directories `items/`, `implementations/`, and `migration/`"
    11. kept — "The orientation says how to work with the directory. Rules are enforceable conventions." / "The log is title-only ISO-8601-UTC decision entries." / "A rule typically pairs with a log entry." / "An item holds the task checklist where it sequences work." / "A `**Waits for:**` line marks work that is not yet actionable."
    12. kept — "Part 4, **Recent flows of work**: a brief of the recent direction, drawn from the latest log and commit entries." / "Keep the brief to a few lines, not an exhaustive list."
    13. kept — "Part 5, **Test suite**: this part is convention-aware of the testing package."
    14. kept — "If the project has adopted the testing conventions, run the suite and report the count and pass/fail line."
    15. kept — "Report the suite's context tree two levels deep, rendered hierarchically." / "Each distinct top-level context is a tree root. Its distinct second-level contexts are indented as its branches."
    16. kept — "Use an indented tree, such as a fenced block with `├─`/`└─` branches."
    17. kept — "Stop at two levels. Do not descend into per-assertion contexts."
    18. kept — "If the project has not adopted the testing conventions, degrade this part. Report whatever suite the project has, with its count and pass/fail." / "If the project has no suite, note that there is none."
    19. kept — "Omit a hidden record from the table or passage it would ordinarily sit in." / "A hidden record is one a report states the number of and does not otherwise show."
    20. kept — "Put a line there giving the count and the kind." with the example block "3 suspended items / 12 suspension log entries"
    21. kept — "The line says no more than that. It carries no *not listed*, no *withheld*, and no explanation."
    22. kept — "Hiding applies to any summary of the project's state, not only the fixed status report." / "That includes the *Recent flows of work* brief in part 4 and any ad-hoc account of where things stand." / "A record hidden from one surface is hidden from all of them."
    23. kept — "A record whose `**State:**` line reads `Suspended` is hidden."
    24. kept — "A record carrying the `[suspended]` tag is hidden."
    25. kept — "The two are different records, hidden for the same reason, and take the same treatment. Do not merge them."
    26. kept — "A later rule may name another kind, and it becomes hidden by saying so." / "The treatment is fixed: counted, not listed, and named by kind in the count."
    27. kept — "Show hidden records when they are asked for." / "*Include the suspended items*, *show what is hidden*, or a request for a suspended record by name each produce the full listing."
    28. kept — "Keep each part tight."
    29. kept — "Read current state before printing." / "Do not report stale task counts, suite numbers, contexts, or deferred items from memory."
    30. kept — "Render the parts from current files: the project's items, `waytide/local/logs/log/`, and git."
    31. kept — "Confirm the suite count and the two-level context tree by running the suite, not by asserting them."
    32. kept — "Take the two levels from the run's output, not from the `context "…"` declarations in the source."

    All 32 directives come through as kept: none are less precise and none are lost. I read only the two files the prompt names: /private/tmp/claude-501/batch-fnd/status-report-format/directives.md and /private/tmp/claude-501/batch-fnd/status-report-format/compressed.md.

## the-log-never-says-undone-work-was-done

### The compressor's answer

    1. A decision log entry never conveys that something was done when it was not done.
    2. This prohibition holds whatever the entry is about.
    3. The log on `master` never conveys that work from an abandoned branch landed on `master`.

    ## What an abandonment entry carries

    1. When work is abandoned, write the entry as the decision to stop and the reasoning given for it.
    2. Where no reason was given, the entry says so.
    3. Write no reason that was not given. An agent's reading of why the engineer stopped is not the engineer's reason.
    4. Say plainly that nothing merged.
    5. Say where the work was.
    6. Do not carry the unfinished work: not the unexecuted plan, the unrun increments, or the unbuilt design.
    7. Where an entry needs more than a line, it takes a body, as the decision-log-convention describes.

    ## Why the mood is not enough

    1. Careful tense is necessary but not sufficient.
    2. An entry written entirely in conditional mood, such as *It would have taken the package to `ext/`*, still must not record unexecuted planning.
    3. The test is the entry's subject, not its grammar.
    4. Reasoning for stopping belongs in the log. Work that stopped does not.
    5. **Why:** A reader consults the log, with no branch to compare against, to learn what the project decided. Recording unexecuted work makes it read as settled knowledge the project holds.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A decision log entry never conveys that something was done when it was not done, whatever the entry is about.
    2. The decision log on `master` must not convey that work from an abandoned branch landed on `master`.
    3. When work is abandoned, the decision log entry may record any reasoning given for the abandonment.
    4. An abandonment entry carries the reasoning for stopping, where reasoning was given.
    5. Where no reason was given for an abandonment, the entry says so.
    6. An abandonment entry invents no reason; write no reason that was not given (an agent's reading of why the engineer stopped is not the engineer's reason).
    7. An abandonment entry does not carry the unfinished work: do not reproduce the plan, the increments, or the design the abandoned work produced.
    8. Careful (conditional) tense does not make reproducing unexecuted work in the log acceptable; the test is not the grammar but the subject: reasoning for stopping belongs in the log, and work that stopped does not.
    9. When work is abandoned, write the log entry as the decision to stop and the reasoning given for it.
    10. An abandonment entry says plainly that nothing merged.
    11. An abandonment entry says plainly where the work was.
    12. Where an abandonment entry needs more than a line, it takes a body, as the decision-log-convention describes.

### Checker A

    1. kept: "A decision log entry never conveys that something was done when it was not done." + "This prohibition holds whatever the entry is about."
    2. kept: "The log on `master` never conveys that work from an abandoned branch landed on `master`."
    3. kept: "write the entry as the decision to stop and the reasoning given for it." (The original only permits recording the reasoning. The shorter version requires it, which covers the permitted behavior.)
    4. kept: "write the entry as the decision to stop and the reasoning given for it."
    5. kept: "Where no reason was given, the entry says so."
    6. kept: "Write no reason that was not given. An agent's reading of why the engineer stopped is not the engineer's reason."
    7. kept: "Do not carry the unfinished work: not the unexecuted plan, the unrun increments, or the unbuilt design."
    8. kept: "Careful tense is necessary but not sufficient." / "An entry written entirely in conditional mood ... still must not record unexecuted planning." / "The test is the entry's subject, not its grammar." / "Reasoning for stopping belongs in the log. Work that stopped does not."
    9. kept: "When work is abandoned, write the entry as the decision to stop and the reasoning given for it."
    10. kept: "Say plainly that nothing merged."
    11. less precise: "Say where the work was." Missing: "plainly" was dropped, so it no longer requires stating the location plainly.
    12. kept: "Where an entry needs more than a line, it takes a body, as the decision-log-convention describes."

### Checker B

    1. kept — "A decision log entry never conveys that something was done when it was not done." + "This prohibition holds whatever the entry is about."
    2. kept — "The log on `master` never conveys that work from an abandoned branch landed on `master`."
    3. kept — "When work is abandoned, write the entry as the decision to stop and the reasoning given for it." (requiring the reasoning to be recorded covers permitting it)
    4. kept — "write the entry as the decision to stop and the reasoning given for it"
    5. kept — "Where no reason was given, the entry says so."
    6. kept — "Write no reason that was not given. An agent's reading of why the engineer stopped is not the engineer's reason."
    7. kept — "Do not carry the unfinished work: not the unexecuted plan, the unrun increments, or the unbuilt design."
    8. kept — "Careful tense is necessary but not sufficient." + "An entry written entirely in conditional mood ... still must not record unexecuted planning." + "The test is the entry's subject, not its grammar." + "Reasoning for stopping belongs in the log. Work that stopped does not."
    9. kept — "When work is abandoned, write the entry as the decision to stop and the reasoning given for it."
    10. kept — "Say plainly that nothing merged."
    11. less precise — "Say where the work was." Missing: "plainly" is applied only to the nothing-merged statement, not to where the work was.
    12. kept — "Where an entry needs more than a line, it takes a body, as the decision-log-convention describes."

### The re-check, after the repairs

    1. kept — "A decision log entry never conveys that something was done when it was not done." / "This prohibition holds whatever the entry is about."
    2. kept — "The log on `master` never conveys that work from an abandoned branch landed on `master`."
    3. kept — "write the entry as the decision to stop and the reasoning given for it" (requires recording the given reasoning, which covers the permission)
    4. kept — "write the entry as the decision to stop and the reasoning given for it"
    5. kept — "Where no reason was given, the entry says so."
    6. kept — "Write no reason that was not given. An agent's reading of why the engineer stopped is not the engineer's reason."
    7. kept — "Do not carry the unfinished work: not the unexecuted plan, the unrun increments, or the unbuilt design."
    8. kept — "Careful tense is necessary but not sufficient." / "An entry written entirely in conditional mood ... still must not record unexecuted planning." / "The test is the entry's subject, not its grammar." / "Reasoning for stopping belongs in the log. Work that stopped does not."
    9. kept — "When work is abandoned, write the entry as the decision to stop and the reasoning given for it."
    10. kept — "Say plainly that nothing merged."
    11. kept — "Say plainly where the work was."
    12. kept — "Where an entry needs more than a line, it takes a body, as the decision-log-convention describes."

    The shorter version carries all 12 directives. None is less precise or lost.

## vocabulary-convention

### The compressor's answer

    1. A package's `vocabulary.md` holds the terms that package defines and the word substitutions it enforces.
    2. It is binding.
    3. Use its terms and substitutions in code, tests, rules, designs, commits, records, and dialogue.
    4. Give a package a vocabulary only when its domain has specialized words.
    5. A package whose subject is written in ordinary words has no vocabulary. The absence is correct, not missing.
    6. `git` and `ext/ruby-lang` have none. Six packages do.
    7. Put a term in the vocabulary of the package whose domain it belongs to.
    8. Put a domain-less term or substitution in `language`.

    ## What a vocabulary holds

    1. **Terms** are the concepts the package defines, such as `solubility`, `efferent`, `hinge`, `precondition`.
    2. A term is a glossary entry, and it says what the concept is.
    3. **Substitutions** name a word not to write, and the word to write instead. Examples: `conform` rather than "sweep", `verified` rather than "green".
    4. **Discontinuations** name a word removed from use with nothing in its place. `discriminator` went because the concept went.
    5. A substitution names two words. A discontinuation names one.
    6. Keep substitutions and discontinuations under separate headings. Do not file one under the other's heading.
    7. A word Waytide did not coin is still a term when the vocabulary says what it means. Examples: `load-bearing`, `cradle`, `preserve`.
    8. Where a word was taken rather than coined, the entry says so in its own prose.
    9. That statement is an **origin**, not a kind of entry.

    ## Which vocabulary decides

    1. Four levels hold terms, and a word can appear in more than one.
    2. They decide in this order, from the one that decides first:
       1. **The STE dictionary**, and Waytide's reserved terms where the approved word means something else. The `language` package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule states this level and its exception.
       2. **The `language` package's vocabulary**: the terms and substitutions that belong to no domain.
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
    5. A reader must not have to work out which case an entry is.
    6. **Why:** several vocabularies bind the same prose. A reader who finds a word in two of them cannot choose without a stated order.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. A package's `vocabulary.md` is binding.
    2. Use a package vocabulary's terms and substitutions in code, tests, rules, designs, commits, records, and dialogue.
    3. Give a package a vocabulary only when it has a specialized vocabulary for its domain.
    4. A package whose subject is written in ordinary words has no vocabulary, and that absence is correct, not missing.
    5. A vocabulary term is a glossary entry, and it says what the concept is.
    6. A substitution names two words: a word not to write, and the word to write instead.
    7. A discontinuation names one word: a word removed from use with nothing in its place.
    8. Do not file a substitution under the discontinuations heading, or a discontinuation under the substitutions heading. Keep the two under separate headings.
    9. A term Waytide did not coin is still a term, and it is entered as a term.
    10. Where a term's word was taken rather than coined, the entry says so in its own prose.
    11. A word's origin is not a kind of entry.
    12. When a word appears in more than one vocabulary, they decide in this order, from first to last: the STE dictionary; the `language` package's vocabulary; an individual package's vocabulary; the project's own vocabulary in `waytide/local/vocabulary.md`.
    13. At the STE level, Waytide's reserved terms decide where the STE-approved word means something else.
    14. When a word appears in two vocabularies, the more specific vocabulary decides.
    15. A project's own vocabulary is one file, `waytide/local/vocabulary.md`, beside `rules/`.
    16. The project vocabulary holds the terms and substitutions the project settles for itself, in the same shape a package's `vocabulary.md` has.
    17. The project vocabulary file takes no datetime prefix.
    18. The project vocabulary is read at session start, with `waytide/system/` and `waytide/local/rules/`.
    19. `session-start.sh` names the project vocabulary in its read instruction.
    20. The `AGENTS.md` bootstrap names the project vocabulary.
    21. The project vocabulary is optional, and its absence is not a defect.
    22. The project vocabulary is not a rule, and it does not live in `rules/`.
    23. The `language` vocabulary says that it holds the substitutions that belong to no domain.
    24. A domain-specific substitution belongs in its own package's vocabulary.
    25. A package entry that narrows a general term does not displace the general entry. It rests on it.
    26. Where a package narrows a term, its entry names the general term it narrows.
    27. Where a package keeps a word that the `language` vocabulary substitutes away, its entry says so and gives the reason.
    28. An entry says whether it narrows the general term or replaces it, so a reader does not have to work out which case it is.
    29. Put a term in the vocabulary of the package whose domain it belongs to.
    30. Put a domain-less term or substitution in the `language` vocabulary.
    31. Put a term a project settles for itself in `waytide/local/vocabulary.md`.
    32. Do not write `waytide/local/vocabulary.md` until there is a term to write in it.

### Checker A

    1. kept: "It is binding."
    2. kept: "Use its terms and substitutions in code, tests, rules, designs, commits, records, and dialogue."
    3. kept: "Give a package a vocabulary only when its domain has specialized words."
    4. kept: "A package whose subject is written in ordinary words has no vocabulary. The absence is correct, not missing."
    5. kept: "A term is a glossary entry, and it says what the concept is."
    6. kept: "Substitutions name a word not to write, and the word to write instead." / "A substitution names two words."
    7. kept: "Discontinuations name a word removed from use with nothing in its place." / "A discontinuation names one."
    8. kept: "Keep substitutions and discontinuations under separate headings. Do not file one under the other's heading."
    9. less precise: "A word Waytide did not coin is still a term when the vocabulary says what it means." Missing: the statement is now conditional ("when the vocabulary says what it means"), and it does not say the word is entered as a term.
    10. kept: "Where a word was taken rather than coined, the entry says so in its own prose."
    11. kept: "That statement is an **origin**, not a kind of entry."
    12. kept: "They decide in this order, from the one that decides first: The STE dictionary ... The `language` package's vocabulary ... An individual package's vocabulary ... The project's own vocabulary, in `waytide/local/vocabulary.md`"
    13. kept: "The STE dictionary, and Waytide's reserved terms where the approved word means something else."
    14. kept: "When a word appears in two vocabularies, the more specific one decides."
    15. kept: "It is one file, beside `rules/`"
    16. kept: "holding the terms and substitutions a project settles for itself." / "It has the same shape as a package's `vocabulary.md`."
    17. kept: "It takes no datetime prefix."
    18. kept: "It is read at session start, with `waytide/system/` and `waytide/local/rules/`."
    19. kept: "`session-start.sh` names it in the read instruction."
    20. kept: "The `AGENTS.md` bootstrap names it too."
    21. kept: "It is optional, and its absence is not a defect."
    22. kept: "It is not a rule. Do not put it in `rules/`."
    23. less precise: "The `language` package's vocabulary: the terms and substitutions that belong to no domain." Missing: it describes what the vocabulary holds, but it does not require the `language` vocabulary itself to state this.
    24. kept: "An individual package's vocabulary: the terms and substitutions of one domain." / "Put a term in the vocabulary of the package whose domain it belongs to."
    25. kept: "The narrower entry rests on the general one and does not displace it."
    26. kept: "Where a package narrows a term, its entry names the general term it narrows."
    27. kept: "Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason."
    28. less precise: "A reader must not have to work out which case an entry is." Missing: no explicit direction that the entry states whether it narrows or replaces the general term, and "replaces" is not named as a case.
    29. kept: "Put a term in the vocabulary of the package whose domain it belongs to."
    30. kept: "Put a domain-less term or substitution in `language`."
    31. kept: "holding the terms and substitutions a project settles for itself" / "which a project writes for itself"
    32. kept: "Write no such file until there is a term to write."

### Checker B

    1. kept — "It is binding."
    2. kept — "Use its terms and substitutions in code, tests, rules, designs, commits, records, and dialogue."
    3. kept — "Give a package a vocabulary only when its domain has specialized words."
    4. kept — "A package whose subject is written in ordinary words has no vocabulary. The absence is correct, not missing."
    5. kept — "A term is a glossary entry, and it says what the concept is."
    6. kept — "Substitutions name a word not to write, and the word to write instead." / "A substitution names two words."
    7. kept — "Discontinuations name a word removed from use with nothing in its place." / "A discontinuation names one."
    8. kept — "Keep substitutions and discontinuations under separate headings. Do not file one under the other's heading."
    9. less precise — "A word Waytide did not coin is still a term when the vocabulary says what it means." Missing: the original is unconditional, and it says the word is entered as a term. The shorter version adds a condition ("when the vocabulary says what it means").
    10. kept — "Where a word was taken rather than coined, the entry says so in its own prose."
    11. kept — "That statement is an **origin**, not a kind of entry."
    12. kept — "They decide in this order, from the one that decides first: The STE dictionary ... The `language` package's vocabulary ... An individual package's vocabulary ... The project's own vocabulary, in `waytide/local/vocabulary.md`"
    13. kept — "The STE dictionary, and Waytide's reserved terms where the approved word means something else."
    14. kept — "When a word appears in two vocabularies, the more specific one decides."
    15. kept — "It is one file, beside `rules/`"
    16. kept — "holding the terms and substitutions a project settles for itself." / "It has the same shape as a package's `vocabulary.md`."
    17. kept — "It takes no datetime prefix."
    18. kept — "It is read at session start, with `waytide/system/` and `waytide/local/rules/`."
    19. kept — "`session-start.sh` names it in the read instruction."
    20. kept — "The `AGENTS.md` bootstrap names it too."
    21. kept — "It is optional, and its absence is not a defect."
    22. kept — "It is not a rule. Do not put it in `rules/`."
    23. less precise — "The `language` package's vocabulary: the terms and substitutions that belong to no domain." Missing: this only describes the level. It does not require the `language` vocabulary itself to say this.
    24. less precise — "An individual package's vocabulary: the terms and substitutions of one domain." / "Put a term in the vocabulary of the package whose domain it belongs to." Missing: the instruction names only terms. Substitutions are only described, and the original states that a domain-specific substitution belongs in its own package's vocabulary.
    25. kept — "The narrower entry rests on the general one and does not displace it."
    26. kept — "Where a package narrows a term, its entry names the general term it narrows."
    27. kept — "Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason."
    28. less precise — "A reader must not have to work out which case an entry is." Missing: an explicit requirement that the entry state whether it narrows or replaces the general term.
    29. kept — "Put a term in the vocabulary of the package whose domain it belongs to."
    30. kept — "Put a domain-less term or substitution in `language`."
    31. kept — "It is one file, beside `rules/`, holding the terms and substitutions a project settles for itself."
    32. kept — "Write no such file until there is a term to write."

### The re-check, after the repairs

    1. kept — "It is binding."
    2. kept — "Use its terms and substitutions in code, tests, rules, designs, commits, records, and dialogue."
    3. kept — "Give a package a vocabulary only when its domain has specialized words."
    4. kept — "A package whose subject is written in ordinary words has no vocabulary. The absence is correct, not missing."
    5. kept — "A term is a glossary entry, and it says what the concept is."
    6. kept — "Substitutions name a word not to write, and the word to write instead." / "A substitution names two words."
    7. kept — "Discontinuations name a word removed from use with nothing in its place." / "A discontinuation names one."
    8. kept — "Keep substitutions and discontinuations under separate headings. Do not file one under the other's heading."
    9. kept — "A word Waytide did not coin is still a term, and is entered as one."
    10. kept — "Where a word was taken rather than coined, the entry says so in its own prose."
    11. kept — "That statement is an **origin**, not a kind of entry."
    12. kept — "They decide in this order, from the one that decides first: The STE dictionary ... The `language` package's vocabulary ... An individual package's vocabulary ... The project's own vocabulary, in `waytide/local/vocabulary.md`"
    13. less precise — "The STE dictionary, and Waytide's reserved terms where the approved word means something else ... states this level and its exception." Missing: it lists the reserved terms beside the STE dictionary but does not say outright that they decide over the STE-approved word. Only the word "exception" suggests this.
    14. kept — "When a word appears in two vocabularies, the more specific one decides."
    15. kept — "It is one file, beside `rules/`"
    16. kept — "holding the terms and substitutions a project settles for itself" / "It has the same shape as a package's `vocabulary.md`."
    17. kept — "It takes no datetime prefix."
    18. kept — "It is read at session start, with `waytide/system/` and `waytide/local/rules/`."
    19. kept — "`session-start.sh` names it in the read instruction."
    20. kept — "The `AGENTS.md` bootstrap names it too."
    21. kept — "It is optional, and its absence is not a defect."
    22. kept — "It is not a rule. Do not put it in `rules/`."
    23. kept — "the terms and substitutions that belong to no domain. The `language` vocabulary says so itself."
    24. kept — "Put a domain-specific substitution in its own package's vocabulary."
    25. kept — "The narrower entry rests on the general one and does not displace it."
    26. kept — "Where a package narrows a term, its entry names the general term it narrows."
    27. kept — "Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason."
    28. kept — "A reader must not have to work out which case an entry is. The entry says whether it narrows or replaces the general term."
    29. kept — "Put a term in the vocabulary of the package whose domain it belongs to."
    30. kept — "Put a domain-less term or substitution in `language`."
    31. kept — "holding the terms and substitutions a project settles for itself" / "The project's own vocabulary, in `waytide/local/vocabulary.md`, which a project writes for itself." This is a description, not an instruction, but it still requires the same placement.
    32. kept — "Write no such file until there is a term to write."

## when-the-work-diverges-from-the-plan-the-work-is-definitive

### The compressor's answer

    1. When the work diverges from the plan, the work is definitive.
    2. Do not update the plan to reflect the work as if the plan had been perfectly prescient.
    3. A plan that did not predict what happened is not defective.
    4. A plan is not owed an amendment every time the work moves past it.
    5. A divergence is not a pending reconciliation.
    6. Where the work has simply gone further than the plan foresaw, nothing is outstanding.
    7. Do not list such a plan as needing an update.

    ## What this does not reach

    1. Where the work shows the plan's intent is mistaken, not merely incomplete, correct the plan.
    2. The test is whether the plan still says what the work should be. It is not whether the plan says what the work turned out to be.
    3. The engineer may amend a plan for their own reasons at any time, by dated addition.
    4. This rule removes an obligation, not a permission.
    5. Per the work-sessions-convention, either side may be stale, and only the engineer can say which.
    6. This rule settles the ordinary case and leaves that judgment with the engineer.

    ## How to apply

    1. When the work has gone past what the plan describes, leave the plan as written.
    2. Do not list the divergence as a reconciliation.
    3. Do not offer to bring the plan into line.
    4. Correct a plan where its direction is wrong.
    5. Amend a plan by dated addition where the engineer asks.
    6. **Why:** a plan edited to match the work stops being a statement of intent. It becomes unfalsifiable, so nothing is learned from having written it.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. When the work diverges from the plan, treat the work as definitive.
    2. A plan does not need to be updated to reflect the work as if it had been perfectly prescient.
    3. Do not treat a plan that did not predict what happened as defective.
    4. A plan is not owed an amendment every time the work moves past it.
    5. Do not treat a divergence as a pending reconciliation; where the work has simply gone further than the plan foresaw, nothing is outstanding.
    6. Where the work has gone further than the plan foresaw, do not list the plan as needing an update.
    7. Where the work has shown the plan's intent (its direction) to be mistaken rather than merely incomplete, make the correction to the plan.
    8. To decide whether a plan needs correcting, test whether the plan still says what the work should be, not whether it says what the work turned out to be.
    9. The engineer may amend a plan for their own reasons at any time.
    10. An amendment to a plan is made by dated addition.
    11. Only the engineer can say which side, plan or work, is stale when a design may be right about a direction the work drifted from; leave that judgment with the engineer.
    12. When the work has gone past what the plan describes, leave the plan as written.
    13. Do not list a divergence between the work and the plan as a reconciliation.
    14. Do not offer to bring the plan into line with the work.
    15. Where the engineer asks, amend the plan by dated addition.

### Checker A

    1. kept: "When the work diverges from the plan, the work is definitive."
    2. less precise: "Do not update the plan to reflect the work as if the plan had been perfectly prescient." Missing: the original says there is no obligation to update. The shorter version turns that into a prohibition, which sits uneasily with its own "This rule removes an obligation, not a permission."
    3. kept: "A plan that did not predict what happened is not defective."
    4. kept: "A plan is not owed an amendment every time the work moves past it."
    5. kept: "A divergence is not a pending reconciliation." / "Where the work has simply gone further than the plan foresaw, nothing is outstanding."
    6. kept: "Do not list such a plan as needing an update."
    7. kept: "Where the work shows the plan's intent is mistaken, not merely incomplete, correct the plan." / "Correct a plan where its direction is wrong."
    8. kept: "The test is whether the plan still says what the work should be. It is not whether the plan says what the work turned out to be."
    9. kept: "The engineer may amend a plan for their own reasons at any time"
    10. kept: "by dated addition" / "Amend a plan by dated addition"
    11. kept: "either side may be stale, and only the engineer can say which." / "leaves that judgment with the engineer." (The specific case, a design that may be right about a direction the work drifted from, is not spelled out, but the shorter version still requires the same behavior.)
    12. kept: "When the work has gone past what the plan describes, leave the plan as written."
    13. kept: "Do not list the divergence as a reconciliation."
    14. kept: "Do not offer to bring the plan into line." (It leaves out "with the work", but the meaning is clear from context.)
    15. kept: "Amend a plan by dated addition where the engineer asks."

### Checker B

    1. kept — "When the work diverges from the plan, the work is definitive."
    2. less precise — "Do not update the plan to reflect the work as if the plan had been perfectly prescient." Missing: the original only says there is no need to update. The shorter version makes it a prohibition, which also sits against its own "This rule removes an obligation, not a permission."
    3. kept — "A plan that did not predict what happened is not defective."
    4. kept — "A plan is not owed an amendment every time the work moves past it."
    5. kept — "A divergence is not a pending reconciliation." / "Where the work has simply gone further than the plan foresaw, nothing is outstanding."
    6. kept — "Do not list such a plan as needing an update."
    7. kept — "Where the work shows the plan's intent is mistaken, not merely incomplete, correct the plan." / "Correct a plan where its direction is wrong."
    8. kept — "The test is whether the plan still says what the work should be. It is not whether the plan says what the work turned out to be."
    9. kept — "The engineer may amend a plan for their own reasons at any time"
    10. kept — "by dated addition" / "Amend a plan by dated addition"
    11. less precise — "either side may be stale, and only the engineer can say which" / "leaves that judgment with the engineer." Missing: the condition it applies to, a design that may be right about a direction the work drifted from.
    12. kept — "When the work has gone past what the plan describes, leave the plan as written."
    13. kept — "Do not list the divergence as a reconciliation."
    14. kept — "Do not offer to bring the plan into line."
    15. kept — "Amend a plan by dated addition where the engineer asks."

### The re-check, after the repairs

    1. kept — "When the work diverges from the plan, the work is definitive."
    2. kept — "The plan need not be updated to reflect the work as if the plan had been perfectly prescient."
    3. kept — "A plan that did not predict what happened is not defective."
    4. kept — "A plan is not owed an amendment every time the work moves past it."
    5. kept — "A divergence is not a pending reconciliation." / "Where the work has simply gone further than the plan foresaw, nothing is outstanding."
    6. kept — "Do not list such a plan as needing an update."
    7. kept — "Where the work shows the plan's intent is mistaken, not merely incomplete, correct the plan." / "Correct a plan where its direction is wrong."
    8. kept — "The test is whether the plan still says what the work should be. It is not whether the plan says what the work turned out to be."
    9. kept — "The engineer may amend a plan for their own reasons at any time"
    10. less precise — "by dated addition" (in "The engineer may amend a plan ... by dated addition"; "Amend a plan by dated addition where the engineer asks"). Missing: dated addition is attached only to amendments the engineer makes or asks for. It is not stated as the method for every amendment, for example a correction under directive 7.
    11. kept — "either side may be stale, and only the engineer can say which. A design may be right about a direction the work drifted from." / "leaves that judgment with the engineer."
    12. kept — "When the work has gone past what the plan describes, leave the plan as written."
    13. kept — "Do not list the divergence as a reconciliation."
    14. kept — "Do not offer to bring the plan into line."
    15. kept — "Amend a plan by dated addition where the engineer asks."

## work-sessions-convention

### The compressor's answer

    1. `waytide/local/logs/work-sessions/` holds work session records.
    2. A work session record is the chronological narrative of one discrete work session between an engineer and Claude.
    3. A work session is a unit of the engineer's work. It may last hours, a day, or longer.
    4. The discrete piece of work sets a work session's boundaries, not a fixed clock.
    5. A work session record is the guided tour of the work session. It gives what was asked and concluded at each step, in order.
    6. It defines settled vocabulary as that vocabulary arises.
    7. It is written for a person to read. Its job is orientation and reasoning, not truth-of-record.
    8. It is not the source of truth. The durable records are authoritative.
    9. The durable records are the binding rules (`waytide/system/`, `waytide/local/rules/`), the items (`waytide/local/items/`), the decision log (`waytide/local/logs/log/`), and the implementation records (`waytide/local/implementations/`).
    10. The record points to the durable records throughout. It does not restate them.
    11. The record keeps the reasoning behind each fork in the work.
    12. Write a record at the close of a work session that produced substantial dialogue, decisions, or discovery worth keeping as a narrative.
    13. Write it when the engineer asks. Or propose it when the agent sees the work session has built up such work.
    14. A trivial work session needs no record. A record is not required for every session.
    15. When the agent raises the question of recording, it asks through the **AskUserQuestion** selection UI. It does not ask in free-text prose.
    16. The prompt offers three options, each naming a **work session record**: **write a new work session record**, **append the previous work session record**, or **don't write a work session record**.
    17. The engineer's selection decides.
    18. The prompt always says "work session", never the shortened "session".
    19. A direct instruction from the engineer to write or append a record needs no prompt.
    20. Name a record with the ISO-8601-UTC filename prefix, per the file-names rule: `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.

    ## The shape of a work session record

    1. Title the record `# Work Session — <name> (<date>)`.
    2. Records written before 2026-08-03 are titled `# Session — …`. Keep those titles. Do not retitle them.
    3. The parts appear in the order below.
    4. **Opening summary**: a short paragraph naming what the work session was, as its arc. For example, it began as X, became Y, and ended with Z.
    5. **Framing note**: states that this is the communicable record, or guided tour. It states that the durable records it points to are the source of truth.
    6. **Chronological body**: numbered sections (`## 1.`, `## 2.`, …) walking the work session in order.
    7. Each section states what was asked and concluded at that step.
    8. Each section defines settled vocabulary as it arises.
    9. Each section points inline to the durable records that step produced.
    10. **Takeaways**: the settled conclusions, compressed to a few bullets.
    11. **Glossary**: the terms settled during the work session, each with its literal definition.
    12. **Where the durable records live**: pointers to the rules, observations, log entries, experiments, and code the work session produced.
    13. Optionally, a **reflective closing note** on the work session itself.
    14. A **provenance footer**: the record ends with the `Authored by … / Changed by …` footer, like every working-state artifact.
    15. The footer follows the working-state-artifacts-carry-a-provenance-footer rule and the record-rule-authorship-in-a-footer format.
    16. A work session record is not shaped like a plan. It records the past.

    ## Reconcile the settled direction once the record is written

    1. "Design" here means whichever settled item the work session bears on, whatever its kind tag.
    2. After the record is written, ask the engineer about the design through the AskUserQuestion selection UI.
    3. Ask whether the work session's output changes the design, or whether the design has fallen behind it.
    4. Offer three options: **update the design**, **the design stands**, or **no design bears on this work session**.
    5. Ask this every time a record is written. No other threshold applies.
    6. Surface the candidates. Do not decide.
    7. Name what the work session settled that the design does not reflect.
    8. Name anything the design asserts that the work session contradicts.
    9. Either side may be the stale one. Only the engineer can say which.
    10. Change neither the design nor the records on your own initiative.
    11. Reconcile a design. Never regenerate it from the records or the work downstream of it.
    12. A design's Out of Scope / Deferred section and its settled-but-unbuilt direction exist nowhere in the records. So read the design against the records rather than rebuilding it.
    13. Where no design exists, or nothing in the work session bears on one, say so and move on.
    14. Do not invent a divergence to justify the prompt.
    15. **Why:** durable records capture what was decided. A work session's reasoning, arc, forks, and settled vocabulary are easy to lose and costly to rebuild. The narrative keeps them, as a route through the records rather than a second source of truth.

    CONTRADICTIONS: The source says "The prompt always says 'work session'", but its How to apply gives the third design-reconciliation option as "no design bears on this session", while the section above gives it as "no design bears on this work session". (Applied to the reconciliation prompt, the "always says work session" rule is placed in the recording-prompt bullet, so its scope is arguably only the recording prompt; but the two wordings of the third option still differ.)

### The directives, as the listing agent gave them

    1. Work session records are kept in `waytide/local/logs/work-sessions/`.
    2. A work session's boundaries are set by the discrete piece of the engineer's work, not by a fixed clock. A work session may run a few hours, a whole day, or more than a day.
    3. A work session record must be the guided tour of the work session: what was asked and what was concluded at each step, in order, with the settled vocabulary defined as it arises.
    4. A work session record is written to be read by a person. Its job is orientation and reasoning, not truth-of-record.
    5. A work session record is not the source of truth. The binding rules (`waytide/system/`, `waytide/local/rules/`), the items (`waytide/local/items/`), the decision log (`waytide/local/logs/log/`) and the implementation records (`waytide/local/implementations/`) are authoritative.
    6. A work session record points to the durable records throughout. It does not restate them.
    7. A work session record ties the durable records together as a narrative. It preserves the arc of the work session and the reasoning behind each fork.
    8. A work session record is written at the close of a work session that produced substantial dialogue, decisions or discovery worth a durable narrative. It is written either because the engineer requests it or because the agent recognizes that such work has accumulated and proposes recording it.
    9. A trivial work session needs no record. A work session record is not required for every session.
    10. When the agent itself raises the question of recording a work session, it must ask through the AskUserQuestion selection UI, not as a free-text prose question.
    11. The recording prompt offers three options, each of which names it a "work session record": write a new work session record, append the previous work session record, or don't write a work session record.
    12. The engineer's selection in the recording prompt decides whether and how the record is written.
    13. The recording prompt always says "work session", never the shortened "session".
    14. When the engineer directly instructs the agent to write or append a work session record, no recording prompt is needed.
    15. A work session record's filename takes the ISO-8601-UTC prefix: `YYYY-MM-DDTHH-MM-SSZ-<name>.md`.
    16. A work session record is titled `# Work Session — <name> (<date>)`.
    17. Work session records written before 2026-08-03, titled `# Session — …`, keep those titles and must not be retitled.
    18. The sections of a work session record appear in this fixed order: opening summary, framing note, chronological body, takeaways, glossary, where the durable records live, an optional reflective closing note, and the provenance footer.
    19. The opening summary is a short paragraph naming what the work session was: its arc (it began as X, became Y, and ended with Z).
    20. The framing note states that the record is the communicable record or guided tour, and that the durable records it points to are the source of truth.
    21. The chronological body walks the work session in order in numbered sections (`## 1.`, `## 2.`, …). Each section states what was asked and concluded at that step, defines settled vocabulary as it arises, and gives inline pointers to the durable records the step produced.
    22. The takeaways section compresses the settled conclusions to a few bullets.
    23. The glossary lists the terms settled during the work session, each with its literal definition.
    24. The "where the durable records live" section gives pointers to the rules, observations, log entries, experiments and code the work session produced.
    25. A work session record may include a reflective closing note on the work session itself.
    26. A work session record ends with the `Authored by … / Changed by …` provenance footer, in the record-rule-authorship-in-a-footer format.
    27. In the reconciliation step, "design" means whichever settled item the work session bears on, whatever its kind tag.
    28. After the work session record is written, the agent must put the design reconciliation to the engineer through the AskUserQuestion selection UI: does what this work session produced change the design, or has the design fallen behind it?
    29. The design reconciliation prompt offers three options: update the design, the design stands, or no design bears on this work session.
    30. In the design reconciliation, the agent names what the work session settled that the design does not reflect, and anything the design asserts that the work session contradicts.
    31. In the design reconciliation, the agent does not decide which side is right. The verdict is left to the engineer.
    32. In the design reconciliation, either side may be the stale one: the design may be out of date, or the work may have drifted from a direction the design has right.
    33. A design is reconciled, never regenerated from the work downstream of it.
    34. The agent reads the records against the design and changes neither on its own initiative.
    35. Where the project has no design, or the work session produced nothing that bears on one, the agent says so and moves on.
    36. The agent must not invent a divergence to justify the reconciliation prompt.
    37. The work session record format is defined in this directory convention, alongside the directory itself.
    38. A work session record is not shaped like a plan. It records the past.

### Checker A

    1. kept — "`waytide/local/logs/work-sessions/` holds work session records."
    2. kept — "The discrete piece of work sets a work session's boundaries, not a fixed clock." / "It may last hours, a day, or longer."
    3. kept — "A work session record is the guided tour of the work session. It gives what was asked and concluded at each step, in order." / "It defines settled vocabulary as that vocabulary arises."
    4. kept — "It is written for a person to read. Its job is orientation and reasoning, not truth-of-record."
    5. kept — "It is not the source of truth. The durable records are authoritative." / "The durable records are the binding rules (`waytide/system/`, `waytide/local/rules/`), the items (`waytide/local/items/`), the decision log (`waytide/local/logs/log/`), and the implementation records (`waytide/local/implementations/`)."
    6. kept — "The record points to the durable records throughout. It does not restate them."
    7. kept — "The record keeps the reasoning behind each fork in the work." / "A work session record is the chronological narrative" / "A work session's reasoning, arc, forks, and settled vocabulary ... The narrative keeps them, as a route through the records"
    8. kept — "Write a record at the close of a work session that produced substantial dialogue, decisions, or discovery worth keeping as a narrative." / "Write it when the engineer asks. Or propose it when the agent sees the work session has built up such work."
    9. kept — "A trivial work session needs no record. A record is not required for every session."
    10. kept — "When the agent raises the question of recording, it asks through the **AskUserQuestion** selection UI. It does not ask in free-text prose."
    11. kept — "The prompt offers three options, each naming a **work session record**: **write a new work session record**, **append the previous work session record**, or **don't write a work session record**."
    12. kept — "The engineer's selection decides."
    13. kept — "The prompt always says \"work session\", never the shortened \"session\"."
    14. kept — "A direct instruction from the engineer to write or append a record needs no prompt."
    15. kept — "Name a record with the ISO-8601-UTC filename prefix, per the file-names rule: `YYYY-MM-DDTHH-MM-SSZ-<name>.md`."
    16. kept — "Title the record `# Work Session — <name> (<date>)`."
    17. kept — "Records written before 2026-08-03 are titled `# Session — …`. Keep those titles. Do not retitle them."
    18. kept — "The parts appear in the order below." (followed by the parts in the same order: opening summary, framing note, chronological body, takeaways, glossary, where the durable records live, optional reflective closing note, provenance footer)
    19. kept — "**Opening summary**: a short paragraph naming what the work session was, as its arc. For example, it began as X, became Y, and ended with Z."
    20. kept — "**Framing note**: states that this is the communicable record, or guided tour. It states that the durable records it points to are the source of truth."
    21. kept — "**Chronological body**: numbered sections (`## 1.`, `## 2.`, …) walking the work session in order." / "Each section states what was asked and concluded at that step." / "Each section defines settled vocabulary as it arises." / "Each section points inline to the durable records that step produced."
    22. kept — "**Takeaways**: the settled conclusions, compressed to a few bullets."
    23. kept — "**Glossary**: the terms settled during the work session, each with its literal definition."
    24. kept — "**Where the durable records live**: pointers to the rules, observations, log entries, experiments, and code the work session produced."
    25. kept — "Optionally, a **reflective closing note** on the work session itself."
    26. kept — "the record ends with the `Authored by … / Changed by …` footer" / "The footer follows ... the record-rule-authorship-in-a-footer format."
    27. kept — "\"Design\" here means whichever settled item the work session bears on, whatever its kind tag."
    28. kept — "After the record is written, ask the engineer about the design through the AskUserQuestion selection UI." / "Ask whether the work session's output changes the design, or whether the design has fallen behind it."
    29. kept — "Offer three options: **update the design**, **the design stands**, or **no design bears on this work session**."
    30. kept — "Name what the work session settled that the design does not reflect." / "Name anything the design asserts that the work session contradicts."
    31. kept — "Surface the candidates. Do not decide." / "Only the engineer can say which."
    32. kept — "Either side may be the stale one."
    33. kept — "Reconcile a design. Never regenerate it from the records or the work downstream of it."
    34. kept — "read the design against the records rather than rebuilding it" / "Change neither the design nor the records on your own initiative."
    35. kept — "Where no design exists, or nothing in the work session bears on one, say so and move on."
    36. kept — "Do not invent a divergence to justify the prompt."
    37. less precise — "## The shape of a work session record" (under the directory's own heading). Missing: no sentence says the format is defined in this directory convention, alongside the directory itself. The file only shows it by containing the section.
    38. kept — "A work session record is not shaped like a plan. It records the past."

### Checker B

    1. kept: "`waytide/local/logs/work-sessions/` holds work session records."
    2. kept: "The discrete piece of work sets a work session's boundaries, not a fixed clock." / "It may last hours, a day, or longer."
    3. kept: "A work session record is the guided tour of the work session. It gives what was asked and concluded at each step, in order." / "It defines settled vocabulary as that vocabulary arises."
    4. kept: "It is written for a person to read. Its job is orientation and reasoning, not truth-of-record."
    5. kept: "It is not the source of truth. The durable records are authoritative." / "The durable records are the binding rules (`waytide/system/`, `waytide/local/rules/`), the items (`waytide/local/items/`), the decision log (`waytide/local/logs/log/`), and the implementation records (`waytide/local/implementations/`)."
    6. kept: "The record points to the durable records throughout. It does not restate them."
    7. less precise: "The record keeps the reasoning behind each fork in the work." / "a work session's reasoning, arc, forks ... The narrative keeps them, as a route through the records". Missing: preserving the arc and tying the durable records together as a narrative appear only in the Why rationale, not as a directive.
    8. kept: "Write a record at the close of a work session that produced substantial dialogue, decisions, or discovery worth keeping as a narrative." / "Write it when the engineer asks. Or propose it when the agent sees the work session has built up such work."
    9. kept: "A trivial work session needs no record. A record is not required for every session."
    10. kept: "When the agent raises the question of recording, it asks through the **AskUserQuestion** selection UI. It does not ask in free-text prose."
    11. kept: "The prompt offers three options, each naming a **work session record**: **write a new work session record**, **append the previous work session record**, or **don't write a work session record**."
    12. kept: "The engineer's selection decides."
    13. kept: "The prompt always says "work session", never the shortened "session"."
    14. kept: "A direct instruction from the engineer to write or append a record needs no prompt."
    15. kept: "Name a record with the ISO-8601-UTC filename prefix, per the file-names rule: `YYYY-MM-DDTHH-MM-SSZ-<name>.md`."
    16. kept: "Title the record `# Work Session — <name> (<date>)`."
    17. kept: "Records written before 2026-08-03 are titled `# Session — …`. Keep those titles. Do not retitle them."
    18. kept: "The parts appear in the order below." (followed by opening summary, framing note, chronological body, takeaways, glossary, where the durable records live, optional reflective closing note, provenance footer)
    19. kept: "**Opening summary**: a short paragraph naming what the work session was, as its arc. For example, it began as X, became Y, and ended with Z."
    20. kept: "**Framing note**: states that this is the communicable record, or guided tour. It states that the durable records it points to are the source of truth."
    21. kept: "numbered sections (`## 1.`, `## 2.`, …) walking the work session in order." / "Each section states what was asked and concluded at that step." / "Each section defines settled vocabulary as it arises." / "Each section points inline to the durable records that step produced."
    22. kept: "**Takeaways**: the settled conclusions, compressed to a few bullets."
    23. kept: "**Glossary**: the terms settled during the work session, each with its literal definition."
    24. kept: "**Where the durable records live**: pointers to the rules, observations, log entries, experiments, and code the work session produced."
    25. kept: "Optionally, a **reflective closing note** on the work session itself."
    26. kept: "the record ends with the `Authored by … / Changed by …` footer" / "The footer follows ... the record-rule-authorship-in-a-footer format."
    27. kept: ""Design" here means whichever settled item the work session bears on, whatever its kind tag."
    28. kept: "After the record is written, ask the engineer about the design through the AskUserQuestion selection UI." / "Ask whether the work session's output changes the design, or whether the design has fallen behind it."
    29. kept: "Offer three options: **update the design**, **the design stands**, or **no design bears on this work session**."
    30. kept: "Name what the work session settled that the design does not reflect." / "Name anything the design asserts that the work session contradicts."
    31. kept: "Surface the candidates. Do not decide." / "Only the engineer can say which."
    32. kept: "Either side may be the stale one."
    33. kept: "Reconcile a design. Never regenerate it from the records or the work downstream of it."
    34. kept: "Change neither the design nor the records on your own initiative." / "read the design against the records rather than rebuilding it."
    35. kept: "Where no design exists, or nothing in the work session bears on one, say so and move on."
    36. kept: "Do not invent a divergence to justify the prompt."
    37. less precise: no quotable words. The format sits in the same document as the directory definition (the "## The shape of a work session record" section), but the shorter version never says the format is defined in this directory convention. Missing: an explicit statement of where the format is defined.
    38. kept: "A work session record is not shaped like a plan. It records the past."

### The re-check, after the repairs

    1 — kept — "`waytide/local/logs/work-sessions/` holds work session records."
    2 — kept — "The discrete piece of work sets a work session's boundaries, not a fixed clock." / "It may last hours, a day, or longer."
    3 — kept — "A work session record is the guided tour of the work session. It gives what was asked and concluded at each step, in order." / "It defines settled vocabulary as that vocabulary arises."
    4 — kept — "It is written for a person to read. Its job is orientation and reasoning, not truth-of-record."
    5 — kept — "It is not the source of truth. The durable records are authoritative." / "The durable records are the binding rules (`waytide/system/`, `waytide/local/rules/`), the items (`waytide/local/items/`), the decision log (`waytide/local/logs/log/`), and the implementation records (`waytide/local/implementations/`)."
    6 — kept — "The record points to the durable records throughout. It does not restate them."
    7 — kept — "The record keeps the reasoning behind each fork in the work. It ties the durable records together as a narrative and keeps the arc."
    8 — kept — "Write a record at the close of a work session that produced substantial dialogue, decisions, or discovery worth keeping as a narrative." / "Write it when the engineer asks. Or propose it when the agent sees the work session has built up such work."
    9 — kept — "A trivial work session needs no record. A record is not required for every session."
    10 — kept — "When the agent raises the question of recording, it asks through the **AskUserQuestion** selection UI. It does not ask in free-text prose."
    11 — kept — "The prompt offers three options, each naming a **work session record**: **write a new work session record**, **append the previous work session record**, or **don't write a work session record**."
    12 — kept — "The engineer's selection decides."
    13 — kept — "The prompt always says "work session", never the shortened "session"."
    14 — kept — "A direct instruction from the engineer to write or append a record needs no prompt."
    15 — kept — "Name a record with the ISO-8601-UTC filename prefix, per the file-names rule: `YYYY-MM-DDTHH-MM-SSZ-<name>.md`."
    16 — kept — "Title the record `# Work Session — <name> (<date>)`."
    17 — kept — "Records written before 2026-08-03 are titled `# Session — …`. Keep those titles. Do not retitle them."
    18 — kept — "The parts appear in the order below." (followed by the eight parts in the original's order)
    19 — kept — "**Opening summary**: a short paragraph naming what the work session was, as its arc. For example, it began as X, became Y, and ended with Z."
    20 — kept — "**Framing note**: states that this is the communicable record, or guided tour. It states that the durable records it points to are the source of truth."
    21 — kept — "**Chronological body**: numbered sections (`## 1.`, `## 2.`, …) walking the work session in order." / "Each section states what was asked and concluded at that step." / "Each section defines settled vocabulary as it arises." / "Each section points inline to the durable records that step produced."
    22 — kept — "**Takeaways**: the settled conclusions, compressed to a few bullets."
    23 — kept — "**Glossary**: the terms settled during the work session, each with its literal definition."
    24 — kept — "**Where the durable records live**: pointers to the rules, observations, log entries, experiments, and code the work session produced."
    25 — kept — "Optionally, a **reflective closing note** on the work session itself."
    26 — kept — "the record ends with the `Authored by … / Changed by …` footer" / "The footer follows ... the record-rule-authorship-in-a-footer format."
    27 — kept — ""Design" here means whichever settled item the work session bears on, whatever its kind tag."
    28 — kept — "After the record is written, ask the engineer about the design through the AskUserQuestion selection UI." / "Ask whether the work session's output changes the design, or whether the design has fallen behind it."
    29 — kept — "Offer three options: **update the design**, **the design stands**, or **no design bears on this work session**."
    30 — kept — "Name what the work session settled that the design does not reflect." / "Name anything the design asserts that the work session contradicts."
    31 — kept — "Surface the candidates. Do not decide." / "Only the engineer can say which."
    32 — kept — "Either side may be the stale one." (It drops the two examples, a design that is out of date and work that has drifted from a direction the design has right. The statement still requires the same behavior.)
    33 — kept — "Reconcile a design. Never regenerate it from the records or the work downstream of it."
    34 — kept — "Change neither the design nor the records on your own initiative." / "read the design against the records rather than rebuilding it."
    35 — kept — "Where no design exists, or nothing in the work session bears on one, say so and move on."
    36 — kept — "Do not invent a divergence to justify the prompt."
    37 — kept — "This convention defines that format, alongside the directory."
    38 — kept — "A work session record is not shaped like a plan. It records the past."

    Summary: the shorter version carries all 38 directives: 38 kept, 0 less precise, 0 lost. It also adds things the directive list does not have, such as "Ask this every time a record is written. No other threshold applies.", the Out of Scope / Deferred rationale, the Why paragraph, and the Related list. These were not judged, since the check covers only the listed directives.

## working-state-artifacts-carry-a-provenance-footer

### The compressor's answer

    1. Every working-state artifact under `waytide/` that is a document with a body ends with a **provenance footer**.
    2. The footer is the `Authored by … / Changed by …` block, in the record-rule-authorship-in-a-footer format, with a local human-readable datetime.
    3. The footer goes on every implementation record, whether an experiment or a feature.
    4. It goes on every item, whatever it is tagged, including designs, plans, observations, and deferred work.
    5. It goes on every loop record and every work session record.
    6. Write `Authored by <name> on <local datetime>` for the original author, on creation.
    7. Append a `Changed by <name> on <local datetime>` line for each later change, oldest first.
    8. Never rewrite an existing footer line.
    9. The datetime is the artifact's true authoring time.
    10. For a dated artifact, its ISO-8601-UTC filename prefix is the authoritative creation time.
    11. A later git add-date from a migration is a false trail. Do not use it as the authoring time.

    ## The one exception — the decision log

    1. Do not add a footer to a `waytide/local/logs/log/` entry.
    2. A log entry is deliberately one line: a `# <title>`, with no body and no template. See the decision-log-convention.
    3. A log entry records who and when by its ISO-8601-UTC filename and its commit history, not by an in-file footer.
    4. **Why:** a working-state artifact is meant to be read on its own, so its provenance belongs in the file, not only in git history. This differs from the rule-file footer, which recovers history that `git subtree` strips. The decision log is exempt because its filename already carries its provenance, and a footer would break its one-line shape and its no-reformat rule.

    CONTRADICTIONS: none

### The directives, as the listing agent gave them

    1. Every working-state artifact under `waytide/` that is a document with a body must end with a provenance footer.
    2. The provenance footer is the `Authored by … / Changed by …` block, in the record-rule-authorship-in-a-footer format.
    3. The provenance footer's datetimes must be local, human-readable datetimes.
    4. Implementation records, both experiments and features, must carry the provenance footer.
    5. Items must carry the provenance footer, whatever they are tagged (designs, plans, observations, and deferred work among them).
    6. Loop records must carry the provenance footer.
    7. Work session records must carry the provenance footer.
    8. A working-state artifact should be useful on its own: a reader should not have to leave the file and query the git log to learn who wrote it and when.
    9. The original author is recorded as `Authored by <name> on <local datetime>`, written on creation.
    10. A `Changed by <name> on <local datetime>` line is appended to the footer for each later change.
    11. The footer's lines are kept oldest first.
    12. The footer's lines are never rewritten.
    13. The datetime in the footer must be the artifact's true authoring time.
    14. For a dated artifact whose ISO-8601-UTC filename prefix records when it was created, that prefix is the authoritative authoring time, not a later git add-date from a migration.
    15. Entries in the decision log (`waytide/local/logs/log/`) must not carry a provenance footer.
    16. A decision log entry must be one line: a `# <title>`, with no body and no template.
    17. The decision log records who and when by its ISO-8601-UTC filename and its commit history, not by an in-file footer.
    18. The justification for working-state footers (self-contained readability) is stated once, in this rule, and working-state conventions do not repeat it.

### Checker A

    17 of the 18 directives are kept and 1 is lost (18).

    1. kept: "Every working-state artifact under `waytide/` that is a document with a body ends with a **provenance footer**."
    2. kept: "The footer is the `Authored by … / Changed by …` block, in the record-rule-authorship-in-a-footer format"
    3. kept: "with a local human-readable datetime"
    4. kept: "The footer goes on every implementation record, whether an experiment or a feature."
    5. kept: "It goes on every item, whatever it is tagged, including designs, plans, observations, and deferred work."
    6. kept: "It goes on every loop record"
    7. kept: "and every work session record"
    8. kept: "a working-state artifact is meant to be read on its own, so its provenance belongs in the file, not only in git history"
    9. kept: "Write `Authored by <name> on <local datetime>` for the original author, on creation."
    10. kept: "Append a `Changed by <name> on <local datetime>` line for each later change"
    11. kept: "oldest first"
    12. kept: "Never rewrite an existing footer line."
    13. kept: "The datetime is the artifact's true authoring time."
    14. kept: "For a dated artifact, its ISO-8601-UTC filename prefix is the authoritative creation time" and "A later git add-date from a migration is a false trail. Do not use it as the authoring time."
    15. kept: "Do not add a footer to a `waytide/local/logs/log/` entry."
    16. kept: "A log entry is deliberately one line: a `# <title>`, with no body and no template."
    17. kept: "A log entry records who and when by its ISO-8601-UTC filename and its commit history, not by an in-file footer."
    18. lost. The shorter version gives the justification, but it never says the justification is stated only in this rule or that the working-state conventions do not repeat it.

### Checker B

    1. kept — "Every working-state artifact under `waytide/` that is a document with a body ends with a **provenance footer**."
    2. kept — "The footer is the `Authored by … / Changed by …` block, in the record-rule-authorship-in-a-footer format"
    3. kept — "with a local human-readable datetime"
    4. kept — "The footer goes on every implementation record, whether an experiment or a feature."
    5. kept — "It goes on every item, whatever it is tagged, including designs, plans, observations, and deferred work."
    6. kept — "It goes on every loop record"
    7. kept — "and every work session record"
    8. kept — "a working-state artifact is meant to be read on its own, so its provenance belongs in the file, not only in git history"
    9. kept — "Write `Authored by <name> on <local datetime>` for the original author, on creation."
    10. kept — "Append a `Changed by <name> on <local datetime>` line for each later change"
    11. kept — "oldest first"
    12. kept — "Never rewrite an existing footer line."
    13. kept — "The datetime is the artifact's true authoring time."
    14. kept — "For a dated artifact, its ISO-8601-UTC filename prefix is the authoritative creation time." / "A later git add-date from a migration is a false trail. Do not use it as the authoring time."
    15. kept — "Do not add a footer to a `waytide/local/logs/log/` entry."
    16. kept — "A log entry is deliberately one line: a `# <title>`, with no body and no template."
    17. kept — "A log entry records who and when by its ISO-8601-UTC filename and its commit history, not by an in-file footer."
    18. lost — nothing says the justification is stated only in this rule, or that working-state conventions must not repeat it. The Related list says the conventions "reference this one", which does not forbid repeating it.

### The re-check, after the repairs

    1. kept: "Every working-state artifact under `waytide/` that is a document with a body ends with a **provenance footer**."
    2. kept: "The footer is the `Authored by … / Changed by …` block, in the record-rule-authorship-in-a-footer format"
    3. kept: "with a local human-readable datetime"
    4. kept: "The footer goes on every implementation record, whether an experiment or a feature."
    5. kept: "It goes on every item, whatever it is tagged, including designs, plans, observations, and deferred work."
    6. kept: "It goes on every loop record"
    7. kept: "and every work session record"
    8. kept: "a working-state artifact is meant to be read on its own, so its provenance belongs in the file, not only in git history"
    9. kept: "Write `Authored by <name> on <local datetime>` for the original author, on creation."
    10. kept: "Append a `Changed by <name> on <local datetime>` line for each later change"
    11. kept: "oldest first"
    12. kept: "Never rewrite an existing footer line."
    13. kept: "The datetime is the artifact's true authoring time."
    14. kept: "For a dated artifact, its ISO-8601-UTC filename prefix is the authoritative creation time." together with "A later git add-date from a migration is a false trail. Do not use it as the authoring time."
    15. kept: "Do not add a footer to a `waytide/local/logs/log/` entry."
    16. kept: "A log entry is deliberately one line: a `# <title>`, with no body and no template."
    17. kept: "A log entry records who and when by its ISO-8601-UTC filename and its commit history, not by an in-file footer."
    18. kept: "This rule states the justification once, and the working-state conventions do not repeat it."

---

Authored by Scott Bellware on Sat Oct 24 2026 at 3:54:37 PM PT
