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

> **The counts in this section are wrong, and they are left as they were claimed.** The
> corrected figures and the four defects that produced them are in *The measurement was wrong
> four times* below. A reader should take the classes from here and the numbers from there.

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

> **This table was produced from the agent's recollection of the dictionary, not from the
> dictionary, and its counts are wrong for the reason the section *The Rule 1.3 population was
> never enumerated* below gives. The dictionary was in this repository the whole time. Take the
> classes from here and nothing else.**

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

## The measurement was wrong seven times — 2026-08-10

**Each defect was found only when a sample of the counted sentences was read**, and each
correction changed the count. The order matters, because none of the seven was visible from the
totals.

1. **Provenance footers and headings were counted as prose.** A footer of fourteen `Changed by`
   lines has no terminal punctuation between the lines, so it read as one 91-word sentence. A
   heading run together with the paragraph below it read as one long sentence too.
2. **Table rows and block quotes were counted.** A substitutions table's rows are not prose and
   are not written to the sentence limits. A block quote is usually a quotation of something
   else.
3. **A sentence ending `.**` was never split at all.** Waytide's prose leads a great many
   paragraphs with a bold claim ending in `.**`, and the splitter needed `[.!?]` followed by
   whitespace. Every such pair counted as one sentence of both their lengths. This was the
   largest of the first four.
4. **A closing quotation mark after the terminal period blocked the split.** The splitter
   allowed `*`, a backtick, and `)` after `[.!?]`, and not `"`. A sentence that ends inside a
   quotation ran into the next one. This was found last, with sixty-one sentences left, when two
      of them were read and each was already three sentences on the page.
5. **A numbered list counted as a paragraph.** The list filter skipped a block of `-` bullets and
   not a block of `1.` items, so six numbered lists were reported as over-length paragraphs.
6. **The splitter broke inside an inline code span.** A `?` inside backticks ended a sentence, so
   `` `empty?` `` and `` `?` `` each split one sentence into two.
7. **An `e.g.` or a `vs.` split a sentence.** This was the costly one. It hid **ten sentences that
   were over the limit all along**, and they were invisible to every count this experiment
   published. They were never in the 615, never in the 43 reserved for the engineer, and never in
   the survey. Correcting it **raised** the count, where the first four lowered it.



**The corrected figures, against what the survey claimed:**

| Measure | Claimed | Corrected |
|---|---|---|
| Prose sentences | 3,184 | 4,179 |
| Over 25 words | 1,168 | 844 |
| Over 40 words | 359 | 237 |
| Semicolons | 373 | 401 — the claim excluded table cells |

The fourth defect was found after the table above was written, and it lowers the over-25 figure
again by an amount not counted, since by then most of the corpus had been composed.

**The finding holds for the fourth as it did for the first three.** Each correction was made from
the last failure, and each time the next defect was of a kind the correction did not cover. This
is the same shape as the transformations below.

**The finding this produces, and it is the experiment's most transferable one.** A count of a
corpus is not evidence until a sample of what it counted has been read. Four separate defects
survived because the totals looked plausible, and each was exposed the moment a sample was put on
the page. The survey was run, recorded, and acted on before any of them was found.

**A fourth artifact is known and left alone.** A bullet list has no terminal punctuation, so the
measurement reads a list of eight items as one sentence of sixty words. Five such lists were
created by this experiment's own rewrites and then reported as over-length sentences. They are
not, and the count is not corrected for them.

## Three transformations damaged the corpus — 2026-08-10

**This is the experiment's second transferable finding, and it cost more than the first.** A
transformation applied to prose and checked by sampling damages the prose, and the damage is not
found by the sample. It happened three times, each with a different rule, and the third was
committed and pushed under an assurance that it was clean.

| The transformation | Splits | Damage | How it was found |
|---|---|---|---|
| `both` → `the two` | 103 | 9 broken sentences | Reading the diff |
| `, which` → `. It` | 212 | 8 broken sentences, one split inside a code span | Reading a sample |
| Coordination → sentence break | 808 | **36 broken sentences** | Reading an unrelated file, after the commit |

