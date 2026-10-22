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
