# Work Session — The website leaves and the system turns on itself (Tue Aug 4 2026 00:05)

Continues `2026-08-03T05-59-57Z-the-example-project-changes-hands.md`, which closed on the website not being an interactive chat. This stretch began by answering the question that record named as blocking — what the self-explanation is produced *from* — and the answer freed everything after it. The source is a **projection**, which made the website a producible artifact rather than a written one, which made it a project of its own, which took the material out of this repository. With the website gone, the work turned inward on the composite's own naming and structure: the work-session term, the plan document's shape, two missing vocabularies, and finally a whole package dissolving into `foundation`.

*This is the communicable record — the guided tour. It is not the source of truth. The durable records are the designs under `local/design/`, the migration records under `local/migration/`, the observations under `local/observations/`, the decision log under `local/log/`, and the rules under `system/`.*

## 1. The source is a projection

The previous record left the self-explanation design unplannable for one reason: **what the chat draws on, what the website is generated from, whether a written corpus exists, and how the site is produced were one question wearing four hats.**

It was answered in one word. **The source is a projection** — derived rather than authored, regenerable rather than maintained.

**Two candidates were rejected, each for its own reason:**

- **The rules alone.** They are written to *govern*, not to *introduce*. A reader meeting Waytide for the first time is not the reader a rule is addressed to.
- **A written corpus.** It is exactly the artifact that drifts — and the argument was not hypothetical. **This repository's own package READMEs have drifted three times.**

A projection cannot drift, because nothing maintains it. That is the whole of the argument.

**And the two constraints already settled for the `constant` replay were promoted to every projected surface**: a projection **must not present as something it is not**, and **records are not back-edited to suit it**. They had been stated about one replay; they are properties of projection.

## 2. The scroll has two sides

The home page's shape settled. **The scroll has two vertical sides**: the chat on the left, and on the right **the artifacts created as the chat progresses** — each an expandable summary, clickable to open the record in full.

**Why the right side is the substance and not decoration.** The system's central claim is that working this way **accumulates a record**. Prose can assert accumulation; a reader watching a log entry appear beside the exchange that produced it **sees when each one is written**. The claim becomes visible rather than argued.

Then it was widened: the right pane shows **what the agent touched in both directions** — the **sources consulted** for any request as well as the artifacts created by the work. Every answer on the left has its provenance beside it.

**That makes visible something the rules already require.** The report rules say a report is **re-derived from current files rather than recalled**. Showing the sources is the structural answer to the reader asking whether the system's answers are grounded or invented.

## 3. The website becomes its own project, and the material leaves

A new project was initialized at `/Users/sbellware/projects/waytide/website`, all eight packages installed, and **the move was planned in `local/migration/` — the migration convention's first use**, written days after the convention itself.

**The split was the one decision the plan could not make on its own**, and it settled on neither of the two readings the plan offered. The composite keeps **only the reasoning** — premise, motivation, vocabulary. Everything describing **how** the explanation is produced, constrained, and presented went to the destination.

**The line the developer drew was why against how.** The composite says *that* Waytide explains itself and why it must; the destination is responsible for producing it repeatably, so the mechanism goes with the responsibility.

**The cost was stated rather than hidden:** what remains here is thin — a premise, a motivation, a vocabulary, and three settled resolutions. **All twenty of the design's deferred questions moved.** The alternative, moving it whole and leaving a stub, was declined on the ground that a design should not be torn in half; the remainder is close enough to a stub that the distinction is smaller in practice than in the abstract. That was surfaced before the reduction ran.

**The reconciliation found an artifact the plan had not named** — the developer-chooses observation, which cited the moved material twice. **And one reference was deliberately left standing**: the suspended Upload design refers to the moved design four times and was *not* corrected, because the suspended convention's whole claim is that a suspended thing comes back **as it was**. Editing its body would defeat that. The consequence is recorded rather than fixed.

## 4. Human-Agent Relations

The tagline settled through several turns — *harness*, then *engineer ally*, then *human ally*, then **"Waytide: Human-Agent Relations"** as the category line beside the claim line.

**It alludes to C-3PO's self-introduction**, and that raised a rule question: does name-literally-not-by-analogy reject it?