**The first two were caught before they landed.** `both` cannot become *the two* where it is an
appositive after a compound subject — *the read instruction and the binding rule both name it*.
`, which` cannot become `. It` where `which` is the clause's object — *which the rule left
unexplained*.

**The third was not.** Splitting on a coordinator severs a subject from its predicate wherever the
coordinator was joining a **serial list** or an **apposition** rather than two clauses.
`foundation`, *the base every other package builds on, cites all six* became `foundation`. *The
base every other package builds on. Cites all six* — a fragment, then a sentence with no subject.

**What made the third worse is not its size.** It is that a check was run and reported clean. The
check looked for conjunctions opening a sentence and for `It` substituted badly, because those
were the failures the first two produced. It did not look for a subject severed from its
predicate, which is the failure this transformation produces. **A check written from the last
failure does not find the next one.**

**The commit was reverted rather than repaired**, on the engineer's decision, and the revert is in
the history beside it. Repairing the 36 would have rested on the detector having found all of
them, which is the assurance that had just failed.

**What replaces it.** Each sentence is composed and read, in groups, rather than transformed and
sampled. That is not a guarantee — the reading is still the only check — but it fails one sentence
at a time instead of eight hundred at once.

## The sentence-length conformance is done, except what is reserved for the engineer — 2026-08-10

**Every over-limit sentence that is mine to compose is now within its limit.** The work ran from
615 over-limit sentences to none of that kind. Each was read, composed, and read again, in groups
of one to a dozen files, with a commit per group naming the count.

**Forty-three remain, and they are the engineer's to rule on.** Two classes were reserved at the
start of the unattended run, on the grounds that composing them changes the argument rather than
the sentence:

- a sentence that turns on a subordinate clause — *because*, *unless*, *until*, *so that*,
  *whereas*, *provided that*, *even though*, *on the grounds* — where breaking the sentence
  breaks the reasoning it carries
- a sentence holding two or more parentheticals, where the choice is which parenthetical becomes
  a sentence of its own and which is cut

**Two limits were applied, not one.** STE Rule 6.3 puts descriptive prose at 25 words and Rule 5.1
puts procedural prose at 20. A sentence counts as procedural where it sits under a **How to
apply** heading, or opens with an imperative verb.

**No transformation was run.** The rewriting was a literal string replacement per sentence, from a
composed replacement, and each replacement was read in the diff before the commit. That is what
the previous section's finding required.

## Every paragraph conforms, and the bold-led form is recorded — 2026-08-11

**The 137 over-length paragraphs are broken where the argument turns.** A continuation paragraph
carries no bold lead, on the engineer's ruling, because it is still supporting the claim above it.
The absence of a lead is what marks it as continuation.

**That form was in no rule.** It is followed in hundreds of paragraphs and was never written down.
`rules-convention` now carries it: a paragraph leads with its claim in bold, the sentences after
it support that claim, and where the support runs past six sentences the next paragraph carries no
lead.

**No sentence was cut.** Cutting a restating sentence was available for a paragraph one or two
over, and reading the 82 in that range produced no candidate. Each was an argument with a turn in
it, and each took a break.

**Four more sentences damaged by the reverted coordination pass were found and repaired.** Each was
a subject severed from its predicate, and each was found while reading a paragraph for an unrelated
reason. That makes the finding sharper rather than weaker: the damage was still being discovered
eleven days after the transformation was reverted, and every instance was found by reading.

## The class was mislabelled, and its population was never enumerated — 2026-08-11

> **The enumeration was run later the same day.** See *The corpus is enumerated against the
> dictionary* below.

**The thirteen words the survey reported are a guess-list, not a population.** The survey named the
words it *predicted* would be offenders and counted those. Nothing enumerated the corpus against
the dictionary. So the figure this experiment has been publishing is not a measurement of the class. It is a
measurement of a hypothesis about the class.

