# The items directory holds one file per item

**Trigger:** When creating an item, changing an item's state or content, or answering against what an item settled

- **Solubility:** 11
- **Original rank:** 1 of 106
- **Unclarity:** 0.82

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
- **Recorded** — an observation, and an observation only. It is the one state that never changes: an observation has no lifecycle, so it carries this word from the moment it is written and carries it for good. See the an-observation-is-a-working-hypothesis-whose-one-state-recorded-never-changes rule.
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

## Compressed

1. `waytide/local/items/` holds the project's items, one file per item. Every record there is an item, and only an item.
2. An item is the thinking that settles what the work should be and how it should go.
3. Name the file with the ISO-8601-UTC prefix, ending in its state in upper case.
4. Write the item as frontmatter-free markdown.
5. Give it, in this order, a `# <title>`, a `**State:**` line, a `**Tags:**` line, and whatever the item has to say. A provenance footer ends it.
6. Write a log entry when the item is created and at each change of its state.
7. Put no code samples in an item.
8. Nothing else is required. Add no shape the thinking does not have.
9. Where an item records decisions, record them as dated **Settled** resolutions.
10. Where an item that settles things deliberately leaves something out, mark it in an **Out of Scope / Deferred** tail.
11. An item that sequences work carries checkbox tasks stating behavior.
12. An item that neither settles things nor sequences work carries neither resolutions nor tasks.
13. An item may carry tags, such as `[design]`, `[plan]`, or `[aspiration]`.
14. Tag an item that has no tag at all `[idea]`.
15. Give `[idea]` to no item that already carries a tag.
16. Assign no tag but `[idea]` by default. Write `[aspiration]` only where an aspiration was asked for.
17. The tag set is open.
18. An item may carry several tags.
19. Tags are the ordinary square-bracket tags every working-state artifact takes (see the a-record-may-be-categorized-with-square-bracket-tags rule).
20. `[observation]` and `[work-item]` mean what their rules say: the observations rule, and the work-item section below.
21. An item may carry two optional lines, `**Waits for:**` and `**Priority:**`, and most items carry neither.
22. `**Waits for:**` states what must finish before the item is actionable, and nothing more.
23. `**Priority:** N`, written as `- **Priority:** 3`, ranks the item from 1 to N, contiguous, one item to a number.
24. Rank 1 is worked next among the actionable items.
25. Ranking an item renumbers those below it. The several files that changes are the accepted cost.
26. A waiting item may still be ranked, and a rank does not clear a wait.
27. Nothing derives from either line.
28. An item's content is point-in-time.
29. A reference in an item that time has overtaken is not a defect.
30. Do not chase such a reference.
31. Every item carries a `**State:**` line from the moment it is written, holding one of the words below and no other. Absence is not a state, and an item without the line is a defect.
32. **Open** — the work has not started. Start every item but an observation **Open**, whether its thinking is settled or not.
33. Make an item **Active** when its work starts. **Active** is the in-progress state.
34. An observation, and only an observation, starts and stays **Recorded**.
35. **Realized** — what it describes exists.
36. **Deferred** — kept deliberately, with no date and no one working toward it.
37. An item merely waiting its turn is not **Deferred**. It carries `**Waits for:**` and whatever state its thinking has reached.
38. **Suspended** — paused, not ended.
39. **Superseded** — a later item replaced it, and the two name each other.
40. **Abandoned** — dropped by decision.
41. **Lapsed** — it lost its relevance over time, as the work moved past it with no one deciding. Where a decision dropped it, it is **Abandoned**.
42. Take `Realized`, `Deferred`, and `Open` back to `Active` or `Open` when the work resumes. The other states are not taken back. Conclude an item whose work is done on an experiment's branch when the work is done, as `Realized`, or `Done` for a work item. Do not wait for the merge, and name the branch.
43. At each change of state, change the `**State:**` line and rename the file.
44. At each change of state, write the log entry.
45. A work item, tagged `[work-item]`, is a piece of work to be done.
46. A work item takes `Open`, `Active`, `Deferred`, and `Suspended`.
47. A work item concludes `Done`, `Abandoned`, or `Superseded`.
48. A work item never takes `Realized` or `Lapsed`.
49. Take `Done` back to `Active` when the work reopens.
50. Supersede an item rather than rewrite it.
51. What a superseded item settled stays as written.
52. Amend an item by dated addition.
53. When amending, keep an outdated resolution's date and wording, and state what changed in a later resolution.
54. Answer a question that runs against what an item settled, and record the change.
55. Do not refuse to answer until the item is amended.
56. Where one item names another as what it realizes, the named item is the source of truth. Reconcile it; never regenerate it from the work downstream.

