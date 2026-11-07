# An observation is a working hypothesis whose one state, Recorded, never changes

**Trigger:** When recording or revising an observation in slasher/local/items/

`slasher/local/items/` holds working hypotheses, definitions, and methods that are **not yet binding**. They are rule-candidates surfaced during open-ended discovery, before the thinking has stabilized enough to canonize. They are *not* read as binding at session start the way rules are. They record in-progress understanding.

**An observation lives in `slasher/local/items/` and is tagged `[observation]`.** The tag is what makes a record an observation.

## `Recorded` is an observation's only state, and it never changes

**As the engineer stated it:** observations don't need a state, they don't have a lifecycle, they are just stated — and the state could be `Stated`.

**As the engineer later stated it:** change an observation's "stated" state to "recorded".

**An observation carries `**State:** Recorded` from the moment it is written**, and it carries that word for the rest of its life. Its filename ends `-RECORDED`.

**It carries no `**Why this state:**` line.** That line said how settled the thinking was. Where a record has one state and cannot leave it, there is nothing to account for.

**An observation has no lifecycle**, which is what one unchanging state says. It is never realized, abandoned, obsolete, superseded, or suspended. Those words belong to a record that was going somewhere, and an observation is not going anywhere — it was thought, and it was written down, and neither of those is a stage.

**An observation that no longer holds is not retracted.** A later observation states the later thinking, and the earlier one stays as what was thought at the time.

**An observation is not promoted.** Where the thinking it records stabilizes into a binding convention, the rule is written in `slasher/local/rules/` the way any rule is written. The observation is not changed by it. It takes no line naming the rule, and its state stays `Recorded`. It stays as written, as the discovery record.

**So the the-items-directory-holds-one-file-per-item rule needs no exception.** Every item carries a state from the moment it is written, and an observation does too. What is particular to an observation is that the state is fixed, not that it is absent.

## The shape

- **When to use:** the material is genuinely useful to keep but still under active discovery, or it is a method or definition the engineer has not ratified as a convention. When in doubt between a rule and an observation, prefer an observation — writing a rule later is cheap, retracting a premature rule is not.
- **Format:** the same frontmatter-free markdown as rules — a `# <title>`, a `**State:** Recorded` line, a `**Tags:**` line carrying `[observation]`, then the content in prose. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule) and ends `-RECORDED`.
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
- **Recording one:** add the file, and add a matching one-line entry to `slasher/local/logs/log/` noting it was recorded as an observation, and why it is not yet a rule.

**Why:** discovery produces valuable thinking before it is ready to be binding, and a place for non-binding hypotheses keeps that thinking without prematurely imposing it as a rule.

Giving an observation the **eight states every other item takes** was the cost of holding it in the same directory, and it bought nothing. Sixteen of this project's eighteen observations sat at `Open` and moved nowhere, because there was nowhere for them to move — a hypothesis that stabilizes becomes a rule somewhere else, and one that does not simply stands. `Open` said the thinking was unsettled and might settle, which is a promise the record never had to keep.

`Recorded` says what happened to an observation, and it stays true: the thinking was written down and kept. `RECORD (v)` is approved in the STE dictionary, meaning *to make notes of and keep data to use subsequently*, and it is used with that meaning. `state (v)` is not approved, and the STE dictionary gives TELL. The line still reads as a state, so a directory listing answers the same question for an observation that it answers for every other record, and the answer is that this one is an observation and observations do not move.

**How to apply:** record an in-progress hypothesis or unratified method here, tagged `[observation]`, with `**State:** Recorded` and a filename ending `-RECORDED`. Write no `**Why this state:**` line. Never change the state.

Write a later observation where the thinking moves, and leave the earlier one as written. Where a rule is written from the same thinking, leave the observation as written too.

## Compressed

Lines 1–6 below are the opening statements, which come before any section heading.

1. `slasher/local/items/` holds working hypotheses, definitions, and methods that are not yet binding.
2. They are rule-candidates surfaced during open-ended discovery, before the thinking has stabilized.
3. They are not read as binding at session start, the way rules are.
4. An observation lives in `slasher/local/items/`.
5. An observation is tagged `[observation]`.
6. The tag is what makes a record an observation.

