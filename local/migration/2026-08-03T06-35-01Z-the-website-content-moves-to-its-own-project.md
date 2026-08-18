# The website content moves to its own project

Execution plan for moving Waytide's website material out of the composite repository and into
the project that will own it.

- **Source:** `waytide` — the composite authoring repository,
  `/Users/sbellware/projects/waytide/waytide`.
- **Destination:** `website` — `/Users/sbellware/projects/waytide/website`, a sibling of the
  composite and of the eight component clones.
- **Destination state as of 2026-08-03:** initialized on `master`, all eight Waytide packages
  installed under `waytide/system/`, `AGENTS.md`, `CLAUDE.md`, and a tracked
  `.claude/settings.json` in place. The notice and status line render. It is ready to receive.

## What moves, what stays, and what splits

**The material is not one artifact, and only part of it is the website's.**

**Moves whole — `Points the website should make`.** The largest section of the self-explanation
design, and the one written to be lifted: it holds the chosen-cycle point, the developer-decides
stance in five phrasings, the harness/ally reasoning, and *"Waytide: The Human Ally Harness"*.
Every entry is a point to make publicly and why. It becomes the website project's own artifact.

**Stays — the Constant example project design.** It settles which project serves as the worked
example and that its logs are read as a projection rather than literally. That is **Waytide's**
concern: it is about what demonstrates the method, not about a website. The website consumes
its output; it does not own the decision. It also names `constant`, another Eventide project,
which the website has no relationship to.

**Stays — the suspended Upload example project design.** Waytide's own history, in the
composite's `local/suspended/`.

**Splits — the self-explanation design.** Its sections divide by subject:

| Section | Whose |
|---|---|
| Premise, Background & Motivation, Vocabulary | **Waytide** — that it explains itself, and why |
| The two surfaces | **Waytide** — the chat is a Waytide surface |
| The source is a projection | **Waytide** — how the explanation is produced at all |
| The distribution constraint | **Waytide** — subtree carries only package directories |
| **The home page** | **Website** — header, hero, two columns, the scroll, the sequence |
| **Points the website should make** | **Website** |

**This split is the one decision the plan cannot make on its own** and is the thing to settle
before increment 3 runs. The reading above is the proposal: **Waytide keeps why and what; the
website takes how it looks.** The alternative is that the whole design moves and the composite
keeps a stub, on the grounds that a design should not be torn in half. Both are defensible.

**Settled 2026-08-03 — neither, but a third reading between them.** The composite keeps **only
the reasoning**: Premise, Background & Motivation, and Vocabulary. **The two surfaces, the source
is a projection, and the distribution constraint moved** along with the home page and the points,
where the table above had them staying. The line the developer drew is **why against how**: what
the composite keeps says *that* Waytide explains itself and why it must; everything describing
*how* the explanation is produced, constrained, and presented went to the destination, because
producing it repeatably is what the destination is for.

## Increments

1. **Destination prepared.** Repository initialized, packages installed, bootstrap committed.
   **Done 2026-08-03.**
2. **Settle the split** — whether the self-explanation design divides as proposed above, or
   moves whole with a stub left behind. Nothing moves until this is answered.
   **Done 2026-08-03** — settled as a third reading, recorded above.
3. **Copy the website material into the destination**, as its own design there, under its
   `waytide/local/design/`. The destination is a Waytide project, so the design conventions
   apply to it: `# <Title> — Design`, the ISO-8601-UTC filename prefix, dated **Settled**
   resolutions, and a provenance footer. **Done 2026-08-03.**
4. **Reduce the composite's copy** to what stays, and point it at the destination by name.
   **Done 2026-08-03.**
5. **Reconcile what cites the moved material.** The Constant example project design references
   the self-explanation design twice; the session records reference it and are historical, so
   they are left as written. **Done 2026-08-03** — and one artifact this plan did not name was
   found; see below.
6. **Log the move**, and record here what actually happened against this plan.
   **Done 2026-08-03.**

## What is true in between

**Between increments 3 and 4 the material exists in both repositories.** The composite's copy is
authoritative until increment 4 reduces it; the destination's is a copy, not yet the source. A
reader in that window should take the composite's as current, and increment 4 is what reverses
that.

**Nothing is deleted.** Increment 4 reduces the composite's design to the sections that stay; it
does not remove the file. What leaves the composite leaves by being written elsewhere and
removed here, and this record is the trail.

**The destination is a Waytide project and is governed by the rules it installed.** Work there
follows the same conventions — its own `waytide/local/` directories, its own decision log, its
own feature lifecycle. It is not a content dump.

## What happened

**The move ran in one sitting on 2026-08-03**, in the destination's session rather than this
repository's, and every increment completed. What follows is what departed from the plan.

**The split settled between the two readings the plan offered**, not on either. The plan proposed
that the two surfaces, the projection, and the distribution constraint stay here; all three
moved. The reason given was that the destination exists to make the explanation **producible
repeatably**, and those three sections describe how it is produced — so keeping them here would
have separated the mechanism from the project responsible for it.

**The consequence is that what remains here is thin**, and this is worth stating plainly because
it is the cost of the choice: a premise, a motivation, a vocabulary, and three settled
resolutions. **All twenty of the design's deferred questions moved**, since every one of them
concerned production or presentation. The alternative the developer declined — move it whole,
leave a stub — was declined on the ground that a design should not be torn in half, and the
remainder is close enough to a stub that the distinction is smaller in practice than it was in
the abstract. It is still a design and it still settles something: that Waytide explains itself,
and why a written corpus would drift. That was surfaced before the reduction ran, and the choice
was made with it in view.

**Increment 5 found an artifact this plan did not name.** The observation *"The developer
chooses" is a cross-cutting stance that no rule names* cited the moved material twice — once for
the point the website should make, once for the open question of whether the
choose-your-own-adventure phrasing is admissible as website prose. Both were corrected to name
the destination's design. An observation is a live, forward-looking artifact, so it is
reconciled like a design rather than left like a record.

**One reference was deliberately left standing.** The suspended Upload example project design
refers to the self-explanation design in four places. It was **not** corrected: a suspended
artifact is set aside rather than current, and the suspended-convention's whole claim is that a
suspended thing **comes back as it was**. Editing its body would defeat that. The consequence is
real and is recorded here rather than fixed — restoring that design would restore references to
a design that has since been divided, and whoever restores it reconciles them then.

**The destination received more than a copy.** Beyond the moved sections, its design carries two
new resolutions dated 2026-08-03 — that it holds the operational half, and that the rules which
query, normalize, and record explanation requests are the destination project's **own local
rules for now**, with promotion to a distributed package left open. It also carries a new leading
deferred question, **how an explanation request is queried, normalized, and recorded**, which
nothing anywhere settles and which is the destination project's stated purpose. And its
distribution-constraint section gained a paragraph the original did not have: rules held in the
destination govern the work done there and **cannot reach an agent running in a developer's own
project**, which is where the chat surface runs.

**Nothing was deleted, and the between-state was brief.** Increments 3 and 4 ran minutes apart,
so the window in which both repositories held the material — and this one was authoritative —
did not outlast the session.

## Why

The website material accumulated in the composite because that is where the conversation was
happening, not because it belongs there. Left in place it makes the composite's design directory
answer two questions — what Waytide is, and what its website looks like — and a reader looking
for either finds both. The destination now exists, so the reason to keep it here is gone.

Moving it is also the case the migration convention was written for, and its first use: content
crossing a repository boundary, planned before it moves, with the record kept in the repository
it leaves so the trail of where it went stays where a reader will look first.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 11:35:01 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 11:52:17 PM PT
