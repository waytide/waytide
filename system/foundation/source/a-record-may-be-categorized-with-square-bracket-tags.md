# A record may be categorized with square-bracket tags

**Any record may be categorized with square-bracket tags**, as in `[idea]`. This is the system's one tagging protocol, and it is universal: no record is excluded from it, and no rule excludes one. A tag applies to the **whole record** or to **one list item**.

**Universal means every record, of every kind, anywhere.** A working-state artifact under `waytide/local/`, a log entry, a rule file under `waytide/system/` or `waytide/local/rules/`, a journal entry, a README. Where a record exists, it may carry tags.

## Where the tag goes

**There is one form, and every record uses it.**

- **The whole record** — the tags go on a dedicated `**Tags:**` line among the canonical lines at the head, **after `**State:**` where there is one**. Several tags are separated by spaces — `**Tags:** [idea] [decision]`.
- **One list item** — the tag prefixes that list item's text — `- [idea] My great idea is thus`.

**A record with no head gains one.** A log entry is a title and nothing else, so a `**Tags:**` line under its title is the entry's whole head. The the-log-holds-one-file-per-entry-with-a-one-line-title rule states that shape, and a tagged entry is two lines rather than one.

The leading-tag form is discontinued. A second form buys a line saved and costs every reader and every search two shapes to know, and the tag is no longer in the field the rest of the system reads it from.

**No record is excluded, and none is excluded by its shape.** Short, one-line, generated, or historical, a record that carries tags carries them on a `**Tags:**` line.

**The form is lower-case, in square brackets.** A multiword tag is dash-separated and lower-case, as `[legal-matter]` is.

**There is no controlled vocabulary.** Tags are freeform and a tag is introduced as it is needed. Nothing validates one, nothing enumerates the set, and a tag used once is as legitimate as a tag used a hundred times.

**Tags are optional at every level.** A record that is not categorized carries no `**Tags:**` line and no leading tag, and a list that is not categorized carries no prefixes. Absence claims nothing. **Optional is not the same as excluded** — every record may be tagged, and none must be.

**It is the plain text data attribute form** the system already uses — a bold label, a colon, and a value. See this package's vocabulary.

## A reserved tag and a freeform tag

**Most tags are freeform, and a few are reserved.** A **freeform tag** means only that the writer put it there. A **reserved tag** is one whose meaning a rule settles, and something follows from it.

**A rule reserves a tag by naming it and saying what follows.** Nothing else does. A tag that no rule names is freeform, which is the ordinary case and the one the section above describes.

**Nothing is derived from a freeform tag** — no filename suffix, no report, no check. A rule that wants a set of positions reserves the tags that carry them, or names a new line.

**The distinction is not a controlled vocabulary arriving by another route.** The reserved set is small, each member is named in a rule a reader can find, and the freeform space is untouched around them. A writer needs to know a tag is reserved only when they are using it for what the rule says.

**Why the distinction is worth having rather than a second line.** A reserved tag and a freeform tag sit in the same `**Tags:**` line, so a writer categorizing an artifact does one thing rather than choosing between two mechanisms. The alternative — a second line beside `**Tags:**`, holding the reserved words — splits one act across two fields and asks a writer to know which field a given word belongs in.

**What it costs:** the `**Tags:**` line no longer means one thing. A reader who sees a tag cannot tell from the line alone whether a rule turns on it, and finding out means knowing which rules reserve tags. That is the price of one mechanism instead of two, and it is accepted rather than hidden.

**Why:** categorization that costs nothing is categorization that gets done. A square-bracket tag is visible in a raw-text preview, found by an ordinary text search, and imposes no taxonomy anyone has to maintain. The alternative — a controlled vocabulary — has to be agreed before the first tag is written, and the writer who wants to mark something as an item at that moment does not have it.

**Freeform is the whole of the value here, and it is also the whole of the limit.** Two writers tagging the same thing `[idea]` and `[ideas]` have categorized nothing together. That is accepted rather than solved, because solving it costs the property the tags exist for.

**How to apply:** where a categorization is worth marking, add a `**Tags:**` line at the head of the record, after `**State:**` where there is one. Prefix a list item with `[tag]` to mark that item alone.

Write tags lower-case and dash-separated in square brackets. Introduce a freeform tag as it is needed, and derive nothing from one. Exclude no record from tagging.

Reserve a tag by naming it in a rule and stating what follows from it. Where no rule names a tag, it is freeform.

## Compressed

1. Any record may be categorized with square-bracket tags, as in `[idea]`. Add a `**Tags:**` line wherever a categorization is worth marking.
2. This is the system's one tagging protocol.
3. The protocol is universal. No record is excluded from it, and no rule excludes one.
4. Universal means every record, of every kind, anywhere.
5. Examples are a working-state artifact under `waytide/local/`, a log entry, a rule file under `waytide/system/` or `waytide/local/rules/`, a journal entry, and a README.
6. A tag applies to the whole record or to one list item.

## Where the tag goes

1. There is one form, and every record uses it.
2. For the whole record, tags go on a dedicated `**Tags:**` line among the canonical lines at the head.
3. The `**Tags:**` line goes after `**State:**` where there is one.
4. Several tags are separated by spaces, as in `**Tags:** [idea] [decision]`.
5. For one list item, the tag prefixes that item's text, as in `- [idea] My great idea is thus`.
6. A record with no head gains one when it is tagged.
7. A log entry is only a title, so a `**Tags:**` line under its title is its whole head. A tagged entry is two lines.
8. The leading-tag form is discontinued. That form put a tag before the title or text in place of a `**Tags:**` line. Do not use it.
9. No record is excluded by its shape. A short, one-line, generated, or historical record carries its tags on a `**Tags:**` line.
10. Tags are lower-case, in square brackets.
11. A multiword tag is dash-separated and lower-case, as in `[legal-matter]`.
12. There is no controlled vocabulary. Tags are freeform and introduced as needed.
13. Nothing validates a tag, and nothing enumerates the set.
14. A tag used once is as legitimate as a tag used a hundred times.
15. Tags are optional at every level.
16. A record that is not categorized carries no `**Tags:**` line and no leading tag.
17. A list that is not categorized carries no tag prefixes on its items.
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

## History

**A leading-tag form was written on 2026-08-18 and superseded the same day.** It put a one-line record's tags inside its `# <title>` — `# [suspended] The rule is suspended, …` — on the reasoning that a short record had nowhere else to put them.

Until Sun Oct 25 2026 this rule was named a-record-takes-category-tags and titled "A record takes square-bracket category tags".

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Related:

- the `journal` package's the-journal-is-the-record-the-writer-keeps and a-journal-entry-has-a-human-readable-datetime-line-under-its-title rules — where a journal entry's `**Tags:**` line sits, which is under the datetime line and above the summary
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry that gains a `**Tags:**` line under its title
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — `[suspended]`, a reserved tag the log carries
- the a-log-entry-recording-an-engineers-decision-is-tagged-decision rule — `[decision]`, the other reserved tag the log carries
- the working-state-artifacts-carry-a-provenance-footer rule — a separate obligation, which does exempt the log; a footer is lines the entry has nowhere to put, where a tag is not
- this package's vocabulary — the plain text data attribute line

---

Authored by Scott Bellware on Mon Aug 17 2026 at 10:13:43 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:15:53 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:39:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 12:31:05 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 3:04:41 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 9:53:03 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:11:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:25 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:24:35 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:42:32 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:12:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
