# Waytide's Self-Explanation — Design

## Premise

Waytide explains itself to the people using it through **an interactive chat with the agent,
skewed toward explaining the system** rather than the developer's project. **The website's
content is driven by that same content.** One source, two surfaces.

This is a premise rather than a summary because most of the design is not yet settled. What is
fixed is the form and the one-source constraint; the interaction design parameters come from
the developer, and the question of what the two surfaces actually share is open and is the
question the rest turns on.

## Background & Motivation

**The system is not currently explicable to someone meeting it.** A reader has eight package
`README.md` files, each explaining one package, and nothing explaining the set — which to
install first, what depends on what, why it is shaped as it is. The entry point does not exist.

**The website is where that matters most**, because it reaches people who have installed
nothing. Its drafts — `docs/capabilities.md`, `docs/features.md`,
`docs/human-in-the-loop-design.md` and others — were removed from this repository on
2026-07-30, so there is currently no public explanation at all.

**A website written separately from the system it describes is the drift problem in its most
public form.** The problem is not hypothetical here and does not need arguing from first
principles: the package READMEs are hand-maintained descriptions of what the rules say, and
**three of them were corrected by hand in a single session** because the rules had moved
underneath them. The same failure on a public site is discovered by a reader who believed it.

This design exists because that failure is avoidable by construction — if both surfaces are
driven from one source, neither can describe a system that no longer exists.

## Vocabulary

- **Surface** — a place a user meets the explanation. There are two: the interactive chat, and
  the website.
- **Source** — what both surfaces are produced from. Not itself a surface.
- **Skewed toward explaining itself** — the chat answers about **Waytide** rather than about the
  developer's project, which is what an agent in a consuming project ordinarily does.

## The two surfaces

**The chat** is interactive and agent-produced. Its distinctive capability is that it answers a
question the explanation's author did not anticipate — the thing no document can do.

**The website** is static and public. Its distinctive capability is reaching someone who has
installed nothing and is deciding whether to.

They are not the same artifact and cannot be. **A website cannot be a chat**, so what they
share is a **source**, not an output.

## The load-bearing question: what the source is

Two candidates, and the choice decides most of the remaining design.

**The rules themselves are the source.** The chat reads the installed rules and answers from
them; the site is generated from the same files. Nothing can drift, because there is nothing
between the rules and either surface. The cost is that the explanation is different every time
it is asked, and that the rules are written to *govern* rather than to *introduce* — a reader
meeting the system needs an entry path and a reason for the shape, which no individual rule
states.

**A written corpus is the source.** Prose written for the purpose of explaining, which the chat
draws on and the site publishes. It is stable, it can be written as an introduction rather than
a set of governing statements, and it can carry the reasoning behind the shape. The cost is
that it is exactly the kind of artifact that drifts — a hand-maintained description of what the
rules say, which is the README failure at a larger scale.

**Neither is obviously right, and a mixture may be.** The reasoning behind the shape is not
derivable from the rules and has to be written; what each package governs is derivable and
should not be. Settling this is the first work of the plan that realizes this design.

## The home page

**The home page is a very lengthy chat with Waytide that describes a whole process of using
it**, presented as one continuous scroll. There is no landing copy above it and no summary
standing in for it — the chat is the page.

**Navigation appears when the user begins to scroll.** It is absent on arrival, so the first
thing on screen is the conversation and nothing competing with it, and it becomes available the
moment the reader has committed to reading.

**Why a transcript rather than a description.** Every other way of introducing the system says
what it is. A chat showing a whole process shows **what using it is like** — the questions a
developer actually asks, the points where the system stops and asks back, what the artifacts
look like as they accumulate. That is not a claim about the system that a reader has to take on
trust; it is the thing itself, and its length is part of what it demonstrates. A short excerpt
would show the surface and hide the process, which is exactly what is worth showing.

**The length is deliberate and is the design.** A reader who scrolls a long way has seen a
real working session rather than a pitch, and one who scrolls a little has still seen more of
the method than a features list would give them.

**It is loosely scripted — just the bones.** Not a raw session transcript, and not written
prose in the shape of one. The **sequence** is scripted; what happens inside each step is the
system doing what it does. That keeps the two properties that matter in tension: a reader sees
a real working session rather than a composed argument, and the session still gets somewhere
rather than wandering as a real one would.

**The opening sequence:**

1. **`git` install** — the packages installed into a project.
2. **`load waytide`** — the rules read, closing with the deferred queue printed.
3. **Starting a feature** — initiation, with the working-location and attended-or-unattended
   choices put to the developer.

Every step is a real, rule-governed moment rather than a demonstration written for the page,
and the last is where the method's distinctive behavior shows: it puts **selections** to the
developer rather than proceeding, which is the thing a features list cannot convey.

**A status report is deliberately not in the opening sequence.** It was considered and dropped:
at project initiation there is no plan, no deferred queue, no decision log, and no suite, so
the report would print its shape with nothing in it. A form with no content demonstrates the
form, which is the least interesting thing the system does, and it would spend the reader's
first minutes on emptiness. The status report belongs where there is something to report.

