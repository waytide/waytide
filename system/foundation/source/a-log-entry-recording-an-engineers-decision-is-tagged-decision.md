# A log entry recording an engineer's decision is tagged `[decision]`

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

**`[decision]` is a reserved tag.** What it marks is fixed here, and the set of the engineer's decisions is read from it.

**Why:** the log carries the agent's acts and the engineer's decisions in the same form, one line each. A reader who reconsiders a direction needs to know which were the engineer's. A decision the engineer made is changed by the engineer, and an act of the agent is corrected against the rule it followed. With the tag, the engineer's decisions are a set that one search finds.

**How to apply:** when the engineer makes a decision, write its log entry with `**Tags:** [decision]` under the title. Do not tag an entry for an act the agent took under a rule.

## Compressed

1. When the engineer makes a decision, the log entry that records it carries `**Tags:** [decision]`.
2. The tag says who decided. Every log entry states a decision, so the tag marks the engineer's.
3. An entry tagged `[decision]` records a choice the engineer made. Examples are a direction set, a question settled, and work held for a later piece of work.
4. The engineer's decision is the engineer's own choice. It may be stated in the engineer's words.
5. It may also be made by choosing among options the agent puts forward.
6. An act the agent takes under a rule is not an engineer's decision, even when the engineer approved it.
7. Do not tag an entry for an act the agent took under a rule. Do not tag such an entry `[decision]`.

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

## History

Until Sun Oct 25 2026 this rule was named a-decision-the-engineer-made-is-tagged-decision and titled "A log entry recording a decision the engineer made is tagged `[decision]`".

Related:

- the decision-log-convention — the entry's form
- the a-record-may-be-categorized-with-square-bracket-tags rule — the tag protocol, and what a reserved tag is
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — `[suspended]`, the other reserved tag the log carries

---

Authored by Scott Bellware on Thu Oct 22 2026 at 9:53:03 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:21 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:11:46 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
