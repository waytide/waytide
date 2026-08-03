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

## Increments

1. **Destination prepared.** Repository initialized, packages installed, bootstrap committed.
   **Done 2026-08-03.**
2. **Settle the split** — whether the self-explanation design divides as proposed above, or
   moves whole with a stub left behind. Nothing moves until this is answered.
3. **Copy the website material into the destination**, as its own design there, under its
   `waytide/local/design/`. The destination is a Waytide project, so the design conventions
   apply to it: `# <Title> — Design`, the ISO-8601-UTC filename prefix, dated **Settled**
   resolutions, and a provenance footer.
4. **Reduce the composite's copy** to what stays, and point it at the destination by name.
5. **Reconcile what cites the moved material.** The Constant example project design references
   the self-explanation design twice; the session records reference it and are historical, so
   they are left as written.
6. **Log the move**, and record here what actually happened against this plan.

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
