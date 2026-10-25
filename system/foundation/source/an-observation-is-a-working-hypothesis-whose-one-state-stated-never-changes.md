# An observation is a working hypothesis whose one state, Stated, never changes

`waytide/local/items/` holds working hypotheses, definitions, and methods that are **not yet binding**. They are rule-candidates surfaced during open-ended discovery, before the thinking has stabilized enough to canonize. They are *not* read as binding at session start the way rules are. They record in-progress understanding.

**An observation lives in `waytide/local/items/` and is tagged `[observation]`.** The tag is what makes a record an observation.

## `Stated` is an observation's only state, and it never changes

**As the engineer stated it:** observations don't need a state, they don't have a lifecycle, they are just stated — and the state could be `Stated`.

**An observation carries `**State:** Stated` from the moment it is written**, and it carries that word for the rest of its life. Its filename ends `-STATED`.

**It carries no `**Why this state:**` line.** That line said how settled the thinking was and what would promote it. Where a record has one state and cannot leave it, there is nothing to account for.

**An observation has no lifecycle**, which is what one unchanging state says. It is never realized, abandoned, lapsed, superseded, or suspended. Those words belong to a record that was going somewhere, and an observation is not going anywhere — it was thought, and it was written down, and neither of those is a stage.

**An observation that no longer holds is not retracted.** A later observation states the later thinking, and the earlier one stays as what was thought at the time.

**Promotion is not a state change either.** When an observation stabilizes into a binding convention, the rule is written in `waytide/local/rules/`, and that rule is the observation's result. The observation takes one added line naming it, `**Promoted to:** the <name> rule`, under its `**Tags:**` line. Nothing else about the observation changes: what it says stays as written, as the discovery record, and its state stays `Stated`.

**So the the-items-directory-holds-the-projects-items-one-file-per-item needs no exception.** Every item carries a state from the moment it is written, and an observation does too. What is particular to an observation is that the state is fixed, not that it is absent.

## The shape

- **When to use:** the material is genuinely useful to keep but still under active discovery, or it is a method or definition the engineer has not ratified as a convention. When in doubt between a rule and an observation, prefer an observation — promoting later is cheap, retracting a premature rule is not.
- **Format:** the same frontmatter-free markdown as rules — a `# <title>`, a `**State:** Stated` line, a `**Tags:**` line carrying `[observation]`, then the content in prose. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule) and ends `-STATED`.
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
- **Promotion:** write the rule in `waytide/local/rules/`, naming the observation it came from. Add the `**Promoted to:**` line to the observation, and add a `waytide/local/logs/log/` entry for the promotion. Leave the rest of the observation as written.
- **Recording one:** add the file, and add a matching one-line entry to `waytide/local/logs/log/` noting it was recorded as an observation, and why it is not yet a rule.

**Why:** discovery produces valuable thinking before it is ready to be binding, and a place for non-binding hypotheses keeps that thinking without prematurely imposing it as a rule.

Giving an observation the **eight states every other item takes** was the cost of holding it in the same directory, and it bought nothing. Sixteen of this project's eighteen observations sat at `Open` and moved nowhere, because there was nowhere for them to move — a hypothesis that stabilizes becomes a rule somewhere else, and one that does not simply stands. `Open` said the thinking was unsettled and might settle, which is a promise the record never had to keep.

`Stated` says what is true and stays true. The line still reads as a state, so a directory listing answers the same question for an observation that it answers for every other record, and the answer is that this one is an observation and observations do not move.

**How to apply:** record an in-progress hypothesis or unratified method here, tagged `[observation]`, with `**State:** Stated` and a filename ending `-STATED`. Write no `**Why this state:**` line. Never change the state.

Write a later observation where the thinking moves, and leave the earlier one as written. Promote it by writing the rule elsewhere, and add to the observation only the line naming that rule.

## Compressed

Lines 1–6 below are the opening statements, which come before any section heading.

1. `waytide/local/items/` holds working hypotheses, definitions, and methods that are not yet binding.
2. They are rule-candidates surfaced during open-ended discovery, before the thinking has stabilized.
3. They are not read as binding at session start, the way rules are.
4. An observation lives in `waytide/local/items/`.
5. An observation is tagged `[observation]`.
6. The tag is what makes a record an observation.

## `Stated` is an observation's only state, and it never changes

1. An observation carries `**State:** Stated` from the moment it is written.
2. It keeps that state for the rest of its life.
3. Its filename ends `-STATED`.
4. It carries no `**Why this state:**` line.
5. An observation has no lifecycle.
6. It is never realized, abandoned, lapsed, superseded, or suspended.
7. An observation that no longer holds is not retracted.
8. A later observation states the later thinking.
9. The earlier observation stays as what was thought at the time.
10. Promotion is not a state change.
11. When an observation stabilizes into a binding convention, write the rule in `waytide/local/rules/`.
12. When the rule is written, the observation takes one added line naming it, `**Promoted to:** the <name> rule`, its result. Everything else stays as it is, as the discovery record.
13. The the-items-directory-holds-the-projects-items-one-file-per-item needs no exception, because an observation also carries a state from the moment it is written. Its state is fixed, not absent.

## The shape

1. **When to use:** use an observation for material worth keeping that is still under active discovery.
2. Also use one for a method or definition the engineer has not ratified as a convention.
3. When in doubt between a rule and an observation, prefer an observation.
4. **Format:** use the same frontmatter-free markdown as rules.
5. The file starts with a `# <title>`, then a `**State:** Stated` line.
6. Next comes a `**Tags:**` line carrying `[observation]`, then the content in prose.
7. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
8. The filename ends `-STATED`.
9. **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact.
10. **Promotion:** write the rule in `waytide/local/rules/`.
11. Name the observation in the rule, and add the `**Promoted to:**` line to the observation.
12. Add a `waytide/local/logs/log/` entry for the promotion.
13. Leave the rest of the observation as written.
14. **Recording one:** add the file.
15. Add a matching one-line entry to `waytide/local/logs/log/`.
16. The entry notes that it was recorded as an observation, and why it is not yet a rule.
17. Never change an observation's state.
18. Where the thinking moves, write a later observation and leave the earlier one as written.
19. **Why:** discovery produces valuable thinking before it is ready to bind. A place for non-binding hypotheses keeps that thinking without imposing it early as a rule.

## History

Until 2026-10-25 the Promotion step said to "note the promotion in the two files", the rule and the observation, while the same step said to leave the observation as written and the body said nothing about the observation changes when the rule appears. The engineer settled that the rule is the observation's result, and that the observation names it in one added line.

Until Sun Oct 25 2026 this rule was named observations-convention and titled "An observation is `Stated` — a working hypothesis, not yet binding, whose one state never changes".

Related:

- the the-items-directory-holds-the-projects-items-one-file-per-item — the eight states an observation does not take, and the state requirement it satisfies
- the rules-convention — where a promoted observation's rule goes
- the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule — the `-STATED` filename suffix
- the the-log-holds-one-file-per-decision-with-a-one-line-title — the entry that records one

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
