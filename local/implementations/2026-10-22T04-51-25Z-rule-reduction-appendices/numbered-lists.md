# Rule reduction — the numbered-list rewrite, its prompts and answers

The appendix to the experiment record's rewrite of the 14 compressed rules as numbered lists. Each rule's rewrite, as first returned, and its two checkers' answers are given word for word, with the re-checks of the repairs.

## The rewrite guidance

    You are rewriting the compressed version of one rule of a rule system that governs an AI coding agent. The compressed text is to become a numbered list of points, with exactly the same content.

    - Write one directive per point: one thing to do, not to do, or that holds. Split a sentence that carries two directives into two points.
    - Keep every section heading the compressed text has, as a `## ` heading, with its points beneath it. Number the points under each heading from 1.
    - Keep the content exactly: add nothing the compressed text does not say, and drop nothing it says, including small qualifiers, examples, and reasons.
    - Write each point as a plain sentence or two, of 25 words or fewer each. Do not restate a heading's context in each point.
    - Keep quoted interface text, commands, formats, code blocks, and examples word for word. A code block may sit between points.
    - Make the **Why:** the last point, prefixed `**Why:**`.
    - Write the body only: no title, no attribute lines, no Related list, no footer.

    The source rule is given too, only so you can see what the compressed text means. Do not take content from the source that the compressed text does not have.

    Answer with the numbered body only.

## 11

### The rewriter's answer

    1. `waytide/local/items/` holds the project's items, one file per item.
    2. An item is the thinking that settles what the work should be and how it should go.
    3. Name the file with the ISO-8601-UTC prefix, ending in its state in upper case.
    4. Write the item as frontmatter-free markdown.
    5. Give it a `# <title>`, a `**State:**` line, a `**Tags:**` line, whatever the item has to say, and a provenance footer.
    6. Write a log entry when the item is created and at each change of its state.
    7. Put no code samples in an item.
    8. Nothing else is required.
    9. Where an item records decisions, record them as dated **Settled** resolutions.
    10. Where an item leaves something out, mark it in an **Out of Scope / Deferred** tail.
    11. Where an item gives tasks, give checkbox tasks stating behavior.
    12. An item that neither settles things nor sequences work carries neither resolutions nor tasks.
    13. Tag an item by its kind: `[design]`, `[plan]`, `[aspiration]`, `[observation]`.
    14. Tag an item that has no tag at all `[idea]`.
    15. Give `[idea]` to no item that already carries a tag.
    16. Write `[aspiration]` only where an aspiration was asked for.
    17. The tag set is open.
    18. `[deferred]` is freeform like any other tag.
    19. An item may carry several tags.
    20. Tags are the ordinary square-bracket tags every working-state artifact takes (see the a-record-takes-category-tags rule).
    21. A kind tag describes the item and decides nothing about it, with two exceptions.
    22. `[observation]` is one exception: it makes the item an observation.
    23. `[work-item]` is the other exception, described below.
    24. Otherwise, what an item is, the item itself says, not its tag.
    25. No report groups items by kind tag, and no filename derives from one.
    26. An item may carry two optional lines, `**Waits for:**` and `**Priority:**`, and most items carry neither.
    27. `**Waits for:**` states what must finish before the item is actionable, and nothing more.
    28. `**Priority:** N` ranks the item from 1 to N, contiguous, one item to a number.
    29. Rank 1 is worked next among the actionable items.
    30. Ranking an item renumbers those below it.
    31. A rank does not clear a wait.
    32. Nothing derives from either line.
    33. An item's content is point-in-time.
    34. A reference in an item that time has overtaken is not a defect.
    35. Do not chase such a reference.
    36. Every item carries a state.
    37. Start an item **Open** where its thinking is unsettled.
    38. Start an item **Active** where it settles something.
    39. An observation starts and stays **Stated**.
    40. **Realized** — what it describes exists.
    41. **Deferred** — kept deliberately, with no one working toward it.
    42. An item merely waiting its turn carries `**Waits for:**` instead of **Deferred**.
    43. **Suspended** — paused, not ended.
    44. **Superseded** — a later item replaced it, and the two name each other.
    45. **Abandoned** — dropped by decision.
    46. **Lapsed** — it lost its relevance with no one deciding.
    47. Take `Realized`, `Deferred`, and `Open` back to `Active` or `Open` when the work resumes.
    48. At each change of state, rename the file.
    49. At each change of state, write the log entry.
    50. A work item, tagged `[work-item]`, is a piece of work to be done.
    51. A work item takes `Open`, `Active`, `Deferred`, and `Suspended`.
    52. A work item concludes `Done`, `Abandoned`, or `Superseded`.
    53. A work item never takes `Realized` or `Lapsed`.
    54. Take `Done` back to `Active` when the work reopens.
    55. Supersede an item rather than rewrite it.
    56. What a superseded item settled stays as written.
    57. Amend an item by dated addition.
    58. When amending, keep an outdated resolution's date and wording.
    59. Answer a question that runs against what an item settled, and record the change.
    60. Do not refuse to answer until the item is amended.
    61. Reconcile a settled item against later work.
    62. Never regenerate a settled item from later work.
    63. **Why:** One class of record, because its earlier kinds differed only in a word, which a tag carries. A thin shape, because a shape imposed on thinking is ceremony where the thinking does not have it.

### Checker A

    1. less precise — "`waytide/local/items/` holds the project's items" — missing: a record there is an item and nothing else.
    2. less precise — "A kind tag describes the item and decides nothing about it, with two exceptions" — missing: nothing about tags is strict; the two exceptions contradict it.
    3. kept — "Tag an item by its kind: `[design]`, `[plan]`, `[aspiration]`, `[observation]`."
    4. kept — "Tag an item that has no tag at all `[idea]`."
    5. lost — missing: tags are the ordinary square-bracket tags every working-state artifact takes.
    6. kept — "The tag set is open."
    7. less precise — "An item may carry several tags." — missing: "or none at all".
    8. less precise — "Tag an item that has no tag at all `[idea]`"; "Write `[aspiration]` only where an aspiration was asked for" — missing: no other kind tag is assigned by default, `[aspiration]` least of all.
    9. kept — "Write `[aspiration]` only where an aspiration was asked for."
    10. kept — "Give `[idea]` to no item that already carries a tag."
    11. less precise — "decides nothing about it, with two exceptions"; "`[observation]` is one exception: it makes the item an observation" — missing: no rule reads a kind tag; the compressed version adds an exception.
    12. lost — missing: no report groups items by kind tag.
    13. lost — missing: no filename derives from a kind tag.
    14. less precise — "Otherwise, what an item is, the item itself says, not its tag." — "Otherwise" lets the tag decide for the exceptions.
    15. lost — missing: no tag is reserved among items. The compressed version makes `[observation]` and `[work-item]` exceptions.
    16. less precise — "decides nothing about it, with two exceptions" — missing: no tag is read mechanically, without exception.
    17. kept — "`[deferred]` is freeform like any other tag."
    18. kept — "`**Waits for:**` states what must finish before the item is actionable, and nothing more."
    19. less precise — "`**Priority:** N` ranks the item" — missing: the bullet form `- **Priority:** 3`.
    20. kept — "ranks the item from 1 to N, contiguous, one item to a number."
    21. kept — "Rank 1 is worked next among the actionable items."
    22. kept — "A rank does not clear a wait." (this assumes a waiting item can be ranked)
    23. kept — "A rank does not clear a wait."
    24. kept — "An item may carry two optional lines, `**Waits for:**` and `**Priority:**`"
    25. less precise — "most items carry neither" — missing: an unranked item is not a defect.
    26. less precise — "Ranking an item renumbers those below it." — missing: that it changes their files, and that the cost is accepted.
    27. kept — "An item's content is point-in-time."
    28. kept — "A reference in an item that time has overtaken is not a defect."; "Do not chase such a reference."
    29. kept — "Nothing derives from either line."
    30. kept — "one file per item."
    31. kept — "Name the file with the ISO-8601-UTC prefix"
    32. kept — "ending in its state in upper case."
    33. kept — "Write the item as frontmatter-free markdown."
    34. less precise — "Give it a `# <title>`, a `**State:**` line, a `**Tags:**` line, whatever the item has to say" — missing: the required order, and that the Tags line says what the item is.
    35. kept — "and a provenance footer."
    36. less precise — "Write a log entry when the item is created and at each change of its state." — missing: that the log entry is paired with the item.
    37. kept — "Put no code samples in an item."
    38. kept — "Nothing else is required."
    39. kept — "Where an item records decisions, record them as dated **Settled** resolutions."
    40. less precise — "Where an item leaves something out, mark it in an **Out of Scope / Deferred** tail." — missing: "deliberately"; the condition is broadened beyond items that settle things.
    41. kept — "Where an item gives tasks, give checkbox tasks stating behavior."
    42. lost — missing: an item that neither settles nor sequences carries neither resolutions nor tasks.
    43. less precise — "a shape imposed on thinking is ceremony where the thinking does not have it" — this appears only as rationale in the Why line, not as a directive.
    44. less precise — "Every item carries a state." — missing: a `**State:**` line, from the moment the item is written.
    45. less precise — "Start an item **Open** where its thinking is unsettled." — stated only as a starting state, not as the general meaning of Open.
    46. less precise — "Start an item **Active** where it settles something." — missing: "the work is expected"; stated only as a starting state.
    47. kept — "**Realized** — what it describes exists."
    48. less precise — "**Deferred** — kept deliberately, with no one working toward it." — missing: "no date".
    49. less precise — "An item merely waiting its turn carries `**Waits for:**` instead of **Deferred**." — missing: that it carries whatever state its thinking has reached.
    50. kept — "**Suspended** — paused, not ended."
    51. kept — "**Superseded** — a later item replaced it, and the two name each other."
    52. kept — "**Abandoned** — dropped by decision."
    53. less precise — "**Lapsed** — it lost its relevance with no one deciding." — missing: "over time" and "the work moved past it".
    54. less precise — "An observation starts and stays **Stated**." — missing: that Stated belongs to observations only.
    55. kept — "Start an item **Open** where…"; "Start an item **Active** where…"; "An observation starts and stays **Stated**."
    56. kept — "Start an item **Open** where its thinking is unsettled."; "Start an item **Active** where it settles something."
    57. less precise — "Every item carries a state." — missing: that a missing State line is a defect, and that absence is not a state.
    58. less precise — "Take `Realized`, `Deferred`, and `Open` back to `Active` or `Open` when the work resumes." — missing: the other states are not taken back.
    59. kept — "A work item, tagged `[work-item]`, is a piece of work to be done."; "A work item concludes `Done`, `Abandoned`, or `Superseded`."
    60. less precise — "`[work-item]` is the other exception, described below." — missing: that the tag is explicitly reserved, with its meaning set by the items rule.
    61. kept — "A work item concludes `Done`…"; "A work item never takes `Realized` or `Lapsed`."
    62. kept — "A work item takes `Open`, `Active`, `Deferred`, and `Suspended`."
    63. kept — "Take `Done` back to `Active` when the work reopens."
    64. kept — "**Superseded** — a later item replaced it"
    65. kept — "**Superseded** — a later item replaced it"
    66. less precise — "the two name each other" — missing: "in their prose".
    67. kept — "What a superseded item settled stays as written."
    68. kept — "Supersede an item rather than rewrite it."
    69. kept — "Amend an item by dated addition."
    70. less precise — "When amending, keep an outdated resolution's date and wording." — missing: a later resolution states what changed.
    71. kept — "Answer a question that runs against what an item settled, and record the change."
    72. kept — "Do not refuse to answer until the item is amended."
    73. kept — "Reconcile a settled item against later work."; "Never regenerate a settled item from later work."
    74. less precise — "Never regenerate a settled item from later work." — missing: that the realized item is named as the source of truth for the work downstream of it.
    75. kept — "At each change of state, rename the file."

