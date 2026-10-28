# A record may be tagged with square-bracket tags

**Any record may carry tags**, such as `[idea]`. Put them on a `**Tags:**` line at the head of the record, after `**State:**` where there is one: `**Tags:** [idea] [decision]`. To tag one list item, prefix it: `- [idea] My idea`.

**Write a tag lower-case in square brackets**, with dashes between words: `[legal-matter]`.

**Tags are optional and freeform.** Add one when it is useful. Nothing checks them, and there is no fixed list.

**Some tags have lifecycle states**, such as `[experiment]`, `[feature]`, `[observation]`, and `[work-item]`. Each one's own rule states its states.

**Why:** a tag costs nothing to add, shows in plain text, and is found by an ordinary search.

**How to apply:** where a record is worth marking, add a `**Tags:**` line at its head.

## History

**A leading-tag form was written on 2026-08-18 and superseded the same day.** It put a one-line record's tags inside its `# <title>` — `# [suspended] The rule is suspended, …` — on the reasoning that a short record had nowhere else to put them.

Until Mon Oct 26 2026 this rule called the log "the decision log". The engineer settled that it is the log, since its entries record more than decisions.

Until Tue Oct 27 2026 this rule was titled "A record takes square-bracket category tags". It divided tags into reserved and freeform, said where a log entry puts its tags, and kept an account of the discontinued leading-tag form and of what the distinction cost. The engineer settled that a tag means what a rule about it says, so the rule needs no category of reserved tags, and that the rest is said elsewhere or is history.

Related:

- the decision-log-convention rule — where a log entry's `**Tags:**` line goes
- the a-decision-the-engineer-made-is-tagged-decision rule — what `[decision]` means
- the a-suspension-is-a-log-entry rule — what `[suspended]` means
- the implementations-convention rule — the states of `[experiment]` and `[feature]`
- the items-convention rule — the states of an item, and of `[work-item]`
- the observations-convention rule — the one state of `[observation]`
- the `journal` package's datetime-stamp-line rule — where a journal entry's `**Tags:**` line sits

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
Changed by Scott Bellware on Mon Oct 26 2026 at 2:41:43 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:42:16 PM PT
