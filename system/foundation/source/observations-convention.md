# An observation is `Recorded` — a working hypothesis, not yet binding, whose one state never changes

`waytide/local/items/` holds working hypotheses, definitions, and methods that are **not yet binding**. They are rule-candidates surfaced during open-ended discovery, before the thinking has stabilized enough to canonize. They are *not* read as binding at session start the way rules are. They record in-progress understanding.

**An observation lives in `waytide/local/items/` and is tagged `[observation]`.** The tag is what makes a record an observation.

## `Recorded` is an observation's only state, and it never changes

**As the engineer stated it:** observations don't need a state, they don't have a lifecycle, they are just stated — and the state could be `Stated`.

**As the engineer later stated it:** change an observation's "stated" state to "recorded".

**An observation carries `**State:** Recorded` from the moment it is written**, and it carries that word for the rest of its life. Its filename ends `-RECORDED`.

**It carries no `**Why this state:**` line.** That line said how settled the thinking was and what would promote it. Where a record has one state and cannot leave it, there is nothing to account for.

**An observation has no lifecycle**, which is what one unchanging state says. It is never realized, abandoned, lapsed, superseded, or suspended. Those words belong to a record that was going somewhere, and an observation is not going anywhere — it was thought, and it was written down, and neither of those is a stage.

**An observation that no longer holds is not retracted.** A later observation states the later thinking, and the earlier one stays as what was thought at the time.

**Promotion is not a state change either.** When an observation stabilizes into a binding convention, the rule is written in `waytide/local/rules/`, and that rule is the observation's result. The observation takes one added line naming it, `**Promoted to:** the <name> rule`, under its `**Tags:**` line. Nothing else about the observation changes: what it says stays as written, as the discovery record, and its state stays `Recorded`.

**So the items-convention needs no exception.** Every item carries a state from the moment it is written, and an observation does too. What is particular to an observation is that the state is fixed, not that it is absent.

## The shape

- **When to use:** the material is genuinely useful to keep but still under active discovery, or it is a method or definition the engineer has not ratified as a convention. When in doubt between a rule and an observation, prefer an observation — promoting later is cheap, retracting a premature rule is not.
- **Format:** the same frontmatter-free markdown as rules — a `# <title>`, a `**State:** Recorded` line, a `**Tags:**` line carrying `[observation]`, then the content in prose. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule) and ends `-RECORDED`.
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
- **Promotion:** write the rule in `waytide/local/rules/`, naming the observation it came from. Add the `**Promoted to:**` line to the observation, and add a `waytide/local/logs/log/` entry for the promotion. Leave the rest of the observation as written.
- **Recording one:** add the file, and add a matching one-line entry to `waytide/local/logs/log/` noting it was recorded as an observation, and why it is not yet a rule.

**Why:** discovery produces valuable thinking before it is ready to be binding, and a place for non-binding hypotheses keeps that thinking without prematurely imposing it as a rule.

Giving an observation the **eight states every other item takes** was the cost of holding it in the same directory, and it bought nothing. Sixteen of this project's eighteen observations sat at `Open` and moved nowhere, because there was nowhere for them to move — a hypothesis that stabilizes becomes a rule somewhere else, and one that does not simply stands. `Open` said the thinking was unsettled and might settle, which is a promise the record never had to keep.

`Recorded` says what happened to an observation, and it stays true: the thinking was written down and kept. `RECORD (v)` is approved in the STE dictionary, meaning *to make notes of and keep data to use subsequently*, and it is used with that meaning. `state (v)` is not approved, and the STE dictionary gives TELL. The line still reads as a state, so a directory listing answers the same question for an observation that it answers for every other record, and the answer is that this one is an observation and observations do not move.

**How to apply:** record an in-progress hypothesis or unratified method here, tagged `[observation]`, with `**State:** Recorded` and a filename ending `-RECORDED`. Write no `**Why this state:**` line. Never change the state.

Write a later observation where the thinking moves, and leave the earlier one as written. Promote it by writing the rule elsewhere, and add to the observation only the line naming that rule.

## History

Until 2026-10-28 an observation's one state was `Stated`, and its filename ended `-STATED`. The engineer settled `Recorded`, a word the STE dictionary approves with the meaning the state needs.

Until 2026-10-25 the Promotion step said to "note the promotion in the two files", the rule and the observation, while the same step said to leave the observation as written and the body said nothing about the observation changes when the rule appears. The engineer settled that the rule is the observation's result, and that the observation names it in one added line.

Related:

- the items-convention — the eight states an observation does not take, and the state requirement it satisfies
- the rules-convention — where a promoted observation's rule goes
- the a-record-ends-with-its-state-in-upper-case rule — the `-RECORDED` filename suffix
- the decision-log-convention — the entry that records one

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:21:39 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:25:14 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:32:18 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:27:24 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:23:16 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
