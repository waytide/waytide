# Experiment — Use ASD-STE100 Simplified Technical English

## Question

**Three questions, worked in this order**, the third informing the first two:

1. **What does the specification cost when applied to writing that argues rather than instructs?**
   ASD-STE100 was built for maintenance documentation. Waytide's rules argue from premises.
2. **Should Waytide's rules be written in Simplified Technical English?**
3. **Should the agent's answers be written in Simplified Technical English?**

## Setup

- **Upstream branch:** `master`
- **Experiment branch:** `experiment/simplified-technical-english`
- **Base:** `fef00202062868632bd4d11043d9279fbd67067b`
- **Working location:** branch only, chosen at initiation. This working tree switches back to
  `master` at the conclusion.
- **Gating cadence:** attended, chosen at initiation.

**This record carries no `**State:**` line, and that is the state.** The experiments-convention
names six state words — Affirmed, Refuted, Inconclusive, Abandoned, Superseded, Suspended — and
says a record without the line is **in flight**, which is a true reading rather than a defect. The
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

1. **Waytide already does part of what the specification does, and the overlap is not accidental.**
   The `language` package requires literal naming, forbids slang, and holds each term to one
   meaning. Every `vocabulary.md` in the system **is** an approved-word dictionary for its
   package, with substitution tables saying which word to write instead of which. The two arrived
   at the same mechanism from different directions.
2. **The approved dictionary is where it breaks.** Waytide's settled terms — *efferent*,
   *actuation*, *solubility*, *hinge*, *cradle*, *mean-bias*, *machine-scoped* — are the system's
   whole conveyable output, and none is ordinary English. The specification's technical-name
   provision is the obvious accommodation, and whether it stretches this far is the first thing to
   test.
3. **The split falls between a rule's sections, not between rules.** A **How to apply** section is
   procedural and should survive the specification nearly intact. A **Why** section argues, and
   sentence-length and one-topic limits will damage it.
4. **Applied to answers, it collides with the rule settled today.**
   `an-answer-is-a-list-and-prose-must-justify-itself` constrains an answer's **form**; the
   specification constrains its **vocabulary and sentence construction**. They compose in
   principle. The collision is that a list item stating a fact is already short, so the
   specification's sentence limits would rarely bind, and its dictionary would forbid the system's
   own terms in the answers that are about them.
5. **The likeliest verdict is inconclusive as the question stands**, and affirmed or refuted only
   once the question is narrowed to a section or a surface. A single verdict over rules, answers,
   and argumentative prose together is three answers wearing one word.
6. **The most valuable finding will not be about the specification.** Testing Waytide's prose
   against an external standard will expose what the prose is doing that nobody has stated —
   which is worth more than the adoption decision either way.

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

**Why a trial answers this question and an argument does not.** The rule settled on 2026-08-07
carries the same lesson. A rule about how an agent answers cannot be judged by writing it. It is
judged by answers written under it.

## What actually happened

To be recorded against the forecast as the work proceeds.

## Findings

To be recorded.

## Misses

The outcomes that escaped the forecast, recorded post hoc.

---

Authored by Scott Bellware on Fri Aug 7 2026 at 9:32:54 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 11:08:29 PM PT
