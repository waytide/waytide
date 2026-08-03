# Waytide's Self-Explanation — Design

## Premise

Waytide explains itself to the people using it through **an interactive chat with the agent,
skewed toward explaining the system** rather than the developer's project. **The website's
content is driven by that same content.** One source, two surfaces.

What the two surfaces share is a **projection** — settled 2026-08-03, and the question the rest
of the design turned on. What remains open is narrower: the interaction design parameters, which
come from the developer, and what "idealized" is allowed to change, which decides whether a
projection can be trusted.

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

## The source is a projection

**Settled 2026-08-03.** Both surfaces are produced from a **projection** — a derived artifact
generated from the records the system already keeps, rather than from prose written to explain.
The chat draws on it; the website is generated from it.

**What that means, and what it rules out.** Two other candidates were weighed:

- **The rules themselves.** Nothing could drift, because nothing would sit between the rules and
  either surface. But rules are written to **govern**, not to introduce: a reader meeting the
  system needs an entry path and the reasoning behind the shape, and no individual rule states
  either.
- **A written corpus.** Prose written to explain, which the chat draws on and the site
  publishes. It reads as an introduction and can carry the reasoning — and it is exactly the
  artifact that **drifts**. This repository has that failure documented three times over in its
  own package READMEs, which are hand-maintained descriptions of what the rules say and were
  corrected by hand when the rules moved underneath them.

**A projection is neither.** It is **derived rather than authored**, so nothing is maintained
alongside the system that can fall out of step with it; and **regenerable rather than fixed**,
so when the system changes, the explanation is produced again rather than corrected. That is
precisely the property a written corpus cannot have and the reason a written corpus drifts.

**It is the same mechanism the Constant example project design settles for the replay** —
`constant`'s logs are not read literally; an idealized log is generated, the Waytide cycles and
steps are synthesized from it, and a website script is sequenced and generated from that. This
design adopts the mechanism for the whole of the explanation rather than the home page alone.
See `2026-08-03T05-40-22Z-the-constant-example-project.md`.

**What a projection does not excuse.** It is derived, not automatic — something decides what is
included, in what order, and at what altitude. Two constraints already settled for the replay
carry to every projected surface:

- **It must not present as something it is not.** A projected explanation is not a transcript,
  not a recording, and not the rules themselves, and what it derives from must be reachable.
- **The records are not back-edited to suit it.** A projection is derived from a record; changing
  the record to fit the projection destroys what makes the projection worth anything.

**The open question moves rather than closing.** What "idealized" is allowed to change is now
this design's question as well as the Constant design's, because it decides whether every
surface is trustworthy and not only the home page. Compressing, omitting, and inventing are not
the same act.

## The home page

**The website is not itself an interactive chat.** The chat on the page is a **content and
style element** — a rendered scroll of a **synthesized session**, not something the reader
converses with. The interactive chat is the other surface: the agent, in a developer's own
project. The two share a source; they are not the same artifact, and the page does not pretend
to be the product.

**The page's structure:**

- **A top header and a short hero image.**
- **Below it, two vertical sides.** On the **left**, the chat. On the **right**, **what the
  agent touched** — both the **sources consulted** to answer a request and the **artifacts
  created** by the work, each appearing at the point in the session it belongs to.
- **Each entry is an expandable summary**, clickable to open the record, the file, or the query
  in full.
- **It can scroll on and on**, an infinite scroll through the synthesized session with the
  `constant` library.

**The right side carries both directions, and that is the point.** Work under this system both
**reads** and **writes**, and the right pane shows each at the moment it happens:

- **Sources consulted.** When a request is made — a test report, a status report, a deferred
  listing, anything — the queries and the files read appear on the right. Every answer on the
  left has its provenance beside it.
- **Artifacts created.** Log entries, loop records, feature records, appearing at the exchange
  that produced them.

**Showing the sources answers a question about the whole system that prose cannot.** The rules
require that reports be **re-derived from current files rather than recalled** —
`status-report-format` says "do not report stale task counts, suite numbers, contexts, or
deferred items from memory," and `test-report-format` says "re-derive everything from the
current files." Those are promises. A reader watching the files being read beside the answer
being given sees the promise kept, and gets a structural answer to the question every reader of
an AI system has: **whether any of this is grounded or invented.**

**Showing the artifacts makes the other central claim visible.** Working this way **accumulates
a record** — committed alongside the code. Prose can assert that. A reader watching a log entry
appear beside the exchange that produced it sees **when** it is written, which is the part a
description always leaves vague.

**The summaries are collapsed by default and expand on demand** because the two sides are doing
different work. The chat carries the reader forward; the artifacts show what it left behind. An
artifact opened in full stops the forward motion, which should be the reader's choice and not
the page's.

**Navigation appears when the reader begins to scroll.** It is absent on arrival, so what is on
screen first is the hero and the chat coming up beneath it, with nothing competing.

**Why a rendered session rather than a description.** Every other way of introducing the system
says what it is. A session showing a whole process shows **what using it is like** — the questions a
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

**This is the same property the Constant example project has**, on a different surface: its
value is that the process is exhibited rather than described (see
`2026-08-03T05-40-22Z-the-constant-example-project.md`). Whether the home-page chat draws on
that project is not settled — though it is the same body of artifacts already named above as the
transcript's source material, which makes the two questions nearly one.

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

