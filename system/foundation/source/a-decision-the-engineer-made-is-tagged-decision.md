# A log entry recording a decision the engineer made is tagged `[decision]`

**When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`.** The tag says who decided.

**Every log entry states a decision, so the tag marks the engineer's.** Most entries record what the agent did under a rule, or what followed from the work. An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work.

**The engineer's decision is the engineer's own choice.** It may be stated in the engineer's words, or made by choosing among options the agent puts forward. An act the agent takes under a rule is not one, even when the engineer approved it.

## The tag

**The entry carries the tag under its title**, separated by a blank line, in the one form every record uses:

```
# The README item settles that the README's content is addressed with Waytide's website, and waits for it

**Tags:** [decision]
```

**An entry may carry other tags beside this one.** An engineer's decision to stop doing something is tagged `[decision] [suspended]`.

**What `[decision]` marks is fixed here**, and the set of the engineer's decisions is read from it.

**Why:** the log carries the agent's acts and the engineer's decisions in the same form, one line each. A reader who reconsiders a direction needs to know which were the engineer's. A decision the engineer made is changed by the engineer, and an act of the agent is corrected against the rule it followed. With the tag, the engineer's decisions are a set that one search finds.

**How to apply:** when the engineer makes a decision, write its log entry with `**Tags:** [decision]` under the title. Do not tag an entry for an act the agent took under a rule.

## History

Until Tue Oct 27 2026 this rule called `[decision]` a reserved tag. The engineer settled that a tag means what a rule about it says, with no reserved category.

Related:

- the decision-log-convention — the entry's form
- the a-record-takes-category-tags rule — how a tag is written
- the a-suspension-is-a-log-entry rule — `[suspended]`, the other tag the log reads

---

Authored by Scott Bellware on Thu Oct 22 2026 at 9:53:03 AM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:42:16 PM PT
