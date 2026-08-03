# Session — The queue empties into designs, and Waytide learns to describe itself (Sun Aug 2 2026 20:06)

Continues `2026-08-01T23-22-31Z-a-reconciliation-prompt-and-the-queue-at-startup.md`, which
closed on the deferred queue gaining a priority. This stretch **emptied that queue** — from six
items to none — and the way it emptied is the story: four items were carried out as rules, three
were promoted to **designs**, and two were withdrawn. The promotions are the practice the
deferred-items-preempt-design observation implied and never settled.

Alongside that, the session spent a long stretch on **what Waytide is called and how it
describes itself**, producing a website-points collection, two observations about terminology
the system had not noticed in itself, and a settled formulation.

*This is the communicable record — the guided tour. It is not the source of truth. The durable
records are the rules under `system/`, the decision log under `local/log/`, the observations
under `local/observations/`, and the designs under `local/design/`.*

## 1. The component repositories describe themselves

`versioning` had no GitHub description; the other seven did. Adding one turned up that
**`foundation`'s was stale** — *"the agent/ artifact framework"* named a directory retired on
2026-07-27 and a term replaced in the same change.

All eight were then reformatted twice: the em dash became a double colon, matching the status
line's separator, and then a period. The final form is three sentences — the package, its
subject, the attribution.

Logged deliberately, because **GitHub metadata lives outside the repository**: nothing in git
would otherwise show the descriptions had been set, corrected, or reformatted.

## 2. Scripts are run directly

`refresh-packages.sh` still told a reader to `sh waytide/system/foundation/install.sh`. The
cause turned out to be one missing bit: **`report-direct-commits.sh` was the only script of ten
without the executable bit**, so its instructions had to say `sh`, and the form spread to the
nine that did not need it.

The bit was set, and thirteen instruction sites were corrected across the READMEs,
`CONTRIBUTING.md`, two scripts' own usage comments, and `install-all.sh`. Five packages
published.

## 3. "What is a pass?"

Asked while settling how an unattended loop record would be written. The answer exposed a
defect: **"pass" was the unit the loop-records rule is structured on, and it was defined
nowhere** — in a package whose vocabulary opens by saying its terms are binding and cannot be
applied unread.

Renamed to **cycle**, on instruction. "Cycle" already named two larger things — the DBE cycle
and the hinge cycle — and rather than rename those, the vocabulary now states that **the word
before it gives the scale**, and that a bare "cycle" is always the smallest. "Pass" joined the
retired terms.

## 4. Attended and unattended

The gating cadence is chosen at a feature's or experiment's initiation, beside the working
location, with **attended the default**. The developer's framing settled the substance:

- **DBE is in effect either way.** Unattended is not DBE off — the cradle, the efferent-first
  actuation, and the solubility standard all hold. Only the stopping changes.
- **The choice is batch size.** Small-batch interruptions against big-batch rework cost.
- **An unattended run's cycles must not be recorded as though a human oversaw them.** The loop
  record declares the mode once and writes each cycle as its hinge and the decision's
  reasoning, with **no options line and no decision line**, because neither happened.

**"Suspending DBE" was retired as a misnomer** — nothing was ever suspended but the gating — and
experiments took the same choice features got, so one vocabulary covers both lifecycles.
`never-ask-to-start-test-first` gained a statement of what it does **not** cover: it forbids
asking about the method's *substance*, where this is its *cadence*.

## 5. Three items become designs

- **Waytide self-explains itself** was registered at rank 2 and moved to a design within the
  hour. It settles that the explanation is an **interactive chat**, that the website is driven
  from the **same source**, and — added in the writing — that the two surfaces share a *source*
  rather than an output, since a website cannot be a conversation.
- **The Upload example project** carried its three 2026-07-19 resolutions forward and gained a
  fourth: it is a **worked example**, distinct from the self-explanation design, because a
  worked example is the one thing neither a chat nor a page can be — its value is that it was
  actually built.
- **Subagents under Waytide** settles a **constraint and an order of work** rather than
  findings: the governance question is established by observation before anything is delegated,
  and **no gated step is ever delegated**, since a subagent has no channel to the engineer. The
  design says outright that it is unusually open.

## 6. The website's home page

Settled across several exchanges: **a very lengthy chat with Waytide describing a whole process
of using it**, on one continuous scroll, with the chat *as* the page and **navigation appearing
only once the reader begins to scroll**. **Loosely scripted — just the bones**: the sequence is
chosen, the content is the system doing what it does.

The opening sequence is **git install → `load waytide` → starting a feature**. A status report
was in it and was **dropped**: at initiation there is no plan, no queue, no log, and no suite,
so the report would print its shape with nothing in it, and a form with no content demonstrates
only the form.

**`constant` is the source material** — 206 log entries, 19 loop records, 6 feature records, 5
work-session records. Three features carry both a feature record and a loop record, which is
what a transcript needs.

