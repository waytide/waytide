# The items directory holds one file per item

- **Solubility:** 11
- **Original rank:** 1 of 106
- **Unclarity:** 0.82

`waytide/local/items/` holds the project's **items**: the thinking that settles what the work should be and how it should go. **An item is an item**, and that is the whole of what a record here is.

**A tag may describe an item, and nothing about it is strict.** A design item is tagged `[design]`, a plan item `[plan]`, an aspiration `[aspiration]`, and an observation `[observation]`. **An item that carries no tag at all is tagged `[idea]`.** The tags are the ordinary square-bracket tags every working-state artifact takes (see the a-record-may-be-categorized-with-square-bracket-tags rule), the set is open, and an item may carry several or none at all.

**`[idea]` is the tag an untagged item takes, and no other kind tag is assigned by default — `[aspiration]` least of all.** `[aspiration]` is written where an aspiration is what was asked for, and never as the dress a design item is put in because something had to go on the line. An item that already carries a tag is not given `[idea]` as well, whatever the tag — `[deferred]`, `[work-item]`, or a project's own.

**The tag describes and decides nothing.** No rule reads a kind tag, no report groups by one, and no filename derives from one. What the record *is* is in the record.

**No tag is reserved here, and none is read mechanically.** The `[deferred]` tag is freeform like any other, and what it used to carry is the two lines below.

## Two optional lines any item may carry

**`**Waits for:**` states what must finish before the item is actionable.** That is the whole of what it does. It does not say what to work next.

**`**Priority:**` holds a rank** — `- **Priority:** 3`. Ranks are 1 through N, contiguous, one item per number, and rank 1 is worked next among the items that are actionable.

**Rank is not the wait.** An item that is waiting may still be ranked, and a rank does not clear a wait.

**Both are optional and most items carry neither.** An item is frequently written at the moment its material is at hand, which is exactly when a ranking decision is what is being put off. An unranked item is not a defect.

**Renumbering on insert is the cost, and it is accepted.** Putting an item at a given rank moves every item below it, so a change of priority changes several files. That is the cost of each item stating its own position in a form that reads as the order the engineer gave.

**An item's content is point-in-time.** What an item says was true when it was written — the work that was in progress, the rules as they stood, the artifacts that existed. **A reference inside an item that time has overtaken is not a defect and is not chased.** An item waiting on an experiment does not stop being correct when that experiment is superseded, because it records what it was waiting for.

**Nothing derives from either line.** They are an item's own content, read by whoever reads the item.

## The shape

- **One file per item**, named by the ISO-8601-UTC prefix (see the file-names rule), ending with its state in upper case (see the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule).
- **Frontmatter-free markdown.** A `# <title>`, then the `**State:**` line, then the `**Tags:**` line, then whatever the item has to say.
- **A provenance footer** ends the file (see the working-state-artifacts-carry-a-provenance-footer rule).
- **A log entry** pairs with it on creation and on each change of state (see the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule).
- **No code samples** (see the an-item-that-sequences-work-contains-no-code-samples rule).

**Nothing else is required.** An item that settles things records them as dated **Settled** resolutions and marks what it deliberately leaves out in an **Out of Scope / Deferred** tail. An item that sequences work carries checkbox tasks stating behavior. An item that does neither carries neither. **The four rules this replaces fixed a spine.** This one does not: an item is thinking, and a shape imposed on thinking is ceremony wherever the thinking does not have it.

## The states

Every item carries a `**State:**` line, from the moment it is written:

- **Open** — the work has not started, whether the thinking is settled or not. Where every item but an observation starts.
- **Active** — the work is in progress. An item becomes Active when its work starts.
- **Realized** — what the item describes exists.
- **Deferred** — kept deliberately, with no date and nobody working toward it. **An item that is merely waiting its turn is not this** — it carries a `**Waits for:**` line and whatever state its thinking has reached.
- **Suspended** — paused, not ended.
- **Superseded** — another item replaced it, and the two name each other.
- **Abandoned** — dropped, by decision.
- **Stated** — an observation, and an observation only. It is the one state that never changes: an observation has no lifecycle, so it carries this word from the moment it is written and carries it for good. See the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes rule.
- **Lapsed** — it lost its relevance over time. **`Lapsed` and `Abandoned` differ in who acted:** abandoning is a decision, and lapsing is what happens when nobody decides and the work moves past the item.