## Compression

- 2026-10-21, compressed: compression 0.61, change 0.83, solubility 11 → 46, clarity 0.18 → 0.55
- 2026-10-22, checked: 75 directives, 49 kept, 23 less precise, 3 lost, one of them the engineer's chosen resolution of the source's contradiction
- 2026-10-22, revised: restored directives 14 and 17, compression 0.60, change 0.83
- 2026-10-24, revised: written as a numbered list; checked twice, 3 repairs, re-checked kept
- 2026-10-27, revised: Active is the in-progress state, and an item done on an experiment's branch concludes when the work is done; checked: 63 directives, 34 kept, 29 less precise, 0 lost, 25 repairs; directives 10, 11, 12, and 52 follow the engineer's resolution of the reserved tags
- 2026-10-27, re-checked: 63 directives, 56 kept, 7 less precise, 0 lost, 3 repairs; directives 10, 11, 12, and 52 follow the engineer's resolution of the reserved tags
- 2026-10-27, re-checked: 63 directives, 56 kept, 7 less precise, 0 lost, every repair kept; 53, 56, and 61 are kept by the earlier checks
- 2026-10-27, revised: the claim that no tag is reserved is removed, and a tag means what a rule about it says; checked: 71 directives, 69 kept, 2 less precise, 0 lost; 62 and 69 are kept by the earlier checks
- 2026-10-28, revised: Why points removed, solubility 46 → 45, clarity 0.55 → 0.71; checked: 57 directives, 57 kept, 0 less precise, 0 lost
- 2026-10-28, revised: an observation's state is `Recorded`, not `Stated`, a term the engineer settled; not checked
- 2026-10-29, merge from master re-checked: 67 directives, 64 kept, 3 less precise, 0 lost, 2 repairs

## History

**This is the last of the mode vocabulary, and it is gone with it.** A project once worked in one of three modes, and the mode fixed what a planning record was called — a design, an aspiration, or an orientation in one; a plan, an intention, or an action in another. The mechanism was decommissioned on 2026-08-18 and the six words outlived it as a tag set that still read as exhaustive.

`[deferred]` marked work postponed until the current task finishes, and the items carrying it were a queue with a rule of its own. That convention was suspended on 2026-08-25 — what made it a queue was a session-start print and a command, and both are gone.

**One word covers what two used to.** `Realized` replaces the pair `Realized` and `Implemented`, which distinguished a direction taken up from a sequence built. That distinction went with the mode vocabulary, and one word is what remains of it.

Until Sun Oct 25 2026 this rule was named items-convention and titled "`waytide/local/items/` — the project's items, one file per item".

Until Mon Oct 26 2026 this rule was named the-items-directory-holds-the-projects-items-one-file-per-item and titled "The items directory holds the project's items, one file per item".

Until 2026-08-25 the `**Waits for:**` and `**Priority:**` lines were the deferred queue's mechanism.

Until 2026-10-26 **Active** meant settled, with the work expected, and **Open** meant the thinking is not settled. They were the two starting words, and an item started Active where it settled something, whether or not the work had begun. No state said the work was under way. The engineer settled that Active is the in-progress state, and that an item stays Open until its work starts, settled or not.

Until Tue Oct 27 2026 this rule said that no tag is reserved and that a tag decides nothing, while `[work-item]`, in this rule, and `[observation]`, in the observations rule, each decide what a record is. The engineer settled that a tag means what a rule about it says, so the general claim is removed rather than restated.

Related:

- the a-record-may-be-categorized-with-square-bracket-tags rule — the tags that say what an item is
- the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule — the filename suffix
- the a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state rule — the log entry an item takes
- the an-observation-is-a-working-hypothesis-whose-one-state-recorded-never-changes rule — an observation, which is an item and carries the promotion path to a rule
- the file-names, working-state-artifacts-carry-a-provenance-footer, and an-item-that-sequences-work-contains-no-code-samples rules
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — the other `Suspended`, which is an act on something the project did rather than a state on something it wanted

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
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:27:49 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 11:13:06 AM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:44 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:43 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:41:58 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 7:02:14 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:09:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:18:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:19:11 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:26:00 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