**One residue of that.** The deferred-queue print at step 2 has the same problem in miniature —
on a fresh install it says the queue is empty. It is one line rather than a section, and it
shows that the queue is reported at all, so it stays.

**`constant` is the source material for the transcript.** It is a real project built under
Waytide throughout, and its artifacts are the bones a loosely-scripted session would be
assembled from — a record of work that actually happened, which is precisely what a written
session cannot be. What is there:

| Artifact | Count |
|---|---|
| decision log entries | 206 |
| loop records | 19 |
| feature records | 6 |
| work-session records | 5 |
| observations | 11 |
| experiments, plans, designs | 2 each |
| the project's own local rules | 3 |

**Three features carry both a feature record and a loop record**, which is what a transcript
needs — the lifecycle from the one, the design cycles from the other:

- **`import-literal-constants`** — 6 cycles. Short enough to follow end to end.
- **`import-shadow-inherited`** — 7 cycles, and the feature was later renamed
  `override_ancestor`. It therefore shows a **terminology correction landing on finished work**,
  which is a real and unflattering part of the method that a composed example would omit.
- **`import-collision-refusal`** — 19 cycles. The fullest record and almost certainly too long
  for a home page, though it is the best evidence that the method is actually run.

The work-session records are the other candidate: each already narrates an arc, which is close
to what the page wants, and they point at the durable records rather than restating them.

**This is the same property the Upload example project has**, on a different surface: its value
is that the process is exhibited rather than described (see
`2026-08-03T00-47-10Z-the-upload-example-project.md`). Whether the home-page chat draws on that
project — whether the process it walks through *is* the example being built — is not settled.

## Points the website should make

A running collection, added to as points surface. **It is gathered here to be lifted out
whole** — the website work moves to a separate project later, and this section is what goes
with it. Each entry is a point worth making publicly and the reason it is worth making, not
copy.

- **The cycle is chosen, not performed.** DBE rejects red-green-refactor **as choreography** —
  the cycle nobody decided to run — and not as a choice. At the implementation hinge the
  developer is offered two candidates: the working implementation, or the red/green/refactor
  cycle. Selecting the cycle for a particular unit is a design judgment, which is the opposite
  of ceremony.

  **Why it belongs on the website.** A reader who knows TDD arrives with one of two
  assumptions — that this is TDD with extra apparatus, or that it is against TDD. It is
  neither, and this is the shortest thing that shows why: the cycle is available and *chosen*
  rather than *performed*. It also demonstrates the method's general shape in miniature — a
  subtle, load-bearing decision put to a person instead of settled by a procedure — which is
  the thing hardest to convey by describing it.

- **The developer chooses at every gate; the work goes where they take it.** Nothing about a
  session is fixed in advance. The working location, the gating cadence, each hinge's
  resolution, whether a unit is driven through the cycle, what the next outcome is — all of it
  is put to the developer and none of it is decided by the agent. The path through a piece of
  work is the developer's, and a different set of choices produces a different piece of work.

  **Why it belongs on the website.** It is the single fact that most distinguishes this from
  tooling that automates a workflow, and it explains the apparatus rather than merely listing
  it: the hinges, the selection interface, the records of what was decided all exist because
  the choosing is the point. A reader who grasps this understands why the system stops as often
  as it does, which otherwise reads as friction.

  **A caution on how it is said.** "Choose-your-own-adventure" states it precisely and in one
  familiar phrase, and it is an analogy — which the `language` package's
  name-literally-not-by-analogy rule rejects for **naming a concept**, on the ground that the
  reader must learn and carry a mapping. Whether it is admissible as *website prose*, where a
  near-universal reference costs a reader nothing, is a real question and is not settled here.
  What the point itself claims does not depend on the phrase.

- **Five phrasings of the same stance, each foregrounding something different.** Kept together
  because each is accurate and they are not interchangeable — the one to use depends on what a
  passage is doing. The first is settled as the **rule's** name (see the observation
  *"The developer chooses" is a cross-cutting stance that no rule names*); all five are here as
  ways of **characterizing** the system.

  - **The agent proposes; the developer decides.** States both roles and the division between
    them. Echoes the method's own spine, *"the AI generates; the human deliberates."* The one to
    use when explaining how a session actually runs.
  - **Nothing is decided by default.** States the negative the rules enforce, and it is drawn
    from their own words — "no standing default" is the recurring phrase at the working location
    and the gating cadence. The one to use against the assumption that a tool has opinions it
    applies silently.
  - **The agent does not decide for the developer.** The plain prohibition. The one to use when
    a reader's worry is what the agent will do while they are not looking.
  - **The work goes where the developer takes it.** The literal rendering of the
    choose-your-own-adventure sense, without the mapping. Describes the result rather than the
    mechanism, and is the most inviting of the five.
  - **Every decision that is the developer's is put to them.** The most exact, and the one that
    carries a **test** rather than a sentiment: *is this decision the developer's?* The one to
    use where a reader wants to know how the line is drawn.

  **Why they belong on the website.** The stance is the thing hardest to convey by listing
  features, and it is what a reader has to grasp for the apparatus to make sense rather than
  read as friction. Having five accurate phrasings means a passage can state it again without
  repeating itself, and each entry says what its phrasing is *for*.