- **"Waytide: The Human Ally Harness"** — the chosen formulation, settled 2026-08-02.

  **"Use the harness that makes an agent an ally"** is the expanded form, kept alongside it.
  Where the compressed one names what Waytide *is*, the expanded one names what it is **for** —
  mechanism, object, and purpose in that order — and it is the form to reach for where a reader
  has not yet been given the compressed one to unpack.

  **A known risk in the compressed form, recorded rather than acted on.** English noun-stacks
  bind rightward, so *human ally harness* is available to a first-time reader as *a harness for
  human allies* — the compliance reading that "ally" was introduced to foreclose. The intended
  reading, *the harness that makes an agent an ally*, is the better claim and arrives on the
  second pass. The compression was chosen deliberately with this understood; the expanded form
  exists to carry the intended reading wherever the compressed one would be met cold.

  **Waytide is an agent harness and a human ally** remains the definitional sentence, and what
  each half is for is settled below.

  **"Agent harness"** states the mechanism. The rules are **binding** on the agent — they
  "override default behavior where they conflict," and the agent has no discretion to depart
  from them. Note that `dbe-as-design-tool` rejected "harness" for the **cradle**, on the ground
  that a cradle must hold the implementation "without gripping it rigid." That objection does
  not carry here: gripping rigid is precisely what the agent's rules do, so the word fails for
  the test and holds for the agent.

  **"Human ally"** forecloses a reading the mechanical phrasings leave open. A system of
  rules, records, logs, and gates looks, from a distance, like **process compliance imposed on
  the human** — surveillance and metrics have that shape. Saying the human is allied with
  answers that immediately, and no statement of authority does: *binds the agent and defers to
  the human* says who decides without saying whose interest the apparatus serves.

  **"Human" rather than "engineer", settled 2026-08-02.** It is the pairing the method's own
  lexicon uses — `design-by-efferent` says *human* 111 times, in *human-in-the-loop* and in "the
  AI generates; the human deliberates" — and it is the only one that pairs correctly with
  *agent*, which names a kind of entity rather than a role. *Engineer* appears nine times across
  three files and is the least established of the three words the system uses for this party.
  **The known risk is register:** "human ally" is close to AI-marketing idiom, and it lands in
  the sentence that introduces the system. It is accepted deliberately; the pairing was judged
  worth it.

  **One thing the pair does not say, which may want a second sentence.** The two halves are not
  symmetrical, and the parallel invites reading them as though they were. The engineer is
  constrained too — branch topology, record contents, commit wording, when a decision is logged.
  What distinguishes the parties is not constraint against support: **the agent is bound and
  given no discretion; the human is bound and given all of it.** "Harness" states a
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
- **2026-08-03** — **The source is a projection** — derived rather than authored, regenerable
  rather than maintained. The rules alone and a written corpus were both weighed and rejected:
  the rules govern rather than introduce, and a corpus is the artifact that drifts. The two
  constraints settled for the replay carry to every projected surface — it must not present as
  something it is not, and records are not back-edited to suit it.
- **2026-08-03** — **The home page is a very lengthy chat with Waytide** describing a whole
  process of using it, on one continuous scroll.
- **2026-08-03** — **The website is not itself an interactive chat.** The chat on the page is a
  content and style element — a rendered scroll of a synthesized session. The interactive chat
  is the other surface.
- **2026-08-03** — **The page is a top header and a short hero image, with the chat below it**,
  scrolling into view and continuing through the synthesized `constant` session.
- **2026-08-03** — **The scroll has two vertical sides: the chat on the left, and on the right
  what the agent touched** — the **sources consulted** for any request, and the **artifacts
  created** by the work. Each is an expandable summary, clickable to open in full.
- **2026-08-03** — **Navigation appears when the reader begins to scroll**, and is absent on
  arrival.
- **2026-08-03** — The transcript is **loosely scripted — just the bones**. The sequence is
  scripted; what happens inside each step is the system doing what it does.
- **2026-08-03** — The opening sequence is **git install → `load waytide` → starting a
  feature**. A status report was considered for the sequence and **dropped**: at initiation
  there is nothing to report, and a form with no content demonstrates only the form.

## Out of Scope / Deferred

- **What "idealized" is allowed to change** — inherited from the Constant example project
  design, and now this design's question too, since a projection is the source for every
  surface. Compressing a long cycle, omitting a false start, and inventing a decision nobody
  made are not the same act, and nothing yet says where the line falls.
- **The interaction design parameters** — how the chat opens, what it offers, how far it leads
  versus follows. To be provided by the developer.
- **What makes the chat lean toward the system** — a command that opens it, a mode it stays in,
  or a rule about which question it takes as asked. Part of the interaction design.
- **What the projection is generated *from*, beyond the replay** — the rules are the obvious
  input for what each package governs, but the reasoning behind the shape is not derivable from
  them and lives today in designs, observations, and session records. Which records feed which
  surface is not settled.
- **Whether anything written has to be installed with a project.** A projection produced for the
  website has no distribution constraint; one the chat draws on inside a consuming project does,
  since subtree carries only package directories.
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
- **How the two sides behave on a narrow screen**, where they cannot sit side by side.
- **Whether an artifact stays in view once it appears**, or scrolls away with the exchange that
  produced it. A record that persists shows accumulation; one that scrolls away shows sequence.
- **Which entries are shown, and how volume is handled.** A status report reads a great many
  files, and listing every one swamps the pane. The projection decides what appears — the same
  "what is idealized allowed to change" question, arriving on the right-hand side, where
  omitting a source is a stronger claim than omitting an artifact.
- **Whether reads and writes are distinguished**, and how. They are opposite directions and the
  pane now carries both.
- **What an artifact's collapsed summary contains** — its title alone, or its title and a line
  of what it says.
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
Changed by Scott Bellware on Sun Aug 2 2026 at 7:47:19 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 10:40:22 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 10:57:25 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:06:44 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:10:19 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:16:27 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:19:58 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:23:41 PM PT
