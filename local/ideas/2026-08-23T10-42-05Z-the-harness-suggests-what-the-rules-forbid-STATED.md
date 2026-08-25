# The harness suggests what the rules forbid the agent to offer

- **State:** Stated
- **Tags:** [observation]

## What was observed

**As the engineer stated it:** we are working on a feature branch, prompts to publish a package are
inappropriate in these conditions, and the light-grey placeholder text activated by the tab key was
displaying it.

**The agent had written no such thing.** No publish is named anywhere in the branch's commits or in
the session's agent text, which was checked. The suggestion came from the harness.

## The channel

**It is a predicted next message, not a generated offer.** The grey text the tab key completes is
the harness's guess at what the engineer will type, drawn from the conversation. This session's
earlier messages include *push and publish foundation* more than once, from the engineer, at a time
when the work was on `master` and a publish was the right next act.

**So it replayed the engineer's own past prompts into a condition where they no longer hold.** The
words were appropriate when they were typed. What changed is the branch, and the prediction has no
way to know that a rule turns on it.

## What it says about the rule

**The never-offer instruction says *in any form*, and that phrase is narrower than it reads.** It
governs what the agent writes. It cannot govern a channel the agent does not write in, and the
local rule now says so rather than leaving a reader to find the suggestion and conclude the
instruction failed.

**Nothing here can bind the harness.** A rule file is read by the agent. The suggestion is composed
before the agent is involved and is shown to the engineer directly.

## What is not settled

- **Whether anything is worth doing.** The likeliest honest answer is no.
- **Whether the same gap reaches other never-offer instructions**, such as the foundation
  downstream-work-is-never-offered rule, which forbids the agent to raise refreshing the consuming
  projects. A predicted prompt has the same access to that phrase.
- **Whether a rule ought to state its channel generally.** Every never-offer rule here reads as
  though it governs the situation, and each governs the agent's text within it. That distinction
  has been invisible until something outside the agent said the forbidden thing.

Related:

- the local rule *A package is published from `master`* — the instruction this found the edge of
- the foundation downstream-work-is-never-offered rule — the same shape, and probably the same gap
- *`harness` names two things in the same domain* — where the word for the thing doing this is
  itself unreserved

---

Authored by Scott Bellware on Sun Aug 23 2026 at 3:42:05 AM PT
