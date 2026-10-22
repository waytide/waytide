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

8. **Added 2026-10-21, before any rule was flattened — the engineer's hypothesis: the lower a rule's solubility score, the lower its compressibility.** A rule harder to understand is one the agent can interpret less, and so restate less economically. **Compressibility** is the share of a rule's characters removed when it is restated with the same effect and outcome: a rule flattened from 8,935 characters to 6,000 has a compressibility of 0.33. *The engineer's suspicion, stated as a forecast.*
   - **Extended by the engineer, still before any rule was flattened: a lower-solubility rule also comes out less changed.** The agent has less effect on a rule it cannot understand, and more on one it understands well enough to word more economically. So two things are measured for each flattened rule: its **compressibility**, the share of characters removed, and its **change**, the share of its words removed, added, or replaced, from a word-level comparison of before and after. The hypothesis predicts both are lower where solubility is lower.
   - **The agent's competing expectation: the reverse.** A rule hard to follow because it is verbose, repetitive, or carries history may have the most to remove, and so compress the most. *Low confidence, as the engineer's is untested too.* Measuring each subject rule's compressibility beside its solubility score tells the two apart.

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

**Solubility runs the other way, corrected by the engineer: higher is easier to process.** A rule's measured solubility is 1 − its combined score, so it runs as the clarity score does and as the word does in the `language` solubility rule. The five candidates' `**Solubility:**` lines now carry it — items-convention 0.11, an-item-takes-a-log-entry 0.17, a-project-declares-its-package-set 0.20, implementation-lifecycle 0.21, and announce-waytide-at-session-start 0.24 — and forecast item 8 is restated to match: the lower a rule's solubility, the lower its compressibility. The term still names only a rule's measured score.

**Solubility is scaled to 0–100, at the engineer's direction: (1 − the combined score) × 100, as a whole number.** items-convention is 11, an-item-takes-a-log-entry 17, a-project-declares-its-package-set 20, implementation-lifecycle 21, and announce-waytide-at-session-start 24. Computed from the unrounded scores, each rounds to the same whole number as the two-decimal value times 100.

**The candidates as they now stand**, solubility being (1 − the combined score) × 100, where higher is easier to process:

| rule | size, characters | Original rank | clarity score | solubility |
|---|---|---|---|---|
| items-convention | 8,935 | 1 of 106 | 0.18 | 11 |
| an-item-takes-a-log-entry | 7,493 | 2 of 106 | 0.23 | 17 |
| a-project-declares-its-package-set | 6,156 | 5 of 106 | 0.24 | 20 |
| implementation-lifecycle | 13,855 | 6 of 106 | 0.42 | 21 |
| announce-waytide-at-session-start | 27,994 | 10 of 106 | 0.48 | 24 |

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