## 7. The implementation hinge gains a candidate

The last methodology item. The developer's formulation answered it differently than the item
framed it: at the implementation hinge the developer chooses **a working implementation** or **a
failing one followed by the complete red/green/refactor cycle**. Both answer the hinge's
question — *how does this implementation come about* — which is what makes the second a genuine
candidate rather than a sequencing step.

Three things settled with it. **Chosen is not choreography**: `dbe-as-design-tool` now says what
it rejects is the *unchosen* cycle, the one nobody decided to run. **The containment constraint
carries unchanged** — a deliberate red is permitted only where its cause reaches no stable test.
And **the contained-red rule was retired**, subsumed, so one gate asks rather than two.

## 8. What Waytide is called

The longest thread, and the one that produced the most durable material.

**A stance nobody had named.** The choose-your-own-adventure property turned out not to be a
candidate but an existing one: **seventeen rules across four packages** put a choice to the
developer rather than deciding it, and none states the stance they share — in a system whose
`rules-install-a-mindset` rule says exactly that a stance should be stated and cross-referenced.
Named **`the-agent-proposes-the-developer-decides`**, echoing the method's own spine.

**Five phrasings kept**, because they are accurate and not interchangeable — the division of
roles, the absent default, the prohibition, the result, and the one that carries a **test**:
*is this decision the developer's?*

**"Waytide is an agent harness and a human ally."** "Harness" was rejected for the cradle
because a cradle must not grip rigid; it holds for the **agent**, where gripping rigid is
exactly what the rules do. "Ally" forecloses the reading that rules, records, logs, and gates
are **process compliance imposed on the human** — which no statement of authority reaches.
"Human" over "engineer" because it pairs with *agent*, which names a kind of entity rather than
a role.

The chosen formulation is **"Waytide: The Human Ally Harness"**, with *use the harness that
makes an agent an ally* kept beside it as the expanded form.

**And a second terminology finding.** Settling *human* versus *engineer* surfaced that the
system uses **three words for that party** — human 121, developer 91, engineer 9 — split cleanly
by package and never reconciled. Recorded as an observation, with the genuine question left
open: whether DBE's *human* and foundation's *developer* mark a real distinction or are drift.

## 9. The queue empties

The last two items were removed rather than carried out. **The decline-the-rule-read item** was
withdrawn; what goes with it is a real constraint it had established — a decline cannot be an
ordinary instruction, because any first message is itself the occasion for the read. **The
license item** left because the license is being built in a project under Eventide.

`local/deferred/` no longer exists, since git does not track empty directories.

## Takeaways

- **A promotion path exists now.** Three items became designs rather than being carried out or
  deleted, which is what the deferred-items-preempt-design observation was pointing at without
  settling.
- **The vocabulary's own rules caught two things nobody had applied them to** — an undefined
  term at the centre of a rule, and three words for one party. Both were found by a question,
  not by a check.
- **A stance can be universally practiced and nowhere stated.** Seventeen rules, four packages,
  no name — the same shape as the citation-versus-dependency criterion a day earlier.
- **Naming work produced the most reusable output.** The five phrasings, the harness/ally
  reasoning, and the chosen formulation are all website material, gathered in one section built
  to be lifted out.
- **The queue emptying is not the same as the work being done.** Two of the six left without
  being carried out, and three left as designs that still need plans.

## Glossary

- **cycle** — one traversal of the loop: a hinge surfaced, decided, acted on. The unit a loop
  record is written in. Scoped by the word before it — *the hinge cycle* is five, *the DBE
  cycle* is the loop.
- **attended / unattended** — the gating cadence. Whether the loop stops at each hinge for the
  developer, or the agent decides each hinge and generates through. DBE is in effect either way.
- **the-agent-proposes-the-developer-decides** — the cross-cutting stance: every decision that
  is the developer's is put to them, and the agent decides none of them.

## Where the durable records live

- **New rules** — `attended-or-unattended-is-chosen-at-initiation` and
  `the-implementation-hinge-offers-the-red-green-refactor-cycle` in `design-by-efferent`.
- **Retired rules** — `first-implementation-may-run-a-contained-red-green-loop`, subsumed.
- **Changed rules** — `loop-records`, `never-ask-to-start-test-first`, `dbe-as-design-tool`,
  `hinge-cycle`, `tdd-designs-coverage-protects`, the DBE vocabulary and README;
  `feature-lifecycle`, `experiment-lifecycle`, and both conventions in `foundation`.
- **New designs** — Waytide's self-explanation, the Upload example project, subagents under
  Waytide.
- **New observations** — the developer-decides stance, and three words for the non-agent party.
- **The website points collection** — inside the self-explanation design, gathered to be lifted
  out whole when the website work moves to its own project.
- **The deferred queue** — empty.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 8:06:02 PM PT