### Checker B

    1 less precise — "`waytide/local/items/` holds the project's items, one file per item" — missing: a record there is an item and nothing else
    2 less precise — "A kind tag describes the item and decides nothing about it, with two exceptions" — the exceptions contradict "nothing about tags is strict"
    3 kept — "Tag an item by its kind: `[design]`, `[plan]`, `[aspiration]`, `[observation]`"
    4 kept — "Tag an item that has no tag at all `[idea]`"
    5 lost — missing: tags are the ordinary square-bracket tags every working-state artifact takes
    6 kept — "The tag set is open"
    7 less precise — "An item may carry several tags" — missing: or none at all
    8 less precise — "Tag an item that has no tag at all `[idea]`"; "Write `[aspiration]` only where an aspiration was asked for" — missing: no other kind tag is assigned by default
    9 less precise — "Write `[aspiration]` only where an aspiration was asked for" — missing: never as filler for a design item's tag line
    10 kept — "Give `[idea]` to no item that already carries a tag"
    11 less precise — "decides nothing about it, with two exceptions" — exceptions allow kind tags to be read
    12 lost — missing: no report groups items by kind tag
    13 lost — missing: no filename derives from a kind tag
    14 less precise — "Otherwise, what an item is, the item itself says, not its tag" — "Otherwise" limits it to the non-exception cases
    15 lost — missing: no tag is reserved (the shorter version makes `[observation]` and `[work-item]` exceptions)
    16 less precise — "decides nothing about it, with two exceptions" — exceptions allow mechanical reading
    17 kept — "`[deferred]` is freeform like any other tag"
    18 kept — "`**Waits for:**` states what must finish before the item is actionable, and nothing more"
    19 less precise — "`**Priority:** N` ranks the item" — missing: the exact form `- **Priority:** 3`
    20 kept — "ranks the item from 1 to N, contiguous, one item to a number"
    21 kept — "Rank 1 is worked next among the actionable items"
    22 kept — "A rank does not clear a wait"
    23 kept — "A rank does not clear a wait"
    24 kept — "An item may carry two optional lines, `**Waits for:**` and `**Priority:**`"
    25 kept — "two optional lines ... and most items carry neither"
    26 less precise — "Ranking an item renumbers those below it" — missing: that their files change and the cost is accepted
    27 kept — "An item's content is point-in-time"
    28 kept — "A reference in an item that time has overtaken is not a defect"; "Do not chase such a reference"
    29 kept — "Nothing derives from either line"
    30 kept — "one file per item"
    31 kept — "Name the file with the ISO-8601-UTC prefix"
    32 kept — "ending in its state in upper case"
    33 kept — "Write the item as frontmatter-free markdown"
    34 less precise — "Give it a `# <title>`, a `**State:**` line, a `**Tags:**` line, whatever the item has to say" — order is not required outright; missing: the Tags line says what the item is
    35 kept — "and a provenance footer"
    36 kept — "Write a log entry when the item is created and at each change of its state"
    37 kept — "Put no code samples in an item"
    38 kept — "Nothing else is required"
    39 kept — "Where an item records decisions, record them as dated **Settled** resolutions"
    40 kept — "Where an item leaves something out, mark it in an **Out of Scope / Deferred** tail"
    41 kept — "Where an item gives tasks, give checkbox tasks stating behavior"
    42 lost — missing: an item that neither settles nor sequences carries neither resolutions nor tasks
    43 less precise — "a shape imposed on thinking is ceremony where the thinking does not have it" — given only as a reason under **Why:**, not as a directive
    44 less precise — "Every item carries a state" — missing: a `**State:**` line from the moment it is written
    45 less precise — "Start an item **Open** where its thinking is unsettled" — stated only as a starting state
    46 less precise — "Start an item **Active** where it settles something" — stated only as a starting state; missing: the work is expected
    47 kept — "**Realized** — what it describes exists"
    48 less precise — "**Deferred** — kept deliberately, with no one working toward it" — missing: no date
    49 less precise — "An item merely waiting its turn carries `**Waits for:**` instead of **Deferred**" — missing: it keeps whatever state its thinking has reached
    50 kept — "**Suspended** — paused, not ended"
    51 kept — "**Superseded** — a later item replaced it, and the two name each other"
    52 kept — "**Abandoned** — dropped by decision"
    53 less precise — "**Lapsed** — it lost its relevance with no one deciding" — missing: over time, and the work moved past it
    54 less precise — "An observation starts and stays **Stated**" — missing: Stated belongs to observations only
    55 less precise — "Start an item **Open** ...", "Start an item **Active** ...", "An observation starts and stays **Stated**" — missing: every non-observation item starts only as Open or Active
    56 kept — "Start an item **Open** where its thinking is unsettled"; "Start an item **Active** where it settles something"
    57 kept — "Every item carries a state"
    58 less precise — "Take `Realized`, `Deferred`, and `Open` back to `Active` or `Open` when the work resumes" — missing: the other states are not taken back
    59 kept — "A work item, tagged `[work-item]`, is a piece of work to be done"; "A work item concludes `Done`, `Abandoned`, or `Superseded`"
    60 less precise — "`[work-item]` is the other exception, described below" — "reserved" is not stated
    61 kept — "A work item concludes `Done`..."; "A work item never takes `Realized` or `Lapsed`"
    62 kept — "A work item takes `Open`, `Active`, `Deferred`, and `Suspended`"
    63 kept — "Take `Done` back to `Active` when the work reopens"
    64 kept — "a later item replaced it"
    65 kept — "**Superseded** — a later item replaced it"
    66 kept — "the two name each other"
    67 kept — "What a superseded item settled stays as written"
    68 kept — "Supersede an item rather than rewrite it"
    69 kept — "Amend an item by dated addition"
    70 less precise — "When amending, keep an outdated resolution's date and wording" — missing: a later resolution states what changed
    71 kept — "Answer a question that runs against what an item settled, and record the change"
    72 kept — "Do not refuse to answer until the item is amended"
    73 kept — "Reconcile a settled item against later work"; "Never regenerate a settled item from later work"
    74 less precise — "Never regenerate a settled item from later work" — missing: the item named as the thing realized is the source of truth
    75 kept — "At each change of state, rename the file"

## 12

