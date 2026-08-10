# The Design By Efferent vocabulary: use these terms with these meanings

The lexicon of **Design By Efferent** (DBE) — use this vocabulary, with these meanings, in code, tests, rules, designs, commits, and prose. This is the canonical glossary; the deeper docs defer to it.

**Every word here is one of three things**, and this holds for the terms below and for the **Say**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning.
- **Reserved** by Waytide as a technical noun or a technical verb, under STE Rules 1.5 through 1.13
  in category 19, Computer science, information and communication technology. This is the case for
  a word this project coined, and for a word the STE dictionary disputes. STE Rule 1.8 requires a
  technical noun to be approved in the subject field, and this file is that approval.
- **Approved with a meaning Waytide does not use**, which STE Rule 1.3 forbids.

**A word with no STE note is absent from the STE dictionary and is reserved.** See the `language`
package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

## The one-liner

> The AI **generates** straight through, and **waits** at the **hinges** — the **subtle**, **load-bearing** decisions — for the human to **deliberate**; everything else is **mechanical**.

## Terms

| Term | Role | Meaning |
|---|---|---|
| **Design By Efferent** / **DBE** | the methodology | The name of the whole approach these rules, this lexicon, and the loop describe. A **design** discipline (tests drive design, not "development"), driven **by the efferent** — the use-site view. A variant *of* TDD (tests are the vehicle); the name foregrounds what makes it distinct: design originated from the efferent reference. |
| **loop** | the cycle | The DBE cycle — a *distributed* OODA loop (Boyd): the AI **observes** and **acts** (mechanized), the human **orients** and **decides** at the gates. Orientation — design judgment — is the irreplaceable phase, kept with the human. (See "The loop, as a distributed OODA cycle".) **STE: approved with a meaning Waytide does not use.** `LOOP (n)` is *a circular shape made in a flexible material*. STE Rule 1.3 forbids the other meaning. |
| **cycle** | the unit of the loop | **One traversal of the loop**: a hinge surfaced, decided, and acted on. It is the unit a loop record is written in — one section per cycle, carrying that cycle's hinge, the options put at the gate, and the decision. See "cycle is scoped by what precedes it". |
| **hinge** | the object | A decision the design turns on — one that is **subtle** *and* **load-bearing**. Where the human's judgment belongs. **STE: absent as a noun.** The STE dictionary lists `hinge (v)` and gives TURN for it. Waytide does not use the verb. |
| **attended** / **unattended** | the human's level of participation | Whether the loop **stops** at each hinge for the engineer (attended, the default) or the agent decides each hinge and generates through (unattended). Chosen at a feature's or experiment's start and held for its duration. **DBE is in effect either way** — the cradle, the efferent-first actuation, and the solubility standard hold in both; only the stopping changes. A batch-size trade: attention spent continuously against rework paid at the end. |
| **gate** | the mechanism | Where the loop stops and hands a hinge to the human. The interrupt/handoff. The loop *waits* at a gate; `gate` is a noun and never a verb. |
| **deliberation** | the human's act | What the human does at a gate: weighs the hinge and decides. *Deliberate* = carefully weighed **and** intentional — the opposite of the AI's averaging. |
| **mechanical** / **mechanics** | the complement | Everything that isn't a hinge — the AI generates it straight through. **STE: approved with a meaning Waytide does not use.** `MECHANICAL (adj)` is *related to or operated with a mechanism*. STE Rule 1.3 forbids the other meaning. |
| **subtle** (vs **crude**) | first mark of a hinge | The choice takes design judgment that isn't written in the code or tests — it lives in the person. Crude = a tool/pattern/answer you can read off the artifacts. (Per Bellware's subtle/crude-knowledge distinction: https://madabout.software/articles/subtle-knowledge-crude-knowledge/) |
| **cradle** | the constraint | The efferent test, held during generation — it holds the implementation in position without gripping it rigid, steering toward solubility. |
| **efferent** | the perspective | The use-site view; designing a unit from the outside in (see the `language` vocabulary — the efferent term). DBE is the method built on designing from this view: the test is the first efferent reference, the interface designed from the efferent side. |
| **actuation** | the act | The invocation of the unit under test — the first efferent reference (see the `language` vocabulary — the actuation term). In DBE it is written before any implementation, forcing the interface outside-in, and is the first and highest-leverage gate. **STE: not approved. The STE dictionary gives OPERATION.** |
| **observation** | the act of reading the outcome | What the test observes about the outcome of the actuation. An **assertion** is the mechanism by which an observation is implemented, not the thing itself. |
| **load-bearing** | second mark of a hinge | Other work rests on the choice, so a wrong one spreads and sticks: cheap to fix now, costly later. |
| **solubility** | the quality | The general design-quality term (see the `language` package's solubility rule): how readily a unit dissolves into use. In DBE it is the target of generation and a known hinge — what the efferent view discovers. |
| **mean-bias** | the AI's failure mode | The AI's pull toward the average of the code it has seen — most of which is poorly designed. It acts on the human too: a single AI proposal put up for approval drags the human's judgment down toward that average. |
| **origination** | the human's contribution | The human producing a choice rather than ratifying one. The above-the-average answer is originated, not selected — which is what the gates exist to provoke. |

## The two results the gates rest on

Every gate's form — options plus a mandatory escape — follows from two results, and the rules refer to them by these names:

**Provoke origination, not mean-bias.** A single proposal put up for approval ("here's my actuation — approve?") puts the human in judge mode, downstream of the AI's mean-drawn answer. Judging is not originating: the human ratifies, and their judgment is pulled toward the average rather than exercised above it. Offering several genuine alternatives keeps the human comparing real candidates — originating — instead of ratifying. So a gate presents alternatives, never a fait accompli.

**The best options are ones the AI can't produce.** The option set is the AI's own, drawn from the average. The best answer is often one only the human can produce, and a closed list tempts the human to pick from it instead of producing their own. So every gate keeps an escape open — the human dictating outright, or a chat to work the answer out. The escape is mandatory, at every gate, without exception: it is what keeps the human above the AI's mean when the right answer isn't on the list.

The first result says *why there are options*. The second says *why the options are never enough*.

## "Cycle" is scoped by what precedes it

The word names three nested things, and **the word before it says which**. This is deliberate,
and it is the one place this vocabulary lets a term carry more than one meaning:

- **a cycle** — one traversal of the loop: a hinge surfaced, decided, acted on. The unit a
  loop record is written in.
- **the hinge cycle** — the five hinges in order, actuation through naming, for one outcome's
  initial implementation (see the hinge-cycle rule). A hinge cycle is five cycles.
- **the DBE cycle** — the loop itself, the whole distributed OODA cycle. Interchangeable with
  **the loop**, which is the preferred term for it.

**Bare "cycle" is always the smallest of the three.** The larger two are never written without
their qualifier, so an unqualified cycle is one traversal and nothing else.

**Why one word rather than three.** The three are the same shape at different scales — a
traversal, a sequence of traversals for one outcome, and the whole. Naming them with unrelated
words would hide that they nest; the qualifier carries the scale at the cost of a word. The
alternative considered was to reserve "cycle" for the traversal and rename the other two, which
is more edits for a distinction the qualifier already draws.

## "Load-bearing", explained

The two marks of a hinge — **subtle** and **load-bearing** — are independent, and a hinge needs **both**. "Subtle" is about *who can make the call* (the judgment lives in the person vs. it can be read off the artifacts). "Load-bearing" is about *what depends on the call*.

**The metaphor is literal, not decorative.** In a building, a *load-bearing* wall carries the weight of the structure above it; a *partition* wall just divides a room. You can move a partition wall freely. Move or misplace a load-bearing wall and everything resting on it shifts or collapses — and the later you do it, the more has been built on top, the more it costs.

**Applied to a decision:** a choice is load-bearing when **other work rests on it** — later code, the tests, and other decisions all assume it. So a wrong load-bearing choice has two properties:

- It **spreads** — everything built on it inherits the mistake.
- It **sticks** — once things rest on it, undoing it means undoing them too.

Together these give the **asymmetry that justifies the gate**: a load-bearing choice is **cheap to fix now** (before anything rests on it) and **costly to fix later** (after). The human's judgment has the most leverage *before* the weight is added — which is exactly why the loop waits there and not afterward.

**How to recognize it:** ask *if this choice is wrong, how far does the damage spread, and how expensive is it to reverse once we've built on it?* Wide spread + expensive reversal → load-bearing. Local + cheap to change → not.

**Why both marks are required:**

- Load-bearing **but crude** (the right answer is readable off the code/tests/patterns) → the AI can make it; no gate needed, even though much rests on it.
- Subtle **but not load-bearing** (takes judgment, but the choice is local and cheaply changed) → not worth stopping the human; a wait there is ceremony.
- **Subtle *and* load-bearing** → a hinge. Gate it.

**Example:** the **actuation** — the efferent shape of the invocation — is load-bearing: the test, the observations, and the implementation all rest on it, so a wrong shape spreads into all of them and gets costly to change once code depends on it (which is why it is the first and highest-leverage gate). By contrast, the wording of a `comment` line is not load-bearing — nothing rests on it, and it is changed in seconds.

## The loop, as a distributed OODA cycle

"The loop" — the DBE cycle — is a **distributed OODA loop** (John Boyd: **O**bserve, **O**rient, **D**ecide, **A**ct). Boyd's loop is one mind's decision cycle; here the four phases are **split across two agents**, and the split is the whole point.

| OODA phase | Owner | In the loop |
|---|---|---|
| **Observe** | AI | surfaces the state — the proposed actuation, the candidate options, the test, the run result |
| **Orient** | **human** | **deliberates** — weighs the hinge against design judgment (the standard of solubility, subtle knowledge, experience) |
| **Decide** | **human** | chooses at the **gate** — selects an option, dictates, or accepts |
| **Act** | AI | **generates** within the cradle |

**Orient is the load-bearing phase — which is why the human owns it.** Boyd held that Orient dominates the loop: it shapes what you observe, what you decide, and how you act. This method's thesis is identical — the human's **orientation** (design judgment) is the irreplaceable locus, while Observe and Act are mechanized to the AI. The AI's failure mode, "regressing to the average," is a **degraded orientation**: oriented to the mean of all code rather than the well-designed subset. The loop exists to route through the human's orientation at the moments it bears weight — the hinges.

**Implicit guidance = mechanical.** Boyd's loop has a fast path — *implicit guidance and control* — where action flows straight from orientation, bypassing explicit Decide. That is exactly **mechanical** generation: once orientation is settled (the cradle set, solubility clear), the AI generates straight through. The **gate** — an explicit Decide — fires only at a **hinge**.

**The four phase names are reserved, as nouns and as verbs.** `Observe`, `Orient`, `Decide`, and
`Act` are John Boyd's words, quoted rather than coined. Waytide writes the noun in capitals for the
phase and the verb in lower case for the act — *the AI observes and acts*. **Both forms are
reserved**, settled 2026-08-09.

**The STE dictionary lists all four as verbs and names a replacement for each** — MONITOR for
`observe`, POINT for `orient`, SELECT for `decide`, and for `act` the guidance to use an accurate
verb. None of the four nouns is in the STE dictionary. **Waytide keeps both forms**, because
replacing the verb would break the quotation and cost the reader Boyd's reference. See the
`language` package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

**What does not transfer.** OODA is best known for its *adversarial, tempo* use — cycle faster than an opponent, get "inside" their loop, collapse their orientation. There is no adversary in DBE; speed-as-weapon does not apply, and importing it would mislead. What transfers is the **structure** — the four phases and the primacy of Orient — not the **contest**.

## Substitutions

A word not to write, and the word to write instead. When the impulse is a word in the
**Don't say** column, write the **Say** term.

| Say | Don't say | What it names |
|---|---|---|
| **subtle** | "intrinsic" | the first mark of a hinge — the judgment lives in the person rather than in the artifacts |
| **load-bearing** | "asymmetric" | the second mark of a hinge — other work rests on the choice |
| **mechanical** | "non-hinge" | everything that is not a hinge, which the AI generates straight through |
| **cycle** | "pass" | one traversal of the loop — see "Cycle is scoped by what precedes it" |
| **unattended** | "suspending DBE" | the human's level of participation, where the agent decides each hinge. The method is never suspended. Only the waits are |
| **wait** | "gate", as a verb | what the loop does at a hinge. `gate` is the noun for the mechanism and takes no verb form |
| **the human's level of participation** | "gating cadence" | whether the human is in the loop. Attended is in the loop, and unattended is out of it. Attended and unattended cause a cadence and are not one. **STE: `level` is approved with a meaning Waytide does not use.** `LEVEL (n)` is *a horizontal line, plane, surface, or condition*. Waytide's sense is degree, which STE Rule 1.3 forbids, so `level` is reserved |

## Discontinued terms (do not use)

A word removed from use with nothing in its place. **This is not a substitution.** A substitution
names two words. A discontinuation names one, because the concept went rather than the name.

- **discriminator** — there is no test-noun. The test is just "is this a hinge?"
- **capability-independent** — state it plainly. Subtlety is about the design, not the model.

**Why:** The terminology is the conveyable output of this work — it is how the approach is taught to other engineers. Scattering it across observations and a digest left no authoritative source and risked drift; one binding glossary keeps usage consistent and avoids the overloaded or academic words this method rejects (e.g. discriminator, intrinsic, "given", "non-hinge"). Each term was chosen for solubility: plain, positive where possible, and free of programming collisions. Two competing "the name" declarations would drift, so DBE is the single canonical name.

**How to apply:** Use these words, with these meanings, wherever you write about DBE. Prefer them over synonyms; do not reintroduce a discontinued term. Related: the DBE-as-design-tool, first-turn, human-in-the-loop, hinge-cycle, and "TDD designs, coverage prevents" rules; the `language` package's solubility rule and its name-literally standard.

---

Authored by Scott Bellware on Thu Jul 16 2026 at 8 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 12:22:15 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 1:35:10 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 4:53:01 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:59:35 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
