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

### #7 is compressed — 2026-10-21

**#7, waytide-keeps-its-word-where-the-ste-word-means-something-else, is compressed**, at the engineer's direction, and its compressed version is appended in a `## Compressed` section before `Related:`. Against its body, as #2's and #11's were measured:

- **compression 0.27**: 4,052 characters to 2,943
- **change 0.56**: of 649 words, 285 stay in place

Every directive is kept: the standard and what ETE adds to it, `say it in ETE` against `say it in STE`, the sequence, the three answers the dictionary can give, the `sweep` instance, substitution against reservation, absent against not approved and the record of which, and the three rules that carry the departures. What went is restatement, chiefly a How to apply paragraph that repeats the sequence. The source has no contradiction to resolve.

**#7 compressed least of the three.** At solubility 50 it compressed 0.27, against #2's 0.54 at 91 and #11's 0.61 at 11. The rule was already dense: it says most things once. On three rules, compression does not follow solubility in either direction.

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