### The rewriter's answer

    1. An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`.
    2. Write the entry at three moments, and at no others.
    3. The item's tag makes no difference.
    4. Write the entry on the item's creation.
    5. Write the entry on each dated `Settled` resolution added after the item is created.
    6. Write the entry on each change of the item's `**State:**` line.
    7. A change of state is the line reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item.
    8. A change of state is also the line taking back Realized, Deferred, Open, or a work item's Done.
    9. An observation is `Stated` and never moves, so it takes a creation entry only.
    10. Do not log a completed checkbox task, because it carries out a direction already settled.
    11. Do not log prose that settles nothing either. Examples are reconciling a Background & Motivation section, correcting a summary, and rewording a section.
    12. The provenance footer records those unlogged changes.
    13. Log one reconciliation, though nothing changed: a reconciliation at a work session's close that finds the direction still standing.
    14. Name what that reconciliation was read against, as in `The aspirations stand against …`.
    15. Log it because nothing in the artifacts records that it happened.
    16. The entry names the record and what happened to it: the record was written, or its state reached a word.
    17. What the record settles may follow, attributed to the record.
    18. Never state an unbuilt direction in the indicative mood.
    19. *The check runs at the engineer's first prompt* says the system does that. While the item is `Open` or `Active`, it does not.
    20. The `git` package's commit-message rules ask for the changed thing in its new state. That form is right for a change to the software.
    21. An item is not a change to the software, so do not use that form for it.
    22. The fact about an item is that it was recorded, or that its state moved.
    23. Carry the same mood into the commit subject the entry travels in.
    24. Fix no wording template. *X is recorded as an item, Open because …* and *X is realized* are forms in use.
    25. This rule states the obligation once, for every item.
    26. The observations-convention, the rules-convention, and the a-suspension-is-a-log-entry rule state their own entries.
    27. The items-convention points here and keeps no second copy.
    28. The decision-log-convention's general trigger is to log whenever in doubt. It rests on each writer's judgment, so it does not make the entries reliable.
    29. **Why:** the log holds when direction moved, which an artifact cannot carry. The exclusions keep the log skimmable. A log entry has no State line beside it, so an entry asserting what a record only settles is read as the system's behavior.

### Checker A

    1. kept: "An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`."
    2. kept: "Write the entry at three moments, and at no others." (the moments are listed in lines 4–6)
    3. kept: "The item's tag makes no difference." (the four tags are not listed, but nothing depends on the list)
    4. less precise: "Write the entry on the item's creation." Missing: the entry records the item itself, not the word.
    5. kept: "Write the entry on each dated `Settled` resolution added after the item is created." (the added word "dated" could be read as narrowing it slightly)
    6. kept: "A change of state is the line reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item."
    7. kept: "A change of state is also the line taking back Realized, Deferred, Open, or a work item's Done." (the pointer to the items-convention is dropped)
    8. kept: "An observation is `Stated` and never moves, so it takes a creation entry only."
    9. kept: "The entry names the record and what happened to it: the record was written, or its state reached a word."
    10. kept: "What the record settles may follow, attributed to the record." together with "an entry asserting what a record only settles is read as the system's behavior"
    11. kept: "Never state an unbuilt direction in the indicative mood." / "*The check runs at the engineer's first prompt* says the system does that. While the item is `Open` or `Active`, it does not."
    12. kept: "The `git` package's commit-message rules ask for the changed thing in its new state. That form is right for a change to the software." / "An item is not a change to the software, so do not use that form for it." / "The fact about an item is that it was recorded, or that its state moved." (passive voice and indicative mood are not named, but the pointer to the git package's rules identifies the grammar)
    13. less precise: "Carry the same mood into the commit subject the entry travels in." Missing: the subject must also state what the record settles as the record's, never as the system's behavior. Only the mood is carried over.
    14. kept: "Fix no wording template." (the requirement that the record be named and the mood be honest is carried by lines 16 and 18)
    15. kept: "Do not log a completed checkbox task"
    16. kept: "Do not log prose that settles nothing either. Examples are reconciling a Background & Motivation section, correcting a summary, and rewording a section."
    17. kept: "Log one reconciliation, though nothing changed: a reconciliation at a work session's close that finds the direction still standing."
    18. kept: "Name what that reconciliation was read against, as in `The aspirations stand against …`."
    19. kept: "The items-convention points here and keeps no second copy."

### Checker B

    1 — kept — "An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`."
    2 — kept — "Write the entry at three moments, and at no others." (moments listed in lines 4–6)
    3 — kept — "The item's tag makes no difference."
    4 — less precise — "Write the entry on the item's creation." Missing: that the entry records the item itself, not the word. Line 16, "The entry names the record", covers only part of this.
    5 — kept — "Write the entry on each dated `Settled` resolution added after the item is created."
    6 — less precise — "Write the entry on each change of the item's `**State:**` line." / "A change of state is the line reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item." Missing: "canonical" is dropped from the `**State:**` line.
    7 — kept — "A change of state is also the line taking back Realized, Deferred, Open, or a work item's Done." (The pointer "as the items-convention sets out" is dropped. That does not change the behavior.)
    8 — kept — "An observation is `Stated` and never moves, so it takes a creation entry only."
    9 — kept — "The entry names the record and what happened to it: the record was written, or its state reached a word."
    10 — kept — "What the record settles may follow, attributed to the record." (The "never as the system's behavior" part is carried by the Why line: "an entry asserting what a record only settles is read as the system's behavior.")
    11 — kept — "Never state an unbuilt direction in the indicative mood." / "*The check runs at the engineer's first prompt* says the system does that. While the item is `Open` or `Active`, it does not."
    12 — kept — "The `git` package's commit-message rules ask for the changed thing in its new state. That form is right for a change to the software." / "An item is not a change to the software, so do not use that form for it." / "The fact about an item is that it was recorded, or that its state moved."
    13 — less precise — "Carry the same mood into the commit subject the entry travels in." Missing: it carries only the mood. It does not state that the commit subject must present what the record settles as the record's and not as the system's behavior.
    14 — kept — "Fix no wording template." (What is required, that the record is named and the mood is honest, is carried by lines 16 and 18.)
    15 — kept — "Do not log a completed checkbox task, because it carries out a direction already settled."
    16 — kept — "Do not log prose that settles nothing either. Examples are reconciling a Background & Motivation section, correcting a summary, and rewording a section." (The example "substantive section" becomes "a section". The exclusion still holds.)
    17 — kept — "Log one reconciliation, though nothing changed: a reconciliation at a work session's close that finds the direction still standing."
    18 — kept — "Name what that reconciliation was read against, as in `The aspirations stand against …`."
    19 — kept — "The items-convention points here and keeps no second copy."

## 13

### The rewriter's answer

    ## Declaring a set

    1. A project may declare a package set.
    2. The packages outside a declared set are deactivated.
    3. Where no set is declared, every installed package is active, and nothing reports it.

    ## The record

    1. A declaration is a record under `waytide/local/`.
    2. Its name is the ISO-8601-UTC prefix and the declared names, hyphen-joined: `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`.
    3. A new declaration writes a new record.
    4. A new declaration edits no existing record.
    5. The record with the latest prefix holds, and the earlier ones are history.
    6. Reverting is a declaration naming `default`.

    ## Three lines carry it

    1. A record without the first two lines is not a declaration.

    ```
    - **Package set:** content
    - **Packages:** foundation, git, journal, language, versioning
    - **Inactive:** design-by-efferent, testing
    ```

    2. `**Package set:**` is what the engineer declared: a set name, package names, or both, in the grammar `install` takes.
    3. `**Packages:**` is what that resolved to, recorded when declared rather than computed at session start.
    4. `**Packages:**` is authoritative.
    5. A package installed later is in neither line, so it stays inactive until a new declaration takes it up.
    6. `**Inactive:**` is what was installed and not active then.
    7. `**Inactive:**` is recorded, not inferred, so the record states the whole state it was made against.

    ## An include activates what it names

    1. Where an active package's README includes another package, that package is active, named or not.
    2. An include states a dependency, and `install` already treats it so.

    ## Every package is still read

    1. A deactivated package's rules are read at session start like an active package's.
    2. The declaration decides which rules are applied, not which are read.
    3. The declaration does not narrow the unconditional read.
    4. A rule that is read and withheld can be cited, weighed, and reactivated within the session.
    5. `refresh-packages.sh` refreshes a deactivated package like any other, so nothing read is stale.

    ## What is printed

    1. Print the packages at the head of the response that carries the read, because that text renders markdown.
    2. The session-start notice and the startup display print none of it.
    3. List every installed package, and hide none.
    4. Show active packages in bold and deactivated packages in italic.
    5. Follow the list with the set's name: `package set: content`.
    6. Close with a count line: `(5 active of 8 installed)`.
    7. The hidden-record rule does not apply, because nothing is withheld.

    ## When nothing is printed

    1. Where no set is declared, print nothing about a set, not even a line saying so.
    2. A declaration of `default` prints nothing where it deactivates nothing.
    3. A declaration of `default` does print where the project holds a package that `default` does not name.

    ## Declaring during a session

    1. A set declared during a session takes effect at the next session.
    2. A declaration does not unload rules already read.
    3. When the engineer declares a set, write the record.
    4. Then say that the deactivated packages' rules stay in force for this session.
    5. Also say that Claude must be restarted for those rules to stop applying.
    6. **Why:** a project does not need every convention the system carries. Before this, the remedies were to leave a package uninstalled or to write a local rule against it. A declaration is a recorded project decision, committed, dated, and reviewable, not the agent's judgment in the moment.

### Checker A

    1. kept — "A project may declare a package set." / "The packages outside a declared set are deactivated."
    2. kept — "A declaration is a record under `waytide/local/`." / "Its name is the ISO-8601-UTC prefix and the declared names ... `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`"
    3. kept — "the declared names, hyphen-joined"
    4. kept — "Where no set is declared, every installed package is active"
    5. kept — "and nothing reports it"
    6. kept — "A new declaration writes a new record." / "A new declaration edits no existing record."
    7. kept — "The record with the latest prefix holds"
    8. kept — "Reverting is a declaration naming `default`."
    9. less precise — "Three lines carry it" plus the example block. Missing: that they are plain-text data attribute lines. The example shows them as list items.
    10. kept — "A record without the first two lines is not a declaration." (Which lines are "first two" depends on the example's order.)
    11. kept — "`**Package set:**` is what the engineer declared: a set name, package names, or both"
    12. kept — "a set name, package names, or both, in the grammar `install` takes"
    13. kept — "`**Packages:**` is what that resolved to, recorded when declared rather than computed at session start"
    14. kept — "`**Inactive:**` is what was installed and not active then." / "`**Inactive:**` is recorded, not inferred"
    15. less precise — "`**Packages:**` is authoritative." Missing: that the active list is the whole of what is active.
    16. kept — "A package installed later is in neither line, so it stays inactive until a new declaration takes it up."
    17. kept — "Where an active package's README includes another package, that package is active, named or not."
    18. kept — "A deactivated package's rules are read at session start like an active package's." / "The declaration decides which rules are applied, not which are read."
    19. less precise — "The declaration does not narrow the unconditional read." Missing: the name of the rule whose read is meant (announce-waytide-at-session-start).
    20. kept — "read at session start like an active package's" / "A rule that is read and withheld can be cited, weighed, and reactivated within the session."
    21. kept — "`refresh-packages.sh` refreshes a deactivated package like any other, so nothing read is stale."
    22. kept — "Print the packages at the head of the response that carries the read"
    23. kept — "The session-start notice and the startup display print none of it."
    24. kept — "List every installed package, and hide none."
    25. kept — "Show active packages in bold"
    26. kept — "and deactivated packages in italic"
    27. kept — "Follow the list with the set's name: `package set: content`."
    28. kept — "Close with a count line: `(5 active of 8 installed)`."
    29. less precise — "The hidden-record rule does not apply". Missing: that it is the status-report-format rule's convention. The source rule is not named.
    30. kept — "Where no set is declared, print nothing about a set, not even a line saying so."
    31. kept — "A declaration of `default` prints nothing where it deactivates nothing."
    32. kept — "A declaration of `default` does print where the project holds a package that `default` does not name."
    33. less precise — "A declaration does not unload rules already read." Missing: an explicit statement that the new set takes effect at the next session. The restart line only implies it.
    34. kept — "say that the deactivated packages' rules stay in force for this session." / "say that Claude must be restarted for those rules to stop applying."
    35. lost — Missing: the instruction to read the most recent `*-package-set.md` under `waytide/local/` at session start. "latest prefix holds" says which record holds, not that it is read.
    36. less precise — "The declaration decides which rules are applied". Missing: the direct instruction to follow only the active packages' rules.
    37. kept — "When the engineer declares a set, write the record." / "Then say that ... Claude must be restarted"

    Totals: 30 kept, 6 less precise (9, 15, 19, 29, 33, 36), 1 lost (35).

### Checker B

    1. kept — "A project may declare a package set." / "The packages outside a declared set are deactivated."
    2. kept — "A declaration is a record under `waytide/local/`." / "Its name is the ISO-8601-UTC prefix and the declared names, hyphen-joined: `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`."
    3. kept — "the declared names, hyphen-joined"
    4. kept — "Where no set is declared, every installed package is active"
    5. kept — "and nothing reports it."
    6. kept — "A new declaration writes a new record." / "A new declaration edits no existing record."
    7. kept — "The record with the latest prefix holds, and the earlier ones are history."
    8. kept — "Reverting is a declaration naming `default`."
    9. kept — "Three lines carry it" plus the code block showing `**Package set:**`, `**Packages:**`, `**Inactive:**`
    10. kept — "A record without the first two lines is not a declaration."
    11. kept — "`**Package set:**` is what the engineer declared: a set name, package names, or both"
    12. kept — "a set name, package names, or both, in the grammar `install` takes."
    13. kept — "`**Packages:**` is what that resolved to, recorded when declared rather than computed at session start."
    14. kept — "`**Inactive:**` is what was installed and not active then." / "`**Inactive:**` is recorded, not inferred"
    15. less precise — "`**Packages:**` is authoritative." Missing: the active list is the whole of what is active.
    16. kept — "A package installed later is in neither line, so it stays inactive until a new declaration takes it up."
    17. kept — "Where an active package's README includes another package, that package is active, named or not."
    18. kept — "A deactivated package's rules are read at session start like an active package's." / "The declaration decides which rules are applied, not which are read."
    19. less precise — "The declaration does not narrow the unconditional read." Missing: which rule's read (announce-waytide-at-session-start).
    20. kept — "A deactivated package's rules are read at session start" / "A rule that is read and withheld can be cited, weighed, and reactivated within the session."
    21. kept — "`refresh-packages.sh` refreshes a deactivated package like any other, so nothing read is stale."
    22. kept — "Print the packages at the head of the response that carries the read"
    23. kept — "The session-start notice and the startup display print none of it."
    24. kept — "List every installed package, and hide none."
    25. kept — "Show active packages in bold"
    26. kept — "and deactivated packages in italic."
    27. kept — "Follow the list with the set's name: `package set: content`."
    28. kept — "Close with a count line: `(5 active of 8 installed)`."
    29. less precise — "The hidden-record rule does not apply, because nothing is withheld." Missing: it is the status-report-format rule's convention.
    30. kept — "Where no set is declared, print nothing about a set, not even a line saying so."
    31. kept — "A declaration of `default` prints nothing where it deactivates nothing."
    32. kept — "A declaration of `default` does print where the project holds a package that `default` does not name."
    33. less precise — "A declaration does not unload rules already read." / "Claude must be restarted for those rules to stop applying." Missing: an explicit statement that the new set takes effect at the next session.
    34. kept — "Then say that the deactivated packages' rules stay in force for this session." / "Also say that Claude must be restarted for those rules to stop applying."
    35. less precise — "The record with the latest prefix holds". Missing: the instruction to read it at session start, and the `*-package-set.md` pattern.
    36. less precise — "The declaration decides which rules are applied" / "The packages outside a declared set are deactivated." Missing: a direct instruction to follow only the active packages' rules.
    37. kept — "When the engineer declares a set, write the record." / "Then say that the deactivated packages' rules stay in force"

## 14

### The rewriter's answer

    1. An implementation runs on its own branch, through the five hinges, to a declared state.
    2. It is never left silently open.
    3. Its tag decides the parts that differ.
    4. An `[experiment]` is built to a question, and a `[feature]` to an intent (see the implementations-convention).
    5. A clause below names a kind only because of that difference.

    ## The branch

    1. Name it `experiment/<subject>` or `feature/<subject>`, matching the tag.
    2. The subject is short, lower-case, and dash-separated, and names literally what is tested or built.
    3. Add `-run-<n>` only where an experiment has more than one run.
    4. With a worktree, the name carries `worktree/`: `experiment/worktree/<subject>`, `feature/worktree/<subject>`.
    5. A branch checked out in a worktree cannot be checked out in the main working tree, and `git branch` is where that question comes up.
    6. Adding a worktree to work under way renames the branch.
    7. The rename is confirmed, and the record carries it.
    8. Keep the upstream branch out of the name, since a branch can outlive its upstream target. The record names it.
    9. A worktree is the one fact the name carries, because `git branch` has no other answer for it.
    10. The rename keeps that fact current.
    11. Record the base as its commit SHA and the ref it came from.
    12. Make no git tag for the base.
    13. A later run branches from the recorded commit.

    ## Phases

    1. An experiment may run in phases, each a question that serves the experiment's.
    2. The record names the phases and their order at the start.
    3. The record states each phase's forecast before its work.
    4. A phase's branch is the experiment's branch, a dot, and the phase's name: `experiment/rule-reduction.flattening`.
    5. Git refuses a slash here, because no branch can sit beneath another branch's name.
    6. A `worktree/` segment carries into each phase's name.
    7. A phase branches from the experiment's branch and concludes into it.
    8. A phase is affirmed, refuted, or inconclusive only on the engineer's declaration.
    9. An affirmed phase merges back into the experiment's branch.
    10. The record carries each phase's verdict and findings.
    11. One phase runs at a time, in the record's order, each from the experiment's branch as the earlier phases left it.
    12. A phase merges nowhere else.
    13. The experiment concludes after its phases, and only then merges to its upstream branch.

    ## The working location

    1. Put the working location through the selection interface at every start, with no default.
    2. Each option states what it creates:

    > **Branch only** — Create the branch and switch this working tree to it. At the conclusion this
    > working tree switches back.
    >
    > **Branch and worktree** — Create the branch as `<kind>/worktree/<subject>` and check it out in a
    > new worktree: a second working directory at `<path>`. This working tree stays on
    > `<upstream branch>`.
    >
    > **The current branch** — Build it where the working tree already is, creating nothing. There is
    > no branch to switch back to and nothing to merge.

    3. Offer the current branch for a feature only.
    4. An experiment's changes must not reach the branch it deviates from before it is affirmed, and its own branch is what keeps them out.
    5. A feature is the main line.
    6. Offer the current branch last, because a first option reads as recommended, and the current branch gives up isolation.
    7. On the current branch, partial work sits where others read, and abandoning means reverting.
    8. Place a worktree beside the repository directory, named `<repository-name>-<branch, its slash as a dash>`, as in `waytide-experiment-state-suffix-legibility`.
    9. A worktree inside the repository would show as untracked content in the work's own `git status`.
    10. Create with `git switch -c <branch>` or `git worktree add -b <branch> <path>`.
    11. Use `git worktree add <path> <branch>` only to add a worktree to work under way, since it fails on a branch that does not exist.
    12. Change the location only by adding a worktree.
    13. Add one on one of two triggers: other work arrives that the engineer means to work alongside.
    14. Or the work is escalated, needing more isolation than it was taken for.
    15. Confirm the addition.
    16. Add a line to the record, and keep the original.
    17. The conclusion follows the location as it then stands.
    18. Never collapse a worktree back.

    ## Participation

    1. Put attended or unattended through the selection interface beside the working location.
    2. Attended is the default.
    3. Each choice is made once and held for the work's duration.
    4. Record both choices.
    5. DBE is in effect either way, and only the stopping changes (see the design-by-efferent attended-or-unattended-is-chosen-at-the-start rule).

    ## The end

    1. Every implementation ends in a declared state, or is suspended, which pauses it.
    2. The words are the implementations-convention's.
    3. An `[experiment]` is affirmed only on the engineer's explicit declaration.
    4. On affirmation, its log is copied into the project decision log.
    5. Where it produced implementation, its branch merges to the upstream branch, after the tests.
    6. Where no test covers the work, the merge also waits for specific confirmation.
    7. An observation-only experiment's affirmation is the log copy alone.
    8. A `[feature]` merges with no gate, because run-suite-before-commit verified every commit.
    9. The merged result can still break the suite, and that is fixed from there.
    10. A feature has no affirmation.
    11. Refuted, inconclusive, abandoned, and superseded work keeps its record.
    12. Refuted, inconclusive, abandoned, and superseded work does not merge.
    13. Supersession runs through suspension.
    14. The superseded implementation stays Suspended, its branch kept, until the engineer concludes it as superseded.
    15. The two records name each other.
    16. A child supersedes its parent by preserving it.
    17. The child merges the parent first, taking every commit the parent made after the child branched.
    18. The parent is then parked Superseded, and the records name each other.
    19. The child takes the parent's upstream.
    20. The parent branch is deleted only on confirmation.
    21. This is the one supersession that merges the superseded branch.
    22. Conclude in the main working tree, on the upstream branch.
    23. Under branch only, the working tree switches back.
    24. Under a worktree, end the session in the main working tree, never in the removed directory.
    25. On the current branch there is nothing to return from.
    26. Branch deletion takes one confirmation from the engineer, through the selection interface.
    27. Remove the worktree first, since git refuses to delete a branch checked out in a worktree.
    28. Suspension deletes no branch and removes no worktree.

    ## The agent never raises the end of an `[experiment]`

    1. Do not offer to conclude, affirm, refute, or merge one: not as a next step, an option, or a precondition.
    2. The precondition is the form that slips through, as in *this cannot be published until it merges*.
    3. Report what is settled and what is open, and stop.
    4. An experiment's length is the engineer's judgment, not readable from the work done.
    5. A `[feature]` is not covered, because its completion is ordinary.

    ## Drift

    1. While an `[experiment]` is open under branch only, watch for main-sequence work starting, and surface it.
    2. Offer two recourses through the selection interface: suspend the experiment, or add a worktree.
    3. Neither recourse ends the experiment, and the engineer's intent decides.
    4. The watch rests on the branch name in the status line and on a judgment of whether the work answers the recorded question.
    5. The watch is a practice, not a guarantee.
    6. Under a worktree there is nothing to watch.
    7. The session-start notice reports every implementation not concluded.
    8. A `[feature]` has no watch, since starting other work during one is ordinary.
    9. A forgotten feature is reported by the same notice.
    10. **Why:** an experiment and a feature share one lifecycle, and differ only where a question differs from an intent. Stated once, with six clauses conditioned on the tag, the difference shows directly.

### Checker A

    1. kept — "An implementation runs on its own branch"
    2. kept — "through the five hinges"; "DBE is in effect either way"
    3. kept — "to a declared state"; "It is never left silently open."; "Every implementation ends in a declared state, or is suspended"; "The words are the implementations-convention's."
    4. kept — "An `[experiment]` is built to a question, and a `[feature]` to an intent"
    5. kept — "Name it `experiment/<subject>` or `feature/<subject>`, matching the tag."
    6. kept — "The subject is short, lower-case, and dash-separated, and names literally what is tested or built."
    7. kept — "Add `-run-<n>` only where an experiment has more than one run."
    8. kept — "With a worktree, the name carries `worktree/`: `experiment/worktree/<subject>`, `feature/worktree/<subject>`."
    9. kept — "Adding a worktree to work under way renames the branch."
    10. less precise — "The rename is confirmed, and the record carries it." Missing: that the rename is covered by the worktree addition's confirmation and needs no separate one. "Is confirmed" can be read as requiring a confirmation of its own.
    11. kept — "Keep the upstream branch out of the name ... The record names it."
    12. kept — "Record the base as its commit SHA and the ref it came from."; "Make no git tag for the base."
    13. kept — "A later run branches from the recorded commit."
    14. kept — "An experiment may run in phases, each a question that serves the experiment's."
    15. kept — "The record names the phases and their order at the start."
    16. kept — "The record states each phase's forecast before its work."
    17. kept — "A phase's branch is the experiment's branch, a dot, and the phase's name: `experiment/rule-reduction.flattening`."; "Git refuses a slash here"
    18. kept — "A `worktree/` segment carries into each phase's name."
    19. kept — "A phase branches from the experiment's branch and concludes into it."
    20. less precise — "The engineer declares a phase affirmed, refuted, or inconclusive." Missing: "only", so nothing rules out the agent declaring a verdict.
    21. kept — "An affirmed phase merges back into the experiment's branch."
    22. kept — "The record carries each phase's verdict and findings."
    23. kept — "The experiment concludes after its phases, and only then merges to its upstream branch."
    24. kept — "A phase merges nowhere else."
    25. kept — "One phase runs at a time, in the record's order"
    26. kept — "each from the experiment's branch as the earlier phases left it"
    27. kept — "Put the working location through the selection interface at every start, with no default."
    28. kept — "Each option states what it creates"
    29. kept — "**Branch only** — Create the branch and switch this working tree to it. At the conclusion this working tree switches back."
    30. kept — "**Branch and worktree** — Create the branch as `<kind>/worktree/<subject>` and check it out in a new worktree: a second working directory at `<path>`. This working tree stays on `<upstream branch>`."
    31. kept — "**The current branch** — Build it where the working tree already is, creating nothing. There is no branch to switch back to and nothing to merge."
    32. kept — "Offer the current branch for a feature only."
    33. kept — "Offer the current branch last"
    34. less precise — "An experiment's changes must not reach the main line before it is affirmed". Missing: "the branch it deviates from". "The main line" may not be the experiment's actual upstream branch.
    35. kept — "Place a worktree beside the repository directory, named `<repository-name>-<branch, its slash as a dash>`"
    36. less precise — "Create with `git switch -c <branch>` or `git worktree add -b <branch> <path>`." Missing: that `git switch -c` is the command for branch only. The two commands are not matched to their locations.
    37. less precise — "`git worktree add -b <branch> <path>`"; "Use `git worktree add <path> <branch>` only to add a worktree to work under way". Missing: an explicit statement that `-b` is required for new work. It is only implied by the restriction on the form without it.
    38. kept — "Use `git worktree add <path> <branch>` only to add a worktree to work under way"
    39. kept — "Change the location only by adding a worktree."; "Add one on one of two triggers: other work arrives that the engineer means to work alongside."; "Or the work is escalated, needing more isolation than it was taken for."
    40. kept — "Confirm the addition."
    41. kept — "Add a line to the record, and keep the original."
    42. kept — "The conclusion follows the location as it then stands."
    43. kept — "Never collapse a worktree back."
    44. kept — "Put attended or unattended through the selection interface beside the working location."
    45. kept — "Each choice is made once and held for the work's duration."
    46. kept — "Attended is the default."
    47. kept — "DBE is in effect either way, and only the stopping changes"
    48. kept — "The words are the implementations-convention's."
    49. kept — "An `[experiment]` is affirmed only on the engineer's explicit declaration."
    50. kept — "On affirmation, its log is copied into the project decision log."
    51. kept — "Where it produced implementation, its branch merges to the upstream branch"
    52. kept — "after the tests"
    53. kept — "Where no test covers the work, the merge also waits for specific confirmation."
    54. kept — "An observation-only experiment's affirmation is the log copy alone."
    55. less precise — "because run-suite-before-commit verified every commit". Missing: verification before integrating is stated as a reason, not as a requirement.
    56. kept — "A `[feature]` merges with no gate"
    57. kept — "The merged result can still break the suite, and that is fixed from there."
    58. kept — "A feature has no affirmation."
    59. kept — "Refuted, inconclusive, abandoned, and superseded work keeps its record."; "... does not merge."
    60. less precise — "keeps its record". Missing: that the record is maintained and marked.
    61. kept — "The superseded implementation stays Suspended ... until the engineer concludes it as superseded."
    62. kept — "its branch kept, until the engineer concludes it as superseded"
    63. kept — "The two records name each other."
    64. kept — "The child merges the parent first"
    65. kept — "The parent is then parked Superseded"
    66. kept — "The child takes the parent's upstream."
    67. less precise — "The parent branch is deleted on confirmation." Missing: "only", so confirmation is not stated as the sole condition for deletion.
    68. less precise — "Conclude in the main working tree, on the upstream branch." Missing: leaving the engineer there.
    69. kept — "Under branch only, the working tree switches back."
    70. kept — "Under a worktree, end the session in the main working tree, never in the removed directory."
    71. kept — "Branch deletion takes one confirmation from the engineer, through the selection interface."
    72. kept — "Remove the worktree first"
    73. less precise — "Branch deletion takes one confirmation". Missing: an explicit statement that the single confirmation also covers the worktree removal.
    74. kept — "Suspension deletes no branch and removes no worktree."
    75. kept — "Do not offer to conclude, affirm, refute, or merge one: not as a next step, an option, or a precondition."
    76. kept — "Report what is settled and what is open, and stop."
    77. kept — "An experiment's length is the engineer's judgment, not readable from the work done."
    78. kept — "A `[feature]` is not covered"
    79. kept — "While an `[experiment]` is open under branch only, watch for main-sequence work starting, and surface it."
    80. kept — "Offer two recourses through the selection interface: suspend the experiment, or add a worktree."
    81. kept — "the engineer's intent decides"
    82. kept — "The watch rests on the branch name in the status line and on a judgment of whether the work answers the recorded question."
    83. kept — "The session-start notice reports every implementation not concluded."
    84. kept — "A `[feature]` has no watch"
    85. less precise — "The record names it" (upstream); "Record the base as its commit SHA and the ref it came from." Missing: that the record carries the branch itself.
    86. kept — "Record both choices."

### Checker B

    1 kept — "An implementation runs on its own branch"
    2 kept — "through the five hinges"; "DBE is in effect either way"
    3 kept — "to a declared state"; "It is never left silently open."; "Every implementation ends in a declared state, or is suspended"; "The words are the implementations-convention's."
    4 kept — "An `[experiment]` is built to a question, and a `[feature]` to an intent"
    5 kept — "Name it `experiment/<subject>` or `feature/<subject>`, matching the tag."
    6 kept — "The subject is short, lower-case, and dash-separated, and names literally what is tested or built."
    7 kept — "Add `-run-<n>` only where an experiment has more than one run."
    8 kept — "With a worktree, the name carries `worktree/`: `experiment/worktree/<subject>`, `feature/worktree/<subject>`."
    9 kept — "Adding a worktree to work under way renames the branch."
    10 less precise — "The rename is confirmed, and the record carries it." Missing: that the rename is covered by the worktree addition's confirmation and needs no separate one; "is confirmed" can be read as requiring its own confirmation.
    11 kept — "Keep the upstream branch out of the name ... The record names it."
    12 kept — "Record the base as its commit SHA and the ref it came from."; "Make no git tag for the base." (that it goes in the implementation record is implied by "Record")
    13 kept — "A later run branches from the recorded commit."
    14 kept — "An experiment may run in phases, each a question that serves the experiment's."
    15 kept — "The record names the phases and their order at the start."
    16 kept — "The record states each phase's forecast before its work."
    17 kept — "a dot, and the phase's name: `experiment/rule-reduction.flattening`"; "Git refuses a slash here"
    18 kept — "A `worktree/` segment carries into each phase's name."
    19 kept — "A phase branches from the experiment's branch and concludes into it."
    20 less precise — "The engineer declares a phase affirmed, refuted, or inconclusive." Missing: "only" — that no verdict exists without the engineer's declaration.
    21 kept — "An affirmed phase merges back into the experiment's branch."
    22 kept — "The record carries each phase's verdict and findings."
    23 kept — "The experiment concludes after its phases, and only then merges to its upstream branch."
    24 kept — "A phase merges nowhere else."
    25 kept — "One phase runs at a time, in the record's order"
    26 kept — "each from the experiment's branch as the earlier phases left it"
    27 kept — "Put the working location through the selection interface at every start, with no default."
    28 kept — "Each option states what it creates"
    29 kept — "**Branch only** — Create the branch and switch this working tree to it. At the conclusion this working tree switches back."
    30 kept — "**Branch and worktree** — Create the branch as `<kind>/worktree/<subject>` and check it out in a new worktree: a second working directory at `<path>`. This working tree stays on `<upstream branch>`."
    31 kept — "**The current branch** — Build it where the working tree already is, creating nothing. There is no branch to switch back to and nothing to merge."
    32 kept — "Offer the current branch for a feature only."
    33 kept — "Offer the current branch last"
    34 less precise — "An experiment's changes must not reach the main line before it is affirmed". Missing: the target is the branch the experiment deviates from, which "the main line" may not match.
    35 kept — "Place a worktree beside the repository directory, named `<repository-name>-<branch, its slash as a dash>`"
    36 less precise — "Create with `git switch -c <branch>` or `git worktree add -b <branch> <path>`." Missing: that `git switch -c` is the command for branch only specifically.
    37 less precise — "or `git worktree add -b <branch> <path>`"; "Use `git worktree add <path> <branch>` only to add a worktree to work under way". Missing: an explicit statement that `-b` is not optional for new work.
    38 kept — "Use `git worktree add <path> <branch>` only to add a worktree to work under way"
    39 kept — "Change the location only by adding a worktree."; "Add one on one of two triggers: other work arrives that the engineer means to work alongside."; "Or the work is escalated, needing more isolation than it was taken for."
    40 kept — "Confirm the addition."
    41 kept — "Add a line to the record, and keep the original."
    42 kept — "The conclusion follows the location as it then stands."
    43 kept — "Never collapse a worktree back." (it does not name "to branch only", but "back" can only mean that)
    44 kept — "Put attended or unattended through the selection interface beside the working location."
    45 kept — "Each choice is made once and held for the work's duration."
    46 kept — "Attended is the default."
    47 kept — "DBE is in effect either way, and only the stopping changes"
    48 kept — "The words are the implementations-convention's."
    49 kept — "An `[experiment]` is affirmed only on the engineer's explicit declaration."
    50 kept — "On affirmation, its log is copied into the project decision log."
    51 kept — "Where it produced implementation, its branch merges to the upstream branch"
    52 kept — "after the tests"
    53 kept — "Where no test covers the work, the merge also waits for specific confirmation."
    54 kept — "An observation-only experiment's affirmation is the log copy alone."
    55 less precise — "because run-suite-before-commit verified every commit". Missing: verification before integrating is stated only as a reason given in passing, not as a requirement.
    56 kept — "A `[feature]` merges with no gate"
    57 kept — "The merged result can still break the suite, and that is fixed from there."
    58 kept — "A feature has no affirmation."
    59 kept — "Refuted, inconclusive, abandoned, and superseded work keeps its record."; "... does not merge."
    60 less precise — "keeps its record". Missing: that the record is maintained and marked.
    61 kept — "The superseded implementation stays Suspended ... until the engineer concludes it as superseded."
    62 kept — "its branch kept, until the engineer concludes it as superseded"
    63 kept — "The two records name each other."
    64 kept — "The child merges the parent first"
    65 kept — "The parent is then parked Superseded"
    66 kept — "The child takes the parent's upstream."
    67 less precise — "The parent branch is deleted on confirmation." Missing: "only", so deletion without confirmation is not plainly ruled out.
    68 less precise — "Conclude in the main working tree, on the upstream branch." Missing: "and leave the engineer there."
    69 kept — "Under branch only, the working tree switches back."
    70 kept — "Under a worktree, end the session in the main working tree, never in the removed directory."
    71 kept — "Branch deletion takes one confirmation from the engineer, through the selection interface."
    72 kept — "Remove the worktree first, since git refuses to delete a branch checked out in a worktree."
    73 less precise — "Branch deletion takes one confirmation". Missing: that the one confirmation also covers removing the worktree.
    74 kept — "Suspension deletes no branch and removes no worktree."
    75 kept — "Do not offer to conclude, affirm, refute, or merge one: not as a next step, an option, or a precondition."
    76 kept — "Report what is settled and what is open, and stop."
    77 kept — "An experiment's length is the engineer's judgment, not readable from the work done."
    78 kept — "A `[feature]` is not covered"
    79 kept — "While an `[experiment]` is open under branch only, watch for main-sequence work starting, and surface it."
    80 kept — "Offer two recourses through the selection interface: suspend the experiment, or add a worktree."
    81 kept — "the engineer's intent decides"
    82 kept — "The watch rests on the branch name in the status line and on a judgment of whether the work answers the recorded question."
    83 kept — "The session-start notice reports every implementation not concluded."
    84 kept — "A `[feature]` has no watch"
    85 less precise — "The record names it" (upstream); "Record the base"; "the record carries it" (the rename). Missing: an explicit statement that the record carries the branch itself.
    86 kept — "Record both choices." (working location and participation)

    Totals: 73 kept, 13 less precise (10, 20, 34, 36, 37, 55, 60, 67, 68, 73, 85, and the two command-mapping items 36–37 counted above), 0 lost.

### The directive list, as the listing agent gave it

    1. An implementation must run on a branch created for it.
    2. An implementation must be designed through the five hinges (DBE is followed inside it).
    3. An implementation must reach one of a fixed set of declared states, or be suspended, and must never be left silently open.
    4. An `[experiment]` is built to a question, and a `[feature]` is built to an intent.
    5. Name an implementation's branch `experiment/<subject>` or `feature/<subject>`, matching its tag.
    6. The branch's `<subject>` must be a short, dash-separated, lower-case name of what is under test or what is being built, named literally.
    7. Add a `-run-<n>` suffix to an experiment's branch name only where the experiment actually has multiple runs.
    8. Where an implementation has a worktree, its branch name must carry `worktree/`, as in `feature/worktree/<subject>` and `experiment/worktree/<subject>`.
    9. Adding a worktree to work already under way renames the branch to carry the `worktree/` segment.
    10. That rename is part of the worktree addition the engineer has already confirmed and the record carries, so it needs no separate confirmation.
    11. The upstream branch must not be encoded in the branch name. The record names it.
    12. Record the base in the implementation record as the base commit SHA and the ref it came from, and do not create a tag for it.
    13. A later run of an experiment branches straight from the recorded base commit.
    14. An experiment may run in phases, each a question of its own that serves the experiment's question.
    15. The experiment's record must name its phases and their order at the start.
    16. The experiment's record must state a forecast for each phase before that phase's work.
    17. A phase's branch name is the experiment's branch name, a dot, and the phase's name (for example `experiment/rule-reduction.flattening`), never joined by a slash.
    18. Where the experiment has a `worktree/` segment, it carries into each phase's branch name.
    19. A phase branches from the experiment's branch and concludes into it.
    20. A phase is affirmed, refuted, or inconclusive only on the engineer's declaration.
    21. An affirmed phase merges back into the experiment's branch.
    22. The experiment's record must carry each phase's verdict and findings.
    23. An experiment with phases concludes only after its phases, and only then merges to its upstream branch.
    24. A phase never merges anywhere other than the experiment's branch.
    25. Only one phase runs at a time, in the order the record names.
    26. Each phase starts from the experiment's branch as the phases before it left it.
    27. Put the working location through the selection interface at the start of every implementation, with no standing default.
    28. Each working-location option must state what it creates.
    29. The "Branch only" option must say that it creates the branch and switches this working tree to it, and that this working tree switches back at the conclusion.
    30. The "Branch and worktree" option must say that it creates the branch as `<kind>/worktree/<subject>` and checks it out in a new worktree, a second working directory at `<path>`, while this working tree stays on `<upstream branch>`.
    31. The "The current branch" option must say that it builds where the working tree already is, creates nothing, and leaves no branch to switch back to and nothing to merge.
    32. Offer the current-branch option only for a `[feature]`, never for an `[experiment]`.
    33. Offer the current-branch option last.
    34. Until an experiment is affirmed, its changes must not reach the branch it deviates from.
    35. A worktree must be a sibling of the repository directory, named `<repository-name>-<branch with its slash written as a dash>` (for example `constant-feature-upload-retries`).
    36. Create a branch-only implementation with `git switch -c <branch>`.
    37. Create a worktree for new work with `git worktree add -b <branch> <path>`. The `-b` is not optional.
    38. Use `git worktree add <path> <branch>` (without `-b`) only when adding a worktree to work already under way.
    39. The working location changes only by adding a worktree, and only on one of two triggers: other work arrives that the engineer intends to work alongside this one, or the work is escalated because it needs more isolation than the single working tree gives it.
    40. Adding a worktree must be confirmed.
    41. Adding a worktree must be recorded by adding a line to the record, not by rewriting the original.
    42. The conclusion is carried out according to the current working location.
    43. Never collapse a worktree back to branch only.
    44. Put the choice of attended or unattended through the selection interface at the start, beside the working location.
    45. The working-location and participation choices are each made once and held for the duration of the work.
    46. Attended is the default.
    47. DBE is in effect whether the work is attended or unattended. Only the stopping changes.
    48. Use the implementations-convention's words for the declared end states.
    49. An `[experiment]` is affirmed only on the engineer's explicit declaration.
    50. When an experiment is affirmed, copy its log into the project decision log.
    51. When an affirmed experiment produced implementation, merge its branch to the upstream branch.
    52. An affirmed experiment's merge must wait on the tests.
    53. An affirmed experiment's merge must also wait on specific confirmation where no test covers what was built.
    54. An observation-only experiment has nothing to merge, so its affirmation is the log copy alone.
    55. A `[feature]` must be verified before integrating.
    56. Add no gate at a feature's merge.
    57. If a feature breaks the suite on integration, fix it from there.
    58. A feature has no affirmation step.
    59. Refuted, inconclusive, abandoned, and superseded implementations keep their record and do not merge.
    60. The record of a refuted, inconclusive, abandoned, or superseded implementation must be maintained and marked.
    61. A superseded implementation stays Suspended until the engineer explicitly concludes it as superseded.
    62. A superseded implementation's branch must be kept until it is concluded as superseded.
    63. The records of a superseded implementation and of the one superseding it must each name the other.
    64. When a child supersedes its parent, the child must merge the parent first.
    65. After that merge, the parent is parked `Superseded`.
    66. When a child supersedes its parent, the child's upstream becomes what the parent's upstream was.
    67. When a child supersedes its parent, the parent branch is deleted only on confirmation.
    68. Conclude in the main working tree, on the upstream branch, and leave the engineer there.
    69. With branch only, the working tree switches back to the upstream branch at the conclusion.
    70. Under a worktree, the session must end in the main working tree, not in a directory that has been removed.
    71. Branch deletion must be confirmed by the engineer through the selection interface.
    72. The worktree must be removed before its branch is deleted.
    73. One confirmation covers both the worktree removal and the branch deletion.
    74. Suspension never deletes a branch and never removes a worktree.
    75. Do not offer to conclude, affirm, refute, or merge an `[experiment]`: not as a next step, not as an option among others, and not as a precondition for something else.
    76. Report what is settled and what is open in an experiment, and stop there.
    77. An experiment's length is the engineer's judgment and must not be read from how much work the branch holds.
    78. The prohibition on raising an experiment's end does not apply to a `[feature]`.
    79. While an `[experiment]` is open under branch only, watch for main-sequence work starting, and surface it rather than letting the branches silently diverge.
    80. When surfacing that drift, offer two recourses through the selection interface: suspend the experiment, or add a worktree.
    81. The engineer's intent decides between suspending the experiment and adding a worktree.
    82. The drift watch rests on the branch name shown in the status line and on a judgment of whether the work at hand answers the recorded question.
    83. The session-start notice must report every implementation that has not concluded.
    84. There is no drift watch for a `[feature]`.
    85. The record must carry the upstream branch, the branch, and the base.
    86. The record must carry the chosen working location and participation level.

## 15

### The rewriter's answer

    1. The harness announces Waytide, through three surfaces it renders.
    2. The agent prints no notice, at session start or at any other time.
    3. An agent-printed copy would only duplicate the harness's.
    4. The one thing the agent prints at the start is the package set stanza, where a project shows one, because it needs markdown.

    ## The session-start notice

    1. A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice:

    ```
    Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git
    3 implementations open: gate-forecasting (no state recorded), shipped-test-tree-script (suspended), upload-retries (suspended)

    Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.

    To load them now, type: load waytide.
    ```

    2. The install line enumerates what is on disk.
    3. A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it.
    4. Nothing prints a fixed list.
    5. The open line names experiments and features that have not concluded, read from each record's `**State:**` line under `waytide/local/implementations/`.
    6. An experiment that is Affirmed, Refuted, Inconclusive, Abandoned, or Superseded has concluded.
    7. A feature that is Completed, Abandoned, or Superseded has concluded.
    8. One that is Suspended or carries no state line is reported.
    9. With nothing open, the open line is absent.
    10. The open line exists because an experiment must never be left silently open. One worked in a worktree leaves no trace in the main working tree.
    11. The close is always present: the caveat, then the command on a line of its own, last.
    12. A blank line precedes the close, after any open line, because the close asks and everything above it reports.
    13. A second blank line stands the command alone, so it is read and copied without reading past anything.
    14. The caveat says `a few moments`, because the read is a wait an engineer sees.
    15. The command names the read outright, so an engineer new to the system can act on it.
    16. Something the engineer types is required in any case, since the agent produces nothing until the engineer speaks.
    17. This gives up a contentless foil word whose only effect came through the hook's channel. So that channel is no longer testable from ordinary use.
    18. The trade of observability for legibility is deliberate.
    19. The notice says `installed`, never `loaded`.
    20. A hook runs before the session. It can observe that the packages are on disk and the configuration is live, and not that any rule was read.
    21. The close's `are loaded` describes what the session does next, and reports no read.
    22. Call it the session-start notice, not the load notice.
    23. The status line reports the system active, a claim about the configuration rather than the agent.
    24. The notice is plain text. The harness renders `systemMessage` literally, so markup reaches the engineer as punctuation.
    25. The notice carries no mark. The startup display prints it (see the initialization-rule).
    26. Put no quotation marks, and no lone backslash, in anything the hook emits.
    27. `printf` interpolates the notice and the instruction into a JSON string with no escaping.
    28. A double quote ends the string, and a lone backslash begins an invalid escape.
    29. Either way the harness fails to parse the output, and the notice disappears with no error.

    ## The read instruction

    1. The same hook carries the read instruction to the agent on a separate channel.
    2. The notice goes in `systemMessage`, for the engineer.
    3. The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent and is never displayed.
    4. They are different texts for different readers.
    5. The read is unconditional. The apparent size of the first request is not a reason to defer it.
    6. A session opened with a one-line request once skipped the read. It grew into rule edits and publishes governed by rules never read.
    7. The hook carries the whole instruction, as the following points state.
    8. Read `foundation/` first, and each package's `vocabulary.md`.
    9. Read the compiled rules, leaving out each package's `source/` directory and `README.md`.
    10. Read the project's `local/rules/` and `local/vocabulary.md`.
    11. Each is named whether or not it exists, and its absence is ordinary.
    12. Name the other working directories and leave them out.
    13. Do not print the startup display.
    14. Print no package count.
    15. Then wait for the engineer's request.
    16. `load waytide` asks for exactly that read and nothing more.
    17. This rule does not restate the directory list.
    18. `session-start.sh` is the only place the list is enumerated, since a second copy drifted once.
    19. The mark's art is not carried on this channel. The display hook reads it from the initialization-rule.
    20. Nothing verifies the read. The hook cannot observe what the agent does.
    21. The instruction removes one excuse: an instruction buried in a file the agent may not open.
    22. Instructing is not vouching: the notice still reports nothing about whether the agent read the rules.
    23. The work honoring the rules is the verification.

    ## The status line

    1. `waytide/system/foundation/statusline.sh` keeps the system's presence on screen all session:

    ```
    waytide · master :: Waytide
    waytide · master · uncommitted changes · untracked files · unpushed commits :: Waytide
    ```

    2. The repository name leads, in bold. The bold is a terminal escape sequence the harness passes through.
    3. The bold repository name is the only emphasis on the line.
    4. A middle dot separates the engineer's segments.
    5. The Waytide segment trails after a double colon, which separates and does nothing else. So the segment reads as an annotation on the line.
    6. The Waytide segment is one word, with no package count.
    7. Presence is read from disk, by the same README test the notice uses.
    8. The detail is the status report's (see the status-report-format rule).
    9. `uncommitted changes` appears when there is a modified tracked file, a staged change, or an untracked file that is not ignored.
    10. It is words, not a mark like `master*`.
    11. `untracked files` names the case whose remedy differs: add or ignore, not commit.
    12. An untracked file raises both segments, deliberately, so `uncommitted changes` alone answers whether anything is uncommitted.
    13. Segments that can show together are named in words that read distinctly.
    14. `unpushed commits` carries no count and never reaches the network.
    15. It compares against the remote-tracking ref, so it reflects the last fetch.
    16. A branch with no upstream reports nothing, since unpushed is relative to an upstream.
    17. An upstream missing by accident is a different fact, and is deliberately not folded into this segment.

    ## The startup display

    1. When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`.
    2. It prints the title, the copyright and license, the loading line, and the figure, read from the initialization-rule.
    3. It prints them once, on that command only.
    4. The agent does not print it.

    ## Wiring

    1. A committed `.claude/settings.json` wires the three surfaces.
    2. `install.sh` places it in a consuming project.
    3. `install.sh` warns when git ignores `.claude/` and the file is not tracked.
    4. The fix is `.claude/*` with `!.claude/settings.json`, since git cannot re-include a file inside an excluded directory.
    5. The fix keeps `.claude/settings.local.json` ignored.
    6. A project-level `statusLine` replaces the engineer's own, so the script renders the directory and branch too.
    7. `install.sh` never merges into an existing `.claude/settings.json`. It prints the block and leaves the decision to the engineer.

    ## There is no opt-out

    1. These surfaces exist so that a system read every session says so.
    2. The read instruction is emitted every session.

    ## What this costs

    1. The mechanism works only where a harness reads `.claude/settings.json`.
    2. Elsewhere the system loads through the `AGENTS.md` bootstrap, silently.
    3. A setting that disables hooks silences it too.
    4. A newly placed `.claude/settings.json` may not take effect until the harness reloads.
    5. **Why:** An agent-printed notice was unreliable, since nothing revealed when the agent skipped it. It was also badly placed, inside a reply where it cluttered the answer or was scrolled past. Both came from the party announced also being the announcer. The harness removes the dependence on the agent, and puts the notice outside the response.

### Checker A

    1. kept — "The agent prints no notice, at session start or at any other time."
    2. kept — "Do not print the startup display." / "The agent does not print it."
    3. kept — "The one thing the agent prints at the start is the package set stanza, where a project shows one"
    4. kept — "A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice"
    5. kept — "Waytide installed at waytide/system/ — …" / "To load them now, type: load waytide." / "The command names the read outright"
    6. kept — "The open line names experiments and features that have not concluded" / "A blank line precedes the close, after any open line" (the example puts it between the install line and the close)
    7. kept — "The notice carries no mark. The startup display prints it (see the initialization-rule)." together with "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs … startup-display.sh"
    8. kept — "Put no quotation marks, and no lone backslash, in anything the hook emits." / "a lone backslash begins an invalid escape"
    9. kept — "read from each record's `**State:**` line under `waytide/local/implementations/`"
    10. kept — "An experiment that is Affirmed, Refuted, Inconclusive, Abandoned, or Superseded has concluded." / "A feature that is Completed, Abandoned, or Superseded has concluded." / "names experiments and features that have not concluded"
    11. kept — "One that is Suspended or carries no state line is reported."
    12. kept — "With nothing open, the open line is absent."
    13. kept — "keeps the system's presence on screen all session" / "the script renders the directory and branch too"
    14. kept — "The repository name leads, in bold. The bold is a terminal escape sequence"
    15. kept — "The bold repository name is the only emphasis on the line."
    16. kept — "The Waytide segment is one word, with no package count."
    17. kept — "Presence is read from disk, by the same README test the notice uses."
    18. kept — "The Waytide segment trails after a double colon"
    19. kept — "A middle dot separates the engineer's segments."
    20. less precise — "`uncommitted changes` appears when there is a modified tracked file, a staged change, or an untracked file that is not ignored." Missing: "only when". It does not say the segment is absent otherwise.
    21. kept — "It is words, not a mark like `master*`."
    22. less precise — "An untracked file raises both segments" / "`untracked files` names the case whose remedy differs". Missing: the condition for when the segment appears, and the "not ignored" qualifier.
    23. kept — "An untracked file raises both segments, deliberately, so `uncommitted changes` alone answers whether anything is uncommitted."
    24. less precise — "`unpushed commits` … compares against the remote-tracking ref" (and the example). Missing: an explicit condition that the segment appears when committed work exists only in this working copy.
    25. lost — Missing: the requirement that segments which can appear together be named in words that read distinctly.
    26. kept — "`unpushed commits` carries no count"
    27. kept — "never reaches the network" / "It compares against the remote-tracking ref, so it reflects the last fetch."
    28. kept — "A branch with no upstream reports nothing" / "An upstream missing by accident is a different fact, and is deliberately not folded into this segment."
    29. kept — "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`." / "It prints the title, the copyright and license, the loading line, and the figure"
    30. kept — "read from the initialization-rule"
    31. kept — "It prints them once, on that command only."
    32. kept — "A committed `.claude/settings.json` wires the three surfaces." / "`install.sh` places it in a consuming project."
    33. kept — "The notice goes in `systemMessage`, for the engineer." / "The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent" / "on a separate channel"
    34. kept — "They are different texts for different readers."
    35. less precise — "The hook carries the whole instruction" / "`load waytide` asks for exactly that read and nothing more." Missing: that the agent's instructions reach it only through `additionalContext`, and that the command only names the read.
    36. kept — "The read is unconditional. The apparent size of the first request is not a reason to defer it."
    37. kept — "The read instruction is emitted every session." / "The read is unconditional."
    38. kept — the example: "Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments." then, on its own line, "To load them now, type: load waytide."
    39. kept — "The close is always present"
    40. kept — "A blank line precedes the close"
    41. kept — "after any open line"
    42. kept — "A second blank line stands the command alone"
    43. kept — "the caveat, then the command on a line of its own, last"
    44. kept — "The command names the read outright" / "type: load waytide."
    45. kept — "The caveat says `a few moments`"
    46. kept — "The notice is plain text. The harness renders `systemMessage` literally, so markup reaches the engineer as punctuation."
    47. kept — "The close's `are loaded` describes what the session does next, and reports no read."
    48. kept — "Put no quotation marks … in anything the hook emits."
    49. kept — "Read `foundation/` first"
    50. kept — "and each package's `vocabulary.md`"
    51. kept — "Read the project's `local/rules/` and `local/vocabulary.md`."
    52. kept — "Name the other working directories and leave them out."
    53. kept — "Print no package count."
    54. kept — "Then wait for the engineer's request."
    55. kept — "Each is named whether or not it exists, and its absence is ordinary."
    56. kept — "Each is named whether or not it exists, and its absence is ordinary."
    57. kept — "Read the compiled rules, leaving out each package's `source/` directory and `README.md`."
    58. less precise — "Read the project's `local/rules/` and `local/vocabulary.md`." Missing: "nothing else", and the ban on naming `local/` as a whole in place of the two.
    59. kept — "This rule does not restate the directory list." / "`session-start.sh` is the only place the list is enumerated"
    60. kept — "Do not print the startup display." (the "UserPromptSubmit hook" carries the reason that the harness prints it)
    61. kept — "The mark's art is not carried on this channel. The display hook reads it from the initialization-rule." Only the stated reason, that the rule is not a JSON literal, is gone.
    62. kept — "To load them now, type: load waytide." / "`load waytide` asks for exactly that read and nothing more."
    63. kept — "The install line enumerates what is on disk." / "Nothing prints a fixed list." / "Presence is read from disk". Only the authoring-source `system/` path is not named.
    64. kept — "A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it."
    65. kept — "Nothing prints a fixed list."
    66. kept — "It can observe that the packages are on disk and the configuration is live, and not that any rule was read." / "the notice still reports nothing about whether the agent read the rules"
    67. kept — "Instructing is not vouching: the notice still reports nothing about whether the agent read the rules."
    68. kept — "The notice says `installed`, never `loaded`."
    69. kept — "Call it the session-start notice, not the load notice."
    70. kept — "The status line reports the system active, a claim about the configuration rather than the agent."
    71. less precise — "`install.sh` warns when git ignores `.claude/` and the file is not tracked." Missing: that the check is whether `.claude/settings.json` itself is ignored, and that the warning prints how to correct it.
    72. less precise — "The fix is `.claude/*` with `!.claude/settings.json`, since git cannot re-include a file inside an excluded directory." Missing: that the fix replaces the `.claude/` rule rather than adding a negation under it. The reason given implies this but does not state it.
    73. kept — "`install.sh` never merges into an existing `.claude/settings.json`. It prints the block and leaves the decision to the engineer."
    74. less precise — "There is no opt-out" (a heading). Missing: that the surfaces cannot be silenced and that no opt-out may be added (for example `WAYTIDE_QUIET`).
    75. kept — "The read instruction is emitted every session."
    76. kept — "A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`" / "`waytide/system/foundation/statusline.sh` keeps the system's presence on screen" / "A committed `.claude/settings.json` wires the three surfaces." / "A project-level `statusLine` replaces the engineer's own"

    Totals: 66 kept, 9 less precise (20, 22, 24, 35, 58, 71, 72, 74), 1 lost (25).

### Checker B

    1. kept — "The agent prints no notice, at session start or at any other time."
    2. kept — "Do not print the startup display." / "The agent does not print it."
    3. kept — "The one thing the agent prints at the start is the package set stanza, where a project shows one"
    4. kept — "A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice"
    5. kept — the example notice ("Waytide installed at ..." / "To load them now, type: load waytide.") and "The command names the read outright"
    6. kept — "The open line names experiments and features that have not concluded", with the example placing the open line between the install line and the close, and "after any open line"
    7. kept — "The notice carries no mark. The startup display prints it (see the initialization-rule)." together with "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs ... startup-display.sh"
    8. kept — "Put no quotation marks, and no lone backslash, in anything the hook emits." / "`printf` interpolates ... with no escaping." / "a lone backslash begins an invalid escape"
    9. kept — "read from each record's `**State:**` line under `waytide/local/implementations/`"
    10. kept — "An experiment that is Affirmed, Refuted, Inconclusive, Abandoned, or Superseded has concluded." / "A feature that is Completed, Abandoned, or Superseded has concluded."
    11. kept — "One that is Suspended or carries no state line is reported."
    12. kept — "With nothing open, the open line is absent."
    13. kept — "keeps the system's presence on screen all session" / "the script renders the directory and branch too"
    14. kept — "The repository name leads, in bold. The bold is a terminal escape sequence the harness passes through."
    15. kept — "The bold repository name is the only emphasis on the line."
    16. kept — "The Waytide segment is one word, with no package count."
    17. kept — "Presence is read from disk, by the same README test the notice uses."
    18. kept — "The Waytide segment trails after a double colon"
    19. kept — "A middle dot separates the engineer's segments."
    20. less precise — "`uncommitted changes` appears when there is a modified tracked file, a staged change, or an untracked file that is not ignored." Missing: "only when". The segment's absence otherwise is not stated.
    21. kept — "It is words, not a mark like `master*`."
    22. kept — "An untracked file raises both segments"
    23. kept — "An untracked file raises both segments, deliberately, so `uncommitted changes` alone answers whether anything is uncommitted."
    24. less precise — "It compares against the remote-tracking ref" and the example line. Missing: the condition under which the segment appears (committed work that exists only in this working copy) is never stated.
    25. lost — Missing: the requirement that segments which can be present at once are named in words that read distinctly.
    26. kept — "`unpushed commits` carries no count"
    27. kept — "never reaches the network" / "It compares against the remote-tracking ref, so it reflects the last fetch."
    28. kept — "A branch with no upstream reports nothing" / "An upstream missing by accident is a different fact, and is deliberately not folded into this segment."
    29. kept — "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs ... startup-display.sh." / "It prints the title, the copyright and license, the loading line, and the figure"
    30. kept — "read from the initialization-rule"
    31. kept — "It prints them once, on that command only."
    32. kept — "A committed `.claude/settings.json` wires the three surfaces." / "`install.sh` places it in a consuming project."
    33. kept — "The notice goes in `systemMessage`, for the engineer." / "The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent"
    34. kept — "They are different texts for different readers."
    35. less precise — "The hook carries the whole instruction" / "`load waytide` asks for exactly that read and nothing more." Missing: that what the agent is to do reaches it only through `additionalContext`, and that the command only names the read.
    36. kept — "The read is unconditional. The apparent size of the first request is not a reason to defer it."
    37. kept — "The read instruction is emitted every session." / "The read is unconditional."
    38. kept — the example's close: "Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments." followed by "To load them now, type: load waytide." on its own line
    39. kept — "The close is always present"
    40. kept — "A blank line precedes the close"
    41. kept — "A blank line precedes the close, after any open line"
    42. kept — "A second blank line stands the command alone"
    43. kept — "the caveat, then the command on a line of its own, last."
    44. kept — "type: load waytide." / "The command names the read outright"
    45. kept — "The caveat says `a few moments`"
    46. kept — "The notice is plain text. The harness renders `systemMessage` literally"
    47. kept — "The close's `are loaded` describes what the session does next, and reports no read."
    48. kept — "Put no quotation marks ... in anything the hook emits."
    49. kept — "Read `foundation/` first"
    50. kept — "and each package's `vocabulary.md`"
    51. kept — "Read the project's `local/rules/` and `local/vocabulary.md`."
    52. kept — "Name the other working directories and leave them out."
    53. kept — "Print no package count."
    54. kept — "Then wait for the engineer's request."
    55. kept — "Each is named whether or not it exists, and its absence is ordinary."
    56. kept — "Each is named whether or not it exists, and its absence is ordinary."
    57. kept — "Read the compiled rules, leaving out each package's `source/` directory and `README.md`."
    58. less precise — "Read the project's `local/rules/` and `local/vocabulary.md`." Missing: "and nothing else", and the ban on naming `local/` as a whole in place of the two.
    59. kept — "This rule does not restate the directory list." / "`session-start.sh` is the only place the list is enumerated"
    60. kept — "Do not print the startup display." together with the startup display section, where the hook prints it
    61. kept — "The mark's art is not carried on this channel. The display hook reads it from the initialization-rule." (The reason, that it is not a JSON literal there, is not given.)
    62. less precise — "To load them now, type: load waytide." / "`load waytide` asks for exactly that read and nothing more." Missing: the requirement that both channels word the command the same way.
    63. kept — "The install line enumerates what is on disk." / "Nothing prints a fixed list."
    64. kept — "A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it."
    65. kept — "Nothing prints a fixed list."
    66. kept — "It can observe that the packages are on disk and the configuration is live, and not that any rule was read." / "the notice still reports nothing about whether the agent read the rules"
    67. kept — "Instructing is not vouching: the notice still reports nothing about whether the agent read the rules."
    68. kept — "The notice says `installed`, never `loaded`."
    69. kept — "Call it the session-start notice, not the load notice."
    70. kept — "The status line reports the system active, a claim about the configuration rather than the agent."
    71. less precise — "`install.sh` warns when git ignores `.claude/` and the file is not tracked." Missing: that the warning prints how to correct it. It also checks `.claude/` rather than `.claude/settings.json` itself.
    72. kept — "The fix is `.claude/*` with `!.claude/settings.json`, since git cannot re-include a file inside an excluded directory." (The reason requires replacing the rule rather than adding a negation, though "replace" is not stated.)
    73. kept — "`install.sh` never merges into an existing `.claude/settings.json`. It prints the block and leaves the decision to the engineer."
    74. less precise — the heading "There is no opt-out". Missing: that the surfaces are not silenceable, the ban on adding an opt-out, and the removed `WAYTIDE_QUIET` example.
    75. less precise — "The read instruction is emitted every session." Missing: the explicit ban on quieting a display in a way that disables the mechanism carrying the instruction.
    76. less precise — "A committed `.claude/settings.json` wires the three surfaces", plus the hook and status-line scripts, which are named separately. Missing: an explicit statement that in settings.json the `SessionStart` hook points at session-start.sh and `statusLine` points at statusline.sh.

    Totals: 66 kept, 9 less precise (20, 24, 35, 58, 62, 71, 74, 75, 76), 1 lost (25).

## 2

### The rewriter's answer

    1. After each implementation hinge, show the whole feature's test output without being asked.
    2. First, write the accepted implementation and run the suite.
    3. Then run every test file of the current feature.
    4. The feature's tests are every outcome built so far for the unit, not only the new one.
    5. Run them with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show.
    6. Put the output in the turn that reports the implementation.
    7. The what-each-hinge-displays rule shows the implementation and the new outcome's test. This rule adds the feature's full output.
    8. **Why:** solubility is judged at this hinge, against behavior. The new outcome is judged among the outcomes already established, not alone.

### Checker A

    All 8 directives are kept in the shorter version. None is less precise or lost.

    1. kept — "After each implementation hinge, show the whole feature's test output" and "First, write the accepted implementation and run the suite."
    2. kept — "show the whole feature's test output without being asked"
    3. kept — "every outcome built so far for the unit, not only the new one"
    4. kept — "Then run every test file of the current feature." / "The feature's tests are every outcome built so far for the unit"
    5. kept — "Run them with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show."
    6. kept — "Put the output in the turn that reports the implementation."
    7. kept — "First, write the accepted implementation and run the suite." / "Then run every test file of the current feature."
    8. kept — "The what-each-hinge-displays rule shows the implementation and the new outcome's test. This rule adds the feature's full output." together with "After each implementation hinge"

### Checker B

    All 8 directives are kept in the shorter version. None is less precise or lost.

    1. kept — "After each implementation hinge, show the whole feature's test output" and "First, write the accepted implementation and run the suite."
    2. kept — "show the whole feature's test output without being asked."
    3. kept — "not only the new one" and "the whole feature's test output."
    4. kept — "Then run every test file of the current feature." and "The feature's tests are every outcome built so far for the unit, not only the new one."
    5. kept — "Run them with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show."
    6. kept — "Put the output in the turn that reports the implementation."
    7. kept — "First, write the accepted implementation and run the suite." followed by "Then run every test file of the current feature."
    8. kept — "The what-each-hinge-displays rule shows the implementation and the new outcome's test. This rule adds the feature's full output." together with "After each implementation hinge."

## 7

### The rewriter's answer

    1. Waytide writes its prose in ASD-STE100 Simplified Technical English, which has an approved dictionary and 53 writing rules.
    2. STE Rules 1.5 through 1.13 let a project add its own technical nouns and technical verbs.
    3. The rules in this directory are Eventide Technical English, or ETE, which is Waytide's implementation of the standard.
    4. ETE is the STE dictionary and writing rules, with Waytide's reserved terms and its substitutions, in the sequence this rule states.
    5. `Say it in ETE` asks for ETE.
    6. `Say it in STE` asks for the raw standard, without `efferent`, `cradle`, `hinge`, or any other term Waytide reserved.
    7. The STE dictionary decides first.
    8. For a word the STE dictionary does not approve, it names an approved alternative.
    9. Use the alternative where it carries the meaning: `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`.
    10. Keep Waytide's word where the approved word means something else.
    11. Reserve that word as a technical noun or a technical verb, in a category its entry names, in the package's `vocabulary.md`.
    12. Record what the STE dictionary says about the reserved word.
    13. Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs.
    14. A word the dictionary does not list is not a defect.
    15. STE Rule 1.1 permits an unlisted word as a technical noun or a technical verb, as with `efferent`, `cradle`, and `solubility`.
    16. The worked instance is `sweep`: the STE dictionary replaces `sweep (v)` with `SCAN`.
    17. The `language` vocabulary discontinues `sweep` for `conform`: to bring code or prose into line with a convention.
    18. Neither `SCAN` nor `AGREE`, which the dictionary gives for `conform`, carries that meaning, so `conform` is reserved and wins.
    19. A substitution replaces a word Waytide rejects.
    20. A reservation keeps a word STE rejects.
    21. A substitution and a reservation are different acts, and `conform` is both.
    22. An absent word and a word that is not approved differ.
    23. An absent word is a gap: the standard never considered it, as with most terms Waytide coined.
    24. A word that is not approved is a disagreement: the standard considered it and named something else.
    25. A reservation of a word that is not approved rejects the standard's decision.
    26. So the record says which case a reserved term is in.
    27. `reserve` is absent.
    28. `discontinue` is not approved, and the dictionary gives `STOP`.
    29. Three rules beside this one carry ETE's departures from the standard.
    30. The ete-declares-its-own-categories rule adds five categories of Waytide's own, against STE Rules 1.5 and 1.12.
    31. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take its entry's meaning, against STE Rule 1.3.
    32. The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves ordinary words alone, against STE Rule 1.1.
    33. **Why:** the dictionary is right about the ordinary word, and not about a term Waytide coined for a concept the standard never addressed. Settling once which decides, and when, keeps a writer from choosing a worse word out of deference.

### Checker A

    I checked all 20 directives against the shorter version. 19 are kept, 1 is less precise and none are lost.

    1. kept: "Waytide writes its prose in ASD-STE100 Simplified Technical English"
    2. kept: "ETE is the STE dictionary and writing rules, with Waytide's reserved terms and its substitutions, in the sequence this rule states"
    3. kept: "`Say it in ETE` asks for ETE"
    4. kept: "`Say it in STE` asks for the raw standard, without `efferent`, `cradle`, `hinge`, or any other term Waytide reserved"
    5. kept: "The STE dictionary decides first"
    6. kept: "Keep Waytide's word where the approved word means something else"
    7. kept: "The ete-declares-its-own-categories rule adds five categories of Waytide's own, against STE Rules 1.5 and 1.12"
    8. kept: "The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take its entry's meaning, against STE Rule 1.3"
    9. kept: "The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves ordinary words alone, against STE Rule 1.1"
    10. kept: "For a word the STE dictionary does not approve, it names an approved alternative" / "Use the alternative where it carries the meaning: `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`"
    11. kept: "Reserve that word as a technical noun or a technical verb, in a category its entry names"
    12. kept: "Reserve that word ... in the package's `vocabulary.md`"
    13. kept: "Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs"
    14. kept: "A word the dictionary does not list is not a defect" / "STE Rule 1.1 permits an unlisted word as a technical noun or a technical verb"
    15. kept: "The `language` vocabulary discontinues `sweep` for `conform`: to bring code or prose into line with a convention" / "Neither `SCAN` nor `AGREE` ... carries that meaning, so `conform` is reserved and wins"
    16. kept: "So the record says which case a reserved term is in" (with "An absent word and a word that is not approved differ")
    17. kept: "A substitution and a reservation are different acts"
    18. less precise: "keeps a writer from choosing a worse word out of deference". This appears only as a reason in the **Why** line. It is not given as a prohibition, and it does not say "to the STE dictionary".
    19. kept: "The STE dictionary decides first" / "Waytide writes its prose in ASD-STE100 Simplified Technical English"
    20. kept: "Record what the STE dictionary says about the reserved word"

### Checker B

    1. kept: "Waytide writes its prose in ASD-STE100 Simplified Technical English"
    2. kept: "ETE is the STE dictionary and writing rules, with Waytide's reserved terms and its substitutions, in the sequence this rule states."
    3. kept: "`Say it in ETE` asks for ETE."
    4. kept: "`Say it in STE` asks for the raw standard, without `efferent`, `cradle`, `hinge`, or any other term Waytide reserved."
    5. kept: "The STE dictionary decides first."
    6. kept: "Keep Waytide's word where the approved word means something else."
    7. kept: "The ete-declares-its-own-categories rule adds five categories of Waytide's own, against STE Rules 1.5 and 1.12."
    8. kept: "The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take its entry's meaning, against STE Rule 1.3."
    9. kept: "The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves ordinary words alone, against STE Rule 1.1."
    10. kept: "For a word the STE dictionary does not approve, it names an approved alternative." / "Use the alternative where it carries the meaning: `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`."
    11. kept: "Reserve that word as a technical noun or a technical verb, in a category its entry names"
    12. kept: "in the package's `vocabulary.md`"
    13. kept: "Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs."
    14. kept: "A word the dictionary does not list is not a defect." / "STE Rule 1.1 permits an unlisted word as a technical noun or a technical verb"
    15. kept: "The `language` vocabulary discontinues `sweep` for `conform`: to bring code or prose into line with a convention." / "Neither `SCAN` nor `AGREE`, which the dictionary gives for `conform`, carries that meaning, so `conform` is reserved and wins."
    16. kept: "So the record says which case a reserved term is in." (with "An absent word and a word that is not approved differ.")
    17. kept: "A substitution and a reservation are different acts"
    18. less precise: "keeps a writer from choosing a worse word out of deference" — appears only as the rationale in the **Why:** line, not as a prohibition on the writer.
    19. kept: "Waytide writes its prose in ASD-STE100 Simplified Technical English, which has an approved dictionary" / "The STE dictionary decides first."
    20. kept: "Record what the STE dictionary says about the reserved word."

## git-a-sha-names-the-work-rather-than-the-commit

### The rewriter's answer

    1. A commit SHA from the engineer asks about the work the commit carries.
    2. That work is the item, the implementation, the rule, or the code change.
    3. The SHA does not ask about the commit's mechanics.
    4. The mechanics are the commit's message, its file list, its diff statistics, and the log entry that came with it.
    5. Answer from what the commit added or changed.
    6. If the commit carries an item, an implementation record, or a rule, read that file. Answer from its content.
    7. If the commit changes code, answer from what the code now does.
    8. Open the files the commit added or changed, rather than reporting their names.
    9. Give the mechanics when the question is about them. Answer each of *Was it pushed*, *what did it touch*, *is it on master*, and *what does its message say* directly.
    10. Give the mechanics when they are the substance. A merge, a revert, a rename, a force-push, and a rebase have the operation as their content.
    11. There is nothing behind those operations to read.
    12. Ask only where it is genuinely unclear.
    13. A bare SHA with no verb is the ordinary case. Give the substance for it.
    14. **Why:** Reporting the commit's bookkeeping is correct, but it is about the wrong thing. It costs the engineer a second turn to ask again.

### Checker A

    1 — kept — "A commit SHA from the engineer asks about the work the commit carries." / "That work is the item, the implementation, the rule, or the code change." / "The SHA does not ask about the commit's mechanics." / "The mechanics are the commit's message, its file list, its diff statistics, and the log entry that came with it."
    2 — kept — "Answer from what the commit added or changed."
    3 — kept — "If the commit carries an item, an implementation record, or a rule, read that file. Answer from its content."
    4 — kept — "If the commit changes code, answer from what the code now does."
    5 — kept — "Open the files the commit added or changed, rather than reporting their names."
    6 — kept — "Give the mechanics when the question is about them. Answer each of *Was it pushed*, *what did it touch*, *is it on master*, and *what does its message say* directly."
    7 — kept — "Give the mechanics when they are the substance. A merge, a revert, a rename, a force-push, and a rebase have the operation as their content." / "There is nothing behind those operations to read."
    8 — less precise — "Ask only where it is genuinely unclear." Missing: what to ask (whether the substance or the mechanics is wanted), and that the unclarity is judged by whether the sentence itself says which is wanted.
    9 — kept — "A bare SHA with no verb is the ordinary case. Give the substance for it." (The explicit "does not count as unclear" is not stated, but giving the substance requires the same behavior.)

### Checker B

    1. kept: "A commit SHA from the engineer asks about the work the commit carries." / "That work is the item, the implementation, the rule, or the code change." / "The SHA does not ask about the commit's mechanics." / "The mechanics are the commit's message, its file list, its diff statistics, and the log entry that came with it."
    2. kept: "Answer from what the commit added or changed."
    3. kept: "If the commit carries an item, an implementation record, or a rule, read that file. Answer from its content."
    4. kept: "If the commit changes code, answer from what the code now does."
    5. kept: "Open the files the commit added or changed, rather than reporting their names."
    6. kept: "Give the mechanics when the question is about them. Answer each of *Was it pushed*, *what did it touch*, *is it on master*, and *what does its message say* directly."
    7. kept: "Give the mechanics when they are the substance. A merge, a revert, a rename, a force-push, and a rebase have the operation as their content." / "There is nothing behind those operations to read."
    8. less precise: "Ask only where it is genuinely unclear." Missing: it does not say the question to ask is whether substance or mechanics is wanted, and it drops the condition "only where the sentence genuinely does not say".
    9. kept: "A bare SHA with no verb is the ordinary case. Give the substance for it." (It does not say outright that this case "does not count as unclear", but giving the substance already rules out asking.)

## git-announce-a-branch-switch-in-a-bordered-block

### The rewriter's answer

    1. When the agent switches branches, it prints this block.
    2. The block has a border of `=` characters above and below:

    ```
    ========================================
    BRANCH SWITCHED

      from    master
      to      experiment/ste-spec
      reason  the vocabulary comparison is
              recorded on this branch
    ========================================
    ```

    3. Print it on every switch.
    4. Print it when the engineer asked for the switch.
    5. Print it when the switch was made to reach a file.
    6. Print it when the switch goes back to the branch the session started on.
    7. Print it before reporting anything else about the work.

    ## The three fields

    1. **from** is the branch the working tree was on.
    2. **to** is the branch the working tree is on now.
    3. **reason** is why the agent switched, in one line or two.
    4. Fill all three fields.
    5. The reason states what the switch was for, not what the work is.
    6. The border is the requirement, not decoration.
    7. Only `=` characters above and below satisfy this rule.

    ## What this does not cover

    1. Creating a branch is a switch when the working tree moves to it.
    2. `git switch -c` prints the block, with `from` naming the base.
    3. A worktree adds a working directory rather than moving this one.
    4. Print no block for a worktree.
    5. The implementation-lifecycle rule governs the worktree case.
    6. A merge, a commit, or a push does not move the working tree.
    7. Print no block for a merge, a commit, or a push.
    8. **Why:** a switch changes what every path means, and later reports never show where the work landed. A block that cannot be scrolled past prevents silent switches.

### Checker A

    1. kept — "When the agent switches branches, it prints this block." (title: "Announce a branch switch in a bordered block")
    2. kept — "The block has a border of `=` characters above and below"
    3. kept — the example block's first line, "BRANCH SWITCHED", following "it prints this block" (it appears only in the example, not in a sentence)
    4. kept — "Print it on every switch."
    5. kept — "Print it when the engineer asked for the switch."
    6. kept — "Print it when the switch was made to reach a file."
    7. kept — "Print it when the switch goes back to the branch the session started on."
    8. kept — "**from** is the branch the working tree was on."
    9. kept — "**to** is the branch the working tree is on now."
    10. kept — "**reason** is why the agent switched"
    11. kept — "in one line or two."
    12. less precise — "The border is the requirement, not decoration." / "A block that cannot be scrolled past prevents silent switches." Missing: the announcement must not read as another line of a report.
    13. less precise — "Only `=` characters above and below satisfy this rule." Missing: any unmissable form satisfies the rule. The shorter version says the opposite: it makes `=` borders the only acceptable form, not just the settled one.
    14. kept — "Creating a branch is a switch when the working tree moves to it." / "`git switch -c` prints the block"
    15. kept — "with `from` naming the base."
    16. kept — "A worktree adds a working directory rather than moving this one." / "Print no block for a worktree."
    17. kept — "A merge, a commit, or a push does not move the working tree." / "Print no block for a merge, a commit, or a push."
    18. kept — "Print it before reporting anything else about the work."
    19. kept — "Fill all three fields."
    20. kept — "The reason states what the switch was for, not what the work is."

### Checker B

    1. kept — "When the agent switches branches, it prints this block." (the title also says "in a bordered block")
    2. kept — "The block has a border of `=` characters above and below"
    3. kept — the example block opens with "BRANCH SWITCHED", and line 1 says "it prints this block". The heading appears only in the example, never in the prose.
    4. kept — "Print it on every switch."
    5. kept — "Print it when the engineer asked for the switch."
    6. kept — "Print it when the switch was made to reach a file."
    7. kept — "Print it when the switch goes back to the branch the session started on."
    8. kept — "**from** is the branch the working tree was on."
    9. kept — "**to** is the branch the working tree is on now."
    10. kept — "**reason** is why the agent switched"
    11. kept — "in one line or two"
    12. less precise — "The border is the requirement, not decoration." and "A block that cannot be scrolled past prevents silent switches." Missing: that the announcement must not read as another line of a report.
    13. less precise — "Only `=` characters above and below satisfy this rule." This keeps `=` as the settled form, but it drops the allowance that any unmissable form satisfies the rule. It contradicts that allowance by making `=` the only acceptable form.
    14. kept — "Creating a branch is a switch when the working tree moves to it." and "`git switch -c` prints the block"
    15. kept — "with `from` naming the base"
    16. kept — "A worktree adds a working directory rather than moving this one." and "Print no block for a worktree."
    17. kept — "A merge, a commit, or a push does not move the working tree." and "Print no block for a merge, a commit, or a push."
    18. kept — "Print it before reporting anything else about the work."
    19. kept — "Fill all three fields."
    20. kept — "The reason states what the switch was for, not what the work is."

## git-commit-message-widths

### The rewriter's answer

    1. The subject line is at most 50 characters.
    2. The body is wrapped at 72 characters.
    3. The two numbers are separate budgets, not one convention.
    4. 50 is a display budget. `git log --oneline` and hosted commit lists truncate near there.
    5. 72 is a wrapping budget. `git log` indents the body four spaces, so 72 fits an 80-column terminal.
    6. Wrap the body in the message itself. Do not leave wrapping to the terminal.

    ## When the subject will not fit

    1. Split the commit, or move the detail to the body. Try them in that order.
    2. A subject that will not fit usually means the commit does too much. Treat that as the main reason to split.
    3. Do not abbreviate a subject into something a reader must decode.
    4. Use plain words, not contractions.
    5. The `language` package's rules hold in commit messages too.
    6. The body has no limit on what it says. Its only constraint is line width.
    7. A journal entry is the one record where neither remedy is available. It truncates instead.
    8. An entry is one commit, so there is nothing to split.
    9. An entry's subject is the writer's words, which the `journal` package bars the agent from shortening.
    10. Cut a journal entry's commit subject at the 50th character with an ellipsis. See that package's journal-convention.
    11. Truncation is not a general escape. It is available for a journal entry alone.
    12. Everywhere else, a subject that will not fit is a commit to split.

    ## What still governs the subject

    1. The subject-first-commit-messages rule is unchanged.
    2. The subject is the software, never the engineer.
    3. The subject is a fact stated in passive voice and indicative mood.
    4. The commit-says-task-is-done-not-mark-done rule is unchanged too.
    5. Those rules push length up, and that is accepted.
    6. Write the subject within the budget.
    7. Do not drop the subject and lead with a verb to save space.
    8. A prefix spends the budget.
    9. The journal's commit prefix is `Journal:`, which costs 9 characters. It carries no date. See the `journal` package's journal-convention.

    ## The history is not rewritten

    1. Every commit written before 2026-08-18 stands as written.
    2. Do not revise a commit message already written to suit a later convention.
    3. **Why:** git's tooling is built around these numbers, so messages written to them read as written everywhere. The subject limit also exposes an oversized commit while it is being written, when splitting is cheapest.

### Checker A

    1. kept: "The subject line is at most 50 characters."
    2. kept: "The body is wrapped at 72 characters."
    3. kept: "Split the commit, or move the detail to the body. Try them in that order."
    4. kept: "Do not abbreviate a subject into something a reader must decode." / "Use plain words, not contractions."
    5. kept: "The `language` package's rules hold in commit messages too."
    6. kept: "The body has no limit on what it says. Its only constraint is line width." (with "move the detail to the body")
    7. kept: "A journal entry is the one record where neither remedy is available. It truncates instead." / "Cut a journal entry's commit subject at the 50th character with an ellipsis."
    8. kept: "An entry's subject is the writer's words, which the `journal` package bars the agent from shortening."
    9. less precise: "Truncation is not a general escape. It is available for a journal entry alone." / "Everywhere else, a subject that will not fit is a commit to split." Missing: the general test, "where the subject is not the agent's to rewrite". The shorter version names only the journal case.
    10. kept: "The subject-first-commit-messages rule is unchanged." / "The subject is the software, never the engineer." / "The subject is a fact stated in passive voice and indicative mood."
    11. kept: "The commit-says-task-is-done-not-mark-done rule is unchanged too."
    12. kept: "Write the subject within the budget." / "Do not drop the subject and lead with a verb to save space."
    13. kept: "The journal's commit prefix is `Journal:`, which costs 9 characters. It carries no date."
    14. kept: "Every commit written before 2026-08-18 stands as written." / "Do not revise a commit message already written to suit a later convention."
    15. kept: "Wrap the body in the message itself. Do not leave wrapping to the terminal."

### Checker B

    1. kept: "The subject line is at most 50 characters."
    2. kept: "The body is wrapped at 72 characters."
    3. kept: "Split the commit, or move the detail to the body. Try them in that order."
    4. kept: "Do not abbreviate a subject into something a reader must decode." / "Use plain words, not contractions."
    5. kept: "The `language` package's rules hold in commit messages too."
    6. kept: "move the detail to the body" / "The body has no limit on what it says. Its only constraint is line width."
    7. kept: "A journal entry is the one record where neither remedy is available. It truncates instead." / "Cut a journal entry's commit subject at the 50th character with an ellipsis." (It never says outright "not reworded". The bar on shortening in item 9 covers most of that.)
    8. kept: "An entry's subject is the writer's words, which the `journal` package bars the agent from shortening."
    9. less precise: "Truncation is not a general escape. It is available for a journal entry alone." / "Everywhere else, a subject that will not fit is a commit to split." Missing: the general condition, that truncation applies where the subject is not the agent's to rewrite. The shorter version names only the journal case.
    10. kept: "The subject-first-commit-messages rule is unchanged." / "The subject is the software, never the engineer." / "The subject is a fact stated in passive voice and indicative mood."
    11. kept: "The commit-says-task-is-done-not-mark-done rule is unchanged too."
    12. kept: "Write the subject within the budget." / "Do not drop the subject and lead with a verb to save space."
    13. kept: "The journal's commit prefix is `Journal:`, which costs 9 characters. It carries no date."
    14. kept: "Every commit written before 2026-08-18 stands as written." / "Do not revise a commit message already written to suit a later convention."
    15. kept: "Wrap the body in the message itself. Do not leave wrapping to the terminal."

## git-commit-says-task-is-done-not-mark-done

### The rewriter's answer

    1. A commit message never uses "mark ... done" or "mark ... complete".
    2. State the accomplishment as a fact about the work.
    3. Do not phrase it as bookkeeping on a checkbox.
    4. Write **"Task 9 is done"**, not "mark Task 9 done" or "mark Task 9 as complete".

    | Don't | Do |
    |---|---|
    | `Log: mark Task 9 done (green-on-arrival)` | `Log: Task 9 is done (green-on-arrival)` |
    | `mark the predicate task complete` | `the predicate task is done` |

    5. Phrase finished work as the task being done. Say "Task N is done" or "X is complete".
    6. This applies to the commit subject and the commit body.
    7. Prose addressed to the user follows the same preference.
    8. In prose addressed to the user, state the plain fact. Do not describe the act of marking it.
    9. **Why:** The commit records the state of the work, not the clerical act of ticking a box.

### Checker A

    1 — kept — "A commit message never uses "mark ... done" or "mark ... complete"."
    2 — kept — "A commit message never uses "mark ... done" or "mark ... complete"."
    3 — kept — "State the accomplishment as a fact about the work." / "Do not phrase it as bookkeeping on a checkbox." / "Write **"Task 9 is done"**, not "mark Task 9 done" or "mark Task 9 as complete"."
    4 — kept — "State the accomplishment as a fact about the work." / "The commit records the state of the work, not the clerical act of ticking a box."
    5 — kept — "Phrase finished work as the task being done. Say "Task N is done" or "X is complete"." / "This applies to the commit subject and the commit body."
    6 — kept — "Phrase finished work as the task being done. Say "Task N is done" or "X is complete"." / "This applies to the commit subject and the commit body."
    7 — kept — "This applies to the commit subject and the commit body." (Item 6 follows item 5 directly rather than item 1, but "This" covers the commit message rule as a whole, including the prohibition.)
    8 — kept — "Prose addressed to the user follows the same preference." / "In prose addressed to the user, state the plain fact. Do not describe the act of marking it."

### Checker B

    1 — kept — "A commit message never uses "mark ... done" or "mark ... complete"."
    2 — kept — "A commit message never uses "mark ... done" or "mark ... complete"."
    3 — kept — "State the accomplishment as a fact about the work." / "Do not phrase it as bookkeeping on a checkbox." / "Write **"Task 9 is done"**, not "mark Task 9 done" or "mark Task 9 as complete"."
    4 — kept — "**Why:** The commit records the state of the work, not the clerical act of ticking a box." (together with "State the accomplishment as a fact about the work.")
    5 — kept — "Phrase finished work as the task being done. Say "Task N is done" or "X is complete"." / "This applies to the commit subject and the commit body."
    6 — kept — "Phrase finished work as the task being done. Say "Task N is done" or "X is complete"." / "This applies to the commit subject and the commit body."
    7 — kept — "A commit message never uses "mark ... done" or "mark ... complete"." (a commit message covers both subject and body) / "This applies to the commit subject and the commit body."
    8 — kept — "Prose addressed to the user follows the same preference." / "In prose addressed to the user, state the plain fact. Do not describe the act of marking it."

## git-no-claude-coauthor

### The rewriter's answer

    1. Do not add a `Co-Authored-By: Claude …` trailer to any commit you create.
    2. Do not add any other "co-authored by Claude/Anthropic" attribution either.
    3. The commit is authored by the user only.
    4. Omit the trailer even though Claude Code adds it by default.
    5. This applies to every project.
    6. **Why:** The user does not want AI co-authorship attribution in their commit history.

### Checker A

    1. kept: "Do not add a `Co-Authored-By: Claude …` trailer to any commit you create." / "Do not add any other "co-authored by Claude/Anthropic" attribution either." / "Omit the trailer even though Claude Code adds it by default."
    2. kept: "The commit is authored by the user only."
    3. kept: "This applies to every project."

### Checker B

    1. kept — "Do not add a `Co-Authored-By: Claude …` trailer to any commit you create." / "Do not add any other \"co-authored by Claude/Anthropic\" attribution either." / "Omit the trailer even though Claude Code adds it by default."
    2. kept — "The commit is authored by the user only."
    3. kept — "This applies to every project."

## git-run-suite-before-commit

### The rewriter's answer

    1. Run the full suite after any code change.
    2. Confirm it passes **before** considering whether to commit.
    3. The suite run is a precondition of the commit decision.
    4. The suite run is not a step taken after deciding to commit.
    5. A failing or incomplete suite means there is nothing to weigh.
    6. Do not reach the question of committing until the suite passes.
    7. How the suite is run is the project's stack's concern, not this rule's.
    8. The command and its passing output differ by language and test framework.
    9. The command and its passing output are settled where a stack is settled.
    10. For a Ruby project, that is the `ext/ruby-lang` package's rule on running the suite.
    11. This rule fixes only *when* the run happens relative to the commit decision. That holds for any stack.
    12. Apply it as: Edit → run the full suite → confirm it reports nothing failed → only then consider committing.
    13. If anything is failing or aborted, fix it, or stop, before the commit question arises.
    14. For a single-file change, you may run that one file first for speed.
    15. Run the full suite before commit anyway.
    16. **Why:** Committing is the point of no easy return. Running the suite before deliberating keeps a failing change from becoming a commit candidate. It keeps every commit in the history verified. The commit waits on the bar, not on the human's attention.

### Checker A

    1. kept: "Run the full suite after any code change." / "Confirm it passes **before** considering whether to commit."
    2. kept: "The suite run is a precondition of the commit decision." / "The suite run is not a step taken after deciding to commit."
    3. kept: "A failing or incomplete suite means there is nothing to weigh." / "Do not reach the question of committing until the suite passes."
    4. kept: "How the suite is run is the project's stack's concern, not this rule's." / "The command and its passing output are settled where a stack is settled."
    5. kept: "For a Ruby project, that is the `ext/ruby-lang` package's rule on running the suite."
    6. kept: "The commit waits on the bar, not on the human's attention." together with "Do not reach the question of committing until the suite passes." ("the bar" is never defined, and the sentence sits in the Why section. Line 6 is what ties the bar to the suite passing.)
    7. kept: "confirm it reports nothing failed → only then consider committing."
    8. kept: "If anything is failing or aborted, fix it, or stop, before the commit question arises." (It drops "in the suite", but in context it can only mean the suite.)
    9. kept: "For a single-file change, you may run that one file first for speed."
    10. kept: "Run the full suite before commit anyway."

### Checker B

    1. kept — "Run the full suite after any code change." / "Confirm it passes **before** considering whether to commit."
    2. kept — "The suite run is a precondition of the commit decision." / "The suite run is not a step taken after deciding to commit."
    3. kept — "A failing or incomplete suite means there is nothing to weigh." / "Do not reach the question of committing until the suite passes."
    4. kept — "How the suite is run is the project's stack's concern, not this rule's." / "The command and its passing output are settled where a stack is settled."
    5. kept — "For a Ruby project, that is the `ext/ruby-lang` package's rule on running the suite."
    6. less precise — "The commit waits on the bar, not on the human's attention." Missing: the shorter version never says what "the bar" is, so it does not state that the bar is the suite passing. The sentence also sits in the "Why" rationale, not among the directives.
    7. kept — "confirm it reports nothing failed → only then consider committing"
    8. kept — "If anything is failing or aborted, fix it, or stop, before the commit question arises."
    9. kept — "For a single-file change, you may run that one file first for speed."
    10. kept — "Run the full suite before commit anyway."

## git-subject-first-commit-messages

### The rewriter's answer

    1. The subject of a commit message is **the software**, never the engineer.
    2. The log records changes to the software and their effects. It is not an account of what the engineer did.
    3. The first line leads with the thing that changed and its new state.
    4. State it as a fact, in passive voice and indicative mood.
    5. **State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation".
    6. Use **"is corrected"** for a defect.
    7. Use **"is clarified"** for a refactor or readability change.
    8. **Omit the verb for something new.** "Widget tests", not "Widget tests are added".
    9. **Rename form:** "Widget, rather than sprocket".
    10. **Package version form:** "Package version is increased from 1.1.1 to 1.2.0".
    11. State both the current version and the next one.
    12. "Increased" holds even when a trailing segment resets.
    13. **Never lead with a verb.** That covers the imperative ("Fix…") and the past tense ("Fixed…") alike.
    14. Name the software that changed, then its new state.
    15. **The subject's length is the commit-message-widths rule's.** That rule caps the subject at 50 characters and wraps the body at 72.
    16. **Split the commit when the subject will not fit.**
    17. Do not drop the software subject and lead with a verb instead.
    18. **Why:** the log records the software's history and is scanned, not read. Leading with the changed thing serves that and is easier to review.

### Checker A

    1. kept — "The subject of a commit message is **the software**, never the engineer."
    2. kept — "The first line leads with the thing that changed and its new state."
    3. kept — "State it as a fact, in passive voice and indicative mood." (with "The first line leads with…" just before it)
    4. kept — "**State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation"."
    5. kept — "Use **"is corrected"** for a defect."
    6. kept — "Use **"is clarified"** for a refactor or readability change."
    7. kept — "**Omit the verb for something new.** "Widget tests", not "Widget tests are added"."
    8. kept — "**Rename form:** "Widget, rather than sprocket"."
    9. kept — "**Package version form:** "Package version is increased from 1.1.1 to 1.2.0"."
    10. kept — "State both the current version and the next one." (it follows the package version form line)
    11. kept — ""Increased" holds even when a trailing segment resets." (The reason, that the version is what increases and not each segment, is dropped. The required behavior is unchanged.)
    12. kept — "That rule caps the subject at 50 characters"
    13. kept — "and wraps the body at 72."
    14. kept — "**Split the commit when the subject will not fit.**" / "Do not drop the software subject and lead with a verb instead."
    15. kept — "**Never lead with a verb.** That covers the imperative ("Fix…") and the past tense ("Fixed…") alike."

### Checker B

    1. kept: "The subject of a commit message is **the software**, never the engineer."
    2. kept: "The first line leads with the thing that changed and its new state."
    3. kept: "State it as a fact, in passive voice and indicative mood."
    4. kept: "**State the change, don't narrate the work.** "Widget reconciliation is corrected" — not "Fix widget reconciliation" and not "Fixed widget reconciliation"."
    5. kept: "Use **"is corrected"** for a defect."
    6. kept: "Use **"is clarified"** for a refactor or readability change."
    7. kept: "**Omit the verb for something new.** "Widget tests", not "Widget tests are added"."
    8. kept: "**Rename form:** "Widget, rather than sprocket"."
    9. kept: "**Package version form:** "Package version is increased from 1.1.1 to 1.2.0"."
    10. kept: "State both the current version and the next one."
    11. kept: ""Increased" holds even when a trailing segment resets." The required behavior is the same. Only the reason is missing (what is increased is the version, not each segment).
    12. kept: "That rule caps the subject at 50 characters"
    13. kept: "and wraps the body at 72."
    14. kept: "**Split the commit when the subject will not fit.**" / "Do not drop the software subject and lead with a verb instead."
    15. kept: "**Never lead with a verb.** That covers the imperative ("Fix…") and the past tense ("Fixed…") alike."

---

Authored by Scott Bellware on Fri Oct 23 2026 at 11:40:13 PM PT
