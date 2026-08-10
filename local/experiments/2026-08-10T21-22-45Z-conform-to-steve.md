# Experiment — Conform to STEve

## Question

**Does Waytide's own prose conform to STEve, and what does conforming it cost?**

**Two questions, and the second is the one with a verdict in it.** Whether the prose diverges is
not in doubt — the STE experiment already recorded *rules Waytide breaks throughout, sentence
length above all*. What is in doubt is whether conforming the corpus is worth doing, in whole, in
part, or not at all. A survey that produced a list and no judgment would answer nothing.

## Setup

- **Upstream branch:** `master`
- **Experiment branch:** `experiment/conform-to-steve`
- **Base:** `df88964585e67fac660a72a0bb4e19200932e95e`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Rests on:** the STE experiment, affirmed 2026-08-10, which read the specification and settled
  Waytide's reserved terms. This experiment takes those as given and turns to the prose.

## Forecast

Committed before the survey is run. Each item carries the agent's confidence.

1. **Sentence length is the most-broken rule**, by a wide margin — STE Rules 5.1 and 6.3, twenty
   words procedural and twenty-five descriptive. *High confidence.*
2. **The semicolon is the second**, STE Rule 8.1, and it appears in most rule files. *High
   confidence.*
3. **The paragraph limit is broken throughout**, STE Rule 6.6, six sentences in descriptive
   writing. *High confidence.*
4. **Passive voice with a known agent**, STE Rule 3.6, is common but not pervasive — the
   subject-first commit rule has trained the opposite habit in some places. *Moderate confidence.*
5. **Approved words used with meanings STE does not approve**, STE Rule 1.3, will be the subtlest
   class and the one requiring a dictionary lookup per word. `across`, `both`, `check`, `point`,
   and `level` are the predicted offenders. *Moderate confidence.*
6. **Waytide's own substitutions are broken in Waytide's own prose** in a handful of places, not
   many, because sweeps were run for `developer`, `initiate`, `impact`, `protect`, and `retire`.
   *Moderate confidence.*
7. **`foundation` diverges most**, being the largest and oldest package. *Moderate confidence.*
8. **The total count is in the thousands, not the hundreds.** *Low confidence — the count depends
   entirely on whether sentence length is counted per sentence.*
9. **The shortest rules are nearly conformant already**, and the longest are the least. *Moderate
   confidence.*
10. **Full conformance will prove undesirable**, and the experiment will end by conforming some
    classes and declining others. The sentence limits are the predicted decline: Waytide's rule
    bodies argue, and an argument cut into twenty-word sentences reads as a list of assertions
    with the reasoning removed. *Moderate confidence, and this is the item the experiment is
    really about.*

## What actually happened

To be recorded against the forecast as the survey proceeds.

---

Authored by Scott Bellware on Mon Aug 10 2026 at 2:22:45 PM PT