**No, and the reason is a distinction the rule does not currently draw.** The rule's rejected example, *"the menu problem"*, is **unintelligible until decoded** — the mapping is the whole content. *Human-Agent Relations* means the right thing to a reader who has never seen the film. **The distinguishing property is whether the literal reading stands alone**, not whether a name alludes.

**Recorded as an observation rather than a rule**, deliberately. A stated permission would be used to license names whose literal reading is thin and whose real content is the reference — and the test is applied by the person choosing their own name, which is the position in which people judge worst.

## 5. A commit that swept in another session's work

`git add -A` swept a concurrent session's work into commit `d67484f`, whose subject names an unrelated change. **The commit stands rather than being rewritten**, and a log entry is the pointer a reader scanning the log would otherwise not find.

## 6. "Work session," always

Three passes, each wider than the last:

1. **The recording prompt** always says *work session record*, never *session record*.
2. **The rules throughout** — 25 uses conformed across six foundation files. The prompt had been corrected while the rule's own body used the short form fifteen times.
3. **The record's title format** — `# Work Session — <name> (<date>)`.

**The ten records written before 2026-08-03 keep their `# Session —` titles.** A record states what it stated when it was written; retitling it would edit a historical record to suit a later convention.

## 7. The plan document's shape is opened up

A sequence of corrections, each narrower in scope and each fixing a different kind of defect:

- **Commit policy and Tech Stack were removed.** The first restated the `git` package's conventions in a second place that had to be kept true; the second answered *per plan* a question a project answers once.
- **"Supersedes" became "Superseded plans."** My first diagnosis was wrong — I proposed replacing the word. The developer pointed out that **supersede states authority**: a superseded plan is not merely earlier, it no longer governs. **The failure was grammatical, not lexical** — a bare verb with subject and object absent, where every sibling heading is a noun.
- **The element list stopped being closed.** It had read *"The sections, in order."* A plan carries whatever elements of planning the work has. **The order is settled; the set is not.**
- **Goals and Source designs became plural**, and **Work sequences** was added — the orders in which the work can be done, where the plan has more than the single front-to-back reading its task list implies.

**One thing I got wrong along the way and should not repeat:** I argued against "work plan" on the ground that the artifact already carried its qualifier. It does — *implementation* — and that qualifier is too narrow, which was the developer's point and not a counter to it.

## 8. Two vocabularies, and an instruction that promised too much

**Five of eight packages had no `vocabulary.md`** while the read instruction spoke of *"each package's `vocabulary.md`"* as though every package had one.

**The question asked was the right one:** *if we add the missing vocabulary files, will they have content?* Answered by survey rather than by writing them:

| Package | Verdict |
|---|---|
| `foundation` | **substantial** — its terms are the ones every package and project uses |
| `versioning` | **one term** — product generation |
| `code/ruby` | one or two at most, heavily borrowed; not examined closely |
| `git` | nothing — no term departs from ordinary git usage |
| `plan` | nothing — its terms are section names defined at their point of use |

**Foundation's vocabulary states deferred, suspended, and out of scope beside each other for the first time.** They are the terms most easily confused, and they were confused because they lived in three separate conventions and nowhere together. **Deferred is *not yet*, suspended is *no longer*, out of scope is *not here*.**

**The instruction was corrected rather than the gap filled.** Writing five files to make a sentence true would have produced exactly the anemic artifact the system argues against. Five sites now say the file is written **where a package has terms**, not to complete a set.

## 9. The plan package dissolves

The session's largest structural change, and it came from a question rather than a plan: *could the plan package's content belong in foundation?*

**The examination found a cycle.** `foundation` cited the `plan` package twice for the document shape of artifacts `foundation` itself defines — and every rule in `plan` was addressed to `waytide/local/plans/` or `waytide/local/design/`, directories only `foundation` creates. **Nothing else depended on it.** A base package and a leaf depending on each other is a boundary drawn in the wrong place.

**And it found a defect that stood regardless of the outcome.** `plan` declared itself standalone. By the criterion the system itself states — a citation is a dependency where the citing rule **will not work** without the cited package — that declaration was false. **The citation observation had surveyed `plan` and passed it**, concluding *"no declaration currently in the system is wrong."* It is corrected: the survey checked whether a reference was *merely* naming, and never checked whether the referring rule had anything to govern without its referent.

**Three options were weighed; the merge won because the other two were the merge done partway.** Renaming to `work-plan` after unbundling design moves two of four rules into `foundation`. Flipping the citation preserves a boundary whose only justification is that it already exists.

