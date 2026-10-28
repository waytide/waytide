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

**What `[decision]` marks is fixed here**, and the set of the engineer's decisions is read from it.

**Why:** the log carries the agent's acts and the engineer's decisions in the same form, one line each. A reader who reconsiders a direction needs to know which were the engineer's. A decision the engineer made is changed by the engineer, and an act of the agent is corrected against the rule it followed. With the tag, the engineer's decisions are a set that one search finds.

**How to apply:** when the engineer makes a decision, write its log entry with `**Tags:** [decision]` under the title. Do not tag an entry for an act the agent took under a rule.

## Compression

- Solubility 93, clarity 1.00 (2026-10-24)
- Compression 0.15, change 0.37 (2026-10-24)
- 8 directives, 8 kept, 0 less precise, 0 lost (2026-10-24)

Related:

- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry's form
- the a-record-may-be-categorized-with-square-bracket-tags rule — how a tag is written
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — `[suspended]`, the other tag the log reads
