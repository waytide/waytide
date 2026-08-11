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

### The survey — 2026-08-10

**107 rule files under `system/`, 3,184 sentences.** Code fences, table rows, and provenance
footers are excluded from the counts. A sentence is a run ending in `.`, `!`, or `?` and holding
more than two words.

**The three measured classes are unambiguous.** No dictionary lookup and no judgment per use.

| Divergence | Count | The rule |
|---|---|---|
| Sentences over 25 words | **1,168**, 36% of the corpus | STE Rules 5.1 and 6.3 |
| Semicolons | **373** | STE Rule 8.1 |
| Paragraphs over six sentences | **57** | STE Rule 6.6 |

The longest sentence is **481 words**, in `announce-waytide-at-session-start`.

| Package | Files | Sentences | Over 25w | Semicolons | Paragraphs > 6 |
|---|---|---|---|---|---|
| foundation | 36 | 1491 | 673 (45%) | 174 | 34 |
| design-by-efferent | 18 | 573 | 178 (31%) | 64 | 11 |
| testing | 19 | 328 | 122 (37%) | 47 | 3 |
| language | 12 | 349 | 89 (25%) | 40 | 7 |
| code | 12 | 243 | 61 (25%) | 39 | 0 |
| versioning | 4 | 95 | 30 (31%) | 3 | 0 |
| git | 6 | 105 | 15 (14%) | 6 | 2 |

### Words the STE dictionary disputes

**Counted by pattern, so each class states whether it needs a check per use.** The dictionary
disapproves the **verb** in several of these where Waytide uses the **noun**, and a raw count
cannot tell them apart.

| Word | Uses | The STE dictionary | Needs a check per use |
|---|---|---|---|
| `both` | 95 | not approved — `THE TWO` | **No.** Every sample read is the disapproved sense |
| `across` | 34 | approved only as *from one side to the other* | **No.** Every sample read is the other sense — *across sessions*, *across two agents*, *across repositories* |
| `implementation` | 145 | not approved — `DO (v)` | Yes |
| `option` | 64 | not approved — `ALTERNATIVE (n)` | Yes |
| `ask` | 41 | not approved — `TELL (v)` | Yes |
| `decide` | 32 | not approved — `SELECT (v)` | Yes |
| `reach` | 30 | not approved as a verb — `GET (v)` | Yes |
| `switch` | 30 | not approved — `SET (v)` | Yes |
| `choose` | 13 | not approved — `SELECT (v)` | Yes |
| `label` | 13 | not approved as a verb — `IDENTIFY (v)` | Yes |
| `design`, `file`, `list` | 284, 264, 84 | the **verbs** are not approved | **Almost certainly false positives.** Waytide uses the nouns |

### Waytide breaking its own substitutions

**This class needs no dictionary, and it is nearly empty.**

- **`developer`, four uses, in `git`'s announce-a-branch-switch-in-a-bordered-block rule.** That
  rule was written on `master` after the `engineer` substitution was conformed on the STE branch,
  so the conforming never reached it. **It is the only genuine self-violation in the corpus.**
- **Every other hit is correct usage.** `sweep`, `retire`, `happy path`, `handoff`, `initiate`,
  `impact`, `protect`, `thread`, and `vendor` appear only where a rule or a vocabulary names the
  word it forbids, which a substitution table cannot avoid doing.

### Not measured

**Passive voice with a known agent**, STE Rule 3.6. It takes a judgment per sentence rather than a
pattern, so no count is claimed for it.

### The forecast, scored so far