- **"Waytide is an agent harness and an engineer ally."** Tentative as a formulation, settled as
  to what each half is for.

  **"Agent harness"** states the mechanism. The rules are **binding** on the agent — they
  "override default behavior where they conflict," and the agent has no discretion to depart
  from them. Note that `dbe-as-design-tool` rejected "harness" for the **cradle**, on the ground
  that a cradle must hold the implementation "without gripping it rigid." That objection does
  not carry here: gripping rigid is precisely what the agent's rules do, so the word fails for
  the test and holds for the agent.

  **"Engineer ally"** forecloses a reading the mechanical phrasings leave open. A system of
  rules, records, logs, and gates looks, from a distance, like **process compliance imposed on
  the engineer** — surveillance and metrics have that shape. Saying the engineer is allied with
  answers that immediately, and no statement of authority does: *binds the agent and defers to
  the engineer* says who decides without saying whose interest the apparatus serves.

  **One thing the pair does not say, which may want a second sentence.** The two halves are not
  symmetrical, and the parallel invites reading them as though they were. The engineer is
  constrained too — branch topology, record contents, commit wording, when a decision is logged.
  What distinguishes the parties is not constraint against support: **the agent is bound and
  given no discretion; the engineer is bound and given all of it.** "Harness" states a
  mechanism, "ally" states a disposition, and the second does not follow from the first.

## The distribution constraint

Anything a user reads **in their own project** must live in a package: `git subtree` carries
only package directories, which is the same constraint that put the consuming-project tooling
in `foundation`. So a written source is not free to live anywhere — it goes in a package, and
`foundation` is the only one always installed.

A source consulted only by the website has no such constraint, but a source serving both does.

## Settled

- **2026-08-02** — Waytide explains itself through an **interactive chat with the agent**,
  skewed toward explaining the system rather than the developer's project.
- **2026-08-02** — **The website's content is driven by the same content** as the chat. One
  source, two surfaces; not two separately-maintained explanations.
- **2026-08-02** — **The initial interaction design parameters are the developer's** and are
  given rather than inferred. The work starts from them.
- **2026-08-03** — The two surfaces share a **source**, not an output, since a website cannot be
  a conversation.
- **2026-08-03** — **The home page is a very lengthy chat with Waytide** describing a whole
  process of using it, on one continuous scroll. The chat is the page; there is no landing copy
  above it.
- **2026-08-03** — **Navigation appears when the reader begins to scroll**, and is absent on
  arrival.
- **2026-08-03** — The transcript is **loosely scripted — just the bones**. The sequence is
  scripted; what happens inside each step is the system doing what it does.
- **2026-08-03** — The opening sequence is **git install → `load waytide` → starting a
  feature**. A status report was considered for the sequence and **dropped**: at initiation
  there is nothing to report, and a form with no content demonstrates only the form.

## Out of Scope / Deferred

- **What the source is** — the rules, a written corpus, or a mixture. The load-bearing question
  above; unresolved here.
- **The interaction design parameters** — how the chat opens, what it offers, how far it leads
  versus follows. To be provided by the developer.
- **What makes the chat lean toward the system** — a command that opens it, a mode it stays in,
  or a rule about which question it takes as asked. Part of the interaction design.
- **Which package holds a written source, if there is one.** No package's subject is "Waytide
  itself"; `foundation` is the candidate on the always-installed argument alone.
- **How the website is produced** — generated at publish time from the packages, assembled by
  the site from the component repositories, or otherwise. The flow must be one-way, as
  composite → component already is.
- **Whether the removed website drafts return**, and in what form.
- **Whether the transcript replays a `constant` feature or is a new session run for the
  purpose** — **deferred to planning**, not settled here. Replaying has the property that it
  happened; running a new one can follow the settled opening sequence exactly, which none of the
  existing records do, since all six features were begun before that sequence existed. The
  choice depends on how the transcript is actually assembled, which is a plan's concern.
- **Where a status report appears later in the transcript**, once the project has a plan, a
  queue, and a log to report — or whether it appears at all.
- **What the feature at step 3 is**, and how far the transcript follows it — to its first gated
  hinge, or through to its conclusion.
- **What comes after the opening sequence**, which is scripted only to step 3.
- **How the scripting is kept honest.** Loosely scripted means the sequence is chosen and the
  content is not; nothing yet says what stops the content being tidied into a composed
  argument, which is the failure that would make the page a pitch after all.
- **What "one continuous scroll" requires of the implementation** — whether content loads as the
  reader scrolls or the page is simply long and unpaginated. Read here as the latter unless
  length forces otherwise.
- **What the navigation contains**, and whether it persists once shown.
- **The plan that sequences this.** Not written; this design settles direction only.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 5:45:18 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:48:53 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:53:08 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:55:41 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:57:03 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 6:00:12 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:04:47 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:08:19 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:13:24 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 7:21:36 PM PT
