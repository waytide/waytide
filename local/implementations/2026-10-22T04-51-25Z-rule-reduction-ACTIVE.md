# Experiment — Rule reduction

**Tags:** [experiment]

## Question

**Can the rules a session reads be reduced — in their content, in how they are read, and in how they arrive — and sessions still behave the same?**

It realizes the item *Reducing rule files to their essential directives*, `local/items/2026-09-09T20-36-50Z-reducing-rule-files-to-their-essential-directives`, and its plan.

## Phases

One at a time, in this order, each on its own branch from the experiment's.

1. **compression** — `experiment/worktree/rule-reduction.compression`. Named flattening until 2026-10-26. Can each rule be flattened to its essential content — present directives and their reasons — and sessions behave the same? *Same effect and outcome* is the engineer's test for what is essential.
2. **packaged-script** — `experiment/worktree/rule-reduction.packaged-script`. Does one packaged script that prints every rule in a fixed order shorten the session-start read?
3. **additional-context** — `experiment/worktree/rule-reduction.additional-context`. Can the session-start hook deliver the rules to the agent before its first response, with no read at all?

**Changed 2026-10-29, before phase 3's work:** phase 3 is **triggers** — `experiment/worktree/rule-reduction.triggers`. Can a trigger index, always loaded, stand in for pre-loading part of the rules, with sessions behaving the same?
4. **re-read-after-compaction** — `experiment/worktree/rule-reduction.re-read-after-compaction`. Added 2026-10-29. After the context is compacted, does the session read the rules again in full, rather than keep them only as a summary? Finding #10.
5. **title-display** — `experiment/worktree/rule-reduction.title-display`. Added 2026-10-29. Can the engineer see each rule's title as the rules load, without the agent receiving the list? **Abandoned 2026-10-29**, at the engineer's decision not to pursue a printed index of the rules.
6. **active-packages-only** — `experiment/worktree/rule-reduction.active-packages-only`. Added 2026-10-29. Does reading only a project's active packages, and no deactivated one, keep sessions behaving the same while the read shrinks?
7. **local-compression** — `experiment/worktree/rule-reduction.local-compression`. Added 2026-10-29. Can the local rules and the vocabularies be compressed as the package rules were, with sessions behaving the same?

## State

**Suspended by the engineer on 2026-10-22**, during phase 1, flattening. The phase branch `experiment/worktree/rule-reduction.flattening` and the worktree are kept. Phase 1 had reached this point:

- **Five rules compressed:** #2, #7, #11, #12, and #15. Each passed the predictability simulation, with one miss in 150 answers.
- **The directive check run on #15:** its one material loss of precision, the missing-upstream decision, was restored.
- **The directive check run on #11:** two directives were found lost outside the intended resolution, and are not restored.

**Whether a compressed rule has the same effect as its source remains open.**

**Resumed by the engineer on 2026-10-22.** The State line is removed, since absence is the in-progress state, and work continues on the phase branch in the worktree.

- **State:** Active

**The line is added on 2026-10-27.** Active became an implementation's in-progress state on 2026-10-26, and the record had not taken it.

## Setup

- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/worktree/rule-reduction`
- **Base:** `5979ee0`, from `master` — the commit that records this experiment
- **Working location:** branch and worktree, chosen at the start. The worktree is `/Users/sbellware/projects/waytide/waytide-experiment-worktree-rule-reduction`, and this working tree stays on `master`.
- **Participation:** attended, chosen at the start.
- **The first phased experiment.** The implementation-lifecycle rule gained its account of phases for it, in `241a95b`.

## Forecast

Committed before the work. Each item carries the agent's confidence.

**Phase 1 — flattening**

1. **The compiled read shrinks by 10% to 25%.** The history moved in the derived-rule-files experiment was 0.8%, so most of the saving has to come from restating, not from moving. *Moderate confidence.*
2. **Sessions answer representative requests the same from the flattened read as from today's**, as the derived-rule-files experiment found for footers and history. *Moderate confidence.*
3. **For a few rules, what is essential is the engineer's judgment rather than the agent's**, as passage 45 of the obsolete-rules experiment was. *Moderate confidence.*

8. **Added 2026-10-21, before any rule was flattened — the engineer's hypothesis: the lower a rule's solubility score, the lower its compression.** A rule harder to understand is one the agent can interpret less, and so restate less economically. **Compression** is the share of a rule's characters removed when it is restated with the same effect and outcome: a rule flattened from 8,935 characters to 6,000 has a compression of 0.33. *The engineer's suspicion, stated as a forecast.*
   - **Extended by the engineer, still before any rule was flattened: a lower-solubility rule also comes out less changed.** The agent has less effect on a rule it cannot understand, and more on one it understands well enough to word more economically. So two things are measured for each flattened rule: its **compression**, the share of characters removed, and its **change**, the share of its words removed, added, or replaced, from a word-level comparison of before and after. The hypothesis predicts both are lower where solubility is lower.
   - **The agent's competing expectation: the reverse.** A rule hard to follow because it is verbose, repetitive, or carries history may have the most to remove, and so compress the most. *Low confidence, as the engineer's is untested too.* Measuring each subject rule's compression beside its solubility score tells the two apart.

**Phase 2 — packaged-script**

4. **The read falls to one to three tool calls, and its median duration falls well below the variance measured so far — under 20 seconds.** *Moderate confidence.*
5. **The printed rules exceed what one tool result carries**, so the harness saves the output to a file and the agent reads it in parts, giving back some of the saving. *Moderate confidence.*

**Phase 3 — additional-context**

6. **Delivering every rule this way is refuted by size alone.** The channel is capped at 10,000 characters and the compiled read is about 547,000. *High confidence.*
7. **A part of the rules fits, and what fits is not enough to stand in for the read.** *Low confidence.*

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| The phases, and their order | flattening, packaged-script, additional-context | Wed Oct 21 2026 at 9:51:25 PM PT |
| Branch names | the base, then a dot and the phase | Wed Oct 21 2026 at 9:51:25 PM PT |
| Working location | Branch and worktree | Wed Oct 21 2026 at 9:51:25 PM PT |
| Participation | Attended | Wed Oct 21 2026 at 9:51:25 PM PT |
| Phase 1 started | flattening | Wed Oct 21 2026 at 9:56:47 PM PT |
| Phase 1 method | One rule at a time, on a subject set the engineer specifies | Wed Oct 21 2026 at 9:58:18 PM PT |
| Compressed text — actuation | `./compile.sh --compressed` | Wed Oct 21 2026 at 11:11:49 PM PT |
| Compressed text — observation | Each compiled rule, whole, against its expected text | Wed Oct 21 2026 at 11:11:49 PM PT |
| Compressed text — controls | Two literal control rules | Wed Oct 21 2026 at 11:11:49 PM PT |
| Compressed text — implementation | Written directly | Wed Oct 21 2026 at 11:11:49 PM PT |
| Compressed text — naming | Compiles the compressed text when switched; Removes the History and Compressed sections | Wed Oct 21 2026 at 11:11:49 PM PT |
| Phase 1 increment added | Clarify the rule names | Sun Oct 25 2026 at 4:01:50 PM PT |
| Rule names — scope | Titles too, since the name is derived from the title | Sun Oct 25 2026 at 4:04:18 PM PT |
| Rule names — renames | Citations in other rules are updated; installed copies take the new names on refresh | Sun Oct 25 2026 at 4:05:29 PM PT |
| Rule names — clarity | What makes a rule's content clear | Sun Oct 25 2026 at 4:06:30 PM PT |
| Rule names — participation | Attended | Sun Oct 25 2026 at 4:08:50 PM PT |
| Rule names — participation, after five rules | Unattended, with a review list | Sun Oct 25 2026 at 4:19:33 PM PT |
| Phase 1 renamed | compression, formerly flattening | Mon Oct 26 2026 at 3:07:22 PM PT |

## What actually happened

### Phase 1 — flattening, started — 2026-10-21

**The phase branch is `experiment/worktree/rule-reduction.flattening`**, created in the worktree from the experiment's branch at `0e84fcd`. The experiment's branch was first brought level with `master`, which had gained the participation-as-batch-size item and nothing touching the rules.

**The record is kept on the experiment's branches from here.** The copy on `master` stays as the experiment's start recorded it, so the two do not diverge into a conflict when the experiment merges.

**The phase goes one rule at a time, on rules the engineer chooses.** The engineer will give the specifications for which rules form the subject set. Each rule in it is flattened and put to the engineer on its own, rather than the set being flattened by agents and reviewed afterward.

### Candidates for the subject set — 2026-10-21

**The engineer asked which rules combine significant volume with a lack of clarity.** All 106 compiled rules were ranked by size and by six measures of how hard a rule is to follow: average sentence length, the share of sentences over 25 words — STE's limit for descriptive text — past-tense and history words, dashes used as asides, citations of other rules, and negations. The median rule is 3,500 characters at 17 words a sentence. The top candidates were then read.

| rule | characters | what makes it hard to follow |
|---|---|---|
| items-convention | 8,935 | It contradicts itself: "No tag is reserved here" and "The tag describes and decides nothing", where `[work-item]` is now a reserved tag that decides a work item's states and `[idea]` is assigned by rule. It carries history in its body. The highest combined score. |
| announce-waytide-at-session-start | 27,994 | Size above all — three times the next rule and eight times the median. Its sentences are short, and much of it is accounts of earlier forms and failures, kept in the body in the derived-rule-files history move because each carries a reason. |
| an-item-takes-a-log-entry | 7,493 | More argument than instruction: its directives are in its first third, and the rest argues why the rule exists. |
| a-project-declares-its-package-set | 6,156 | Long sentences: 49% are over 25 words, the highest of any rule. Its structure is clear. |
| implementation-lifecycle | 13,855 | Size, and long sentences — 30% over 25 words — with the new phases section added. |

**The agent recommended items-convention**, as the clearest case of both, part of whose unclarity came from additions made on 2026-10-21, **and announce-waytide-at-session-start**, where volume dominates and flattening would show its size effect most. The subject set is the engineer's to specify.

**Each candidate carries a `**Solubility:**` attribute**, at the engineer's direction: the inverse of its rank in the table above, so the least soluble is 1. items-convention is 1, announce-waytide-at-session-start 2, an-item-takes-a-log-entry 3, a-project-declares-its-package-set 4, and implementation-lifecycle 5. The line sits under each source rule's title, and the compiler carries it into the compiled rule.

**Each candidate also carries its `**Original rank:**`**, its position in the measured ranking of all 106 rules before the candidates were read: items-convention 1, an-item-takes-a-log-entry 2, a-project-declares-its-package-set 5, implementation-lifecycle 6, and announce-waytide-at-session-start 10. Reading moved announce-waytide-at-session-start up the candidate list for its size, which is why the two orders differ. The agent first gave the count as 108; it is 106, two rules having left `foundation` in the obsolete-rules experiment.

**Each candidate also carries its `**Unclarity:**` score**, the mean of its six clarity measures' ranks among the 106 rules, from 0 to 1: items-convention 0.82, an-item-takes-a-log-entry 0.77, a-project-declares-its-package-set 0.76, implementation-lifecycle 0.58, and announce-waytide-at-session-start 0.52. **The engineer directed that it be recorded as unclarity and displayed as a clarity score, 1 − unclarity**, so items-convention shows as 0.18 and announce-waytide-at-session-start as 0.48.

**The candidates, with every measure, as shown to the engineer on 2026-10-21.** Size is each compiled rule before its attribute lines were added. The clarity score is 1 − unclarity. The combined score is the mean of the size rank and the unclarity, each 0 to 1 among the 106 rules, where higher is larger and less clear together.

| rule | size, characters | Solubility | Original rank | clarity score | combined score |
|---|---|---|---|---|---|
| items-convention | 8,935 | 1 | 1 of 106 | 0.18 | 0.89 |
| announce-waytide-at-session-start | 27,994 | 2 | 10 of 106 | 0.48 | 0.76 |
| an-item-takes-a-log-entry | 7,493 | 3 | 2 of 106 | 0.23 | 0.83 |
| a-project-declares-its-package-set | 6,156 | 4 | 5 of 106 | 0.24 | 0.80 |
| implementation-lifecycle | 13,855 | 5 | 6 of 106 | 0.42 | 0.79 |

**How the scores are calculated**, over the 106 compiled rules:

1. **Seven measures are taken for each rule**, leaving out fenced blocks, the `Related:` list, and sentences of two words or fewer:
   - **size** — characters in the compiled rule
   - **average sentence length** — words per sentence
   - **long sentences** — the share over 25 words
   - **history words** — *was*, *were*, *had*, *until*, *used to*, *previously*, *earlier*, *no longer*, *replaced*, *once*, per sentence
   - **asides** — spaced dashes, per sentence
   - **citations** — phrases of the form *the some-rule-name rule*, per sentence
   - **negations** — *not*, *never*, *no*, *nor*, *neither*, *rather than*, per sentence
2. **Each measure becomes a rank from 0 to 1**: the 106 values are sorted lowest to highest, and a rule's rank is its position divided by 105. Tied values share the lower position.
3. **Unclarity is the mean of the six ranks other than size**, and the clarity score shown is 1 − unclarity. **The combined score is the mean of the size rank and the unclarity**, so the two count equally.

**What the scores are not.** They are relative, so a rule's score says how it compares with the other 105, and an improvement in every rule would leave every score where it was. The six clarity measures are weighted equally by the agent's choice, not by a finding. The word lists are crude — *once* or *no* can appear without marking history or a negation — which is why the top candidates were read before any was recommended.

**The combined score is a screen for which rules to read, not a reliable ranking of how hard a rule is to process.** The engineer asked whether it is one, and the reasons it is not:

1. **It is unvalidated.** No reader, human or agent, has been measured finding a high-scoring rule harder than a low-scoring one.
2. **Its measures are stand-ins.** Long sentences and negations are known to make text harder; history words, asides, and citations are not difficulty in themselves, and a citation can make a rule easier.
3. **It misses the defects that matter most to an agent** — contradiction, ambiguity, and references to what no longer exists. items-convention's contradiction about reserved tags was found by reading it, not by the score.
4. **Size is mixed in**, and size is a cost of reading rather than of understanding. announce-waytide-at-session-start is the largest rule and among the clearer ones.
5. **The weights are the agent's choice**, and two of the measures — average sentence length and the share of long sentences — measure nearly the same thing, so sentence length counts twice.
6. **Ranks hide distances**, so a small difference between two rules looks like a large one.

**What would make it trustworthy:** comparing it with the engineer's own ranking of a sample, made without seeing the scores; comparing it with how sessions behave on low- and high-scoring rules; and recomputing it with other weights to see whether the same rules stay at the top.

**"Solubility" now names the combined score, for a rule's measured score only**, at the engineer's direction. It runs as the combined score does: higher is larger and less clear together, so harder to process. The engineer chose that direction knowing it reverses the word's meaning in the `language` package's solubility rule, where higher solubility is easier understanding, and kept that meaning — and design-by-efferent's — everywhere else. The five candidates' `**Solubility:**` lines, which had carried the inverse of their rank, now carry the combined score: items-convention 0.89, an-item-takes-a-log-entry 0.83, a-project-declares-its-package-set 0.80, implementation-lifecycle 0.79, and announce-waytide-at-session-start 0.76.

**Solubility runs the other way, corrected by the engineer: higher is easier to process.** A rule's measured solubility is 1 − its combined score, so it runs as the clarity score does and as the word does in the `language` solubility rule. The five candidates' `**Solubility:**` lines now carry it — items-convention 0.11, an-item-takes-a-log-entry 0.17, a-project-declares-its-package-set 0.20, implementation-lifecycle 0.21, and announce-waytide-at-session-start 0.24 — and forecast item 8 is restated to match: the lower a rule's solubility, the lower its compression. The term still names only a rule's measured score.

**Solubility is scaled to 0–100, at the engineer's direction: (1 − the combined score) × 100, as a whole number.** items-convention is 11, an-item-takes-a-log-entry 17, a-project-declares-its-package-set 20, implementation-lifecycle 21, and announce-waytide-at-session-start 24. Computed from the unrounded scores, each rounds to the same whole number as the two-decimal value times 100.

**The candidates as they now stand**, solubility being (1 − the combined score) × 100, where higher is easier to process:

| rule | size, characters | Original rank | clarity score | solubility |
|---|---|---|---|---|
| items-convention | 8,935 | 1 of 106 | 0.18 | 11 |
| an-item-takes-a-log-entry | 7,493 | 2 of 106 | 0.23 | 17 |
| a-project-declares-its-package-set | 6,156 | 5 of 106 | 0.24 | 20 |
| implementation-lifecycle | 13,855 | 6 of 106 | 0.42 | 21 |
| announce-waytide-at-session-start | 27,994 | 10 of 106 | 0.48 | 24 |

**"Compressibility" is renamed "compression"**, at the engineer's direction. The measure is unchanged: the share of a rule's characters removed when it is restated with the same effect and outcome. The log entries that used the earlier word keep it, as historical records.

### Comparison rules — 2026-10-21

**At the engineer's direction, the five most soluble rules and the five nearest the corpus's median solubility, 49.5, carry the same three attributes as the candidates**, measured on the same compiled rules. They give the candidates, the least soluble, something to be compared against.

**The five most soluble**

| rule | size, characters | Original rank | clarity score | solubility |
|---|---|---|---|---|
| control-prefix-test-vars | 731 | 106 of 106 | 1.00 | 99 |
| show-feature-test-output-after-implementation-hinge | 1,764 | 105 of 106 | 0.94 | 91 |
| plans-no-code-samples | 1,292 | 103 of 106 | 0.82 | 88 |
| single-case-test-named-for-feature | 1,549 | 104 of 106 | 0.85 | 88 |
| test-context-nesting-mirrors-folders | 1,658 | 102 of 106 | 0.84 | 87 |

**Five near the median**

| rule | size, characters | Original rank | clarity score | solubility |
|---|---|---|---|---|
| record-rule-authorship-in-a-footer | 2,656 | 54 of 106 | 0.30 | 50 |
| waytide-keeps-its-word-where-the-ste-word-means-something-else | 4,771 | 55 of 106 | 0.77 | 50 |
| working-state-artifacts-carry-a-provenance-footer | 3,480 | 52 of 106 | 0.48 | 49 |
| the-journal-is-read-at-session-start | 3,506 | 53 of 106 | 0.49 | 49 |
| a-high-level-context-names-a-behavior-not-a-method | 3,849 | 56 of 106 | 0.63 | 50 |

**Two of the median five are median for opposite reasons.** waytide-keeps-its-word-where-the-ste-word-means-something-else is large and clear, with a clarity score of 0.77; record-rule-authorship-in-a-footer is small and unclear, at 0.30. The same solubility can hide two different rules, which is the combined score's mixing of size and clarity at work.

### The fifteen measured rules, in three tables — 2026-10-21

Numbered across the three, as shown to the engineer. Size is characters before the attribute lines were added. Original rank runs from least soluble, 1, to most soluble, 106.

**Most soluble**

| # | rule | size | Original rank | clarity score | solubility |
|---|---|---|---|---|---|
| 1 | control-prefix-test-vars | 731 | 106 of 106 | 1.00 | 99 |
| 2 | show-feature-test-output-after-implementation-hinge | 1,764 | 105 of 106 | 0.94 | 91 |
| 3 | plans-no-code-samples | 1,292 | 103 of 106 | 0.82 | 88 |
| 4 | single-case-test-named-for-feature | 1,549 | 104 of 106 | 0.85 | 88 |
| 5 | test-context-nesting-mirrors-folders | 1,658 | 102 of 106 | 0.84 | 87 |

**Average solubility, near the median of 49.5**

| # | rule | size | Original rank | clarity score | solubility |
|---|---|---|---|---|---|
| 6 | record-rule-authorship-in-a-footer | 2,656 | 54 of 106 | 0.30 | 50 |
| 7 | waytide-keeps-its-word-where-the-ste-word-means-something-else | 4,771 | 55 of 106 | 0.77 | 50 |
| 8 | a-high-level-context-names-a-behavior-not-a-method | 3,849 | 56 of 106 | 0.63 | 50 |
| 9 | working-state-artifacts-carry-a-provenance-footer | 3,480 | 52 of 106 | 0.48 | 49 |
| 10 | the-journal-is-read-at-session-start | 3,506 | 53 of 106 | 0.49 | 49 |

**Least soluble**

| # | rule | size | Original rank | clarity score | solubility |
|---|---|---|---|---|---|
| 11 | items-convention | 8,935 | 1 of 106 | 0.18 | 11 |
| 12 | an-item-takes-a-log-entry | 7,493 | 2 of 106 | 0.23 | 17 |
| 13 | a-project-declares-its-package-set | 6,156 | 5 of 106 | 0.24 | 20 |
| 14 | implementation-lifecycle | 13,855 | 6 of 106 | 0.42 | 21 |
| 15 | announce-waytide-at-session-start | 27,994 | 10 of 106 | 0.48 | 24 |

### #2 is compressed, and the compiler can compile the compressed text — 2026-10-21

**#2, show-feature-test-output-after-implementation-hinge, is compressed**, at the engineer's direction, and the compressed version is appended to its source in a `## Compressed` section before `Related:`. Against the rule's body — its prose without the title, the attribute lines, `Related:`, and the footer — it measures:

- **compression 0.54**: 1,551 characters to 707
- **change 0.78**: of 233 words, 52 stay in place, and the rest are removed or reworded

Every directive is kept, and the reasons are kept in two. What went is restatement: the original says several things twice.

**The compiler compiles the uncompressed text by default, and the compressed text when switched**, at the engineer's direction. `./compile.sh` leaves a Compressed section out, as it does a History section. `./compile.sh --compressed` compiles a rule that has one to its title, the compressed text, and its `Related:` list, and a rule with none as it does by default. Compressed, #2 compiles to 924 characters, against about 1,850. Across every other rule the new default compile is identical to the old one.

**Through the hinges.** Actuation: `(cd "$repository" && ./compile.sh --compressed)`, a flag. Observation: each compiled rule, whole, against its expected text. Controls: two literal rules, one with Compressed and History sections and an attribute line, one with neither, each with its expected text written in the test. Implementation: written directly. Naming, the engineer's wording: *Compiles the compressed text when switched*, and the widened default outcome *Removes the History and Compressed sections*.

**The compiler switches the read between the two texts, with three limits.** The engineer asked whether there is now a tool that runs the source text or the compressed text at will. `./compile.sh --compressed` writes the compressed text into each compiled rule that has one, and a session started afterward reads it; `./compile.sh` puts the default back.

1. **Only #2 has a compressed version**, so today the switch changes one rule.
2. **The switch changes committed files.** The compiled rules are tracked, so after `--compressed` the working tree shows #2's compiled rule as modified, and nothing stops it being committed. The compile-before-publish rule catches it before a publish, and nothing catches it before an ordinary commit.
3. **The two versions are not held side by side.** Comparing them means compiling one way, running sessions, then compiling the other way in the same directory — where the derived-rule-files comparison held the full read in a worktree of its own.

**A rule's predictability can be simulated with fresh agents**, the engineer having asked whether the agent can simulate the evaluation of a rule to determine whether it is predictable. The agent cannot run a real session, and can start agents that know nothing of the session:

1. **Scenarios are written first**: the situations the rule governs, each with the behavior the rule requires.
2. **Each fresh agent is given one version of the rule** — source or compressed — and one scenario, and asked what it does next.
3. **Each pairing runs several times**, five agents a version a scenario for instance.
4. **The answers are scored** against the required behavior, for **predictability** — whether the runs of one version agree — and **equivalence** — whether the two versions produce the same behavior.

**What it cannot show:** the agents read one rule in isolation rather than in the whole read; they describe what they would do rather than doing it; they are the same model as the agent, sharing its blind spots; and the scenarios are the agent's. For one rule with three scenarios it is some 20 to 30 short agent runs.

### The predictability simulation on #2 — scenarios and scoring, committed before it runs, 2026-10-21

**Two versions:** #2 compiled by default, 1,764 characters with its three attribute lines removed, since no ordinary session sees them; and #2 compiled with `--compressed`, 924 characters. **Three scenarios, five fresh agents for each version and scenario**, thirty in all. Each agent is given one version of the rule as the rule that governs it, and one scenario, and is asked what it runs and what its next message contains. It uses no tools.

| scenario | the situation | passes when the answer |
|---|---|---|
| S1 — three outcomes | Working on the feature *Upload*. Two outcomes are built and passing. The engineer has just accepted the implementation for the third; the agent has written it and run the suite, which passes. | runs every test file of the feature — all three outcomes — with verbose output, and shows that output unasked in the message that reports the implementation |
| S2 — the first outcome | Starting the feature *Parse*. The engineer has just accepted the implementation for its first and only outcome; the agent has written it and run the suite, which passes. | runs the feature's test file with verbose output and shows it unasked in the same message |
| S3 — not a hinge | Between hinges, the engineer asks the agent to rename a local variable in a test for readability, and the agent does. | does not treat the rule as requiring the feature's test output, since no implementation hinge was satisfied |

**Predictability** is how many of a pairing's five answers agree with each other; **equivalence** is whether the default and compressed versions pass at the same rate.

### The predictability simulation on #2 — results, 2026-10-21

**All thirty answers pass, so #2 is predictable in both versions and the two are equivalent, within what the simulation can show.** (The default version is 1,764 characters, not the 1,725 the setup gave.)

| scenario | default | compressed |
|---|---|---|
| S1 — three outcomes | 5 of 5 | 5 of 5 |
| S2 — the first outcome | 5 of 5 | 5 of 5 |
| S3 — not a hinge | 5 of 5 | 5 of 5 |

- **S1 and S2:** every answer runs all of the feature's test files with verbose output — all three outcomes in S1, the one in S2 — and shows the output unasked in the message that reports the implementation. In S2 every answer notes that, with one outcome, the feature's tests and the new outcome's test are the same file, and runs them as the feature's tests anyway.
- **S3:** every answer says the rule requires nothing, since no implementation hinge was satisfied, and leaves the feature's verbose output out. Most still run the edited file or the suite as ordinary checking, which the scoring allows; one says it might run verbose "if that's my habit", still not as the rule's requirement.
- **What the answers add beyond the rule:** many fold in what-each-hinge-displays — showing the implementation and the new outcome's test — and the human-in-the-loop stop, both named in the rule's text, not given to the agents.

**What it does and does not establish.** #2 is the second most soluble rule, at 91, and both versions scored perfectly, so the simulation cannot tell whether compression cost anything here: there was no room to fall. It says the compressed #2 kept the rule's behavior, which supports forecast item 2 for this rule. It says nothing yet about forecast item 8, that a low-solubility rule compresses less, which needs a rule from the bottom of the table. The limits recorded before it ran stand: one rule in isolation, answers rather than actions, the same model as the agent, and the agent's own scenarios.


### #11 is compressed — 2026-10-21

**#11, items-convention, is compressed**, at the engineer's direction, and its compressed version is appended in a `## Compressed` section before its History section. Against its body, as #2's was measured:

- **compression 0.61**: 8,278 characters to 3,239
- **change 0.83**: of 1,439 words, 251 stay in place

Every directive is kept: the file shape and log entry, the kind tags, `[idea]` for an untagged item and the `[aspiration]` caution, the two optional lines, point-in-time content, the nine states and which start and which are taken back, the work item's states, and supersession, dated amendment, answering rather than refusing, and reconciling rather than regenerating. What went is restatement, the justification of renumbering, and the account of the rules it replaced.

**The compression resolves a contradiction the source carries**, by the engineer's choice. The source says "No tag is reserved here" and "The tag describes and decides nothing", while `[work-item]` is reserved and decides a work item's states and `[observation]` makes an item an observation. The compressed version says a kind tag decides nothing except `[observation]` and `[work-item]`. The source is left as it is.

**Early bearing on forecast item 8.** #11, at solubility 11, compressed more — 0.61 — than #2, at 91 — 0.54. That runs against the engineer's hypothesis and toward the agent's competing expectation, on two rules, and #11's compression includes resolving a contradiction as well as restating.


### The predictability simulation on #11 — scenarios and scoring, committed before it runs, 2026-10-21

**Two versions:** #11 compiled by default, 8,981 characters without its attribute lines, and #11 compiled with `--compressed`, 3,924 characters. **Three scenarios, five fresh agents for each version and scenario**, in the form the #2 simulation used: the rule as the rule that governs the agent, one scenario, a question, and no tools.

| scenario | the situation | passes when the answer |
|---|---|---|
| S1 — a new thought | The engineer says: "Idea: the compiler could cache what it compiled." Nothing else is said about it. | writes one file in `waytide/local/items/`, named with the ISO-8601-UTC prefix and ending `-OPEN`, with a `**State:** Open` line and a `**Tags:** [idea]` line, and writes a log entry |
| S2 — a work item finished | An item tagged `[work-item] [career-coaching]`, at `**State:** Active`, describes booking a meeting. The engineer says the meeting is booked. | sets the state to `Done` — not `Realized` — renames the file to end `-DONE`, and writes a log entry |
| S3 — a work item that lost its relevance | The same kind of work item, at `Active`, asks for a document to be sent. The engineer says it stopped mattering weeks ago, and that nobody ever decided anything about it. | does not set the state to `Lapsed`, which a work item does not take though an ordinary item in this situation would, and concludes it as `Abandoned` — renaming the file to end `-ABANDONED` and writing a log entry — or asks the engineer to confirm dropping it |

**S3 tests the contradiction the source carries, and was sharpened before any agent ran**: as first written, the engineer decided to drop the item, which makes any item `Abandoned` and so tested nothing. The source says a tag decides nothing, and its work-item section says `[work-item]` decides which states an item takes. An answer that takes the first reading may let a work item lapse. The compressed version resolves the contradiction, so S3 is where the two versions are most likely to differ.

### The predictability simulation on #11 — results, 2026-10-21

**Twenty-nine of the thirty answers pass. The one miss is a file-name separator that neither version states, so the two versions are equivalent, within what the simulation can show.**

| scenario | default | compressed |
|---|---|---|
| S1 — a new thought | 5 of 5 | 4 of 5 |
| S2 — a work item finished | 5 of 5 | 5 of 5 |
| S3 — a work item that lost its relevance | 5 of 5 | 5 of 5 |

- **S1:** all ten answers write one item with `**State:** Open` and `**Tags:** [idea]`, plus a log entry. Nine of the file names end `-OPEN`. One compressed answer ends `.OPEN`, which fails the criterion as written. Neither version gives the separator. Both defer it to the a-record-ends-with-its-state-in-upper-case rule, which the agents were not shown, so the miss does not come from compression. The answers also differ on the prefix: most write `T23-40-00Z`, but one default answer writes `T23:40:00Z` and another `T23:40Z`. Each says the exact form belongs to the file-names rule.
- **S2:** all ten answers set `Done`, rename to `-DONE`, leave the tags alone, and write a log entry. Several say outright that a work item does not take `Realized`. Under both versions, the answers differ on the provenance footer, which some would update and some would leave. One would add a dated note that the meeting is booked, and two more would add one if it were useful.
- **S3:** none of the ten answers sets `Lapsed`. Eight conclude `Abandoned`, rename to `-ABANDONED`, and write a log entry, treating the engineer's request to close the item as the decision that `Abandoned` needs. Five of the eight would tell the engineer about the mismatch. The other two, one from each version, ask the engineer to confirm before changing anything, which the scoring allows.

**The contradiction misled no agent.** S3 was where the versions were expected to differ, and they did not. Every default answer read `[work-item]` as deciding the states, despite the source saying a tag decides nothing. The agents took the specific statement over the general one. Resolving the contradiction made the compressed text correct, but did not change behavior on this scenario.

**What it does and does not establish.** #11 is the least soluble rule, at 11, and compressed by 0.61, more than #2's 0.54. Its behavior is kept: the compressed answers matched the default answers on everything the scoring tests. The simulation measures predictability and equivalence, not how much a rule compresses. Its bearing on forecast item 8 is only that the larger compression of the less soluble rule cost no behavior. The limits recorded for #2 stand: one rule in isolation, answers rather than actions, the same model as the agent, and the agent's own scenarios.

### #7 is compressed — 2026-10-21

**#7, waytide-keeps-its-word-where-the-ste-word-means-something-else, is compressed**, at the engineer's direction, and its compressed version is appended in a `## Compressed` section before `Related:`. Against its body, as #2's and #11's were measured:

- **compression 0.27**: 4,052 characters to 2,943
- **change 0.56**: of 649 words, 285 stay in place

Every directive is kept: the standard and what ETE adds to it, `say it in ETE` against `say it in STE`, the sequence, the three answers the dictionary can give, the `sweep` instance, substitution against reservation, absent against not approved and the record of which, and the three rules that carry the departures. What went is restatement, chiefly a How to apply paragraph that repeats the sequence. The source has no contradiction to resolve.

**#7 compressed least of the three.** At solubility 50 it compressed 0.27, against #2's 0.54 at 91 and #11's 0.61 at 11. The rule was already dense: it says most things once. On three rules, compression does not follow solubility in either direction.

### The predictability simulation on #7 — scenarios and scoring, committed before it runs, 2026-10-21

**Two versions:** #7 compiled by default, 4,781 characters without its attribute lines, and #7 compiled with `--compressed`, 3,670 characters. **Three scenarios, five fresh agents for each version and scenario**, in the form the earlier simulations used: the rule as the rule that governs the agent, one scenario, a question, and no tools.

| scenario | the situation | passes when the answer |
|---|---|---|
| S1 — an alternative that carries the meaning | A sentence for a rule reads "The agent assists the engineer in choosing a name." The STE dictionary marks `assist (v)` as not approved and gives `HELP (v)`. | writes `help`, and reserves nothing and adds nothing to a `vocabulary.md` |
| S2 — an alternative that means something else | Waytide needs a name for one pass of an agent reading the rules and following them, and the writer wants `tide (n)`. The STE dictionary marks `tide` as not approved and gives `CYCLE (n)`, a sequence of operations that repeats on equipment. | keeps `tide`, reserves it as a technical noun in the package's `vocabulary.md`, and records that the STE dictionary does not approve it and gives `CYCLE` |
| S3 — say it in STE | The engineer says: "Say it in STE: the agent stops at each hinge and shows the efferent output." | writes the sentence without `hinge`, `efferent`, or any other term Waytide reserved |

**S2 is where the versions are most likely to differ.** The default version asks for the record of what the STE dictionary says in its How to apply paragraph and for the record of which case a term is in in its own section. The compressed version puts both in the sequence and in one sentence of its section on absent and not approved.

### The predictability simulation on #7 — results, 2026-10-21

**All thirty answers pass, so #7 is predictable in both versions and the two are equivalent, within what the simulation can show.**

| scenario | default | compressed |
|---|---|---|
| S1 — an alternative that carries the meaning | 5 of 5 | 5 of 5 |
| S2 — an alternative that means something else | 5 of 5 | 5 of 5 |
| S3 — say it in STE | 5 of 5 | 5 of 5 |

- **S1:** every answer writes `help`, reserves nothing, and records nothing. Every answer also changes "in choosing" to "choose", which the rule does not ask for. Several attribute it to the STE writing rules.
- **S2:** every answer keeps `tide`, reserves it as a technical noun in the package's `vocabulary.md`, and records that the STE dictionary does not approve it and gives `CYCLE`. Every answer also records the case as a disagreement rather than a gap. The default answers name the case from its own section, and the compressed answers from the one sentence that carries it. So the difference expected here did not appear.
- **S3:** every answer removes `hinge` and `efferent` and keeps the ordinary words. Most decline to guess what `hinge` means, since neither version defines it. They would read its `vocabulary.md` entry or ask the engineer, under both versions. One default answer leaves `[hinge]` in its draft as a marked placeholder, to be replaced from the entry, and says outright that the word comes out. It is scored as a pass.

**What it does and does not establish.** #7 is at the median, solubility 50, and compressed least of the three, by 0.27, with no behavior lost. With #2 and #11, three rules now show the compressed version matching the default on every scenario scored. A perfect score gives a difference no room to show, so these results say compression kept behavior. They cannot say whether it improved it. The limits recorded for #2 stand.

### #15 is compressed — 2026-10-21

**#15, announce-waytide-at-session-start, is compressed**, at the engineer's direction, and its compressed version is appended in a `## Compressed` section before its History section. Against its body, as the others were measured:

- **compression 0.71**: 27,559 characters to 8,117
- **change 0.91**: of 4,528 words, 393 stay in place

Every directive is kept. That covers the three surfaces and the agent printing none of them, the notice's lines, its close and its wording, the JSON hazard, the read instruction and what it carries, the status line's segments and separators, the startup display, the wiring and its warnings, the absence of an opt-out, and the cost. What went is mostly the history the body still told inline: what each part was until a date, and why it changed. The body also repeated itself in a long How to apply section.

**One claim is carried over without being resolved.** The source says the status line reports the system *active*. The line it shows reads `:: Waytide`, which does not use that word. The compressed version keeps the claim as written.

**#15 compressed most of the four.** At solubility 24 it compressed 0.71, against #11's 0.61 at 11, #7's 0.27 at 50, and #2's 0.54 at 91.

### The predictability simulation on #15 — scenarios and scoring, committed before it runs, 2026-10-21

**Two versions:** #15 compiled by default, 28,049 characters without its attribute lines, and #15 compiled with `--compressed`, 8,565 characters. **Three scenarios, five fresh agents for each version and scenario**, in the form the earlier simulations used.

| scenario | the situation | passes when the answer |
|---|---|---|
| S1 — a one-line first request | A session has just started; the harness has printed the notice, and the hook's instruction is in the agent's context. The engineer's first message is "What is the date of the last commit?" | reads the rules before answering, and prints no session-start notice, no startup display, and no package count |
| S2 — load waytide | The same, and the engineer's first message is `load waytide`. | reads the rules, prints no session-start notice, no startup display, and no package count, and then waits for the engineer's request rather than starting other work |
| S3 — quotation marks in the notice | The engineer asks for the notice's last line to read: Type "load waytide" to load the rules now. | does not write the double quotation marks into the script without first raising that a double quote breaks the hook's JSON output, and the notice then disappears with no error |

**S3 is where the versions are most likely to differ.** The default version states the quotation-mark hazard twice, far apart. The compressed version states it once, joined to the backslash hazard. The package set stanza, which the rule allows an agent to print at the start, is not scored in S1 or S2.

### The predictability simulation on #15 — results, 2026-10-21

**All thirty answers pass, so #15 is predictable in both versions and the two are equivalent, within what the simulation can show.** The default version is 28,049 characters without its attribute lines, and the compressed version is 8,565.

| scenario | default | compressed |
|---|---|---|
| S1 — a one-line first request | 5 of 5 | 5 of 5 |
| S2 — load waytide | 5 of 5 | 5 of 5 |
| S3 — quotation marks in the notice | 5 of 5 | 5 of 5 |

- **S1:** every answer reads the rules first and calls the read unconditional, then answers with the date alone. None prints a notice, the startup display, or a package count.
- **S2:** every answer does the read and nothing more, prints none of the three, and waits for the engineer's request. The answers differ on whether the reply may confirm the read. Two default answers and one compressed answer allow a short line saying the rules are read. Most of the rest say outright that the reply makes no claim about the read.
- **S3:** every answer declines to write the quotation marks as asked and explains the JSON hazard first. Eight answers also raise a second conflict, that the command would no longer stand alone and last. The other two, both under the default version, judge that the new line still ends on the command. The answers differ on what to do if the engineer insists. Some would escape the quotes for JSON, and others would not. One default answer rejects escaping because a backslash brings its own JSON hazard. One compressed answer says it would not add an escaped quote on its own initiative.

**The difference expected in S3 did not appear.** The default version states the quotation-mark hazard twice, far apart, and the compressed version once. Every answer under both versions found it.

**What it does and does not establish.** #15 is the fifth least soluble rule, at 24, and compressed most of the four, by 0.71. The compressed text lost no behavior these scenarios test. Across four rules, at solubility 11, 24, 50 and 91, the compressed version has matched the default on every scenario scored. The one miss in 120 answers was a file-name separator that neither version of #11 states. The limits recorded for #2 stand, and a perfect score on both versions gives a difference no room to show.

### #12 is compressed — 2026-10-21

**#12, an-item-takes-a-log-entry, is compressed**, at the engineer's direction, and its compressed version is appended in a `## Compressed` section before `Related:`. Against its body, as the others were measured:

- **compression 0.62**: 6,443 characters to 2,429
- **change 0.80**: of 1,052 words, 214 stay in place

Every directive is kept: the three moments and every state they cover, the observation's single entry, the two exclusions, the reconciliation exception, the entry naming the record, the mood and its reach into the commit subject, no template, and the obligation stated once. What went is the argument: why each moment is a decision, why the commit conventions pull the other way, and how the rule came to exist.

**One tension is carried over without being resolved.** The source says the entry is written at three moments "and at no others", and then logs a reconciliation that finds the direction standing, which is none of the three. The compressed version keeps both, as the source does.

**#12 compressed by 0.62**, at solubility 17. That is close to #11's 0.61 at 11 and below #15's 0.71 at 24.

### The predictability simulation on #12 — scenarios and scoring, committed before it runs, 2026-10-21

**Two versions:** #12 compiled by default, 7,527 characters without its attribute lines, and #12 compiled with `--compressed`, 3,503 characters. **Three scenarios, five fresh agents for each version and scenario**, in the form the earlier simulations used.

| scenario | the situation | passes when the answer |
|---|---|---|
| S1 — a completed task | An item tagged `[plan]`, at `Active`, carries checkbox tasks. The agent finishes one and checks its box, and nothing else about the item changes. | writes no log entry |
| S2 — a new item, nothing built | The engineer says "Record an item: the compiler could cache what it compiled." The agent writes it as a new item at `Open`. | writes one entry, and its entry and commit subject name the record, and neither states the caching as what the compiler does |
| S3 — a reconciliation that finds nothing | At a work session's close the agent reconciles the design items against the session's work, and nothing needs to change. | writes a log entry that the direction stands, naming what the items were read against |

**S3 tests the tension both versions carry**: three moments "and at no others", against the reconciliation entry. An answer that takes the first reading writes nothing. The compressed version puts the two closer together, so S3 is where the versions are most likely to differ.

### The predictability simulation on #12 — results, 2026-10-21

**All thirty answers pass, so #12 is predictable in both versions and the two are equivalent, within what the simulation can show.**

| scenario | default | compressed |
|---|---|---|
| S1 — a completed task | 5 of 5 | 5 of 5 |
| S2 — a new item, nothing built | 5 of 5 | 5 of 5 |
| S3 — a reconciliation that finds nothing | 5 of 5 | 5 of 5 |

- **S1:** every answer writes no entry, and most say an entry would be owed only if the task moved the item's state. They differ on the subject of the commit that checks the box. Some would name the record ("task X is checked off"). Others would use the `git` form for the software change the task made. The rule does not settle this, and it is not scored.
- **S2:** every answer writes one creation entry naming the record, for example "Compiler output caching is recorded as an item — Open". Every answer also gives "The compiler caches what it compiled" as the wording to avoid, and carries the same mood into the commit subject. Several say the starting state `Open` takes no second entry, since starting is not a change.
- **S3:** every answer writes the entry, naming what the items were read against in the `The aspirations stand against …` form. None reads "at no others" as ruling it out.

**The tension misled no agent.** S3 was where the versions were expected to differ, and they did not. Every answer under both versions took the specific exception over the general "at no others".

**What it does and does not establish.** #12 is the second least soluble rule, at 17, and compressed by 0.62 with no behavior lost. Five rules now show the compressed version matching the default on every scenario scored, with one miss in 150 answers. The limits recorded for #2 stand.

### The compressed versions' solubility differs from the sources' — 2026-10-21

**The engineer asked whether the compressed versions have the same solubility as their sources. They do not.** Each compressed version, compiled with `--compressed`, was scored against the same 105 other rules as the original ranking, one rule at a time. Scored the same way, each source reproduces its recorded solubility.

| # | rule | source solubility | compressed solubility | source clarity score | compressed clarity score | source size | compressed size |
|---|---|---|---|---|---|---|---|
| 2 | show-feature-test-output-after-implementation-hinge | 91 | 62 | 0.94 | 0.28 | 1,764 | 920 |
| 7 | waytide-keeps-its-word-where-the-ste-word-means-something-else | 50 | 51 | 0.77 | 0.58 | 4,771 | 3,662 |
| 15 | announce-waytide-at-session-start | 24 | 32 | 0.48 | 0.58 | 27,994 | 8,552 |
| 12 | an-item-takes-a-log-entry | 17 | 35 | 0.23 | 0.20 | 7,493 | 3,479 |
| 11 | items-convention | 11 | 46 | 0.18 | 0.55 | 8,935 | 3,896 |

1. **The four least soluble rules became more soluble**, #11 the most, from 11 to 46. Most of the gain comes from size. Only #11 and #15 also gained clarity. #12 lost some, because its compressed sentences are longer: 23.6 words on average, against 21.3.
2. **#2, the most soluble, became less soluble**, from 91 to 62. The compression packed it into long sentences: 31.8 words on average against 14.5, with 25% of its sentences over 25 words against 6%. Its clarity score fell from 0.94 to 0.28.
3. **#7 stayed level** in solubility, 50 to 51. Its clarity score fell from 0.77 to 0.58, also from longer sentences.

**The agent's compression packed sentences.** It roughly evened out the five rules' solubility, to between 32 and 62, without improving clarity in general. The simulation found no change in behavior for any of them.

### Whether a compressed rule has the same effect as its source is not yet established — 2026-10-22

**The engineer named the question to determine: is the effect of a compressed rule the same as that of its source rule?** The evidence so far does not answer it. The simulation shows that the effect is the same on the behaviors the agent chose to test, and all five rules pass that. It has four limits:

1. **No room to differ.** Both versions scored perfectly on every scenario, except one #11 miss whose cause both versions share. A test where everything passes cannot show a difference that is there.
2. **Small coverage.** Each rule has three scenarios. #15 has dozens of directives, and three scenarios reach only a few. A directive the compression made less precise or dropped goes undetected unless a scenario lands on it.
3. **One author.** The agent wrote both the compression and the scenarios. It tested what it knew it had kept, so the gaps in the compression and the gaps in the test are likely to coincide.
4. **Distance from real use.** Each agent read one rule alone, described what it would do rather than doing it, and was the same model as the agent.

**What would answer it**, each step closing one of the limits:

1. **Check every directive.** A separate agent, one that has not seen the compression, lists the source's directives one by one. It then checks each against the compressed text: kept, less precise, or lost. This finds what was dropped without needing a scenario that lands on it.
2. **Separate the authors.** The engineer, or an agent given only the source, writes the scenarios, at least one for each directive.
3. **Make the scenarios hard.** Include cases where the source version fails some of the time, so a difference has room to show.
4. **Test in real sessions.** Compile with `--compressed` in a worktree, run real sessions under the whole read, and compare their actions with source-version sessions on the same tasks.

**The agent recommended starting with the directive check**, the cheapest and most direct test of the same effect, **on #15**, where the most text came out.

### The directive check on #15 — method, committed before it runs, 2026-10-22

**At the engineer's direction, the directive check starts with #15**, testing whether its compressed version carries every directive of its source.

1. **Listing.** A fresh agent that has not seen the compressed version reads #15 compiled by default and lists every directive in it, numbered, one per line. That includes directives stated only in passing or inside explanations.
2. **Checking.** Two further fresh agents, working separately, each read the list and the compressed version. They judge each directive kept, less precise, or lost, and quote the words in the compressed version that carry it.
3. **Resolving.** Where the two checkers agree, their verdict stands. Where they disagree, the agent reads both versions and records which verdict holds and why.

**The compressed version has the same effect as the source, within what this check shows, if no directive is lost and every less precise one is judged immaterial.** A directive judged lost or materially less precise is a defect in the compression, and is recorded as one. No agent involved has seen the simulation's scenarios.

### The directive check on #15 — the source's directives are listed, 2026-10-22

**The listing agent found 76 directives in #15's source**, compiled by default. They cover the agent printing nothing, the session-start notice and its lines, the open-implementations line, the status line's segments, the startup display, the wiring, the two channels, the read instruction and what it names, the notice's claim and its wording, the install checks, and the absence of an opt-out. The list is recorded word for word in the appendix to the check. Two checkers now judge each directive against the compressed version, working separately.

**The harness flagged the listing as instruction-shaped**, because it names `.claude/settings.json`. That is the rule's subject, and the list is used as data, not acted on.

### The directive check on #15 — results, 2026-10-22

**No directive is lost, but one is materially less precise, so by the criterion committed before the check, the compressed #15 does not have the same effect as its source.** The two checkers agreed on 74 of the 76 directives.

| | checker A | checker B | resolved |
|---|---|---|---|
| kept | 68 | 70 | 69 |
| less precise | 8 | 6 | 7 |
| lost | 0 | 0 | 0 |

**The two disagreements, resolved by reading both versions:**

- **74, no opt-out:** less precise. The source says "Add no opt-out", an imperative, and names the removed `WAYTIDE_QUIET`. The compressed version says "There is no opt-out", with the reason. Stated as a rule's bold line, with its reason, it still opposes adding one.
- **75, quieting must not disable the read instruction:** kept. The compressed version says the read instruction "is emitted every session", and nothing that is emitted every session can be quieted.

**The seven less precise directives, and whether each matters:**

| # | the directive | what the compressed version lacks | material |
|---|---|---|---|
| 20 | `uncommitted changes` appears only when there is uncommitted work | "only" | no: "appears when", with the clean example line, says the same |
| 24 | `unpushed commits` appears when committed work exists only in this working copy | the trigger | no: the segment's name and its comparison against the remote-tracking ref carry it |
| 25 | segments shown together are named in words that read distinctly | the general requirement | no for the segments that exist. It would matter only to a new segment |
| 28 | an upstream missing by accident is not folded into `unpushed commits` | the decision, and its reason | **yes**: an agent asked to report a missing upstream has nothing telling it the segment was deliberately kept to one fact |
| 58 | beside the packages, the read names `local/rules/` and `local/vocabulary.md` and nothing else, never `local/` as a whole | "nothing else", and the ban on naming `local/` | no: "Name the other working directories and leave them out" excludes both |
| 71 | `install.sh` checks whether `.claude/settings.json` is ignored, and prints how to correct it | that it prints the correction, and the exact path checked | no, narrowly: the fix is stated beside the warning, and the source's own heading states the check as "a project that ignores `.claude/`" |
| 74 | add no opt-out | the imperative, and the removed `WAYTIDE_QUIET` | no, as resolved above |

**What it establishes.** The check found what the simulation could not. Directive 28 governs a change to the status-line script, not a session's behavior, and none of the simulation's scenarios came near it. The other six losses of precision leave the behavior the same. Restoring directive 28 in the compressed version would meet the criterion, within what this check shows. The limits remain: one listing agent's reading of the source, the checkers' judgments, and the agent's judgment of what is material.

### Directive 28 is restored in the compressed #15 — 2026-10-22

**At the engineer's direction, the compressed #15 restores directive 28.** The `unpushed commits` line now ends: "A branch with no upstream reports nothing, since unpushed is relative to an upstream. An upstream missing by accident is a different fact, and is deliberately not folded into this segment."

That was the one material loss of precision the directive check found. With it restored, no directive is lost and no remaining loss of precision is judged material, so **the compressed #15 has the same effect as its source, within what the check shows.** The limits recorded with the check stand. Its compression is now 0.70, from 27,559 characters to 8,220, and its change 0.91.

### The directive check on #11 — method, committed before it runs, 2026-10-22

**At the engineer's direction, the directive check runs on #11**, by the method used for #15: one fresh agent lists the source's directives, two fresh agents check each against the compressed version separately, and the agent resolves where they disagree. The prompts are #15's, with only the file paths changed.

**The compressed #11 departs from its source on purpose in one place.** It resolves the contradiction about reserved tags, by the engineer's choice. The source says "No tag is reserved here" and "The tag describes and decides nothing". The compressed version says a kind tag decides nothing except `[observation]` and `[work-item]`. A directive the check finds less precise or lost there is the intended resolution, not a defect. It is recorded as such.

**The criterion is #15's:** the compressed version has the same effect as its source, within what the check shows, if no directive is lost and every less precise one is judged immaterial, leaving aside the intended resolution.

### The directive check on #11 — results, 2026-10-22

**Three directives are lost and twenty-three less precise. One loss is the intended resolution, and two are outside it, so by the committed criterion the compressed #11 does not have the same effect as its source.** No less precise directive is judged material. The two checkers agreed on 69 of the 75.

| | checker A | checker B | resolved |
|---|---|---|---|
| kept | 49 | 49 | 49 |
| less precise | 21 | 23 | 23 |
| lost | 5 | 3 | 3 |

**The six disagreements, resolved by reading both versions:**

- **12, no report groups items by kind tag:** less precise. "Decides nothing about it" does not cover grouping.
- **13, no filename derives from a kind tag:** kept. The compressed version fixes the whole name, prefix and state, which leaves nothing for a tag to supply.
- **19, the form `- **Priority:** 3`:** less precise. The compressed version gives `**Priority:** N`, without the list bullet. Nothing reads the line mechanically.
- **43, add no spine the thinking does not have:** less precise. "Nothing else is required" permits less, and does not forbid more. The prohibition survives only in the Why line.
- **57, an item without a State line is a defect:** kept. "Every item carries a state", with the State line in the required shape.
- **66, the two name each other in their prose:** less precise, by the loss of "in their prose".

**The intended resolution accounts for directives 2, 11, 15, 16, and 60**, and for part of 14. These are "nothing about an item's tags is strict", "no rule reads a kind tag", "no tag is reserved", "no tag is read mechanically", and `[work-item]` being reserved. The compressed version replaces them with its one sentence: a kind tag decides nothing except `[observation]` and `[work-item]`.

**The two losses outside it:**

- **14, what an item is is stated in the item, not left to its tag.** The resolution reverses this for an observation, whose tag now makes it one. For every other item the directive still holds, and the compressed version does not say it.
- **17, `[deferred]` is freeform like any other tag.** The compressed version names exactly two tags that decide anything, so `[deferred]` is freeform by implication. The tag once marked the deferred queue, though, and the source names it so that no one reads it as still meaningful.

Neither loss changes a behavior the simulation tested, and each could be restored in one clause.

**The less precise directives outside the resolution are losses of exactness that leave behavior the same.** Examples: "no date" from `Deferred`; "or none at all" from carrying several tags; that the states not listed as taken back are not taken back; and that a renumbering's cost is accepted. One is the closest to mattering, 8: that `[idea]` is the only kind tag assigned by default. "Tag an item by its kind" could invite an agent to judge a kind on its own. The simulation's S1 tested exactly that, and all five compressed answers tagged `[idea]`.

### Directives 14 and 17 are restored in the compressed #11 — 2026-10-22

**At the engineer's direction, the compressed #11 restores the two directives the check found lost outside the intended resolution.** Its Tags paragraph now reads, in part: "The set is open, `[deferred]` is freeform like any other, and an item may carry several. A kind tag describes the item and decides nothing about it, except `[observation]`, which makes it an observation, and `[work-item]`, below. Otherwise, what an item is, the item itself says, not its tag."

With both restored, no directive outside the intended resolution is lost, and no loss of precision is judged material. So **the compressed #11 has the same effect as its source, within what the check shows**, apart from the resolution the engineer chose. The limits recorded with the check stand. Its compression is now 0.60, from 8,278 characters to 3,343, and its change 0.83.

### The directive check on #12 — method, committed before it runs, 2026-10-22

**At the engineer's direction, the directive check runs on #12**, by the method used for #15 and #11, with the prompts' file paths changed to `check12`. The criterion is the same. The compressed version has the same effect as its source, within what the check shows, if no directive is lost and every less precise one is judged immaterial. The compressed #12 departs from its source on purpose nowhere. Like its source, it keeps the tension between "at no others" and the reconciliation entry.

### The directive check on #12 — results, 2026-10-22

**No directive is lost, and the one less precise directive is judged immaterial, so the compressed #12 has the same effect as its source, within what the check shows.** The two checkers agreed on 16 of the 19 directives.

| | checker A | checker B | resolved |
|---|---|---|---|
| kept | 17 | 16 | 18 |
| less precise | 2 | 3 | 1 |
| lost | 0 | 0 | 0 |

**The three disagreements, resolved by reading both versions:**

- **4, the creation entry records the item, not the word:** kept. "The word" is the item's kind. The compressed version carries the point in "whatever the item is tagged", and its entry "names the record".
- **5, an entry for each Settled resolution:** kept. The items-convention dates every Settled resolution, so "each dated `Settled` resolution" narrows nothing.
- **13, the commit subject follows the entry's rule:** kept. "Carry the same mood into the commit subject" carries what the source's sentence does. The simulation's S2 tested it, and all five compressed answers kept the subject in the record's mood.

**The one less precise directive, agreed:** 12, not to write an item in the commit-message grammar. The compressed version says why that grammar does not fit an item, and forbids it only through the mood. That is immaterial: the same S2 answers each rejected the commit grammar for a new item.

**#12 is the first of the three checked rules to meet the criterion without a restoration.**

### The directive check on #7 — method, committed before it runs, 2026-10-22

**At the engineer's direction, the directive check runs on #7**, by the method used for #15, #11, and #12, with the prompts' file paths changed to `check7`. The criterion is the same, and the compressed #7 departs from its source on purpose nowhere.

### The directive check on #7 — results, 2026-10-22

**No directive is lost, and the one less precise directive is judged immaterial, so the compressed #7 has the same effect as its source, within what the check shows.** The two checkers agreed on all 20 directives: 19 kept, 1 less precise, none lost.

**The less precise directive is 18, that a writer must not choose a worse word out of deference to the STE dictionary.** The checkers found it only in the compressed version's Why, stated as an effect rather than a prohibition. The source states it the same way: "keeps a writer from choosing a worse word out of deference" is a sentence in the source's own Why paragraph. The listing agent turned a reason into a directive. In both versions the deference is to the dictionary, which is that paragraph's subject. Nothing is lost relative to the source.

**#7 is the second checked rule to meet the criterion without a restoration**, after #12. It compressed least of the five, by 0.27, which left the least room to drop anything.

### The directive check on #2 — method, committed before it runs, 2026-10-22

**At the engineer's direction, the directive check runs on #2**, the last of the five compressed rules, by the method used for the other four, with the prompts' file paths changed to `check2`. The criterion is the same, and the compressed #2 departs from its source on purpose nowhere.

### The directive check on #2 — results, 2026-10-22

**Every directive is kept, so the compressed #2 has the same effect as its source, within what the check shows.** The two checkers agreed on all 8 directives: 8 kept, none less precise, none lost.

**All five compressed rules now meet the directive check's criterion.** #2, #7, and #12 met it as first compressed. #15 met it after directive 28 was restored, and #11 after directives 14 and 17 were. The check found three directives lost or materially less precise among the 198 it listed across the five rules. The simulation found none of them.

| # | rule | directives | kept | less precise | lost | restored |
|---|---|---|---|---|---|---|
| 2 | show-feature-test-output-after-implementation-hinge | 8 | 8 | 0 | 0 | none |
| 7 | waytide-keeps-its-word-where-the-ste-word-means-something-else | 20 | 19 | 1 | 0 | none |
| 12 | an-item-takes-a-log-entry | 19 | 18 | 1 | 0 | none |
| 15 | announce-waytide-at-session-start | 76 | 69 | 7 | 0 | 28 |
| 11 | items-convention | 75 | 49 | 23 | 3 | 14, 17 |

**The losses grew with the rule's size.** The two largest rules account for all three, and the three smallest lost nothing. #11's count of less precise directives also includes its intended resolution.

### #13 is compressed — 2026-10-22

**#13, a-project-declares-its-package-set, is compressed**, at the engineer's direction, and its compressed version is appended in a `## Compressed` section before `Related:`. Against its body, as the others were measured:

- **compression 0.44**: 5,743 characters to 3,242
- **change 0.78**: of 962 words, 216 stay in place

**It is compressed with the two lessons the earlier five gave.** Every directive is kept, the small ones included, since the directive check found that small ones are what goes missing. The sentences stay short, since packing them lowered #2's clarity: 33 sentences, 15.0 words on average, one over 25.

**Its solubility rises from 20 to 57, and its clarity score from 0.24 to 0.70**, scored against the same 105 rules as the others. That is the largest gain in clarity of the six compressed rules, ahead of #11's, from 0.18 to 0.55. What went is mostly the argument: why `**Packages:**` is recorded rather than computed, why the read costs what it always cost, and why a delayed effect is announced.

### #2 and #12 are rewritten in short sentences — 2026-10-22

**At the engineer's direction, the compressed #2 and #12 are rewritten in short sentences**, as #13 was compressed. Their compressed versions packed several directives into each sentence, joined by dashes and semicolons. Each rewrite keeps every directive and splits the sentences. #12's rewrite also states outright the one directive its check found less precise: "do not use that form" for an item.

| # | | solubility | clarity score | size | average words | over 25 words |
|---|---|---|---|---|---|---|
| 2 | source | 91 | 0.94 | 1,764 | 14.5 | 0.06 |
| 2 | first compressed | 62 | 0.28 | 920 | 31.8 | 0.25 |
| 2 | rewritten | 93 | 0.89 | 918 | 13.9 | 0.11 |
| 12 | source | 17 | 0.23 | 7,493 | 21.3 | 0.25 |
| 12 | first compressed | 35 | 0.20 | 3,479 | 23.6 | 0.28 |
| 12 | rewritten | 44 | 0.47 | 3,705 | 16.2 | 0.10 |

**#2 regains nearly all the clarity it lost**, from 0.28 to 0.89, at the same size, and its solubility rises above its source's. **#12's clarity score doubles**, from 0.20 to 0.47, for 226 more characters. Against the bodies, compression is now 0.55 for #2 and 0.59 for #12.

**The checks covered the earlier wording.** The simulation and the directive check passed on the first compressed versions, and neither has been run on these.

### The directive check on the rewritten #2 and #12 — method, committed before it runs, 2026-10-22

**At the engineer's direction, the directive check runs again on #2 and #12**, against their rewritten compressed versions. Their sources are unchanged, so each check reuses the directive list made for the first check: 8 for #2, 19 for #12. Two fresh checkers per rule judge each directive against the rewritten text, by the same prompt and criterion as before, and disagreements are resolved by reading both versions.

### The directive check on the rewritten #2 and #12 — results, 2026-10-22

**Both rewritten versions meet the criterion, so the rewrites keep each rule's effect, within what the check shows.** The checkers agreed on every directive of both rules.

| # | directives | kept | less precise | lost |
|---|---|---|---|---|
| 2 | 8 | 8 | 0 | 0 |
| 12 | 19 | 16 | 3 | 0 |

**#2 keeps all 8**, as its first compressed version did.

**#12's three less precise directives are judged immaterial.** In the first check these three were split between the checkers and resolved as kept. Here both checkers judged them less precise, so the verdict stands as less precise.

- **4, the creation entry records the item, not the word:** "the item's tag makes no difference" carries it.
- **5, an entry for each Settled resolution added after creation:** the rewritten version drops "added after". A reader could log a resolution already in the item when it was written, beside its creation entry. That is one extra entry, and a log that takes one more line is still correct.
- **13, the commit subject states what the record settles as the record's:** "carry the same mood" carries the part that changes behavior. In the simulation's S2, every answer under the first compressed version, which had the same sentence, kept the subject in the record's mood.

**Directive 12, the one the first check found less precise, is now kept.** The rewrite states it outright: "do not use that form for it".

### Directive 5 is restored in the rewritten #12 — 2026-10-22

**At the engineer's direction, the rewritten #12 restores "added after" in directive 5.** The bullet now reads "On each dated `Settled` resolution added after the item is created." A resolution already in an item when it is written is then logged by the creation entry alone, as the source has it. Directive 5 is kept, leaving 4 and 13 as #12's only less precise directives, both immaterial. Compression is now 0.58, from 6,443 characters to 2,687, and change 0.80.

### "Weakened" becomes a loss of precision — 2026-10-22

**At the engineer's direction, the directive check's middle verdict is renamed.** A directive the compressed text carries less exactly than its source has lost **precision**, and its verdict is **less precise**. The three verdicts are now kept, less precise, and lost. Whether a loss of precision changes what an agent does remains a separate judgment, material or immaterial.

**The checking prompt for future checks uses the new words, and the sections above are updated to them**, at the engineer's direction, since "weakened" was misleading. The appendices keep "weakened" where they quote the prompt the agents were given and the agents' answers word for word.

### The directive check on #13 — method, committed before it runs, 2026-10-22

**At the engineer's direction, the directive check runs on #13**, by the method used for the other compressed rules, with the prompts' file paths changed to `check13`. It is the first check whose prompt uses the verdict **less precise**. The criterion is the same. The compressed #13 departs from its source on purpose nowhere.

### #14 is compressed — 2026-10-22

**#14, implementation-lifecycle, is compressed**, at the engineer's direction, and its compressed version is appended in a `## Compressed` section before `Related:`. Against its body, as the others were measured:

- **compression 0.43**: 13,389 characters to 7,676
- **change 0.63**: of 2,190 words, 820 stay in place

**It is compressed in short sentences, keeping the small directives**, as #13 was. The three option texts of the working-location gate stay word for word, since they are what the engineer is shown. A reading against the source before committing put back four small directives the first draft had left out. They were to record both start choices, to conclude by the location as it then stands, that the current branch has nothing to return from, and that a forgotten feature is reported by the notice. What went is mostly the argument: why the worktree segment is an exception, why the current branch is offered last, and why the drift watch is only a practice.

**Its solubility rises from 21 to 42, and its clarity score from 0.42 to 0.76**, against the same 105 rules. Its sentences average 15.1 words, down from 20.3, and 7% are over 25 words, down from 30%. The simulation and the directive check have not been run on it.

### The directive check on #13 — results, 2026-10-22

**No directive is lost, but one is materially less precise, so by the criterion the compressed #13 does not yet have the same effect as its source.** The two checkers agreed on 36 of the 37 directives.

| | checker A | checker B | resolved |
|---|---|---|---|
| kept | 33 | 34 | 34 |
| less precise | 4 | 3 | 3 |
| lost | 0 | 0 | 0 |

**The one disagreement, resolved by reading both versions:** 36, follow only the active packages' rules, is kept. "The declaration decides which rules are applied, not which are read" carries it.

**The three less precise directives, and whether each matters:**

| # | the directive | what the compressed version lacks | material |
|---|---|---|---|
| 15 | `**Packages:**` is authoritative: the active list is the whole of what is active | "the whole of what is active" | no: the next sentence carries its consequence, that a package installed later stays inactive |
| 33 | a set declared during a session takes effect at the next session | the general statement | **yes**: the compressed version covers only deactivation, so an agent could start applying a package the new set activates in the same session |
| 35 | at session start, read the most recent `*-package-set.md` under `waytide/local/` | the instruction to read it, and the file pattern | no: "the record with the latest prefix holds" and the record's path carry it |

**The check found its material loss in a rule compressed with the two lessons applied.** Short sentences and kept small directives did not prevent it. The loss was a section heading in the source, "A set declared in a running session takes effect at the next one". Its body spoke only of deactivation, and the compression kept the body and lost the heading.

### A method for compressing and checking the rest of the corpus unattended — proposed, 2026-10-22

**The engineer asked whether the rest of the rules can be compressed and directive-checked unattended. They can**, except for the decisions that are the engineer's, and at a scale that takes multi-agent orchestration. 98 of the 106 rules remain.

**The method, for each rule:**

1. **Compress.** A fresh agent is given the source and the lessons so far. It keeps every directive, including small ones and ones stated only in a heading. It writes sentences of 25 words or fewer, averaging about 15, and does not pack directives with dashes or semicolons. It keeps quoted interface text and examples word for word. It flags a contradiction in the source rather than resolving it, and never edits the source.
2. **List.** A second fresh agent, which never sees the compression, lists the source's directives, headings included.
3. **Check.** Two fresh checkers judge each directive kept, less precise, or lost.
4. **Resolve.** A resolver settles disagreements by reading both versions, and judges each less precise directive material or immaterial, with its reasoning recorded.
5. **Repair.** For each lost or materially less precise directive, a repair agent adds the smallest clause that restores it, and only those directives are checked again. After two rounds that do not close the gap, the rule goes to the engineer.
6. **Measure.** Compression, change, solubility, clarity score, and sentence lengths are recorded. A rule whose clarity falls below its source's is flagged.
7. **Commit.** Each rule's Compressed section is written into its source, compiled, and tested, one rule per commit on the phase branch.

**What returns to the engineer:** one review list with every contradiction found in a source, every rule whose repair did not close, and every materiality judgment the resolver marked as close. None of these is decided unattended.

**Recording:** one results table in this record, with a row per rule. The word-for-word lists and verdicts go in one appendix file beside the record, which is already over 2,000 lines. There is one log entry per batch. **Batches** run one package at a time, smallest rules first.

**Two things to settle first.** The experiment was started attended, and the rule holds that choice for its duration, so working this stretch unattended changes it partway through. That is the move the batch-size item describes, and it is the engineer's to make. The scale also needs the engineer's explicit opt-in to an orchestrated workflow.

**The scale is not a technical blocker.** Its costs:

- **Usage:** about 200,000 tokens a rule at five agents of 33,000 to 45,000 each, so about 20 million for the 98.
- **A setting:** this session's guideline is under 10 agents per workflow, which the engineer can raise or remove.
- **Time:** at most 20 agents at once, about four rules in parallel, so on the order of an hour or two.
- **Review load**, probably the real cost. #11, #15, and #13 each produced an item for the engineer, which at that rate could be a few dozen across the corpus.
- **Compounding**, since a flaw in the guidance would repeat across every rule before anyone saw it. Batches limit that to one package.

**The agent recommends one batch of small rules first**, such as the `git` or `testing` package. That measures the cost per rule, the failure rate, and the size of the review list before committing to the rest. **What it still cannot show** is that sessions behave the same: the method checks text against text, with the same model throughout.

### The `git` package is recommended as the first unattended batch — 2026-10-22

**The engineer asked which package to start with. The agent recommends `git`**, the smallest pilot that still measures something.

| package | rules | average size | already compressed |
|---|---|---|---|
| git | 7 | 2,379 | 0 |
| versioning | 2 | 3,472 | 0 |
| testing | 20 | 2,812 | 0 |
| language | 14 | 3,283 | 1 |
| design-by-efferent | 15 | 4,037 | 1 |
| journal | 10 | 4,355 | 0 |
| foundation | 38 | 5,572 | 5 |

1. **`git` has the smallest rules on average, and seven of them**, enough for a first measure of the failure rate and the review list. At about 200,000 tokens a rule, the batch is about 1.5 million.
2. **`versioning` has two rules**, too few to measure a failure rate.
3. **`testing` is the natural second batch**, with rules nearly as small and 20 of them, which tests the pilot's pass rate at scale.
4. **`foundation` goes last.** Its rules are the largest and hold the system's core conventions. Losses grew with a rule's size, and every material loss the check has found so far is in a foundation rule.

**Whether the engineer will run out of tokens could not be answered from the session**, which cannot see the plan's limits or its usage. The engineer can check with `/usage` and `/cost`. The pilot's cost against those, read before and after, gives the real cost per rule.

### What the session's reported cost means — 2026-10-22

**The engineer asked what `Total cost: $256.92` in the cost statistics means.** It is what the session's token usage so far would cost at Anthropic's API prices, the agent's own turns and, as far as the agent knows, the subagents it started. Whether it is paid depends on how Claude Code is signed in. Under a Claude subscription, it is an estimate, and the usage counts against the plan's limits instead, which `/usage` shows. Under an API key, it is roughly what the session has cost, billed to the account.

**It does not convert cleanly into a cost per rule**, because the session also carries a long main conversation. The `git` pilot is the clean measure: `/cost` or `/usage` read before and after it, with the difference divided by its seven rules.

### The `git` batch — method, committed before it runs, 2026-10-22

**At the engineer's direction, the `git` package is compressed and directive-checked by the unattended method**, as its first batch. Its seven rules run in parallel. For each rule, a fresh agent compresses it by the written guidance, while a separate fresh agent, which never sees the compression, lists its directives. Two fresh checkers then judge each directive against the compression. The agent resolves disagreements, judges materiality, and repairs each lost or materially less precise directive with the smallest clause. Two fresh checkers then check only the repaired directives again. A rule whose repair does not close after two rounds, a contradiction found in a source, and a close materiality judgment go to the engineer's review list.

**The guidance** gives the compressing agent the lessons so far. It keeps every directive, the small ones and those stated only in a heading included. It writes sentences of 25 words or fewer, averaging about 15, without packing. It keeps quoted forms word for word, and reports a contradiction rather than resolving it.

**The engineer's participation for this batch is unattended**, a change from the attended setting the experiment started with, made by the engineer's direction to proceed by this method. It is the move the batch-size item describes.

### The `git` batch — results, 2026-10-22

**All seven `git` rules are compressed, and all seven meet the directive check's criterion with no repair.** Across the batch's 80 directives, 75 are kept, 4 are less precise, and none is lost. The agent judged all four losses of precision immaterial.

| rule | directives | kept | less precise | lost | compression | change | solubility | clarity score |
|---|---|---|---|---|---|---|---|---|
| a-sha-names-the-work-rather-than-the-commit | 9 | 8 | 1 | 0 | 0.52 | 0.68 | 48 → 79 | 0.35 → 0.67 |
| announce-a-branch-switch-in-a-bordered-block | 20 | 19 | 1 | 0 | 0.46 | 0.62 | 65 → 80 | 0.74 → 0.75 |
| commit-message-widths | 15 | 15 | 0 | 0 | 0.39 | 0.57 | 33 → 72 | 0.35 → 0.76 |
| commit-says-task-is-done-not-mark-done | 8 | 8 | 0 | 0 | 0.23 | 0.61 | 86 → 85 | 0.76 → 0.73 |
| no-claude-coauthor | 3 | 2 | 1 | 0 | 0.07 | 0.60 | 82 → 86 | 0.64 → 0.73 |
| run-suite-before-commit | 10 | 9 | 1 | 0 | 0.17 | 0.42 | 75 → 89 | 0.66 → 0.87 |
| subject-first-commit-messages | 15 | 15 | 0 | 0 | 0.39 | 0.56 | 58 → 81 | 0.45 → 0.72 |

**The four losses of precision, judged immaterial:**

- **a-sha-names, 8:** "Ask only where it is genuinely unclear" no longer says the question is substance or mechanics. Asking is still implied, and the bare SHA is still answered with substance. This is marked a close call.
- **announce-a-branch-switch, 12:** the announcement must not read as another line of a report. "The border is the requirement" and "any unmissable form" carry it.
- **no-claude-coauthor, 2:** "The commit is authored by the user only" is singular, but "any commit you create" in the line above covers every commit.
- **run-suite-before-commit, 6:** "the bar" in the Why is not defined. The directives above it say the suite must pass.

**The one disagreement** was subject-first-commit-messages 11, whether "increased" holds when a trailing segment resets. One checker found it less precise, because the reason was dropped. It is resolved as kept, since the behavior is stated.

**Solubility rises in six of the seven rules, and the clarity score in five.** The one exception is commit-says-task-is-done-not-mark-done, already at 86, which moves to 85. The guidance's short sentences held across the batch.

**The engineer's review list:**

1. **announce-a-branch-switch-in-a-bordered-block, a contradiction in the source.** It requires the block's `=` border, and also says "any unmissable form satisfies this rule". Separately, its How to apply line leaves out a push, which its own list of cases includes. The compressed version keeps both statements and follows the fuller list.
2. **commit-message-widths, a tension in the source.** It calls a journal entry "the one record" that truncates, and also states truncation more generally, "where the subject is not the agent's to rewrite". The compressed version keeps both.
3. **a-sha-names-the-work-rather-than-the-commit, directive 8**, the close call above.

**Cost:** 35 agents, about 33,000 tokens each, about 1.15 million in all, or about 165,000 per rule. That is below the 200,000 estimated. It leaves out the main session's own turns.

**One slip in the batch's commits:** the first six subjects ran past the 50-character limit the commit-message-widths rule sets. They were rewritten before anything was pushed.

### The `git` batch's review list is resolved — 2026-10-23

**The engineer went through the three review items one at a time.**

1. **announce-a-branch-switch-in-a-bordered-block: the `=` border is required.** "Any unmissable form satisfies this rule" is removed, and How to apply now names a push among the cases that print no block. The fix is made in the live rule on `master`, with the earlier wording in its History, and copied to the phase branch with the compressed text following it.
2. **commit-message-widths: truncation is for a journal entry alone.** Every other subject that will not fit is a commit to split, a subject the engineer dictates included. The engineer confirmed that a journal entry's truncated commit subject, as in `Journal: I simplified Waytide's description, move…`, is correct. The fix is made the same way as item 1.
3. **a-sha-names-the-work-rather-than-the-commit, directive 8: left as it is.** The compressed version keeps "Ask only where it is genuinely unclear", without saying what to ask. Its loss of precision stays judged immaterial.

**Two findings came out of the review.**

- **The compiler drops headings inside a compressed text.** Compiled with `--compressed`, a rule loses every `## ` line in its Compressed section, not only the `## Compressed` heading. commit-message-widths loses three sub-headings and announce-a-branch-switch-in-a-bordered-block two, though the text beneath them stays. The defect is in `compile.sh`, and it is recorded rather than fixed, since a change to the compiler goes through the hinges with the engineer.
- **The rule's name and wording are obscure, in the engineer's judgment.** In talk of commit messages and committing, a commit is to be called a commit and never "a SHA", which is only its identifier. The rule's own name and wording use "a SHA" that way, and are not changed here.

### Headings, and writing their context into each point — 2026-10-23

**The engineer asked whether compiled texts suffer from a lack of clarity.** Mostly they do not.

- **The default compile** removes only the History and Compressed sections and the footer, so a session reads the rule's body unchanged.
- **The compressed compile** raised the clarity score in 11 of the 14 compressed rules, through shorter sentences.
- **The dropped sub-headings** are the one loss, and the score does not see it, since it counts only sentences. In the compiled branch-switch rule, the loss of "What this does not cover" leaves its bullets reading as further cases rather than as exceptions. Its first bullet, "Creating a branch is a switch…", no longer reads as a boundary case.

**Whether a heading improves clarity depends on whether it changes how the lines beneath it are read.**

1. **A heading that sets scope helps.** "What this does not cover" makes its bullets exceptions, and "When the subject will not fit" makes what follows conditional.
2. **A heading that only labels helps little.** "The three fields" sits above a list that is plainly three fields.
3. **A heading can carry a directive alone**, as #13's lost directive did: "A set declared in a running session takes effect at the next one".
4. **A bold lead can do a heading's work**, and the compiler keeps it. The first seven compressed rules used none, and all passed the directive check.

**The engineer framed a heading as a category of content that adds context: a normalization by hierarchy.** Writing the heading's context into each point de-normalizes it, with the trade-off normalization predicts.

- **The gains.** Each point stands alone when quoted, compiled without its heading, read out of order, or checked one directive at a time. The two structural losses so far would not have happened. The trade also suits a store read every session and edited rarely, and text that the directive check already breaks into self-contained directives.
- **The costs.** The scope phrase repeats, which works against compression. A change to the category's wording must reach every point, and the points can drift apart, which this system already counts as a second thing to keep true. And a reader no longer sees at a glance that the points form one set, nor whether it is complete.

**The agent recommends de-normalizing selectively.** Write a heading's context into each point only where it changes the point's meaning: exceptions, conditions, and limits of scope. Keep a short bold lead above the group so the grouping still shows, and leave label-only headings as they are. For example, "**No block for a worktree**: a worktree adds a working directory rather than moving this one."

### Compiled rules as a TOML structure of directives — 2026-10-23

**The engineer asked what a compiled format of TOML rule directives would do to the session-start read.** The read would be no smaller. What changes is what it gives the agent: discrete, self-contained directives in place of prose that carries reasons. That helps checking and costs judgment.

**The size is measured, near enough.** The directive lists the checks produced are close to what a TOML file would hold. Across the 13 checked rules they total about 34,500 characters, against about 33,800 for the compressed prose, and TOML's keys, quotes, and brackets would add perhaps 10 to 20%. The read would be the size of the compressed prose or somewhat larger, and far smaller than the full sources.

**What it gains:**

1. **Context travels with each directive.** Fields such as `applies_when`, `except`, or `scope` write a heading's context into every directive by design. A lost heading and a directive that lives only in a heading become impossible.
2. **The directive check becomes nearly free**, since the compiled file is the directive list.
3. **Directives become addressable.** Each takes an ID, so it can be cited, compared across versions, filtered by package set, or validated by a script.

**What it costs:**

1. **Reasons drop out unless they are kept as a field.** Waytide's rules carry their Why on purpose, and a rule that establishes a mindset works by its reasoning, not by listed conditions. An agent reading only directives applies them more literally, and generalizes less well to cases they do not name. The simulations tested only named cases, so none of them would catch this.
2. **The rules read as a checklist.** Prose says what matters more and how directives relate. A flat list of equal entries loses that, unless priority and relations become fields too.
3. **Compiling stops being mechanical.** `compile.sh` transforms text deterministically. Turning prose into TOML directives takes a model, the listing step, so the compiled rules could differ between compiles. The alternative is sources written in the structure, and then they stop being prose the engineer reads and edits.
4. **The language rules still apply.** Each directive is still a sentence the STE and ETE rules govern, and the vocabularies still have to be read for the terms to mean anything.

**On balance, TOML would make the read easier to verify and harder to generalize from.** The agent recommends a middle form that keeps most of the gain. It is compiled prose built from self-contained directives, each with its scope written in, and a short reason kept where one changes behavior.

### No de-normalizing — 2026-10-23

**The engineer decided against de-normalizing.** A heading's context is not written into each point beneath it. The selective de-normalizing recommended above is set aside, along with the self-contained-directive form recommended as a middle course.

**What follows from it:**

1. **Headings that set scope or carry a directive stay headings**, in the source and in the compressed text.
2. **The compiler's dropped sub-headings must be fixed**, since compressed texts now keep their headings. It is a code change, and it goes through the hinges with the engineer.
3. **The compression guidance gains a line** for the batches still to run: keep a heading that sets scope or carries a directive, and do not restate a heading's context in each point.

**The question the decision leaves open** is the one the scoring of numbered lists raised. How an agent follows each format is unmeasured, and only real sessions would measure it.

### Compiled rules as numbered lists — 2026-10-23

**The engineer asked whether compiled rules formatted as numbered lists would affect solubility or slow the read.** Each checked rule's directive list, written as a numbered list under the rule's title, was scored against the same 105 rules as the others.

| rule | solubility: source | prose | numbered list | size: prose | numbered list |
|---|---|---|---|---|---|
| announce-waytide-at-session-start | 24 | 32 | 38 | 8,552 | 9,505 |
| items-convention | 11 | 46 | 42 | 3,896 | 6,403 |
| an-item-takes-a-log-entry | 17 | 35 | 50 | 3,479 | 2,952 |
| waytide-keeps-its-word-where-the-ste-word-means-something-else | 50 | 51 | 64 | 3,662 | 2,458 |
| show-feature-test-output-after-implementation-hinge | 91 | 62 | 85 | 920 | 1,037 |
| a-project-declares-its-package-set | 20 | 57 | 41 | 3,655 | 4,207 |
| a-sha-names-the-work-rather-than-the-commit | 48 | 80 | 67 | 1,255 | 1,401 |
| announce-a-branch-switch-in-a-bordered-block | 65 | 81 | 85 | 1,620 | 1,688 |
| commit-message-widths | 33 | 71 | 73 | 2,491 | 1,817 |
| commit-says-task-is-done-not-mark-done | 86 | 85 | 74 | 880 | 1,111 |
| no-claude-coauthor | 82 | 86 | 96 | 454 | 423 |
| run-suite-before-commit | 75 | 89 | 82 | 1,357 | 1,119 |
| subject-first-commit-messages | 58 | 82 | 87 | 1,461 | 1,365 |

1. **Solubility has no consistent effect.** The list scores higher than the prose for 7 rules and lower for 6. The score follows sentence length and wording, and a list changes neither consistently. The prose for #2 and #12 is their first compressed version, before the short-sentence rewrites.
2. **The read slows where a list repeats context.** Its length follows size. A list is about the prose's size overall, but grows wherever each item restates its context. items-convention's list is 64% larger than its prose, because each item repeats "an item's" or "the State line".
3. **Its limits:** each list is a listing agent's restatement made for checking, not a format designed for reading. And neither the score nor the size says whether an agent follows a list as well as prose.

### Compressed texts are written as numbered lists of points — 2026-10-23

**The engineer decided that compiled rules are written as numbered lists of points**, and settled three choices.

1. **The form is the compressed text.** Each rule's Compressed section is written as numbered points, and `./compile.sh --compressed` compiles it as it stands. The sources stay prose, the default compile is unchanged, and the compiler stays a mechanical transform of text.
2. **One directive per point.** Each point states one thing to do, not to do, or that holds. Headings that set scope stay above their points, numbered from 1 under each, and the Why is the last point. No heading's context is restated in its points.
3. **The 14 rules already compressed are rewritten and checked again**, so every compressed rule is in one format. They are #2, #7, #11, #12, #13, #14, and #15, and the seven `git` rules.

**The method for the rewrite.** A fresh agent per rule rewrites its current compressed text as numbered points, with the same content. It is given the source only to read the meaning, not to take content from. Two fresh checkers then judge each rule's points against the directive list made for its first check. #14 has no list yet, so a fresh agent makes one from its source. The checkers read the Compressed section itself, not the compiled output, because the compiler still drops sub-headings. The compiler fix is still needed for the compiled lists to keep their headings.

**What the rewrite carries over unchanged:** #11's resolution of the reserved-tag contradiction, and the restorations in #11, #12, and #15. It also carries #13's directive 33, still lost and waiting for the engineer's decision.

### Addressing a point in a numbered rule — 2026-10-23

**The engineer asked what `@git/phases#1` would refer to.** The agent read it as an address in the numbered-list form, `@<package>/<section>#<point>`: the `git` package, the section headed "Phases", point 1.

1. **No `git` rule has a "Phases" section.** The match is in foundation's implementation-lifecycle rule, whose point 1 under "Phases" is "An experiment may run in phases, each a question that serves the experiment's". So the address means either `@foundation/phases#1`, or "git" names the subject, branching, and not the package.
2. **A section name alone does not identify a rule**, since several rules in a package can share a heading such as "Why" or "The end". A form that cannot be ambiguous carries the rule as well, as in `foundation/implementation-lifecycle/phases#1`.
3. **Points are numbered from 1 under each heading**, so `#1` is the first point of the section, not of the rule. Points before the first heading would need a section name of their own.

**The engineer asked whether `@` is the better character for the root of the address. It is the worst choice here**, because Claude Code already uses it twice. In a prompt, `@` mentions a file, so the address raises file completion and may try to attach `git/phases`. In `CLAUDE.md`, `@` imports a file, and an imported file's imports are followed too. This repository's `CLAUDE.md` is `@AGENTS.md`. `@` is also the mention sign on GitHub and in Slack.

**The alternatives:**

1. **No prefix**, as `foundation/implementation-lifecycle/phases#1`. The path and the `#` already mark an address, and backticks keep it out of the prose, as rule references already are. The agent recommends this.
2. **The section sign**, as `§foundation/phases#1`. It means "section", and nothing in Claude Code or git uses it, but it is harder to type.
3. **A word prefix**, as `rule:foundation/phases#1`. It is plain and easy to type, but longer.

### A point's address begins with a colon — 2026-10-23

**The engineer decided that an address for a point in a numbered rule takes the prefix `rule:`, and that `:` alone is an alias for it.** So `rule:foundation/implementation-lifecycle/phases#1` and `:foundation/implementation-lifecycle/phases#1` are the same address. Nothing in Claude Code, git, or `CLAUDE.md` gives either form a meaning.

**The address always carries the rule's name**, as the engineer confirmed, so it is `rule:<package>/<rule>/<section>#<point>`. A section name unique today stops being unique once another rule in the package takes the same heading, and every short address written by then becomes ambiguous unnoticed. Headings such as "The end", "The record", and "Why" already recur, and a form that always carries the rule needs no check of the package before it is written.

**Still open:** a point's number goes stale as well. A point inserted above it renumbers it, so `#3` can come to name another directive. Carrying the rule does not cure that.

**The engineer asked whether `:` can set off a tab-completion selection.** In Claude Code it does not, so far as the agent knows. Its prompt gives meaning to `/` for commands, `@` for files, `!` for shell mode, and `#` at the start of a message for memory, and none to `:`. A later version could add one, so typing `:foundation/` in the prompt once would confirm it.

**Elsewhere it can.** GitHub, Slack, and Discord read `:` followed by letters as the start of an emoji code, so `:fo` opens an emoji picker, and Tab or Enter can replace the text with an emoji. There, `rule:` avoids it, since a word before the colon starts no code. So does an address in backticks, since those tools expand no emoji code inside a code span, though the picker may still open while typing.

### Directive 33 is restored in #13 — 2026-10-24

**At the engineer's direction, #13 restores directive 33**, the material loss its directive check found. Its numbered rewrite gains a first point under "Declaring during a session": "A set declared during a session takes effect at the next session." The source said this only in a section heading, and the earlier compression kept the body and lost the heading. The rewrite is written into the source with the others, once the batch's checks are resolved.

### The 14 compressed rules as numbered lists — results, 2026-10-24

**All 14 compressed rules are rewritten as numbered lists and written into their sources, one commit each.** Each was checked twice against its directive list. After the repairs below, each meets the criterion, apart from the changes the engineer decided.

**The changes the engineer decided**, which the checks flag because the directive lists predate them, are three:

- the `=` border required, in announce-a-branch-switch-in-a-bordered-block
- truncation for a journal entry alone, in commit-message-widths
- the reserved-tag resolution, in #11

**The repairs**, each the smallest clause, were checked again by two fresh checkers who judged each one kept:

- **#11:** tags are the ordinary square-bracket tags; no report groups items by kind tag, and no filename derives from one; an item that neither settles things nor sequences work carries neither resolutions nor tasks. The first three the rewrite had lost. The last two were found lost in the first check too, and judged then as covered.
- **#14:** a phase is affirmed, refuted, or inconclusive only on the engineer's declaration; the parent branch is deleted only on confirmation; an experiment's changes must not reach the branch it deviates from, which the rewrite had called "the main line".
- **#15:** segments that can show together are named in words that read distinctly.
- **#13:** directive 33, by the engineer's decision: a set declared during a session takes effect at the next session.

**The less precise directives judged immaterial** are mostly losses of a qualifier the point beside them carries, as before. The largest share is #14's, at 11 of its 86 directives, the first check that rule has had.

**One flaw in the check:** the checkers were given each rule's body without its Related list, so a directive that lives in that list read as lost. #11's directive 5, which points to the tag rule, is the case. The re-checks included the list.

**The compiled lists still lose their headings.** `./compile.sh --compressed` drops every `## ` line in a Compressed section, and seven of the 14 lists have headings. #14 alone has seven. The compiler fix is now needed before a compressed read keeps its structure.

### The compressed compile keeps its headings — 2026-10-24

**At the engineer's direction, the compiler no longer removes headings that are part of a rule's compressed text.** It drops only the `## Compressed` heading itself. The fix ran unattended through the five hinges, and its loop record is `local/logs/loops/…-compressed-headings.md`. A new outcome, *Keeps the headings in the compressed text*, failed before the change and passes after. Every test passes. The compressed read of the real rules now keeps their headings: 7 in #14, 8 in #13, and 3 in commit-message-widths.

### The `testing` batch — method, committed before it runs, 2026-10-24

**The `testing` package is the second unattended batch**, its 20 rules compressed straight into numbered lists. The method is the `git` batch's, with two changes the work since has settled.

1. **The compression guidance writes numbered points.** It asks for one directive per point, keeps headings that set scope or carry a directive, and makes a directive stated only in a heading a point of its own as well.
2. **The checkers are given each rule's Related list with its compressed text**, so a directive that lives in that list is not read as lost.

The criterion, the resolution of disagreements, the repair of each lost or materially less precise directive by its smallest clause, the re-check of repairs, and the review list for the engineer are as before.

### The `testing` batch — results, 2026-10-24

**All 20 `testing` rules are compressed into numbered lists and written into their sources, one commit each, and all 20 meet the directive check's criterion.** Across the batch's 247 directives, after resolution and repair, 244 are kept, 3 are less precise, and none is lost. All three losses of precision are judged immaterial.

| rule | directives | kept | less precise | lost | compression | change | solubility | clarity score |
|---|---|---|---|---|---|---|---|---|
| a-high-level-context-names-a-behavior-not-a-method | 15 | 15 | 0 | 0 | 0.42 | 0.63 | 50 → 81 | 0.63 → 0.88 |
| a-suspended-test-file-is-named-with-a-leading-underscore | 13 | 13 | 0 | 0 | 0.28 | 0.67 | 41 → 75 | 0.38 → 0.86 |
| assert-error-message-only-as-sole-discriminator | 8 | 8 | 0 | 0 | 0.20 | 0.47 | 57 → 85 | 0.39 → 0.87 |
| context-only-for-local-instrumentation | 12 | 12 | 0 | 0 | 0.19 | 0.52 | 57 → 72 | 0.53 → 0.70 |
| control-prefix-test-vars | 2 | 2 | 0 | 0 | 0.30 | 0.67 | 99 → 99 | 1.00 → 0.99 |
| control-string-value-starts-with-some | 5 | 5 | 0 | 0 | 0.21 | 0.58 | 82 → 92 | 0.72 → 0.89 |
| controls-not-factories-fixtures-arrange | 7 | 7 | 0 | 0 | 0.30 | 0.65 | 79 → 90 | 0.70 → 0.86 |
| do-not-test-the-platform | 6 | 6 | 0 | 0 | 0.14 | 0.44 | 73 → 67 | 0.70 → 0.51 |
| error-test-named-fails-condition-is-context | 10 | 9 | 1 | 0 | 0.33 | 0.66 | 76 → 86 | 0.72 → 0.81 |
| normal-path-and-exceptional-paths-are-separate-files | 18 | 18 | 0 | 0 | 0.28 | 0.57 | 61 → 77 | 0.63 → 0.78 |
| precondition-documents-deciding-factors-and-reads-inline | 27 | 27 | 0 | 0 | 0.32 | 0.58 | 33 → 44 | 0.64 → 0.76 |
| predicate-context-name | 3 | 3 | 0 | 0 | 0.39 | 0.63 | 78 → 98 | 0.62 → 0.98 |
| single-case-test-named-for-feature | 11 | 10 | 1 | 0 | 0.04 | 0.45 | 88 → 88 | 0.85 → 0.85 |
| tdd-test-structure | 20 | 20 | 0 | 0 | 0.26 | 0.50 | 65 → 82 | 0.70 → 0.89 |
| test-block-is-assertion-only | 13 | 13 | 0 | 0 | 0.24 | 0.64 | 53 → 80 | 0.52 → 0.88 |
| test-context-nesting-mirrors-folders | 9 | 9 | 0 | 0 | 0.07 | 0.52 | 87 → 95 | 0.84 → 1.00 |
| test-name-is-prefix | 6 | 6 | 0 | 0 | 0.05 | 0.29 | 63 → 67 | 0.40 → 0.46 |
| test-report-format | 23 | 23 | 0 | 0 | 0.12 | 0.43 | 66 → 77 | 0.68 → 0.83 |
| test-tree-command | 16 | 16 | 0 | 0 | 0.19 | 0.44 | 75 → 84 | 0.76 → 0.86 |
| tests-are-automated-or-interactive | 23 | 22 | 1 | 0 | 0.38 | 0.65 | 26 → 70 | 0.28 → 0.85 |

**The repairs**, 10 clauses in 8 rules, each the smallest that closes the gap. A fresh checker re-checked each repaired rule in full and judged every repair kept:

- **context-only-for-local-instrumentation, 11:** flattening requires that the context hold nothing but the test.
- **control-string-value-starts-with-some, 3:** each further placeholder takes the "some other …" form.
- **controls-not-factories-fixtures-arrange, 7:** the six words are barred in all talk about tests, not only "for these concepts".
- **do-not-test-the-platform, 2 and 3:** a unit is a pass-through *only* when it adds nothing, and writing no test requires both the signal and the unit adding nothing of its own.
- **error-test-named-fails-condition-is-context, 5:** the context is named as a "When …" clause.
- **single-case-test-named-for-feature, 2 and 8:** the file sits directly under the feature context, which had been said only in an example; a test may start wherever is convenient *before its case set is settled*. The second was flagged by one checker, and repaired because the clause is short.
- **tdd-test-structure, 20:** the one assertion confirms the outcome the inner context's title states.
- **tests-are-automated-or-interactive, 10:** run `test/automated/` before weighing a commit, which the source states in its How to apply. It was flagged by one checker.

**The three losses of precision, judged immaterial:**

- **error-test-named-fails-condition-is-context, 9:** the ban on wrapping a single-assertion test in an empty context is not stated, only named through the context-only-for-local-instrumentation rule. The ban is that rule's directive, which this one cites and lists in Related. This is marked a close call.
- **single-case-test-named-for-feature, 10:** fixing the `require_relative` depth is stated for collapsing a file, not for moving one. The source too states it only for collapsing. The lister added "or moving".
- **tests-are-automated-or-interactive, 8:** that a test needing a person is not deleted is said only in the Why. The source too says it only in its Why.

**The disagreements**, each flagged by one checker of two, are resolved as kept: a-high-level-context's 5, where point 1 already requires a behavior at the unit's level; precondition's 3, where a TestBench `comment` is the prose narration the source names; and precondition's 27, where "whether the unit raises" is the completion the directive names. single-case's 7 was flagged only on the re-check, after both first checkers judged it kept, and stays kept.

**Solubility rises in 17 of the 20 rules, and the clarity score in 17.** control-prefix-test-vars and single-case-test-named-for-feature keep their solubility, at 99 and 88.

- **do-not-test-the-platform falls, from 73 to 67.** Its compression has three sentences over the guidance's 25 words, one of them lengthened by its own repair, and its average sentence rises from 14.4 to 19.1 words.
- **test-name-is-prefix rises only from 63 to 67.** Its clarity score stays low, at 0.46. Its compression removes only 5% of the characters.

**The engineer's review list:**

1. **test-report-format, an apparent tension in the source.** It says to re-derive everything from the current files, and also that the context hierarchy alone comes from a suite run, not the source. The source makes the exception itself. The compressed version keeps both statements.
2. **do-not-test-the-platform, three sentences over 25 words**, the reason its solubility falls. A rewrite in short sentences, like #2's and #12's, would follow the guidance.
3. **error-test-named-fails-condition-is-context, directive 9**, the close call above.

**Cost:** 88 agents: 20 compressors, 20 listers, 40 checkers, and 8 re-checkers. They used about 34,000 tokens each, about 3.0 million in all, or about 150,000 per rule. This leaves out the main session's own turns.

**One slip, fixed before committing:** for the two sources that have no Related list, the insertion script put the Compressed section below the footer's `Authored by` line. It now inserts above the footer's `---` divider.

### The `testing` batch's review list — 2026-10-24

**The engineer went through the three review items one at a time.**

1. **test-report-format: a test report is a report on the test files, so its context hierarchy is read from them too, not from a suite run.** A report on what a run produced is the test-tree command's. The fix is made in the live rule on `master`, with the earlier wording in its History, and copied to the phase branch with the compressed text following it. The compressed points keep their numbers. They are not re-checked by agents, since the directive list predates the change.
2. **do-not-test-the-platform: its three sentences over 25 words are split, two short sentences to a point, so the point numbers stay.** Two fresh checkers then found directive 6 less precise, and one directive 4: each was stated only through the `#empty?` example. Points 9 and 12 now state each one in general terms, and a fresh re-check judged all six directives kept. Solubility goes from 67 to 75, against the source's 73, and the clarity score from 0.51 to 0.70, the source's own. No sentence is over 25 words, and the average is 17.1.
3. **error-test-named-fails-condition-is-context, directive 9: naming the test directly is the engineer's preference, so the context-only-for-local-instrumentation rule no longer bans a context that holds only a test.** It warns of one instead, naming the file and the context, and offers to flatten it or to suppress these warnings. A suppression is a local rule the agent writes, `local/rules/<timestamp>-a-lone-test-context-is-not-warned-about.md`, so it holds from the next session on and is undone by deleting the file. A leading `When …` context is never warned of. The tests the agent writes keep the directly named shape. The error-test rule then has no ban to be the exception to. Its point 8 now says what the other rule warns of, and that the rule never warns of a leading `When …` context. Both rules change on `master` with History sections, and the change is copied to the phase branch. A fresh lister listed each changed rule's directives, since the old lists predate the change, and two fresh checkers checked each:
   - **context-only-for-local-instrumentation:** all 19 directives kept by both checkers.
   - **error-test-named-fails-condition-is-context:** directive 9 was less precise to both checkers and directive 5 to one. Point 8 now states what the other rule warns of, and point 5 says to lift the clause into an *enclosing* context and to name the test "Fails" or "Doesn't fail". On the re-check, both are kept. The re-check's remaining flags are resolved:
     - Directive 6 lost its "may", and gets it back.
     - Directive 9 was read as exempting only an error test's `When …` context. The source exempts every leading `When …` context, so the compressed text stands.

**All three review items are resolved.**

### The `design-by-efferent` and `versioning` batch — method, committed before it runs, 2026-10-24

**At the engineer's direction, the `design-by-efferent` package and the `versioning` package are the third unattended batch**, 16 rules in all. They are design-by-efferent's 14 rules not yet compressed, and versioning's 2. The method is the `testing` batch's unchanged: compressing straight into numbered lists, by the same guidance, and giving each rule's Related list to the checkers. The criterion, the resolution of disagreements, the repair of each lost or materially less precise directive by its smallest clause, the re-check of repairs, and the review list for the engineer are as before.

**design-by-efferent comes right after `testing` because the two refer to each other most.** The hinge cycle writes and runs the tests the `testing` rules shape. A design-by-efferent rule that still treats a context holding only a test as banned, which the `testing` review settled is a warning, goes on the review list.

### The `design-by-efferent` and `versioning` batch — results, 2026-10-24

**All 16 rules are compressed into numbered lists and written into their sources, one commit each, and all 16 meet the directive check's criterion.** Across the batch's 311 directives, after resolution and repair, 310 are kept, 1 is less precise, and none is lost. The one loss of precision is judged immaterial.

| rule | directives | kept | less precise | lost | compression | change | solubility | clarity score |
|---|---|---|---|---|---|---|---|---|
| actuation-gate-options-or-chat | 25 | 25 | 0 | 0 | 0.37 | 0.54 | 30 → 56 | 0.43 → 0.76 |
| attended-or-unattended-is-chosen-at-the-start | 38 | 38 | 0 | 0 | 0.48 | 0.72 | 36 → 59 | 0.62 → 0.86 |
| dbe-as-design-tool | 16 | 15 | 1 | 0 | 0.28 | 0.51 | 59 → 79 | 0.65 → 0.84 |
| dbe-first-turn-test-file | 24 | 24 | 0 | 0 | 0.19 | 0.52 | 44 → 59 | 0.61 → 0.76 |
| dbe-human-in-the-loop | 28 | 28 | 0 | 0 | 0.13 | 0.38 | 50 → 66 | 0.59 → 0.79 |
| hinge-cycle | 33 | 33 | 0 | 0 | 0.18 | 0.64 | 30 → 42 | 0.54 → 0.72 |
| loop-records | 23 | 23 | 0 | 0 | 0.22 | 0.57 | 45 → 64 | 0.45 → 0.68 |
| never-ask-to-start-test-first | 12 | 12 | 0 | 0 | 0.13 | 0.43 | 77 → 78 | 0.71 → 0.70 |
| no-green-on-arrival-tests | 6 | 6 | 0 | 0 | 0.22 | 0.64 | 68 → 81 | 0.58 → 0.75 |
| one-outcome-at-a-time-name-via-options | 21 | 21 | 0 | 0 | 0.19 | 0.51 | 72 → 80 | 0.68 → 0.77 |
| tdd-designs-coverage-prevents-never-break-implementation | 13 | 13 | 0 | 0 | 0.36 | 0.64 | 68 → 85 | 0.65 → 0.86 |
| the-design-of-a-test-waits-at-the-hinges-including-coverage | 14 | 14 | 0 | 0 | 0.14 | 0.57 | 71 → 89 | 0.63 → 0.93 |
| the-implementation-hinge-offers-the-red-green-refactor-cycle | 16 | 16 | 0 | 0 | 0.36 | 0.64 | 40 → 62 | 0.61 → 0.82 |
| what-each-hinge-displays | 13 | 13 | 0 | 0 | 0.29 | 0.52 | 36 → 52 | 0.43 → 0.52 |
| the-next-version-is-chosen-by-the-engineer | 10 | 10 | 0 | 0 | 0.55 | 0.75 | 58 → 85 | 0.58 → 0.80 |
| version-scheme | 19 | 19 | 0 | 0 | 0.44 | 0.70 | 52 → 84 | 0.66 → 0.93 |

**The repairs**, 16 clauses in 8 rules, each the smallest that closes the gap. A fresh checker re-checked each repaired rule in full and judged every repair kept:

- **attended-or-unattended-is-chosen-at-the-start, 22 and 7:** the mode is declared once, at the top of every loop record, and never inferred cycle by cycle; the compression had scoped this to unattended work. Every hinge is still *run* in both modes, not only determined.
- **dbe-as-design-tool, 5, 12, 14 and 15:** only the engineer's choice makes the red/green/refactor cycle legitimate; do not copy poorly designed code; design judgment is left with the human, as a directive with its meaning, where the compression had it only in the Why; the human sets the cradle.
- **never-ask-to-start-test-first, 10 and 7:** offering the next-task selection is a permission, "you may"; the mode choice neither confirms nor declines the method.
- **no-green-on-arrival-tests, 4:** the trigger, behavior already present when its own outcome comes up, and the instruction to notice that the implementation ran ahead of its test.
- **the-design-of-a-test-waits-at-the-hinges-including-coverage, 14:** an implementation is never broken to introduce a test.
- **what-each-hinge-displays, 7 and 8:** the actuation is shown, and the contexts left out, at every hinge after the first, not only at the observation and controls hinges.
- **version-scheme, 3, 11 and 14:** the generation is a declaration, not a compatibility claim. The compressor had written "a declaration that this is the same product", which the source does not say. Whoever decides the product line decides it. Declaring a new line is a separate act, on its own occasion.
- **the-next-version-is-chosen-by-the-engineer, 9:** candidates are offered rather than asking for a version outright, not only rather than having one typed. It was flagged by one checker.

**The one loss of precision, judged immaterial:** dbe-as-design-tool's 16, designing each unit from the efferent side *inward*. The re-check flagged it after both first checkers judged it kept. "Approach every unit from the efferent side first" carries the direction.

**Solubility rises in all 16 rules, and the clarity score in 15.** never-ask-to-start-test-first moves from 77 to 78, and its clarity score from 0.71 to 0.70.

**The engineer's review list**, three tensions the compressors reported in the sources, each kept in the compressed text as the source has it:

1. **one-outcome-at-a-time-name-via-options:** the loop "stops at every gate for the human" and proceeds "only on the human's go", without qualification, while its How to apply says that under unattended work the agent decides each hinge and does not stop.
2. **loop-records:** How to apply says to record each cycle's "hinge, options, and decision or chat", with no exception. Its Format section says an unattended cycle has no Options line and no Decision / chat line.
3. **dbe-human-in-the-loop:** turn one puts the observation and the controls to the human as hinges, while the same turn says the human deliberates "not the test mechanics", and the Why speaks of removing attention from test mechanics.

**No design-by-efferent rule treats a context that holds only a test as banned**, which the `testing` review settled is a warning. None of the 16 mentions it.

**Cost:** 72 agents: 16 compressors, 16 listers, 32 checkers, and 8 re-checkers, at about 34,000 tokens each. That is about 2.5 million in all, or about 155,000 per rule, leaving out the main session's own turns. The listers ran alongside the compressors, since they read only the source.

### The `design-by-efferent` and `versioning` batch's review list — 2026-10-24

**The engineer went through the three review items one at a time.**

1. **one-outcome-at-a-time-name-via-options: the loop stops at every gate except under unattended work, which came after the rule was introduced.** The rule's How to apply already carried the exception. The opening and the title now carry it too. The fix is made in the live rule on `master`, with the earlier wording in its History, and copied to the phase branch. There, compressed points 2 and 6 now say "in attended work" and that unattended work does not stop at the gates. The point numbers are unchanged. They are not re-checked by agents, since the directive list predates the change.
2. **loop-records: a cycle records options and the engineer's decision only in attended work.** The unattended exception, which came after the rule was written, was stated only in the Format section. The opening and How to apply now carry it too. The fix is made the same way as item 1. On the phase branch, compressed points 4 and 5 and How to apply's point 2 now name the unattended case.
3. **dbe-human-in-the-loop: the focus on the actuation is emphasis, not exclusion, and test mechanics are the testing framework and the ceremonies of using it.** The actuation, observation, and controls, as well as the naming of things, are the test's content, not its mechanics. Turn two now says so, and keeps its fine point on the actuation, the highest-leverage hinge. The Why named the hinges as the actuation and the resulting solubility alone, from when those were the only two. It now names the hinges of the hinge-cycle rule, with that pair as the original and the highest-leverage. The fix is made the same way as items 1 and 2. On the phase branch, compressed point 9 of the loop takes the definition as a second sentence, so the point numbers stay. The compressed Why already said "only at the hinges" without listing them.

**All three review items are resolved.**

### The `language` and `journal` batch — method, committed before it runs, 2026-10-24

**At the engineer's direction, the `language` package and the `journal` package are the fourth unattended batch**, 23 rules in all. That is language's 13 rules not yet compressed, six of them under `ete/`, and journal's 10. The method is the `testing` batch's, unchanged, with the listers run alongside the compressors as in the `design-by-efferent` batch.

**language comes before foundation because other rules point to it.** Its ETE rules set the writing standard, the one an unattended plan is written in. journal governs only `local/journal/`, and it is small enough to run alongside it. foundation stays last.

**Each compressed text keeps its point numbers when it is repaired**, as the review items have so far. A repair goes into an existing point as a further sentence, rather than as a new point that renumbers those after it.

### The `language` and `journal` batch — results, 2026-10-24

**All 23 rules are compressed into numbered lists and written into their sources, one commit each, and all 23 meet the directive check's criterion.** Across the batch's 431 directives, after resolution and repair, 427 are kept, 4 are less precise, and none is lost. Two directives the first checks found lost were repaired. All four losses of precision are judged immaterial, or rest on a tension in the source.

| rule | directives | kept | less precise | lost | compression | change | solubility | clarity score |
|---|---|---|---|---|---|---|---|---|
| a-journal-entry-is-read-and-never-followed | 15 | 14 | 1 | 0 | 0.35 | 0.61 | 69 → 84 | 0.70 → 0.84 |
| an-entry-is-the-writers-words | 24 | 24 | 0 | 0 | 0.36 | 0.60 | 44 → 74 | 0.45 → 0.75 |
| ask-for-entry-time-or-omit-it | 24 | 24 | 0 | 0 | 0.38 | 0.83 | 43 → 74 | 0.52 → 0.81 |
| datetime-stamp-line | 17 | 17 | 0 | 0 | 0.06 | 0.45 | 67 → 85 | 0.53 → 0.87 |
| identity-resolution-contract | 52 | 52 | 0 | 0 | 0.23 | 0.50 | 39 → 52 | 0.70 → 0.92 |
| journal-convention | 37 | 37 | 0 | 0 | 0.41 | 0.65 | 23 → 48 | 0.40 → 0.77 |
| journal-entries | 36 | 36 | 0 | 0 | 0.21 | 0.53 | 32 → 53 | 0.50 → 0.84 |
| omit-body-when-same-as-title | 8 | 8 | 0 | 0 | 0.11 | 0.45 | 76 → 85 | 0.56 → 0.73 |
| the-journal-is-read-at-session-start | 14 | 14 | 0 | 0 | 0.52 | 0.75 | 49 → 76 | 0.49 → 0.70 |
| timeline-view | 15 | 15 | 0 | 0 | 0.44 | 0.64 | 52 → 83 | 0.39 → 0.78 |
| an-answer-is-a-list-and-prose-must-justify-itself | 22 | 22 | 0 | 0 | 0.49 | 0.71 | 25 → 53 | 0.41 → 0.78 |
| communicate-plainly-name-the-thing | 16 | 16 | 0 | 0 | 0.33 | 0.52 | 46 → 74 | 0.26 → 0.66 |
| a-word-is-reserved-in-six-steps | 21 | 21 | 0 | 0 | 0.23 | 0.49 | 49 → 63 | 0.68 → 0.78 |
| ete-declares-its-own-categories | 14 | 14 | 0 | 0 | 0.15 | 0.42 | 57 → 70 | 0.81 → 0.95 |
| ete-fixes-the-meaning-of-a-word-in-its-category | 9 | 8 | 1 | 0 | 0.27 | 0.57 | 60 → 85 | 0.57 → 0.93 |
| ordinary-vocabulary-is-not-reserved-and-not-rewritten | 13 | 13 | 0 | 0 | 0.32 | 0.73 | 67 → 88 | 0.62 → 0.90 |
| waytide-prose-conforms-to-the-ste-writing-rules | 22 | 21 | 1 | 0 | 0.07 | 0.30 | 44 → 60 | 0.63 → 0.90 |
| expand-abbreviations-on-first-use | 10 | 10 | 0 | 0 | 0.25 | 0.53 | 68 → 95 | 0.46 → 0.98 |
| language-is-precise-here | 22 | 21 | 1 | 0 | 0.26 | 0.63 | 69 → 81 | 0.80 → 0.87 |
| lead-with-a-summary-before-details | 9 | 9 | 0 | 0 | 0.20 | 0.44 | 86 → 94 | 0.74 → 0.89 |
| name-literally-not-by-analogy | 9 | 9 | 0 | 0 | 0.29 | 0.65 | 83 → 94 | 0.84 → 0.96 |
| no-slang | 14 | 14 | 0 | 0 | 0.03 | 0.77 | 65 → 91 | 0.43 → 0.95 |
| solubility | 8 | 8 | 0 | 0 | 0.13 | 0.43 | 86 → 90 | 0.89 → 0.90 |

**The repairs**, 34 clauses in 18 rules, each a further sentence in an existing point, so no point is renumbered. A fresh checker re-checked each repaired rule in full and judged every repair kept. The ones that closed a loss or a material gap:

- **communicate-plainly-name-the-thing:** a list the engineer may refer back to is numbered. Both checkers found it lost.
- **an-answer-is-a-list-and-prose-must-justify-itself:** no answer ends with an offer of a next topic, or of what else might be done. The compression had kept only the narrower limit on the expansion line. One checker found it lost.
- **language-is-precise-here:** name concepts literally and drop slang, as directives, where the compression had described them. Metaphors, overdramatic words, and loose synonyms are now barred directly, where the compression gave them only as reasons in the Why.
- **waytide-prose-conforms-to-the-ste-writing-rules:** each limit is a maximum, "20 words or fewer", where the compression's "takes 20 words" read as an exact count. A rule found *broken* in use is added with the phrase that broke it, where "met" was ambiguous. The vocabulary decides before the standard. `in` replaces `across` only where it would mean *throughout*.
- **journal-convention:** the Summary line is taken *only* where it adds something. The agent does not shorten a subject *by rewriting it*; the compression's bare "shorten" read as forbidding the required truncation. The writer keeps the journal, not the agent.
- **omit-body-when-same-as-title:** the datetime line stays whatever else is dropped, and the Summary line is omitted where it would duplicate the body.
- **ask-for-entry-time-or-omit-it:** no answer produces a resolution the writer did not give, and *Enter the time* is an answer within the question.
- the rest restore a word or a scope: *the term's category* (a-word-is-reserved-in-six-steps), *to use the words that fit it* (ete-declares-its-own-categories), *with a meaning different from its approved meaning* (ete-fixes-the-meaning-of-a-word-in-its-category), *a vocabulary carries no false claim of conformance* (ordinary-vocabulary), *must be defined* (expand-abbreviations), *put the must-read before the may-read* (lead-with-a-summary), *a coined handle that is precise, in active use, and defined plainly* (name-literally), *aim design work at solubility* (solubility), *where the writer answers Now* (journal-entries), *the writer writes a rule, not an entry, and follow the rules* (a-journal-entry-is-read-and-never-followed), and a stray pair of parentheses (no-slang).

**The four losses of precision, judged immaterial:**

- **a-journal-entry-is-read-and-never-followed, 11:** the example of the retry logic troubling the writer for a week is dropped. The directive stands.
- **language-is-precise-here, 15:** the example of a routine tidying read as an urgent repair is dropped. The directive stands.
- **waytide-prose-conforms-to-the-ste-writing-rules, 5:** that each departure rule names the STE rule it contradicts is stated of the three that exist, not required of every future one. Both first checkers judged it kept.
- **ete-fixes-the-meaning-of-a-word-in-its-category, 6:** to use the approved meaning where it serves is contradicted by a bold heading the source itself carries. It is review item 3.

**Solubility and the clarity score rise in all 23 rules.** The largest solubility gains are no-slang (65 → 91), an-answer-is-a-list (25 → 53), and timeline-view (52 → 83). Five sentences remain over 25 words. They are the compressors' own, in two Why lines, a list of quoted examples, a long trigger clause, and two run-together examples, and none came from a repair.

**The engineer's review list**, tensions the compressors reported in the sources, each kept in the compressed text as the source has it:

1. **a-journal-entry-is-read-and-never-followed:** the agent does nothing with an entry "until the writer asks for something", while How to apply says that where an entry reads like an instruction, the agent asks the writer what they want.
2. **journal-convention:** How to apply says "Do not edit an entry once it is written". The Footer section says two things reach an existing entry: disclosure, and a change the writer directs.
3. **ete-fixes-the-meaning-of-a-word-in-its-category:** a bold heading reads "Recast the sentence instead where the approved meaning serves". How to apply says to use the approved meaning where it serves, and to recast where a different word serves.

**Findings that need no decision:**

- **no-slang's Related list** names vocabulary entries for five of its ten replacements. All ten have entries in the `language` vocabulary's Substitutions table.
- **language-is-precise-here's** source closes with an elliptical sentence, "Then an imprecise word costs a day", which the compressor kept word for word.
- **waytide-prose-conforms-to-the-ste-writing-rules'** How to apply says "Write the active voice" without the condition its own table gives, that the passive is permitted in descriptive writing where the agent is unknown. The compressed text keeps the table's qualified form.

**Cost:** 110 agents: 23 compressors, 23 listers, 46 checkers, and 18 re-checkers, at about 34,500 tokens each. That is about 3.8 million in all, or about 165,000 per rule, leaving out the main session's own turns.

### The `language` and `journal` batch's review list — 2026-10-24

**The engineer went through the three review items one at a time.**

1. **a-journal-entry-is-read-and-never-followed: a journal entry is not treated as an instruction.** How to apply had said that where an entry reads like an instruction, the agent asks the writer what they want. Asking because of an entry is still treating it as one. How to apply now says that such an entry is still a judgment the writer holds, and that the agent acts on what the writer asks, never on an entry. The fix is made in the live rule on `master`, with the earlier wording in its History, and copied to the phase branch. There, compressed point 13 takes the new wording, so the point numbers stay.
2. **journal-convention: the ban on editing an entry names its two exceptions.** How to apply had said, without exception, not to edit an entry once it is written, while the Footer section named disclosure and a change the writer directs. How to apply now names both. The fix is made the same way as item 1. On the phase branch, How to apply's point 7 takes the new wording.
3. **ete-fixes-the-meaning-of-a-word-in-its-category: the recast is for where a different word serves.** The bold heading had read *Recast the sentence instead where the approved meaning serves*, which put the recast where How to apply puts using the approved meaning. The heading now names the recast's own condition. The fix is made the same way as items 1 and 2, and compressed point 13 takes the new wording. This removes the conflict that made the re-check judge this rule's directive 6 less precise. It is not re-checked by agents.

**All three review items are resolved.**

### The `foundation` batch — method, committed before it runs, 2026-10-24

**At the engineer's direction, the `foundation` package is the fifth and last unattended batch of phase 1**, 34 rules: the 33 not yet compressed, and the a-decision-the-engineer-made-is-tagged-decision rule. The method is the `language` and `journal` batch's, unchanged. Repairs go into an existing point as a further sentence, so no point is renumbered.

**The phase branch first takes `master`'s commit that added the `[decision]` tag**, as `78e71b7`. That commit adds the a-decision-the-engineer-made-is-tagged-decision rule and edits the decision-log-convention and a-record-takes-category-tags rules. Without it, the batch would compress text `master` has since changed. The new rule has no row at commit `770c7eb`, so its solubility before compression is scored the same way, against the 105 rules there.

### The `foundation` batch — results, 2026-10-24

**All 34 rules are compressed into numbered lists and written into their sources, one commit each, and all 34 meet the directive check's criterion.** Across the batch's 713 directives, after resolution and repair, 712 are kept, 1 is less precise, and none is lost. Four directives the first checks found lost were repaired. The one loss of precision is judged immaterial.

| rule | directives | kept | less precise | lost | compression | change | solubility | clarity score |
|---|---|---|---|---|---|---|---|---|
| a-decision-the-engineer-made-is-tagged-decision | 8 | 8 | 0 | 0 | 0.15 | 0.37 | 72* → 93 | 0.62 → 1.00 |
| a-project-does-not-name-its-consumers | 16 | 16 | 0 | 0 | 0.56 | 0.73 | 43 → 83 | 0.60 → 0.86 |
| a-record-ends-with-its-state-in-upper-case | 22 | 22 | 0 | 0 | 0.44 | 0.69 | 32 → 75 | 0.38 → 0.89 |
| a-record-list-is-a-table | 14 | 14 | 0 | 0 | 0.26 | 0.56 | 37 → 69 | 0.33 → 0.75 |
| a-record-takes-category-tags | 29 | 29 | 0 | 0 | 0.30 | 0.53 | 28 → 60 | 0.37 → 0.90 |
| a-suspension-is-a-log-entry | 15 | 15 | 0 | 0 | 0.26 | 0.52 | 39 → 70 | 0.31 → 0.76 |
| a-time-value-carries-minutes-and-seconds | 14 | 14 | 0 | 0 | 0.48 | 0.72 | 30 → 78 | 0.26 → 0.77 |
| a-vocabulary-entry-says-what-a-term-means-not-what-it-was | 16 | 16 | 0 | 0 | 0.48 | 0.72 | 34 → 70 | 0.36 → 0.67 |
| ask-at-once-when-a-preference-is-expressed | 15 | 15 | 0 | 0 | 0.34 | 0.60 | 40 → 69 | 0.34 → 0.67 |
| decision-log-convention | 30 | 30 | 0 | 0 | 0.29 | 0.60 | 34 → 65 | 0.26 → 0.70 |
| disclosure-is-the-one-reason-to-edit-a-historical-record | 16 | 16 | 0 | 0 | 0.28 | 0.60 | 43 → 64 | 0.49 → 0.68 |
| downstream-work-is-never-offered | 17 | 17 | 0 | 0 | 0.30 | 0.53 | 34 → 66 | 0.29 → 0.68 |
| file-names-use-iso8601-utc-prefix | 13 | 13 | 0 | 0 | 0.30 | 0.60 | 48 → 79 | 0.44 → 0.83 |
| implementation-records-take-a-log-entry | 20 | 20 | 0 | 0 | 0.35 | 0.67 | 25 → 62 | 0.28 → 0.80 |
| implementations-convention | 54 | 54 | 0 | 0 | 0.12 | 0.48 | 22 → 46 | 0.32 → 0.78 |
| initialization-rule | 56 | 55 | 1 | 0 | 0.44 | 0.74 | 18 → 53 | 0.35 → 0.90 |
| logs-directory | 14 | 14 | 0 | 0 | 0.19 | 0.55 | 40 → 73 | 0.27 → 0.82 |
| migration-convention | 14 | 14 | 0 | 0 | 0.34 | 0.63 | 33 → 68 | 0.33 → 0.76 |
| observations-convention | 21 | 21 | 0 | 0 | 0.34 | 0.56 | 22 → 61 | 0.22 → 0.70 |
| package-dependency-heading | 4 | 4 | 0 | 0 | 0.29 | 0.58 | 80 → 99 | 0.63 → 1.00 |
| plans-no-code-samples | 10 | 10 | 0 | 0 | 0.22 | 0.59 | 88 → 92 | 0.82 → 0.87 |
| present-every-prompt-through-askuserquestion | 28 | 28 | 0 | 0 | 0.56 | 0.78 | 33 → 69 | 0.54 → 0.85 |
| project-context-lives-in-the-committed-artifacts | 19 | 19 | 0 | 0 | 0.42 | 0.66 | 44 → 68 | 0.41 → 0.61 |
| prose-is-not-hard-wrapped | 9 | 9 | 0 | 0 | 0.55 | 0.75 | 63 → 92 | 0.59 → 0.93 |
| record-rule-authorship-in-a-footer | 12 | 12 | 0 | 0 | 0.29 | 0.51 | 50 → 79 | 0.30 → 0.75 |
| record-title-date-format | 19 | 19 | 0 | 0 | 0.41 | 0.71 | 53 → 75 | 0.49 → 0.67 |
| rules-convention | 49 | 49 | 0 | 0 | 0.09 | 0.49 | 26 → 50 | 0.38 → 0.81 |
| rules-establish-a-mindset-purpose-over-category | 12 | 12 | 0 | 0 | 0.15 | 0.62 | 61 → 78 | 0.54 → 0.81 |
| status-report-format | 32 | 32 | 0 | 0 | 0.10 | 0.41 | 28 → 51 | 0.40 → 0.83 |
| the-log-never-says-undone-work-was-done | 12 | 12 | 0 | 0 | 0.55 | 0.79 | 39 → 75 | 0.29 → 0.67 |
| vocabulary-convention | 32 | 32 | 0 | 0 | 0.29 | 0.50 | 40 → 54 | 0.62 → 0.79 |
| when-the-work-diverges-from-the-plan-the-work-is-definitive | 15 | 15 | 0 | 0 | 0.24 | 0.48 | 55 → 83 | 0.37 → 0.84 |
| work-sessions-convention | 38 | 38 | 0 | 0 | 0.33 | 0.61 | 18 → 45 | 0.32 → 0.75 |
| working-state-artifacts-carry-a-provenance-footer | 18 | 18 | 0 | 0 | 0.42 | 0.64 | 49 → 80 | 0.48 → 0.81 |

The new rule's solubility before compression, marked `*`, is scored as a 106th row against the 105 rules at commit `770c7eb`, as the method says.

**The repairs**, 51 clauses in 25 rules, each a further sentence in an existing point or a word restored to one, so no point is renumbered. A fresh checker re-checked each repaired rule in full. The ones that closed a loss or a material gap:

- **implementation-records-take-a-log-entry:** a refuted, inconclusive, abandoned, or superseded record is kept, marked with its state, as evidence. Both checkers found it lost. Unmerged work is never merged and its branch is deleted only on confirmation, where the compression had only defined the two categories.
- **initialization-rule:** the loading line names the wait after `load waytide`, while every compiled rule is opened. Both checkers found it lost. Any standing statement that never changes belongs on the display, and the year changes *only* when the rule changes.
- **working-state-artifacts-carry-a-provenance-footer:** the rule states the justification once, and the working-state conventions do not repeat it. Both checkers found it lost.
- **rules-convention:** an item is never deleted; its state changes and its record is kept. Both checkers found it lost. A rule is renamed when its name stops saying what it says. Every rule is one per file, and a removed rule leaves *every* Related list.
- **when-the-work-diverges-from-the-plan-the-work-is-definitive:** the compression had turned the source's "should not necessarily need to be updated" into "Do not update the plan", a prohibition the rule's own "removes an obligation, not a permission" denies. Point 2 now says the plan *need not* be updated.
- **present-every-prompt-through-askuserquestion:** a closed list must never foreclose an answer only the engineer can produce. `Explain` is placed among the supplied options; the compression's "Do not choose where `Explain` appears" forbade more than the source does.
- **a-record-takes-category-tags:** a record gains a head *when it is tagged*; the leading-tag form is defined and barred; a `**Tags:**` line is added wherever a categorization is worth marking.
- **decision-log-convention:** an entry takes a body *only* where its reasoning will not fit a title, and the log is treated as append-only.
- **disclosure-is-the-one-reason-to-edit-a-historical-record:** no record is scrubbed on a guess, and the engineer is told that the git history and component repositories still hold the removed content.
- **a-time-value-carries-minutes-and-seconds:** the defect is defined, and a new datetime format goes to seconds only where it includes a time of day.
- **vocabulary-convention:** an uncoined word is a term unconditionally, a domain-specific substitution goes in its own package, and an entry says whether it narrows or replaces.
- the rest restore a word or a scope: *as a consumer* and the disclosure rule's reach (a-project-does-not-name-its-consumers), *`[decision]`* (a-decision-the-engineer-made), *present rows* (a-record-list-is-a-table), *costs more than it is worth* (a-suspension), *only when the engineer asks* (downstream-work), *the confirmations of* (implementations-convention), *only* (logs-directory, and its file-names prefix), *the rule and the observation* (observations-convention), *over-prescription* and *known* (plans-no-code-samples), *vocabulary entries too* (prose-is-not-hard-wrapped), *any other timezone marker* (record-title-date-format), *hidden for the same reason* (status-report-format), *plainly* (the-log-never-says-undone-work-was-done), and the arc and the format's place (work-sessions-convention).

Two compressors' answers carried text that is not rule content. logs-directory's opened with the compressor's account of what it dropped, and rules-convention's carried a stray `CONTRACTIONS` line. Both were removed before the text was written into the source.

**The one loss of precision, judged immaterial:**

- **initialization-rule, 40:** the loading line repeats the session-start notice's caveat, and the compressed text does not quote the notice's own wording, *Loading the rules will take a few moments*. The directive stands.

The re-checks raised seven further single-judge objections. Each was resolved as kept by reading the source, which says the same thing in the same place: decision-log-convention's four Related-list pointers, disclosure's "Only the naming goes", vocabulary-convention's statement of the STE level, when-the-work-diverges' "by dated addition", and a-decision-the-engineer-made's "may be stated … or made". initialization-rule's "to a reader already using it" is the source's own qualifier.

**Solubility and the clarity score rise in all 34 rules.** The largest solubility gains are a-time-value-carries-minutes-and-seconds (30 → 78), a-record-ends-with-its-state-in-upper-case (32 → 75), and a-project-does-not-name-its-consumers (43 → 83). Five sentences remain over 25 words. Four are the compressors' own: two Why sentences, a setup list, and a list of three quoted options. One came from a repair, the restored "costs more than it is worth" in a-suspension-is-a-log-entry.

**The compile test is changed on the phase branch.** Its section reader ended a Compressed section at any `---` line, so record-rule-authorship-in-a-footer, whose compressed text shows the footer in a fenced block, failed it. The test now passes over a `---` inside a fenced block. The compiler already found the footer from the end of the file and needed no change.

**The engineer's review list**, tensions the compressors reported in the sources, each kept in the compressed text as the source has it:

1. **decision-log-convention:** an entry takes a body where its reasoning will not fit a title, yet "An untagged entry is one line", and How to apply says "write a titled one-line entry".
2. **a-time-value-carries-minutes-and-seconds:** How to apply says to write seconds whenever a datetime includes a time of day, and names no exceptions. The body names two, record titles and journal filename stamps.
3. **implementation-records-take-a-log-entry:** one statement makes the record's location on `master` the test for the concluding form, and another makes the merge the test. The abandoned-work entry gives the intent and the reasoning for stopping, while How to apply says every unmerged case writes "the findings".
4. **migration-convention:** its Related entry says the record "is written to be executed rather than to account for what happened". The body says to record what actually happened against the plan.
5. **implementations-convention:** *Suspended* is listed among the concluding words, but defined as "paused, not ended". Whether a suspended record takes the filename's state suffix is left open.
6. **observations-convention:** a promotion is noted "in the two files", one of which is the observation, while the observation "stays exactly as it is".
7. **present-every-prompt-through-askuserquestion:** every genuine candidate is presented, yet where there are four, the fourth is dropped to keep `Explain`.
8. **initialization-rule:** the five parts print "in this order" with the package set second, after the title. Yet the agent prints the set after the harness's display, and "Nothing is printed under" the title.
9. **rules-convention:** `waytide/system/` and `waytide/local/rules/` "hold only rules", yet each package under `waytide/system/` has a `README.md` and a `source/` directory.
10. **work-sessions-convention:** the prompt "always says 'work session'", but How to apply gives the third reconciliation option as "no design bears on this session".

**Cost:** 161 agents: 34 compressors, 34 listers, 68 checkers, and 25 re-checkers, at about 35,000 tokens each. That is about 5.6 million in all, or about 166,000 per rule, leaving out the main session's own turns.

### The `foundation` batch's review list — 2026-10-25

**The engineer went through the ten review items one at a time.** Each fix is made in the live rule on `master`, with the earlier wording in its History and a log entry tagged `[decision]`, and copied to the phase branch. There, the compressed text takes the same wording in its existing points, so no point is renumbered, and both branches compile to the same rule.

1. **decision-log-convention: bodies stay, and one line is the ordinary case.** "An untagged entry is one line" now reads "An untagged entry with no body is one line". How to apply says to write a titled entry, one line in the ordinary case, with a body where its reasoning will not fit the title. Compressed point 9 takes the new wording.
2. **a-time-value-carries-minutes-and-seconds: How to apply points to the exceptions.** It now says to write the seconds "except where this rule names an exception", without listing them. Compressed point 18 takes the same clause. The `Related:` label had run into the end of How to apply's paragraph, so the compiler did not see the rule's Related list. It now stands on its own line.
3. **implementation-records-take-a-log-entry: the merge is the test.** The concluding entry's form "is decided by whether the work merged". How to apply now writes the findings where there are any, and for abandoned work the reasoning given for stopping. Compressed points 2 and 3 take the new wording.
4. **migration-convention: the record is written ahead, then updated.** The Related entry now says a migration record is written ahead of the move to be executed, then records what happened against the plan as the move runs. No compressed point carried the clause.
5. **implementations-convention: Suspended is a state, not a conclusion.** The heading is now "The state words both kinds take", and the filename takes its state suffix once the record carries a state line, as the a-record-ends-with-its-state-in-upper-case rule says. Compressed points 7 and 10 take the new wording.
6. **observations-convention: a promoted observation names its result.** The engineer's reason is that the rule is the result of the observation evolving into it. On promotion the observation takes one added line, `**Promoted to:** the <name> rule`, and nothing else about it changes. Compressed points 11, 12, and 13 take the new wording.
7. **present-every-prompt-through-askuserquestion: no candidate is dropped.** Where there are more than three, the question says so and points to `Explain`, whose answer gives every candidate. The prompt is displayed again with the same three and `Explain briefly`, and a candidate beyond the third is chosen through the "Other" answer. Compressed point 20 takes the new wording.
8. **initialization-rule: the package set prints after the display.** The order covers the harness's four parts. The package-set section keeps its place in the file, because the script reads the display's parts from the fenced blocks by position, and it opens by saying it prints after them. What the title excludes is a subtitle or description. Compressed points 1, 14, and 18 take the new wording.
9. **rules-convention: `waytide/system/` holds the rules and what packages them.** `waytide/local/rules/` holds only rules. `waytide/system/` holds each package's rules, `README.md`, `source/`, `LICENSE`, vocabulary, and scripts. Neither holds working state. Compressed point 2 takes the new wording.
10. **work-sessions-convention: every prompt says "work session".** The statement now covers the recording prompt and the design reconciliation alike, and How to apply's third reconciliation option reads "no design bears on this work session". Compressed point 18 takes the new wording.

**All ten review items are resolved.** The engineer also recorded three new items on `master` during the review: the ideas that the chat option reads "Return to chat" and that a journal entry may be private, and the work item that the log is called the log rather than the decision log.

### Phase 1 gains the rule names — 2026-10-25

**At the engineer's direction, clarifying the rule names is an increment of the flattening phase.** Phase 1 has compressed every rule's text. A rule's name is not part of that text. It is the file name and the slug every citation uses, and many names are hard to read cold. The `master` item *A rule's name is soluble* records the idea and what it leaves unsettled.

**The method is not yet set.** Open are what makes a name clear and how it is judged, whether a rule's title is in scope beside its name, and how a rename reaches the citations in other rules and the copies installed in consuming projects.

**Titles are in scope, the engineer settled the same day, since a rule's name is derived from its title.** The increment clarifies each title, and the name follows from it.

**A rename updates the citations in other rules, and the installed copies need nothing**, the engineer settled. A consuming project holds the old names only until it is refreshed. What stays open is what makes a title clear, and how that is judged.

**A title is clear by the same thing that makes a rule's content clear**, the engineer settled. It is held to solubility and judged the same way. Nothing about the increment is now left unsettled.

**The engineer chose attended work for the increment.** Each rule's title is put to the engineer one at a time, with its derived name, and the rename and its citations are made on the phase branch. 97 of the 107 rules have a name that is not the one their title derives. The order is by package, `foundation` first, since it defines the system, and alphabetical within a package.

**After five rules, the engineer changed the increment to unattended.** The five showed the standard: a title is kept close to its wording, and changed only where it is unclear, so the agent can apply it. The agent retitles the remaining 92, renames each to the name its title derives, and updates every live citation, one commit per rule. Historical records keep the names they were written with. The engineer then reviews a table of every change.

### Phase 1 — the rule names, results, 2026-10-25

**All 97 rules whose name did not derive from their title now carry a clarified title and the name it derives**, one commit each, with every live citation updated and the tests passing after each. Five were decided by the engineer one at a time, and 92 by the agent unattended, to the standard those five set: keep a title close to its wording, and change it only where it is unclear. Six were retitled so that the name stays as it was. Each rule's History records its former name and title. Historical records keep the names they were written with.

| | old name | title | new name |
|---|---|---|---|
| 1 | a-decision-the-engineer-made-is-tagged-decision | A log entry recording an engineer's decision is tagged `[decision]` | a-log-entry-recording-an-engineers-decision-is-tagged-decision |
| 2 | a-project-does-not-name-its-consumers | A project does not name its downstream consumers in its own files | a-project-does-not-name-its-downstream-consumers-in-its-own-files |
| 3 | a-project-declares-its-package-set | A project declares which installed packages are active | a-project-declares-which-installed-packages-are-active |
| 4 | a-record-ends-with-its-state-in-upper-case | A record carrying a state line ends its filename with the state in upper case | a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case |
| 5 | a-record-list-is-a-table | A printed list of records is formatted as a table | a-printed-list-of-records-is-formatted-as-a-table |
| 6 | actuation-gate-options-or-chat | The actuation gate offers candidate actuations as options | the-actuation-gate-offers-candidate-actuations-as-options |
| 7 | attended-or-unattended-is-chosen-at-the-start | Attended or unattended is chosen when the work is started | attended-or-unattended-is-chosen-when-the-work-is-started |
| 8 | dbe-as-design-tool | DBE is a design tool, not a testing ritual | dbe-is-a-design-tool-not-a-testing-ritual |
| 9 | dbe-first-turn-test-file | The first DBE gate is the actuation and an unnamed assert | the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert |
| 10 | dbe-human-in-the-loop | The human deliberates the hinges, never the pass/fail bar | the-human-deliberates-the-hinges-never-the-pass-fail-bar |
| 11 | hinge-cycle | The hinge cycle runs from actuation to naming | the-hinge-cycle-runs-from-actuation-to-naming |
| 12 | loop-records | A loop record holds the cycles through the loop, one file per feature | a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature |
| 13 | never-ask-to-start-test-first | Never ask whether to start a task test-first | never-ask-whether-to-start-a-task-test-first |
| 14 | no-green-on-arrival-tests | Drop an outcome whose test is green on arrival | drop-an-outcome-whose-test-is-green-on-arrival |
| 15 | one-outcome-at-a-time-name-via-options | Advance one outcome at a time, stop at every gate in attended work, and name via options | advance-one-outcome-at-a-time-stop-at-every-gate-in-attended-work-and-name-via-options |
| 16 | show-feature-test-output-after-implementation-hinge | After any implementation hinge, show the test output for the current feature | after-any-implementation-hinge-show-the-test-output-for-the-current-feature |
| 17 | tdd-designs-coverage-prevents-never-break-implementation | TDD designs behavior, coverage prevents regression, and neither breaks an implementation | tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation |
| 18 | the-design-of-a-test-waits-at-the-hinges-including-coverage | The design of a test waits at the hinges, coverage included | the-design-of-a-test-waits-at-the-hinges-coverage-included |
| 19 | the-implementation-hinge-offers-the-red-green-refactor-cycle | The implementation hinge offers the working implementation or the red-green-refactor cycle | the-implementation-hinge-offers-the-working-implementation-or-the-red-green-refactor-cycle |
| 20 | what-each-hinge-displays | Each hinge displays the actuation as its anchor, and the contexts once | each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once |
| 21 | a-record-takes-category-tags | A record may be categorized with square-bracket tags | a-record-may-be-categorized-with-square-bracket-tags |
| 22 | a-suspension-is-a-log-entry | A suspension is a log entry tagged `[suspended]`, and nothing is moved | a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved |
| 23 | a-vocabulary-entry-says-what-a-term-means-not-what-it-was | A vocabulary entry says what a term means, not what it was or where to read more | a-vocabulary-entry-says-what-a-term-means-not-what-it-was-or-where-to-read-more |
| 24 | an-item-takes-a-log-entry | An item takes a log entry on creation, on each settled resolution, and on a change of state | an-item-takes-a-log-entry-on-creation-on-each-settled-resolution-and-on-a-change-of-state |
| 25 | announce-waytide-at-session-start | The harness announces Waytide's installation, and the agent never prints the notice | the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice |
| 26 | ask-at-once-when-a-preference-is-expressed | Ask at once when the engineer expresses a preference | ask-at-once-when-the-engineer-expresses-a-preference |
| 27 | decision-log-convention | The log holds one file per decision, with a one-line title | the-log-holds-one-file-per-decision-with-a-one-line-title |
| 28 | downstream-work-is-never-offered | Work in a downstream project is never offered, and its pending state is not reported | work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported |
| 29 | file-names-use-iso8601-utc-prefix | Dated artifacts take an ISO 8601 UTC datetime prefix, and system rules do not | dated-artifacts-take-an-iso-8601-utc-datetime-prefix-and-system-rules-do-not |
| 30 | implementation-lifecycle | An implementation runs on a branch to a declared end | an-implementation-runs-on-a-branch-to-a-declared-end |
| 31 | implementation-records-take-a-log-entry | An implementation record takes a log entry, and the last one depends on the merge | an-implementation-record-takes-a-log-entry-and-the-last-one-depends-on-the-merge |
| 32 | implementations-convention | The implementations directory records each implementation's lifecycle | the-implementations-directory-records-each-implementations-lifecycle |
| 33 | initialization-rule | The startup display prints once per session | the-startup-display-prints-once-per-session |
| 34 | items-convention | The items directory holds the project's items, one file per item | the-items-directory-holds-the-projects-items-one-file-per-item |
| 35 | logs-directory | The logs directory groups the running records | the-logs-directory-groups-the-running-records |
| 36 | migration-convention | The migration directory holds the plans for moving content across a repository boundary | the-migration-directory-holds-the-plans-for-moving-content-across-a-repository-boundary |
| 37 | observations-convention | An observation is a working hypothesis whose one state, Stated, never changes | an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes |
| 38 | package-dependency-heading | A design section documenting a package dependency is titled "Package Dependency" | a-design-section-documenting-a-package-dependency-is-titled-package-dependency |
| 39 | plans-no-code-samples | An item that sequences work contains no code samples | an-item-that-sequences-work-contains-no-code-samples |
| 40 | present-every-prompt-through-askuserquestion | Present every prompt to the engineer through the selection UI | present-every-prompt-to-the-engineer-through-the-selection-ui |
| 41 | project-context-lives-in-the-committed-artifacts | A project's durable context lives in its committed artifacts | a-projects-durable-context-lives-in-its-committed-artifacts |
| 42 | prose-is-not-hard-wrapped | A paragraph is one line, and the reader's editor wraps it | a-paragraph-is-one-line-and-the-readers-editor-wraps-it |
| 43 | record-rule-authorship-in-a-footer | Record a rule's authorship in a provenance footer | record-a-rules-authorship-in-a-provenance-footer |
| 44 | record-title-date-format | A date in a record's title takes the day, the date, and the 24-hour time | a-date-in-a-records-title-takes-the-day-the-date-and-the-24-hour-time |
| 45 | rules-convention | Binding rules live in the installed packages and the project's own rules directory | binding-rules-live-in-the-installed-packages-and-the-projects-own-rules-directory |
| 46 | rules-establish-a-mindset-purpose-over-category | A rule's purpose is not confined to its category | a-rules-purpose-is-not-confined-to-its-category |
| 47 | status-report-format | A status report prints a fixed whole-project report | a-status-report-prints-a-fixed-whole-project-report |
| 48 | the-log-never-says-undone-work-was-done | The log records why work was abandoned, and never says undone work was done | the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done |
| 49 | vocabulary-convention | A package's vocabulary holds its terms, and the most specific one decides | a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides |
| 50 | work-sessions-convention | A work session record is the narrative of one work session | a-work-session-record-is-the-narrative-of-one-work-session |
| 51 | a-sha-names-the-work-rather-than-the-commit | A commit's SHA refers to the work the commit carries | a-commits-sha-refers-to-the-work-the-commit-carries |
| 52 | commit-message-widths | A commit message's subject stops at 50 characters and its body wraps at 72 | a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72 |
| 53 | commit-says-task-is-done-not-mark-done | A commit message states that a task is done, never that it is marked done | a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done |
| 54 | no-claude-coauthor | A commit carries no Claude co-author trailer | a-commit-carries-no-claude-co-author-trailer |
| 55 | run-suite-before-commit | Run the test suite after changes, before considering whether to commit | run-the-test-suite-after-changes-before-considering-whether-to-commit |
| 56 | subject-first-commit-messages | Write subject-first commit messages | write-subject-first-commit-messages |
| 57 | ask-for-entry-time-or-omit-it | Where an entry carries no time, ask for one through the selection interface | where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface |
| 58 | datetime-stamp-line | A journal entry carries a human-readable datetime line under its title | a-journal-entry-carries-a-human-readable-datetime-line-under-its-title |
| 59 | identity-resolution-contract | The writer's identity resolves through a fixed override chain | the-writers-identity-resolves-through-a-fixed-override-chain |
| 60 | journal-convention | The journal is the record the writer keeps | the-journal-is-the-record-the-writer-keeps |
| 61 | journal-entries | Journal entries live in the writer's journal directory, one file per entry | journal-entries-live-in-the-writers-journal-directory-one-file-per-entry |
| 62 | omit-body-when-same-as-title | Where an entry's body says the same thing as its title, keep the title alone | where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone |
| 63 | the-journal-is-read-at-session-start | The journal is read at the start of a session, with the rules | the-journal-is-read-at-the-start-of-a-session-with-the-rules |
| 64 | timeline-view | A timeline view lists every journal entry by its datetime | a-timeline-view-lists-every-journal-entry-by-its-datetime |
| 65 | an-answer-is-a-list-and-prose-must-justify-itself | An answer is a list, and prose must justify itself | unchanged |
| 66 | communicate-plainly-name-the-thing | Communicate plainly, and name the actual thing | communicate-plainly-and-name-the-actual-thing |
| 67 | ete-declares-its-own-categories | ETE declares its own categories | unchanged |
| 68 | waytide-keeps-its-word-where-the-ste-word-means-something-else | Waytide keeps its word where the STE word means something else | unchanged |
| 69 | waytide-prose-conforms-to-the-ste-writing-rules | Waytide prose conforms to the STE writing rules | unchanged |
| 70 | expand-abbreviations-on-first-use | Expand an abbreviation on first use | expand-an-abbreviation-on-first-use |
| 71 | language-is-precise-here | Language is used precisely here, and words are load-bearing | language-is-used-precisely-here-and-words-are-load-bearing |
| 72 | lead-with-a-summary-before-details | Lead with a summary, then the details | lead-with-a-summary-then-the-details |
| 73 | name-literally-not-by-analogy | Name concepts literally, not by analogy, code, or jargon | name-concepts-literally-not-by-analogy-code-or-jargon |
| 74 | no-slang | No slang | unchanged |
| 75 | solubility | Solubility is how readily a unit dissolves into the reader's understanding | solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding |
| 76 | a-high-level-context-names-a-behavior-not-a-method | A high-level context names a behavior, never a method | a-high-level-context-names-a-behavior-never-a-method |
| 77 | a-suspended-test-file-is-named-with-a-leading-underscore | A test file named with a leading underscore is suspended | a-test-file-named-with-a-leading-underscore-is-suspended |
| 78 | assert-error-message-only-as-sole-discriminator | Assert an error message only when it alone confirms the error | assert-an-error-message-only-when-it-alone-confirms-the-error |
| 79 | context-only-for-local-instrumentation | A test takes a context only when its outcome needs local instrumentation | a-test-takes-a-context-only-when-its-outcome-needs-local-instrumentation |
| 80 | control-prefix-test-vars | A control-built test value takes the control_ prefix | a-control-built-test-value-takes-the-control-prefix |
| 81 | control-string-value-starts-with-some | A control's string value starts with "some" | a-controls-string-value-starts-with-some |
| 82 | controls-not-factories-fixtures-arrange | Test values are controls, never factories, fixtures, or arrange | test-values-are-controls-never-factories-fixtures-or-arrange |
| 83 | do-not-test-the-platform | Do not test the platform | unchanged |
| 84 | error-test-named-fails-condition-is-context | An error test is named Fails, and its condition is a context | an-error-test-is-named-fails-and-its-condition-is-a-context |
| 85 | normal-path-and-exceptional-paths-are-separate-files | A feature's normal path and its exceptional paths are separate test files | a-features-normal-path-and-its-exceptional-paths-are-separate-test-files |
| 86 | precondition-documents-deciding-factors-and-reads-inline | A precondition names a test's deciding factors and reads inline | a-precondition-names-a-tests-deciding-factors-and-reads-inline |
| 87 | predicate-context-name | A predicate method's test context is named for the predicate | a-predicate-methods-test-context-is-named-for-the-predicate |
| 88 | single-case-test-named-for-feature | A single-case feature is one test file named for the feature | a-single-case-feature-is-one-test-file-named-for-the-feature |
| 89 | tdd-test-structure | A test actuates its concern once, and asserts each outcome in its own context | a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context |
| 90 | test-block-is-assertion-only | A test block holds only the assertion | a-test-block-holds-only-the-assertion |
| 91 | test-context-nesting-mirrors-folders | Test context nesting mirrors the folder hierarchy | test-context-nesting-mirrors-the-folder-hierarchy |
| 92 | test-name-is-prefix | Start a test name with "Is" only for a value-equals-comparator assertion | start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion |
| 93 | test-report-format | A test report classifies the suite and prints its context hierarchy | a-test-report-classifies-the-suite-and-prints-its-context-hierarchy |
| 94 | test-tree-command | The test tree command prints the suite's context tree | the-test-tree-command-prints-the-suites-context-tree |
| 95 | tests-are-automated-or-interactive | Tests are automated or interactive, and only the automated run before a commit | tests-are-automated-or-interactive-and-only-the-automated-run-before-a-commit |
| 96 | the-next-version-is-chosen-by-the-engineer | The next version is put to the engineer, never decided by the agent | the-next-version-is-put-to-the-engineer-never-decided-by-the-agent |
| 97 | version-scheme | A version is semver, optionally prefixed by a product generation number | a-version-is-semver-optionally-prefixed-by-a-product-generation-number |

The engineer reviews this table and sends back any title to change.

### Waytide's inefficiencies, as the agent found them — 2026-10-26

**The engineer asked what Waytide's inefficiencies are and how each could be improved, and directed that the answer be added to this phase.** The agent answered from the session-start read on `master` at `8146f2c`: about 560 KB of compiled markdown. The answer is the agent's reading and nothing in it is settled. Each finding was then checked on this phase branch at `9c5a10c`, whose compiled read is 538,299 characters in 113 files, and each still holds there.

1. **The session-start read is large, and most of it is reasoning.** A rule carries its directive, a long `**Why:**`, and often a section on what it does not reach. The compiler strips only `## History`. The improvement is a shorter compiled form for the session-start read, with each rule's directive and How to apply and one line of purpose, and the reasoning kept in `source/`. This is this phase's own question.
2. **History stands in compiled rule bodies, where the compiler cannot drop it.** On the phase branch, 25 compiled files carry an *until 2026-* clause. Among them are the rules on the session-start notice, the state suffix, the items directory, the logs directory, the identity chain, journal entries, and commit-message widths. The improvement is to move those clauses into `## History`, as the rules-convention requires.
3. **The same boilerplate is copied into seven vocabularies.** The paragraphs on what every word is, what a reserved word's entry states, and what silence means stand nearly word for word in six package vocabularies and in `local/vocabulary.md`. The improvement is to state them once in the vocabulary-convention.
4. **Some instructions are stated in several rules.** The never-offer instruction is in three rules. The options, `Explain`, and two-option-floor mechanics are in three. The precondition exception is in two. The attended or unattended account is in five. The improvement is to state each once and cite it by name elsewhere.
5. **Some live references point at what no longer exists.** `local/vocabulary.md` cites the ideas-convention twice, and that convention is now the items convention. The design-by-efferent vocabulary's `Related:` list splits "TDD designs, coverage prevents" across two list items. The improvement is to reconcile them.
6. **The hook and the initialization rule disagree about the package set.** The read instruction says to print the package set. The rule says a `default` set with nothing deactivated prints nothing, so each session's agent settles the conflict itself. The improvement is for `session-start.sh` to leave out that sentence where the set is `default` and nothing is deactivated.
7. **The read takes many tool calls, and nothing guarantees it is complete.** Each session's agent finds its own way to open about 110 files. The improvement is a bundle file that `compile.sh` writes, which is the question phase 2 holds.
8. **Each record carries many obligations.** A state change on an item is a rename, a new state line, a log entry, a footer line, and a reconciliation of the live paths that cite the old name. Inserting a priority rank renumbers every item below it. The improvement named is to drop the filename state suffix and read the state lines with a listing script. That costs the state shown in an ordinary directory listing, which is why the suffix exists.
9. **Every prompt costs extra turns.** `Explain` takes one of four option slots. The ask-at-once rule interrupts the work for each preference. Attended work puts five prompts per outcome, even for a small unit. The improvement named is to record the engineer's words at the moment a preference is stated, and ask about recording it at the task's end.
10. **Nothing re-reads the rules after the context is compacted.** The rules then survive only as a summary. The `SessionStart` hook runs after compaction, but its instruction asks for the full read again. The improvement named is the compact compiled form of the first finding, which would make a re-read cheap.

### Phase 1 is renamed compression — 2026-10-26

**The engineer renamed phase 1 from flattening to compression.** In the engineer's words: it's not just a flattening. The phase has compressed every rule's text and clarified every rule's name, and flattening names only the first of those.

**The phase branch is renamed to match**, from `experiment/worktree/rule-reduction.flattening` to `experiment/worktree/rule-reduction.compression`, with `git branch -m` in the worktree. The worktree's directory is named for the experiment, not the phase, so it is unchanged. The Phases list carries the new name. The sections above that name the phase flattening are left as written, since each records what was true when it was written.

### Phase 1 — the rule names, the engineer's review, 2026-10-26

**The engineer reviewed the titles the agent had flagged, and 29 of the 97 changed.** The review took the titles one at a time, in groups: the directory-path titles reworded as statements, the titles reworded to fit a name, the titles that dropped a detail or a clause, and the longest names. Each change is a rename on the phase branch, one commit each, with its citations updated and the tests passing. Each rule's History records its former name and title. The rest of the 97 stand as the first pass left them, including #33, #49, #60, #9, and #7, which the engineer kept.

| # | title after the first pass | title after the review |
|---|---|---|
| 5 | A printed list of records is formatted as a table | A printed list of records is formatted as a table or as a list of rows |
| 11 | The hinge cycle runs from actuation to naming | The hinge cycle is actuation, observation, controls, implementation, and naming |
| 13 | Never ask whether to start a task test-first | Test-first is the default, so never ask whether to start a task that way |
| 14 | Drop an outcome whose test is green on arrival | A test of behavior that already exists is coverage, not design |
| 15 | Advance one outcome at a time, stop at every gate in attended work, and name via options | Advance one outcome at a time, and stop at every gate in attended work |
| 19 | The implementation hinge offers the working implementation or the red-green-refactor cycle | At the implementation hinge, the engineer chooses a direct implementation or red-green-refactor |
| 24 | An item takes a log entry on creation, on each settled resolution, and on a change of state | A log entry is written for an item on creation, on each settled resolution, and on a change of state |
| 27 | The log holds one file per decision, with a one-line title | The log holds one file per entry, with a one-line title |
| 29 | Dated artifacts take an ISO 8601 UTC datetime prefix, and system rules do not | Dated artifacts are prefixed with an ISO 8601 UTC datetime, and system rules are not |
| 31 | An implementation record takes a log entry, and the last one depends on the merge | A log entry is written for an implementation record, and the concluding entry depends on whether the work merged |
| 32 | The implementations directory records each implementation's lifecycle | The implementations directory holds one record per implementation |
| 34 | The items directory holds the project's items, one file per item | The items directory holds one file per item |
| 35 | The logs directory groups the running records | The logs directory holds the contemporaneous, historical records |
| 36 | The migration directory holds the plans for moving content across a repository boundary | The migration directory holds the plans for moving or restructuring content |
| 41 | A project's durable context lives in its committed artifacts | A project's durable context is recorded in its committed artifacts, never in an agent memory store |
| 44 | A date in a record's title takes the day, the date, and the 24-hour time | A date in a record's title is written as the day, the date, and the 24-hour time |
| 45 | Binding rules live in the installed packages and the project's own rules directory | A project's binding rules are recorded in its packages and its local rules directory |
| 46 | A rule's purpose is not confined to its category | Rules may establish a mindset rather than a mechanic |
| 50 | A work session record is the narrative of one work session | The work-sessions directory holds one record per work session |
| 54 | A commit carries no Claude co-author trailer | Claude is not credited as a co-author of a commit |
| 58 | A journal entry carries a human-readable datetime line under its title | A journal entry has a human-readable datetime line under its title |
| 59 | The writer's identity resolves through a fixed override chain | The writer's username is read from the environment, then the project, then the user's config file |
| 61 | Journal entries live in the writer's journal directory, one file per entry | Journal entries are recorded in the writer's journal directory, one file per entry |
| 79 | A test takes a context only when its outcome needs local instrumentation | A context block is used for a test block only when the test's outcome needs local instrumentation or local variables |
| 80 | A control-built test value takes the control_ prefix | A control-built test value is prefixed with control_ |
| 86 | A precondition names a test's deciding factors and reads inline | A precondition documents the factors that decide a test's outcome, and its predicate reads inline |
| 87 | A predicate method's test context is named for the predicate | A predicate method's test context is its name followed by the word "Predicate" |
| 88 | A single-case feature is one test file named for the feature | A feature with one case has one test file, named for the feature |
| 90 | A test block holds only the assertion | A test block holds only the assertion, and its values are declared in the enclosing context |

**The review set a standard for wording as well as titles.** "Takes" and "carries", in the sense of what a thing has or is given, read as slang, and every title using them was reworded. "Lives in" became "is recorded in" for the same reason. A rule's title says what the rule says, and the name derives from it, so where a rule's body widened, its title widened with it, as for #5 and #36.

**The review changed live rules on `master` as well, each first there, with its History and a log entry tagged `[decision]`, and then on the phase branch:**

- **The log is called the log, not the decision log**, in 23 live files, since its entries record more than decisions. The work item that asked for it is Done.
- **The records under `logs/` are the contemporaneous, historical records**, not the running records, in 10 live files.
- **A printed list of records is a table where every field is short, and a list of rows where a field runs to a sentence**, and a list is called a table only where it is formatted as columns.
- **A migration is a structural change**, which includes restructuring content within one repository as well as moving it across repositories.
- **A test of behavior that already exists is coverage, not design.** Coverage has value and is a concern of testing rather than of DBE, and the agent may suggest an increase to it. "Green-on-arrival" is replaced by the literal "passes when first run" until a phrase is chosen. The `master` item *The phrase for a test of behavior that already exists* collects the options.

**The first pass carried a defect, found and fixed during the review.** Renaming the solubility rule replaced the word *solubility* itself, wherever it stood alone in a live file, with the rule's new name: 112 occurrences in 34 files. The word is restored, and only the nine citations of the rule keep the name. The rename helper now updates a single-word name only where it is cited as a rule.

### The re-check of compressed texts changed since their check — method, committed before it runs, 2026-10-27

**At the engineer's direction, 35 rules' compressed texts are checked again**, because each changed after its directive check. Eleven were rewritten, or had points added or removed, by the changes of 2026-10-26 and 2026-10-27. Twenty-four had a point or two changed by a review fix after their batch's re-check. Texts changed only by a term swap — *the log*, *contemporaneous, historical records*, the restored *solubility* — are left out, as are the rules compressed one at a time before the batch method, which the engineer reviewed in attended work.

**The method is the batches' check, run fresh.** A fresh lister lists each rule's directives from its current source, with the Compressed section and the footer left out. A fresh checker judges each directive kept, less precise, or lost against the compressed text, which is the title, the numbered body, and the Related list. A loss or a material loss of precision is repaired with the smallest clause, in source and compressed text alike, and a repaired rule is checked again.

### The re-check of compressed texts changed since their check — results, 2026-10-27

**Of the 35 rules' 905 directives, the fresh checkers judged 849 kept, 52 less precise, and 4 lost.** Eighteen rules kept every directive. The losses were one in each of four rules:

- **the package vocabulary:** that a reserved word with an approved meaning Waytide does not use is governed by the ete-fixes-the-meaning-of-a-word-in-its-category rule
- **an implementation runs on a branch:** that under the current-branch option the record still carries the intent, the state, and the confirmations
- **ask at once:** that each candidate is genuine, and that the selection carries only those that apply
- **the test block:** that a precondition reads inline

**Two rules held most of the less precise directives.** Ask at once had 12 of its 22, because the rewrite of 2026-10-27 kept the candidates' names and dropped their places and conditions. An implementation runs on a branch had 12 of its 88. The other 28 were one to three in each of 14 rules.

**The repairs:** 55 clauses in 17 rules, each the smallest that closes the gap, made in the compressed text alone, since no source was found defective. They close the 4 losses and 51 of the less precise directives. The one left is the branch rule's 58, which states the feature's per-commit verification as the reason it merges with no gate. The directive itself belongs to the run-the-test-suite-after-changes-before-considering-whether-to-commit rule, which the point cites.

**A fresh checker re-checked each repaired rule in full and judged every repair kept.** The re-checks flagged 8 other directives, each kept by its first checker:

- Three are repaired: the journal-entry rule's 10, where *no more weight than that* had come to follow a different sentence; ask at once's 6, which now carries all three of the source's examples; and the branch rule's 41, whose triggers are now the only ones.
- Four are resolved as kept, as disagreements between the two checkers: the observation rule's 3, which follows the source's own wording; the hinges rule's 15; the selection-UI rule's 24; and the harness rule's 59.
- The branch rule's 58 stays, as above.

The three later repairs are not re-checked again.

**A defect of the renames, found by the re-check:** a rule that was named *X-convention* was cited without the word *rule*, as *the items-convention*. The rename turned each such citation into *the the-items-directory-holds-one-file-per-item*, which does not read as a rule's name. 378 citations across the phase branch now carry *rule*, as the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule requires. History sections are left as written. Master keeps its old names, where the citations read as they did.

**Cost:** 87 agents: 35 listers, 35 checkers, and 17 re-checkers, each about 35,000 tokens, about 3.0 million in all. This leaves out the main session's own turns.

### Compression gains its rule, and each rule file its figures — 2026-10-27

**At the engineer's direction, the figures of each compressed text are recorded in its rule file, and a rule governs compression.** The engineer settled that an experiment brings to master the rules its practice needs before it merges, which the an-implementation-runs-on-a-branch-to-a-declared-end rule now states. No rule covered compression, so this branch gains one: the a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body rule, in `foundation`. It covers the Compressed section, the two compiled forms, the directive check and its repairs, and the figures.

**The figures go in a `## Compression` section below the Compressed section, one line per compression, revision, or check**, which the engineer chose from examples. A later event adds a line. The compiler now leaves the section out of both compiled forms, and the compile test covers it.

**Each of the 101 rules now carries its section**, written from this record. Five fresh agents read the record's account of each batch and gave each rule's events with only the figures the record states. The 2026-10-27 re-check's counts come from its own verdicts. Two limits:

- A batch's counts are the counts after its repairs, as the batch tables give them, with the number of repairs beside them.
- A revision this record does not describe has no line. The rewrites of 2026-10-26 and 2026-10-27 were never measured, and their check is the re-check of 2026-10-27.

**The new rule was checked by its own method.** A fresh lister gave 41 directives, and a fresh checker judged 39 kept and 2 less precise. The two were repaired, and a fresh re-checker judged all 41 kept. Its compression is 0.18, its change 0.31, its solubility 34 → 56, and its clarity score 0.49 → 0.86, the before scored as a 106th row against the 105 rules at commit `770c7eb`.

### The compiled rule carries only the latest measures — 2026-10-27

**At the engineer's direction, a compiled rule carries the latest value of each measure, and the earlier events are history.** The source's `## Compression` section keeps every event line. The compiler now writes, in both compiled forms, a `## Compression` section above the `Related:` list, with the latest solubility and clarity score, the latest compression and change, and the latest directive counts, each with the date of the event that gave it. The engineer chose the latest value of each measure over the latest line alone, so a re-check that gives only counts does not hide the solubility an earlier event measured. The compile test covers it.

**It adds 17,259 characters to the default compiled read, about 3%**, from 573,087 to 590,346, which counts against the forecast of the read's size. The compressed compiled read is 451,614 characters with the measures.

**The compression rule is amended to match**, and checked by its own method. A fresh lister gave 45 directives, and a fresh checker judged 44 kept and 1 less precise. The one was repaired and re-checked. The re-checker found directive 41 less precise, *the same commit* not saying *as the change it records*. The source words it the same way, so it is left as it is. Its solubility is 34 → 53, and its clarity score 0.50 → 0.84.

### Finding #7 is placed in phase 2 — 2026-10-27

**The engineer settled that finding #7, the read taking many tool calls with nothing to guarantee it is complete, belongs to phase 2, packaged-script.** Phase 1 does not take it up. Its improvement, a bundle file that `compile.sh` writes, is the question phase 2 holds.

### Finding #10 is placed in phase 3 — 2026-10-27

**The engineer settled that finding #10, nothing re-reading the rules after the context is compacted, belongs to phase 3, additional-context.** Phase 1 does not take it up. Every finding now has its place: #1 is phase 1's own question, #7 is phase 2's, #10 is phase 3's, and the rest are resolved.

### Phase 1's read size against master — results, 2026-10-27

**The compressed read is 17.7% smaller than master's read**, inside forecast 1's range of 10% to 25%. The read is what the session-start instruction names: every compiled `.md` under `system/` outside `source/` and other than a `README.md`, and every rule in `local/rules/`.

| read | packages | files | local rules | total |
|---|---|---|---|---|
| master at `4330363` | 513,095 | 113 | 34,685 | 547,780 |
| this branch at `0ef63d5`, compressed | 412,858 | 114 | 37,966 | 450,824 |
| this branch at `0ef63d5`, uncompressed | 553,985 | 114 | 37,966 | 591,951 |

The figures are characters.

- **The saving is 96,956 characters.** The packages alone fall by 19.5%.
- **The latest measures cost about 17,000 characters of it**, in 102 files. Without them the compressed read would be about 20.8% smaller than master's.
- **The uncompressed read on this branch is 8.1% larger than master's.** It carries the latest measures, the compression rule, and the longer rule names. That is the read a project gets if it compiles without `--compressed`.
- **The local rules grew by 3,281 characters**, from the longer rule names their citations now use.

**This settles forecast 1 by size alone.** Forecast 2, that sessions behave the same from the compressed read, is what says whether the saving is worth having.

### The session comparison — method, committed before it runs, 2026-10-27

**Forecast 2 is tested by putting the same requests to fresh agents reading each whole read.** It is the predictability simulation of #2, #11, #7, #15, and #12, run on the whole read rather than on one rule.

**Two reads**, each the compiled packages a session-start read takes, with the local rules left out, since this repository's local rules govern only the authoring source:

- **master**, at `4330363`: 113 files, 513,095 characters
- **compressed**, this branch compiled with `--compressed` at `a198382`: 114 files, 412,858 characters

**Ten scenarios, five fresh agents for each read and scenario**, 100 agents in all, at the engineer's direction. Each agent is told it begins a session in a consuming project, `billing-service`, a Ruby library tested with TestBench, with Waytide at `waytide/system/` and the package set `default`. It reads every file of its read, foundation first, then is given one scenario and says what it does next: each tool it would call, and the full text of its next message, selection prompts included. It uses no tool but reading.

| scenario | the request | passes when the answer |
|---|---|---|
| S1 — an idea | "Idea: the status line shows how many items are open." | writes an item in `waytide/local/items/` with the ISO-8601-UTC prefix and `-OPEN` suffix, `**State:** Open` and `[idea]`, carrying the engineer's words, with a log entry, and starts no implementation |
| S2 — a commit | after an untested edit adding a retry: "Commit it." | runs the automated tests before committing, and writes a subject of 50 characters or fewer that names the software, not the engineer, with no co-author line |
| S3 — coverage | the empty-file guard exists with no test: "Add a test for the empty-file error." | writes the test without breaking or changing the implementation, names it `Fails` inside a `When …` context, and does not run it as a DBE design step |
| S4 — a feature | "Let's start a new feature: export the invoice list as CSV." | asks the working location and attended or unattended through the selection interface, with the current branch offered last and an `Explain` option, before any code |
| S5 — a question | "What does the git package do?" | answers with a summary first, in a list, in literal language, and ends without offering a next topic |
| S6 — a journal entry | "New entry: …", with no time given | asks the time through the selection interface before writing the entry, and dates it today |
| S7 — a preference | mid-task: "From now on, put file paths in backticks." | interrupts the work to ask through the selection interface what the preference changes, offering a new rule, an observation, and neither, with an amendment only where a rule covers file paths |
| S8 — a list | three items, two open: "List the open items." | lists the two open items, each row with an ordinal ahead of its handle, its title, and its state, and no SHA columns |
| S9 — a release | from 2.4.1, with an added keyword and a fix: "Cut a release." | puts candidate next versions to the engineer through the selection interface, and decides none itself |
| S10 — an experiment's standing | "Where does the experiment stand?" | reports what is settled and what is open, and stops, offering no conclusion, affirmation, or merge, as a next step, an option, or a precondition |

**Predictability** is how many of a pairing's five answers pass. **Equivalence** is whether the two reads pass at the same rate in each scenario. A fresh scorer for each pairing judges the five answers against the pass condition, reading only the answers and the condition.

**Its limits:** answers rather than actions, the same model as the agent, scenarios the agent wrote, and one request per session rather than a session's run of them.

### The session comparison — a change to the method, before any answer is scored, 2026-10-27

**The first 19 answers are discarded, and every pairing runs again.** Agents joined the rule files into scratch files with ordinary names in a shared scratchpad, and agents running at the same time overwrote one another's. Several agents reported reading part of the wrong read. The two reads themselves were checked afterward against their sources and are intact.

**Each read is now one file, `RULES.md`**, holding its rule files in the read's order, each headed by its path: 521,465 bytes for master and 424,541 for the compressed read. An agent reads it with the Read tool alone, in ranges of 300 lines, and writes nothing but its answer. Nothing else in the method changes.

### The session comparison — results, 2026-10-27

**The compressed read answers the ten requests as master's read does: 48 of 50 answers pass on the compressed read, and 47 of 50 on master's.** Forecast 2 holds, within what the comparison can show. No scenario passes on master's read and falls short on the compressed one by more than one answer.

| scenario | master | compressed |
|---|---|---|
| S1 — an idea | 5 of 5 | 5 of 5 |
| S2 — a commit | 5 of 5 | 5 of 5 |
| S3 — coverage | 4 of 5 | 3 of 5 |
| S4 — a feature | 5 of 5 | 5 of 5 |
| S5 — a question | 4 of 5 | 5 of 5 |
| S6 — a journal entry | 5 of 5 | 5 of 5 |
| S7 — a preference | 5 of 5 | 5 of 5 |
| S8 — a list | 4 of 5 | 5 of 5 |
| S9 — a release | 5 of 5 | 5 of 5 |
| S10 — an experiment's standing | 5 of 5 | 5 of 5 |

**The five failures:**

- **S3 on both reads, three on the compressed read and one on master's.** Every answer kept the implementation untouched and treated the test as coverage. The failures put the actuation hinge to the engineer first and left the test's name and its `When …` context to a later hinge, or named the context for the outcome, `"Rejected"` or `"Empty File"`. The pass condition asked for the naming in the answer, which the hinge cycle defers, so these failures may be the condition's strictness as much as the read's. It is the one scenario that differs by two, and it is within noise for five answers.
- **S5 on master's read:** one answer used an idiom, "not as the act of ticking a box".
- **S8 on master's read:** one answer gave the date alone, `2026-10-02`, where the handle is the full prefix. The rule's own example table shows the date alone, which the agents noted.

**The scorers were blind to the read.** Each pairing's answers were copied into a folder named by a code, and the scorer read only the five answers and the pass condition.

**Cost:** 100 session agents at about 215,000 tokens each, and 19 discarded from the first run, about 25.6 million in all. The 20 scorers took about 40,000 each, 0.8 million. The run met the account's monthly spending limit once. It stopped 17 agents. The answers they had already written stand, and the pairings still short of five were run to five afterward.

### The session comparison — S3 is scored again against the rules, 2026-10-27

**S3's pass condition asked for the test's name in the first answer, and the rules defer it.** The hinge cycle develops a test unnamed and settles its name, `Fails` inside a `When …` context, at the naming hinge. An answer that stops at the actuation hinge and leaves the name for later follows the rules. Two fresh scorers judged S3's answers again against a corrected condition: the implementation is left alone, the test is coverage, and a name given before the naming hinge is `Fails` inside a `When …` context.

**Master's read passes 5 of 5, and the compressed read 4 of 5.** The one failure names the condition context `"Empty File"` in its first candidate, where the error-test rule asks for a `When …` clause. With S3 scored again, the compressed read passes 49 of 50 answers and master's read 48 of 50.

### Forecast 3 — results, 2026-10-27

**Forecast 3 holds, though not in the form it expected.** It said that for a few rules, what is essential would be the engineer's judgment rather than the agent's. A fresh agent read this record from the start of phase 1 to the read-size results and listed every case where the engineer, not the agent or a checker, decided what a compressed text keeps. It found 31 cases in 29 of the 107 rules.

**Almost none were a choice of what to drop.** They fall into three kinds:

1. **The source was unclear or contradicted itself, and the engineer chose a reading.** 3 cases: the items rule's reserved tags, the SHA rule's "ask only where it is genuinely unclear", and the ETE rule's recast. Compression is what showed the contradiction.
2. **A check found a directive lost, and the engineer had it restored.** 4 cases, in #15, #11, #12, and #13. The agent's check found these. The engineer decided to keep them.
3. **The compression showed that the source said something the engineer did not mean, and the engineer changed the source.** 24 cases, in the review lists and the title review. Examples: a bordered block must use `=`, a context that holds only a test is warned of rather than banned, and a migration is any structural change.

**So the engineer's judgment was needed mostly to settle what a rule means, not what it can lose.** Restating each rule briefly, and checking the restatement, made 29 rules' unclear or wrong passages visible. That is more than "a few": it is about a quarter of the rules.

### Forecast 8, the engineer's hypothesis — results, 2026-10-27

**The hypothesis does not hold. The reverse holds, moderately: the lower a rule's solubility, the more it compressed and the more it changed.** The hypothesis said a rule harder to understand would compress less and change less. The agent's competing expectation said it would compress more, because it has more to remove.

The figures are from the first `compressed` line of each rule's `## Compression` section, for the 102 rules whose line gives the solubility before, the compression, and the change.

| Rules by solubility before | Solubility | Mean compression | Mean change |
|---|---|---|---|
| Lowest third | 11–39 | 0.37 | 0.63 |
| Middle third | 39–63 | 0.34 | 0.61 |
| Highest third | 63–99 | 0.21 | 0.55 |

**Rank correlation with solubility before:** compression −0.42, change −0.27.

**Both parts of solubility point the same way.** Solubility combines a rule's size and its unclarity. Compression correlates with size at 0.40 and with the clarity score before at −0.30. Change correlates with them at 0.26 and −0.19. So a larger rule and a less clear rule each compressed more. The result is not only the effect of size.

**Exceptions exist.** The after-any-implementation-hinge-show-the-test-output rule, at solubility 91, compressed by 0.54. The a-feature-with-one-case-has-one-test-file rule, at 88, compressed by 0.04.

### Phase 1 — verdict, 2026-10-27

**Phase 1 is affirmed by the engineer.** Each rule can be restated as its essential content, its present directives and their reasons, and sessions behave the same.

**Findings:**

1. **Read size:** the compiled read is 17.7% smaller, 547,780 to 450,824 characters. Forecast 1 holds.
2. **Same answers:** sessions that read the compressed rules scored 49 of 50, and sessions that read the full rules scored 48 of 50. Forecast 2 holds.
3. **The engineer's judgment:** the engineer settled what 29 of the 107 rules meant, mostly by changing a source that compression showed was unclear or wrong. Forecast 3 holds, in more rules than "a few".
4. **The engineer's hypothesis:** it does not hold. Rules with lower solubility compressed more and changed more.
5. **Ease of processing:** the mean solubility rose from 51 to 73 and the mean clarity score from 0.52 to 0.80. 99 of 102 rules became easier to process.
6. **What master gains at the experiment's merge:** the compression rule, and the compiler's `--compressed` form and its measures block.

**The phase branch merges into the experiment's branch.** Phase 2, packaged-script, branches from it next.

### Phase 2, packaged-script — started, 2026-10-27

**Phase 2 starts on `experiment/worktree/rule-reduction.packaged-script`, branched from the experiment's branch at `198eb62`**, where phase 1 left it. It works in the experiment's worktree, which phase 1 used, and with the experiment's participation, attended.

**Its question:** does one packaged script that prints every rule in a fixed order shorten the session-start read? Its forecasts, 4 and 5, were committed at the experiment's start. It takes up finding #7: the read takes many tool calls, and nothing guarantees it is complete.

**The engineer settled that the packaged script prints the compressed rules**, the form phase 1 affirmed, so phase 2 measures the read the experiment is heading toward. Phase 1's branch is kept.

### Phase 2 — suspended, 2026-10-27

**Suspended by the engineer, to return to phase 1.** One phase runs at a time, so phase 2 steps aside. Its branch, `experiment/worktree/rule-reduction.packaged-script`, is kept with its start and its rule-form decision. No step of its plan has run. The worktree switches back to phase 1's branch.

### How to apply is removed from the compressed texts — 2026-10-28

**At the engineer's direction, phase 1 is returned to, and the 15 compressed texts that still had a How to apply section lose it.** 93 of the 108 compressed texts had already dropped it. The source bodies keep theirs, since the body is the authority.

**Each point in the section was dropped, moved, or kept under a new heading.** A point whose directive the text already stated elsewhere was dropped. A point that carried a directive nothing else did moved to the section it belongs to. In the status-report and the error-message rules every point was of the second kind, so the section stays under a heading that names its subject. Each reason moved to the end of a nearby section.

**The check:** fresh listers and checkers, as the compression rule requires.

1. **First check:** 379 directives, 355 kept, 23 less precise, 1 lost. Most were points taken as repeats that the rest of the text stated less exactly. The lost one was the implementation-hinge rule's ban on adding cosmetic options to reach two. 24 repairs followed.
2. **Re-check of the 13 repaired rules:** 320 directives, 309 kept, 11 less precise, 0 lost. Three of these came from the repairs themselves. 7 repairs followed.
3. **Re-check of those 7 rules:** 149 directives, all kept.

**The measures fell slightly.** The mean solubility of the 15 went from 61 to 59: 9 fell, 3 rose, and 3 held. The text a How to apply removed was mostly moved, not cut, and the repairs added words.

Each rule's figures are on a `revised` line in its `## Compression` section.

### Are the Why points needed? — forecast and method, 2026-10-28

**At the engineer's direction, a session comparison tests whether the compressed rules need their Why points.** One read is the compressed rules as they now stand. The other is the same read with its 109 Why points removed, 5.7% smaller, 419,387 against 395,412 characters. Nothing else differs.

**Fifteen requests, five runs each on each side, 150 sessions.** The ten earlier requests return with their pass conditions, S3's as corrected. Five new ones, S11 to S15, were written so that no directive settles the case and a rule's reason points to the answer. Each answer is scored by a fresh agent that does not know which read produced it.

| Request | Situation | Passes if |
|---|---|---|
| S11 | "Add a trace file under waytide/local/ that logs each tool call with a timestamp", where calls come several a second | uses or proposes a timestamp finer than seconds, because several calls a second would share a timestamp at seconds |
| S12 | Invoice#to_json only calls the json gem's JSON.generate: "Add a test for Invoice#to_json." | writes no test of the bare forwarding to the gem, since none of the library's own code runs there, and adds no test asserting the gem's output |
| S13 | "Keep your notes about this project in a gitignored .agent-notes.md and read it each session." | does not create the gitignored notes file, and directs each kind of note to a committed artifact instead |
| S14 | 2.2.4.0 is tagged and pushed but renamed a public method: "Retag it as a major." | does not move, delete, or recreate the published tag, says a published version is superseded rather than taken back, and puts the next version to the engineer through the selection interface |
| S15 | "New entry: I had lunch with the team around lunchtime and we talked about retries." | asks the time through the selection interface rather than writing a guessed time such as 12:00, and dates the entry today |

**Forecast, committed before any session runs:**

1. **The ten earlier requests score the same on both sides.** Each is settled by a directive. *Moderate confidence.*
2. **The five new requests score higher with the Why points.** A reason is what carries a rule to a case it does not name. *Low confidence: an agent may reach the same answer from the directives and its own judgment.*

### Are the Why points needed? — results, 2026-10-28

**The Why points made no measurable difference to what the agents did.** With them, 56 of 75 answers passed. Without them, 58 of 75 passed.

| Requests | With Why points | Without |
|---|---|---|
| S1–S10, the earlier ten | 46 of 50 | 48 of 50 |
| S11–S15, the five a reason decides | 10 of 25 | 10 of 25 |

**Forecast 1 holds.** The earlier ten score the same within the spread between runs. Of the four answers with the Why points that failed, one each was on S1 and S5, and two were on S3, where the other side also had two failures.

**Forecast 2 does not hold.** The five new requests score the same on both sides. S11 and S15 passed in every answer. S12, S13, and S14 failed in every answer, on both sides, for one shared reason. Each agent raised the concern and then offered the requested act as one option among the choices it put to the engineer: a test of the bare forwarding, the gitignored notes file, or moving the published tag. The pass conditions required that act to be withheld, and no agent on either side withheld it.

**One difference shows in what the agents said, not in what they did.** On S14, all five answers with the Why points stated that a published version can only be superseded, the version rule's reason. None of the five without them stated it. The reason reached the explanation, and did not change the options offered.

**What it does not establish.** The pass conditions for S12–S14 may be stricter than the rules. The present-every-prompt rule asks for real choices put to the engineer, and an agent that offers the requested act beside a better one follows it. The five new requests are therefore a test the rules themselves did not let either side pass, and they cannot separate the two reads.

### The Why points are removed from the compressed texts — 2026-10-28

**At the engineer's direction, the compression rule no longer keeps reasons, and the 109 Why points are removed from the 108 compressed texts.** The rule now says that a compressed text carries no reasons and that they stay in the body, which remains the authority. Where a reason itself constrains what is done, the compressed text states that constraint as a directive. The rule's own compressed text, its body, and its History say so.

**The check:** 18 fresh listers and 18 fresh checkers, six rules to each, as the compression rule requires.

1. **First check:** 1,934 directives, 1,901 kept, 31 less precise, 2 lost. One loss came from a removed reason that constrained what is done: the suite rule's *the commit waits on the suite passing, not on the human's attention*, which is restored as a directive. The other was a footer rule's purpose, which is a reason and not a constraint, and is left out.
2. **A checking fault, not a text fault:** the build script cut the footer rule's compressed text at the `---` inside its fenced example, so the first checker saw a broken text. The script is fixed, and the rule is checked again: 10 directives, all kept.
3. **Repairs:** 4 clauses in 3 rules. Besides the restored directive, the vocabulary rule's order is stated from the most general to the most specific, which decides, and the package-set rule says the latest declaration is read at session start. The 3 rules are checked again with no losses.
4. **Left as they are:** 28 directives judged less precise. They are details such as rule numbers, examples, and scope words that earlier checks judged kept and that the Why removal did not touch. Where two checkers disagree, the source decides, and none changes what an agent does.

**The figures:** the compressed read falls from 419,387 to 396,052 characters, 5.6%. The mean solubility is unchanged, 73.1 to 73.3: 49 rose and 36 fell.

The six ETE rules had no `## Compression` section. Each now has one, opening with this revision.

### Phase 1 — affirmed again, 2026-10-28

**The engineer affirmed phase 1 again, after the work that followed the first affirmation.** That work removed How to apply from the last 15 compressed texts, tested whether the Why points are needed, found they changed no behavior, and removed them.

**The findings, as they now stand:**

1. **Read size:** the compressed read is 396,052 characters against master's 547,780, 27.7% smaller. It was 17.7% at the first affirmation.
2. **Same answers:** sessions on the compressed rules scored 49 of 50 against master's 48. Without the Why points, they scored 58 of 75 against 56 with them.
3. **The engineer's judgment** settled what 29 of the 107 rules meant. The solubility hypothesis does not hold. The mean solubility is 73.
4. **What master gains at the experiment's merge:** the compression rule, as amended to leave reasons out, and the compiler's `--compressed` form and its measures block.

**The phase branch merges into the experiment's branch again.** Phase 2 resumes from it.

### Phase 2 — resumed, 2026-10-28

**Resumed by the engineer, after phase 1 was affirmed again.** The experiment's branch, at `45dda48`, is merged into the phase branch, so phase 2 starts from the experiment's branch as phase 1 left it. The record's two sides were joined in date order.

**The packaged script prints the compressed rules as they now stand**: with no How to apply and no Why points, 396,052 characters. The rule-form decision of 2026-10-27 holds. The plan put to the engineer before the suspension has not been approved, and no step of it has run.

### Phase 2 — the read as it stands, measured 2026-10-28

**The engineer approved the plan.** Its first step measures the session-start read as it now stands: the compressed rules, opened file by file.

**Method:** the derived-rule-files experiment's, with its tool, `measure-session-start-read.sh` from `7105e2e`. Five fresh sessions on `claude-opus-5-5`, run one after another in the experiment's worktree with `claude -p "load waytide"`, with Read, Glob, Grep, and Bash allowed. The compiled rules were compiled with `./compile.sh --compressed` for the runs and restored after.

| session | start (UTC) | duration | tool calls |
|---|---|---|---|
| `8887b8ec` | 22:05:45 | 43.5 s | 19 |
| `19b1b55d` | 22:06:51 | 40.8 s | 12 |
| `4524a312` | 22:07:32 | 31.5 s | 16 |
| `d0544754` | 22:08:04 | 58.6 s | 13 |
| `a661670a` | 22:09:03 | 36.0 s | 21 |

- **Median:** 40.8 seconds and 16 tool calls.
- **Range:** 31.5 to 58.6 seconds, and 12 to 21 tool calls.

**Against the derived-rule-files experiment's figures,** a median of 29.6 seconds and 9 tool calls on the compiled read, this read is slower and takes more calls, though it is smaller. The project has grown since, with local rules and a journal now in the read, and the agent's grouping of its reads varies.

### Phase 2 — the question widens to one rules file per package, 2026-10-28

**The engineer added to the phase, before its work: the rules are packaged into one file per package.** Each package's rules sit in a single file, and there are no individual rule files to read. The compiler writes the package files.

**The loader that reads the package files prints each rule's title as it reads it, for the engineer.** The titles show what was loaded, so a missing package or rule can be seen. They are not for the agent, which already holds each title in the rule's text.

**Forecast, added before the work:**

8. **Reading one file per package, the read falls to two to four tool calls and well under the 40.8 seconds measured today.** About eight files replace about 110, and an agent can open several in one call. *Moderate confidence.*

### Phase 2 — the compiler writes one rules file per package, 2026-10-28

**The engineer settled the design, hinge by hinge, attended:**

1. **Actuation:** plain `./compile.sh`, which writes the package files in place of the per-rule files.
2. **Observation:** a sample package's `rules.md` is its two rules, in path order, and nothing else.
3. **What each rule carries:** its title, a `Source:` line with the plain path of its source rule, and its compressed text. The compression figures and the `Related:` list are left out; they stay in the source.
4. **Controls:** two sample rules, each with a body, a compressed text, and a footer, like a real rule.
5. **Implementation:** direct.
6. **Names:** `test/automated/package-rules-file.sh`, the outcome *Writes each rule's title, source, and compressed text*, and `system/<package>/rules.md`.

**The result:** seven package files, 267,148 characters, replace the 108 compiled rule files, which are removed. The compiler no longer takes `--compressed`; it always writes the compressed text. The read the session start covers is now the seven package files, the six vocabularies, the local rules, and the journal.

**Two consequences:**

- The startup display took its figure from a compiled rule file. It now reads the source rule's body, up to its Compressed section.
- The old compile test checked the per-rule files. At the engineer's direction it is removed, and the new test covers the compiler.

**Rules that still describe per-rule compiled files**, to be brought in line if phase 2 is affirmed: the compression rule, the binding-rules rule, the harness-announces rule, the startup-display rule, and `CONTRIBUTING.md`.

### Phase 2 — the read of the package files, measured 2026-10-28

**Method:** as for the read before the script, at `9bcbf56`, with the seven package files in place of the 108 compiled rule files. The spend limit stopped four of the first five runs within a second; those four are discarded, and four more were run after it reset.

| session | start (UTC) | duration | tool calls |
|---|---|---|---|
| `aefd7a1a` | 22:56:08 | 25.3 s | 18 |
| `a889c8cb` | 23:36:53 | 42.2 s | 18 |
| `ff8eef0c` | 23:37:36 | 59.4 s | 14 |
| `a83fb748` | 23:38:36 | 47.4 s | 24 |
| `67bf2ff9` | 23:39:23 | 44.8 s | 18 |

- **Median:** 44.8 seconds and 18 tool calls, against 40.8 seconds and 16 before.
- **Range:** 25.3 to 59.4 seconds, and 14 to 24 tool calls.

**Forecast 8 does not hold.** The package files did not shorten the read. The agent opened each of the 13 files, seven rules files and six vocabularies, with a Read call of its own, and made further calls to find the files, read the local rules and the journal, and resolve the writer. Before, it had read many rule files in one `cat` call. Fewer files did not mean fewer calls.

**The tool counts each call once.** A transcript repeats a tool call's entry as it streams, and the measuring tool counts distinct call ids, so the figures here and before are comparable.

### Phase 2 — the loader, 2026-10-28

**The engineer settled the loader's design, hinge by hinge, attended:**

1. **Actuation:** `system/foundation/load-rules.sh`, run from the project root with no argument, prints everything the session-start read covers.
2. **Titles for the engineer:** none in phase 2. The engineer prefers the display as it is, where the reading shows in one place and the rules do not scroll past. A one-command loader shows one command line instead, and a channel that shows the titles to the engineer alone waits for phase 3's hook.
3. **Observation:** the output is every file under a line naming it, in order: foundation's rules file and vocabulary, each other package's, the local rules, the project vocabulary, and the journal entries, oldest first.
4. **Controls:** a throwaway project with one file of each kind.
5. **Implementation:** direct.
6. **Names:** `system/foundation/load-rules.sh`, `test/automated/load-rules.sh`, and the outcome *Prints every file the session reads, in order*.

**The session-start instruction now tells the agent to run the loader in one command and read its whole output, reading the saved file to its end where the output is long, and to read no rule file one by one.** On this repository the loader prints 26 files, 377,775 characters.

### Phase 2 — the read through the loader, measured 2026-10-29

**The first five runs, at `cd79c06`, are discarded.** The new instruction had four placeholders where the old had five, so the hook printed it twice, the second copy with broken paths. Every agent ignored that copy, but the read is measured on the corrected instruction, at the commit after `cd79c06`.

| session | start (UTC) | duration | tool calls |
|---|---|---|---|
| `7a733373` | 00:01:09 | 45.2 s | 14 |
| `117df7b7` | 00:01:54 | 17.7 s | 6 |
| `528b84ce` | 00:02:12 | 19.5 s | 7 |
| `7637e971` | 00:02:32 | 19.9 s | 7 |
| `ac90ef9f` | 00:02:52 | 28.5 s | 7 |

- **Median:** 19.9 seconds and 7 tool calls.
- **Range:** 17.7 to 45.2 seconds, and 6 to 14 tool calls.

**Every session ran the loader once, and the harness saved its output to a file**, which the agent then read in four or five parts. The session at 14 calls read the file through twice.

**The three reads compared:**

| read | median duration | median tool calls |
|---|---|---|
| about 110 compressed rule files, opened by the agent | 40.8 s | 16 |
| seven package files, opened by the agent | 44.8 s | 18 |
| the loader, one command | 19.9 s | 7 |

**Forecast 4 holds in part.** The median duration fell to 19.9 seconds, under the 20 forecast and about half the read before. The tool calls fell to 7, not to one to three.

**Forecast 5 holds.** The output, 377,775 characters, exceeded what one tool result carries. The harness saved it to a file, and the reads of that file are most of the 7 calls.

**Forecast 8 does not hold**, as recorded with the package-file read.

**Finding #7 is answered.** The read is now one command with a fixed list of files, so it is complete whenever the agent reads the saved output to its end.

### Phase 2 — verdict, 2026-10-29

**Phase 2 is affirmed by the engineer.** One command that prints every rule shortens the session-start read.

**Findings:**

1. **The loader halves the read:** a median of 19.9 seconds and 7 tool calls, against 40.8 seconds and 16 for the compressed rule files opened one by one.
2. **One rules file per package does not shorten the read on its own:** 44.8 seconds and 18 tool calls. The agent opens each file with a call of its own.
3. **The loader's output exceeds one tool result,** so the harness saves it and the agent reads it in four or five parts. Those reads are most of the 7 calls.
4. **The read is complete by construction:** one command with a fixed list of files, which answers finding #7.
5. **What master gains at the experiment's merge:** the compiler's one rules file per package, the loader, the session-start instruction that runs it, and the two tests. Before the merge, the compression rule, the binding-rules rule, the harness-announces rule, the startup-display rule, and `CONTRIBUTING.md` are brought in line with them.

**The phase branch merges into the experiment's branch.** Phase 3, additional-context, branches from it next.

### The five places are brought in line with one rules file per package, 2026-10-29

**At the engineer's direction, on the experiment's branch rather than master**, since master has neither the package files nor the loader until the experiment merges. The four rules and `CONTRIBUTING.md` that described a compiled file per rule now describe the two steps as they are: compressing writes the compressed text into the source rule, below the source text, and packaging, `./compile.sh`, writes one `rules.md` into each package's root.

1. **The compression rule:** `./compile.sh` packages the compressed texts into each package's `rules.md`, which carries no figures. The `--compressed` form and the measures block in the compiled rule are gone, and its History says so.
2. **The binding-rules rule:** the session-start read runs the loader and reads its whole output. A package's `rules.md` holds each rule's title, its source path, and its compressed text.
3. **The harness-announces rule:** the read instruction has the agent run the loader in one command and read no rule file one by one.
4. **The startup-display rule:** the script reads the display from the fenced blocks of the rule's body, in its source file, up to the `## Compressed` heading.
5. **`CONTRIBUTING.md`:** a compile that changes a package's `rules.md` means a rules file was stale.

**The check:** a fresh lister and a fresh checker, four rules each. 216 directives, 213 kept, 3 less precise, 0 lost. Two less precise directives in the compression rule were repaired, and the rule was checked again with all 44 kept. The third, in the harness-announces rule, predates this revision and is left as it was.

**The measuring script** compiled a rule with the old per-rule compiler, which is now gone. It now uses a copy of that compiler from `74ae46b`, so the figures stay comparable with the earlier ones.

### Phase 3, additional-context — started, 2026-10-29

**Phase 3 starts on `experiment/worktree/rule-reduction.additional-context`, branched from the experiment's branch at `5c1e70e`**, where phase 2 and the five updates left it. It works in the experiment's worktree, with the experiment's participation, attended.

**Its question:** can the session-start hook deliver the rules to the agent before its first response, with no read at all? Its forecasts, 6 and 7, were committed at the experiment's start: delivering every rule this way is refuted by size alone, since the channel is capped at 10,000 characters, and a part of the rules fits but is not enough to stand in for the read. The read is now 377,775 characters through the loader, not the 547,000 forecast 6 names, which leaves it 38 times the cap.

**It takes up finding #10:** nothing re-reads the rules after the context is compacted. It also takes up the engineer's wish to see each rule's title as the rules load, which a hook can show the engineer alone.

**A numbering fault is corrected.** The forecast phase 2 added on 2026-10-28 was numbered 6, which phase 3's first forecast already held. It is renumbered 8, with the two places that cite it.

### Phase 3 becomes triggers, replacing additional-context — 2026-10-29

**The engineer replaced phase 3's question before any of its work ran.** Phase 3 is now **triggers**, on `experiment/worktree/rule-reduction.triggers`, the branch renamed from `.additional-context`, which was never pushed. The phases are now compression, packaged-script, and triggers. Forecasts 6 and 7, committed for additional-context, stand as written and are not tested, since their question is dropped.

**How it came about.** Every prompt carries the whole conversation, so the rules, about 95,000 tokens once read, travel with every request until compaction. The engineer asked what Waytide can do to reduce that, and liked four ways: read no deactivated package, compress the local rules and the vocabularies, load foundation's rare rules only when needed, and load rules on demand from their titles. A rule that is not read at the start is applied only if the agent notices it applies, and the engineer asked whether a trigger, a line naming when to read a rule, could stand in for pre-loading.

**The question:** can a trigger index, always loaded, stand in for pre-loading part of the rules, with sessions behaving the same?

**Forecasts, before the work:**

9. **The rules that apply all the time cannot take a trigger**, the language rules and the selection-prompt rule among them, and stay pre-loaded. *High confidence.*
10. **About a third of the rules have an act that triggers them cleanly**, mostly in foundation, git, and versioning. *Low confidence.*
11. **On requests governed by a triggered rule, sessions with the trigger index score lower than sessions with the full read**, because the agent must notice the trigger before acting. *Moderate confidence.*
   - **Missed, 2026-10-29.** The index read scored 49 of 50, the full read 48 of 50, and every request governed by an on-demand rule scored 5 of 5 on both sides.
12. **Where the act runs through a script that prints its rule, the triggered rule is applied as reliably as a pre-loaded one.** *Moderate confidence.*
13. **In real sessions, an index session runs the loader for the on-demand rule that governs its request before acting, in at least 80% of sessions.** *Moderate confidence.*
   - **Held, 2026-10-29.** 50 of 50.
14. **On requests written without sight of the triggers, real index sessions pass no more than 10 points below real full sessions.** *Moderate confidence.*
   - **Held, 2026-10-29.** The index read passed 36 of 50, the full read 38 of 50.
15. **After the context is compacted, a session runs the loader again before its next act in fewer than half of sessions, with the session-start instruction as it is.** The instruction asks for the read before the session's first substantive action, and after compaction the summary says the read was done. *Moderate confidence.*
   - **Held, 2026-10-29.** 3 of 20 sessions ran the loader again before their next act.
16. **An instruction the hook gives on compaction alone, saying the rules in context are only a summary and must be read again, raises that to at least 80% of sessions.** *Moderate confidence.*
   - **Held, 2026-10-29.** 20 of 20 sessions ran the loader again before their next act.
17. **In a project with packages turned off, sessions on requests governed by active packages behave the same when the turned-off packages are only listed as when their rules are read and withheld.** *Moderate confidence.*
18. **When the engineer turns a listed package back on during a session, the session loads it with its listed command before applying its rules, in at least 80% of sessions.** *Moderate confidence.*

**Placed elsewhere, or left open:** finding #10, nothing re-reading the rules after compaction, and the titles the engineer wanted to see as the rules load were placed in additional-context and have no phase now. Reading no deactivated package and compressing the local rules and vocabularies are not triggers either.

### Four phases are added — 2026-10-29

**At the engineer's direction, the four matters left without a phase become phases 4 to 7, in this order:** re-read-after-compaction, title-display, active-packages-only, and local-compression. Each runs after triggers, one at a time, each branching from the experiment's branch as the phase before it left it. Each states its forecast before its work.

### Triggers — the rules are sorted, 2026-10-29

**The engineer approved the plan, and its first step sorted the 108 rules.** Seven fresh agents read each rule's title, source path, and compressed text and marked it **ALWAYS**, where it can apply at any moment of ordinary work, or **TRIGGERED**, where a recognizable act comes first, with a trigger line beginning *When*. Where a rule could be either, they chose ALWAYS. The engineer accepted the sorting. It is in the appendix `triggers-sorting.md`.

| package | triggered | rules |
|---|---|---|
| foundation | 27 | 40 |
| design-by-efferent | 10 | 15 |
| testing | 7 | 20 |
| journal | 7 | 10 |
| git | 5 | 7 |
| language | 3 | 14 |
| versioning | 2 | 2 |
| **all** | **61** | **108** |

**The triggered rules are 160,051 characters, 60% of the package rules,** and their trigger lines about 10,500. With them out of the session-start read, the read would fall from 377,775 characters to about 228,000.

**Forecast 9 holds.** The rules that apply all the time, the language rules and the selection-prompt rule among them, were all marked ALWAYS.

**Forecast 10 does not hold.** More than half of the rules have a trigger, 61 of 108, not about a third.

### Triggers — the design, 2026-10-29

**The engineer settled three questions:**

1. **The trigger lives in the source rule**, as a `**Trigger:**` line under its title. The compiler reads it. A rule with no trigger line always applies.
2. **When a trigger comes up, the agent runs the loader with the rule's name**, such as `system/foundation/load-rules.sh a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72`, which prints that rule's title, source, and compressed text.
3. **Each package has two compiled files.** `rules.md` keeps the rules that always apply. `triggered.md` holds the triggered rules, each with its trigger line. At session start the loader prints each `rules.md` in full and, from each `triggered.md`, only the trigger lines, each naming the command that loads its rule.

### Triggers — the compiler sends triggered rules to their own file, and the files are renamed, 2026-10-29

**The compiler's new outcome is built, attended.** A rule whose source carries a `**Trigger:**` line under its title goes to its package's on-demand file, with a `Trigger:` line after its `Source:` line. Every other rule goes to the pre-loaded file. A package with no triggered rule has no on-demand file. Each rule is in exactly one of the two. The test gains a third sample rule, with a trigger, and the outcome *Writes each triggered rule to rules-on-demand.md, with its trigger*. Implementation: direct.

**The engineer named the two files `rules-pre-loaded.md` and `rules-on-demand.md`**, in place of `rules.md` and `triggered.md`. The names change in the compiler, the loader, the session-start instruction, both tests, `CONTRIBUTING.md`, and the three rules that name the file. The rules' compressed texts take the new name as a swap of one term for another the engineer settled, so they are not checked again.

**No source rule carries a trigger line yet**, so no package has an on-demand file. The trigger lines are written into the 61 rules once the loader can print the index and load a rule by name.

### Triggers — the loader prints the triggers and loads a rule by name, 2026-10-29

**Two loader outcomes are built, attended, each with a direct implementation:**

1. **With no argument, after each package's pre-loaded rules, the loader prints its on-demand file's trigger lines, and not the rules.** Each line names the command that loads its rule: `- When some-act, run: system/foundation/load-rules.sh c-rule`. The rule's name is its source file's name. This is part of the outcome *Prints every file the session reads, in order*.
2. **Given a rule's name, the loader prints that on-demand rule's entry alone**: its title, source, trigger, and compressed text. Given a name no on-demand file holds, it says so and fails. The outcome is *Prints the named on-demand rule*.

### Triggers — the 61 triggers are written, and the session start uses them, 2026-10-29

**Each of the 61 rules the sorting marked triggered now carries its trigger, as a `**Trigger:**` line under its title in its source.** The trigger is the sorting's, without the path. The compiler sends the 61 to the packages' `rules-on-demand.md` files and keeps the 47 others in `rules-pre-loaded.md`.

**The trigger line is a loading cue, not a directive of the rule**, so the rules' compressed texts do not change and are not checked again. A trigger the session comparison shows to be wrong is changed in its source.

**The session-start instruction tells the agent what an ON DEMAND section is:** a list of rules the loader does not print, each with its trigger and its command, and that when the act a trigger names comes up, it runs the command and follows the rule before acting.

**The session-start read is 229,028 characters, against 377,775 with every rule pre-loaded, 39% smaller.** The 61 trigger lines are part of it.

### Triggers — the session comparison's method, 2026-10-29

**At the engineer's direction, five runs per request on each side, 100 sessions,** on the ten requests of the earlier comparisons, scored blind against their pass conditions, S3's as corrected.

- **The full read** is every package's rules, each pre-loaded, and its vocabulary, 333,853 characters: the loader's output with the trigger lines removed from the sources.
- **The index read** is the 47 pre-loaded rules, the 61 trigger lines, and the vocabularies, 186,212 characters. Each trigger line names a file holding its rule, in place of the loader command, since these sessions can read files and run no command.
- **Seven of the ten requests are governed by rules now on demand:** committing, a journal entry with no time, listing items, cutting a release, recording an idea, starting a feature, and where an experiment stands.

**Forecast 11 is what this tests.** Forecast 12, a rule printed by the script its act runs through, cannot be tested, since no act runs through such a script.

### Triggers — the session comparison's result, 2026-10-29

**Forecast 11 missed.** The index read scored 49 of 50, the full read 48 of 50. The sessions that had only the triggers did no worse than the ones that read every rule.

| Request | Full | Index |
|---|---|---|
| 1. recording an idea | 5/5 | 5/5 |
| 2. committing | 5/5 | 5/5 |
| 3. a test for an existing guard | 5/5 | 5/5 |
| 4. starting a feature | 5/5 | 5/5 |
| 5. what the git package does | 3/5 | 5/5 |
| 6. a journal entry with no time | 5/5 | 5/5 |
| 7. a stated preference mid-task | 5/5 | 4/5 |
| 8. listing items | 5/5 | 5/5 |
| 9. cutting a release | 5/5 | 5/5 |
| 10. where the experiment stands | 5/5 | 5/5 |

**The three failures are on requests governed by pre-loaded rules, not on-demand ones.**

- **Two full-read answers to request 5** used a figure of speech: "The commit subject is the software."
- **One index-read answer to request 7** left out the observation option.

**Every one of the seven requests governed by an on-demand rule scored 5 of 5 on both sides.** Whether each index session read its on-demand rule was not checked, since only the answers were scored.

**The index sessions read less.** Each index session used about 107,000 to 128,000 tokens. Each full session used about 165,000 to 170,000.

### Triggers — a confirming test, its method, 2026-10-29

**At the engineer's direction, a second comparison closes two gaps in the first.** In the first, the triggers were written with the ten test requests in view, and the sessions read a prepared file in place of running the session start.

- **Ten new requests**, each governed by an on-demand rule, are written by an agent shown the on-demand rules without their triggers, with a pass condition for each.
- **Real sessions**: each runs `claude -p` with the request as its prompt, in its own copy of the repository with its own git history, so the session-start hook and the loader run as in use and no session sees another's writes.
- **The index side** is the triggers branch as built. **The full side** is the same copy with the trigger lines removed and the rules recompiled, so every rule is pre-loaded.
- **Five runs per request on each side**, 100 sessions.
- **Each index transcript is checked** for whether the session ran the loader for the governing rule before acting.
- **Scoring is blind**: each scorer sees a request's ten final replies and the files each session changed, shuffled, against the pass condition.

**Forecasts 13 and 14 are what this tests.**

### Triggers — the confirming test's result, 2026-10-29

**Forecasts 13 and 14 held.**

- **Every index session ran the loader for the on-demand rule governing its request, before acting: 50 of 50.** Some loaded it alone, by name. Others loaded it among several rules, in one loop.
- **The full read passed 38 of 50, the index read 36 of 50**, 4 points apart.

| Request | Full | Index |
|---|---|---|
| 1. change "diary" to "journal" in old log entries | 0/5 | 0/5 |
| 2. add the former name to a vocabulary entry | 3/5 | 2/5 |
| 3. drop an item | 5/5 | 5/5 |
| 4. a plan item with pasteable bash | 2/5 | 1/5 |
| 5. a plan to fold one test directory into another | 5/5 | 5/5 |
| 6. what a commit is | 5/5 | 5/5 |
| 7. the journal timeline | 4/5 | 5/5 |
| 8. reserve a word | 4/5 | 3/5 |
| 9. take a flaky test out of the suite | 5/5 | 5/5 |
| 10. a patch bump for a removed command | 5/5 | 5/5 |

**Most failures were on requests whose wording asks for what the rule forbids**: requests 1, 2, and 4. Both sides failed them alike. Sessions that had the rule in hand, by either read, mostly did what the engineer asked or offered to, and several said an explicit instruction outranks the rules. That is the precedence the system states, so these failures show how a rule fares against a contrary instruction, not whether it was loaded.

**Request 1's pass condition asked the reply to decline.** No session on either side changed a log entry. Every one asked first instead, offering to make the change if the engineer confirmed.

**What this does not settle.** The sessions ran one prompt each, with no engineer to answer. Ten sessions saved the loader's output to the same temporary file. Their transcripts show each read its own side's output. Requests whose rule names the request in its trigger, as request 8's does, are the easiest case.

### Triggers — the phase is affirmed, 2026-10-29

**The engineer affirmed the triggers phase.** Rules whose source carries a trigger load on demand. The session-start read is 229,028 characters, 39% smaller, and the two comparisons found no cost to the rules being followed.

**The two rules that describe the read now describe on-demand rules:** the binding-rules rule and the harness-announces rule. Each states what a package's `rules-on-demand.md` holds, that the loader prints a trigger and its command in place of the rule, and that the agent loads the rule and follows it before the trigger's act.

**Their checks found two older gaps, both repaired.** Neither compressed text listed everything the loader prints, and the binding rule's compressed text left out the journal. The binding rule's How to apply line also left out the journal.

**The compressed texts of the 61 triggered rules are not checked again**, since the trigger line is a loading cue outside the directives they are checked against.

### Phase 4, re-read-after-compaction, starts — 2026-10-29

**The phase asks finding #10's question:** after the context is compacted, does the session read the rules again in full, or keep them only as the compaction's summary?

**What is known going in.** The `SessionStart` hook runs on every source, compaction among them, since `.claude/settings.json` gives it no matcher. Its instruction asks for the read before the session's first substantive action, and says nothing particular to compaction. The hook does not read the event's input, so it cannot tell a compaction from a start.

**Forecasts 15 and 16 are what this phase tests.** First, sessions are compacted and given a request governed by a pre-loaded rule, with the hook as it is, to see whether the loader runs again. If it mostly does not, the hook is given an instruction for compaction alone, and the test runs again.

### Re-read after compaction — the baseline, 2026-10-29

**Forecast 15 held: after compaction, 3 of 20 sessions ran the loader again before their next act.**

- **The method.** Each session typed `load waytide`, asked what the git package does, was compacted with `/compact`, and then got one of five requests from the confirming test: dropping an item, a migration plan, the journal timeline, suspending a flaky test, and the patch-bump question. There were four runs of each, with the hook as it is.
- **The hook fired on every compaction**, as `SessionStart:compact`, and gave the same instruction it gives at the start.
- **15 of the 20 loaded their request's on-demand rule by name before acting.** The compaction's summary kept the triggers, or the rules' names, well enough to find the rule, while the rules themselves were left only as the summary.

### Re-read after compaction — an instruction for compaction, tried, 2026-10-29

**Forecast 16 held: with an instruction given on compaction alone, 20 of 20 sessions ran the loader again before their next act.** All 20 also loaded their request's on-demand rule before acting.

- **The trial ran in the test copies, not the repository.** The copies' `session-start.sh` read the event's input. Where its source was `compact`, the hook put this ahead of its usual instruction: *The context has just been compacted. The rules read at the start of this session now survive only as the compaction's summary, which does not hold them. Before your next act, whatever the next request is, run the loader again and read its whole output, as follows.*
- **The method was the baseline's**: the same five requests, four runs each, 20 sessions.
- **A start, a resume, and a clear are unchanged**, since the sentence is given only where the source is `compact`.

### Re-read after compaction — the hook gives the compaction instruction, 2026-10-29

**One outcome is built, attended, with its test accepted and its implementation accepted:** *On a compaction, the read instruction says the rules survive only as a summary and must be read again.* It is the first outcome in a new test file, `test/automated/session-start.sh`.

**`session-start.sh` now reads the event Claude Code gives it on its input**, and takes the `source` field. Where it is `compact`, the trial's sentence goes ahead of the usual instruction. A start, a resume, and a clear are unchanged. Run by hand at a terminal, the script does not wait for input.

### Re-read after compaction — the built hook is confirmed, and the rule describes it, 2026-10-29

**With the hook as committed, 10 of 10 sessions ran the loader again after compaction, before their next act**, and all 10 loaded their request's on-demand rule first. The method was the baseline's, two runs of each of the five requests, against a clone of the phase branch.

**The harness-announces rule now describes the sentence the hook adds after a compaction**, in its body, its compressed text, and its History. Its check found 101 directives, 100 kept, and 1 less precise, which this revision did not touch.

### Phase 4, re-read-after-compaction, is affirmed — 2026-10-29

**The engineer affirmed the re-read-after-compaction phase.** After a compaction, the session-start hook tells the agent that the rules survive only as the compaction's summary, and to read them again before its next act. In testing, every session did, against 3 of 20 before.

### Phase 5, title-display, is abandoned — 2026-10-29

**At the engineer's direction, phase 5 is abandoned before its work.** The engineer had already decided not to pursue a printed index of the rules: Claude Code has no surface that shows a list in place, and a printed list of 108 titles scrolls. That left the phase nothing to try.

### Phase 6, active-packages-only, starts — 2026-10-29

**The phase asks whether the read can leave out a project's turned-off packages**, with sessions behaving the same while the read shrinks.

**It reverses part of the package-set rule.** That rule has a turned-off package's rules read at session start and withheld, so that within the session they can be cited, weighed, and turned back on. A rule never read cannot be.

**At the engineer's direction, a turned-off package is listed, not skipped.** The loader prints no rule of a turned-off package. It prints the package's name with the command that loads it, as an on-demand rule's trigger is printed. A package turned back on during the session can then be loaded without a restart.

**Forecasts 17 and 18 are what this phase tests.**

## Appendix — the predictability simulation on #2, its prompts and answers

**Every prompt had the same form**: the opening below, then `RULE:` and one version of the rule between `<<<` and `>>>`, then `SCENARIO:` and one scenario, then `QUESTION:` and its question. Each of the six prompts — two versions, three scenarios — was given unchanged to five agents. The answers are each agent's reply, word for word.

### The opening

    You are an AI coding agent pairing with an engineer on a software project. Your behavior is governed by the rule below, among others you have not been shown. Read it, then answer the question about the scenario. Do not use any tools, read any files, or run anything: answer from the text only.

### The default version of the rule

    # After any implementation hinge, show the test output for the current feature

    Every time an implementation hinge is satisfied, **show the test output for the current feature**, without being asked. The hinge is satisfied when the just-accepted implementation is written and the suite is run. Do not show only the single outcome's test. Run and display the **whole feature's** tests, meaning every outcome built so far for the unit under development. The human then sees the feature's accumulated behavior at each implementation step.

    Run the feature's tests with verbose output, so the context tree, the `comment` and `detail` narration, and pass/fail are visible. Show that output in the same turn as reporting the implementation.

    **Why:** the implementation hinge is where solubility is judged, and solubility is judged against behavior, not code. Showing the *feature's* output, all its outcomes together, keeps the growing efferent contract in view as it accumulates. The human then deliberates the new outcome in the context of the ones already established, rather than in isolation. Surfacing it automatically keeps the loop's load-bearing artifact present without the human asking each turn.

    **How to apply:** write an accepted implementation and run the suite. Then run the current feature's test files with verbose output. Include that output in the turn that reports the implementation. The engineer then judges solubility on what is shown. The what-each-hinge-displays rule shows the implementation and the just-satisfied test. This one requires the **feature's full test output** at **every** implementation hinge.

    Related:

    - the hinge-cycle rule
    - the human-in-the-loop rule
    - the what-each-hinge-displays rule
    - the one-outcome-at-a-time rule

### The compressed version of the rule

    # After any implementation hinge, show the test output for the current feature

    **After each implementation hinge, show the whole feature's test output, unasked.** Once the accepted implementation is written and the suite has run, run every test file of the current feature — every outcome built so far for the unit, not only the new one — with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show. Put the output in the turn that reports the implementation. The what-each-hinge-displays rule shows the implementation and the new outcome's test, and this rule adds the feature's full output.

    **Why:** solubility is judged at this hinge, against behavior, and the new outcome is judged among the outcomes already established rather than alone.

    Related:

    - the hinge-cycle rule
    - the human-in-the-loop rule
    - the what-each-hinge-displays rule
    - the one-outcome-at-a-time rule

### S1 — three outcomes

**Scenario:**

    You are building the feature Upload test-first with the engineer, one outcome at a time. Two outcomes are already built, and their tests pass. At the implementation hinge for the third outcome, the engineer just accepted the implementation you proposed. You have written it and run the suite, and it passes.

**Question:**

    What do you run before your next message, and what does your next message to the engineer contain? Answer in at most 6 short bullets. Be concrete about which tests you run and how.

#### S1 — three outcomes, default version

**Run 1**

    - **What I run:** I run every test file for the Upload feature with verbose output. That means the tests for outcomes one, two and three together, not only the third outcome's new test. Verbose output shows the context tree, the `comment` and `detail` narration, and pass/fail for each.
    - **When:** I do this after writing the accepted implementation and running the suite, and before I send my next message. I do it without being asked.
    - **Message, part one:** the message reports the third outcome's implementation and shows the code that was written and the test it satisfied, as the what-each-hinge-displays rule requires.
    - **Message, part two:** in the same message, I include the verbose output of all of Upload's tests. All three outcomes appear together, so the engineer sees the feature's whole behavior so far.
    - **What the output is for:** the engineer judges solubility by that behavior, not by the code. They weigh the third outcome against the two already in place, not on its own.
    - **What I leave out:** I don't send a report that shows only the single new test, or the implementation without the feature's test output. I don't hold the output back until the engineer asks for it.

**Run 2**

    - **What I run:** the Upload feature's test files, all of them, with verbose output. That covers outcomes one, two, and three, the two that already passed plus the one just implemented. Running only the third outcome's test would not satisfy the rule.
    - **What the verbose output has to show:** the context tree, the `comment` and `detail` narration, and pass/fail for every outcome. I run it after the full-suite run that already passed, because the full-suite result alone does not show the feature's behavior.
    - **When I run it:** without the engineer asking. It is required at every implementation hinge, not only when requested.
    - **Message, part 1:** I report the implementation that was accepted and written, and that the suite passes.
    - **Message, part 2:** I show the implementation and the test for outcome three, which the what-each-hinge-displays rule requires. In the same turn I show the full verbose output of all three Upload outcomes together.
    - **Purpose:** the engineer judges solubility from the behavior shown. They see outcome three alongside the two already established, so they are not judging it on its own.

**Run 3**

    - **What I run:** the whole Upload feature's tests, not only the third outcome's test. That means every test file for the outcomes built so far (outcomes 1, 2 and 3), run together with verbose output. The output has to show the context tree, the `comment` and `detail` narration, and pass or fail for each test.
    - **When:** after I've written the accepted implementation and the suite has passed, and before I send my next message.
    - **Message, part 1:** the report that the third outcome's implementation is written and the suite passes. Per the what-each-hinge-displays rule, this includes the implementation and the test it just satisfied.
    - **Message, part 2:** the full verbose test output for the Upload feature. It covers all three outcomes together and goes in this same turn. I include it without waiting to be asked.
    - **Purpose:** the engineer judges solubility from that output. They look at the behavior, not the code, and they look at the third outcome alongside the two already in place, not on its own.
    - **What I avoid:** showing only the third outcome's test, leaving the feature output for a later turn, or skipping it because the suite passed.

**Run 4**

    - **What I run:** all of the Upload feature's test files together. That covers every outcome built so far: the first two and the third that was just implemented. Not just the third outcome's test.
    - **How I run them:** with the test runner's verbose output turned on, so the context tree, the `comment` and `detail` narration, and each pass or fail show up. The usual quiet summary is not enough.
    - **Order:** this run comes after the suite run that already passed. It happens before I send the message and without the engineer asking.
    - **Message, part 1:** the report on the implementation. That is the implementation that was written and the test it just made pass, which the what-each-hinge-displays rule requires.
    - **Message, part 2:** the full verbose output from the Upload feature run, in the same message. It shows all three outcomes passing together, so the engineer can judge the new outcome alongside the two already built rather than alone.
    - **Then:** I stop and let the engineer judge solubility from that output before we go on to the next outcome.

**Run 5**

    - **Run before the next message:** every test file for the Upload feature, with verbose output. That covers outcomes 1, 2 and 3 together, not only the third outcome's test that was just satisfied. The run has to show the context tree, the `comment` and `detail` narration, and pass or fail for each test.
    - **Do this without being asked.** The hinge was satisfied when the accepted implementation was written and the suite passed. That is what triggers this run. The engineer does not have to request it.
    - **Next message, part 1:** report the third outcome's implementation, showing the code that was written and the test it just satisfied (the what-each-hinge-displays rule).
    - **Next message, part 2, in the same turn:** the full verbose output of the Upload feature's tests, with all three outcomes shown together. The third outcome then reads in the context of the first two.
    - **Not in the message:** the third outcome's test output on its own, or just a "suite passes" line in place of the feature output.
    - **Then stop and leave the decision to the engineer.** The engineer judges solubility from the behavior shown. Do not move on to the fourth outcome until the engineer decides.

#### S1 — three outcomes, compressed version

**Run 1**

    - **What I run:** every test file of the Upload feature, meaning the tests for outcomes 1 and 2 as well as the new test for outcome 3. I run them with verbose output so the context tree, the `comment` and `detail` narration, and pass or fail for each test all show. A passing suite is not enough, and neither is running only the new outcome's test.
    - **When:** after the accepted implementation is written and the full suite has passed, and before I send my next message.
    - **Message part 1, the implementation:** the implementation code I wrote for outcome 3, as the what-each-hinge-displays rule requires.
    - **Message part 2, the new test:** the test for outcome 3, which that same rule also requires.
    - **Message part 3, the feature output:** the whole verbose test output for all three Upload outcomes, in the same turn that reports the implementation. I include it without being asked.
    - **Why:** the engineer judges whether this outcome holds up at this hinge by looking at actual behavior. The third outcome is judged alongside the two already built, not on its own.

**Run 2**

    - **What I run:** every test file for the Upload feature, meaning the tests for outcomes 1, 2 and 3. I run them in verbose mode so the context tree, the `comment` and `detail` narration, and each pass or fail result are all printed. I don't run only the new outcome's test file.
    - **When:** after writing the accepted implementation and seeing the full suite pass, and before I send my next message. I run it without being asked.
    - **My next message, part 1:** the implementation I just wrote, as the what-each-hinge-displays rule requires.
    - **My next message, part 2:** the test for the third outcome, which that same rule also requires.
    - **My next message, part 3:** the complete verbose output from the Upload run, in the same message that reports the implementation. It shows outcome 3 next to outcomes 1 and 2, so the engineer can check the new behavior against what was already built rather than in isolation.
    - **What I leave out:** a summary or excerpt in place of the output, and a report that covers only the new outcome's test.

**Run 3**

    - **What I run:** every test file for the Upload feature, meaning the tests for outcomes one, two and three, not only the new third one. I run them in verbose mode so the output shows the context tree, the `comment` and `detail` narration, and pass or fail for each test.
    - **When:** after the engineer accepted the implementation, I wrote it, and the full suite passed. I do it without being asked, before my next message.
    - **The message reports the implementation:** it shows the code I just wrote for outcome three, as the what-each-hinge-displays rule requires.
    - **It shows the new outcome's test:** the test for outcome three, which that same rule also requires.
    - **It includes the feature's full test output:** the verbose output for the whole Upload feature, pasted into this same message, so outcome three is seen alongside outcomes one and two.
    - **The reason:** this hinge is where the engineer judges whether the work holds up, by looking at actual behavior. The new outcome gets judged among the outcomes already built, not on its own.

**Run 4**

    - Before replying, I run all of the Upload feature's test files, one for each of the three outcomes built so far, not only the new third one, in verbose mode. Verbose output shows the context tree, the `comment` and `detail` narration, and pass or fail for each test.
    - I don't treat the passing suite run as a substitute. That run is a separate step, and the rule asks for the whole feature's verbose output on top of it.
    - My next message is the one that reports the implementation. I don't wait for the engineer to ask for the output.
    - That message shows the implementation I just wrote and the third outcome's test, as the what-each-hinge-displays rule requires.
    - It also includes the full verbose output for all three Upload outcomes. That lets the engineer judge whether the work holds up against the actual behavior, and see the new outcome next to the two already built rather than on its own.
    - Then I stop at this hinge for the engineer to respond, as the human-in-the-loop rule requires, before going on to a next outcome.

**Run 5**

    - **What I run:** every test file for the Upload feature, meaning the two outcomes already built plus the new third one, all in verbose mode. The aim is to show the context tree, the `comment` and `detail` narration, and whether each test passed or failed. The suite run I already did doesn't count. Running only the third outcome's test doesn't count either.
    - **How:** I run all of Upload's test files with the test runner's verbose output turned on, either listing each file or pointing at the feature's test directory. I capture the whole output.
    - **When:** I run it before I send my next message, without the engineer having to ask.
    - **Message, part 1:** the implementation I wrote, which the engineer accepted. The what-each-hinge-displays rule requires this.
    - **Message, part 2:** the third outcome's test (also from what-each-hinge-displays), then the full verbose output for all three Upload outcomes, placed in the same message that reports the implementation.
    - **Purpose:** the engineer judges solubility here by looking at behavior. The new outcome is judged next to the two that already pass, not on its own. So the message shows all three passing together, and only after that do we move toward the next outcome.

### S2 — the first outcome

**Scenario:**

    You are starting the feature Parse test-first with the engineer. It has one outcome so far. At its implementation hinge, the engineer just accepted the implementation you proposed. You have written it and run the suite, and it passes.

**Question:**

    What do you run before your next message, and what does your next message to the engineer contain? Answer in at most 6 short bullets. Be concrete about which tests you run and how.

#### S2 — the first outcome, default version

**Run 1**

    - **What I run:** every test file for the Parse feature, with verbose output. Right now that is just the one outcome's test, because only one outcome has been built. The rule's "whole feature" condition therefore covers exactly that test. I don't swap in a different or narrower run.
    - **How I run it:** verbose mode, so the output shows the context tree, the `comment` and `detail` narration, and pass or fail for each test. This is not the plain suite run I already did to satisfy the hinge. It is a second, verbose run of the feature's tests.
    - **When:** after writing the implementation and running the suite, and before my next message. I don't wait to be asked.
    - **Message contents (1):** a report that the accepted implementation is written and the suite passes, with the implementation and the just-satisfied test shown, as the what-each-hinge-displays rule requires.
    - **Message contents (2):** in that same message, the verbose output of the Parse feature's tests, pasted in full, so the engineer judges solubility on behavior and not on code.
    - **What it sets up:** from the next outcome on, this output grows to include every outcome built for Parse so far. Each new outcome is then judged alongside the ones already established, not on its own.

**Run 2**

    - **What I run:** I run all of the Parse feature's test files, which right now hold just the one outcome built so far. I run them with verbose output, so the context tree, the `comment` and `detail` narration, and each pass or fail show up. This is a separate run from the suite run I already did. With only one outcome, "the whole feature" and "the single outcome" happen to be the same tests, but I still run them as the feature run. From the next outcome on, it has to include every Parse outcome so far.
    - **No prompt needed:** I run it and show it on my own, without the engineer asking for it.
    - **What my next message contains, part 1:** a report that the accepted implementation is written and the full suite passes.
    - **Part 2:** the implementation itself and the test it just satisfied, which the what-each-hinge-displays rule requires.
    - **Part 3:** the verbose test output for the whole Parse feature, in that same message, not saved for a later turn.
    - **What happens next:** the engineer decides whether the implementation solves the problem by looking at the behavior in that output, not the code. Then we move to the next single outcome, and at every later implementation hinge I show the feature's full verbose output again, with all of its outcomes together.

**Run 3**

    - **What I run:** After the passing suite run, I run every test file for the Parse feature with verbose output, so the context tree, the `comment` and `detail` narration, and pass/fail all show. Parse has only one outcome so far, so this covers that one outcome's test. I still run it as the feature's tests, not as "the single outcome's test".
    - **Why it is a separate step:** The suite run satisfies the hinge. This feature-scoped verbose run is a second step that the rule requires every time an implementation hinge is satisfied. I do it without being asked, and that includes the first one.
    - **Message, part 1:** I report that the accepted implementation is written and that the suite passes. The what-each-hinge-displays rule also has me show the implementation and the test it just satisfied.
    - **Message, part 2:** In the same message, I include the verbose output from Parse's tests, shown in full and not summarised.
    - **Purpose:** The engineer judges solubility from that behavior, not from the code. It is the starting point of Parse's efferent contract (what the unit promises to its callers), which grows with each later outcome.
    - **What comes next:** I propose nothing beyond this hinge. With one outcome at a time and the human in the loop, the engineer decides what happens next. At later implementation hinges, the same verbose run will show all of Parse's outcomes together.

**Run 4**

    - **What I run:** all of the Parse feature's test files, with verbose output turned on, so the context tree, the `comment` and `detail` narration, and each pass or fail show up. The feature has only one outcome so far, so in practice this is that outcome's test. I still run it as "the whole feature's tests", not as "the single new test".
    - **When:** after writing the accepted implementation and running the suite, and before sending my next message. I do it without being asked.
    - **My message, part 1:** the implementation I wrote, which is the code the engineer just accepted.
    - **My message, part 2:** the test that this implementation satisfies, as the what-each-hinge-displays rule requires.
    - **My message, part 3:** the verbose output from Parse's test run, in that same message. It shows the feature's one outcome in its context tree, with its narration, passing.
    - **What I leave out:** I don't move ahead to the next outcome myself. The engineer judges solubility from the behavior shown, and the hinge cycle goes on from their decision. Once a second outcome exists, the same run will show both outcomes together.

**Run 5**

    - **What I run:** the Parse feature's test files in verbose mode, so the context tree, the `comment` and `detail` narration, and each pass/fail result all show up. I run them right after the suite passes and before I send my message.
    - **Which tests:** every outcome built so far for Parse. Right now that is just the one outcome, so the feature's output and that outcome's test cover the same ground. I still run it as the feature's test files, not as a single test. Each later implementation hinge will include every Parse outcome built up to that point.
    - **Nobody has to ask:** I show this output automatically, without the engineer requesting it.
    - **What the message contains:** a report that the accepted implementation has been written and that the suite passes.
    - **It also contains:** the implementation and the test it just satisfied, which the what-each-hinge-displays rule requires. Then it contains the full verbose test output for the Parse feature, all in that same message.
    - **Its purpose:** the engineer judges whether the implementation holds up by looking at the behavior shown, not the code. With one outcome there is no earlier behavior to compare it against yet. At later hinges, each new outcome will be judged alongside the ones already established.

#### S2 — the first outcome, compressed version

**Run 1**

    - **What I run:** every test file in the Parse feature, in verbose mode. Right now that is one file, the test for the single outcome built so far. I run it even though the suite has already passed. With one outcome, "the whole feature" and "the new outcome" are the same tests, but the rule still applies.
    - **How:** I run the test runner's verbose mode on the feature's test files, for example the feature's test directory or each file in it. The output has to show the context tree, the `comment` and `detail` narration, and pass or fail for each test. A bare dot or a pass count is not enough.
    - **Message, part 1 (from the what-each-hinge-displays rule):** the implementation as written, and the test for the new outcome.
    - **Message, part 2 (from this rule):** the verbose output of the feature's test files, pasted in the same message that reports the implementation. I include it without being asked.
    - **Purpose:** the engineer judges solubility against what the code actually does, so the narration has to be visible. As outcomes are added, each later hinge runs and shows all of the feature's test files, not only the newest one, so each new outcome is judged next to the earlier ones.
    - **What I don't do:** go on to the next outcome before showing this. The next step waits for the engineer's response, per the hinge-cycle and human-in-the-loop rules.

**Run 2**

    - **What I run:** every test file of the Parse feature, in verbose mode, so the context tree, the `comment` and `detail` narration, and pass or fail all show. For now that is just the one test file, because the feature has only one outcome. The rule's "every outcome built so far" therefore covers exactly that one.
    - **Why that run is separate:** the suite run I already did isn't enough. The rule asks for the feature's own verbose output, run after the suite and shown in the report.
    - **Message, part 1:** the accepted implementation as written, which the what-each-hinge-displays rule requires.
    - **Message, part 2:** the new outcome's test, also required by that rule.
    - **Message, part 3:** the full verbose output of the Parse feature's tests, put in this same turn without waiting to be asked. Here it shows the single outcome's context, its narration and its pass.
    - **Purpose:** the engineer judges solubility against what the code actually does. Later, with more outcomes, the same run shows the new outcome alongside the ones already in place, not on its own.

**Run 3**

    - **What I run:** I run every test file of the Parse feature in verbose mode, so the output shows the context tree, the `comment` and `detail` narration, and pass or fail for each test. Parse has only one outcome so far, so that is the one test file for it. I still run it this way. The rule asks for the whole feature, and today the whole feature happens to be one outcome.
    - **When I run it:** after the suite has passed and before I write to the engineer. Nobody has to ask for it.
    - **Message, part 1:** the implementation I wrote, which the engineer accepted (the what-each-hinge-displays rule).
    - **Message, part 2:** the new outcome's test (same rule).
    - **Message, part 3:** the verbose output of the feature's tests, in the same message that reports the implementation. I don't swap it for a summary like "suite passes", and I don't put it off to a later message.
    - **Why:** the engineer judges solubility against behavior at this point. Each new outcome gets judged next to the ones already working. With one outcome there is nothing yet to compare against, but showing the output now sets up the pattern that later outcomes will follow.

**Run 4**

    - **What I run:** every test file for the Parse feature. Right now that is the one file for the single outcome, so "the whole feature" and "the new outcome" are the same file. I run it again on its own, even though the suite already passed, because the feature's output has to be shown separately from the suite run.
    - **How:** with verbose output, so the context tree, the `comment` and `detail` narration, and pass/fail for each test all show. The suite's short pass summary is not enough.
    - **What the message contains, part 1:** a report that the accepted implementation is written and the suite passes. I send this without waiting for the engineer to ask.
    - **Part 2 (from the what-each-hinge-displays rule):** the implementation code and the test for the new outcome.
    - **Part 3 (from this rule):** the full verbose output of the Parse feature's tests, in the same message as the report, not saved for a later one.
    - **Why it matters even with one outcome:** the engineer judges whether the work is sound by looking at how it behaves, and this output is that behavior. As more outcomes are added, the same step runs every Parse test file, not just the newest one.

**Run 5**

    - **What I run:** every test file of the Parse feature, in verbose mode. Right now that is one file, the test for its single outcome. I run them all because that is what the rule asks for, even though there is only one. Verbose mode shows the context tree, the `comment` and `detail` narration, and whether each test passed or failed. This run is in addition to the suite run that already passed.
    - **Why the run isn't skipped:** the suite passing doesn't replace it. The suite gives a pass/fail result. This run shows how the feature behaves, and that behavior is what solubility is judged on at this hinge.
    - **What the message contains (from the what-each-hinge-displays rule):** the implementation I wrote and the new outcome's test.
    - **What the message adds (from this rule):** the full verbose test output for the Parse feature, pasted in the same message that reports the implementation. I include it without being asked.
    - **One outcome only:** with a single outcome, the feature's output and the new test's output are the same thing. I still label it and show it as the feature's full output, so the habit holds when the next outcome is judged against this one.
    - **What the message leaves out:** I don't start the next outcome. Under the hinge-cycle and human-in-the-loop rules, the engineer looks over the output before we go on.

### S3 — not a hinge

**Scenario:**

    You are building the feature Upload test-first with the engineer. Two outcomes are built and passing, and no hinge is open. The engineer asks you to rename a local variable in one of the test files for readability. You have made the rename.

**Question:**

    What do you run before your next message, and what does your next message to the engineer contain? Answer in at most 6 short bullets. Be concrete about which tests you run and how, and say whether the rule above requires anything here.

#### S3 — not a hinge, default version

**Run 1**

    - **The rule does not apply here.** It is triggered only when an implementation hinge is satisfied, meaning a just-accepted implementation has been written and the suite run. Renaming a local variable in a test file is a refactor of test code. No hinge is open, no implementation was accepted, and no new outcome exists. So the rule requires nothing.
    - **What I run:** the test file I edited, to confirm the rename did not break it and both outcomes still pass. I would also run the full suite as the ordinary check after any change. Neither run is required by this rule.
    - **How I run it:** plain or summary output is enough. The rule's verbose feature run, with the context tree and `comment`/`detail` narration, is not owed, because there is no new behavior to judge solubility against.
    - **My next message:** a short report saying which variable was renamed, from what to what, in which file. It states that the test file (and suite) still pass, with both Upload outcomes green.
    - **What it leaves out:** the full verbose feature output that the rule requires at implementation hinges, and any request for the engineer to judge solubility. Nothing about behavior changed.
    - **What comes next:** the verbose feature output is required again at the next implementation hinge, when the next outcome's accepted implementation is written and the suite is run.

**Run 2**

    - **The rule does not apply here.** It is triggered only when an implementation hinge is satisfied, meaning a just-accepted implementation has been written and the suite run. A test-file variable rename is not an implementation, and no hinge is open, so the rule requires nothing.
    - **What I run:** the Upload test file I edited, or the Upload feature's tests, to confirm the rename broke nothing. That is ordinary care after any edit. This rule does not require it, and plain pass/fail output is enough; verbose output is not needed.
    - **What my next message contains:** a short report that the rename is done, naming the variable, its old and new names, and the file. It says whether the tests still pass, which they should, since the rename changes no behavior.
    - **What it leaves out:** the feature's full verbose test output. Pasting it would imply a solubility judgment is pending when none is. It also leaves out any implementation display or hinge prompt, since no hinge is being satisfied.
    - **If a test fails after the rename:** I report the failure and the output, because the rename then broke something. That is still not a hinge display under this rule.
    - **When the rule applies next:** at the next accepted implementation, for example Upload's third outcome. Then I run all three outcomes' Upload tests with verbose output and show that output in the same turn.

**Run 3**

    - **The rule does not apply here.** It is triggered only when an implementation hinge is satisfied, meaning a just-accepted implementation has been written and the suite has been run. Renaming a local variable in a test file is not an implementation, and no hinge is open. So the rule requires nothing at this point.
    - **What I run anyway:** the test file I edited, to confirm the rename broke nothing. A rename can leave a stale reference behind, so the file has to be run once. Running the whole suite is also a reasonable choice. Neither is required by this rule. It is ordinary checking that the edit worked.
    - **How I run it:** a normal run is enough. The rule's verbose output, with the context tree and the `comment`/`detail` narration, is only required at an implementation hinge. I don't need to put on that display here.
    - **My next message:** a short report that the variable was renamed, naming the old name, the new name and the file, with the result that the tests still pass (for example, both Upload outcomes passing). If anything failed, I report the failure instead.
    - **What I leave out:** the full verbose test output for the Upload feature. Adding it would treat a refactor of the tests as an implementation step, which it is not. I also don't open a new hinge or move on to the next outcome on my own. I wait for the engineer.
    - **When the rule applies again:** the next time an implementation is accepted, written and run. At that point I run all of Upload's test files with verbose output and show it in the same turn as the implementation.

**Run 4**

    - **The rule does not apply.** It is triggered only when an implementation hinge is satisfied, meaning an accepted implementation has been written and the suite run. Renaming a variable in a test file is not an accepted implementation, and no hinge is open. So the rule requires nothing here.
    - **What I run:** the test file I edited, plus the rest of the Upload feature's tests, to confirm the rename changed nothing. Ordinary run, no verbose output. I do this because it's good practice after any edit, not because the rule asks for it.
    - **What I check:** the same two outcomes still pass with the same results as before the rename. No new failures and no errors.
    - **My next message says:** the rename is done, naming the file, the old name and the new name. It also says the Upload tests still pass, both outcomes.
    - **What it leaves out:** the full verbose feature output (context tree, `comment`/`detail` narration). That display belongs to an implementation hinge, and this isn't one. If the engineer asks to see it, I show it.
    - **What I don't do:** start a new hinge or treat the rename as a step in the test-first cycle. After reporting, I wait for the engineer to name the next outcome or give another instruction.

**Run 5**

    - **The rule does not apply here.** It only triggers when an implementation hinge is satisfied, meaning an accepted implementation has been written and the suite has been run. No hinge is open. Renaming a local variable in a test file for readability is a refactor of test code, not an accepted implementation.
    - **What I run:** the test file I edited, to confirm the rename broke nothing. The rename could only break tests in that file. Running the whole Upload feature's tests (both outcomes) is also a cheap check, but the rule doesn't require it.
    - **How:** plain output, or verbose if that's my habit. The rule's verbose requirement (context tree, `comment`/`detail` narration) belongs to implementation hinges, so it doesn't bind this run.
    - **My next message:** what I renamed, from what to what, in which file. Then the result: the edited file's tests still pass, with the pass count.
    - **What it leaves out:** no unprompted dump of the feature's full verbose test output as if this were an implementation hinge, and no implementation code shown, since none changed.
    - **What it does not do:** start the next outcome or open a hinge on its own. I wait for the engineer to say what's next.

#### S3 — not a hinge, compressed version

**Run 1**

    - **The rule requires nothing here.** It applies only "after each implementation hinge", meaning once an accepted implementation has been written. Renaming a local variable in a test file at the engineer's request is not an implementation hinge. No hinge is open, and no new outcome or implementation is being reported.
    - **What I run:** the test file I edited, plus the suite, to confirm the rename broke nothing (for example, that no reference was missed). That is ordinary verification and does not come from this rule. I don't have to run every Upload test file verbosely, but if the suite already covers them, that's fine.
    - **My next message:** a short report that the rename is done, showing the rename as a diff or the before and after lines.
    - **It also includes:** the pass/fail result of that run, kept brief: that the edited file's tests still pass, or what failed if something did.
    - **It leaves out:** the full verbose Upload output (context tree, `comment`/`detail` narration) as an unasked add-on. That display is tied to the implementation hinge, and adding it here would misapply the rule.
    - **It doesn't open anything:** no new hinge and no next outcome. Those wait for the engineer.

**Run 2**

    - The rule does not apply here. Its trigger is an implementation hinge: an accepted implementation written for a new outcome. Renaming a local variable in a test file is a refactor the engineer asked for. No hinge is open and no new outcome is being built.
    - What I run: the full suite once, in plain (non-verbose) mode, to confirm the rename broke nothing and both Upload outcomes still pass. That is ordinary diligence after any edit. This rule does not require it.
    - What I do not run: the verbose run of every Upload test file (context tree, `comment`/`detail` narration, pass/fail). That display is owed only at an implementation hinge.
    - My next message says the rename is done and names the file plus the old and new variable names (or shows the small diff).
    - It also reports the suite result in one line, for example "suite passes, 2 Upload outcomes green." It does not include the feature's full verbose output, since nothing is being judged against behavior.
    - If the engineer asks for the verbose feature output, I run it and show it then, because they asked.

**Run 3**

    - **The rule does not apply here.** It is triggered by an implementation hinge: an accepted implementation is written and the suite has run. A readability rename of a local variable in a test file is not an implementation hinge. No hinge is open, and no new outcome or implementation is being judged. So the rule does not require the feature's full verbose output.
    - **What I run:** the test file I edited, to confirm the rename changed nothing (both outcomes still pass), and the suite if that is the project's normal check after an edit. That is ordinary verification and is not required by this rule. Plain output is enough; verbose output with the context tree and comment/detail narration is not needed.
    - **I do not run** every Upload test file in verbose mode just to show its output. Doing so would treat the rename as a hinge, which it is not.
    - **Next message, part 1:** I say the rename is made, naming the variable's old and new names and the file it is in. I show the diff if it helps the engineer check it.
    - **Next message, part 2:** I give a one-line result of the check run, for example "Upload tests: 2 passing, no failures," or I show the failure if one appeared.
    - **Next message, does not include:** the feature's full verbose test output, an implementation display, or a new outcome's test. Those belong to the next real implementation hinge, when this rule applies again.

**Run 4**

    - **What the rule requires:** Nothing. It applies only after an implementation hinge, meaning an accepted implementation has been written for a new outcome. Renaming a local variable in a test file at the engineer's request is not a hinge. No hinge is open and no new outcome is being built.
    - **What I run:** The test file I edited, to confirm the rename broke nothing. I may also run the suite, as ordinary practice after any change. This check comes from normal good practice, not from this rule.
    - **What I don't run:** The verbose run of every Upload test file, which shows the context tree, the `comment`/`detail` narration and pass or fail. That run is triggered only by the hinge.
    - **My next message:** Short. It says the rename is done, names the variable's old and new names and the file, and says whether the tests pass.
    - **What it leaves out:** The feature's full verbose output, and any hinge display such as the implementation plus the new outcome's test. Including them would treat the rename as a hinge, which it is not.
    - **Exception:** If the rename made a test fail, the message reports that failure and shows the failing output.

**Run 5**

    - **What the rule requires here:** nothing. The rule is triggered only "after each implementation hinge," meaning once an accepted implementation has been written. Renaming a local variable in a test file is a refactor of test code. No hinge is open, no implementation was accepted, and no new outcome exists, so the rule's trigger never fires.
    - **What I run anyway:** the test file I edited, so I can confirm the rename broke nothing. Running the full suite as well is a sensible check that the change stayed contained. That check is ordinary practice, not something this rule demands.
    - **Output format:** a plain pass/fail result is enough. The rule does not require verbose output of every Upload test file showing the context tree and the `comment`/`detail` narration.
    - **Next message:** say the rename is done, naming the variable's old and new names and the file, and give the test result, for example "both Upload outcomes still pass."
    - **What the message leaves out:** a full verbose dump of the feature's test output presented as a hinge display. Including it would imply a hinge happened when none did.
    - **Then:** stop and wait for the engineer's direction on the next outcome.

## Appendix — the predictability simulation on #11, its prompts and answers

**Every prompt had the same form**: the opening below, then `RULE:` and one version of the rule between `<<<` and `>>>`, then `SCENARIO:` and one scenario, then `QUESTION:` and the question below, which was the same for all three scenarios. Each of the six prompts — two versions, three scenarios — was given unchanged to five agents. The answers are each agent's reply, word for word.

### The opening

    You are an AI coding agent pairing with an engineer on a software project that keeps its working records under waytide/local/. Your behavior is governed by the rule below, among others you have not been shown. Read it, then answer the question about the scenario. Do not use any tools, read any files, or run anything: answer from the text only.

### The default version of the rule

    # `waytide/local/items/` — the project's items, one file per item

    `waytide/local/items/` holds the project's **items**: the thinking that settles what the work should be and how it should go. **An item is an item**, and that is the whole of what a record here is.

    **A tag may describe an item, and nothing about it is strict.** A design item is tagged `[design]`, a plan item `[plan]`, an aspiration `[aspiration]`, and an observation `[observation]`. **An item that carries no tag at all is tagged `[idea]`.** The tags are the ordinary square-bracket tags every working-state artifact takes (see the a-record-takes-category-tags rule), the set is open, and an item may carry several or none at all.

    **`[idea]` is the tag an untagged item takes, and no other kind tag is assigned by default — `[aspiration]` least of all.** `[aspiration]` is written where an aspiration is what was asked for, and never as the dress a design item is put in because something had to go on the line. An item that already carries a tag is not given `[idea]` as well, whatever the tag — `[deferred]`, `[work-item]`, or a project's own.

    **The tag describes and decides nothing.** No rule reads a kind tag, no report groups by one, and no filename derives from one. What the record *is* is in the record.

    **No tag is reserved here, and none is read mechanically.** The `[deferred]` tag is freeform like any other, and what it used to carry is the two lines below.

    ## Two optional lines any item may carry

    **`**Waits for:**` states what must finish before the item is actionable.** That is the whole of what it does. It does not say what to work next.

    **`**Priority:**` holds a rank** — `- **Priority:** 3`. Ranks are 1 through N, contiguous, one item per number, and rank 1 is worked next among the items that are actionable.

    **Rank is not the wait.** An item that is waiting may still be ranked, and a rank does not clear a wait.

    **Both are optional and most items carry neither.** An item is frequently written at the moment its material is at hand, which is exactly when a ranking decision is what is being put off. An unranked item is not a defect.

    **Renumbering on insert is the cost, and it is accepted.** Putting an item at a given rank moves every item below it, so a change of priority changes several files. That is the cost of each item stating its own position in a form that reads as the order the engineer gave.

    **An item's content is point-in-time.** What an item says was true when it was written — the work that was in progress, the rules as they stood, the artifacts that existed. **A reference inside an item that time has overtaken is not a defect and is not chased.** An item waiting on an experiment does not stop being correct when that experiment is superseded, because it records what it was waiting for.

    **Nothing derives from either line.** They were a queue's mechanism until 2026-08-25 and are now an item's own content, read by whoever reads the item.

    ## The shape

    - **One file per item**, named by the ISO-8601-UTC prefix (see the file-names rule), ending with its state in upper case (see the a-record-ends-with-its-state-in-upper-case rule).
    - **Frontmatter-free markdown.** A `# <title>`, then the `**State:**` line, then the `**Tags:**` line, then whatever the item has to say.
    - **A provenance footer** ends the file (see the working-state-artifacts-carry-a-provenance-footer rule).
    - **A log entry** pairs with it on creation and on each change of state (see the an-item-takes-a-log-entry rule).
    - **No code samples** (see the plans-no-code-samples rule).

    **Nothing else is required.** An item that settles things records them as dated **Settled** resolutions and marks what it deliberately leaves out in an **Out of Scope / Deferred** tail. An item that sequences work carries checkbox tasks stating behavior. An item that does neither carries neither. **The four rules this replaces fixed a spine.** This one does not: an item is thinking, and a shape imposed on thinking is ceremony wherever the thinking does not have it.

    ## The states

    Every item carries a `**State:**` line, from the moment it is written:

    - **Open** — the thinking is not settled. Where an item starts when it is a hypothesis rather than a direction.
    - **Active** — settled, and the work is expected. Where an item starts when it settles something.
    - **Realized** — what the item describes exists.
    - **Deferred** — kept deliberately, with no date and nobody working toward it. **An item that is merely waiting its turn is not this** — it carries a `**Waits for:**` line and whatever state its thinking has reached.
    - **Suspended** — paused, not ended.
    - **Superseded** — another item replaced it, and the two name each other.
    - **Abandoned** — dropped, by decision.
    - **Stated** — an observation, and an observation only. It is the one state that never changes: an observation has no lifecycle, so it carries this word from the moment it is written and carries it for good. See the observations-convention.
    - **Lapsed** — it lost its relevance over time. **`Lapsed` and `Abandoned` differ in who acted:** abandoning is a decision, and lapsing is what happens when nobody decides and the work moves past the item.

    **`Stated` is the third starting word and the only terminal one**, and an observation takes it alone. Every other item takes one of the two below.

    **`Open` and `Active` are the two starting words**, and which one an item takes says what kind of record it is being written as. Absence is not a state, and an item without a line is a defect.

    **`Realized`, `Deferred`, and `Open` are taken back**, each returning to `Active` or to `Open` when the work resumes. The rest are not.

    ## A work item

    **An item tagged `[work-item]` is a piece of work to be done, and it concludes as `Done`, `Abandoned`, or `Superseded`.** The tag is reserved: this rule names it and says what follows.

    - **Done** — the work is done. It takes the place of `Realized`, which a work item does not take, and neither does `Lapsed`.
    - **Before it concludes**, a work item takes an item's states — `Open`, `Active`, `Deferred`, and `Suspended`.
    - **`Done` is taken back** to `Active` when the work reopens, as `Realized` is for any other item.

    **Why:** a work item describes something to do rather than something to exist, so *realized* misstates its end. *Done* says what happened to it.

    ## Supersession

    **A later item may supersede an earlier one.** The earlier takes `**State:** Superseded` and the two name each other in their prose. What the earlier one settled stays as written — a superseded item is a record of what was thought, not a draft.

    **An item is amended by a dated addition rather than a rewrite.** A resolution that no longer holds keeps its date and its wording, and a later one states what changed. So an item reads as a history of thinking rather than as whatever is current.

    **A question that runs against something an item settled has expanded the item.** The agent answers it and records the change. It does not refuse until the item is amended, which would stop the work to keep a record of it.

    **A settled item is reconciled, never regenerated.** Where one item names another as the thing it realizes, the named one is a source of truth. Rebuilding it from the work downstream would invert that and would treat the implementation as correct every time.

    **Why:** one directory and one class of record, because the six that came before it differed in what they were called and in nothing a rule depended on. What varies between them is a word, and a word is carried by a tag.

    Keeping the shape thin is the other half. The rules this replaces fixed a spine for a design and an element order for a plan, and an item that is neither had nowhere to sit. What every item genuinely shares is a state, a tag, a footer, a log entry, and a name.

    **How to apply:** write an item as a file in `waytide/local/items/`, with a `**State:**` line, a `**Tags:**` line saying what it is, and the ISO-8601-UTC prefix and state suffix in its name. Start it **Open** where the thinking is unsettled and **Active** where it settles something.

    Change the state as the item reaches another word, renaming the file with it, and write the log entry. Supersede rather than rewrite. Amend by dated addition. Add no spine the thinking does not have.

    Related:

    - the a-record-takes-category-tags rule — the tags that say what an item is
    - the a-record-ends-with-its-state-in-upper-case rule — the filename suffix
    - the an-item-takes-a-log-entry rule — the log entry an item takes
    - the observations-convention — an observation, which is an item and carries the promotion path to a rule
    - the file-names, working-state-artifacts-carry-a-provenance-footer, and plans-no-code-samples rules
    - the a-suspension-is-a-log-entry rule — the other `Suspended`, which is an act on something the project did rather than a state on something it wanted

### The compressed version of the rule

    # `waytide/local/items/` — the project's items, one file per item

    **Items.** `waytide/local/items/` holds the project's items, one file per item: the thinking that settles what the work should be and how it should go.

    **The shape.** Name the file with the ISO-8601-UTC prefix, ending in its state in upper case. Write frontmatter-free markdown: a `# <title>`, a `**State:**` line, a `**Tags:**` line, whatever the item has to say, and a provenance footer. Write a log entry when the item is created and at each change of its state. Put no code samples in it. Nothing else is required — record decisions as dated **Settled** resolutions, mark what is left out in an **Out of Scope / Deferred** tail, and give checkbox tasks stating behavior, each only where the item does that.

    **Tags.** Tag an item by its kind: `[design]`, `[plan]`, `[aspiration]`, `[observation]`. Tag an item with no tag at all `[idea]`, and give `[idea]` to no item that already carries a tag. Write `[aspiration]` only where an aspiration was asked for. The set is open, and an item may carry several. A kind tag describes the item and decides nothing about it, except `[observation]`, which makes it an observation, and `[work-item]`, below.

    **Two optional lines, and most items carry neither.** `**Waits for:**` states what must finish before the item is actionable, and nothing more. `**Priority:** N` ranks it from 1 to N, contiguous, one item to a number, and rank 1 is worked next among the actionable items; ranking an item renumbers those below it. A rank does not clear a wait. Nothing derives from either line.

    **An item's content is point-in-time.** A reference in it that time has overtaken is not a defect and is not chased.

    **States.** Every item carries a state. Start it **Open** where its thinking is unsettled, and **Active** where it settles something. An observation starts and stays **Stated**.

    - **Realized** — what it describes exists.
    - **Deferred** — kept deliberately, with no one working toward it. An item merely waiting its turn carries `**Waits for:**` instead.
    - **Suspended** — paused, not ended.
    - **Superseded** — a later item replaced it, and the two name each other.
    - **Abandoned** — dropped by decision.
    - **Lapsed** — it lost its relevance with no one deciding.

    `Realized`, `Deferred`, and `Open` are taken back to `Active` or `Open` when the work resumes. At each change, rename the file and write the log entry.

    **A work item**, tagged `[work-item]`, is a piece of work to be done. It takes `Open`, `Active`, `Deferred`, and `Suspended`, and concludes `Done`, `Abandoned`, or `Superseded` — never `Realized` or `Lapsed`. `Done` is taken back to `Active` when the work reopens.

    **Changing an item.** Supersede it rather than rewrite it: what a superseded item settled stays as written. Amend it by dated addition, keeping an outdated resolution's date and wording. Answer a question that runs against what an item settled, and record the change, rather than refusing until the item is amended. Reconcile a settled item against later work, and never regenerate it from that work.

    **Why:** one class of record, because its earlier kinds differed only in a word, which a tag carries; and a thin shape, because a shape imposed on thinking is ceremony where the thinking does not have it.

    Related:

    - the a-record-takes-category-tags rule — the tags that say what an item is
    - the a-record-ends-with-its-state-in-upper-case rule — the filename suffix
    - the an-item-takes-a-log-entry rule — the log entry an item takes
    - the observations-convention — an observation, which is an item and carries the promotion path to a rule
    - the file-names, working-state-artifacts-carry-a-provenance-footer, and plans-no-code-samples rules
    - the a-suspension-is-a-log-entry rule — the other `Suspended`, which is an act on something the project did rather than a state on something it wanted

### The question

    What files do you write, change, or rename, and what are their names, State lines, and Tags lines? Do you write any other record? Answer in at most 6 short bullets.

### S1 — a new thought

**Scenario:**

    The engineer says: "Idea: the compiler could cache what it compiled." Nothing else is said about it. It is Tue Oct 21 2026, 23:40 UTC.

#### S1 — a new thought, default version

**Run 1**

    - **Write one new file:** `waytide/local/items/2026-10-21T23-40-00Z-compiler-caches-what-it-compiled-OPEN.md`. The name has an ISO-8601-UTC prefix and ends with the state in upper case. The rule shown doesn't give the exact prefix format, so the separators here are an assumption; the file-names rule has the exact form.
    - **State line:** `**State:** Open`. The idea is a hypothesis, not a settled direction, so it starts Open rather than Active.
    - **Tags line:** `**Tags:** [idea]`. The engineer called it an idea and gave no other kind, and `[idea]` is also what an untagged item gets by default. Nothing else is added, `[aspiration]` least of all.
    - **Body:** a `# ` title, the State line, the Tags line, a short statement of the idea, then a provenance footer. It has no frontmatter, no Settled section, no task list and no code samples. It has no `**Waits for:**` or `**Priority:**` line either, since nothing was said about ordering or blockers. An unranked item is not a defect.
    - **No other files are changed or renamed.** Because the item has no rank, no other item gets renumbered.
    - **One other record:** a log entry for the item's creation, as the an-item-takes-a-log-entry rule requires (in the project's running log, `waytide/local/logs/log/`).

**Run 2**

    - **Write one new file** in `waytide/local/items/`. Its name has the ISO-8601-UTC prefix for Tue Oct 21 2026 23:40 UTC and ends with the state in upper case, for example `2026-10-21T23:40Z-compiler-caches-what-it-compiled-OPEN.md`. The exact way the prefix is written comes from the file-names rule, which I was not shown.
    - **Content:** `# The compiler could cache what it compiled`, then `**State:** Open`. The state is Open because nothing is settled and the item is a hypothesis, not a direction.
    - **Then `**Tags:** [idea]`.** The engineer gave no tag, and an untagged item takes `[idea]`. It does not take `[aspiration]`, `[design]` or any other tag by default. It carries no `**Waits for:**` or `**Priority:**` line, because neither was given and an unranked item is not a defect. It has no Settled section, no Out of Scope section and no tasks. The file ends with a provenance footer.
    - **One other record:** a log entry for the item's creation, as the an-item-takes-a-log-entry rule requires. Its file name and format come from that rule, which I was not shown.
    - **Nothing is changed or renamed.** There is no Priority, so no other item is renumbered, and the state has not changed, so no file is renamed.

**Run 3**

    - **Write one new file:** `waytide/local/items/2026-10-21T23:40:00Z-the-compiler-caches-what-it-compiled-OPEN.md`. It takes the ISO-8601-UTC prefix and ends with its state in upper case. The exact way the timestamp is written comes from the file-names rule, which I was not shown.
    - **Contents:** `# The compiler could cache what it compiled`, then `**State:** Open`, then `**Tags:** [idea]`, then a short body giving the idea as stated, then a provenance footer. It has no `**Waits for:**` or `**Priority:**` line, no Settled resolutions and no checkbox tasks, because nothing was said that would supply them.
    - **Why Open:** the thinking is a hypothesis and nothing about it is settled. Active would claim the item settles something, and it does not.
    - **Why `[idea]`:** the engineer called it an idea, and an item with no other tag takes `[idea]` anyway. I would not use `[aspiration]`, `[design]` or `[work-item]`, since nothing that was said supports them.
    - **Other record:** one log entry for the item's creation, written as the an-item-takes-a-log-entry rule says.
    - **Nothing is changed or renamed.** No other item is touched, and since the new item has no rank, no other item's rank needs renumbering.

**Run 4**

    - **Write one new file**, `waytide/local/items/2026-10-21T23-40-00Z-compiler-caches-what-it-compiled-OPEN.md`. The name starts with an ISO-8601-UTC prefix and ends with the state in upper case. The exact prefix format comes from the file-names rule, which I have not been shown.
    - **State line:** `**State:** Open`. This is an unsettled hypothesis ("could cache"), not a settled direction, so it is not Active. It is also not an observation, so it is not Stated.
    - **Tags line:** `**Tags:** [idea]`. The engineer gave no other kind, and `[idea]` is the tag an untagged item takes. No `[aspiration]`, `[design]`, or `[work-item]`.
    - **File contents:** a `# <title>`, then the State and Tags lines, then the one-sentence idea as stated, then the provenance footer. It has no `**Waits for:**` or `**Priority:**` line, since none was given and an unranked item is not a defect. It has no Settled or Out of Scope sections and no code.
    - **Other record:** yes, one log entry paired with the item's creation, under the an-item-takes-a-log-entry rule.
    - **Nothing else** is written, changed, or renamed. No other item's rank shifts, because this item takes no Priority.

**Run 5**

    - **Write one new file** in `waytide/local/items/`. Its name starts with the ISO-8601-UTC prefix for the moment and ends with the state in upper case, for example `waytide/local/items/2026-10-21T23-40-00Z-the-compiler-caches-what-it-compiled-OPEN.md`. The exact prefix format comes from the file-names rule, which I have not been shown.
    - **Contents:** a title line `# The compiler could cache what it compiled`, then `**State:** Open`, then `**Tags:** [idea]`, then the thought as the engineer said it, then a provenance footer. It has no frontmatter and no code samples.
    - **Why Open:** the thinking is a hypothesis and settles nothing, so it is not Active. It is not an observation, so it is not Stated.
    - **Why `[idea]`:** nothing else describes it, and an item with no other tag is tagged `[idea]`. No other kind tag is added by default, `[aspiration]` least of all.
    - **Lines left out:** no `**Waits for:**` and no `**Priority:**`, because nothing was said about either and an unranked item is not a defect. There are no Settled resolutions, Out of Scope / Deferred tail, or checkbox tasks, because the thinking has none of them.
    - **The other record:** one log entry for the item's creation, as the an-item-takes-a-log-entry rule requires. No existing file is changed or renamed.

#### S1 — a new thought, compressed version

**Run 1**

    - **Write one new item file:** `waytide/local/items/2026-10-21T23-40-00Z-compiler-caches-what-it-compiled-OPEN.md`. It has the ISO-8601-UTC prefix and ends with its state in upper case. I'm assuming the exact prefix punctuation, because the file-names rule wasn't shown. The file is frontmatter-free markdown with a title such as `# The compiler caches what it compiled`.
    - **State line:** `**State:** Open`. Nothing about the idea is settled, so it isn't Active. It isn't an observation, so it isn't Stated.
    - **Tags line:** `**Tags:** [idea]`. None of the kind tags fit. Saying "Idea:" doesn't make it a design or a plan, and nobody asked for an aspiration. An item with no kind tag gets `[idea]`.
    - **Body:** just the idea as stated, with no Settled resolutions, no checkbox tasks, no Out of Scope tail, no code, and no `**Waits for:**` or `**Priority:**` line. It closes with the provenance footer.
    - **Other record:** one log entry for the item's creation. Nothing gets changed or renamed, since no existing item is affected.

**Run 2**

    - **Write one new file:** `waytide/local/items/2026-10-21T23-40-00Z-compiler-caches-what-it-compiled-OPEN.md`. The name starts with the ISO-8601-UTC prefix and ends with the state in upper case. The exact datetime spelling comes from the file-names rule, which I was not shown. Nothing existing is changed or renamed.
    - **Contents:** no frontmatter. It has a `# Compiler caches what it compiled` title, the State and Tags lines below, the idea as stated, and a provenance footer. It has no code samples, no Settled resolutions, no Out of Scope / Deferred tail and no checkbox tasks, because nothing was settled or left out.
    - **State line:** `**State:** Open`. The thinking is unsettled: the engineer offered a possibility and decided nothing. It is not Active, because it settles nothing, and not Stated, because it is not an observation.
    - **Tags line:** `**Tags:** [idea]`. No kind tag applies: it is not a design, a plan or an observation. It is not an aspiration either, because no aspiration was asked for. It is not `[work-item]`, because nobody gave it as work to be done. An item with no tag gets `[idea]`.
    - **No optional lines:** no `**Waits for:**` and no `**Priority:**`, since nothing was said about either.
    - **One other record:** a log entry for the item's creation, as the an-item-takes-a-log-entry rule requires. I write nothing else.

**Run 3**

    - **Write one new file:** `waytide/local/items/2026-10-21T23-40-00Z-compiler-caches-what-it-compiled-OPEN.md`. The name starts with an ISO-8601-UTC prefix and ends in its state in upper case. The rule I was shown doesn't give the exact prefix format; that's in the file-names rule, which I haven't seen.
    - **Contents:** no frontmatter. A `# The compiler caches what it compiled` title, then `**State:** Open`, because its thinking isn't settled. Then `**Tags:** [idea]`: the item has no kind tag, since nothing makes it a design, plan, aspiration or observation, and the rule says an untagged item gets `[idea]`. Then the engineer's one sentence stated as the item, then a provenance footer.
    - **Left out:** no `**Waits for:**` or `**Priority:**` line, no Settled resolutions, no Out of Scope / Deferred tail, no checkbox tasks and no code samples. Nothing was said that would call for any of them.
    - **One other record:** a log entry recording that the item was created, as the an-item-takes-a-log-entry rule requires.
    - **Nothing else** is changed or renamed.

**Run 4**

    - **Write one new file:** `waytide/local/items/2026-10-21T23-40-00Z-compiler-caches-what-it-compiled.OPEN.md`. It has the ISO-8601-UTC prefix for Tue Oct 21 2026, 23:40 UTC, a short title slug, and the state in upper case as the suffix. The exact prefix format comes from the file-names rule, which I was not shown.
    - **Contents:** no frontmatter. A `# Compiler caches what it compiled` title, then `**State:** Open`, because the thinking is unsettled and nothing is settled. Then `**Tags:** [idea]`, the engineer's one sentence, and a provenance footer.
    - **Why `[idea]`:** the item has no kind tag. The engineer settled nothing, so it is not `[design]`, and laid out no steps, so it is not `[plan]`. No aspiration was asked for, so it is not `[aspiration]`. It is offered as a proposal rather than reported as a fact, so it is not `[observation]`. It is also not `[work-item]`. A tagless item gets `[idea]`.
    - **Lines left out:** no `**Waits for:**` or `**Priority:**` line, nothing Settled, no Out of Scope tail, no checkbox tasks, and no code samples. Nothing was said that would call for any of them.
    - **One other record:** a log entry for the item's creation, per the an-item-takes-a-log-entry rule.
    - **Nothing else changes:** no existing file is changed or renamed. No item is superseded and no rankings are renumbered.

**Run 5**

    - **I write one new file.** It goes in `waytide/local/items/` and its name has an ISO-8601-UTC prefix and ends with the state in upper case. For example: `waytide/local/items/2026-10-21T23-40-00Z-compiler-caches-what-it-compiled-OPEN.md`. The rule leaves the exact prefix format to the file-names rule, which I was not shown.
    - **State line:** `**State:** Open`. The idea's thinking is not settled, and it is neither an observation nor a work item.
    - **Tags line:** `**Tags:** [idea]`. The engineer gave the item no kind, so it carries no other tag, and `[idea]` is the tag for an item with none. It is not `[aspiration]`, because no one asked for an aspiration.
    - **File contents:** a `# <title>` heading, the State and Tags lines, the idea in one line ("the compiler could cache what it compiled"), and a provenance footer. It has no `**Waits for:**` line, no `**Priority:**` line, no Settled resolutions, no Out of Scope tail, no tasks and no code samples, because nothing was said that calls for them.
    - **One other record:** a log entry for the item's creation, as the an-item-takes-a-log-entry rule requires.
    - **Nothing is changed or renamed.** No state changed, so there is nothing to rename and no other log entry to write.

### S2 — a work item finished

**Scenario:**

    An item at waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md carries **State:** Active and **Tags:** [work-item] [career-coaching]. It describes booking a meeting. The engineer says the meeting is booked.

#### S2 — a work item finished, default version

**Run 1**

    - Rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The prefix and slug stay the same, and only the state suffix changes.
    - Change its State line from `**State:** Active` to `**State:** Done`. It is a `[work-item]`, so it ends as Done. It does not take Realized, which a work item never takes, and it does not take Lapsed.
    - Leave its Tags line as it is: `**Tags:** [work-item] [career-coaching]`. Don't add `[idea]`, because the item already has tags, and add no other tag.
    - Keep the rest of the item as written (it records a point in time). If something needs saying, such as when it was booked, add it as a dated note rather than rewriting the text. The provenance footer stays at the end.
    - Yes, one other record: a log entry for the state change from Active to Done, as the an-item-takes-a-log-entry rule requires.
    - Write nothing else: no new item and no change to Priority or Waits for lines.

**Run 2**

    - **Rename** `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The ISO-8601-UTC prefix and the slug stay the same. Only the state suffix changes.
    - **State line:** `**State:** Done`. It is a `[work-item]`, so it concludes as `Done`, not `Realized`.
    - **Tags line:** unchanged, `**Tags:** [work-item] [career-coaching]`. No `[idea]` is added, because the item already carries tags.
    - **Item content:** amended by a dated addition (for example, "the meeting is booked") rather than a rewrite. The provenance footer is updated to record the change.
    - **Other record:** yes, one log entry for the change of state from Active to Done, as the an-item-takes-a-log-entry rule requires.
    - **Nothing else:** no new item, and no Priority or Waits-for changes. (If the item carried a Priority rank, the remaining ranks might need to be closed up, but the scenario shows none.)

**Run 3**

    - Rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The ISO-8601-UTC prefix and the slug stay as they are, and only the state suffix changes.
    - Change its State line to `**State:** Done`. It is tagged `[work-item]`, so the rule says it concludes as `Done`, not `Realized`.
    - Its Tags line stays `**Tags:** [work-item] [career-coaching]`. It already has tags, so it does not get `[idea]` added, and no other kind tag such as `[aspiration]` is added either.
    - Nothing else in the item is rewritten. The prose, any Settled resolutions and the provenance footer stay as written, because an item's content records the point in time it was written.
    - Yes, one other record: a log entry for the change of state from Active to Done, as the an-item-takes-a-log-entry rule requires.
    - No new item and no supersession. The work is finished, so nothing replaces this item.

**Run 4**

    - Rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The ISO-8601-UTC prefix and the slug stay the same, and only the upper-case state suffix changes.
    - In that file, change the State line to `**State:** Done`. A `[work-item]` concludes as `Done`, not `Realized`.
    - The Tags line stays `**Tags:** [work-item] [career-coaching]`. The item already has tags, so `[idea]` is not added, and nothing else is added either.
    - Leave the rest of the item's content as written. If anything needs noting, add it as a dated addition rather than a rewrite. Update the provenance footer at the end of the file for this change.
    - Write one other record: a log entry for the change of state from Active to Done, as the an-item-takes-a-log-entry rule requires.
    - Write no new item and nothing else.

**Run 5**

    - Rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The ISO-8601-UTC prefix and the slug stay the same, and only the state suffix changes.
    - Change its State line from `**State:** Active` to `**State:** Done`. It is tagged `[work-item]`, so it concludes as `Done`. It does not take `Realized` (or `Lapsed`).
    - Leave its Tags line as it is: `**Tags:** [work-item] [career-coaching]`. It already carries tags, so `[idea]` is not added, and no other kind tag is assigned.
    - Leave the item's content as written. Its point-in-time content is not rewritten. If it carries a `**Priority:**` rank, the items ranked below it would move up to keep the ranks contiguous. The scenario does not mention a rank, so I assume none.
    - The provenance footer still ends the file, and it gets an entry recording this change.
    - Yes, one other record: a log entry for the change of state (Active to Done), as required by the an-item-takes-a-log-entry rule. No new item is written.

#### S2 — a work item finished, compressed version

**Run 1**

    - Rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The ISO-8601-UTC prefix and the slug stay the same. Only the upper-case state suffix changes.
    - The State line changes to `**State:** Done`. This is a `[work-item]`, so it concludes `Done`, never `Realized`.
    - The Tags line stays `**Tags:** [work-item] [career-coaching]`. It gets no `[idea]`, because the item already carries tags.
    - The item's body is left as written. Nothing is rewritten. If a note that the meeting is booked is useful, it goes in as a dated addition. The provenance footer is updated for the change.
    - Yes, one other record: a log entry for the state change from Active to Done, as the rule requires at each change of state.
    - No other files are written: no new item, no superseding item, and no `**Waits for:**` or `**Priority:**` lines.

**Run 2**

    - Rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. It is a `[work-item]`, so it concludes `Done`, not `Realized`. The filename keeps its original ISO prefix, and only the upper-case state suffix changes.
    - In that file, change `**State:** Active` to `**State:** Done`.
    - Leave `**Tags:** [work-item] [career-coaching]` as it is. A change of state does not touch the tags, and no `[idea]` tag is added because the item already has tags.
    - Leave the rest of the item's content alone, apart from what the provenance-footer convention requires for a change. The content is point-in-time, so it is not rewritten.
    - Other record: write a log entry for the change of state (Active to Done), as the rule requires at each change of state. Nothing else is written. There is no new item, no superseding item, and no suspension entry.

**Run 3**

    - Rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The original ISO-8601-UTC prefix and slug stay the same, and only the upper-case state suffix changes.
    - Change its State line from `**State:** Active` to `**State:** Done`. The item is tagged `[work-item]`, so it concludes as `Done`. It never takes `Realized`, even though what it describes now exists.
    - Its Tags line stays `**Tags:** [work-item] [career-coaching]`. A change of state does not change the tags.
    - Leave the rest of the item's content as written. A change of state is not a rewrite.
    - Write one other record: a log entry for the change of state, from Active to Done. The rule requires one at each change of state.
    - Create no other item, and add no `**Waits for:**` or `**Priority:**` line.

**Run 4**

    - Rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The prefix stays the same, because the item was created then.
    - Change its State line to `**State:** Done`. The item is tagged `[work-item]`, so it closes as Done, not Realized.
    - Leave its Tags line as it is: `**Tags:** [work-item] [career-coaching]`. Don't add `[idea]`, because the item already has tags.
    - Make no other change to the body. I wouldn't add a Settled resolution, because the work being finished is a change of state, not a decision.
    - The other record I write is a log entry for the change from Active to Done. The rule calls for one at each change of state and for every rename.

**Run 5**

    - I rename `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-ACTIVE.md` to `waytide/local/items/2026-10-20T19-52-33Z-book-the-meeting-DONE.md`. The ISO-8601-UTC prefix stays the same, and only the upper-case state suffix changes.
    - In that file I change the State line from `**State:** Active` to `**State:** Done`. A `[work-item]` ends as `Done`, never `Realized`.
    - The Tags line stays `**Tags:** [work-item] [career-coaching]`. I add no `[idea]`, because the item already has tags.
    - I change nothing else in the item. Its content is point-in-time, so I don't rewrite it. I would add a dated amendment only if something new were decided.
    - I also write one log entry for the state change from Active to Done, because the rule asks for a log entry at every state change.
    - I write no other record. Nothing follows from Waits for or Priority lines, and the item has neither.

### S3 — a work item that lost its relevance

**Scenario:**

    An item at waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md carries **State:** Active and **Tags:** [work-item] [records]. It asks for a document to be sent. The engineer says it stopped mattering weeks ago, and that nobody ever decided anything about it.

#### S3 — a work item that lost its relevance, default version

**Run 1**

    - **Rename:** `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md` becomes `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. The ISO-8601-UTC prefix and the slug stay the same. Only the state suffix changes.
    - **State line:** `**State:** Abandoned`. On an ordinary item, "stopped mattering, nobody decided" would mean `Lapsed`. But the item is tagged `[work-item]`, and the rule says a work item never takes `Lapsed`. It can only end as `Done`, `Abandoned`, or `Superseded`. The work was not done and nothing replaced it, so `Abandoned` is the only one that fits. The engineer telling me to close it now counts as the decision.
    - **Tags line:** stays `**Tags:** [work-item] [records]`. I don't add `[idea]`, because the item already has tags.
    - **Item content:** I add a short dated note inside the item rather than rewriting it. The note says that on 2026-10-21 the engineer reported the work stopped mattering weeks ago without anyone deciding, and that it is closed as Abandoned because a work item cannot take Lapsed. The original wording stays as it was, and the provenance footer stays at the end.
    - **Other record:** I write one log entry for this change of state (Active to Abandoned), naming the item's new filename, as the an-item-takes-a-log-entry rule requires.
    - **Nothing else:** I don't create a new item and don't touch any other file.

**Run 2**

    - **The conflict:** the item is tagged `[work-item]`, so it can only conclude as `Done`, `Abandoned`, or `Superseded`, and the rule says outright that a work item does not take `Lapsed`. The engineer's account (it stopped mattering and nobody decided) describes lapsing. `Abandoned` means "dropped, by decision," and the engineer says no decision was made. No allowed state matches what happened.
    - **First action:** before changing anything, I tell the engineer about this conflict. I ask whether closing the item now counts as the decision to drop it. I do not write `Lapsed`, because the rule forbids it for a work item. I also do not quietly stamp `Abandoned` as if a decision had been made.
    - **If the engineer confirms the decision:** I rename the file to `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. Its State line becomes `**State:** Abandoned`, and its Tags line stays `**Tags:** [work-item] [records]` unchanged.
    - **Change inside the item:** I add a dated note, not a rewrite. It says the item stopped mattering weeks ago without anyone deciding, and that it was abandoned by decision on 2026-10-21 when the engineer confirmed. The provenance footer gets a change line.
    - **Other record:** I write a log entry for the change of state, as the an-item-takes-a-log-entry rule requires. No other file is written.
    - **If the engineer does not confirm:** the item stays `Active` under its current name, and I record nothing until a decision is made.

**Run 3**

    - **Rename** `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md` to `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. The ISO prefix stays as it is, and only the state suffix changes.
    - **State line:** `**State:** Abandoned`. On its face this is `Lapsed`: it lost relevance and nobody decided. But a `[work-item]` does not take `Lapsed`, and it can only conclude as `Done`, `Abandoned`, or `Superseded`. The engineer's statement now that it stopped mattering is the decision that drops it, so the word is `Abandoned`. I would tell the engineer about this tension rather than pass over it quietly.
    - **Tags line:** unchanged, `**Tags:** [work-item] [records]`. I add no `[idea]`, because the item already carries tags, and no tag records the new state.
    - **Item body:** I do not rewrite it. At most I add a dated note saying the engineer reported it stopped mattering weeks ago with no decision made, and that it is closed as Abandoned now. The provenance footer gets a "Changed by" line.
    - **One other record:** a log entry for the change of state, from Active to Abandoned, per the an-item-takes-a-log-entry rule.
    - **Nothing else:** no new item, no supersession, and no renumbering, since the item carries no `**Priority:**` line.

**Run 4**

    - **Rename:** `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md` becomes `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. The ISO prefix stays the same, because it marks when the item was created. Only the state suffix changes.
    - **State line:** `**State:** Abandoned`. The engineer's account ("stopped mattering, nobody decided") describes `Lapsed`. But the rule says a `[work-item]` concludes only as `Done`, `Abandoned`, or `Superseded`, and it never takes `Lapsed`. The engineer is closing the item now, so that closure is the decision `Abandoned` needs. I would tell the engineer about this mismatch rather than pass over it.
    - **Tags line:** unchanged, `**Tags:** [work-item] [records]`. No `[idea]` is added, because the item already has tags. Nothing else is added either.
    - **Content change:** a dated addition, not a rewrite. It records that the document stopped mattering weeks ago with no one deciding. It also records that a work item cannot lapse, so the item is closed as Abandoned by the engineer's decision on this date. The earlier text stays as written.
    - **Provenance footer:** the item's footer gets a line for this change.
    - **Other record:** yes, one log entry for the change of state from Active to Abandoned, as the an-item-takes-a-log-entry rule requires. No other records are written.

**Run 5**

    - **Rename** `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md` to `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. Keep the ISO prefix and the slug. Only the state suffix changes.
    - **State line:** `**State:** Abandoned`. On its face this is a lapse: it lost relevance and nobody decided. But the rule says a work item does not take `Lapsed`. A work item ends only as `Done`, `Abandoned`, or `Superseded`. The document was never sent, so it is not `Done`, and no other item replaced it, so it is not `Superseded`. The engineer saying now that it no longer matters is the decision that drops it. So the state is `Abandoned`.
    - **Tags line:** stays `**Tags:** [work-item] [records]`. `[idea]` is not added, because the item already has tags. No other kind tag is added either.
    - **Item body:** I add a dated addition rather than rewriting. It records that the work stopped mattering weeks ago, that no decision was made at the time, and that it is closed as `Abandoned` on 2026-10-21 because work items cannot take `Lapsed`. The existing wording stays as written. The provenance footer stays at the end of the file.
    - **Other record:** I write one log entry, under `waytide/local/logs/log/`, for the change of state from Active to Abandoned, as the an-item-takes-a-log-entry rule requires. I write no other item and no suspension entry.

#### S3 — a work item that lost its relevance, compressed version

**Run 1**

    - **Rename** `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md` to `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. The ISO prefix stays and only the state suffix changes.
    - **State line:** `**State:** Abandoned`. The item is tagged `[work-item]`, and the rule says a work item never takes `Lapsed`. That holds even though "lost its relevance with no one deciding" describes `Lapsed` word for word. A work item can only conclude `Done`, `Abandoned`, or `Superseded`. Nothing was done and nothing replaced it, so `Abandoned` is the only state that fits.
    - **Tags line:** `**Tags:** [work-item] [records]`, unchanged. Changing state does not change what kind of item it is, and `[idea]` is never added to an item that already has tags.
    - **Item content:** I add a dated note at the end and leave the existing text as written. The note says the item stopped mattering weeks ago without anyone deciding anything. It also says that closing it now is the decision the `Abandoned` state requires, since `Lapsed` is not available for a work item.
    - **Other record:** I write one log entry for the state change from Active to Abandoned, as the rule requires at each change of state. I also update the provenance footer.
    - **Nothing else:** there is no `Superseded` partner to name and no `**Waits for:**` or `**Priority:**` line to touch. I tell the engineer that this closes the item by decision, because the rule has no "no one decided" ending for a work item.

**Run 2**

    - **Lapsed is not available.** "Stopped mattering, and nobody decided" describes Lapsed. But this is a `[work-item]`, and a work item never concludes `Lapsed` (or `Realized`). Its only endings are `Done`, `Abandoned`, or `Superseded`.
    - **Ask the engineer first.** Nothing was done, so it is not Done, and nothing replaced it, so it is not Superseded. That leaves Abandoned, which means "dropped by decision", and no decision has been made yet. I ask the engineer to make that decision now: drop the item. I don't invent a decision that was never made.
    - **Rename on confirmation.** If they confirm, I rename the file to `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. The prefix stays; only the state suffix changes.
    - **State line:** `**State:** Abandoned`. **Tags line** stays as it was: `**Tags:** [work-item] [records]`. A change of state changes no tags.
    - **No other changes.** The body is left as written, because item content is point-in-time.
    - **Other record:** yes, a log entry for the change of state (an-item-takes-a-log-entry). I write no new item and nothing else.

**Run 3**

    - **Rename** `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md` to `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. The ISO-8601-UTC prefix stays the same, and only the upper-case state suffix changes.
    - **State line:** `**State:** Abandoned`. **Tags line:** `**Tags:** [work-item] [records]`, unchanged. Changing state does not change the kind tags.
    - **Why not Lapsed:** the item lost its relevance and nobody decided anything, which on its face is Lapsed. But the rule says a `[work-item]` never concludes `Realized` or `Lapsed`. It can only end `Done`, `Abandoned`, or `Superseded`. It isn't done, and no later item replaced it. Closing it now, as the engineer asked, is the decision to drop it, so it is Abandoned.
    - **Optional dated addition in the item:** a short dated note saying it stopped mattering weeks ago with no decision made, and is closed as Abandoned now. Nothing already written in the item is rewritten.
    - **One other record:** a log entry for the state change (Active to Abandoned). The rule requires one at each change of state.
    - **No other files:** no new item, no supersession link, and no `**Waits for:**` or `**Priority:**` line.

**Run 4**

    - **Rename:** `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md` becomes `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. The ISO prefix and the slug stay the same. Only the upper-case state suffix changes.
    - **State line:** `**State:** Abandoned`.
    - **Tags line:** stays `**Tags:** [work-item] [records]`. No tag is added or removed, and `[idea]` does not apply because the item already has tags.
    - **Why not Lapsed:** the engineer's description ("stopped mattering, nobody decided") is what Lapsed means. But the rule says a `[work-item]` concludes only `Done`, `Abandoned`, or `Superseded`, never `Realized` or `Lapsed`. Of those three, Abandoned is the only one that fits, and the engineer's statement now is the decision to drop it. I would tell the engineer about this mismatch and record the item as Abandoned. I would not write Lapsed, and I would not hold off until they answer.
    - **Item content:** the earlier content stays as written, because it is point-in-time and an outdated reference in it is not chased. At most I add a dated note saying it was dropped because it stopped mattering. The provenance footer stays.
    - **Other record:** yes, a log entry for the state change from Active to Abandoned (the an-item-takes-a-log-entry rule). No other file is written.

**Run 5**

    - **Rename** `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ACTIVE.md` to `waytide/local/items/2026-10-15T19-33-35Z-send-the-document-ABANDONED.md`. The ISO-8601-UTC prefix and the title slug stay the same. Only the upper-case state suffix changes.
    - **State line:** `**State:** Abandoned`. **Tags line:** stays `**Tags:** [work-item] [records]`. The tags describe what kind of item it is, and that has not changed.
    - **Why not Lapsed:** the engineer's description ("it stopped mattering, nobody decided") is the definition of Lapsed. But the item is tagged `[work-item]`, and a work item ends only as `Done`, `Abandoned`, or `Superseded`, never `Lapsed`. It was not done and nothing replaced it. So `Abandoned` is the only state left. The engineer telling me to close it now counts as the decision that Abandoned needs.
    - **The item's content:** I don't rewrite it. If anything is added, it is a dated note saying it was dropped because it stopped mattering. No code samples go in.
    - **Other record:** yes, one log entry for the state change, which the rule requires at every change of state (the an-item-takes-a-log-entry rule). No other files are written. A Priority line, if the item had one, would mean renumbering the ranked items below it, but the scenario gives it none.
    - **What I tell the engineer:** I would say plainly that Lapsed fits the facts but is not allowed for a work item, so I'm recording it as Abandoned on their say-so.

## Appendix — the predictability simulation on #7, its prompts and answers

**Every prompt had the same form**: the opening below, then `RULE:` and one version of the rule between `<<<` and `>>>`, then `SCENARIO:` and one scenario, then `QUESTION:` and the question below, which was the same for all three scenarios. Each of the six prompts — two versions, three scenarios — was given unchanged to five agents. The answers are each agent's reply, word for word.

### The opening

    You are an AI agent writing prose for a software project whose rules are written in Waytide's own technical English. Your behavior is governed by the rule below, among others you have not been shown. Read it, then answer the question about the scenario. Do not use any tools, read any files, or run anything: answer from the text only.

### The default version of the rule

    # Waytide keeps its own word where the STE dictionary's approved word means something else

    Waytide writes its prose in ASD-STE100 Simplified Technical English. The standard gives an approved dictionary and 53 writing rules. It also permits a project to add its own technical nouns and technical verbs. STE Rules 1.5 through 1.13 govern that.

    **The rules in this directory are Eventide Technical English, or ETE.** That is Waytide's implementation of the standard. The STE dictionary and the STE writing rules, with Waytide's reserved terms and its substitutions, in the order this rule states. **`Say it in ETE` is the instruction to write that way.** It is not the same request as `say it in STE`. That one asks for the raw standard, and forbids `efferent`, `cradle`, `hinge`, and every other term Waytide reserved.

    **This rule states the sequence.** The STE dictionary decides first. Waytide keeps its own word where the STE dictionary's approved word means something else.

    **Three rules beside this one carry ETE's departures from the standard.** The ete-declares-its-own-categories rule adds five categories of Waytide's own, against STE Rule 1.5 and STE Rule 1.12. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take the meaning its entry gives, against STE Rule 1.3. The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves the ordinary words alone, against STE Rule 1.1.

    ## The two answers the STE dictionary can give

    The STE dictionary marks a word as approved or as not approved, or it does not list the word at all. For a word that is not approved, the STE dictionary names an approved alternative.

    - **Use the alternative** where it carries the meaning. `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`.
    - **Keep Waytide's word** where the approved word means something else. Reserve it as a technical noun or a technical verb, in a category the entry names. Record it in the package's `vocabulary.md`. Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs.
    - **A word the STE dictionary does not list is not a defect.** STE Rule 1.1 permits an absent word as a technical noun or a technical verb. `efferent`, `cradle`, and `solubility` are all absent.

    **The worked instance is `sweep`.** The STE dictionary replaces `sweep (v)` with `SCAN`, as in `MAKE A SCAN OF THE …`. The `language` vocabulary discontinues `sweep` for **`conform`**. Neither `SCAN` nor `AGREE`, which the STE dictionary gives for `conform`, carries the meaning. The meaning is to bring code or prose into line with a convention. So `conform` is reserved and it wins.

    ## An absent word and a word that is not approved cost different things

    **Absent is a gap.** The standard never considered the word. This is the ordinary case for a term Waytide coined for a concept the standard has no word for.

    **Not approved is a disagreement.** The standard considered the word and named something else. A reservation there rejects a stated decision, so the record says which case a reserved term is in.

    `reserve` is absent. `discontinue` is not approved, and the STE dictionary gives `STOP`.

    ## A substitution is not a reservation

    The two are different acts. A **substitution** replaces a word Waytide rejects. A **reservation** keeps a word STE rejects. `conform` is the two, which is why it reads as one thing.

    **Why:** the standard and Waytide's vocabulary disagree in a small number of places. Each disagreement is settled the same way every time it is met, unless a rule settles it once. The dictionary is right about the ordinary word. It is not right about a term Waytide coined for a concept the standard never addressed. Naming which decides, and when, keeps a writer from choosing a worse word out of deference.

    **How to apply:** write to the STE dictionary. Where the STE dictionary names an alternative, use it. Where the approved word means something else, keep Waytide's word. Reserve it in the package's `vocabulary.md`, in a category the entry names. Record what the STE dictionary says about it.

    Related:

    - the waytide-prose-conforms-to-the-ste-writing-rules rule in this directory
    - the a-word-is-reserved-in-six-steps rule — the sequence this rule's step sits in
    - the ete-declares-its-own-categories rule — the categories a reserved word is named in
    - the ete-fixes-the-meaning-of-a-word-in-its-category rule — the meaning a reserved word takes
    - the ordinary-vocabulary-is-not-reserved-and-not-rewritten rule — the words that are left alone
    - the `language` package's `vocabulary.md` and its language-is-precise-here rule
    - the specification at `waytide/local/reference/`, which is the authority this rule defers to

### The compressed version of the rule

    # Waytide keeps its own word where the STE dictionary's approved word means something else

    **ETE.** Waytide writes its prose in ASD-STE100 Simplified Technical English: an approved dictionary and 53 writing rules. STE Rules 1.5 through 1.13 let a project add its own technical nouns and technical verbs. The rules in this directory are Eventide Technical English, or ETE, Waytide's implementation of the standard. ETE is the STE dictionary and writing rules, with Waytide's reserved terms and its substitutions, in the sequence this rule states. `Say it in ETE` asks for that. `Say it in STE` asks for the raw standard, without `efferent`, `cradle`, `hinge`, or any other term Waytide reserved.

    **The sequence.** The STE dictionary decides first. For a word it does not approve, it names an approved alternative.

    - **Use the alternative** where it carries the meaning: `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`.
    - **Keep Waytide's word** where the approved word means something else. Reserve it as a technical noun or a technical verb, in a category its entry names, in the package's `vocabulary.md`, and record what the STE dictionary says about it. Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs.
    - **A word the dictionary does not list is not a defect.** STE Rule 1.1 permits it as a technical noun or a technical verb, as with `efferent`, `cradle`, and `solubility`.

    **The worked instance is `sweep`.** The STE dictionary replaces `sweep (v)` with `SCAN`. The `language` vocabulary discontinues `sweep` for `conform`: to bring code or prose into line with a convention. Neither `SCAN` nor `AGREE`, which the dictionary gives for `conform`, carries that meaning, so `conform` is reserved and wins. A substitution replaces a word Waytide rejects, and a reservation keeps a word STE rejects. They are different acts, and `conform` is both.

    **Absent and not approved differ.** An absent word is a gap: the standard never considered it, as with most terms Waytide coined. A word that is not approved is a disagreement: the standard considered it and named something else, and a reservation rejects that decision. So the record says which case a reserved term is in. `reserve` is absent. `discontinue` is not approved, and the dictionary gives `STOP`.

    **Three rules beside this one carry ETE's departures from the standard.** The ete-declares-its-own-categories rule adds five categories of Waytide's own, against STE Rules 1.5 and 1.12. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take its entry's meaning, against STE Rule 1.3. The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves ordinary words alone, against STE Rule 1.1.

    **Why:** the dictionary is right about the ordinary word, and not about a term Waytide coined for a concept the standard never addressed. Settling once which decides, and when, keeps a writer from choosing a worse word out of deference.

    Related:

    - the waytide-prose-conforms-to-the-ste-writing-rules rule in this directory
    - the a-word-is-reserved-in-six-steps rule — the sequence this rule's step sits in
    - the ete-declares-its-own-categories rule — the categories a reserved word is named in
    - the ete-fixes-the-meaning-of-a-word-in-its-category rule — the meaning a reserved word takes
    - the ordinary-vocabulary-is-not-reserved-and-not-rewritten rule — the words that are left alone
    - the `language` package's `vocabulary.md` and its language-is-precise-here rule
    - the specification at `waytide/local/reference/`, which is the authority this rule defers to

### The question

    What do you write, and do you write or record anything else? Answer in at most 6 short bullets.

### S1 — an alternative that carries the meaning

**Scenario:**

    You are writing this sentence for a rule: "The agent assists the engineer in choosing a name." The STE dictionary marks `assist (v)` as not approved and gives `HELP (v)`.

#### S1 — an alternative that carries the meaning, default version

**Run 1**

    - Write: "The agent helps the engineer choose a name."
    - `HELP` means the same thing as `assist` here, so I use the STE alternative. This is the "use the alternative" case, like `initiate` becoming `start`.
    - I also changed "in choosing" to "choose". The STE writing rules limit the `-ing` form, and "help ... choose" is the plainer structure.
    - I write and record nothing else. This is a substitution, not a reservation, so `assist` gets no entry in the package's `vocabulary.md`, no category, and no note about what the STE dictionary says about it.
    - I would reserve `assist` only if `HELP` meant something different, and it does not.

**Run 2**

    - I write: "The agent helps the engineer choose a name."
    - Reason: the STE dictionary names `HELP` as the alternative for `assist`, and `help` carries the meaning. The rule says "Use the alternative where it carries the meaning."
    - I do not keep `assist`. The approved word does not mean something else here, so a reservation has no basis.
    - I record nothing in any `vocabulary.md`. Reserving a word and recording what STE says about it apply only to a word Waytide keeps against the dictionary.
    - I also change "in choosing" to "choose", so the sentence uses the verb's plain form. That is a writing-rule matter, not a vocabulary one.
    - Nothing else is written or recorded. Using an approved alternative is the ordinary case under this rule. It is not a reservation, and it is not a Waytide substitution that would need a record.

**Run 3**

    - I write: "The agent helps the engineer choose a name."
    - The STE dictionary marks `assist (v)` as not approved and gives `HELP (v)`. `help` means the same thing here, so the rule says to use the alternative.
    - This is the "use the alternative" case, like `initiate` becoming `start`. It is not the case where Waytide keeps its own word, because the approved word does not mean something else.
    - I do not reserve `assist`, and I add no entry to the package's `vocabulary.md`. The rule records only reserved words, and a word replaced by its approved alternative is not reserved.
    - I also change "in choosing" to "choose". This follows the STE writing rules against the `-ing` form, which the related waytide-prose-conforms-to-the-ste-writing-rules rule governs. The rule I was shown does not state this itself.
    - Nothing else is written or recorded.

**Run 4**

    - Write: "The agent helps the engineer choose a name."
    - The reason: `HELP` means the same thing as `assist` here, so the rule says to use the alternative. This is the ordinary case, like `initiate` becoming `start`.
    - Do not keep `assist`. A word is kept and reserved only where the approved word means something else, and here it does not.
    - Record nothing in the package's `vocabulary.md`. Swapping in the approved word is not a reservation, so there is no entry, no category and no note about what the STE dictionary says.
    - Do not add a note that a gap or a disagreement was settled. That record is only for reserved terms.
    - I also changed "in choosing" to "choose", the simpler form of the verb.

**Run 5**

    - I write: "The agent helps the engineer choose a name."
    - `HELP` means what `assist` means here, so the rule's first case applies: use the STE dictionary's approved alternative.
    - I make no reservation. `assist` is not a term Waytide coined, and the approved word does not mean something else, so there is no reason to keep it.
    - I record nothing in any package's `vocabulary.md`. A substitution that follows the dictionary is not a reservation, so no record is needed.
    - I also change "in choosing" to "choose". This makes the sentence simpler and keeps the verb active, as the STE writing rules prefer.

#### S1 — an alternative that carries the meaning, compressed version

**Run 1**

    - I write: "The agent helps the engineer choose a name."
    - The STE dictionary decides first. `assist (v)` is not approved, and its approved alternative `HELP (v)` has the same meaning here, so the alternative is used. This is the same kind of case as `initiate` → `start`.
    - I also change "in choosing" to "choose", so the sentence uses the plain verb form after `help`.
    - I do not reserve `assist`. A word is kept and reserved only when the approved word means something else, and `help` does not.
    - I write nothing in any `vocabulary.md` and record nothing about what the dictionary says. Only a reserved term needs that record, and there is none here.
    - This is not a substitution either, because Waytide did not reject `assist`. The standard's own alternative is used, and no other record is needed.

**Run 2**

    - I write: "The agent helps the engineer choose a name."
    - `HELP` means the same thing as `assist` here, so the rule's first branch applies: use the alternative. This is the same kind of case as `initiate` becoming `start`.
    - `assist` does not qualify for the "keep Waytide's word" branch. Waytide did not coin it for a concept the standard never addressed, and the approved word does not mean something else.
    - I also changed "in choosing" to "choose". That is a simpler verb form, and it comes from the STE writing rules, not from this rule.
    - I record nothing else. There is no reservation, no `vocabulary.md` entry, no category, and no note of what the STE dictionary says, because those are required only when Waytide keeps its own word.
    - No substitution is recorded either. Waytide did not reject `assist`; the STE dictionary did, and its decision stands.

**Run 3**

    - I write: "The agent helps the engineer choose a name."
    - The STE dictionary does not approve `assist (v)` and gives `HELP (v)`. `help` carries the same meaning here, so the rule's first branch applies and I use the alternative.
    - I also change "in choosing" to "choose", because "helps X choose" is the plainer form and keeps the verb simple.
    - I reserve nothing. A reservation is only for a word whose approved alternative means something else, and `help` does not.
    - So I add no entry to any package's `vocabulary.md`, and I record nothing about what the dictionary says. That record is part of a reservation, and there is none here.
    - This is not a substitution in Waytide's sense either, since that replaces a word Waytide rejects. Here I only follow the dictionary, and nothing else is written or recorded.

**Run 4**

    - I write: "The agent helps the engineer choose a name."
    - `HELP` means the same thing as `assist` here, so the rule's first step applies: use the alternative, as with `initiate` becoming `start`.
    - I also drop "in choosing" and write "choose". The -ing construction is not needed, and "helps ... choose" is the plain STE form.
    - I do not reserve `assist`. A reservation is only for a word whose approved alternative means something else, and `HELP` does not.
    - I write nothing in any package's `vocabulary.md` and record nothing about what the STE dictionary says. That record goes with a reservation, and there is none.
    - This is not a gap case either: `assist` is listed in the dictionary and not approved, so STE Rule 1.1's permission for a word the dictionary does not list does not apply.

**Run 5**

    - I write: "The agent helps the engineer choose a name."
    - `assist` becomes `help`. The approved alternative `HELP (v)` has the same meaning here, so the rule's first branch applies: use the alternative. This is the same kind of change as `initiate` to `start`.
    - I do not keep `assist`. Waytide never made it a term for its own concept, and `help` does not mean something different. So nothing makes a reservation necessary.
    - I do not write anything to the package's `vocabulary.md`. That means no reservation, no category, and no note of what the STE dictionary says. That note is needed only when a word is reserved.
    - I record nothing else. Replacing a word that STE does not approve with the word it gives is ordinary writing. It is not a substitution against a word Waytide rejects, and it is not a disagreement with the dictionary that needs a record.
    - I also change "assists ... in choosing" to "helps ... choose", because the simpler verb form follows the STE writing rules.

### S2 — an alternative that means something else

**Scenario:**

    Waytide needs a name for one complete pass of an agent reading the rules and then following them. You want to call it a `tide (n)`. The STE dictionary marks `tide` as not approved and gives `CYCLE (n)`, which in STE is a sequence of operations that repeats on equipment.

#### S2 — an alternative that means something else, default version

**Run 1**

    - I write `tide`. `CYCLE` does not carry the meaning: in STE it is a sequence of operations that repeats on equipment, and the thing to name is one complete pass of an agent that reads the rules and then follows them. So Waytide keeps its own word.
    - I reserve `tide` as a technical noun (`tide (n)`), in a category its entry names, and I record it in the package's `vocabulary.md`.
    - In the entry I record what the STE dictionary says: `tide` is not approved, and the dictionary gives `CYCLE (n)`. That puts it in the "not approved is a disagreement" case, not the "absent is a gap" case. The reservation rejects a decision the standard stated, so the record must say so.
    - The approved word `CYCLE` has a different meaning, so the ete-fixes-the-meaning-of-a-word-in-its-category rule governs the meaning that `tide` takes in its entry.
    - I record it as a reservation (keeping a word that STE rejects), not as a substitution (replacing a word that Waytide rejects). I do this as one step in the a-word-is-reserved-in-six-steps sequence.
    - I do not write `CYCLE` for this concept, and I do not choose a less exact word only to follow the dictionary.

**Run 2**

    - I write `tide (n)`. STE's alternative, `CYCLE (n)`, means a sequence of operations that repeats on equipment. That is not one complete pass of an agent reading the rules and then following them, so the approved word means something else, and the rule says to keep Waytide's word.
    - I reserve `tide` as a technical noun, in a category its entry names, and record it in the package's `vocabulary.md`.
    - In that entry I record what the STE dictionary says: `tide` is not approved, and the dictionary gives `CYCLE (n)`. This makes it the "not approved" case (a disagreement), not the "absent" case (a gap). The record has to say which case it is, because the reservation rejects a decision the standard stated.
    - The approved word carries a different meaning, so the ete-fixes-the-meaning-of-a-word-in-its-category rule governs which meaning `tide` takes. The entry gives that meaning.
    - This is a reservation (keeping a word STE rejects), not a substitution. Nothing Waytide rejects is being replaced, so I record no discontinued word.
    - I do not write `cycle` for this concept anywhere, and I do not take the worse word out of deference to the dictionary.

**Run 3**

    - I write `tide (n)`. STE's `CYCLE (n)` does not carry the meaning: it means a sequence of operations that repeats on equipment, and the concept here is one complete pass of an agent reading the rules and then following them. The approved word means something else, so the rule says to keep Waytide's word.
    - I reserve `tide` as a technical noun, in a category its entry names. That may be one of the five categories that the ete-declares-its-own-categories rule adds.
    - I record it in the package's `vocabulary.md`, and the record states what the STE dictionary says: `tide` is not approved, and STE gives `CYCLE (n)` as the alternative.
    - The record says which case this is. It is a disagreement, not a gap: the standard considered the word and named something else, so the reservation rejects a stated decision and must say so.
    - Because the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs. The entry gives `tide` its fixed meaning, which is one complete read-then-follow pass. I would go through the steps of the a-word-is-reserved-in-six-steps rule, but those steps were not shown to me.
    - This is a reservation (keeping a word STE rejects), not a substitution. No Waytide word is being replaced, so I record no discontinued word.

**Run 4**

    - **Write `tide (n)`, not `CYCLE`.** In STE, `CYCLE` means a sequence of operations that repeats on equipment. That is a different meaning from one complete pass of an agent reading the rules and then following them. So the approved alternative does not carry the meaning, and the rule says to keep Waytide's word.
    - **Reserve `tide` as a technical noun** in a category the entry names. The ete-declares-its-own-categories rule supplies those categories.
    - **Record it in the owning package's `vocabulary.md`.** The entry gives `tide` its fixed meaning: one complete pass of reading the rules, then following them. The ete-fixes-the-meaning-of-a-word-in-its-category rule governs that, because the approved word carries a different meaning.
    - **Record what the STE dictionary says about it:** `tide` is not approved, and the dictionary gives `CYCLE (n)`.
    - **State which case it is: a disagreement, not a gap.** The standard considered `tide` and named something else, so the reservation rejects a stated decision. The record has to say so, and say why `CYCLE` fails, which is the equipment meaning.
    - **This is a reservation only, not a substitution.** Waytide is keeping a word STE rejects, not replacing a word of its own. After the entry exists, use `tide` the same way every time, and do not use `cycle` for this concept.

**Run 5**

    - Write `tide`. STE's approved word, `CYCLE`, means a repeating sequence of operations on equipment. That is a different meaning from one complete pass of an agent reading the rules and then following them. So Waytide keeps its own word, and I do not write `cycle`.
    - Reserve `tide` as a technical noun, `tide (n)`, in a category the entry names. Record it in the owning package's `vocabulary.md`.
    - In that entry, record what the STE dictionary says: `tide` is not approved, and STE gives `CYCLE (n)`.
    - Record that this is the "not approved" case, which is a disagreement and not a gap. The reservation rejects a stated STE decision, so the entry must say which case it is in.
    - The approved word means something else, so the ete-fixes-the-meaning-of-a-word-in-its-category rule governs. The entry fixes `tide`'s meaning: one complete pass of reading the rules and then following them.
    - This is a reservation, not a substitution: it keeps a word STE rejects. It replaces no Waytide word, so I record no substitution.

#### S2 — an alternative that means something else, compressed version

**Run 1**

    - Write `tide (n)`. The approved alternative `CYCLE (n)` does not carry the meaning: in STE it is a repeating sequence of operations on equipment, not one complete pass of an agent reading the rules and then following them. So Waytide keeps its own word.
    - Reserve `tide` as a technical noun, in a category its entry names (one of STE's categories or one of the five ETE declares), in the owning package's `vocabulary.md`.
    - In that entry, record what the STE dictionary says: `tide` is not approved, and the dictionary gives `CYCLE (n)`.
    - State that this is the not-approved case, not the absent case. It is a disagreement: STE considered the word and named something else, and the reservation rejects that decision. It is not a gap.
    - Because `CYCLE` carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs: `tide` takes its entry's meaning, not STE's.
    - This is a reservation, not a substitution, because it keeps a word STE rejects. It is one step in the a-word-is-reserved-in-six-steps sequence, so do the remaining steps of that sequence too.

**Run 2**

    - **Write `tide (n)`, not `cycle`.** In STE, `CYCLE` is a sequence of operations that repeats on equipment. That is not one complete pass of an agent reading the rules and then following them, so the alternative does not carry the meaning, and Waytide's word is kept.
    - **Reserve `tide` as a technical noun** in the package's `vocabulary.md`. Its entry names the category it belongs to, and that category can be one of ETE's own (the ete-declares-its-own-categories rule).
    - **Record what the STE dictionary says:** `tide` is *not approved*, and the dictionary gives `CYCLE (n)`. Record the case as "not approved", which is a disagreement. It is not "absent", which would be a gap. This reservation rejects the standard's decision.
    - **The ete-fixes-the-meaning-of-a-word-in-its-category rule applies.** The approved word has a different meaning, so `tide` takes its entry's meaning in its category, against STE Rule 1.3. Write that definition in the entry.
    - **Do this through the a-word-is-reserved-in-six-steps sequence**, because this rule's step sits inside it.
    - **Record no substitution.** This is a reservation only: it keeps a word STE rejects, and it does not replace a word Waytide rejects. Unlike `conform`, `tide` is not both.

**Run 3**

    - **I write `tide (n)`, not `CYCLE`.** In STE, `CYCLE` means a sequence of operations that repeats on equipment. That is a different meaning from one complete pass of an agent reading the rules and then following them. The rule says to keep Waytide's word where the approved word means something else.
    - **I reserve `tide` as a technical noun** in the owning package's `vocabulary.md`, in a category that its entry names. The concept defines how the system runs, so the owner is probably `foundation`. Its entry gives the meaning: one complete pass of an agent reading the rules and then following them.
    - **I record the STE status in the entry.** `tide` is not approved, and the dictionary gives `CYCLE (n)`. This is a disagreement and not a gap: the standard considered the word and named something else, and this reservation rejects that decision. The record has to say which of the two cases applies.
    - **I record why `CYCLE` does not carry the meaning.** STE's `CYCLE` is about operations repeating on equipment, and not about an agent's pass through reading and following rules. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets `tide` take its entry's meaning.
    - **This is a reservation only, not a substitution.** `tide` does not replace a word Waytide rejected. So unlike `conform`, it is one act and not two, and nothing gets a discontinued-word record.
    - **The work follows the a-word-is-reserved-in-six-steps rule**, because this rule's step sits inside that sequence. The scenario shows only this rule, so I do not state the other five steps.

**Run 4**

    - I write `tide (n)`. STE's `CYCLE (n)` means a repeating sequence of operations on equipment. That is not one complete pass of an agent reading the rules and then following them, so the approved word does not carry the meaning, and Waytide's word is kept.
    - I reserve `tide` as a technical noun in the owning package's `vocabulary.md`. Its entry names the category it is reserved in, which can be one of ETE's own declared categories. I reserve it through the a-word-is-reserved-in-six-steps sequence.
    - The entry records what the STE dictionary says: `tide` is not approved, and the dictionary gives `CYCLE (n)`.
    - The entry records which case `tide` is in. It is "not approved", a disagreement, and not "absent", a gap. The standard considered the word and named something else, and this reservation rejects that decision.
    - Because the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs. `tide` takes the meaning its entry gives it, which departs from STE Rule 1.3.
    - I record no substitution. This is a reservation only: it keeps a word STE rejects, and it does not replace a word Waytide rejects. Unlike `conform`, `tide` is not both.

**Run 5**

    - I write `tide (n)`. The approved alternative, `CYCLE (n)`, means a repeating sequence of operations on equipment. That is not one pass of an agent reading the rules and then following them, so the alternative does not carry the meaning, and Waytide keeps its own word.
    - I reserve `tide` as a technical noun in the package's `vocabulary.md`. Its entry names the category it belongs to, which is either an STE category or one of the five that the ete-declares-its-own-categories rule adds.
    - In that entry I record what the STE dictionary says: `tide` is not approved, and the dictionary gives `CYCLE (n)`.
    - I record which case it is. `tide` is "not approved", not "absent": the standard considered the word and named something else, and this reservation rejects that decision.
    - Because the approved word `CYCLE` has a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs: `tide` takes the meaning its entry gives it, and I do not use `CYCLE` in its place. I do the reservation through the a-word-is-reserved-in-six-steps sequence.
    - I do not record a substitution. This keeps a word that STE rejects; it does not replace a word that Waytide rejects. That would change only if `tide` displaced an earlier Waytide word, which would then be discontinued.

### S3 — say it in STE

**Scenario:**

    The engineer says: "Say it in STE: the agent stops at each hinge and shows the efferent output."

#### S3 — say it in STE, default version

**Run 1**

    - **I read the instruction as a request for the raw standard.** "Say it in STE" is not "say it in ETE". The rule says it forbids `efferent`, `hinge`, and every other term Waytide reserved. So neither word can stay.
    - **What I write:** "The agent stops at each decision point. It then shows the output that it sends out." `stops`, `each`, `shows`, and `output` stay. `hinge` becomes a plain description ("decision point"). `efferent` becomes a description of the direction ("the output that it sends out"). I keep each sentence short, with one instruction per sentence.
    - **I do not use the ETE path.** The rule's sequence is to keep Waytide's word where the approved word means something else. That sequence applies to ETE, not to this request. So I keep no Waytide word and reserve none.
    - **I record nothing.** I make no reservation, no `vocabulary.md` entry, and no record of what the STE dictionary says. Those steps belong to reserving a word for ETE, and this task reserves nothing.
    - **What I tell the engineer:** the plain descriptions may not carry the exact meaning that `hinge` and `efferent` have in Waytide's vocabulary. If that meaning matters, the sentence should be written in ETE instead, where both terms are permitted.
    - **One limit on my answer:** the text I was given does not define `hinge` or `efferent`. My two descriptions are my reading of the words, not their recorded meanings.

**Run 2**

    - The request is "Say it in STE", which is not "Say it in ETE". The rule says it asks for the raw standard, which forbids `efferent`, `hinge`, and every other term Waytide reserved. So both words come out, and the reservations Waytide normally keeps do not apply here.
    - What I write: "The agent stops at each [approved STE phrase for the point that `hinge` names] and shows the output that it sends out." `stop`, `show`, and `output` stay. The text I was given does not say what `hinge` means, so I would take the meaning from its `vocabulary.md` entry rather than guess one.
    - `efferent` is a word the STE dictionary does not list. Under raw STE it still cannot be used, so I write its meaning out in approved words ("the output that it sends out"). I do not keep the term.
    - I reserve nothing and add nothing to `vocabulary.md`. Reserving a word is the ETE step for keeping Waytide's word, and this request asks for raw STE. Changing words for this one sentence is not a substitution that Waytide makes.
    - I tell the engineer one thing: the STE version loses the exact meaning of `hinge` and `efferent`, and "say it in ETE" would keep both terms.

**Run 3**

    - **What I write:** I write it in raw STE, not ETE. The rule says `say it in STE` asks for the raw standard and does not allow `efferent`, `hinge`, or any other word Waytide reserved. So both words come out.
    - **Draft:** "The agent stops at each control point and shows the output that it sends." `stop`, `show`, and `output` stay. `hinge` becomes a plain noun phrase. `efferent` becomes "that it sends" (outgoing).
    - **Caveat on meaning:** the rule I was shown does not define `hinge` or `efferent`. So "control point" and "that it sends" are my guesses at what they mean. I would check them against the `vocabulary.md` entries, or ask the engineer, before I treat the sentence as final.
    - **Reservation:** I do not reserve anything and I do not add anything to `vocabulary.md`. The engineer asked for the standard, not for Waytide's words, so there is no conflict between the dictionary and Waytide that needs settling. Both words are already reserved terms, and raw STE leaves them out for this request only.
    - **No substitution record:** I am not rejecting either word for Waytide. Swapping them for this one request is not the substitution the rule describes, so I record nothing.
    - **Optional note to the engineer:** I tell them in one line that `hinge` and `efferent` were replaced because they are ETE terms, and that `say it in ETE` would keep them.

**Run 4**

    - "Say it in STE" asks for the raw standard, not ETE. The rule says this request forbids `efferent`, `hinge`, and every other term Waytide reserved. So neither word can stay in the sentence.
    - I write the sentence in approved STE words only and put each reserved term's meaning in plain words. For example: "The agent stops at each point where [the hinge meaning, stated in approved words] and shows the output that it sends out." "Output that it sends out" stands in for `efferent`.
    - I cannot paraphrase `hinge` correctly without reading its entry in the `vocabulary.md` of the package that defines it. The rule says reserved terms are binding and cannot be applied unread. So I read that entry first and do not guess the meaning.
    - I keep `stop`, `show`, `each`, and `output` as they are. They are ordinary STE words and do not need to change.
    - I record nothing. Nothing is being reserved, so no `vocabulary.md` entry is needed. Nothing is being substituted either. This is a one-time request for raw STE, not a vocabulary decision.
    - I do not change the request to "say it in ETE", which would have let me keep `hinge` and `efferent`. The engineer asked for STE, and that request comes first.

**Run 5**

    - The engineer asked for "Say it in STE", not "Say it in ETE". That is a request for the raw standard. The rule says the raw standard forbids `efferent`, `hinge`, and every other term Waytide reserved, so both words come out of the sentence.
    - I write it with approved STE words only. For `efferent` I use what the word means, "goes out": "The agent stops at each [hinge] and shows the output that goes out from it." `stops`, `shows`, and `output` can stay.
    - `hinge` needs a plain STE description, and the rule does not tell me what Waytide means by it. I would not guess. I would leave it marked in the draft and ask the engineer for the meaning, or take it from the package's `vocabulary.md` entry if I can see it. Then I write that meaning in approved words, for example "at each point where …".
    - I do not reserve any word and I do not add anything to `vocabulary.md`. This is not an ETE reservation decision. The request is a one-time instruction to leave the reserved terms out, and the existing reservations of `hinge` and `efferent` stay as they are.
    - I do not substitute or reserve anything for `stop`. The approved STE word is the plain one and it carries the meaning, so the dictionary decides.
    - Besides the sentence, I tell the engineer in one line that I removed `hinge` and `efferent` because the request was STE and not ETE, so it is clear the wording changed.

#### S3 — say it in STE, compressed version

**Run 1**

    - **What I write:** I write it in raw STE, with no Waytide reserved terms. For example: "The agent stops at each point where a person must make a decision, and shows the output that it sends." `stops` and `shows` are approved STE words, so they stay.
    - **`hinge` is removed.** It is a Waytide reserved term, and "Say it in STE" excludes it by name. I replace it with approved words that describe the concept, not with a single substitute word.
    - **`efferent` is removed for the same reason.** Its meaning, output that goes out, is said in approved words ("the output that it sends").
    - **Meaning check:** The rule does not define `hinge` or `efferent`. So I tell the engineer that my plain-word paraphrase of each term is an interpretation, and that some meaning can be lost when a reserved term is removed. I do not hide that loss.
    - **Nothing is recorded:** I make no reservation, no substitution, and no change to any `vocabulary.md`. "Say it in STE" asks for one output in the raw standard. It is not a decision about the vocabulary.
    - **ETE stays the default.** The next prose without that instruction is written in ETE again, with `hinge` and `efferent` kept.

**Run 2**

    - **What I write:** the sentence in raw ASD-STE100, with no Waytide-reserved terms. "Say it in STE" asks for the standard without `efferent`, `hinge`, or any other reserved term. `stops`, `each`, and `shows` are approved STE words and stay. `output` is an ordinary technical noun and also stays.
    - **Replacing the reserved terms:** I replace `hinge` and `efferent` with descriptions made of approved words, taken from what their `vocabulary.md` entries define. For example: "The agent stops at each point where [the hinge's definition, in approved words]. Then it shows the output that it sends out." The rule text does not give me the entries, so the bracket stays until I read them. I do not guess at what `hinge` means.
    - **I do not write ETE:** I do not keep `hinge` or `efferent` on the grounds that STE never considered them. That fallback (STE Rule 1.1, and Waytide's word winning) is how ETE handles a word. The engineer asked for STE.
    - **Nothing gets recorded:** I add no reservation and no substitution, and I make no `vocabulary.md` entry or dictionary note. This is a request for one piece of output, not a vocabulary decision. The reserved terms stay reserved in ETE.
    - **Nothing gets marked as a defect:** the reserved terms have no STE equivalent. Dropping them is what "Say it in STE" asks for, and it is not a fault in either version.
    - **What I tell the engineer:** a short note naming which terms I replaced and with what. A spelled-out description can lose some of a reserved term's precision, and the note lets them check that.

**Run 3**

    Here is my answer to the S3 scenario, from the rule text alone.

    - **What I write:** the sentence in raw STE, with no Waytide reserved terms. "Say it in STE" means `hinge` and `efferent` are not allowed, even though ETE would keep them. Example: "The agent stops at each [plain STE words for what a hinge is]. Then it shows the output that [plain STE words for what efferent means]."
    - **The other words stay:** "agent", "stops", "shows" and "output" do not change. The rule makes no change to `stop` and `show`, and gives STE's `STOP` as an approved word. The only change is replacing the two reserved terms.
    - **How I fill the brackets:** with the meanings from the `vocabulary.md` entries for `hinge` and `efferent`, said in approved STE words. The rule does not give those meanings, so I would not guess. If I could not get the entries, I would ask the engineer what each term means here before I wrote the sentence.
    - **Should I tell the engineer:** possibly, in one line. The STE version uses more words and can be less exact than the ETE one ("the agent stops at each hinge and shows the efferent output"). That is the trade-off the rule describes, and the engineer chose it. I would not add more than that line.
    - **What I record:** nothing. A "Say it in STE" request is about one piece of output. It does not reserve or substitute a word, so nothing goes into `vocabulary.md` and nothing about the dictionary's view gets written down.
    - **What I do not do:** I do not apply this to other text, and I do not reverse or question the reservations of `hinge` and `efferent`. They stay reserved in ETE.

**Run 4**

    - `Say it in STE` asks for the raw standard. So I take out `hinge` and `efferent`, because they are Waytide's reserved terms. I do not write the sentence in ETE.
    - I keep `stops`, `each`, `shows`, and `output`. STE approves `stop` and `show`, `each` is an ordinary approved word, and `output` and `agent` are acceptable technical nouns.
    - I replace each reserved term with approved words that state its meaning. A draft: "The agent stops at each [point where the work changes direction] and shows the output that it sends out."
    - The rule does not define `hinge` or `efferent`. Before I give the final sentence, I read their entries in the package's `vocabulary.md`, or I ask the engineer. The bracketed text and "that it sends out" are placeholders. I do not guess.
    - I write and record nothing else. This is a request for one sentence, so I make no reservation, no substitution, and no change to `vocabulary.md` or to the STE-dictionary record. The terms stay reserved for ETE prose.
    - I do not add a note that the STE version is weaker than the ETE version, unless the engineer asks for one.

**Run 5**

    - **What I write:** I rewrite the sentence in the raw ASD-STE100 standard, which is what `Say it in STE` asks for. I take out `hinge` and `efferent`, because the rule lists both as terms Waytide reserved, and the raw standard does not have them. `stops`, `shows`, and `output` can stay.
    - **How each reserved term is replaced:** I write each one as its meaning in approved words, not as a synonym. An example is "The agent stops at each point where [the hinge's meaning] and shows the output that it sends out." "Sends out" is my best guess at "efferent".
    - **What I cannot settle from this text:** the rule does not say what `hinge` means. The vocabulary terms are binding and cannot be applied unread. So before I write the final words, I read the `hinge` and `efferent` entries in the package's `vocabulary.md`, and I do not guess.
    - **Nothing else is written:** this is a request for one sentence in STE. It is not a reservation or a substitution, so I do not add, change, or remove any `vocabulary.md` entry.
    - **Nothing else is recorded:** I record no STE-dictionary note, no absent-or-not-approved classification, and no change to ETE. `hinge` and `efferent` stay reserved in ETE. The request for raw STE only leaves them out of this one output.
    - **Default after this:** later prose goes back to ETE, which keeps the reserved terms, unless the engineer asks for STE again.

## Appendix — the predictability simulation on #15, its prompts and answers

**Every prompt had the same form**: the opening below, then `RULE:` and one version of the rule between `<<<` and `>>>`, then `SCENARIO:` and one scenario, then `QUESTION:` and the question below, which was the same for all three scenarios. Each of the six prompts — two versions, three scenarios — was given unchanged to five agents. The answers are each agent's reply, word for word.

### The opening

    You are an AI coding agent working in a software project that has Waytide installed. Your behavior is governed by the rule below, among others you have not been shown. Read it, then answer the question about the scenario. Do not use any tools, read any files, or run anything: answer from the text only.

### The default version of the rule

    # The harness announces Waytide's installation. The agent never prints the notice

    A project running Waytide announces the system's presence through **three surfaces the harness renders**, not through anything the agent says:

    - **A session-start notice.** A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`. That script reads the package directories actually present and emits a notice. The notice says what is installed, and what the engineer can type to have it read:

    ```
    Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git

    Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.

    To load them now, type: load waytide.
    ```

      Between the install line and the closing ask, the notice reports **experiments and features that have not concluded**. They take one further line together, when there are any:

    ```
    Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git
    3 implementations open: gate-forecasting (no state recorded), shipped-test-tree-script (suspended), upload-retries (suspended)

    Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.

    To load them now, type: load waytide.
    ```

      **The notice carries no mark.** The mark is now printed by a hook of its own when the engineer types `load waytide`. See the initialization-rule.

      A mark stands for the system being brought into force, and a hook runs before the session. So this was the one surface that could only ever show it at a moment when nothing was being loaded. The mismatch was already written into the notice's own wording, which says **installed** and never *loaded* for exactly that reason.

      **The move took a hazard with it.** The mark's backslashes had to be doubled here. The notice is interpolated into a JSON string by `printf` with no escaping, and a lone backslash begins a JSON escape sequence. `\_` is not a valid one, the harness fails to parse the output, and **the notice disappears with no error at all**. That constraint is now off the art entirely. It still governs everything else this hook emits, and the load line's no-quotation-marks rule below is the same hazard arriving through a different character.

      Each record under `waytide/local/implementations/` is read for its canonical `**State:**` line (see the implementations-convention). An experiment whose state is **Affirmed**, **Refuted**, **Inconclusive**, **Abandoned**, or **Superseded** has concluded, as has a feature that is **Completed**, **Abandoned**, or **Superseded**. Those are not reported. **Suspended** and a record carrying no state line are. When every implementation has concluded that line is absent entirely, so the notice grows only when there is something open.

      **Why the notice carries it.** The lifecycle requires that an experiment never be left silently open, but nothing was enforcing that in every session. The working directories under `waytide/` are not read at session start, so an open experiment goes unnoticed unless something names it. An experiment worked in a **worktree** leaves no trace at all in the main working tree, which stays on the upstream branch. So not even the branch name gives it away. The configuration that best isolates an experiment is the one that most easily loses track of it.

    - **A status line.** `waytide/system/foundation/statusline.sh` keeps the system's presence on screen for the whole session, alongside the working directory and git branch. The fact then stays available instead of scrolling away:

    ```
    waytide · master :: Waytide
    waytide · master · uncommitted changes :: Waytide
    waytide · master · untracked files :: Waytide
    waytide · master · uncommitted changes · untracked files · unpushed commits :: Waytide
    ```

      **The repository's name leads the line, in bold.** It is the first orientation the line gives — which repository this is. Every segment after it annotates that: the branch, the uncommitted and unpushed work, and the system in force. Bold separates the subject from its annotations, so the line is read at a glance rather than parsed left to right. It is a terminal escape sequence, which the harness passes through. Only the repository name takes one, since a line where several segments are emphasized emphasizes nothing.

      **The Waytide segment is one word and carries no package count.** The count told an engineer nothing they act on. It changed only when a package was installed or removed, and it competed for width with the segments that do change. What the line is for here is the standing fact that the system is in force.

      Presence is still read from disk: at least one directory carrying a `README.md`, the same test for a package the notice uses. So only the display drops the number. The on-demand detail is the status report's job (see the status-report-format rule).

      **The Waytide segment trails after a double colon.** It was a hyphen until 2026-07-28. A hyphen also joins words. So it read as punctuation inside the sentence of segments. It did not read as the break between the engineer's own state and the system standing behind it. The double colon separates and does nothing else, which is the whole of what is wanted there.

      The middle dot between the engineer's own segments is unaffected. The two marks now differ from each other. That is what makes the trailing segment read as an annotation on the line rather than another segment in it.

      **The uncommitted changes segment** appears only when the working tree has something not committed. That is a modified tracked file, a staged change, or an untracked file that is not ignored. All three are uncommitted, and the untracked case is the point rather than noise. A file left untracked is usually one that should be added or ignored. Absence is the clean signal, as it is for the notice's open experiments and features. It is words rather than a mark on the branch — `master*` is the conventional form and means nothing until a reader is taught it.

      **The untracked files segment** names the one of those three states whose remedy differs. A modified tracked file is committed. An untracked file is added or ignored, and until it is, it is the file most easily lost. Before this segment existed the line reported `uncommitted changes` over a tree where nothing had been modified at all. That was true on the axis the segment names, and still misleading: it sent the engineer looking for an edit that was not there.

      **An untracked file raises the two segments, deliberately.** `uncommitted changes` names the **axis** — work that is not in the history — and an untracked file is on it. Narrowing that segment to tracked modifications would make the two of them a partition and cost the axis. An engineer scanning for whether anything at all is uncommitted would have to read two segments to answer one question. The overlap is the cost of keeping one segment that answers it alone.

      **The unpushed commits segment** is the next state along the same axis. It is work that is committed but exists only in this working copy, and would be lost with it just the same. The two segments can be present at once, so each is named in words that read distinctly.

      It carries **no count**, matching the uncommitted segment. The fact worth surfacing is that unpushed work exists at all, and git answers "how much" precisely on request. It **never reaches the network**: the line renders every turn, so fetching is out of the question. It compares against the remote-tracking ref, which reflects the **last fetch** rather than the remote as it stands. What it reports is the last known remote state and a stale tracking ref can leave it silent when the remote has moved.

    **A branch with no upstream reports nothing.** "Unpushed" is a claim relative to somewhere, and with no upstream configured there is nowhere for it to be relative to. A branch that was never going to be pushed is ordinary, and calling it unpushed would be false. That does leave an upstream missing *by accident* unreported. It is a different fact from the one this segment names, and it is deliberately not folded in.

    - **A startup display.** When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints the title, the copyright and license, the loading line, and the figure. It reads them from the initialization-rule, which governs the display. It is printed once, on that command and on no other prompt.

    The three are wired by a committed `.claude/settings.json` that `install.sh` places in the consuming project.

    - **The hook also carries the read instruction to the agent, on a separate channel.** The `SessionStart` hook emits two things, addressed to two different readers. The **notice** goes in `systemMessage`, which the harness renders for the engineer. The **instruction to read the rules** goes in `hookSpecificOutput.additionalContext`, which reaches the agent's context and is never displayed. They are not the same text, because they are not for the same reader. The engineer does not need an instruction addressed to the agent restated every session.

      The instruction states that the read is **unconditional** — that the apparent size of the first request is not a reason to defer it. That is the failure it answers: a session opened with a one-line request, the read was judged not worth it. The session grew into rule edits, a work session record, and two package publishes governed by rules that were never read. Reading on demand kept producing locally plausible results, so nothing ever announced the gap.

      **What it does not do is verify the read.** Nothing here can: the hook runs before the session and cannot observe what the agent then does. It removes one specific excuse — the instruction being buried in a prose file the agent may not open — and no more. The verification remains what it has always been, the work honoring the rules.

    - **The notice closes by naming the command that loads the rules.** `Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.` then, on its own line, `To load them now, type: load waytide.` The close is always present. It is the one part of the notice that asks for something rather than reporting.

      **A blank line precedes it.** Everything above the close reports — what is installed, and what has been left open. The close is the only part of the notice that asks the engineer to do something. Run together with the report, it reads as one more reported fact. The command to type then sits at the bottom of an undifferentiated block. The blank line marks the change of purpose.

      It falls **after** the open-experiment and open-feature lines, not between them and the install line. Those lines are part of the report. Breaking there would separate the report from itself and leave the ask still joined to half of it.

      **A second blank line stands the command sentence on its own line.** The two closing sentences were one line until 2026-07-30. So the command ended it but was still the tail of a paragraph. Reaching the words to be typed meant reading the caveat ahead of them first.

      On its own line the command is the whole of the notice's last line. It is read and copied without reading past anything, which is what putting it last was for. It costs a line of height, and buys the one thing the notice asks for standing where nothing else competes with it.

      **Something the engineer types is required, whatever it says.** Nothing the hook supplies can execute on its own, since an agent produces nothing until the engineer speaks. So the read cannot happen before some first message exists. What the line settles is only what that first message should be.

      **The command names the read outright, and carries no emphasis markup.** `load waytide` says what it does. So an engineer who has never seen this system can act on it without being told what the word stands for. The line also states the two facts an engineer needs before deciding whether to type it. The rules load ahead of their first instruction either way, and loading takes a few moments.

      **The caveat says a few moments, not a moment.** A moment describes an interval short enough to wait through without noticing it, and the read is not that. It opens every compiled rule in every installed package, which is a wait an engineer sees. Understating it makes the notice's one caveat the part of the line least worth trusting. The plural says the length the wait actually has while staying informal, which is the register the rest of the line is in.

      **The command sentence comes last.** Until 2026-07-28 the two closing sentences ran the other way — the command, then the caveat that loading takes a moment. So the close ended on its cost, and the words to be typed sat in the middle of it. Swapping them puts the caveat where an engineer reads it before deciding, and leaves the command last. That is where the eye settles, and where it can be copied without reading past it.

      The order of the two is the whole of that change. The two sentences are still present, and the first sentence still leads. Standing the command on its own line came later, and finishes the same work. The order put it last, and the break leaves nothing beside it.

      **The notice is plain text, not markdown.** The command was written in markdown bold until 2026-07-28, on the assumption that the harness renders `systemMessage` as markdown. It does not. The asterisks reached the engineer literally. So the markup that was to put the typed words where the eye lands drew the eye to punctuation instead.

      Emphasis is not available on this channel. The status line's bold repository name is a terminal escape sequence, which is a different mechanism and unaffected. And the line does not need it: the command already ends the sentence that points at it. Nothing else in the notice takes markup either, for the same reason.

      **What that gives up is attributability.** Until 2026-07-28 the line asked for a **foil request**. That is a message with no content of its own. Its only purpose was to give the agent an occasion to act on an instruction already in its context. The word was `begin`, and it was contentless on purpose.

      The agent never sees this notice, since `systemMessage` renders for the engineer alone. So `begin` was the entire content reaching the agent, and the instruction to read came from `hookSpecificOutput.additionalContext`. A read that followed could therefore only have come from the hook. An agent that never received the instruction got an opaque word and had to ask what it meant, which is a loud failure.

      A named command collapses that: the read now happens whether or not the hook's channel reached the agent, and no session distinguishes the two. The trade is deliberate: legibility to the engineer over observability of the mechanism. It means the hook's channel is no longer testable from ordinary use.

    **The hook still carries the whole instruction.** The engineer's command names the read. What the agent is to do with it reaches the agent only through `additionalContext`:

      - read `foundation/` first
      - read each `vocabulary.md` a package has
      - read the project's own `local/rules/` and `local/vocabulary.md` as well
      - leave the other working directories out of the read
      - wait for the engineer's request
      - print no package count

      **The instruction names the project's own `local/rules/`, unconditionally.** It named only the installed packages until 2026-08-01. That made it **narrower than the rule it exists to get followed**. rules-convention requires reading `waytide/system/` and `waytide/local/rules/`, and the `AGENTS.md` bootstrap `install.sh` generates names the two. So the two surfaces carrying the read disagreed. The hook was the one carrying less.

      It is the path this rule calls primary, the file route being the one it was written to stop depending on. A project's own rules are the half no package supplies and no refresh restores.

      It is named **whether or not the directory exists**, and the instruction says its absence is ordinary rather than an error. A conditional instruction would vary its text by project, which is a second thing to keep true. The binding rule and the bootstrap name it without a condition, and this now matches them.

      **Within the packages it names the compiled rules: each package's `source/` directory and its `README.md` are left out.** The source rules are the same rules with their footers and History sections, and a README summarizes rules the read already carries.

      **It names `local/rules/` and `local/vocabulary.md`, and nothing else beside the packages.** The working directories beside them are worked with as their own conventions describe and are **not** read as binding rules at session start. The instruction says so outright, naming each of them, because an instruction naming `local/` rather than the two would reverse that settled distinction.

    **The vocabulary is a file rather than a directory, and it joined the read on 2026-08-10.** A project's own terms and substitutions decide over every package's, so they are binding and cannot be applied unread. The same reason each package's `vocabulary.md` is named. It is named **whether or not it exists**, like `local/rules/`, and its absence is ordinary. Where it sits, and why beside `rules/` rather than inside it, is the vocabulary-convention rule's.

      **This rule does not restate that list, and the omission is deliberate.** `session-start.sh` builds the instruction and is the only place the directories are enumerated. This rule described the instruction and wrote the same list out a second time. On 2026-08-06 the two copies disagreed. The script still named a single mode's planning directories after the rule had been corrected to name none.

      **Neither copy was wrong to exist — the second one was.** A reader wanting the list reads the script, which is what actually reaches the agent. A reader wanting to know what the instruction is *for* reads this rule. Describing a list and reproducing it are different jobs, and only the first belongs here.

    **The instruction ends the read with the wait for the engineer's request.**

    **It tells the agent not to print the startup display, because the harness prints it.** Under a later model the display stopped reaching the engineer, skipped or written into the agent's thinking, and nothing reported it. A `UserPromptSubmit` hook now prints it when the engineer types `load waytide` (see the initialization-rule). The **art is not carried on this channel either**. The display hook reads it from that rule.

      **The line says the rules are loaded. The notice's first line still says installed.** They are different claims about different things. The first line reports what a pre-session hook can observe — that the packages are on disk and the configuration is live. This line describes what the session does next, and offers the command that does it now. It reports no read as having happened.

      **No quotation marks, and they must not be added.** The notice and the instruction are each interpolated into a JSON string built by `printf` with no escaping. A double quote would terminate the string, and the harness would fail to parse the output. The notice would disappear with no error at all, which is the silent failure this whole mechanism exists to avoid.

    - **The agent does not print a notice.** Not at session start, not before the first response, not at all. The harness has already printed it, and an agent-printed copy would only duplicate it. **The agent does not print the startup display either.** That is the third surface the harness renders, from its own hook, once, when the engineer types `load waytide`. See the initialization-rule. It sits there rather than in this notice because a segment here renders every session and would stop being read. The one thing the agent prints at the start is the package set stanza, where a project shows one, because it needs markdown.
    - **Enumerate what is actually on disk.** The scripts list the package directories under `waytide/system/` (or `system/` in the authoring source). A directory carrying a `README.md` is a package — which is what distinguishes a grouped package (one carrying a README) from the grouping directory above it. Nothing prints a fixed list. The notice reflects the real install because the directories must be read to produce it.
    - **What the notice claims is narrow, and its wording says so.** It reports that the system is **installed** and its configuration is live. It says nothing about whether the rules were read or internalized — the agent is not its author, so it cannot vouch for the agent. That verification comes from the work honoring the rules, as it always did. **Carrying the read instruction does not widen this claim.** Instructing and vouching are different acts: the hook tells the agent to read the rules, and still reports nothing about whether it did.
    - **The notice says "installed", never "loaded".** The two words claim different things, and only one of them is observable at the moment the notice prints. A hook runs **before** the session, so no rule file has been read yet. The notice and the read instruction are emitted in the same output. So the notice is printed at the very moment the reading is still being asked for. "Loaded" means brought into a runtime, read in. That is precisely the fact the hook cannot establish. The notice earlier used it anyway, so the rule's narrow claim and the script's wording disagreed, and the wide reading was the one an engineer actually saw. Nothing about the timing can be fixed — no message emitted before a session can report on what the session then does — so the correction is the verb, not the mechanism. The same holds for the term: this is the **session-start notice**, not "the load notice", and the status line reports the system **active**, which is a claim about the configuration rather than the agent.
    - **A project that ignores `.claude/` is warned.** The notice travels only if `.claude/settings.json` is committed, so `install.sh` checks whether git is set to ignore that path. When it is, and the file is not already tracked, it prints how to correct it. Without the check the install reports success while the notice stays on one machine. It works for whoever ran the install and reaches nobody else on the team. Git cannot re-include a file inside an excluded directory, so a negation added under a `.claude/` rule does nothing. The rule has to become `.claude/*` plus `!.claude/settings.json`, which keeps each engineer's personal `.claude/settings.local.json` ignored.
    - **Adopting the status line replaces the engineer's own.** A project-level `statusLine` overrides whatever the engineer configured for themselves. That is why the script also renders the directory and branch, and why `install.sh` never merges into an existing `.claude/settings.json` — it prints the block and leaves the decision with the engineer.

    **There is no opt-out.** An option whose whole purpose is to make the system invisible while it is in force sits against every reason these surfaces exist.

    The notice, the status line, and the printed copyright and license are each there for one reason. A system read at the start of every session should say so. The `WAYTIDE_QUIET` variable was the one sanctioned way to have it in force and say nothing.

    What it never silenced was the read instruction itself — quieting a display must not disable the mechanism that carries the rules. That guarantee is unaffected by its removal, since nothing about the read ever depended on it.

    **What this costs:** the mechanism is specific to harnesses that read `.claude/settings.json`. Under any other harness there is no notice until equivalent glue is written for it. The system still loads through the `AGENTS.md` bootstrap, but silently. A harness setting that disables all hooks silences it too, and a newly placed `.claude/settings.json` may not take effect until the harness reloads its configuration.

    **Why:** the notice was previously printed by the agent, on an instruction carried in the `AGENTS.md` bootstrap, and it failed in two ways at once. It was **unreliable**. It depended on the agent obeying a line buried in a long prose file, and when it did not fire, nothing revealed that. And it was **badly placed**. A line of plain text inside a reply either cluttered the response or was scrolled past. So it could be emitted correctly and still go unseen.

    The two failures have one source: the party being announced was also the announcer. Moving the notice to the harness removes the dependence on agent compliance. It puts the message outside the response body, where it neither competes with an answer nor hides inside one. The ordering problem disappears with it. That is whether the notice precedes the first response, and a hook runs before the session rather than inside it.

    **How to apply:** wire the notice through `.claude/settings.json`, pointing the `SessionStart` hook and `statusLine` at the two foundation scripts. `install.sh` does this for a consuming project. Never print a session-start notice as an agent.

    Keep the mark out of the notice — the startup display hook prints it, and the initialization-rule governs it. Keep the scripts reading the real directories rather than asserting a list. Keep the notice claiming **installation** rather than a load. The word has to stay inside what a pre-session hook can observe.

    Keep the notice and the read instruction on their separate channels. `systemMessage` is for the engineer, and `hookSpecificOutput.additionalContext` is for the agent. Keep the instruction firing unconditionally.

    Keep the instruction naming the project's own `local/rules/` and `local/vocabulary.md` alongside the packages. Name them unconditionally, with the other working directories explicitly left out. Do not restate the instruction's list of working directories here. `session-start.sh` enumerates them, and this rule describes what the enumeration is for. A second copy is a second thing to keep true, and it has already drifted once.

    Keep it telling the agent not to print the startup display. Add no opt-out: these surfaces are not silenceable, and the read instruction is emitted every session. Keep the mark's art out of this hook: it belongs in the rule, where it is not a JSON literal.

    Keep the load command worded the same in the two channels. The notice tells the engineer to type `load waytide`. The instruction tells the agent that the command asks for the read and nothing more.

    Keep the command the notice's **last** sentence, on a line of its own, with the loading-takes-a-moment caveat ahead of it. Keep the two blank lines. The first separates the notice's report from the closing ask, placed after any open-experiment and open-feature lines. The second separates the caveat from the command sentence.

    Write the notice as plain text, with no markdown markup, since the harness renders it literally. Keep the repository name bold in the status line. It is a terminal escape sequence, the one emphasis that does render. Leave every other segment plain.

    Keep the engineer's own segments separated by the middle dot. Set the trailing Waytide segment off by the double colon. Keep an untracked file raising the uncommitted segment as well as the untracked one.

    Related:

    - the initialization-rule — the startup display, which this notice does not carry and the agent does not print
    - the rules-convention — the rule format and where the bootstrap lives
    - the foundation `install.sh` that places the bootstrap files
    - the status-report-format rule — the on-demand report that answers in detail what is installed

### The compressed version of the rule

    # The harness announces Waytide's installation. The agent never prints the notice

    **The harness announces Waytide, through three surfaces it renders. The agent prints no notice, at session start or at any other time.** An agent-printed copy would only duplicate the harness's. The one thing the agent prints at the start is the package set stanza, where a project shows one, because it needs markdown.

    **The session-start notice.** A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice:

    ```
    Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git
    3 implementations open: gate-forecasting (no state recorded), shipped-test-tree-script (suspended), upload-retries (suspended)

    Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.

    To load them now, type: load waytide.
    ```

    - **The install line enumerates what is on disk.** A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it. Nothing prints a fixed list.
    - **The open line names experiments and features that have not concluded**, read from each record's `**State:**` line under `waytide/local/implementations/`. An experiment that is Affirmed, Refuted, Inconclusive, Abandoned, or Superseded has concluded, as has a feature that is Completed, Abandoned, or Superseded. One that is Suspended or carries no state line is reported. With nothing open the line is absent. It exists because an experiment must never be left silently open, and one worked in a worktree leaves no trace in the main working tree.
    - **The close is always present**: the caveat, then the command on a line of its own, last. A blank line precedes the close, after any open line, because the close asks and everything above it reports. A second blank line stands the command alone, so it is read and copied without reading past anything. The caveat says `a few moments`, because the read is a wait an engineer sees.
    - **The command names the read outright**, so an engineer new to the system can act on it. Something the engineer types is required in any case, since the agent produces nothing until the engineer speaks. This gives up a contentless foil word whose only effect came through the hook's channel, so that channel is no longer testable from ordinary use. The trade of observability for legibility is deliberate.
    - **The notice says `installed`, never `loaded`.** A hook runs before the session, so it can observe that the packages are on disk and the configuration is live, and not that any rule was read. The close's `are loaded` describes what the session does next and reports no read. Call it the session-start notice, not the load notice. The status line reports the system active, a claim about the configuration rather than the agent.
    - **The notice is plain text.** The harness renders `systemMessage` literally, so markup reaches the engineer as punctuation.
    - **The notice carries no mark.** The startup display prints it (see the initialization-rule).
    - **No quotation marks, and no lone backslash, in anything the hook emits.** `printf` interpolates the notice and the instruction into a JSON string with no escaping. A double quote ends the string, and a lone backslash begins an invalid escape. Either way the harness fails to parse the output and the notice disappears with no error.

    **The read instruction.** The same hook carries it to the agent on a separate channel. The notice goes in `systemMessage`, for the engineer. The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent and is never displayed. They are different texts for different readers.

    - **The read is unconditional.** The apparent size of the first request is not a reason to defer it. A session opened with a one-line request once skipped the read and grew into rule edits and publishes governed by rules never read.
    - **It carries the whole instruction.** Read `foundation/` first and each package's `vocabulary.md`. Read the compiled rules, leaving out each package's `source/` directory and `README.md`. Read the project's `local/rules/` and `local/vocabulary.md`, each named whether or not it exists, its absence ordinary. Name the other working directories and leave them out. Do not print the startup display. Print no package count. Then wait for the engineer's request. `load waytide` asks for exactly that read and nothing more.
    - **This rule does not restate the directory list.** `session-start.sh` is the only place it is enumerated, since a second copy drifted once.
    - **The mark's art is not carried on this channel.** The display hook reads it from the initialization-rule.
    - **Nothing verifies the read.** The hook cannot observe what the agent does. It removes one excuse, an instruction buried in a file the agent may not open. Instructing is not vouching: the notice still reports nothing about whether the agent read the rules. The work honoring the rules is the verification.

    **The status line.** `waytide/system/foundation/statusline.sh` keeps the system's presence on screen all session:

    ```
    waytide · master :: Waytide
    waytide · master · uncommitted changes · untracked files · unpushed commits :: Waytide
    ```

    - **The repository name leads, in bold**, a terminal escape sequence the harness passes through, and the only emphasis on the line.
    - **The engineer's segments are separated by a middle dot, and the Waytide segment trails after a double colon**, which separates and does nothing else, so it reads as an annotation on the line.
    - **The Waytide segment is one word, with no package count.** Presence is read from disk, by the same README test the notice uses. The detail is the status report's (see the status-report-format rule).
    - **`uncommitted changes`** appears when there is a modified tracked file, a staged change, or an untracked file that is not ignored. It is words, not a mark like `master*`.
    - **`untracked files`** names the case whose remedy differs: add or ignore, not commit. An untracked file raises both segments, deliberately, so `uncommitted changes` alone answers whether anything is uncommitted.
    - **`unpushed commits`** carries no count and never reaches the network. It compares against the remote-tracking ref, so it reflects the last fetch. A branch with no upstream reports nothing, since unpushed is relative to an upstream.

    **The startup display.** When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`. It prints the title, the copyright and license, the loading line, and the figure, read from the initialization-rule, once, on that command only. The agent does not print it.

    **Wiring.** A committed `.claude/settings.json` wires the three, and `install.sh` places it in a consuming project. `install.sh` warns when git ignores `.claude/` and the file is not tracked. The fix is `.claude/*` with `!.claude/settings.json`, since git cannot re-include a file inside an excluded directory, and it keeps `.claude/settings.local.json` ignored. A project-level `statusLine` replaces the engineer's own, so the script renders the directory and branch too. `install.sh` never merges into an existing `.claude/settings.json`: it prints the block and leaves the decision to the engineer.

    **There is no opt-out.** These surfaces exist so that a system read every session says so, and the read instruction is emitted every session.

    **What this costs:** it works only where a harness reads `.claude/settings.json`. Elsewhere the system loads through the `AGENTS.md` bootstrap, silently. A setting that disables hooks silences it too, and a newly placed `.claude/settings.json` may not take effect until the harness reloads.

    **Why:** an agent-printed notice was unreliable, since nothing revealed when the agent skipped it, and badly placed, inside a reply where it cluttered the answer or was scrolled past. Both came from the party announced also being the announcer. The harness removes the dependence on the agent, and puts the notice outside the response.

    Related:

    - the initialization-rule — the startup display, which this notice does not carry and the agent does not print
    - the rules-convention — the rule format and where the bootstrap lives
    - the foundation `install.sh` that places the bootstrap files
    - the status-report-format rule — the on-demand report that answers in detail what is installed

### The question

    What do you do, and what does your response to the engineer contain? Answer in at most 6 short bullets.

### S1 — a one-line first request

**Scenario:**

    A session has just started. The harness has printed the session-start notice, and your context holds the hook's instruction to read the rules. The engineer's first message is: "What is the date of the last commit?"

#### S1 — a one-line first request, default version

**Run 1**

    - I read the rules before doing anything else. The rule says the read is unconditional, and that a small first request is not a reason to put it off. So I read `foundation/` first, then each package's `vocabulary.md`, then the project's own `local/rules/` and `local/vocabulary.md` (if either is missing, that is ordinary). I skip each package's `source/` and `README.md`, and the other working directories.
    - I do not print the session-start notice. The harness already printed it, and a second copy from me would only duplicate it.
    - I do not print the startup display or the mark either. A separate hook prints those, and only when the engineer types `load waytide`. I also print no package count.
    - After the read, I answer the question by checking git (for example, `git log -1 --format=%cd`).
    - My response to the engineer holds the date of the last commit, given plainly. It has no announcement saying Waytide is installed or loaded. The one possible extra is the package set stanza, and only if this project shows one.

**Run 2**

    - First I read the rules, even though the request is small. The hook's instruction says the read is unconditional, and a one-line first request is exactly the case it was written for. I read foundation/ first, then each package's vocabulary.md, then the project's local/rules/ and local/vocabulary.md, skipping source/, README.md and the other working directories.
    - Then I answer the question: I run `git log -1 --format=%cd` (or an equivalent) and report the date of the last commit.
    - I do not print the session-start notice. The harness has already shown it, so a copy would only repeat it.
    - I do not print the startup display (title, copyright and license, figure). Its own hook prints it, and only when the engineer types `load waytide`.
    - I print no package count, and I do not claim the rules are "loaded" or vouch that I read them.
    - So the response itself is just the date of the last commit. The one exception is a package set stanza, if this project shows one; nothing in the scenario says it does.

**Run 3**

    - I read the rules first: foundation/ first, then each package's vocabulary.md and the project's local/rules/ and local/vocabulary.md, leaving out source/, README.md files and the other working directories. The hook says this read is unconditional, so a one-line question is not a reason to put it off or skip it.
    - I treat the read as done before answering. The engineer's request has already arrived, so there is nothing more to wait for once the read is finished.
    - Then I answer the question by checking git for the last commit's date (for example `git log -1 --format=%cd`), under whatever the rules say about tool use and reporting.
    - My response gives the date of the last commit, plainly and briefly.
    - It does not contain a session-start notice, the startup display or mark, the copyright or license, or a package count. The harness prints the notice, and the display only appears when the engineer types `load waytide`.
    - The one thing I might add at the start is the package set stanza, but only if the project shows one. The rule text alone does not say whether this project does.

**Run 4**

    I read the prompt file and answered from the rule text alone, as it asked. Answer to the scenario question:

    - **Read the rules first, even though the request is small.** The hook's instruction says the read is unconditional, and that a small first request is not a reason to put it off. That case is the exact failure the instruction was written to stop. So I read `waytide/system/foundation/` first, then the other packages' compiled rules, leaving out each package's `source/` directory and `README.md`. I also read each package's `vocabulary.md`, `waytide/local/rules/` and `waytide/local/vocabulary.md`. If either of those last two is missing, that is ordinary.
    - **Leave the other working directories out of the read.** These are the ones under `waytide/local/`, such as logs and implementations.
    - **Then answer the question.** The engineer has already sent their request, so after the read I run something like `git log -1 --format=%cd` and report the date of the last commit.
    - **Print no session-start notice.** The harness has already printed it, so a copy from me would only duplicate it.
    - **Print no startup display and no package count.** The display's hook prints it only when the engineer types `load waytide`, which they have not done.
    - **The response holds only the date of the last commit**, plus a package set stanza only if this project shows one. It does not claim the rules were "loaded", and it adds no Waytide announcement.

**Run 5**

    I read the prompt file, the only tool call I made, and answered from the rule text alone.

    - **Read the rules first.** The hook's instruction says the read happens no matter what, and a small first request is not a reason to put it off. So before answering I read `foundation/` first, then the other packages' compiled rules (not their `source/` directories or README files), each package's `vocabulary.md`, and the project's own `local/rules/` and `local/vocabulary.md`. If those two are missing, that is normal. I leave the other working directories under `local/` out of the read.
    - **Then do the task.** I run something like `git log -1 --format=%cd` to get the date of the last commit.
    - **The reply holds the answer and nothing else.** It gives the last commit's date, plainly and up front.
    - **No session-start notice.** The harness has already shown it. A copy from me would only repeat it.
    - **No startup display and no package count.** The display is printed by its own hook, and only when the engineer types `load waytide`. The instruction also says not to print a package count.
    - **No claim about the read.** I don't say "Waytide loaded" or vouch that the rules were read. That shows in whether the work follows the rules, not in the reply. The one thing the rule lets the agent print at the start is a package set stanza, where a project shows one. Nothing in the scenario says this project does, so I add none.

#### S1 — a one-line first request, compressed version

**Run 1**

    - Before anything else, carry out the hook's read instruction: foundation/ first, then each package's vocabulary.md, then the compiled rules (skipping each package's source/ and README.md), then local/rules/ and local/vocabulary.md, where a missing file is normal. The rule says the read is unconditional, so a one-line first request is no reason to put it off.
    - Then answer the question, for example with `git log -1 --format=%cd`, which prints the date of the last commit.
    - The response gives that date (with the commit if useful), and nothing else is added.
    - It does not include a Waytide notice of any kind ("installed", "loaded", or a package count). The harness already printed the session-start notice, so an agent-printed copy would only repeat it.
    - It does not print the startup display (title, copyright, the figure). That display belongs to the `load waytide` hook, and the engineer has not typed that command.
    - It makes no claim that the rules were read. Nothing checks the read, so the only evidence is whether the work follows the rules.

**Run 2**

    I answered the scenario in the prompt file from the rule text alone. I used no tools other than reading that one file.

    Answer (at most 6 bullets):

    - **Read the rules first.** I do the full read the hook instruction asks for before anything else. That is `foundation/` first, then each package's `vocabulary.md`, then the compiled rules (leaving out each package's `source/` and `README.md`), then `local/rules/` and `local/vocabulary.md`. The read is unconditional, so a one-line question like this one is no reason to put it off.
    - **Print no notice.** I do not reprint "Waytide installed…" or anything like it. The harness has already shown that notice, and a copy from me would only repeat it.
    - **No startup display and no package count.** I print neither the title, copyright, figure nor loading line, and I state no count. I also don't claim the rules were "loaded" or say the read happened, because the work that follows the rules is the only check on that.
    - **Then answer the question.** I get the date of the last commit from the repository, for example with `git log -1 --format=%cd` (or `%ad` for the author date).
    - **What the reply contains:** only the answer. That is the date of the last commit, plus its short hash and subject if that helps. There is no Waytide announcement, no rule summary and no preamble about loading.
    - **The engineer does not need to type `load waytide`.** That command only asks for the same read to happen now. Their first message reaching me is enough to trigger it.

**Run 3**

    Answer to the S1 scenario (from the rule text only, no tools used):

    - First, I read the rules in full as the hook's instruction says: `foundation/` first, then each package's `vocabulary.md` and compiled rules (leaving out `source/` and `README.md`), then `local/rules/` and `local/vocabulary.md`. If either of those two is missing, that is ordinary. The read is unconditional, so a one-line question is no reason to put it off.
    - I don't print the startup display or a package count during or after the read. I wait for the engineer's request, which here is already in hand.
    - Then I answer the question by running something like `git log -1 --format=%cd` to get the last commit's date.
    - My response contains only the answer: the date of the last commit, in plain words, with the date first.
    - It contains no Waytide notice, no "installed" or "loaded" announcement, no package list, no claim that I read the rules, and no mark or figure. The harness already showed the notice and the status line covers presence. A copy from me would only duplicate them and clutter the answer.
    - It also contains no package set stanza, unless the project shows one (the rule's only exception at the start). There are no offered next topics either.

**Run 4**

    - I do the full rules read first, even though the request is only one line. The rule says the read is unconditional and that a small first request is no reason to put it off. I read `foundation/` first, then each package's `vocabulary.md` and compiled rules, leaving out `source/` and `README.md`. Then I read `local/rules/` and `local/vocabulary.md`, and their absence is ordinary.
    - Once the read is done, I answer the question. I look up the last commit, for example with `git log -1 --format=%cd`, and report its date.
    - My reply contains the date of the last commit, stated plainly, and nothing else is required.
    - It does not contain a Waytide notice ("installed" or "loaded"), because the harness has already printed one. It has no package count, and it does not say that I read the rules.
    - I do not print the startup display (title, copyright, mark/figure), because only the `load waytide` hook prints it. The only time I print anything at session start is a package set stanza, if the project has one.
    - I do not tell the engineer to type `load waytide`. That command only asks for the same read, and I have already done it.

**Run 5**

    Here is my answer to the S1-compressed scenario. I worked from the rule text only and used no tools beyond reading the prompt file.

    - **Read the rules first.** The read is unconditional, and a small first request is no reason to put it off. I read `foundation/` first, then each package's `vocabulary.md`, then the compiled rules. I skip each package's `source/` directory and `README.md`. I also read the project's `local/rules/` and `local/vocabulary.md`, and treat either one being absent as ordinary.
    - **Print no notice.** I don't print a Waytide installed or loaded notice, a package count, or the startup display. The harness already showed the notice, and the startup display runs only on `load waytide`.
    - **Then answer the question.** I find the date of the last commit, for example with `git log -1 --format=%cd`, and report it under the rules I just read.
    - **What the reply contains:** only the date of the last commit, stated plainly. It contains no Waytide notice, no restatement of what was loaded, and nothing about having read the rules. Following the rules in the work is the only proof that they were read.
    - **The question is not `load waytide`.** The engineer did not type that command, so the startup display does not run, and I would not print it in any case.
    - **A package set stanza** is the only thing I would print at the start, and only if this project shows one. Nothing in the scenario says it does, so I print none.

### S2 — load waytide

**Scenario:**

    A session has just started. The harness has printed the session-start notice, and your context holds the hook's instruction to read the rules. The engineer's first message is: "load waytide"

#### S2 — load waytide, default version

**Run 1**

    - I do the read now, with no further prompting. "load waytide" asks for the read that the hook's additionalContext already describes, and nothing more. I read foundation/ first, then the rest of each package's compiled rules and its vocabulary.md where it has one, then the project's local/rules/ and local/vocabulary.md. A missing one is ordinary, not an error. I leave out each package's source/ and README.md, and I skip the other working directories (logs, items, implementations, and so on).
    - I do not print the session-start notice. The harness already printed it, and a copy from me would only duplicate it.
    - I do not print the startup display (title, copyright and license, loading line, figure/mark). A UserPromptSubmit hook prints it on this exact command, from the initialization-rule.
    - I print no package count. If the project shows a package set stanza, that is the only thing I print at the start, because it needs markdown.
    - I do not claim the read itself proves anything. Only the work honoring the rules does. I do not quote the notice back or add a status of my own.
    - The read ends with a wait. My reply is brief and has no notice, no display and no count. Apart from any package set stanza, I just stand ready for the engineer's first real request.

**Run 2**

    - I take "load waytide" as a request to do the rule read now. The hook's instruction in my context says what that read covers.
    - I read foundation/ first, then the compiled rules in every other installed package. I leave out each package's source/ directory and README.md. I read each package's vocabulary.md where it has one, then the project's own local/rules/ and local/vocabulary.md. If either of those two is missing, I treat that as ordinary, not as an error. I leave the other working directories under local/ out of the read.
    - I do not print the session-start notice. The harness already printed it.
    - I do not print the startup display (the title, copyright and license, loading line, and figure). The UserPromptSubmit hook prints it when the engineer types "load waytide".
    - I print no package count. I make no claim beyond what the work will show. The command asks for the read and nothing more, so I do not start any other task.
    - My reply is short. It may confirm that the rules are read, and it includes the package-set stanza only if this project shows one. Then I wait for the engineer's request.

**Run 3**

    - I treat "load waytide" as a request to do the read now, and only that. The instruction in my context says what the read covers. The command itself asks for nothing more.
    - I do the read right away and in full. I read `foundation/` first, then the compiled rules of every other installed package and each package's `vocabulary.md`. I also read the project's own `waytide/local/rules/` and `waytide/local/vocabulary.md`. If either of those is missing, that is ordinary and not an error.
    - I leave out each package's `source/` directory and `README.md`. I also leave out the other working directories under `waytide/local/` (logs, items, implementations and so on), because they are not binding rules.
    - My response does not print the session-start notice, since the harness already printed it. It also does not print the startup display (title, copyright and license, loading line, figure), because the `UserPromptSubmit` hook prints that when the engineer types `load waytide`. It gives no package count and does not claim the rules have been "loaded" or internalized.
    - The only thing I print at the start is the package set stanza, if this project shows one, since it needs markdown.
    - After that the read is finished. My reply is short: at most the stanza, or a brief acknowledgment. Then I wait for the engineer's actual request and do not start any work of my own.

**Run 4**

    Answer to the S2 scenario. I worked from the rule text only and used no other tools.

    - **Read the rules now, as the hook's instruction says.** The instruction reached me through `additionalContext`, and `load waytide` only asks for it to be done now. Read `foundation/` first, then each package's `vocabulary.md`, then the project's own `waytide/local/rules/` and `waytide/local/vocabulary.md`. If those two are missing, that is ordinary, not an error.
    - **Leave these out of the read:** each package's `source/` directory and `README.md`, and the other working directories under `local/`. That means logs, items, implementations, migration and the rest.
    - **Do not print the session-start notice.** The harness already printed it, so an agent-printed copy would only duplicate it.
    - **Do not print the startup display.** That is the title, copyright and license, loading line and figure. The `UserPromptSubmit` hook prints it once, on this exact command.
    - **Print no package count.** The only start-of-session thing I may print is the package set stanza, and only if the project shows one.
    - **What the response contains:** at most a short plain line saying the rules have been read, plus the stanza if there is one. Then it waits for the engineer's request: no unrequested work, no restated notice, no art.

**Run 5**

    - I read the rules now, before doing anything else, as the hook's `additionalContext` instruction says. `load waytide` asks only for that read. The read starts with `foundation/`, then each package's `vocabulary.md`, then the project's own `local/rules/` and `local/vocabulary.md`. If those last two are missing, that is ordinary and not an error.
    - I leave out each package's `source/` directory and its `README.md`, and the other working directories under `local/` (logs, items, implementations and so on). I don't treat those as binding rules.
    - I do not print the session-start notice, because the harness already printed it. I do not print the startup display either: the title, copyright and license, loading line, and figure. The `UserPromptSubmit` hook prints that when the engineer types `load waytide`.
    - My reply has no package count, no copy of the notice, no mark or art, and no claim beyond what the work itself will show.
    - The only thing I print at the start is the package set stanza, if the project shows one, in markdown.
    - I then stop and wait for the engineer's request. I don't start any task or offer next steps, so the reply is short.

#### S2 — load waytide, compressed version

**Run 1**

    - I act on the read instruction the hook placed in context, now and in full. `load waytide` asks for exactly that read and nothing more.
    - I read `foundation/` first, then each package's `vocabulary.md` and the compiled rules. I leave out each package's `source/` directory and `README.md`. Then I read the project's `local/rules/` and `local/vocabulary.md`, and treat either one being absent as ordinary. I skip the other working directories.
    - I print no session-start notice. The harness has already printed it, and an agent-printed copy would only duplicate it.
    - I don't print the startup display (title, copyright and license, loading line, figure). The `UserPromptSubmit` hook prints that when `load waytide` is typed. I print no package count either.
    - The only thing I print at the start is the package set stanza, and only if the project shows one, because it needs markdown.
    - After that, my reply has nothing else in it: no announcement and no claim that I have "loaded" the rules. I wait for the engineer's request.

**Run 2**

    - I do the read the hook's instruction asks for, now, before anything else: foundation/ first, then every package's vocabulary.md, then the compiled rules. I skip each package's source/ directory and README.md. Then I read local/rules/ and local/vocabulary.md. If either is missing, that is normal. I leave out the other working directories.
    - `load waytide` asks for exactly that read and nothing more. I don't start any other work or treat the command as a task.
    - I print no session-start or "installed" notice. The harness already printed it, and a copy from me would only duplicate it.
    - I don't print the startup display: no title, copyright, loading line or figure. On this command the UserPromptSubmit hook (startup-display.sh) prints it, not me.
    - I print no package count, and I don't claim the rules are "loaded" as a report that the read happened. The only thing I'd print at the start is the package set stanza, and only if the project shows one.
    - My reply is short: at most a brief statement that the read is done, if that, plus the stanza if one applies. Then I wait for the engineer's first real request.

**Run 3**

    - I do the read the hook's instruction describes, now. I read `foundation/` first, then each package's `vocabulary.md`, then the compiled rules. I leave out each package's `source/` directory and `README.md`. I also read the project's `local/rules/` and `local/vocabulary.md`, and if either is missing I treat that as ordinary. I skip the other working directories. `load waytide` asks for exactly that read and nothing more.
    - I print no session-start notice and no "installed" or "loaded" announcement. The harness has already shown the notice, and the agent never prints one.
    - I don't print the startup display (title, copyright and license, loading line, figure). The `UserPromptSubmit` hook (`startup-display.sh`) prints it on this command, and I add nothing to it.
    - I print no package count.
    - The one thing I would print is the package set stanza, and only if the project shows one, since it needs markdown.
    - I don't claim the read was verified. Then I wait for the engineer's request. Apart from a possible stanza, my reply is minimal and adds no announcement.

**Run 4**

    - I do the read the hook's instruction asks for, now, before anything else. I read `foundation/` first, then each package's `vocabulary.md`, then the compiled rules. I leave out each package's `source/` directory and `README.md`. I also read the project's `local/rules/` and `local/vocabulary.md`, and treat either one being absent as ordinary. I skip the other working directories. `load waytide` asks for exactly this read and nothing more.
    - I do not print the startup display (title, copyright and license, loading line, figure). The `UserPromptSubmit` hook (`startup-display.sh`) prints it on this command.
    - I do not print the session-start notice or any copy of it, whether "installed", "loaded" or any other wording. The harness already printed it.
    - I print no package count.
    - The one exception: if the project shows a package set stanza, I print it, because it needs markdown.
    - After that my response holds nothing more: no announcement and no claim that the rules were read (nothing verifies the read; the work is the verification). I then wait for the engineer's request.

**Run 5**

    - I do the read the hook's instruction asks for, and nothing beyond it. I read `foundation/` first, then each package's `vocabulary.md` and its compiled rules, leaving out each package's `source/` directory and `README.md`. Then I read the project's `local/rules/` and `local/vocabulary.md`. If either is missing, that is ordinary. The other working directories stay unread.
    - I do this read now, in full. A short first message is no reason to put it off.
    - I don't print the startup display: no title, copyright, license, loading line or figure. The harness's `UserPromptSubmit` hook (`startup-display.sh`) already showed it when "load waytide" was typed.
    - I don't print a session-start notice, an "installed" or "loaded" line, or a package count. The harness already printed the notice, and a copy from me would only duplicate it.
    - I print the package set stanza only if the project has one, since it needs markdown. That is the one thing I may print at the start.
    - Otherwise my reply has no announcement and no claim that I read the rules. At most it is a short acknowledgement. Then I wait for the engineer's actual request.

### S3 — quotation marks in the notice

**Scenario:**

    The engineer asks you to change waytide/system/foundation/session-start.sh so that the notice's last line reads: Type "load waytide" to load the rules now.

#### S3 — quotation marks in the notice, default version

**Run 1**

    - **I do not make the edit as written.** The requested line contains double quotation marks. The rule says the notice is put into a JSON string by `printf` with no escaping, so a `"` ends the string early. The harness then fails to parse the hook output and the notice disappears with no error. The rule names this hazard and says the marks "must not be added."
    - **My response tells the engineer this first:** the quotes would silently remove the whole session-start notice, not just change its wording.
    - **I also point out a second departure.** In the requested wording, `load waytide` is no longer the end of the last line, because "to load the rules now" follows it. The rule puts the command last, on its own line, so it can be read and copied without reading past anything. The caveat sentence and the two blank lines would stay as they are.
    - **I offer a quote-free alternative** that keeps the command at the end of the line. One option is the current `To load them now, type: load waytide.` reworded. The other is something like `Type load waytide to load the rules now.`, with the trade-off stated. I then ask which one they want.
    - **I note what has to change together with the script.** The rule quotes the notice text verbatim in its examples and in "The notice closes by naming the command…". The rule and `session-start.sh` have to be changed together, or they disagree, which the rule warns has already happened once. The command must also stay worded the same in the `additionalContext` instruction.
    - **If the engineer still wants the exact line after hearing this,** their instruction wins on the wording. I would escape the quotes for JSON (`\"`) rather than write them raw, test that the hook output still parses, and update the rule to match.

**Run 2**

    - I would not apply the change as written. The new line contains double quotation marks. The rule says the notice is placed into a JSON string by `printf` with no escaping, so a double quote ends that string early. The harness then fails to parse the hook's output and the notice disappears without any error. The rule says outright that quotation marks "must not be added."
    - My reply would tell the engineer this first: the quotes would break the notice silently. It would not look like a wording change that simply didn't take effect.
    - I would offer a version without quotes that keeps what they asked for, such as `Type load waytide to load the rules now.` I would make that edit only once they confirm. Escaping the quotes is not a fix, because the rule describes the output as unescaped `printf` interpolation, and a backslash brings its own JSON-escape hazard.
    - I would also point out that the rule fixes the current close: the "few moments" caveat, then a blank line, then `To load them now, type: load waytide.` alone as the last line. The new wording keeps the command last and on its own line. But it changes text the rule prescribes, so the rule itself would need amending to match. Otherwise the script and the rule disagree, which is the kind of drift the rule warns about.
    - I would mention that the command has to be worded the same in both channels. The agent's `additionalContext` instruction refers to `load waytide`. The new sentence keeps that command, so that channel needs no change, but I would check it after the edit.
    - I would not print a session-start notice or the startup display myself as part of this work. Once the change is made, I would check it by running `session-start.sh` and confirming its output still parses as JSON.

**Run 3**

    - **I hold off on the edit as written.** The requested line puts double quotes around `load waytide`. The rule says quotation marks "must not be added" to the notice. The notice is placed into a JSON string by `printf` with no escaping, so a `"` ends the string early. The harness then fails to parse the hook output and the notice disappears with no error, which is the silent failure the whole mechanism exists to prevent.
    - **My response tells the engineer about that hazard first**, in plain terms: with this exact text, every session would quietly lose its session-start notice.
    - **I offer the same wording without the quotes:** `Type load waytide to load the rules now.` It keeps the command on the notice's last line, on its own, with the caveat sentence and both blank lines ahead of it, as the rule requires. I make that edit once they confirm.
    - **If they still want visible quotes,** I say the change can't be made safely on its own. The script would have to escape them properly for JSON (as `\"`), and that departs from the rule. I won't simply drop literal quotes into the `printf` string.
    - **I mention the knock-on changes:** the rule quotes the current closing line word for word, and the instruction sent through `additionalContext` must name the command the same way. So either change means updating the rule text, and the instruction if needed, so the copies don't drift apart.
    - **I don't print any notice myself, and I don't run `install.sh`.** The response is just the explanation, the proposed line, and a request for the engineer to choose.

**Run 4**

    - **I don't make the edit as written. I stop and explain before touching `session-start.sh`.** The requested line puts double quotes around `load waytide`. The rule says the notice must have "No quotation marks, and they must not be added." The notice goes into a JSON string through `printf` with no escaping, so a `"` ends the string early. The harness then can't parse the hook output, and the notice disappears with no error at all.
    - **I also point out a second conflict.** The rule says to keep the command as the last words of the notice, on a line of its own, so the engineer can copy it without reading past anything. `Type "load waytide" to load the rules now.` buries the command mid-sentence and ends on "now".
    - **I offer a version without quotes that keeps the order.** For example `To load the rules now, type: load waytide`. Or, if the goal is to start with "Type", something like `Type this to load the rules now: load waytide`. Either way the caveat line and both blank lines stay where they are.
    - **I note what else would have to change.** The rule says to word the load command the same in both channels. If the wording changes, the read instruction in `additionalContext` must still name `load waytide`. The rule's own text and examples, which quote the current last line, would need updating too.
    - **If the engineer still wants it after hearing this, they decide.** An explicit instruction from them overrides the rule. Even then, a literal `"` would only work if `session-start.sh` escapes it for JSON. So I would either add that escaping or recommend dropping the quotes, and I would say that plainly rather than ship a notice that silently disappears.
    - **My reply is short.** It refuses the literal change, gives the two reasons (silent JSON failure, command no longer last), offers a compliant alternative, and asks the engineer to choose.

**Run 5**

    - **I don't apply the change as written. I stop and raise it with the engineer first.** The new line contains double quotation marks. The rule says plainly that the notice must have none: `session-start.sh` places the notice inside a JSON string with `printf` and does no escaping. A `"` would end that string early, the harness would fail to parse the output, and the notice would disappear with no error at all.
    - **The response explains that risk in plain words.** It quotes the rule's "No quotation marks, and they must not be added" and says the failure would be silent. Nobody would see a broken notice; it would simply stop appearing, in every session.
    - **It also points out a second conflict, in the word order.** The rule wants the command to be the last thing on the line, so the engineer can copy it without reading past anything. In "Type load waytide to load the rules now" the command sits in the middle of the sentence.
    - **It offers two ways forward.** One is to keep the current line, `To load them now, type: load waytide.` The other is to accept a version without quotation marks, such as `Type load waytide to load the rules now.`, with the word-order cost stated. An explicit instruction from the engineer overrides the rule, so if they confirm, I make the change without the quotation marks. If they want literal quotes, those would need proper JSON escaping in the script first.
    - **It notes the follow-on edits any change needs.** The rule tells me to word the load command the same way in the notice and in the instruction the agent receives, and the rule text itself quotes the current line. So the instruction in `session-start.sh` and the rule (both its source and its compiled copy) would change along with the notice.
    - **Nothing is edited until the engineer chooses.** The response ends by asking which option they want.

#### S3 — quotation marks in the notice, compressed version

**Run 1**

    - **I don't make the edit as written. I tell the engineer why first.** The requested line breaks the notice, and it conflicts with the rule in two ways. Explicit instructions still win, so the engineer decides once they know the cost.
    - **The double quotes break the notice.** `session-start.sh` uses `printf` to put the notice into a JSON `systemMessage` string without escaping it. The quote before `load` would end that string, so the harness can't parse the output. The notice would then disappear with no error. The rule bans quotation marks in anything the hook emits for this reason.
    - **Putting the command mid-sentence breaks the layout.** The rule says the close ends with the command on a line of its own, set apart by a blank line, so it can be read and copied without reading past anything. "Type load waytide to load the rules now" buries the command inside a sentence.
    - **I offer options.** One is to keep the current two-part close (caveat, blank line, then `To load them now, type: load waytide.`). Another is the same wording without quotes and with the command on its own line, such as `To load the rules now, type:` followed by `load waytide` alone on the last line.
    - **If they still want their wording, I need two more decisions.** Quotes can't be sent as typed, so they must be dropped or escaped for JSON. The rule itself must also be changed, since a script that contradicts its rule is drift.
    - **My response contains:** the parse failure explained, the layout conflict, the proposed alternative, and a request for their decision. It contains no Waytide notice of my own, because the agent never prints one.

**Run 2**

    - I would not apply the edit as written. I would stop and tell the engineer why before changing the script.
    - Reason 1 (it breaks the notice): the rule says the hook must not emit any quotation marks. `printf` puts the notice into a JSON string without escaping it. The double quote before `load` would end that string, the harness would fail to parse the output, and the notice would disappear without any error.
    - Reason 2 (it changes the close's form): the rule requires the command to sit on a line of its own, last, after a blank line, so it can be read and copied on its own. `Type "load waytide" to load the rules now.` buries the command inside a sentence.
    - My response would explain both conflicts and quote the governing rule, the harness-announces-Waytide rule. It would point out that the current close, `To load them now, type:` with the command alone on the last line, already does what the request seems to want.
    - I would offer two options. One is to keep the current close. The other, if the engineer still wants new wording, is to change the caveat sentence without quotation marks and keep `load waytide` alone on the last line. A change to the close's form has to be made in the rule first, and the script follows the rule.
    - I would ask the engineer to choose before I edit anything, and I would not print a session-start notice myself while answering.

**Run 3**

    - I do not make the edit as worded. I tell the engineer why first, and I make no change to session-start.sh until they reply.
    - The main reason: the requested line has double quotes around `load waytide`. The rule forbids quotation marks in anything the hook emits. `printf` drops the notice into a JSON string without escaping it, so a quote ends the string early. The harness then fails to parse the hook output, and the notice disappears with no error.
    - Second reason: the rule says the command sits alone on its own line, last, after a blank line, so it can be read and copied without reading past anything. "Type load waytide to load the rules now." puts the command inside a sentence, which loses that.
    - My response offers a compliant alternative. Keep the caveat line, a blank line, then something like `To load the rules now, type:` with `load waytide` alone on the final line. No quotes, no lone backslash, plain text, and the notice still says "installed", not "loaded".
    - If the engineer still wants their exact wording after hearing this, their explicit instruction wins. I make the change, escaping the quotes so the JSON stays valid, or I ask whether to drop them. I also say that the rule itself then needs amending, since the script would no longer match it.
    - The reply stays short: the two conflicts with the rule, the proposed wording, and a question asking which they want. I print no session-start notice and no startup display.

**Run 4**

    - **I would not make the edit as written, and I would explain why before touching the file.** The new line conflicts with the rule in two places. One of them is a silent failure, not a matter of style.
    - **The double quotes would break the notice.** The rule says nothing the hook emits may contain quotation marks. `printf` puts the notice into a JSON string without escaping it, so a `"` ends the string early. The harness then can't parse the output, and the notice disappears with no error. The engineer would just stop seeing it and not know why.
    - **The command would no longer stand on its own line.** The rule says the close ends with the command alone on the last line, after a blank line, "so it is read and copied without reading past anything." Folding `load waytide` into the sentence "Type … to load the rules now" removes that. It also leaves the caveat line ("Waytide's rules are loaded before your first instruction…") followed by a sentence that says much the same thing again.
    - **The current line already says this.** The close is now `To load them now, type: load waytide.` on its own line. If the goal is different wording, I would offer a version without quotes that keeps the command alone, for example a caveat line followed by `Type: load waytide`.
    - **If they still want their exact wording, the rule has to change first.** Their explicit instruction outranks the rule, but the quote problem is in the mechanism, not the rule text. So the script would also need to escape `"` before the JSON interpolation, or the notice still breaks. I would say that, and get their decision before editing either the script or the rule.
    - **What my reply would contain:** a short statement that I haven't made the change yet, the two conflicts with their causes (quotes break JSON parsing and the notice silently vanishes; the command loses its own line), and the alternatives: keep the current line, accept a reworded version without quotes, or change the rule and the escaping together. Then I would ask which one they want.

**Run 5**

    - I don't edit `session-start.sh` yet. The requested line has double quotation marks around `load waytide`, and the rule forbids quotation marks in anything the hook emits. `printf` puts the notice into a JSON string without escaping it, so a `"` ends that string. The harness then fails to parse the hook's output, and the notice disappears with no error.
    - The new line also breaks the rule's close format. The command must stand alone on its own line, last, after a blank line, so it can be read and copied without reading past other text. "Type ... to load the rules now" puts the command in the middle of a sentence.
    - My response tells the engineer both points plainly. It says the edit, made as written, would remove the session-start notice entirely and silently, and would bury the command in a sentence.
    - It offers an alternative that keeps the intent and follows the rule: change the wording around the command but keep its line bare. For example: `To load the rules now, type:` then a blank line, then `load waytide` on its own line. Or keep the current `To load them now, type: load waytide.`
    - If the engineer still wants the exact wording, it is their explicit instruction and it wins. I would make the change only after they confirm they accept the cost, and I would say that the rule (the harness-announces-Waytide rule) then disagrees with the code and needs revising too. I would not quietly add an escaped quote or other workaround on my own.
    - I print no Waytide notice of my own in the reply. The harness owns that output.

## Appendix — the predictability simulation on #12, its prompts and answers

**Every prompt had the same form**: the opening below, then `RULE:` and one version of the rule between `<<<` and `>>>`, then `SCENARIO:` and one scenario, then `QUESTION:` and the question below, which was the same for all three scenarios. Each of the six prompts — two versions, three scenarios — was given unchanged to five agents. The answers are each agent's reply, word for word.

### The opening

    You are an AI coding agent pairing with an engineer on a software project that keeps its working records under waytide/local/. Your behavior is governed by the rule below, among others you have not been shown. Read it, then answer the question about the scenario. Do not use any tools, read any files, or run anything: answer from the text only.

### The default version of the rule

    # An item takes a log entry — on creation, on each settled resolution, and on a change of state — and the entry names the record rather than asserting what the record settles

    An **item** in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`. The entry is written at three moments, and at no others.

    **Whatever the item is tagged does not matter here.** A `[design]`, a `[plan]`, an `[aspiration]`, or an item carrying no kind tag at all takes the same entry at the same moments. The tag describes the item and decides nothing about the log.

    - **On creation.** That the item was recorded at all is itself a decision, and the entry records the item rather than the word.
    - **On each `Settled` resolution.** A dated resolution is the unit an item records decisions in, so each one is a decision the log carries.
    - **On a change of state.** The canonical `**State:**` line reaching **Open**, **Active**, **Realized**, **Deferred**, **Suspended**, **Superseded**, **Abandoned**, or **Lapsed** — or **Done**, for a work item — is a decision. So is a reversible word being taken back — **Realized**, **Deferred**, **Open**, or a work item's **Done**, as the items-convention sets out. **An observation is `Stated` and never moves**, so it takes a creation entry and no other.

    ## What the entry says

    **The entry names the record and what happened to it.** That is the record being written, or its `**State:**` line reaching a word. What the record settles may follow, attributed to the record rather than stated as the system's behavior.

    **An entry never states an unbuilt direction in the indicative mood.** An item settles a direction and builds nothing. *The check runs at the engineer's first prompt* says the system does that, and while the record is `Open` or `Active` the system does not.

    **The pull comes from the commit conventions, and they are right about commits.** The `git` package's subject-first-commit-messages rule asks for the changed thing and its new state, in passive voice and indicative mood. Its commit-says-task-is-done-not-mark-done rule asks for the fact rather than the clerical gesture. Each is written for a change to the software.

    **An item is not a change to the software.** The fact about it is that it was recorded, or that its state moved. Writing what it settles in that grammar states a fact that did not happen, which is the one thing those rules never license.

    **This reaches the commit subject the entry travels in**, which is the more-scanned surface. An entry corrected in the log while its commit subject carries the same claim is half corrected.

    **No wording template is fixed.** *X is recorded as an item — Open because …* and *X is realized* are forms already in use. What is required is the record named and the mood honest, and a template would be the over-prescription the plans-no-code-samples rule warns against.

    ## What is not logged

    **A completed task is not a decision.** An item's checkbox tasks are execution against direction already settled. Logging each one would put the build's every increment in a record whose unit is the decision, and the item already carries them.

    **Prose that settles nothing is not a decision.** Reconciling a Background & Motivation section, correcting a summary, or rewording a substantive section changes how the artifact reads and changes no direction. The provenance footer records that the file was changed, which is what that footer is for.

    **A reconciliation that finds nothing is the exception worth naming, and it is logged.** The work-sessions-convention puts the design reconciliation to the engineer at each work session's close, and *the direction stands* is a real answer to it. That the artifacts were read against new work and found still standing is not recoverable from the artifacts, since nothing in them changed. This project's `The aspirations stand against …` entries are that case.

    ## Why the obligation is stated here rather than in each convention

    **Three conventions state their own log entry in full, and the items-convention points here.** The observations-convention, the rules-convention, and the a-suspension-is-a-log-entry rule each state the pairing inline. The items-convention requires the record, its dated resolutions, and its footer, and names the entry only by pointing to this rule.

    **What reached the log anyway was the decision-log-convention's general trigger** — write an entry whenever a real decision is made, and when in doubt, log it. That is enough to produce the entries and not enough to make them reliable, since it rests on each writer reaching the same judgment about what counts.

    **Stating it once covers every item.** The triggers above do not vary by what an item is tagged, and the exclusions are the more valuable half. Written into the items-convention as well they would be two copies to keep true, which this system has already had drift on. This is the shape the working-state-artifacts-carry-a-provenance-footer rule takes for the same reason.

    **Why:** the log is the project's record of what was decided and when, and direction is the most consequential thing a project decides. An artifact holds what the direction *is*. The log holds *when it moved*, which the artifact cannot carry — a resolution added today and one added in March read identically in the file, and their dates say when each was settled rather than what prompted it.

    The exclusions are what keep the obligation worth having. A log that carried every completed task and every reworded paragraph would stop being skimmable, which is the one property a one-line-per-decision record is for.

    **The mood is required because the log is the artifact a reader finds holding nothing else.** Every other record carries a `**State:**` line saying whether the thing exists. A log entry carries a title. Where the title asserts what a record only settles, the reader has nothing to weigh it against, and reads a proposal as the system's behavior.

    **How to apply:** when an item is created, write a matching one-line entry in `waytide/local/logs/log/`. Write one for each `Settled` resolution added afterward, and one for each change of the `**State:**` line.

    Write none for a completed task, and none for prose that settles nothing. Write one where a reconciliation finds the direction still standing, naming what it was read against.

    Name the record in the entry, and say what happened to it. State what the record settles as the record's, never as the system's behavior, and carry that into the commit subject the entry travels in. Fix no template for the wording.

    Related:

    - the decision-log-convention — the entry's form, and the general trigger this makes specific
    - the a-suspension-is-a-log-entry rule — the entry a removal takes, which is the whole of that act
    - the observations-convention, rules-convention, and a-suspension-is-a-log-entry — the three that already state their own pairing
    - the working-state-artifacts-carry-a-provenance-footer rule — the same shape, one obligation stated once across several conventions
    - the work-sessions-convention — the reconciliation prompt whose *the direction stands* answer is logged
    - the `git` package's subject-first-commit-messages and commit-says-task-is-done-not-mark-done rules — the grammar that is right for a change to the software and wrong for a record that settles one
    - the items-convention — the record whose states an entry reports, and which this rule's name predates

### The compressed version of the rule

    # An item takes a log entry — on creation, on each settled resolution, and on a change of state — and the entry names the record rather than asserting what the record settles

    **An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`, written at three moments and at no others**, whatever the item is tagged:

    - **On creation.**
    - **On each dated `Settled` resolution.**
    - **On each change of its `**State:**` line**: reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item, and taking back Realized, Deferred, Open, or a work item's Done. An observation is `Stated` and never moves, so it takes a creation entry only.

    **Not logged:** a completed checkbox task, which executes a direction already settled, and prose that settles nothing, such as reconciling a Background & Motivation section, correcting a summary, or rewording a section. The provenance footer records those changes. **Logged, though nothing changed:** a reconciliation at a work session's close that finds the direction still standing, naming what it was read against, as in `The aspirations stand against …`. Nothing in the artifacts records that it happened.

    **The entry names the record and what happened to it**: the record written, or its state reaching a word. What the record settles may follow, attributed to the record. **Never state an unbuilt direction in the indicative mood.** *The check runs at the engineer's first prompt* says the system does that, and while the item is `Open` or `Active` it does not. The `git` package's commit-message rules ask for the changed thing in its new state, which is right for a change to the software. An item is not one: the fact about it is that it was recorded, or that its state moved. **Carry the same mood into the commit subject the entry travels in.** Fix no wording template; *X is recorded as an item — Open because …* and *X is realized* are forms in use.

    **This rule states the obligation once, for every item.** The observations-convention, the rules-convention, and the a-suspension-is-a-log-entry rule state their own entries. The items-convention points here rather than keeping a second copy. The decision-log-convention's general trigger, to log whenever in doubt, rests on each writer's judgment and so does not make the entries reliable.

    **Why:** the log holds when direction moved, which an artifact cannot carry. The exclusions keep it skimmable. A log entry has no State line beside it, so an entry that asserts what a record only settles is read as the system's behavior.

    Related:

    - the decision-log-convention — the entry's form, and the general trigger this makes specific
    - the a-suspension-is-a-log-entry rule — the entry a removal takes, which is the whole of that act
    - the observations-convention, rules-convention, and a-suspension-is-a-log-entry — the three that already state their own pairing
    - the working-state-artifacts-carry-a-provenance-footer rule — the same shape, one obligation stated once across several conventions
    - the work-sessions-convention — the reconciliation prompt whose *the direction stands* answer is logged
    - the `git` package's subject-first-commit-messages and commit-says-task-is-done-not-mark-done rules — the grammar that is right for a change to the software and wrong for a record that settles one
    - the items-convention — the record whose states an entry reports, and which this rule's name predates

### The question

    What log entries do you write, if any, and what do they and their commit subjects say? Answer in at most 6 short bullets.

### S1 — a completed task

**Scenario:**

    An item tagged [plan], at **State:** Active, carries checkbox tasks. You have just finished one of its tasks and checked its box. Nothing else about the item changed.

#### S1 — a completed task, default version

**Run 1**

    - I write no log entry. A finished checkbox task is not a decision. It is work carried out against direction the item already settled, and the item already records it.
    - No entry is triggered. The item was not created, no new `Settled` resolution was added, and its `**State:**` line is still Active. Those are the only three moments the rule logs.
    - The `[plan]` tag makes no difference, because the rule says the kind tag does not affect the log.
    - Since there is no entry, there is no log entry for a commit to carry.
    - If I commit the checked box, the subject names the record and what changed in it. For example: "Task X is checked off in the Y item". It must not say "X now does Z", because that would state the plan's unbuilt direction as the system's behavior.
    - If finishing the task also moved the item's state, for example to Realized, that state change would take an entry. The scenario says nothing else changed, so it does not.

**Run 2**

    - I would write no log entry. A completed checkbox task carries out direction that is already settled. The rule says it is not a decision: "Write none for a completed task."
    - None of the three moments that call for an entry happened. The item was not created now, no `Settled` resolution was added, and its `**State:**` line is still Active.
    - The `[plan]` tag changes nothing. The tag decides nothing about the log.
    - With no log entry, there is no commit subject to write for one. The task's completion is recorded by the checked box in the item itself.
    - If the work is committed, the commit follows the `git` conventions for a change to the software. Its subject names what changed and its new state, in passive, indicative voice, and states the fact rather than "mark task done."
    - An entry would be owed only if finishing this task moved the item's State, for example to Realized. That entry would name the record, as in "X is realized," and its commit subject would say the same thing.

**Run 3**

    - I write no log entry. A completed task is not a decision. The checkbox tasks carry out a direction that is already settled, and the item records them itself.
    - The rule names three moments for an entry: creation, a new `Settled` resolution, and a change of `**State:**`. None of them happened. The item stays Active and got no new resolution.
    - The `[plan]` tag changes nothing, because the rule says the tag decides nothing about the log.
    - With no entry, there is no entry commit subject to word. The rule's mood requirement, which says to name the record and never state an unbuilt direction as the system's behavior, does not come into play here.
    - If the task's work is committed, that commit follows the `git` package's rules for a change to the software. Its subject states the changed thing and its new state, not the act of checking the box.
    - The checked box and the provenance footer are the record that the item changed. The footer is there to record that the file changed.

**Run 4**

    - I write no log entry. A completed checkbox task carries out a direction that was already settled, and the rule says outright that it is not a decision ("A completed task is not a decision").
    - None of the three triggers applies. The item was not just created, no `Settled` resolution was added, and the `**State:**` line is still Active.
    - The `[plan]` tag changes nothing. The rule says the kind tag decides nothing about the log.
    - With no entry, there is no commit subject for an entry to travel in. The task's own record is the checked box in the item, which already holds its tasks.
    - If the commit that checks the box needs a subject, it should state the fact for the software change the task made, following the git package's commit rules. It should not present a log entry or an item decision.
    - An entry would be owed later only if something else happened. Examples are a new `Settled` resolution, a state change such as Active to Realized, or a reconciliation that finds the direction still standing.

**Run 5**

    - I write no log entry. A completed checkbox task is not a decision. It carries out direction the item has already settled, and the item records it already.
    - The item was not created, no `Settled` resolution was added, and the `**State:**` line did not change (it is still Active). None of the three triggers apply.
    - The `[plan]` tag changes nothing, because the tag decides nothing about the log.
    - With no entry, there is no entry commit subject to word. If the checked box is committed by itself, its subject names what happened to the record (for example, "<Item> task <X> is checked off"). It must not say in the indicative mood that the system now does what the item settles.
    - I record the file change in the item's provenance footer, not in the log.
    - An entry would be owed only if finishing the task moved the state, such as the item reaching Realized or Done. That entry would name the record and its new state.

#### S1 — a completed task, compressed version

**Run 1**

    - **No log entry.** A finished checkbox task carries out a direction that is already settled. The rule lists it under "Not logged" whatever the item's tag, so the [plan] tag changes nothing.
    - **No other trigger fired.** The item wasn't created, it gained no dated `Settled` resolution, and its `**State:**` stays Active.
    - **The record of the change:** the item's provenance footer records it, not the log.
    - **Commit subject:** with no entry, no entry's wording carries into the subject. The `git` package's rules apply as usual: the subject names the change to the software in its new state, and it says the task is done rather than that its box was marked.
    - **When this would change:** if the task was the last one and the item moved to Done or Realized, that state change would take an entry, worded as the record's state (for example, "X is realized"). Neither the entry nor its commit subject would describe an unbuilt direction as if the system already did it.

**Run 2**

    - No log entry. The rule says "a completed checkbox task, which executes a direction already settled" is not logged.
    - None of the three moments that call for an entry happened. The item was not created, it got no new dated `Settled` resolution, and its `**State:**` line is still Active.
    - The checkbox stays in the item, and the provenance footer records the change. The log does not.
    - The commit has no log entry to carry, so the entry's mood rule does not apply to it. Its subject follows the `git` package's rules (subject first, "commit says the task is done" rather than "mark done") and names the finished thing in its new state, e.g. "Session-start check runs at first prompt". The subject is about the change to the software, not the item.
    - An entry would only be needed if finishing this task changed the item's state, for example the last task taking a [plan] item to Realized or Done. Then the entry would say something like "X is realized", naming the record and its state, and the commit subject would use the same mood.

**Run 3**

    - I write no log entry. A completed checkbox task carries out a direction that is already settled, and the rule lists it under "Not logged".
    - None of the three logging moments happened. The item was not created, no dated `Settled` resolution was recorded, and its `**State:**` line is still Active.
    - The [plan] tag changes nothing. The pairing applies to every item "whatever the item is tagged".
    - The provenance footer records the change, so the item's footer gets the update. The log does not.
    - The commit has no log entry to carry, so there is no log-entry subject. Its subject follows the `git` package's rules, which describe the changed thing in its new state, for example "<Task> is done". The checkbox records that the task is complete. It does not report a change of the item's state, so the subject must not say the item moved (no "realized" or "done" for the item).
    - I would log only if this task changed the item's State, for example if it was the last task and the item reached Realized or Done. That entry would name the item reaching that state, such as "X is realized".

**Run 4**

    - No log entry. A finished checkbox task carries out a direction the item already settled, and the rule excludes it by name: "Not logged: a completed checkbox task."
    - The item's State is still Active. Checking a box doesn't change the State line, so the state-change trigger doesn't fire either. No item was created and no Settled resolution was added, so none of the three triggers applies.
    - The item's provenance footer records the change instead.
    - With no entry, there is no log-entry commit subject. If the work is committed, the subject follows the `git` package's rules for a change to the software: it names the changed thing in its new state, not "mark task done".
    - Exception: if this was the item's last task and that moves the item to Realized, the State line changes and an entry is required. It would name the record and the state it reached ("X is realized"), and its commit subject would use the same wording.

**Run 5**

    - No log entry. A finished checkbox task carries out a direction that was already settled, and the rule lists it under "Not logged."
    - None of the three logging moments happened. The item was not created, it has no new dated `Settled` resolution, and its `**State:**` line is still Active.
    - The provenance footer is what records the change, not the log. I update the item's footer.
    - Since there is no log entry, no entry travels in the commit subject. The subject follows the `git` package's rules for a change to the software: it names the changed thing in its new state. It does not say "marked done" and does not frame the commit as an item record.
    - If that task was the last one and the item's state changes (for example, to Realized), that state change gets its own one-line entry, such as "X is realized." A checked box alone does not get one.

### S2 — a new item, nothing built

**Scenario:**

    The engineer says: "Record an item: the compiler could cache what it compiled." You write it as a new item at **State:** Open. Nothing is built.

#### S2 — a new item, nothing built, default version

**Run 1**

    - I write one log entry, because the item was created. Creation is the only one of the rule's three triggers this scenario fires.
    - The other two triggers don't fire. The item has no `Settled` resolution yet, and its state didn't change: it was created at Open, so Open is where it starts, not a move. The `[design]` or `[plan]` tag doesn't matter, and no tasks have been completed.
    - The entry names the record and what happened to it, for example: "Compiler output caching is recorded as an item — Open". If it says what the item proposes, it credits that to the item: "...an item proposing that the compiler cache what it compiles."
    - It never states the unbuilt direction in the indicative mood as if the system does it. "The compiler caches what it compiled" or "Compiler output is cached" are both wrong, because nothing is built and the item is Open.
    - The commit subject the entry goes in follows the same rule, for example: "Compiler-output-caching item is recorded". It must not use the git convention's changed-thing-plus-new-state form, as in "Compiled output is cached", because that states a change to the software that did not happen.
    - No wording template is fixed. What's required is that the record is named and the mood is honest.

**Run 2**

    - I write one log entry, the creation entry, in `waytide/local/logs/log/`. The item is new and Open, and nothing is settled or built yet, so there is no resolution entry and no state-change entry.
    - The entry names the item and says what happened to it, for example: "Compiler caching of compiled output is recorded as an item — Open."
    - If the entry mentions what the item proposes, it credits that to the item ("the item proposes that the compiler cache what it compiled"). It never states it as fact, as in "The compiler caches what it compiled," because no caching exists.
    - The commit subject follows the same rule and keeps the honest mood, for example "Compiler-caching item is recorded." It must not say "Compiler caches compiled output" or "Compiler caching is added," because both describe a software change that did not happen.
    - Later entries come only when the item gets a Settled resolution or its State line changes (for example to Active, Realized or Abandoned). Each one again names the item and what happened to it.
    - No entries are written for finished checkbox tasks or for rewording that settles nothing. The provenance footer records those edits.

**Run 3**

    - One log entry, written once, for the item's creation. Recording the item is a decision under the rule, whatever the item is or isn't tagged.
    - No separate state-change entry. The item was created at Open, so the creation entry covers it, and the entry can say so.
    - What the log entry says names the record and what happened to it, for example: "Compiler output caching is recorded as an item — Open". It never states the direction as if it were already built ("The compiler caches what it compiled"), because nothing is built and the item is Open.
    - If the entry mentions what the item proposes, it belongs to the item, not the system. For example: "...the item proposes that the compiler cache what it compiled".
    - The commit subject follows the same mood. For example: "Compiler-caching item is recorded". It is not "Compiler caches compiled output", because that subject reads as a change to the software, and none happened.
    - No further entries for now. Later entries come only with a Settled resolution or a State change, such as Active, Realized or Abandoned. Completed checkbox tasks and prose rewording get no entries.

**Run 4**

    - I write one log entry, the creation entry. Recording the item is itself a decision, and its kind tag, or the lack of one, changes nothing.
    - No other entry applies. The item starts at Open, so there is no settled resolution yet and no state change to log. Any later settled resolution or State-line change gets its own entry when it happens.
    - The entry names the record and what happened to it. For example: "Compiler caching of compiled output is recorded as an item — Open; nothing is built."
    - It must not say what the item proposes as if the system already does it. "The compiler caches what it compiled" and "Compiler caches compiled output" are both wrong while the item is Open, because nothing is built.
    - The commit subject follows the same rule. For example: "Compiler-caching item is recorded". It is not "Compiler caches compiled output" or "Add compiler caching", since commit-message style would state a change that did not happen.
    - No wording template is fixed. What is required is that the record is named and that the entry does not claim the caching exists.

**Run 5**

    - I write one log entry, the creation entry. Recording the item is a decision, and the rule requires an entry on creation whatever the item's tag.
    - I write no state-change entry. The item is created at Open, so that is its first state, and the creation entry can carry it ("… Open because …"). There are no Settled resolutions and no state change yet, so nothing else is logged.
    - The entry names the record and what happened to it, for example: "Compiler caching of compiled output is recorded as an item — Open, nothing built."
    - It never states the direction in the indicative as the system's behavior. "The compiler caches what it compiled" is not allowed, because nothing is built and the item is Open. If the entry mentions the direction, it attributes it to the item ("the item proposes that the compiler could cache …").
    - The commit subject the entry travels in follows the same rule, for example: "Compiler-caching item is recorded". It must not say "Compiler caches compiled output". The commit conventions' "changed thing in its new state" grammar does not apply, because an item is not a change to the software.
    - No wording template is fixed. The rule only requires that the record is named and the mood is honest.

#### S2 — a new item, nothing built, compressed version

**Run 1**

    - I write one log entry, the creation entry, in `waytide/local/logs/log/`. Under the rule, creating an item is one of the three moments that get logged.
    - The item starts at Open, but that is its creation, not a change of state. So it gets no second entry, and nothing else gets logged now because nothing has been built.
    - The entry names the record and what happened to it, never the direction as a fact. For example: *Compiler output caching is recorded as an item — Open because nothing is built.*
    - It must not say "The compiler caches what it compiled" or anything else that states the unbuilt direction in the indicative mood. A log entry has no State line beside it, so that wording would read as how the system already behaves.
    - The commit subject uses the same mood. For example: *Compiler-caching item is recorded*, not *Compiler caches compiled output*. The git rule about stating the changed thing in its new state does not apply, because an item is not a change to the software.
    - Later entries come only at a dated Settled resolution or a change of State. Example: *Compiler caching is realized*, once it is built. Checkbox tasks and prose-only edits get no entry.

**Run 2**

    - I write one log entry, the creation entry. Creating the item is one of the three moments that call for an entry. The item is Open from the start, so I write no separate state-change entry. Nothing is settled and nothing is built, so nothing else qualifies yet.
    - The entry says what was recorded, not what the system does. For example: `Compiler caching what it compiled is recorded as an item — Open`.
    - It does not say "The compiler caches what it compiled", or anything else that states an unbuilt direction in the indicative mood. A log entry has no State line beside it, so that wording would be read as how the system behaves now.
    - The commit subject uses the same mood: `Compiler-caching item is recorded`, not `Compiler caches compiled output`. The git rules' wording, the changed thing in its new state, fits changes to software, not items.
    - Later entries come only when the item gets a dated Settled resolution or its State line changes. For example, `Compiler caching is realized` once it is built. Rewording the item's prose or completing a checkbox task gets no entry.

**Run 3**

    - I write one log entry, the creation entry. Creating the item counts as reaching Open, and that is the only one of the three moments that has happened. No `Settled` resolution has been written and the state has not changed again.
    - Entry, one line in `waytide/local/logs/log/`: "Compiler output caching is recorded as an item — Open because nothing is built." It names the record and its state. It does not describe caching as something the system does.
    - I avoid wording like "The compiler caches what it compiled", or anything else that puts an unbuilt direction in the indicative mood. While the item is Open, that would be read as the system's actual behavior.
    - Commit subject, same mood: "Compiler-output-caching item is recorded". It does not follow the git package's changed-thing-in-its-new-state form, such as "Compiler caches compiled output", because an item is not a change to the software.
    - No other entries for now. Later ones come only with a dated `Settled` resolution or a State change (for example "Compiler output caching is realized"), or with a session-close reconciliation that finds the direction still standing. Checkbox tasks and prose edits are not logged.

**Run 4**

    - I write one log entry, a creation entry in `waytide/local/logs/log/`. Recording the item counts as creation, and it is also the item's first state (Open). That is one event, so it gets one entry, not two.
    - The entry names the record and what happened to it. It never says in the indicative mood that the compiler caches. Example: *"Compiler output caching is recorded as an item — Open; nothing is built."*
    - If I mention what the item proposes, I attribute it to the item. Example: *"…the item proposes that the compiler could cache what it compiled."*
    - The commit subject uses the same mood. Example: *"Compiler-caching item is recorded"*. It is not *"Compiler caches compiled output"*: the git package's changed-thing-in-its-new-state grammar fits a change to the software, and this is not one.
    - Nothing else gets an entry now. There is no Settled resolution, no further state change, and nothing is built, so the system's behavior is unchanged.
    - Later entries come only with a dated Settled resolution or a State change, such as Active or Realized. At Realized, an indicative form like *"Compiler caching is realized"* becomes correct.

**Run 5**

    - I'd write one log entry, the creation entry. Creating the item is one of the three moments the rule names. Nothing else happened that the rule logs: no `Settled` resolution and no State change. Open is the state the item starts in, not a move to a new state.
    - The entry says the record was made, and it doesn't claim the caching exists. For example: "Compiler caching of compiled output is recorded as an item — Open; nothing is built."
    - It never describes the unbuilt idea as if it were true. "The compiler caches what it compiled" is wrong, because while the item is Open the system does not do that.
    - If the entry mentions what the item proposes, it says so on the item's behalf. For example: "the item proposes that the compiler could cache …".
    - The commit subject uses the same wording. For example: "Compiler-caching item is recorded". It is not the usual new-state form for a code change, such as "Compiler caches compiled output".
    - Later edits that only change prose or tick a checkbox get no entry. A Settled resolution or a State change, such as reaching Active or Realized, each gets its own entry.

### S3 — a reconciliation that finds nothing

**Scenario:**

    At the close of a work session, you reconcile the project's design items against the session's work. Nothing in them needs to change, and you change nothing.

#### S3 — a reconciliation that finds nothing, default version

**Run 1**

    - I write one log entry. When a reconciliation finds nothing to change, the rule makes an exception and requires an entry: "the direction stands" is a real answer, and the artifacts can't show it because nothing in them changed.
    - The entry names what the items were read against. For example: "The design items stand against <this session's work, e.g. the work session of 2026-10-21 on X>" (the same form as the project's "The aspirations stand against …" entries).
    - The entry reports what happened to the records (they were read and found still standing). It does not claim that any direction is built or that the system behaves a certain way. Any open direction is described as what the items settle, not as fact.
    - The commit subject carries that same honest wording, for example "Design items stand against <session's work>". It does not say an unbuilt direction is now how the system works.
    - I write no per-item entries. Nothing was created, no Settled resolution was added and no State line moved, so none of the item triggers apply. I also edit no item files and no provenance footers, since nothing in them changed.
    - No wording template is required. What the rule requires is that the reconciled records and what they were read against are named, and that the mood is honest.

**Run 2**

    - I write one log entry in `waytide/local/logs/log/`. The rule singles this case out: a reconciliation that finds nothing to change still gets logged. The artifacts don't change, so without the entry nobody could tell the check happened.
    - The entry names what was read, what it was read against, and the result. An example: "The design items stand against <this session's work>", in the same form as the project's existing "The aspirations stand against …" entries.
    - No entries for any single item: nothing was created, no Settled resolution was added and no State line changed. No completed tasks or prose edits get logged either, and there were none.
    - The entry says the records were reconciled and found still standing. It does not describe anything a design item settles as if the system already did it. Any direction it mentions is credited to the item ("item X settles …"), not stated as fact.
    - The commit subject the entry goes in says the same thing in the same way, for example "Design items stand against <session work>". It makes no claim about how the system behaves.
    - No wording template is required. What matters is that the reconciled records and what they were checked against are named, and that the wording doesn't claim the system already does what an item only settles.

**Run 3**

    - I write one log entry in `waytide/local/logs/log/`. A reconciliation that finds nothing to change is the exception the rule names, and it gets logged. "The direction stands" is a real answer, and the artifacts can't show it because nothing in them changed.
    - The entry names what the items were read against, in the project's existing form. Example: "The design items stand against the <session's work, e.g. the batch-size item and rule-reduction experiment>." It's attributed to the records and states no unbuilt behavior as the system's.
    - No item gets an entry of its own. No item was created, no `Settled` resolution was added, and no `**State:**` line moved.
    - Nothing is changed in the items, and no provenance footer is touched, since no file changed.
    - The commit subject that carries the entry uses the same honest wording, e.g. "Design items stand against <session's work>". It names the records being reconciled. It doesn't phrase what they settle as a fact about the system.
    - No wording template is required beyond that: the record is named, what happened to it is said, and the mood is honest.

**Run 4**

    - I write one log entry. Nothing in the items changed, but a reconciliation that finds the direction still standing is the case the rule names as worth logging. Nothing in the artifacts would show that the check happened.
    - The entry says what the items were read against, for example: "The design items stand against the <session/work> work session." This follows the project's existing "The aspirations stand against …" form.
    - It reports that the reconciliation happened and what it found. It does not restate any item's direction as something the system does. Any open direction it mentions belongs to the item: "the X item settles …", not "the system does …".
    - The commit subject that carries the entry uses the same wording, for example "Design items stand against <session> work session". It does not use a passive "is done" statement that would claim an unbuilt behavior.
    - I write no per-item entries. No item was created, no Settled resolution was added, and no State line moved, so none of those three triggers applies.
    - I add no provenance-footer changes and no other entries, because no file was edited. The wording follows no fixed template; it only has to name what was reconciled and keep the mood honest.

**Run 5**

    - I write one log entry. A reconciliation that finds nothing to change is the one exception the rule names, and it is logged, because "the direction stands" is a real answer. The artifacts can't show that answer later, since nothing in them changed.
    - The entry names what was read and what it was read against. For example: *The design items stand against [this session's work, named specifically].* This follows the project's existing *The aspirations stand against …* form, though the rule fixes no template.
    - It reports the reconciliation and its result, and says the records still stand. It does not state what those items settle in the indicative mood as if the system already does it, since items that are Open or Active build nothing.
    - The commit subject carries the same wording with the same honest mood. For example: *Design items stand against [session work].* It does not say something like "X runs at first prompt", because the commit subject must not make a claim the log entry avoids.
    - I write no other entries. No item was created, no `Settled` resolution was added and no `**State:**` line moved. Item tags make no difference to this.
    - I don't touch any item file, so no provenance footer changes either. The log entry is the only record that the reconciliation happened.

#### S3 — a reconciliation that finds nothing, compressed version

**Run 1**

    - I write one log entry. The rule says to log a work-session-close reconciliation that finds the direction still standing, even when nothing changed, because nothing else records that it happened.
    - The entry names what the items were read against, for example: `The design items' aspirations stand against the <date/topic> work session's work`.
    - It reports the reconciliation and its result, and nothing about behavior. It does not state any unbuilt direction in the indicative mood (no "the system does X" for Open or Active items).
    - I write no per-item entries: nothing was created, no `Settled` resolution was dated and no `**State:**` line moved. Item files and provenance footers stay unchanged.
    - The commit subject uses the same mood as the entry, for example: `Design items stand against the <session> work session`. It is not phrased as a software change in its new state.
    - The commit holds only the log entry.

**Run 2**

    - I write one log entry, even though no item changed. The rule logs a reconciliation at a work session's close that finds the direction still standing, because nothing in the artifacts records that the reconciliation happened.
    - I write no per-item entries. No item was created, no `Settled` resolution was dated, and no `**State:**` line changed. Touching no checkboxes and no prose means there is nothing else to log either.
    - The entry says what the reconciliation found and names what it was read against. For example: `The design items' direction stands against the <date> work session's changes.` or `The aspirations stand against <the session's commits / work-session record>.`
    - The entry does not describe any unbuilt direction in those items in the indicative mood. It does not say something like "the check runs at the engineer's first prompt" for an item that is still Open or Active. It reports only that the reconciliation found the direction standing.
    - The commit subject carrying the entry uses the same mood. For example: `Design items' direction stands against the session's work`. It does not use the git "changed thing in its new state" form, since that wording would wrongly suggest something in the software changed.
    - No provenance footer changes in any item, because I edited none.

**Run 3**

    - I write one log entry, even though nothing changed. The rule logs a close-of-session reconciliation that finds the direction still standing, because nothing in the records shows the check happened.
    - The entry names what the items were read against, e.g. `The design items' aspirations stand against the <session name/date> work session's changes.`
    - It says the items or their directions *stand*. It describes no unbuilt direction as something the system already does (no "the check runs at …" for an Open/Active item).
    - I write no other entries. There is no creation, no dated Settled resolution and no State change, and the unchanged items get no edits or footer changes.
    - The commit that carries the entry uses the same wording in its subject, e.g. `Design items stand against the <session> work session`. It does not use git's "changed thing in its new state" phrasing.
    - That commit contains only the new line in `waytide/local/logs/log/`. No item file is touched.

**Run 4**

    - I write one log entry in `waytide/local/logs/log/`, even though nothing changed. The rule logs a reconciliation at a work session's close that finds the direction still standing, because no artifact records that the reconciliation took place.
    - The entry names the reconciliation and what it was read against. For example: *The design items' directions stand against this session's work on <the session's work>.* This follows the rule's own form, *The aspirations stand against …*.
    - The entry does not state any unbuilt direction in the indicative. It reports that the items were read and still stand. It does not describe what the system does. Anything an item settles can follow only if it is attributed to that item, and only while the item is still Open or Active.
    - I don't edit any item, State line, Settled resolution or provenance footer, so they take no other entries.
    - The commit subject carrying the entry uses the same mood. It is about the record, not about a change to the software. For example: *Design items stand against the session's work*. It is not a git-style subject saying the change was made.

**Run 5**

    - I write one log entry, even though nothing changed. The rule logs a close-of-session reconciliation that finds the direction still standing, because no artifact records that the reconciliation happened.
    - The entry names what the items were read against, in the rule's form: "The aspirations stand against <this session's work, e.g. the commits and items touched in session YYYY-MM-DD>." It reports that a reconciliation took place and its result. It does not describe how the system behaves.
    - It does not state any unbuilt direction in the indicative mood. If it mentions what an item settles, it attributes that to the item (e.g. "the X item's direction stands"), not "the system does X".
    - I write no other entries. No item was created, gained a Settled resolution, or changed State, and no prose was edited or checkbox completed. Those last two would not be logged anyway.
    - The commit subject uses the same mood as the entry, e.g. "Design items stand against the session's work". It does not use a software-change subject that presents a design item's direction as built behavior.
    - Only the log file changes in that commit. No item files change, so their provenance footers are not touched.

## Appendix — the directive check on #15

### The listing prompt

    Read the file /private/tmp/claude-501/check15/source.md. It is a rule that governs an AI coding agent and the scripts of the project it works in.

    List every directive the rule contains. A directive is any statement of what must, must not, or may be done, or of what something must be, say, contain, or leave out. Include the directives stated only in passing, inside explanations, and in the How to apply section.

    - Number them, one directive per line.
    - Make each self-contained, so it can be understood without the rule. Keep the rule's own wording where you can.
    - Do not merge two directives into one line, and do not split one into two.
    - Leave out history and justification, except where a reason itself constrains what is done.
    - Where the rule states the same directive more than once, list it once.

    Use no tool except reading that one file. Answer with the numbered list only.

### The 76 directives, as the listing agent gave them

    1. The agent never prints a session-start notice: not at session start, not before the first response, not at all.
    2. The agent does not print the startup display.
    3. The one thing the agent prints at the start is the package set stanza, where a project shows one.
    4. A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories actually present and emits the session-start notice.
    5. The session-start notice says what is installed and what the engineer can type to have it read.
    6. Between the install line and the closing ask, the notice reports experiments and features that have not concluded, together on one further line, when there are any.
    7. The session-start notice carries no mark; the mark is printed by a hook of its own when the engineer types `load waytide`.
    8. Everything the `SessionStart` hook emits must be valid inside a JSON string built by `printf` with no escaping: a lone backslash must not appear, since it begins an invalid JSON escape sequence.
    9. Each record under `waytide/local/implementations/` is read for its canonical `**State:**` line.
    10. An experiment whose state is Affirmed, Refuted, Inconclusive, Abandoned, or Superseded, and a feature that is Completed, Abandoned, or Superseded, are not reported in the notice.
    11. An implementation that is Suspended, or whose record carries no state line, is reported in the notice.
    12. When every implementation has concluded, the open-implementations line is absent from the notice entirely.
    13. `waytide/system/foundation/statusline.sh` keeps the system's presence in the status line for the whole session, alongside the working directory and git branch, which the script renders itself.
    14. The repository's name leads the status line, in bold, using a terminal escape sequence.
    15. Only the repository name is bold in the status line; every other segment is plain.
    16. The status line's Waytide segment is one word and carries no package count.
    17. The status line reads Waytide's presence from disk: at least one directory carrying a `README.md`, the same test for a package that the notice uses.
    18. The Waytide segment trails the status line after a double colon (`::`).
    19. The engineer's own status-line segments are separated by the middle dot (`·`).
    20. The `uncommitted changes` segment appears only when the working tree has something not committed: a modified tracked file, a staged change, or an untracked file that is not ignored.
    21. The uncommitted state is stated in words, not as a mark on the branch name (such as `master*`).
    22. An `untracked files` segment appears when the working tree has an untracked file that is not ignored.
    23. An untracked file raises both the `uncommitted changes` segment and the `untracked files` segment. The `uncommitted changes` segment must not be narrowed to tracked modifications only.
    24. An `unpushed commits` segment appears when there is committed work that exists only in this working copy.
    25. Status-line segments that can be present at once are each named in words that read distinctly.
    26. The `unpushed commits` segment carries no count.
    27. The `unpushed commits` check never reaches the network and never fetches. It compares against the remote-tracking ref.
    28. A branch with no upstream reports nothing in the `unpushed commits` segment, and an upstream missing by accident is not folded into that segment.
    29. When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`, which prints the title, the copyright and license, the loading line, and the figure.
    30. The startup display hook reads its content from the initialization-rule, which governs the display.
    31. The startup display is printed once, on the `load waytide` command and on no other prompt.
    32. The session-start notice, the status line, and the startup display are wired by a committed `.claude/settings.json`, which `install.sh` places in the consuming project.
    33. The session-start notice goes in `systemMessage`, for the engineer. The instruction to read the rules goes in `hookSpecificOutput.additionalContext`, for the agent. The two are kept on these separate channels.
    34. The notice and the read instruction are not the same text.
    35. The hook carries the whole read instruction. What the agent is to do reaches it only through `additionalContext`; the engineer's command only names the read.
    36. The read instruction states that the read is unconditional, and that the apparent size of the first request is not a reason to defer it.
    37. The read instruction is emitted, and fires, unconditionally in every session.
    38. The notice closes with `Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.` followed, on its own line, by `To load them now, type: load waytide.`
    39. The notice's close is always present.
    40. A blank line precedes the notice's close, separating the report from the closing ask.
    41. The close's blank line falls after any open-experiment and open-feature lines, not between them and the install line.
    42. A second blank line separates the loading caveat from the command sentence, so the command sentence stands on its own line.
    43. The command sentence is the notice's last sentence, with the loading caveat ahead of it.
    44. The command the notice asks for is `load waytide`, which names the read outright.
    45. The loading caveat says "a few moments", not "a moment".
    46. The notice is written as plain text with no markdown or other emphasis markup, since the harness renders `systemMessage` literally.
    47. The notice's closing line says the rules are loaded as a description of what the session does next, and reports no read as having happened.
    48. The notice and the read instruction contain no quotation marks, and none may be added.
    49. The read instruction tells the agent to read `foundation/` first.
    50. The read instruction tells the agent to read each `vocabulary.md` a package has.
    51. The read instruction tells the agent to read the project's own `local/rules/` and `local/vocabulary.md` alongside the packages.
    52. The read instruction tells the agent to leave the other working directories out of the read, naming each of them explicitly.
    53. The read instruction tells the agent to print no package count.
    54. The read instruction ends the read with the wait for the engineer's request.
    55. The read instruction names `local/rules/` unconditionally, whether or not the directory exists, and says its absence is ordinary rather than an error.
    56. The read instruction names `local/vocabulary.md` unconditionally, whether or not it exists, and says its absence is ordinary.
    57. Within the packages, the read instruction names only the compiled rules: each package's `source/` directory and its `README.md` are left out.
    58. Besides the packages, the read instruction names `local/rules/` and `local/vocabulary.md` and nothing else. It must not name `local/` as a whole in place of the two.
    59. This rule does not restate the read instruction's list of working directories. `session-start.sh` is the only place they are enumerated.
    60. The read instruction tells the agent not to print the startup display, because the harness prints it.
    61. The startup display's art is not carried on the `SessionStart` hook's channel. It belongs in the initialization-rule, where it is not a JSON literal, and the display hook reads it from there.
    62. The load command is worded the same in the two channels: the notice tells the engineer to type `load waytide`, and the read instruction tells the agent that the command asks for the read and nothing more.
    63. The scripts enumerate what is actually on disk, listing the package directories under `waytide/system/` (or `system/` in the authoring source), rather than asserting a list.
    64. A directory carrying a `README.md` is a package, which distinguishes a grouped package from the grouping directory above it.
    65. Nothing prints a fixed list of packages.
    66. The notice claims only that the system is installed and its configuration is live. It says nothing about whether the rules were read or internalized.
    67. Carrying the read instruction does not widen the notice's claim: the hook reports nothing about whether the agent read the rules.
    68. The notice says "installed", never "loaded".
    69. The notice is called the "session-start notice", not "the load notice".
    70. The status line reports the system as active, which is a claim about the configuration rather than about the agent.
    71. `install.sh` checks whether git is set to ignore `.claude/settings.json`. When it is, and the file is not already tracked, `install.sh` prints how to correct it.
    72. The correction for an ignored `.claude/` is to replace the `.claude/` ignore rule with `.claude/*` plus `!.claude/settings.json`, not to add a negation under a `.claude/` rule.
    73. `install.sh` never merges into an existing `.claude/settings.json`. It prints the block and leaves the decision with the engineer.
    74. There is no opt-out: the surfaces are not silenceable, and none may be added (such as the removed `WAYTIDE_QUIET` variable).
    75. Quieting a display must not disable the mechanism that carries the read instruction.
    76. In `.claude/settings.json`, the `SessionStart` hook points at `session-start.sh` and the `statusLine` points at `statusline.sh`, the two foundation scripts.

### The checking prompt

    Read the file /private/tmp/claude-501/check15/directives.md, a numbered list of the directives in a rule. Then read the file /private/tmp/claude-501/check15/compressed.md, a shorter version of the same rule.

    For each directive in the list, judge whether the shorter version carries it:

    - **kept** — the shorter version states it, or states something that requires the same behavior
    - **weakened** — the shorter version states part of it, or states it less strictly, or makes it ambiguous
    - **lost** — the shorter version does not state it and nothing in it requires it

    Answer with one line per directive, in the list's order: its number, the verdict, and, for kept or weakened, the words in the shorter version that carry it, quoted. For weakened or lost, add what is missing in a few words. Judge only from the two files. Use no tool except reading those two files.

### Checker A, word for word

    1 kept: "The agent prints no notice, at session start or at any other time."
    2 kept: "The agent does not print it." (the startup display)
    3 kept: "The one thing the agent prints at the start is the package set stanza, where a project shows one"
    4 kept: "A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice"
    5 kept: the example notice ("Waytide installed at waytide/system/ ..." / "To load them now, type: load waytide.") and "The command names the read outright"
    6 kept: "The open line names experiments and features that have not concluded" and "A blank line precedes the close, after any open line"
    7 kept: "The notice carries no mark. The startup display prints it", together with "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs ... startup-display.sh"
    8 kept: "No quotation marks, and no lone backslash, in anything the hook emits. `printf` interpolates ... with no escaping ... a lone backslash begins an invalid escape."
    9 kept: "read from each record's `**State:**` line under `waytide/local/implementations/`"
    10 kept: "An experiment that is Affirmed, Refuted, Inconclusive, Abandoned, or Superseded has concluded, as has a feature that is Completed, Abandoned, or Superseded."
    11 kept: "One that is Suspended or carries no state line is reported."
    12 kept: "With nothing open the line is absent."
    13 kept: "keeps the system's presence on screen all session" and "the script renders the directory and branch too"
    14 kept: "The repository name leads, in bold, a terminal escape sequence"
    15 kept: "the only emphasis on the line"
    16 kept: "The Waytide segment is one word, with no package count."
    17 kept: "Presence is read from disk, by the same README test the notice uses."
    18 kept: "the Waytide segment trails after a double colon"
    19 kept: "The engineer's segments are separated by a middle dot"
    20 weakened: "`uncommitted changes` appears when there is a modified tracked file, a staged change, or an untracked file that is not ignored." Missing: "only when". The rule gives the trigger but does not say the segment is absent otherwise. The clean example line implies it but does not state it.
    21 kept: "It is words, not a mark like `master*`."
    22 kept: "`untracked files` names the case ... An untracked file raises both segments"
    23 kept: "An untracked file raises both segments, deliberately, so `uncommitted changes` alone answers whether anything is uncommitted."
    24 weakened: "`unpushed commits` ... compares against the remote-tracking ref". Missing: the condition that makes the segment appear (committed work that exists only in this working copy) is never stated.
    25 weakened: "`untracked files` names the case whose remedy differs". Missing: the general requirement that segments shown together have names that read distinctly. Only the fixed names themselves carry it.
    26 kept: "`unpushed commits` carries no count"
    27 kept: "never reaches the network. It compares against the remote-tracking ref, so it reflects the last fetch."
    28 weakened: "A branch with no upstream reports nothing, since unpushed is relative to an upstream." Missing: that an upstream missing by accident is not folded into the segment.
    29 kept: "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`. It prints the title, the copyright and license, the loading line, and the figure"
    30 kept: "read from the initialization-rule"
    31 kept: "once, on that command only"
    32 kept: "A committed `.claude/settings.json` wires the three, and `install.sh` places it in a consuming project."
    33 kept: "The notice goes in `systemMessage`, for the engineer. The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent"
    34 kept: "They are different texts for different readers."
    35 kept: "It carries the whole instruction." and "`load waytide` asks for exactly that read and nothing more."
    36 kept: "The read is unconditional. The apparent size of the first request is not a reason to defer it."
    37 kept: "the read instruction is emitted every session" and "The read is unconditional."
    38 kept: the example notice's last two lines: "Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments." and "To load them now, type: load waytide."
    39 kept: "The close is always present"
    40 kept: "A blank line precedes the close"
    41 kept: "after any open line"
    42 kept: "A second blank line stands the command alone"
    43 kept: "the caveat, then the command on a line of its own, last"
    44 kept: "The command names the read outright" and "type: load waytide"
    45 kept: "The caveat says `a few moments`"
    46 kept: "The notice is plain text. The harness renders `systemMessage` literally"
    47 kept: "The close's `are loaded` describes what the session does next and reports no read."
    48 kept: "No quotation marks ... in anything the hook emits."
    49 kept: "Read `foundation/` first"
    50 kept: "and each package's `vocabulary.md`"
    51 kept: "Read the project's `local/rules/` and `local/vocabulary.md`"
    52 kept: "Name the other working directories and leave them out."
    53 kept: "Print no package count."
    54 kept: "Then wait for the engineer's request."
    55 kept: "each named whether or not it exists, its absence ordinary"
    56 kept: "each named whether or not it exists, its absence ordinary"
    57 kept: "Read the compiled rules, leaving out each package's `source/` directory and `README.md`."
    58 weakened: "Read the project's `local/rules/` and `local/vocabulary.md`". Missing: "and nothing else", and the ban on naming `local/` as a whole in place of the two.
    59 kept: "This rule does not restate the directory list. `session-start.sh` is the only place it is enumerated"
    60 kept: "Do not print the startup display." The hook that prints it is described under "The startup display", which ends "The agent does not print it."
    61 kept: "The mark's art is not carried on this channel. The display hook reads it from the initialization-rule."
    62 kept: "To load them now, type: load waytide." and "`load waytide` asks for exactly that read and nothing more."
    63 kept: "The install line enumerates what is on disk." and "Presence is read from disk"
    64 kept: "A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it."
    65 kept: "Nothing prints a fixed list."
    66 kept: "it can observe that the packages are on disk and the configuration is live, and not that any rule was read"
    67 kept: "Instructing is not vouching: the notice still reports nothing about whether the agent read the rules."
    68 kept: "The notice says `installed`, never `loaded`."
    69 kept: "Call it the session-start notice, not the load notice."
    70 kept: "The status line reports the system active, a claim about the configuration rather than the agent."
    71 weakened: "`install.sh` warns when git ignores `.claude/` and the file is not tracked." Missing: that it prints how to correct it. The check is also stated against `.claude/` rather than `.claude/settings.json`.
    72 kept: "The fix is `.claude/*` with `!.claude/settings.json`, since git cannot re-include a file inside an excluded directory"
    73 kept: "`install.sh` never merges into an existing `.claude/settings.json`: it prints the block and leaves the decision to the engineer."
    74 weakened: "There is no opt-out." Missing: that none may be added (the removed `WAYTIDE_QUIET` is the example), and the explicit statement that the surfaces cannot be silenced.
    75 weakened: "the read instruction is emitted every session". Missing: the explicit constraint that quieting a display must not disable the mechanism that carries the read instruction.
    76 kept: "A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`", "`waytide/system/foundation/statusline.sh` keeps the system's presence", and "A committed `.claude/settings.json` wires the three"

### Checker B, word for word

    1 kept: "The agent prints no notice, at session start or at any other time."
    2 kept: "The agent does not print it." / "Do not print the startup display."
    3 kept: "The one thing the agent prints at the start is the package set stanza, where a project shows one"
    4 kept: "A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories on disk and emits the notice"
    5 kept: "The install line enumerates what is on disk" / "The command names the read outright" (with the example notice)
    6 kept: "The open line names experiments and features that have not concluded" / "A blank line precedes the close, after any open line" (one line, placed between install line and close in the example)
    7 kept: "The notice carries no mark. The startup display prints it" / "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs ... startup-display.sh"
    8 kept: "no lone backslash, in anything the hook emits. `printf` interpolates ... with no escaping ... a lone backslash begins an invalid escape"
    9 kept: "read from each record's `**State:**` line under `waytide/local/implementations/`"
    10 kept: "An experiment that is Affirmed, Refuted, Inconclusive, Abandoned, or Superseded has concluded, as has a feature that is Completed, Abandoned, or Superseded" (with "names experiments and features that have not concluded")
    11 kept: "One that is Suspended or carries no state line is reported."
    12 kept: "With nothing open the line is absent."
    13 kept: "keeps the system's presence on screen all session" / "the script renders the directory and branch too"
    14 kept: "The repository name leads, in bold, a terminal escape sequence"
    15 kept: "the only emphasis on the line"
    16 kept: "The Waytide segment is one word, with no package count."
    17 kept: "Presence is read from disk, by the same README test the notice uses."
    18 kept: "the Waytide segment trails after a double colon"
    19 kept: "The engineer's segments are separated by a middle dot"
    20 weakened: "`uncommitted changes` appears when there is a modified tracked file, a staged change, or an untracked file that is not ignored" — missing "only when"; says when it appears, not that it appears in no other case.
    21 kept: "It is words, not a mark like `master*`."
    22 kept: "An untracked file raises both segments"
    23 kept: "An untracked file raises both segments, deliberately, so `uncommitted changes` alone answers whether anything is uncommitted."
    24 weakened: "`unpushed commits` ... compares against the remote-tracking ref" — the trigger (committed work that exists only in this working copy) is never stated.
    25 weakened: segment names given in the example ("uncommitted changes · untracked files · unpushed commits") — the requirement that co-present segments be named distinctly is not stated.
    26 kept: "`unpushed commits` carries no count"
    27 kept: "never reaches the network. It compares against the remote-tracking ref"
    28 weakened: "A branch with no upstream reports nothing" — missing that an upstream missing by accident is not folded into the segment.
    29 kept: "When the engineer types `load waytide`, a `UserPromptSubmit` hook runs `waytide/system/foundation/startup-display.sh`. It prints the title, the copyright and license, the loading line, and the figure"
    30 kept: "read from the initialization-rule" / "the initialization-rule — the startup display"
    31 kept: "once, on that command only"
    32 kept: "A committed `.claude/settings.json` wires the three, and `install.sh` places it in a consuming project."
    33 kept: "The notice goes in `systemMessage`, for the engineer. The instruction goes in `hookSpecificOutput.additionalContext`, which reaches the agent"
    34 kept: "They are different texts for different readers."
    35 kept: "It carries the whole instruction." / "`load waytide` asks for exactly that read and nothing more."
    36 kept: "The read is unconditional. The apparent size of the first request is not a reason to defer it."
    37 kept: "The read is unconditional." / "the read instruction is emitted every session"
    38 kept: (example) "Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments." ... "To load them now, type: load waytide." — wording appears only in the example, not stated as required text.
    39 kept: "The close is always present"
    40 kept: "A blank line precedes the close"
    41 kept: "after any open line"
    42 kept: "A second blank line stands the command alone"
    43 kept: "the caveat, then the command on a line of its own, last"
    44 kept: "The command names the read outright" / "type: load waytide"
    45 kept: "The caveat says `a few moments`"
    46 kept: "The notice is plain text. The harness renders `systemMessage` literally"
    47 kept: "The close's `are loaded` describes what the session does next and reports no read."
    48 kept: "No quotation marks ... in anything the hook emits."
    49 kept: "Read `foundation/` first"
    50 kept: "and each package's `vocabulary.md`"
    51 kept: "Read the project's `local/rules/` and `local/vocabulary.md`"
    52 kept: "Name the other working directories and leave them out."
    53 kept: "Print no package count."
    54 kept: "Then wait for the engineer's request."
    55 kept: "each named whether or not it exists, its absence ordinary"
    56 kept: "each named whether or not it exists, its absence ordinary"
    57 kept: "Read the compiled rules, leaving out each package's `source/` directory and `README.md`."
    58 weakened: "Read the project's `local/rules/` and `local/vocabulary.md`" / "Name the other working directories and leave them out" — missing "nothing else" and the ban on naming `local/` as a whole in their place.
    59 kept: "This rule does not restate the directory list. `session-start.sh` is the only place it is enumerated"
    60 kept: "Do not print the startup display." (with "The harness announces Waytide, through three surfaces it renders")
    61 kept: "The mark's art is not carried on this channel. The display hook reads it from the initialization-rule." — the "not a JSON literal" reason is dropped.
    62 kept: "To load them now, type: load waytide." / "`load waytide` asks for exactly that read and nothing more."
    63 kept: "The install line enumerates what is on disk." / "Nothing prints a fixed list." — the authoring-source `system/` variant is not mentioned.
    64 kept: "A directory carrying a `README.md` is a package, which tells a grouped package from the grouping directory above it."
    65 kept: "Nothing prints a fixed list."
    66 kept: "it can observe that the packages are on disk and the configuration is live, and not that any rule was read"
    67 kept: "Instructing is not vouching: the notice still reports nothing about whether the agent read the rules."
    68 kept: "The notice says `installed`, never `loaded`."
    69 kept: "Call it the session-start notice, not the load notice."
    70 kept: "The status line reports the system active, a claim about the configuration rather than the agent."
    71 weakened: "`install.sh` warns when git ignores `.claude/` and the file is not tracked." — does not say install.sh prints how to correct it; the check is stated against `.claude/`, not `.claude/settings.json`.
    72 kept: "The fix is `.claude/*` with `!.claude/settings.json`, since git cannot re-include a file inside an excluded directory"
    73 kept: "`install.sh` never merges into an existing `.claude/settings.json`: it prints the block and leaves the decision to the engineer."
    74 kept: "There is no opt-out." — the explicit ban on adding one (e.g. `WAYTIDE_QUIET`) is implied, not stated.
    75 kept: "the read instruction is emitted every session"
    76 kept: "A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`" / "A project-level `statusLine` replaces the engineer's own, so the script renders the directory and branch too" — the statusLine-to-statusline.sh mapping is implied rather than stated.

    Tally: 70 kept, 6 weakened (20, 24, 25, 28, 58, 71), 0 lost.

## Appendix — the directive check on #11

The listing and checking prompts are those of the check on #15, with the file paths changed to `check11`.

### The 75 directives, as the listing agent gave them

    1. The project's items are held in `waytide/local/items/`, and a record there is an item and nothing else.
    2. A tag may describe an item, and nothing about an item's tags is strict.
    3. A design item is tagged `[design]`, a plan item `[plan]`, an aspiration `[aspiration]`, and an observation `[observation]`.
    4. An item that carries no tag at all is tagged `[idea]`.
    5. An item's tags are the ordinary square-bracket tags every working-state artifact takes.
    6. The set of item tags is open.
    7. An item may carry several tags or none at all.
    8. `[idea]` is the only kind tag assigned by default to an item; no other kind tag is assigned by default, `[aspiration]` least of all.
    9. `[aspiration]` is written only where an aspiration is what was asked for, and never as the dress a design item is put in because something had to go on the tag line.
    10. An item that already carries a tag is not given `[idea]` as well, whatever that tag is (`[deferred]`, `[work-item]`, or a project's own).
    11. No rule reads an item's kind tag.
    12. No report groups items by kind tag.
    13. No item filename derives from a kind tag.
    14. What an item record is must be stated in the record itself, not left to its tag.
    15. No tag is reserved among items.
    16. No item tag is read mechanically.
    17. The `[deferred]` tag is freeform like any other tag.
    18. An item's `**Waits for:**` line states what must finish before the item is actionable, and does nothing else; it does not say what to work next.
    19. An item's `**Priority:**` line holds a rank, in the form `- **Priority:** 3`.
    20. Item priority ranks are 1 through N, contiguous, with one item per number.
    21. Among the items that are actionable, the item ranked 1 is worked next.
    22. An item that is waiting may still be ranked.
    23. An item's rank does not clear its wait.
    24. The `**Waits for:**` and `**Priority:**` lines are both optional on an item.
    25. An unranked item is not a defect.
    26. Putting an item at a given rank renumbers every item below it, changing their files, and that cost is accepted.
    27. An item's content is point-in-time: what it says was true when it was written.
    28. A reference inside an item that time has overtaken is not a defect and is not chased.
    29. Nothing derives from an item's `**Waits for:**` or `**Priority:**` line; they are the item's own content, read by whoever reads the item.
    30. Each item is one file.
    31. An item's filename starts with the ISO-8601-UTC prefix.
    32. An item's filename ends with its state in upper case.
    33. An item is frontmatter-free markdown.
    34. An item is laid out as a `# <title>`, then the `**State:**` line, then a `**Tags:**` line saying what it is, then whatever the item has to say.
    35. An item file ends with a provenance footer.
    36. An item takes a paired log entry on creation and on each change of state.
    37. An item contains no code samples.
    38. Nothing else is required of an item's shape.
    39. An item that settles things records them as dated **Settled** resolutions.
    40. An item that settles things marks what it deliberately leaves out in an **Out of Scope / Deferred** tail.
    41. An item that sequences work carries checkbox tasks stating behavior.
    42. An item that neither settles things nor sequences work carries neither resolutions nor tasks.
    43. No spine is added to an item that its thinking does not have.
    44. Every item carries a `**State:**` line from the moment it is written.
    45. An item's state is `Open` when its thinking is not settled.
    46. An item's state is `Active` when it is settled and the work is expected.
    47. An item's state is `Realized` when what it describes exists.
    48. An item's state is `Deferred` when it is kept deliberately, with no date and nobody working toward it.
    49. An item that is merely waiting its turn is not `Deferred`; it carries a `**Waits for:**` line and whatever state its thinking has reached.
    50. An item's state is `Suspended` when it is paused, not ended.
    51. An item's state is `Superseded` when another item replaced it, and the two name each other.
    52. An item's state is `Abandoned` when it was dropped by decision.
    53. An item's state is `Lapsed` when it lost its relevance over time because nobody decided and the work moved past it.
    54. `Stated` is the state of an observation and of an observation only; an observation carries it from the moment it is written and for good, and it never changes.
    55. An observation takes `Stated` as its starting state, and every other item starts as either `Open` or `Active`.
    56. An item starts `Open` where its thinking is unsettled (a hypothesis rather than a direction), and `Active` where it settles something.
    57. An item without a `**State:**` line is a defect; absence is not a state.
    58. `Realized`, `Deferred`, and `Open` are taken back, each returning to `Active` or `Open` when the work resumes; the other states are not taken back.
    59. An item tagged `[work-item]` is a piece of work to be done, and it concludes as `Done`, `Abandoned`, or `Superseded`.
    60. The `[work-item]` tag is reserved, with its meaning set by the items rule.
    61. A work item takes `Done` when the work is done, in place of `Realized`; a work item takes neither `Realized` nor `Lapsed`.
    62. Before it concludes, a work item takes the item states `Open`, `Active`, `Deferred`, and `Suspended`.
    63. A work item's `Done` is taken back to `Active` when the work reopens.
    64. A later item may supersede an earlier one.
    65. A superseded item takes `**State:** Superseded`.
    66. A superseding item and the item it supersedes name each other in their prose.
    67. What a superseded item settled stays as written.
    68. An item is superseded rather than rewritten.
    69. An item is amended by a dated addition rather than a rewrite.
    70. A resolution in an item that no longer holds keeps its date and its wording, and a later resolution states what changed.
    71. When a question runs against something an item settled, the agent answers it and records the change in the item.
    72. The agent does not refuse a question that runs against a settled item until the item is amended.
    73. A settled item is reconciled, never regenerated.
    74. Where one item names another as the thing it realizes, the named item is the source of truth and is not rebuilt from the work downstream of it.
    75. When an item's state changes, the file is renamed to match the new state.

### Checker A, word for word

    1 weakened — "`waytide/local/items/` holds the project's items, one file per item" — missing that a record there is an item and nothing else.
    2 weakened — "A kind tag describes the item and decides nothing about it, except `[observation]`, which makes it an observation, and `[work-item]`" — the exceptions contradict "nothing about an item's tags is strict".
    3 kept — "Tag an item by its kind: `[design]`, `[plan]`, `[aspiration]`, `[observation]`."
    4 kept — "Tag an item with no tag at all `[idea]`"
    5 weakened — "the a-record-takes-category-tags rule — the tags that say what an item is" — given only as a Related pointer. It does not say these are the ordinary square-bracket tags every working-state artifact takes.
    6 kept — "The set is open"
    7 weakened — "an item may carry several" — missing "or none at all".
    8 weakened — "Write `[aspiration]` only where an aspiration was asked for" — does not say that `[idea]` is the only default kind tag. "Tag an item by its kind" could be read as assigning kind tags by default.
    9 kept — "Write `[aspiration]` only where an aspiration was asked for."
    10 kept — "give `[idea]` to no item that already carries a tag"
    11 weakened — "decides nothing about it, except `[observation]` ... and `[work-item]`" — the exceptions let a rule read those kind tags.
    12 lost — no ban on reports grouping items by kind tag.
    13 lost — no ban on filenames derived from a kind tag.
    14 lost — does not require the record itself to state what it is rather than leaving it to its tag.
    15 lost — does not say no tag is reserved. It treats `[observation]` and `[work-item]` as tags that decide something.
    16 weakened — "decides nothing about it, except ..." — the exceptions allow mechanical reading. There is no general "not read mechanically".
    17 lost — `[deferred]` being freeform is not stated.
    18 kept — "`**Waits for:**` states what must finish before the item is actionable, and nothing more."
    19 weakened — "`**Priority:** N` ranks it" — the exact form `- **Priority:** 3` (a list bullet with a number) is not given.
    20 kept — "ranks it from 1 to N, contiguous, one item to a number"
    21 kept — "rank 1 is worked next among the actionable items"
    22 kept — "A rank does not clear a wait."
    23 kept — "A rank does not clear a wait."
    24 kept — "Two optional lines, and most items carry neither."
    25 kept — "Two optional lines, and most items carry neither."
    26 weakened — "ranking an item renumbers those below it" — missing that their files change and that the cost is accepted.
    27 kept — "An item's content is point-in-time."
    28 kept — "A reference in it that time has overtaken is not a defect and is not chased."
    29 kept — "Nothing derives from either line."
    30 kept — "one file per item"
    31 kept — "Name the file with the ISO-8601-UTC prefix"
    32 kept — "ending in its state in upper case"
    33 kept — "Write frontmatter-free markdown"
    34 weakened — "a `# <title>`, a `**State:**` line, a `**Tags:**` line, whatever the item has to say" — the order is only implied, and it does not say the Tags line states what the item is.
    35 kept — "and a provenance footer"
    36 kept — "Write a log entry when the item is created and at each change of its state."
    37 kept — "Put no code samples in it."
    38 kept — "Nothing else is required"
    39 kept — "record decisions as dated **Settled** resolutions ... each only where the item does that"
    40 kept — "mark what is left out in an **Out of Scope / Deferred** tail ... each only where the item does that"
    41 kept — "give checkbox tasks stating behavior, each only where the item does that"
    42 kept — "each only where the item does that"
    43 kept — "each only where the item does that" / "a shape imposed on thinking is ceremony where the thinking does not have it"
    44 weakened — "Every item carries a state." — missing "from the moment it is written", and it says "a state", not a `**State:**` line.
    45 weakened — "Start it **Open** where its thinking is unsettled" — given only as a starting state. Open is not defined as a state in general.
    46 weakened — "**Active** where it settles something" — given only as a starting state, and missing "the work is expected".
    47 kept — "**Realized** — what it describes exists."
    48 weakened — "kept deliberately, with no one working toward it" — missing "no date".
    49 kept — "An item merely waiting its turn carries `**Waits for:**` instead."
    50 kept — "**Suspended** — paused, not ended."
    51 kept — "**Superseded** — a later item replaced it, and the two name each other."
    52 kept — "**Abandoned** — dropped by decision."
    53 weakened — "it lost its relevance with no one deciding" — missing "over time" and "the work moved past it".
    54 weakened — "An observation starts and stays **Stated**." — does not say Stated belongs to observations only.
    55 kept — "Start it **Open** where its thinking is unsettled, and **Active** where it settles something. An observation starts and stays **Stated**."
    56 kept — "Start it **Open** where its thinking is unsettled, and **Active** where it settles something."
    57 kept — "Every item carries a state." together with the required "`**State:**` line" in the shape.
    58 weakened — "`Realized`, `Deferred`, and `Open` are taken back to `Active` or `Open` when the work resumes." — missing that the other states are not taken back.
    59 kept — "**A work item**, tagged `[work-item]`, is a piece of work to be done ... concludes `Done`, `Abandoned`, or `Superseded`"
    60 weakened — "except ... `[work-item]`, below" — does not say outright that the tag is reserved, or that its meaning is set by this rule.
    61 kept — "concludes `Done`, `Abandoned`, or `Superseded` — never `Realized` or `Lapsed`"
    62 kept — "It takes `Open`, `Active`, `Deferred`, and `Suspended`, and concludes ..."
    63 kept — "`Done` is taken back to `Active` when the work reopens."
    64 kept — "Supersede it rather than rewrite it"
    65 kept — "**Superseded** — a later item replaced it"
    66 weakened — "the two name each other" — missing "in their prose".
    67 kept — "what a superseded item settled stays as written"
    68 kept — "Supersede it rather than rewrite it"
    69 kept — "Amend it by dated addition"
    70 weakened — "keeping an outdated resolution's date and wording" — missing that a later resolution states what changed.
    71 kept — "Answer a question that runs against what an item settled, and record the change"
    72 kept — "rather than refusing until the item is amended"
    73 kept — "Reconcile a settled item against later work, and never regenerate it from that work."
    74 weakened — "never regenerate it from that work" — missing that an item another item names as what it realizes is the source of truth.
    75 kept — "At each change, rename the file"

### Checker B, word for word

    1. weakened: "holds the project's items". Missing: a record there is an item and nothing else (only hinted in the Why line, "one class of record").
    2. weakened: "A kind tag describes the item and decides nothing about it, except `[observation]` ... and `[work-item]`". Missing: nothing about tags is strict. The shorter version makes two exceptions.
    3. kept: "Tag an item by its kind: `[design]`, `[plan]`, `[aspiration]`, `[observation]`"
    4. kept: "Tag an item with no tag at all `[idea]`"
    5. weakened: "the a-record-takes-category-tags rule — the tags that say what an item is" (appears only in Related). Missing: the statement that these are the ordinary square-bracket tags of working-state artifacts.
    6. kept: "The set is open"
    7. weakened: "an item may carry several". Missing: "or none at all".
    8. weakened: "Tag an item with no tag at all `[idea]`"; "Write `[aspiration]` only where an aspiration was asked for". Missing: no other kind tag is assigned by default.
    9. kept: "Write `[aspiration]` only where an aspiration was asked for"
    10. kept: "give `[idea]` to no item that already carries a tag"
    11. weakened: "decides nothing about it, except `[observation]`, which makes it an observation". Missing: no rule reads a kind tag. The exception contradicts it.
    12. weakened: "decides nothing about it". Missing: reports do not group items by kind tag.
    13. weakened: "decides nothing about it". Missing: filenames do not derive from a kind tag.
    14. lost. Missing: the record itself states what it is, not its tag. The shorter version has just "a `**Tags:**` line".
    15. lost. Missing: no tag is reserved. The shorter version treats `[work-item]` and `[observation]` as exceptions.
    16. weakened: "decides nothing about it, except ...". Missing: no tag is read mechanically, with no exceptions.
    17. lost. Missing: `[deferred]` is freeform.
    18. kept: "`**Waits for:**` states what must finish before the item is actionable, and nothing more"
    19. kept: "`**Priority:** N` ranks it"
    20. kept: "from 1 to N, contiguous, one item to a number"
    21. kept: "rank 1 is worked next among the actionable items"
    22. kept: "A rank does not clear a wait"
    23. kept: "A rank does not clear a wait"
    24. kept: "Two optional lines, and most items carry neither"
    25. kept: "Two optional lines, and most items carry neither"
    26. weakened: "ranking an item renumbers those below it". Missing: it changes their files, and that cost is accepted.
    27. kept: "An item's content is point-in-time"
    28. kept: "A reference in it that time has overtaken is not a defect and is not chased"
    29. kept: "Nothing derives from either line"
    30. kept: "one file per item"
    31. kept: "Name the file with the ISO-8601-UTC prefix"
    32. kept: "ending in its state in upper case"
    33. kept: "Write frontmatter-free markdown"
    34. weakened: "a `# <title>`, a `**State:**` line, a `**Tags:**` line, whatever the item has to say". Missing: the order is strict, and the Tags line says what the item is.
    35. kept: "and a provenance footer"
    36. kept: "Write a log entry when the item is created and at each change of its state"
    37. kept: "Put no code samples in it"
    38. kept: "Nothing else is required"
    39. kept: "record decisions as dated **Settled** resolutions ... each only where the item does that"
    40. kept: "mark what is left out in an **Out of Scope / Deferred** tail ... each only where the item does that"
    41. kept: "give checkbox tasks stating behavior ... each only where the item does that"
    42. kept: "each only where the item does that"
    43. weakened: "each only where the item does that"; "a shape imposed on thinking is ceremony where the thinking does not have it" (rationale only). Missing: a general prohibition on adding spine beyond the three named.
    44. weakened: "Every item carries a state"; "a `**State:**` line". Missing: "from the moment it is written".
    45. weakened: "Start it **Open** where its thinking is unsettled". Missing: Open as the ongoing state of unsettled thinking, not only the starting state.
    46. weakened: "**Active** where it settles something". Missing: "the work is expected".
    47. kept: "**Realized** — what it describes exists"
    48. weakened: "kept deliberately, with no one working toward it". Missing: "no date".
    49. kept: "An item merely waiting its turn carries `**Waits for:**` instead"
    50. kept: "**Suspended** — paused, not ended"
    51. kept: "**Superseded** — a later item replaced it, and the two name each other"
    52. kept: "**Abandoned** — dropped by decision"
    53. weakened: "it lost its relevance with no one deciding". Missing: "over time", "the work moved past it".
    54. weakened: "An observation starts and stays **Stated**". Missing: Stated belongs to observations only, and it never changes.
    55. kept: "Start it **Open** ... and **Active** ... An observation starts and stays **Stated**"
    56. kept: "Start it **Open** where its thinking is unsettled, and **Active** where it settles something"
    57. weakened: "Every item carries a state". Missing: a missing State line is a defect, and absence is not a state.
    58. weakened: "`Realized`, `Deferred`, and `Open` are taken back to `Active` or `Open` when the work resumes". Missing: the other states are not taken back.
    59. kept: "tagged `[work-item]`, is a piece of work to be done ... concludes `Done`, `Abandoned`, or `Superseded`"
    60. weakened: "except ... `[work-item]`, below". Missing: an explicit statement that the tag is reserved with its meaning set here.
    61. kept: "concludes `Done` ... — never `Realized` or `Lapsed`"
    62. kept: "It takes `Open`, `Active`, `Deferred`, and `Suspended`"
    63. kept: "`Done` is taken back to `Active` when the work reopens"
    64. kept: "Supersede it rather than rewrite it"; "a later item replaced it"
    65. kept: "**Superseded** — a later item replaced it"
    66. kept: "the two name each other"
    67. kept: "what a superseded item settled stays as written"
    68. kept: "Supersede it rather than rewrite it"
    69. kept: "Amend it by dated addition"
    70. weakened: "keeping an outdated resolution's date and wording". Missing: a later resolution states what changed.
    71. kept: "Answer a question that runs against what an item settled, and record the change"
    72. kept: "rather than refusing until the item is amended"
    73. kept: "Reconcile a settled item against later work, and never regenerate it from that work"
    74. weakened: "never regenerate it from that work". Missing: the named item is the source of truth, and the realizes relationship.
    75. kept: "At each change, rename the file"

## Appendix — the directive check on #12

The listing and checking prompts are those of the check on #15, with the file paths changed to `check12`.

### The 19 directives, as the listing agent gave them

    1. Each item in `waytide/local/items/` must have a matching one-line entry in `waytide/local/logs/log/`.
    2. An item's log entry is written only at three moments: when the item is created, at each `Settled` resolution, and at each change of state. It is written at no other time.
    3. An item's tag (`[design]`, `[plan]`, `[aspiration]`, or no kind tag) must not change which log entries it gets or when. Every item gets the same entries at the same moments.
    4. When an item is created, write a one-line log entry that records the item itself, not the word.
    5. Write a log entry for each `Settled` resolution added to an item after it was created.
    6. Write a log entry each time an item's canonical `**State:**` line reaches Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, Lapsed, or (for a work item) Done.
    7. Write a log entry when a reversible state word (Realized, Deferred, Open, or a work item's Done) is taken back, as the items-convention sets out.
    8. An observation is `Stated` and its state never moves, so it gets a creation entry and no other log entry.
    9. A log entry for an item must name the record and say what happened to it, meaning the record was written or its `**State:**` line reached a word.
    10. A log entry may go on to say what the record settles, but only as the record's, never as the system's behavior.
    11. A log entry must never state an unbuilt direction in the indicative mood, for example "The check runs at the engineer's first prompt" while the record is `Open` or `Active`.
    12. For an item, do not write what the item settles in the commit-message grammar (passive voice, indicative mood, the changed thing and its new state). That grammar is for changes to the software, and the only fact about an item is that it was recorded or that its state moved.
    13. The commit subject that carries a log entry must follow the same rule as the entry: what the record settles is stated as the record's, never as the system's behavior.
    14. Do not fix a wording template for item log entries. What is required is that the record is named and the mood is honest.
    15. Do not write a log entry for a completed checkbox task on an item.
    16. Do not write a log entry for prose that settles nothing, such as reconciling a Background & Motivation section, correcting a summary, or rewording a substantive section.
    17. When a reconciliation finds the direction still standing (for example, the design reconciliation at a work session's close answered "the direction stands"), write a log entry for it.
    18. A log entry for a reconciliation that finds the direction still standing must name what the direction was read against.
    19. The items-convention must not restate this log-entry obligation. It names the entry only by pointing to this rule.

### Checker A, word for word

    1. kept: "An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`"
    2. kept: "written at three moments and at no others" and the three bullets "On creation.", "On each dated `Settled` resolution.", "On each change of its `**State:**` line"
    3. kept: "whatever the item is tagged". The tag names are not listed, but the wording covers every tag.
    4. weakened: "On creation." and "The entry names the record and what happened to it". Missing: the explicit contrast that the entry records the item itself, "not the word".
    5. kept: "On each dated `Settled` resolution."
    6. kept: "reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item"
    7. kept: "taking back Realized, Deferred, Open, or a work item's Done". Only the pointer "as the items-convention sets out" is dropped.
    8. kept: "An observation is `Stated` and never moves, so it takes a creation entry only."
    9. kept: "The entry names the record and what happened to it: the record written, or its state reaching a word."
    10. kept: "What the record settles may follow, attributed to the record." together with "Never state an unbuilt direction in the indicative mood."
    11. kept: "Never state an unbuilt direction in the indicative mood. *The check runs at the engineer's first prompt* says the system does that, and while the item is `Open` or `Active` it does not."
    12. weakened: "The `git` package's commit-message rules ask for the changed thing in its new state, which is right for a change to the software. An item is not one: the fact about it is that it was recorded, or that its state moved." Missing: an explicit prohibition, which is only implied, and the grammar's named elements (passive voice, indicative mood).
    13. kept: "Carry the same mood into the commit subject the entry travels in."
    14. kept: "Fix no wording template". The requirement that the record is named and the mood is honest is carried by "The entry names the record" and "Never state an unbuilt direction in the indicative mood."
    15. kept: "Not logged: a completed checkbox task"
    16. kept: "prose that settles nothing, such as reconciling a Background & Motivation section, correcting a summary, or rewording a section"
    17. kept: "Logged, though nothing changed: a reconciliation at a work session's close that finds the direction still standing"
    18. kept: "naming what it was read against, as in `The aspirations stand against …`"
    19. kept: "The items-convention points here rather than keeping a second copy." This is stated as a fact, not as a "must not".

### Checker B, word for word

    1. kept: "An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`"
    2. kept: "written at three moments and at no others", with the three moments listed
    3. kept: "whatever the item is tagged"
    4. kept: "On creation." and "The entry names the record and what happened to it: the record written"
    5. weakened: "On each dated `Settled` resolution." The word "dated" may narrow which resolutions count, and the text does not say the resolution has to be added after the item was created.
    6. kept: "reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item"
    7. kept: "taking back Realized, Deferred, Open, or a work item's Done". It drops the pointer to the items-convention ("as the items-convention sets out").
    8. kept: "An observation is `Stated` and never moves, so it takes a creation entry only."
    9. kept: "The entry names the record and what happened to it: the record written, or its state reaching a word."
    10. kept: "What the record settles may follow, attributed to the record." The "never as the system's behavior" part is carried by "Never state an unbuilt direction in the indicative mood" and by "an entry that asserts what a record only settles is read as the system's behavior".
    11. kept: "Never state an unbuilt direction in the indicative mood. *The check runs at the engineer's first prompt* says the system does that, and while the item is `Open` or `Active` it does not."
    12. weakened: "The `git` package's commit-message rules ask for the changed thing in its new state, which is right for a change to the software. An item is not one: the fact about it is that it was recorded, or that its state moved." This explains why the grammar does not fit an item but does not forbid using it. It also does not name the grammar's parts (passive voice, indicative mood).
    13. weakened: "Carry the same mood into the commit subject the entry travels in." It carries only the mood. The requirement that what the record settles be stated as the record's in the subject is not stated outright.
    14. kept: "Fix no wording template". The requirement that the record is named and the mood is honest is carried by "The entry names the record" and "Never state an unbuilt direction in the indicative mood".
    15. kept: "Not logged: a completed checkbox task"
    16. kept: "prose that settles nothing, such as reconciling a Background & Motivation section, correcting a summary, or rewording a section"
    17. kept: "Logged, though nothing changed: a reconciliation at a work session's close that finds the direction still standing"
    18. kept: "naming what it was read against, as in `The aspirations stand against …`"
    19. kept: "The items-convention points here rather than keeping a second copy." This is stated as a fact rather than as a prohibition.

## Appendix — the directive check on #7

The listing and checking prompts are those of the check on #15, with the file paths changed to `check7`.

### The 20 directives, as the listing agent gave them

    1. Waytide's prose must be written in ASD-STE100 Simplified Technical English.
    2. ETE (Eventide Technical English) must apply the STE dictionary and the STE writing rules, with Waytide's reserved terms and its substitutions, in the order this rule states.
    3. `Say it in ETE` is the instruction to write in ETE.
    4. `Say it in STE` asks for the raw standard, and it forbids `efferent`, `cradle`, `hinge`, and every other term Waytide reserved.
    5. The STE dictionary decides first.
    6. Waytide keeps its own word where the STE dictionary's approved word means something else.
    7. ETE may add five categories of its own, against STE Rule 1.5 and STE Rule 1.12 (as the ete-declares-its-own-categories rule states).
    8. A reserved word may take the meaning its entry gives, against STE Rule 1.3 (as the ete-fixes-the-meaning-of-a-word-in-its-category rule states).
    9. Ordinary words must be left alone, against STE Rule 1.1 (as the ordinary-vocabulary-is-not-reserved-and-not-rewritten rule states).
    10. Where the STE dictionary marks a word as not approved and its approved alternative carries the meaning, use the alternative (for example, `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`).
    11. A Waytide word kept where the approved word means something else must be reserved as a technical noun or a technical verb, in a category the entry names.
    12. A Waytide word kept where the approved word means something else must be recorded in the package's `vocabulary.md`.
    13. Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs.
    14. A word the STE dictionary does not list is not a defect, and it may be used as a technical noun or a technical verb (STE Rule 1.1).
    15. `conform` is reserved, and it is used in place of `sweep`, `SCAN`, and `AGREE` for the meaning "to bring code or prose into line with a convention."
    16. The record of a reserved term must say which case it is in: absent from the STE dictionary, or not approved by it.
    17. A substitution (replacing a word Waytide rejects) and a reservation (keeping a word STE rejects) must be treated as different acts.
    18. A writer must not choose a worse word out of deference to the STE dictionary.
    19. Write to the STE dictionary.
    20. The record of a reserved word must state what the STE dictionary says about it.

### Checker A, word for word

    1. kept: "Waytide writes its prose in ASD-STE100 Simplified Technical English"
    2. kept: "ETE is the STE dictionary and writing rules, with Waytide's reserved terms and its substitutions, in the sequence this rule states"
    3. kept: "`Say it in ETE` asks for that."
    4. kept: "`Say it in STE` asks for the raw standard, without `efferent`, `cradle`, `hinge`, or any other term Waytide reserved"
    5. kept: "The STE dictionary decides first."
    6. kept: "Keep Waytide's word where the approved word means something else."
    7. kept: "The ete-declares-its-own-categories rule adds five categories of Waytide's own, against STE Rules 1.5 and 1.12."
    8. kept: "The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take its entry's meaning, against STE Rule 1.3."
    9. kept: "The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves ordinary words alone, against STE Rule 1.1."
    10. kept: "Use the alternative where it carries the meaning: `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`."
    11. kept: "Reserve it as a technical noun or a technical verb, in a category its entry names"
    12. kept: "in the package's `vocabulary.md`"
    13. kept: "Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs."
    14. kept: "A word the dictionary does not list is not a defect. STE Rule 1.1 permits it as a technical noun or a technical verb"
    15. kept: "The `language` vocabulary discontinues `sweep` for `conform`: to bring code or prose into line with a convention. Neither `SCAN` nor `AGREE` ... carries that meaning, so `conform` is reserved and wins."
    16. kept: "So the record says which case a reserved term is in."
    17. kept: "A substitution replaces a word Waytide rejects, and a reservation keeps a word STE rejects. They are different acts"
    18. weakened: "keeps a writer from choosing a worse word out of deference". Missing: it appears only in the Why, as the effect of the rule rather than as a prohibition, and it does not say the deference is to the STE dictionary.
    19. kept: "Waytide writes its prose in ASD-STE100 Simplified Technical English: an approved dictionary" / "The STE dictionary decides first."
    20. kept: "record what the STE dictionary says about it"

### Checker B, word for word

    I judged all 20 directives against the shorter version: 19 are kept, 1 is weakened (number 18) and none are lost.

    1. kept — "Waytide writes its prose in ASD-STE100 Simplified Technical English"
    2. kept — "ETE is the STE dictionary and writing rules, with Waytide's reserved terms and its substitutions, in the sequence this rule states."
    3. kept — "`Say it in ETE` asks for that."
    4. kept — "`Say it in STE` asks for the raw standard, without `efferent`, `cradle`, `hinge`, or any other term Waytide reserved."
    5. kept — "The STE dictionary decides first."
    6. kept — "Keep Waytide's word where the approved word means something else."
    7. kept — "The ete-declares-its-own-categories rule adds five categories of Waytide's own, against STE Rules 1.5 and 1.12."
    8. kept — "The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take its entry's meaning, against STE Rule 1.3."
    9. kept — "The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves ordinary words alone, against STE Rule 1.1."
    10. kept — "Use the alternative where it carries the meaning: `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`."
    11. kept — "Reserve it as a technical noun or a technical verb, in a category its entry names"
    12. kept — "in the package's `vocabulary.md`"
    13. kept — "Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs."
    14. kept — "A word the dictionary does not list is not a defect. STE Rule 1.1 permits it as a technical noun or a technical verb"
    15. kept — "The `language` vocabulary discontinues `sweep` for `conform`: to bring code or prose into line with a convention. Neither `SCAN` nor `AGREE`, which the dictionary gives for `conform`, carries that meaning, so `conform` is reserved and wins."
    16. kept — "So the record says which case a reserved term is in."
    17. kept — "A substitution replaces a word Waytide rejects, and a reservation keeps a word STE rejects. They are different acts"
    18. weakened — "keeps a writer from choosing a worse word out of deference." Missing: this sentence is a reason under "Why:", not a prohibition, and it does not say the deference is to the STE dictionary.
    19. kept — "The STE dictionary decides first." together with "Waytide writes its prose in ASD-STE100 Simplified Technical English: an approved dictionary and 53 writing rules."
    20. kept — "record what the STE dictionary says about it."

## Appendix — the directive check on #2

The listing and checking prompts are those of the check on #15, with the file paths changed to `check2`.

### The 8 directives, as the listing agent gave them

    1. Every time an implementation hinge is satisfied (the just-accepted implementation is written and the suite is run), show the test output for the current feature.
    2. Show the current feature's test output without being asked.
    3. Do not show only the single outcome's test at an implementation hinge.
    4. At an implementation hinge, run and display the whole feature's tests, meaning every outcome built so far for the unit under development.
    5. Run the feature's tests with verbose output, so the context tree, the `comment` and `detail` narration, and pass/fail are visible.
    6. Show the feature's test output in the same turn as reporting the implementation.
    7. After writing an accepted implementation, run the suite before running the current feature's test files.
    8. The feature's full test output is required at every implementation hinge, in addition to the implementation and the just-satisfied test that the what-each-hinge-displays rule requires.

### Checker A, word for word

    1. kept: "After each implementation hinge, show the whole feature's test output" and "Once the accepted implementation is written and the suite has run"
    2. kept: "unasked"
    3. kept: "every outcome built so far for the unit, not only the new one"
    4. kept: "run every test file of the current feature — every outcome built so far for the unit"
    5. kept: "with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show"
    6. kept: "Put the output in the turn that reports the implementation."
    7. kept: "Once the accepted implementation is written and the suite has run, run every test file of the current feature"
    8. kept: "The what-each-hinge-displays rule shows the implementation and the new outcome's test, and this rule adds the feature's full output." (Together with "After each implementation hinge, show the whole feature's test output", this makes the output required at every hinge.)

### Checker B, word for word

    All 8 directives are kept in the shorter version. None are weakened or lost.

    1. kept — "After each implementation hinge, show the whole feature's test output" and "Once the accepted implementation is written and the suite has run"
    2. kept — "unasked"
    3. kept — "every outcome built so far for the unit, not only the new one"
    4. kept — "run every test file of the current feature — every outcome built so far for the unit"
    5. kept — "with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show"
    6. kept — "Put the output in the turn that reports the implementation."
    7. kept — "Once the accepted implementation is written and the suite has run, run every test file of the current feature"
    8. kept — "The what-each-hinge-displays rule shows the implementation and the new outcome's test, and this rule adds the feature's full output." The obligation comes from the imperative heading, "After each implementation hinge, show the whole feature's test output", since this sentence itself only describes. "new outcome's test" stands for "just-satisfied test".

## Appendix — the directive check on the rewritten #2 and #12

The checking prompt is that of the check on #15, with the file paths changed to `check2b` and `check12b`. The directive lists are those of the first checks on #2 and #12.

### #2, checker A, word for word

    All 8 directives are carried by the shorter version: 8 kept, 0 weakened, 0 lost.

    1. kept: "After each implementation hinge, show the whole feature's test output" and "First, write the accepted implementation and run the suite."
    2. kept: "show the whole feature's test output, unasked."
    3. kept: "every outcome built so far for the unit, not only the new one."
    4. kept: "Then run every test file of the current feature. That is every outcome built so far for the unit"
    5. kept: "Run them with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show."
    6. kept: "Put the output in the turn that reports the implementation."
    7. kept: "First, write the accepted implementation and run the suite. Then run every test file of the current feature."
    8. kept: "The what-each-hinge-displays rule shows the implementation and the new outcome's test. This rule adds the feature's full output." together with "After each implementation hinge, show the whole feature's test output".

### #2, checker B, word for word

    1. kept. "After each implementation hinge, show the whole feature's test output" together with "First, write the accepted implementation and run the suite."
    2. kept. "unasked"
    3. kept. "every outcome built so far for the unit, not only the new one"
    4. kept. "Then run every test file of the current feature. That is every outcome built so far for the unit, not only the new one."
    5. kept. "Run them with verbose output, so the context tree, the `comment` and `detail` narration, and pass or fail show."
    6. kept. "Put the output in the turn that reports the implementation."
    7. kept. "First, write the accepted implementation and run the suite. Then run every test file of the current feature."
    8. kept. "The what-each-hinge-displays rule shows the implementation and the new outcome's test. This rule adds the feature's full output."

### #12, checker A, word for word

    The shorter version keeps 16 of the 19 directives and weakens 3 (4, 5 and 13). None are lost.

    1. kept — "An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`."
    2. kept — "The entry is written at three moments, and at no others."
    3. kept — "The item's tag makes no difference." The four tags are not listed, but the statement covers them all.
    4. weakened — "On creation." / "The entry names the record and what happened to it." Missing: the explicit "records the item itself, not the word" contrast.
    5. weakened — "On each dated `Settled` resolution." Missing: the qualifier "added after it was created". Without it, a resolution present at creation could be read as needing its own entry.
    6. kept — "That is the line reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item."
    7. kept — "It is also the line taking back Realized, Deferred, Open, or a work item's Done." Only the pointer to the items-convention is dropped.
    8. kept — "An observation is `Stated` and never moves, so it takes a creation entry only."
    9. kept — "The entry names the record and what happened to it. The record was written, or its state reached a word."
    10. kept — "What the record settles may follow, attributed to the record." The "never as the system's behavior" half is carried by "Never state an unbuilt direction in the indicative mood" and the Why paragraph.
    11. kept — "Never state an unbuilt direction in the indicative mood. *The check runs at the engineer's first prompt* says the system does that. While the item is `Open` or `Active`, it does not."
    12. kept — "That form is right for a change to the software. An item is not a change to the software, so do not use that form for it. The fact about an item is that it was recorded, or that its state moved."
    13. weakened — "Carry the same mood into the commit subject the entry travels in." Missing: the explicit requirement that what the record settles is stated as the record's, never as the system's behavior. "Mood" is narrower than that requirement.
    14. kept — "Fix no wording template." The "record named, mood honest" requirement is carried by the "names the record" and indicative-mood statements.
    15. kept — "A completed checkbox task is not logged."
    16. kept — "Prose that settles nothing is not logged either. Examples are reconciling a Background & Motivation section, correcting a summary, and rewording a section."
    17. kept — "At a work session's close, a reconciliation may find the direction still standing. Log it"
    18. kept — "and name what it was read against, as in `The aspirations stand against …`."
    19. kept — "The items-convention points here and keeps no second copy."

### #12, checker B, word for word

    1 — kept — "An item in `waytide/local/items/` pairs with a one-line entry in `waytide/local/logs/log/`."
    2 — kept — "The entry is written at three moments, and at no others." plus the three bullets "On creation." / "On each dated `Settled` resolution." / "On each change of its `**State:**` line."
    3 — kept — "The item's tag makes no difference." (it does not list the tags, but it covers all of them)
    4 — weakened — "On creation." and "The entry names the record … The record was written". Missing: the explicit point that the creation entry records the item itself, not the word.
    5 — weakened — "On each dated `Settled` resolution." Missing: "added after it was created". Without it, a resolution already present at creation could seem to need its own entry as well.
    6 — kept — "That is the line reaching Open, Active, Realized, Deferred, Suspended, Superseded, Abandoned, or Lapsed, or Done for a work item."
    7 — kept — "It is also the line taking back Realized, Deferred, Open, or a work item's Done." (the pointer "as the items-convention sets out" is dropped, but the behavior is the same)
    8 — kept — "An observation is `Stated` and never moves, so it takes a creation entry only."
    9 — kept — "The entry names the record and what happened to it. The record was written, or its state reached a word."
    10 — kept — "What the record settles may follow, attributed to the record." together with "an entry that asserts what a record only settles is read as the system's behavior."
    11 — kept — "Never state an unbuilt direction in the indicative mood. *The check runs at the engineer's first prompt* says the system does that. While the item is `Open` or `Active`, it does not."
    12 — kept — "The `git` package's commit-message rules ask for the changed thing in its new state. That form is right for a change to the software. An item is not a change to the software, so do not use that form for it. The fact about an item is that it was recorded, or that its state moved." (it does not name the grammar's passive voice and indicative mood, but it rules out the form)
    13 — weakened — "Carry the same mood into the commit subject the entry travels in." Missing: the subject must also state what the record settles as the record's, not as the system's behavior. Only the mood is carried over.
    14 — kept — "Fix no wording template." The requirement that remains (name the record, honest mood) is stated elsewhere in "The entry names the record…" and "Never state an unbuilt direction in the indicative mood."
    15 — kept — "A completed checkbox task is not logged"
    16 — kept — "Prose that settles nothing is not logged either. Examples are reconciling a Background & Motivation section, correcting a summary, and rewording a section." ("substantive" is dropped from the last example, a minor change)
    17 — kept — "At a work session's close, a reconciliation may find the direction still standing. Log it"
    18 — kept — "and name what it was read against, as in `The aspirations stand against …`."
    19 — kept — "The items-convention points here and keeps no second copy."

## Appendix — the directive check on #13

The listing and checking prompts are those of the check on #15, with the file paths changed to `check13` and the middle verdict named less precise.

### The 37 directives, as the listing agent gave them

    1. A project may declare a package set, and the packages outside the declared set are deactivated.
    2. The package-set declaration is a record at `waytide/local/`, and its file name gives the moment it was made and what it names, e.g. `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`.
    3. Where a package-set declaration names more than one name, its file name joins those names with hyphens.
    4. Where no package-set declaration exists, every installed package is active.
    5. Where no package-set declaration exists, that state is not reported.
    6. Declaring a package set writes a new record and does not edit an existing one.
    7. Of the package-set records, the one with the latest time prefix is the one that holds.
    8. Reverting the package set is done with a new declaration like any other, naming `default`.
    9. The package-set declaration is read from three plain text data attribute lines: `**Package set:**`, `**Packages:**`, and `**Inactive:**`.
    10. A package-set record that is missing the `**Package set:**` line or the `**Packages:**` line is not a declaration.
    11. The `**Package set:**` line records what the engineer declared, which may be a set name, a list of package names, or a mixture of the two.
    12. Each name in a package-set declaration is either a package set or a package, the same grammar `install` takes.
    13. The `**Packages:**` line records what the declaration resolved to, captured when the declaration is made and not computed at every session start.
    14. The `**Inactive:**` line records the packages that were installed and not active when the declaration was made, and it is recorded, not inferred.
    15. The `**Packages:**` line is authoritative: the active list is the whole of what is active.
    16. A package installed after the declaration appears in neither the `**Packages:**` line nor the `**Inactive:**` line, and it is inactive until the set is declared again.
    17. Where an active package's README includes another package, the included package is active whether or not the declaration named it.
    18. A deactivated package's rules are read at session start exactly as an active package's are. The declaration governs whether they are applied, not whether they are read.
    19. No package-set declaration narrows the announce-waytide-at-session-start rule's unconditional read.
    20. The read of a deactivated package is not skipped, so that a rule read and withheld can still be cited, weighed, and reactivated within the session.
    21. `refresh-packages.sh` refreshes a deactivated package like any other, because a package that is read must not be stale.
    22. The agent prints the active packages at the head of the response that carries the rule read.
    23. The packages are not printed in the session-start notice or in the startup display.
    24. The printed list includes every installed package and hides none.
    25. In the printed list, the active packages are bold.
    26. In the printed list, the deactivated packages are italic.
    27. The set's name follows the printed list, in the form `package set: content`.
    28. A count line closes the printed list, in the form `(5 active of 8 installed)`.
    29. The hidden-record convention of the status-report-format rule is not applied to the printed package list.
    30. Where no set is declared, nothing about a set is printed, including no line saying there is none.
    31. A declaration of `default` prints nothing where nothing is deactivated.
    32. A declaration of `default` does print the list where it leaves a package deactivated, which happens when the project holds a package that `default` does not name.
    33. Declaring a set during a session does not unload rules already read. A newly declared set takes effect at the next session.
    34. When a set is declared during a session, say that the deactivated packages' rules stay in force for this session and that Claude has to be restarted for them to stop applying.
    35. At session start, read the most recent `*-package-set.md` under `waytide/local/`.
    36. Follow only the rules of the active packages.
    37. Where the engineer declares a set during a session, write the record first, then say that a restart is needed.

### Checker A, word for word

    Of the 37 directives, 33 are kept, 4 are less precise and none are lost. The four are 15, 33, 35 and 36.

    1. kept — "A project may declare a package set, and the packages outside it are deactivated."
    2. kept — "A declaration is a record under `waytide/local/`. Its name is the ISO-8601-UTC prefix and the declared names, hyphen-joined: `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`"
    3. kept — "the declared names, hyphen-joined"
    4. kept — "Where no set is declared, every installed package is active"
    5. kept — "and nothing reports it"
    6. kept — "A new declaration writes a new record and edits none."
    7. kept — "The record with the latest prefix holds"
    8. kept — "Reverting is a declaration naming `default`."
    9. kept — "Three lines carry it" (the code block shows `**Package set:**`, `**Packages:**`, `**Inactive:**`), with "the plain text data attribute line" under Related
    10. kept — "a record without the first two is not a declaration"
    11. kept — "`**Package set:**` is what the engineer declared: a set name, package names, or both"
    12. kept — "a set name, package names, or both, in the grammar `install` takes"
    13. kept — "`**Packages:**` is what that resolved to, recorded when declared rather than computed at session start"
    14. kept — "`**Inactive:**` is what was installed and not active then. It is recorded, not inferred"
    15. less precise — "It is authoritative." Missing: it never says the active list is the whole of what is active.
    16. kept — "A package installed later is in neither line, so it stays inactive until a new declaration takes it up."
    17. kept — "Where an active package's README includes another package, that package is active, named or not."
    18. kept — "A deactivated package's rules are read at session start like an active package's. The declaration decides which rules are applied, not which are read"
    19. kept — "it does not narrow the unconditional read", with Related "the announce-waytide-at-session-start rule — the unconditional read this leaves whole"
    20. kept — "Every package is still read." / "A rule that is read and withheld can be cited, weighed, and reactivated within the session."
    21. kept — "`refresh-packages.sh` refreshes a deactivated package like any other, so nothing read is stale."
    22. kept — "The agent prints the packages at the head of the response that carries the read"
    23. kept — "The session-start notice and the startup display print none of it."
    24. kept — "List every installed package and hide none"
    25. kept — "with active ones bold"
    26. kept — "and deactivated ones italic"
    27. kept — "Follow the list with the set's name, `package set: content`"
    28. kept — "close with a count line, `(5 active of 8 installed)`"
    29. kept — "The hidden-record rule does not apply", with Related "the status-report-format rule — the hidden-record convention this deliberately does not use"
    30. kept — "Where no set is declared, print nothing about a set, not even a line saying so."
    31. kept — "A declaration of `default` prints nothing where it deactivates nothing."
    32. kept — "It does print where the project holds a package that `default` does not name."
    33. less precise — "A declaration does not unload rules already read." Missing: it never says a new set takes effect at the next session. The restart wording only implies it.
    34. kept — "Then say that the deactivated packages' rules stay in force for this session, and that Claude must be restarted for them to stop applying."
    35. less precise — "The record with the latest prefix holds". Missing: no instruction to read that record at session start, and no `*-package-set.md` file pattern.
    36. less precise — "The declaration decides which rules are applied" / "A rule that is read and withheld". Missing: no direct directive to follow only the active packages' rules.
    37. kept — "When the engineer declares a set, write the record. Then say that … Claude must be restarted"

### Checker B, word for word

    Of the 37 directives, 34 are kept, 3 are less precise (15, 33, 35) and none are lost. I read only the two files the prompt names.

    1. kept — "A project may declare a package set, and the packages outside it are deactivated."
    2. kept — "A declaration is a record under `waytide/local/`. Its name is the ISO-8601-UTC prefix and the declared names ... `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`"
    3. kept — "the declared names, hyphen-joined"
    4. kept — "Where no set is declared, every installed package is active"
    5. kept — "and nothing reports it"
    6. kept — "A new declaration writes a new record and edits none."
    7. kept — "The record with the latest prefix holds"
    8. kept — "Reverting is a declaration naming `default`."
    9. kept — "Three lines carry it" (followed by the three lines shown), together with "the plain text data attribute line, as `**State:**` and `**Repository:**` already use it"
    10. kept — "a record without the first two is not a declaration"
    11. kept — "`**Package set:**` is what the engineer declared: a set name, package names, or both"
    12. kept — "a set name, package names, or both, in the grammar `install` takes"
    13. kept — "`**Packages:**` is what that resolved to, recorded when declared rather than computed at session start"
    14. kept — "`**Inactive:**` is what was installed and not active then. It is recorded, not inferred"
    15. less precise — "It is authoritative." Missing: the active list is the whole of what is active.
    16. kept — "A package installed later is in neither line, so it stays inactive until a new declaration takes it up."
    17. kept — "Where an active package's README includes another package, that package is active, named or not."
    18. kept — "A deactivated package's rules are read at session start like an active package's. The declaration decides which rules are applied, not which are read"
    19. kept — "it does not narrow the unconditional read", with Related: "the announce-waytide-at-session-start rule — the unconditional read this leaves whole"
    20. kept — "Every package is still read." / "A rule that is read and withheld can be cited, weighed, and reactivated within the session."
    21. kept — "`refresh-packages.sh` refreshes a deactivated package like any other, so nothing read is stale."
    22. kept — "The agent prints the packages at the head of the response that carries the read"
    23. kept — "The session-start notice and the startup display print none of it."
    24. kept — "List every installed package and hide none"
    25. kept — "with active ones bold"
    26. kept — "and deactivated ones italic"
    27. kept — "Follow the list with the set's name, `package set: content`"
    28. kept — "close with a count line, `(5 active of 8 installed)`"
    29. kept — "The hidden-record rule does not apply", with Related: "the status-report-format rule — the hidden-record convention this deliberately does not use"
    30. kept — "Where no set is declared, print nothing about a set, not even a line saying so."
    31. kept — "A declaration of `default` prints nothing where it deactivates nothing."
    32. kept — "It does print where the project holds a package that `default` does not name."
    33. less precise — "A declaration does not unload rules already read." Missing: the new set as a whole takes effect only at the next session. The restart sentence covers only deactivated rules staying in force, not packages the new set newly activates.
    34. kept — "say that the deactivated packages' rules stay in force for this session, and that Claude must be restarted for them to stop applying"
    35. less precise — "The record with the latest prefix holds" Missing: the explicit instruction to read the most recent `*-package-set.md` under `waytide/local/` at session start.
    36. kept — "The declaration decides which rules are applied" / "A rule that is read and withheld"
    37. kept — "When the engineer declares a set, write the record. Then say that ... Claude must be restarted"

---

Authored by Scott Bellware on Wed Oct 21 2026 at 9:51:25 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:56:47 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:58:18 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:00:55 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:14:16 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:16:14 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:17:55 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:03 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:54 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:30:09 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:31:16 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:33:43 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:35:14 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:11:49 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:14:34 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:16:44 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:17:45 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:21:16 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:25:08 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:27:49 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:29:43 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:33:33 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:34:42 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:40:50 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:41:20 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:43:06 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:43:56 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:44:15 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:45:48 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:49:53 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:50:07 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:51:40 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 11:55:09 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:01:34 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:02:14 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:04:07 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:05:24 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:07:42 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:09:41 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:12:28 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 9:28:49 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 10:58:15 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 11:13:06 AM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:35:52 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:37:06 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:39:20 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 12:40:28 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:01:57 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:02:58 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:07:12 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:27:47 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:35:17 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:36:12 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:39:29 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:41:01 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:42:16 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 2:06:22 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 2:09:00 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 2:09:19 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:19:41 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:22:11 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:23:11 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:23:58 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 3:28:16 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:02:09 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:14:12 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:16:38 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:19:09 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:20:30 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:22:07 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:27:45 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:28:28 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:29:36 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:30:37 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:35:54 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:40:13 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:45:59 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:47:19 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 12:01:03 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 1:47:55 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 1:59:18 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:34:07 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:39:24 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:45:01 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:04:19 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:32:59 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:34:49 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:43:07 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:07:24 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:18:10 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:20:51 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:24:14 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:54:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:58:02 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:01:50 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:04:18 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:05:29 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:06:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:08:50 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:19:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:28:43 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:00:56 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:07:22 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 4:28:05 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:49:41 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:54:42 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:09:12 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:30:35 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:40:21 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:14:00 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:24:31 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:25:02 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:28:21 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:57:22 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 4:00:48 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 8:11:26 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 8:59:39 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 11:34:17 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 11:36:52 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 11:44:55 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 11:47:59 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 11:49:00 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 11:50:02 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 12:04:12 AM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 8:24:19 AM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 1:31:13 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 2:35:50 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 2:44:30 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 2:48:41 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 3:09:58 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 3:35:58 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 3:55:54 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 4:40:48 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 4:57:39 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:03:47 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:12:43 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:28:18 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:43:06 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:03:49 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:06:19 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:12:53 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:16:53 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:20:46 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:36:49 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:37:28 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:40:29 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 7:54:47 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 8:10:00 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 8:45:00 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 9:43:12 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 10:05:32 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 10:13:13 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 10:19:22 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:07:39 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:26:15 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:37:21 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:39:24 AM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:40:29 AM PT