**The whole thing ran end to end in one sitting**, planned in a migration record: four rules moved unrenamed, the package README deleted, the delegation removed from two conventions, `foundation`'s README absorbing the four, `plan` dropped from the project README and `install-all.sh` — and `versioning`, missing from all four of those places since it was created, added in the same pass.

**The repository was archived rather than deleted**, its description rewritten first, since an archived repository is read-only. It now tells a reader who lands there where the content went.

## 10. The consuming projects follow

Each of the three projects holding it dropped `waytide/system/plan/` and refreshed, so the same four rules returned under `waytide/system/foundation/`. Each carried its own decision-log entry and was pushed. The refresh brought `design-by-efferent`, `language`, and `versioning` forward too — more than this migration required.

**The between-state the migration record had planned for never opened.** It described a window in which a project held both copies; increments 7 and 8 ran in the same sitting. The paragraph is kept and marked rather than deleted, because it describes what the plan prepared for.

**And writing this record found one more piece of debris the fold left**: the work-sessions convention's own reasoning cited the `plan` package to explain why the format lives in `foundation`. Corrected — the distinction it drew no longer decides where a format lives, but it is still why a work session record is not shaped like a plan.

## Takeaways

- **One answer unblocked everything downstream.** The source question had four faces and was answered in one word. Naming the source a **projection** decided the website's producibility, its honesty constraints, and — because a producible artifact needs a project to produce it — that the website should leave this repository.
- **A structural question is worth asking before a naming question.** The session opened on whether to rename the `plan` package and ended by dissolving it. The rename would have made an inaccurate name slightly less inaccurate; the examination found a dependency cycle and a false declaration underneath it.
- **The system's own criteria caught the system's own error.** `a-citation-is-not-a-dependency` was written in this repository, and the observation that established it had applied it wrongly to `plan`. The rule was right and its first survey was not.
- **A promise in an instruction is a claim that has to stay true.** Five of eight packages lacked a `vocabulary.md` while five separate places said each package had one. The fix was to correct the claim, not to manufacture the artifacts.
- **Three corrections this session were to my own diagnoses**, not to the artifacts: proposing to replace "supersede" when the defect was grammatical, arguing against "work plan" on a ground that was the developer's own point, and giving a "no" on the package rename that rested on design being the plan package's province when `foundation` already owned it.

## Glossary

- **projection** — a derived artifact that reads a record without destroying it; regenerated rather than maintained, which is why it cannot drift. Now `foundation` vocabulary.
- **product generation** — the leading segment of a four-segment version. A product-management declaration, not a compatibility claim, and not computable from a diff.
- **recognizable-content line** — a bold label, a colon, and a value, optionally as a list item. The system's one protocol for content read mechanically as well as by a person.
- **working-state artifact** — a file holding the project's own work rather than an installed rule; the class that carries the ISO-8601-UTC filename prefix and the provenance footer.
- **Work sequences** — a plan element: the orders in which the work can be done, where the plan has more than the single front-to-back reading its task list implies.

## Where the durable records live

- **The fold** — `local/migration/2026-08-04T06-40-35Z-the-plan-package-is-folded-into-foundation.md`, every increment done, including the two in repositories this plan does not reach.
- **The website move** — `local/migration/2026-08-03T06-35-01Z-the-website-content-moves-to-its-own-project.md`.
- **New rules** — the four former `plan` rules now in `system/foundation/`, plus `system/foundation/vocabulary.md` and `system/versioning/vocabulary.md`.
- **Corrected observations** — the citation observation, whose `plan` row is dropped and whose conclusion is corrected; the planning-spans-three-artifacts observation, one of whose two questions this session settles.
- **New observation** — `2026-08-03T06-58-04Z-an-optional-allusion-passes-the-name-literally-test.md`.
- **The decision log** — thirty-three entries from `2026-08-03T06-20-00Z` onward.
- **The deferred queue** — empty.

## A closing note

**Two of this session's three structural changes were prompted by a question rather than a task** — *will the missing vocabulary files have content?* and *could the plan package's content belong in foundation?* Both were asked in the interrogative and neither named an outcome. The answers were larger than a task would have scoped: one produced a package's lexicon and corrected a promise in five places, the other retired a component repository.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 12:05:31 AM PT