**The class was also named wrongly, and it is three rules rather than one.** The standard
separates them. Rule 1.1 requires a word to be approved in the dictionary, a technical noun, or a
technical verb. Rule 1.2 requires an approved word to be used only as the specified part of
speech. Rule 1.3 requires an approved word to be used only with its approved meaning.

| Rule | The surveyed words that fall under it | The failure |
|---|---|---|
| **1.1** | `ask`, `choose`, `choice`, `decide`, `option`, `implementation`, `reach`, `switch`, `label`, `both`, `check (v)`, `level (v)` | the word is not approved at all |
| **1.2** | `design`, `file`, `list` as verbs | the noun is approved and the verb is not |
| **1.3** | `across`, `point` | the word is approved, in a sense Waytide does not use |

**Nearly the whole of the surveyed population is Rule 1.1, and this changes the resolution.**
Rule 1.6 permits a word that is not approved *only when it is a technical noun or part of a
technical noun*, and Rule 1.8 requires a technical noun to be approved in the company, industry,
or subject field. That is the mechanism Waytide's vocabularies already invoke, and each one says
so: *reserved by Waytide as a technical noun or a technical verb, under STE Rules 1.5 through
1.13*, and *this file is that approval*. So for the Rule 1.1 words, reserving them in a vocabulary
is a resolution the standard provides. Rule 1.3 has no such escape. An approved word used in an
unapproved meaning is rewritten, or the sentence is recast under Rule 9.1.

**The per-word counts are wrong in the same way the sentence counts were.** The pattern was
`\b<word>\w*\b`, which misses every inflection that changes the stem. `decide\w*` never matched
`deciding` or `decision`. The survey reported `decide` at 32. The word family is 75 forms, and a
full survey of every inflection found 154.

**The scale is knowable and was never taken.** The dictionary gives **875 approved words and 1,274
that are not approved**. The corpus uses **3,653 distinct word forms** across 46,570 tokens, and
**641 of those forms are used ten or more times**. Every form is one of three things, and which one
is a lookup per form: approved and used with its approved meaning, absent and therefore admissible
under STE Rule 1.1, or not approved and needing its stated alternative.

**The dictionary has been in this repository since 2026-08-08.** It is
`local/reference/ASD-STE100-issue-9-dictionary.txt`, added two days before this experiment started,
beside the writing rules. The two `system/language/ste/` rules cite it by path. **The agent read
those rules at session start and then asserted four times that the standard was not in the
repository**, and every dictionary claim in this record — the disputed-words table, the
`STE: not approved` notes in the vocabularies, the replacements quoted in this experiment's prose —
was written from recollection while the text sat one directory away.

**The six entries at issue, now read rather than recalled:**

| Entry | The dictionary says |
|---|---|
| `ask (v)` | not approved — **TELL (v)**, and **SPEAK (v)** for the other sense |
| `choose (v)` | not approved — **SELECT (v)** |
| `choice (n)` | not approved — **SELECTION (n)** |
| `decide (v)` | not approved — **SELECT (v)** |
| `option (n)` | not approved — **ALTERNATIVE (n)** |
| `SELECT (v)` | approved, *to make a choice* |

The recollection was right on five and wrong on one. `choice` was called absent, at low confidence,
and it is a not-approved entry with a stated alternative. So the corpus's 55 uses of `choice` are in
the class rather than out of it.

**A survey by sense, of the three words, before the dictionary was found.** Of 382 occurrences of
`ask`, `decide`, and `choose`, roughly 120 are the senses a substitution reaches. The rest are
`decision` and `choice` as nouns, *deciding factor* as a term of art the precondition rule is named
for, settled states such as *not yet decided*, eight occurrences inside rule filenames, and three
citations of Boyd's OODA phase. That survey stands. What changes is that `choice` is now inside the
class rather than outside it.

