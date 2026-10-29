# `waytide/local/items/` — the project's items, one file per item

`waytide/local/items/` holds the project's **items**: the thinking that settles what the work should be and how it should go. **An item is an item**, and that is the whole of what a record here is.

**An item may carry tags, such as `[design]`, `[plan]`, or `[aspiration]`.** The set is open, and an item may carry several. The tags are the ordinary square-bracket tags every working-state artifact takes.

**An item with no tag is tagged `[idea]`.** No other tag is added by default, and an item that already has a tag is not also given `[idea]`. Write `[aspiration]` only where an aspiration was asked for.

## Two optional lines any item may carry

**`**Waits for:**` states what must finish before the item is actionable.** That is the whole of what it does. It does not say what to work next.

**`**Priority:**` holds a rank** — `- **Priority:** 3`. Ranks are 1 through N, contiguous, one item per number, and rank 1 is worked next among the items that are actionable.

**Rank is not the wait.** An item that is waiting may still be ranked, and a rank does not clear a wait.

**Both are optional and most items carry neither.** An item is frequently written at the moment its material is at hand, which is exactly when a ranking decision is what is being put off. An unranked item is not a defect.

**Renumbering on insert is the cost, and it is accepted.** Putting an item at a given rank moves every item below it, so a change of priority changes several files. That is the cost of each item stating its own position in a form that reads as the order the engineer gave.

**An item's content is point-in-time.** What an item says was true when it was written — the work that was in progress, the rules as they stood, the artifacts that existed. **A reference inside an item that time has overtaken is not a defect and is not chased.** An item waiting on an experiment does not stop being correct when that experiment is superseded, because it records what it was waiting for.

**Nothing derives from either line.** They are an item's own content, read by whoever reads the item.

## The shape

- **One file per item**, named by the ISO-8601-UTC prefix (see the file-names rule), ending with its state in upper case (see the a-record-ends-with-its-state-in-upper-case rule).
- **Frontmatter-free markdown.** A `# <title>`, then the `**State:**` line, then the `**Tags:**` line, then whatever the item has to say.
- **A provenance footer** ends the file (see the working-state-artifacts-carry-a-provenance-footer rule).
- **A log entry** pairs with it on creation and on each change of state (see the an-item-takes-a-log-entry rule).
- **No code samples** (see the plans-no-code-samples rule).

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
- **Recorded** — an observation, and an observation only. It is the one state that never changes: an observation has no lifecycle, so it carries this word from the moment it is written and carries it for good. See the observations-convention.
- **Lapsed** — it lost its relevance over time. **`Lapsed` and `Abandoned` differ in who acted:** abandoning is a decision, and lapsing is what happens when nobody decides and the work moves past the item.

**`Recorded` is the second starting word and the only terminal one**, and an observation takes it alone. Every other item takes the one below.

**`Open` is the starting word for every other item**, whether its thinking is settled or not. **`Active` is the in-progress state**, and an item reaches it when its work starts. **As the engineer stated it:** Active is the in-progress state. Absence is not a state, and an item without a line is a defect.

**`Realized`, `Deferred`, and `Open` are taken back**, each returning to `Active` or to `Open` when the work resumes. The rest are not.

**An item whose work is done on an experiment's branch concludes when the work is done**, as `Realized`, or as `Done` for a work item. It does not wait for the experiment to merge. The item names the branch the work is on.

## A work item

**An item tagged `[work-item]` is a piece of work to be done, and it concludes as `Done`, `Abandoned`, or `Superseded`.** This rule names the tag and says what follows.

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

## History

Until 2026-10-26 **Active** meant settled, with the work expected, and **Open** meant the thinking is not settled. They were the two starting words, and an item started Active where it settled something, whether or not the work had begun. No state said the work was under way. The engineer settled that Active is the in-progress state, and that an item stays Open until its work starts, settled or not.

**This is the last of the mode vocabulary, and it is gone with it.** A project once worked in one of three modes, and the mode fixed what a planning record was called — a design, an aspiration, or an orientation in one; a plan, an intention, or an action in another. The mechanism was decommissioned on 2026-08-18 and the six words outlived it as a tag set that still read as exhaustive.

`[deferred]` marked work postponed until the current task finishes, and the items carrying it were a queue with a rule of its own. That convention was suspended on 2026-08-25 — what made it a queue was a session-start print and a command, and both are gone.

**One word covers what two used to.** `Realized` replaces the pair `Realized` and `Implemented`, which distinguished a direction taken up from a sequence built. That distinction went with the mode vocabulary, and one word is what remains of it.

Until 2026-08-25 the `**Waits for:**` and `**Priority:**` lines were the deferred queue's mechanism.

Until Tue Oct 27 2026 this rule said that no tag is reserved and that a tag decides nothing, while `[work-item]`, in this rule, and `[observation]`, in the observations rule, each decide what a record is. The engineer settled that a tag means what a rule about it says, so the general claim is removed rather than restated.

Related:

- the a-record-takes-category-tags rule — the tags that say what an item is
- the a-record-ends-with-its-state-in-upper-case rule — the filename suffix
- the an-item-takes-a-log-entry rule — the log entry an item takes
- the observations-convention — an observation, which is an item and carries the promotion path to a rule
- the file-names, working-state-artifacts-carry-a-provenance-footer, and plans-no-code-samples rules
- the a-suspension-is-a-log-entry rule — the other `Suspended`, which is an act on something the project did rather than a state on something it wanted

---

Authored by Scott Bellware on Mon Aug 17 2026 at 11:40:35 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:04:26 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:22:43 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:27:24 AM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 2:38:56 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 4:05:21 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 4:15:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:01:29 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:09:08 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:26:00 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