| Item | Result |
|---|---|
| 1. Sentence length is the most-broken rule | **Correct.** 1,168 instances, the largest class by an order of magnitude |
| 2. The semicolon is second, in most files | **Correct on rank.** 373 |
| 3. The paragraph limit is broken throughout | **Correct in direction, wrong in scale.** 57, which is far fewer than *throughout* implied |
| 4. Passive voice common but not pervasive | **Not scored.** No measurement was made |
| 5. `across`, `both`, `check`, `point`, `level` are the predicted approved-word offenders | **Correct on two.** `both` at 95 and `across` at 34 are the clean classes. The other three were not measured |
| 6. Waytide's own substitutions broken in a handful of places | **Wrong, and wrong in the good direction.** One rule, four uses, all of one word |
| 7. `foundation` diverges most | **Correct**, on every measured class |
| 8. The total is in the thousands | **Correct**, at 1,598 measured instances, though it rests almost entirely on item 1 |
| 9. The shortest rules are nearly conformant | **Not scored.** Per-file counts were taken per package rather than per file |
| 10. Full conformance proves undesirable | **Open.** This is the question, and the survey does not answer it |

**The finding the survey did not forecast.** The three measured classes are **mechanical** and the
word classes are **not**, and the split is nearly total. A sentence over 25 words is found without
reading it. `both` and `across` are found the same way. Everything else in the word table needs a
part-of-speech judgment per use, which is why the raw counts for `design`, `file`, and `list` are
three of the four largest numbers in the survey and mean almost nothing.

## The proposed changes — 2026-08-10

**One worked instance per class**, drawn from the corpus. This is a sample rather than the set:
1,598 measured instances cannot be listed, and each class below is what every one of its instances
would look like.

### 1. The semicolon — 373 instances

Cheap, and the sentence usually improves.

**Before**, `git`'s run-suite-before-commit rule, 38 words:

> Committing is the point of no easy return; the suite is the cheapest way to prevent committing a
> regression, and running it *before* deliberating commit keeps a failing change from ever
> becoming a commit candidate.

**After**, three sentences of 15, 12, and 17 words:

> Committing is the point of no easy return. The suite is the cheapest way to prevent a committed
> regression. Running it before you deliberate the commit keeps a failing change from becoming a
> commit candidate.

### 2. `both` — 95 instances

A word swap, and the sentence around it rarely moves.

**Before**, `design-by-efferent`'s hinge-cycle rule:

> In both cases, always offer the origination escape.

**After:**

> In the two cases, always offer the origination escape.

### 3. `across` — 34 instances

A swap, and which word replaces it differs by site.

**Before**, `code/ruby`'s running-the-test-suite rule:

> …so the command is reproducible across sessions rather than a parser rebuilt each time.

**After:**

> …so the command is reproducible in every session rather than a parser rebuilt each time.

### 4. `developer` — 4 instances, the one self-violation

A straight swap the earlier conforming missed.

**Before**, `git`'s announce-a-branch-switch-in-a-bordered-block rule:

> Print it when the developer asked for the switch.

**After:**

> Print it when the engineer asked for the switch.

### 5. Sentence length — 1,168 instances

**This is where the cost is.** The instance is deliberately a typical one rather than the 481-word
outlier.

**Before**, `foundation`'s deferred-convention, 32 words:

> `waytide/local/deferred/` holds design changes that have been identified but intentionally
> **postponed until the current task is finished** — work that shouldn't interrupt the task in
> flight but must not be lost.

**After**, four sentences of 11, 8, 10, and 6 words:

> `waytide/local/deferred/` holds design changes that are identified and then postponed. They wait
> until the current task is finished. Such a change must not interrupt the task in flight. It must
> also not be lost.

**What this instance shows is the experiment's question.** The rewrite conforms, and it is four
assertions where there was one thought. The original turns on *but* twice — *but must not be
lost* — and that tension is the whole of what the sentence says. The split states both halves and
drops the tension between them. Multiply it by 1,168 and the corpus becomes a list of true
statements that no longer argues.

### So the proposal splits in two

1. **Classes 1 through 4 — 506 instances.** Mechanical, cheap, and no meaning is lost. `both` and
   `across` need no judgment, the semicolon splits are local, and `developer` is a defect rather
   than a divergence of taste.
2. **Class 5 — 1,168 instances.** Each is a rewrite with a judgment in it, and the instance above
   is the argument against doing them all.

**Neither is decided here.** The engineer has not ruled on either, and this section records what
was proposed rather than what was settled.

---

Authored by Scott Bellware on Mon Aug 10 2026 at 2:22:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 2:27:24 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 5:12:24 PM PT
