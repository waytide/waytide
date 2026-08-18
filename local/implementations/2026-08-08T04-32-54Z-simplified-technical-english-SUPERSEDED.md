# Experiment — Use ASD-STE100 Simplified Technical English

**Tags:** [experiment]

## Superseded on 2026-08-08

**The STE Spec experiment superseded this one.** This experiment asked what the specification
costs when it is applied to writing that argues. It could not answer, because it did not hold the
specification. Its cycle 3 forbade any finding that rests on a specific clause. The STE Spec
experiment was created from this branch to remove that constraint, and it went on to hold the
document, the vocabulary comparison, the reserved terms, and the rules that came from them.

**A child experiment outgrew its parent.** The derivative went further than the primitive, so the
primitive gives way. See the experiment-lifecycle rule.

**This record's divergent content is preserved on the child's branch.** Two commits edited this
file after the child was created from it — the forecast was rewritten to remove commentary, and
two passages were reworded. Both are here, and both commits stay reachable from the child's
history. The branch was deleted on 2026-08-08 and was never pushed.

## Question

**Three questions, worked in this order**, the third informing the first two:

1. **What does the specification cost when applied to writing that argues rather than instructs?**
   ASD-STE100 was built for maintenance documentation. Waytide's rules argue from premises.
2. **Should Waytide's rules be written in Simplified Technical English?**
3. **Should the agent's answers be written in Simplified Technical English?**

## Setup

- **State:** Superseded
- **Tags:** [experiment]
- **Superseded by:** `2026-08-08T06-26-51Z-ste-spec.md`, the STE Spec experiment, on 2026-08-08
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/simplified-technical-english`, deleted on 2026-08-08
- **Base:** `fef00202062868632bd4d11043d9279fbd67067b`
- **Working location:** branch only, chosen at initiation. This working tree switches back to
  `master` at the conclusion.
- **Participation:** attended, chosen at initiation.

**This record carries no `**State:**` line, and that is the state.** The experiments-convention
names six state words — Affirmed, Refuted, Inconclusive, Abandoned, Superseded, Suspended — and
says a record without the line is **in flight**. The
line is added when the experiment reaches one of the six. It read `**State:** In flight` when this
record was written, which is not a state word: `session-start.sh` parses the first word of the
value and reported the experiment open as `(In)`.

## What the specification is

**ASD-STE100**, the AeroSpace and Defence Simplified Technical English specification, maintained by
the AeroSpace and Defence Industries Association of Europe. It began as AECMA Simplified English,
written so that maintenance documentation could be read reliably by people whose first language is
not English.

Its two halves, as generally described:

1. **An approved dictionary.** Each approved word carries **one meaning and one part of speech**.
   A word not in the dictionary is not used, except for technical names and technical verbs, which
   a project may approve for its own domain.
2. **Writing rules** — limits on sentence length, a preference for the active voice, one
   instruction per sentence, and a distinction between **procedural** and **descriptive** writing
   with different limits for each.

**What is not in hand.** The specification itself is not available in this repository, and the
account above is general rather than clause-by-clause. **No finding of this experiment may rest on
a claim about a specific rule number, a specific word's approval status, or an exact sentence-length
limit** without the specification to check it against. That constraint is recorded before the work
because it decides what this experiment can honestly conclude.

## Forecast

Committed before the work.

**This section was edited on 2026-08-08 to remove commentary.** No prediction was added, removed,
or changed. The commit before the edit holds the original wording. Each item below is what the item
predicted, with the sentences that scored or characterized the prediction taken out.

1. **Waytide's `vocabulary.md` files work as approved-word dictionaries.** Each holds terms with
   one settled meaning and a substitution table naming the word to write instead.
2. **The approved dictionary is where the specification breaks against Waytide.** The settled terms
   `efferent`, `actuation`, `solubility`, `hinge`, `cradle`, `mean-bias`, and `machine-scoped` are
   not ordinary English. The technical-name provision is the accommodation to test first.
3. **The split falls between a rule's sections, not between rules.** A **How to apply** section
   survives the specification nearly intact. A **Why** section does not survive the sentence-length
   and one-topic limits.
4. **Applied to answers, the specification composes with
   `an-answer-is-a-list-and-prose-must-justify-itself`.** That rule constrains an answer's form.
   The specification constrains vocabulary and sentence construction. A list item stating a fact is
   short, so the sentence limits rarely bind. The dictionary forbids Waytide's own terms in the
   answers about them.
5. **The verdict is inconclusive while the question stays at three parts.** Affirmed or refuted
   requires the question narrowed to one section or one surface.
6. **Testing Waytide's prose against an external standard exposes what the prose does that no rule
   states.** *This item is unfalsifiable as written. It is kept because it was committed, and it is
   marked so that no finding rests on it.*

## The third question is under trial from 2026-08-08

**The developer instructed the agent to write its answers in Simplified Technical English**,
adapted to Waytide's vocabulary, and to keep the bullet list format. The third question is
therefore tested by use rather than by argument.

**What the agent applies:**

1. Short sentences. One idea in each sentence.
2. The active voice.
3. One instruction in each instruction sentence.
4. Waytide's settled terms as approved project words.
5. The list form required by `an-answer-is-a-list-and-prose-must-justify-itself`.

**What the agent cannot apply.** The approved dictionary is not in this repository. The agent
cannot check a word against it. The agent applies the writing rules only. This is the constraint
from cycle 3.

**A rule about how an agent answers is judged by answers written under it.** It is not judged by
writing it. The rule settled on 2026-08-07 records the same constraint.

## What actually happened

To be recorded against the forecast as the work proceeds.

## Findings

To be recorded.

## Misses

Outcomes the forecast did not account for, recorded post hoc.

---

Authored by Scott Bellware on Fri Aug 7 2026 at 9:32:54 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 11:08:29 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 12:11:58 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 12:44:59 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:20:44 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 10:42:59 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:09:20 AM PT
