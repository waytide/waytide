# Explore Claude Code output styles, which shape the agent by a mechanism Waytide does not use

Waytide shapes the agent through **rules read at the start of a session**. A Claude Code **output
style** shapes it by **replacing part of the system prompt**. The two aim at the same thing by
different mechanisms, and Waytide has never examined the second.

- **Waits for:** the STE experiment concluding. That experiment is changing what the rules say and
  how they are written, and this question is about how rules reach the agent at all. Working both
  at once would confuse a change in the words with a change in the delivery.

## Why it is worth the time

**The rule read is Waytide's whole delivery, and it has a known cost.** Every session begins by
reading every rule file under `waytide/system/` and `waytide/local/rules/`. The initialization rule
prints a notice saying the read takes a few moments, which is an admission that the cost is real.
An output style carries its content without a read.

**The two are not equivalent, and the difference is what to examine.**

- **A rule is a file in a repository.** It is versioned, reviewed, published to a component
  repository, and installed into a project. An engineer reads it as prose.
- **An output style is configuration.** It is not versioned with the packages, does not travel by
  `git subtree split`, and an engineer does not read it the way they read a rule.

**So the question is not which is better.** It is which parts of Waytide are rules that an engineer
reads, and which parts are instructions the agent needs held in front of it at every turn. The
answer-form rule, the no-slang rule, and the STE writing rules are all in the second class, and
they are the ones an agent forgets between turns.

## What it would have to settle

1. **What an output style can hold**, and whether it can carry enough to matter.
2. **Whether a project's own rules can reach it**, since `waytide/local/rules/` is per project and
   an output style is per machine or per project configuration.
3. **What happens to the session-start read** if some of it moves. The read is unconditional today,
   and the `announce-waytide-at-session-start` rule reserves the notice to the harness.
4. **Whether the two can hold the same content without drifting**, which is the failure this would
   introduce and the reason to be careful.

**Why:** the delivery mechanism has never been chosen, only inherited. Waytide reads rules because
that is what it started doing, and no record examines the alternative. A mechanism that has not
been compared to anything is not a decision.

**How to apply:** after the STE experiment concludes, read what Claude Code output styles can hold
and how they are configured. Compare that against what the session-start read carries today. Decide
which parts of Waytide are prose an engineer reads and which are instructions the agent needs at
every turn, and say so in a record before changing anything. Related: the
announce-waytide-at-session-start rule and `foundation`'s `session-start.sh`, which carry the
delivery as it stands, and the rules-convention.

---

Authored by Scott Bellware on Sun Aug 9 2026 at 6:42:21 PM PT
