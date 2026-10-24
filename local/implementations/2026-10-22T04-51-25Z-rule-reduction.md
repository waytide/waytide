# Experiment — Rule reduction

**Tags:** [experiment]

## Question

**Can the rules a session reads be reduced — in their content, in how they are read, and in how they arrive — and sessions still behave the same?**

It realizes the item *Reducing rule files to their essential directives*, `local/items/2026-09-09T20-36-50Z-reducing-rule-files-to-their-essential-directives-OPEN.md`, and its plan.

## Phases

One at a time, in this order, each on its own branch from the experiment's.

1. **flattening** — `experiment/worktree/rule-reduction.flattening`. Can each rule be flattened to its essential content — present directives and their reasons — and sessions behave the same? *Same effect and outcome* is the engineer's test for what is essential.
2. **packaged-script** — `experiment/worktree/rule-reduction.packaged-script`. Does one packaged script that prints every rule in a fixed order shorten the session-start read?
3. **additional-context** — `experiment/worktree/rule-reduction.additional-context`. Can the session-start hook deliver the rules to the agent before its first response, with no read at all?

## State

**Suspended by the engineer on 2026-10-22**, during phase 1, flattening. The phase branch `experiment/worktree/rule-reduction.flattening` and the worktree are kept. Phase 1 had reached this point:

- **Five rules compressed:** #2, #7, #11, #12, and #15. Each passed the predictability simulation, with one miss in 150 answers.
- **The directive check run on #15:** its one material loss of precision, the missing-upstream decision, was restored.
- **The directive check run on #11:** two directives were found lost outside the intended resolution, and are not restored.

**Whether a compressed rule has the same effect as its source remains open.**

**Resumed by the engineer on 2026-10-22.** The State line is removed, since absence is the in-progress state, and work continues on the phase branch in the worktree.

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