**`Stated` is the second starting word and the only terminal one**, and an observation takes it alone. Every other item takes the one below.

**`Open` is the starting word for every other item**, whether its thinking is settled or not. **`Active` is the in-progress state**, and an item reaches it when its work starts. **As the engineer stated it:** Active is the in-progress state. Absence is not a state, and an item without a line is a defect.

**`Realized`, `Deferred`, and `Open` are taken back**, each returning to `Active` or to `Open` when the work resumes. The rest are not.

**An item whose work is done on an experiment's branch concludes when the work is done**, as `Realized`, or as `Done` for a work item. It does not wait for the experiment to merge. The item names the branch the work is on.

## A work item

**An item tagged `[work-item]` is a piece of work to be done, and it concludes as `Done`, `Abandoned`, or `Superseded`.** The tag is reserved: this rule names it and says what follows.

- **Done** — the work is done. It takes the place of `Realized`, which a work item does not take, and neither does `Lapsed`.
- **Before it concludes**, a work item takes an item's states — `Open`, `Active`, `Deferred`, and `Suspended`.
- **`Done` is taken back** to `Active` when the work reopens, as `Realized` is for any other item.

**Why:** a work item describes something to do rather than something to exist, so *realized* misstates its end. *Done* says what happened to it.

## Supersession

**A later item may supersede an earlier one.** The earlier takes `**State:** Superseded` and the two name each other in their prose. What the earlier one settled stays as written — a superseded item is a record of what was thought, not a draft.

**An item is amended by a dated addition rather than a rewrite.** A resolution that no longer holds keeps its date and its wording, and a later one states what changed. So an item reads as a history of thinking rather than as whatever is current.

**A question that runs against something an item settled has expanded the item.** The agent answers it and records the change. It does not refuse until the item is amended, which would stop the work to keep a record of it.

**A settled item is reconciled, never regenerated.** Where one item names another as the thing it realizes, the named one is a source of truth. Rebuilding it from the work downstream would invert that and would treat the implementation as correct every time.

**Why:** one directory and one class of record, because the six that came before it differed in what they were called and in nothing a rule depended on. What varies between them is a word, and a word is carried by a tag.

Keeping the shape thin is the other half. The rules this replaces fixed a spine for a design and an element order for a plan, and an item that is neither had nowhere to sit. What every item genuinely shares is a state, a tag, a footer, a log entry, and a name.

**How to apply:** write an item as a file in `waytide/local/items/`, with a `**State:**` line, a `**Tags:**` line saying what it is, and the ISO-8601-UTC prefix and state suffix in its name. Start it **Open**, and make it **Active** when its work starts. Conclude an item whose work is done on an experiment's branch when the work is done, not when the experiment merges.

Change the state as the item reaches another word, renaming the file with it, and write the log entry. Supersede rather than rewrite. Amend by dated addition. Add no spine the thinking does not have.

## Compression

- Solubility 46, clarity 0.55 (2026-10-21)
- Compression 0.60, change 0.83 (2026-10-22)
- 63 directives, 56 kept, 7 less precise, 0 lost (2026-10-27)

Related:

- the a-record-may-be-categorized-with-square-bracket-tags rule — the tags that say what an item is
- the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule — the filename suffix
- the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — the log entry an item takes
- the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes rule — an observation, which is an item and carries the promotion path to a rule
- the file-names, working-state-artifacts-carry-a-provenance-footer, and an-item-that-sequences-work-contains-no-code-samples rules
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — the other `Suspended`, which is an act on something the project did rather than a state on something it wanted