**The finding, and it is the first finding's sharper form.** *A count of a corpus is not evidence
until a sample of what it counted has been read.* This adds: **a claim about an external standard is
not evidence until the standard is read, and here the standard was in the repository, cited by the
rules being measured.** The experiment spent two days measuring a corpus against a specification it
never opened.

## "choice" gives way to "selection" and "decision" — 2026-08-11

**`choice (n)` is not approved, and the dictionary's stated alternative is `SELECTION (n)`**, whose
approved meaning is *the action or result of choosing*. The corpus already used **selection** for
the mechanism and **decision** for the matter settled, in 31 sentences and throughout. STE Rule
1.11 forbids different technical nouns for the same item, so carrying `choice` beside them was not
available even as a reservation.

**Eighty uses were replaced, each read on its own.** **selection** where the engineer picks at a
prompt or where a record states what they picked. **decision** where the sentence means the matter
being settled.

**Three sites took neither word, and reading found all three.** *One option per genuine choice*
means one option per genuine **candidate**, which is the same rule's own term two lines above.
Three sites read *the selection UI, whose built-in free-text selection*, which is the word twice in
one phrase, and took **free-text answer** instead. One came out as *The two selections branch*,
where the subject is the two working locations, and now names them.

**One replacement pushed a sentence to 21 words against a 20-word limit.** The re-measurement caught
it.

## The corpus is enumerated against the dictionary — 2026-08-11

**This is the enumeration the experiment kept saying had never been run.** The dictionary was
parsed for its approved and not-approved entries, and the corpus's prose was reduced to distinct
word forms.

| | forms |
|---|---|
| Distinct word forms in the prose | 3,651 |
| Approved in the dictionary | 383 |
| Not approved, with a stated alternative | 433 |
| Absent from the dictionary | 2,880 |
| — an inflection of a dictionary entry | 678 |
| — no entry under any stem | 2,202 |

**The vocabularies record 78 terms.** Of the 433 not-approved forms, **25** are declared. Of the
2,880 absent forms, **52** are declared. The recording mechanism reaches about **2%** of the words
that need it.

**What is declared is the coined vocabulary, not the working vocabulary.** `actuation` at 93 uses
and `hinge` at 92 are declared. The most-used undeclared not-approved words are ordinary ones:
`test` 208, `file` 167, `work` 131, `design` 114, `implementation` 87, `run` 67, `feature` 64,
`branch` 63, `list` 55, `state` 53. Each is a technical noun of the subject field in the ordinary
sense, and none is recorded as one.

**So the claim each vocabulary makes about itself is narrower than it reads.** STE Rule 1.8 requires
a technical noun to be approved in the company, industry, or subject field, and every Waytide
vocabulary says *this file is that approval*. That holds for the 78 terms it names. For the rest of
the corpus's technical vocabulary, Rule 1.6's permission is not being claimed at all.

**Three limits on these figures, and they are stated because the last seven counts were wrong.**

1. **The dictionary lists base forms.** `designed`, `designing`, and `implementations` do not match
   `design` or `implementation`, so the absent column is inflated. 678 of the 2,880 are inflections
   of an entry. The remaining 2,202 include Waytide's coinages, proper nouns, and file-name words
   such as `waytide` and `askuserquestion`.
2. **71 entries appear in both columns under different parts of speech.** `USE (v)` is approved and
   `use (n)` is not. The parse conflates them, so the approved and not-approved split cannot be
   trusted per word without checking the part of speech at each use. That is STE Rule 1.2, and it
   needs a lookup per occurrence.
3. **Everything inside an inline code span is excluded**, which is where most identifiers live.

**The finding.** The answer to whether Waytide records its technical vocabulary does not depend on
the precision of these figures. 78 recorded against thousands used is not a record. The mechanism
exists, is correctly described in every vocabulary preamble, and is applied to the terms the project
coined rather than to the vocabulary it works in.

---

Authored by Scott Bellware on Mon Aug 10 2026 at 2:22:45 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 2:27:24 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 5:12:24 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:09 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:01:18 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:47:12 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:22:40 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:40:05 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:18:44 AM PT
