# Loop record — Bullet list answers

The design of a rule requiring bullet-list answers, run as an experiment on
`experiment/bullet-list-answers`. Its question, forecast, and state are in the experiment record
of the same name; this record carries the cycles.

**Mode: attended.** The loop stops at every hinge.

## Cycle 1 — the experiment's question

- **Hinge:** what the experiment tests. Three readings were available: whether bullet lists read
  better, whether they should be **required**, and what the form costs when an answer carries
  dependent reasoning.
- **Options:** the three above, put through the selection interface.
- **Decision / chat:** the developer chose **whether bullet lists should be the required form for
  agent answers**. That makes the outcome a rule rather than a preference, and moves the difficulty
  from the benefit to the exceptions.

## Cycle 2 — how the work is conducted

- **Hinge:** the working location and the gating cadence, both settled at initiation and held for
  the experiment's duration.
- **Options:** branch only, branch and worktree, each attended. The current-branch option was named
  and marked unavailable — an experiment is a controlled deviation that must stay reversible until
  affirmed, so its branch is not optional.
- **Decision / chat:** **branch only, attended.**

## Cycle 3 — which package the rule belongs to

- **Hinge:** where the rule lives, which decides who it binds. A local rule here binds one project;
  a `language` rule binds every project that installs the package.
- **Options:** none put — the forecast named `language` and the developer confirmed it directly.
  Recorded as an accepted proposal rather than a gate with alternatives.
- **Decision / chat:** **`language`**, beside `communicate-plainly-name-the-thing`, which already
  governs how the agent addresses the developer rather than only what goes into the code. This
  settles forecast item 5 before the work rather than after it.

## Cycle 4 — the requirement's shape

- **Hinge:** what the rule requires of an answer. Three shapes: an answer *is* a list with prose
  excepted; an answer *leads* with a list and prose follows where it earns a place; or prose must
  **justify itself** against conditions the rule names.
- **Options:** the three above.
- **Decision / chat:** **prose must justify itself, and the rule names what justifies it.** This
  inverts the burden without banning prose, and makes the conditions the rule's substance rather
  than its escape hatch.

## Cycle 5 — which conditions justify prose

- **Hinge:** the conditions themselves, the rule now resting on them. Candidates were dependent
  reasoning, brevity, and an explanation asked for outright.
- **Options:** three sets — the two strongest, dependent reasoning alone, and all three.
- **Decision / chat:** the developer took `Explain`, and the explanation refuted two of the three
  candidates against this session's own answers. **An explanation asked for is not a justification**
  — every explanation requested outright today was answered in bullets and none drew a correction.
  **Dependent reasoning is not one either**, and the reason is the finding of this cycle: the
  problem is not prose against lists, it is that an *unordered* list asserts its items are parallel.
  A **numbered list asserts sequence**, so dependent reasoning is served by ordering the list rather
  than by leaving the form. The developer settled it there: **ordered lists carry dependent
  reasoning, and brevity is the only remaining prose justification.**

## Cycle 6 — how the expansion offer is given

- **Hinge:** the developer added a second element — after a list answer, the developer is given the
  option of an expanded one. How that option is offered is not obvious, and the mechanisms differ in
  what they cost per turn.
- **Options:** a standing affordance stated once in the rule and never repeated; a selection prompt
  after each list answer; a one-line offer appended to the answer.
- **Decision / chat:** **a one-line offer appended to the answer.** The selection prompt was
  declined as furniture — a prompt where no decision is pending, doubling the turns. The standing
  affordance was declined as invisible. The tension worth recording: an appended line resembles the
  trailing offered-next-topic the developer has corrected before, and is distinguished from it by
  being about the answer just given rather than about what to do next.

## Cycle 7 — the line's wording and when it appears

- **Hinge:** two decisions taken together, since the wording only matters if the line appears.
- **Options:** three wordings — naming the act plainly, an impersonal availability notice, and one
  putting the agent in the sentence; and three timings — every list answer, only where an expansion
  would add something, and every list above some length.
- **Decision / chat:** **`Ask and I will expand any of these.`**, appearing **only where an
  expansion would add something.** The timing rests on the agent judging its own answer, which is
  the faculty this experiment exists because of — recorded here as the choice's known weakness
  rather than discovered later.

## Cycle 8 — the line's wording, revised

- **Hinge:** the wording settled in cycle 7 was `Ask and I will expand any of these.` The developer
  read it in the rule as written and replaced it.
- **Options:** none put. The developer supplied the wording directly, which is the origination
  escape rather than a choice among candidates the agent produced — the case the gates exist for.
- **Decision / chat:** the line is **`For more detail, ask for an expanded answer.`** It differs
  from the superseded wording in two ways worth recording. It **names what is on offer** — more
  detail — where the earlier line named only the act. And it **drops the agent from the sentence**:
  *I will expand* put the agent in an offer that is about the answer, and none of the three
  candidates put in cycle 7 avoided that as plainly as this does. Cycle 7's decision stands as the
  record of what was chosen then; this supersedes it.

---

Authored by Scott Bellware on Fri Aug 7 2026 at 12:36:25 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:02:20 PM PT