## `Recorded` is an observation's only state, and it never changes

1. An observation carries `**State:** Recorded` from the moment it is written.
2. It keeps that state for the rest of its life.
3. Its filename ends `-RECORDED`.
4. It carries no `**Why this state:**` line.
5. An observation has no lifecycle.
6. It is never realized, abandoned, obsolete, superseded, or suspended.
7. An observation that no longer holds is not retracted.
8. A later observation states the later thinking.
9. The earlier observation stays as what was thought at the time.
10. An observation is not promoted.
11. Where the thinking stabilizes into a binding convention, write the rule in `slasher/local/rules/` the way any rule is written.
12. Do not change the observation. It takes no line naming the rule.
13. The the-items-directory-holds-one-file-per-item rule needs no exception, because an observation also carries a state from the moment it is written. Its state is fixed, not absent.

## The shape

1. **When to use:** use an observation for material worth keeping that is still under active discovery.
2. Also use one for a method or definition the engineer has not ratified as a convention.
3. When in doubt between a rule and an observation, prefer an observation.
4. **Format:** use the same frontmatter-free markdown as rules.
5. The file starts with a `# <title>`, then a `**State:** Recorded` line.
6. Next comes a `**Tags:**` line carrying `[observation]`, then the content in prose.
7. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
8. The filename ends `-RECORDED`.
9. **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
10. **Recording one:** add the file.
11. Add a matching one-line entry to `slasher/local/logs/log/`.
12. The entry notes that it was recorded as an observation, and why it is not yet a rule.
13. Never change an observation's state.
14. Where the thinking moves, write a later observation and leave the earlier one as written.

## Compression

- 2026-10-24, compressed: compression 0.34, change 0.56, solubility 22 → 61, clarity 0.22 → 0.70, 21 directives, 21 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-25, revised: points 11, 12, and 13 take the new wording, that a promoted observation names its result; not checked
- 2026-10-27, re-checked: 22 directives, 21 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 61 → 59, clarity 0.70 → 0.75; checked: 21 directives, 21 kept, 0 less precise, 0 lost
- 2026-10-28, revised: the one state is `Recorded`, not `Stated`, a term the engineer settled; not checked
- 2026-10-29, merge from master re-checked: 31 directives, 31 kept, 0 less precise, 0 lost, 0 repairs
- 2026-10-30, revised: lapsed is renamed obsolete; checked: 27 directives, 27 kept, 0 less precise, 0 lost
- 2026-11-06, revised: promotion removed; checked: 22 directives, 20 kept, 1 less precise, 1 lost, 0 repairs. Left as they are: the less precise one lacks only the reason the observation stays as written, that it is the discovery record, and the lost one is the STE meaning of `RECORD (v)`, a reason for the state's word. The compressed text carries no reasons

## History

Until Fri Nov 6 2026 an observation could be promoted to a rule. The rule was written naming the observation, the observation took a `**Promoted to:** the <name> rule` line under its `**Tags:**` line, and a log entry recorded the promotion. `/observation promote` and `/observe promote` carried the act.

Until Fri Oct 30 2026 the state word Obsolete was Lapsed.

Until 2026-10-25 the Promotion step said to "note the promotion in the two files", the rule and the observation, while the same step said to leave the observation as written and the body said nothing about the observation changes when the rule appears. The engineer settled that the rule is the observation's result, and that the observation names it in one added line.

Until Sun Oct 25 2026 this rule was named observations-convention and titled "An observation is `Stated` — a working hypothesis, not yet binding, whose one state never changes".

Until 2026-10-28 an observation's one state was `Stated`, and its filename ended `-STATED`. The engineer settled `Recorded`, a word the STE dictionary approves with the meaning the state needs.

Until Thu Oct 29 2026 this rule was named an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes, after the state it then named.

Related:

- the the-items-directory-holds-one-file-per-item rule — the eight states an observation does not take, and the state requirement it satisfies
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — where a rule goes
- the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule — the `-RECORDED` filename suffix
- the the-log-holds-one-file-per-entry-with-a-one-line-title rule — the entry that records one

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
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:23:16 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Wed Oct 28 2026 at 5:26:52 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 2:22:19 PM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:48:29 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:45:17 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:47:18 PM PT
