# A content project does not start with Design By Efferent active, and may not need it installed

- **State:** Realized

**Why this state:** what the item describes exists. A content project declaring the `content`
package set gets Design By Efferent neither installed nor active.

**The `[deferred]` tag is removed and the record is kept**, per the deferred-queue-convention. The
tag was the queue membership, and the queue is what carries outstanding work. **The record carried
no kind tag beside it**, so the `**Tags:**` line goes rather than being given a kind the engineer
never named.

**It waited on the content package's shape**, which *Waytide for content and web* answered as
neither of the two candidates the wait named — a named set of existing packages.

## Settled

- **2026-08-25 — both remedies exist, and neither arrived by the route this record expected.**
  **Not installed** is the `content` package set, which is `foundation`, `language`, `git`,
  `versioning`, and `journal`. **Not active** is the package-set declaration, which deactivates
  what an active set does not name.
- **2026-08-25 — the concern this record raised about inventing a dormant package was answered
  directly.** It asked whether that was worth doing, given the unconditional read is load-bearing.
  Deactivation is defined as **read and not applied** rather than not read, so the read stays
  whole and a deactivated package's rules can still be cited and reactivated within a session.
- **2026-08-25 — the body below is left as written.** Its claims that nothing does a subset install
  and that Waytide has no concept of an inactive package were true when it was written. An item's
  content is point-in-time and is not chased.

## What this does not settle

- **Whether the division into code-specific and content-neutral packages holds**, and where `git`
  and `versioning` fall.
- **Whether DBE is genuinely inapplicable to content, or only looks it.** That is the question the
  engineer named on 2026-08-25 when they abandoned *Design By Efferent is an `ext/` package* —
  whether the core of Waytide should be without it. Nothing here answers it.

## Premise

**As the engineer stated it:** for a content project, the DBE capability should not be active as
its initial state. Maybe DBE wouldn't need to be installed. I'll explore that in the future.

## The two remedies are different, and one has no mechanism

**Not installed** is the subset case. A content project takes the packages it needs and leaves
design-by-efferent out. Nothing in the system does this today — *The install takes a package set
on the command line* records that a project takes seven packages or eight and that a subset is
unreachable. So this remedy is that idea, reached from a second direction.

**Not active** is something else, and **Waytide has no concept of an installed package that is
inactive.** Every rule file under `waytide/system/` is read at the start of every session,
unconditionally. The `announce-waytide-at-session-start` rule states that the read is
unconditional and names the failure that made it so. There is no dormant state to put a package
in, so this remedy would have to invent one.

**That is the thing to settle first**, and it is why the two are worth keeping apart in the
record. A mechanism for a dormant package is a change to how Waytide loads. A subset install is a
change to how Waytide installs. They cost different things.

## DBE is not the only code-specific package

**`testing` is the other one**, and design-by-efferent includes it. A content project that has no
suite has no use for controls, actuation placement, or assertion form either.

**So the question is wider than DBE.** Of the seven, `foundation`, `language`, `git`,
`versioning`, and `journal` are arguably content-neutral. `testing` and `design-by-efferent` are
not. Whether that division holds is part of what this asks.

**Leaving design-by-efferent out does not leave `foundation`, `language`, and `testing` out**,
since it includes them and a dependency install brings them. Dropping `testing` as well would
have to be deliberate.

## What is not settled

- **Which remedy**, or both.
- **Whether a dormant package is worth inventing**, given the unconditional read is load-bearing
  — it exists because a session that judged the read not worth it went on to edit rules and
  publish packages against rules never read.
- **Whether the division into code-specific and content-neutral holds**, and whether `git` and
  `versioning` fall on the content side of it.
- **Whether DBE is genuinely inapplicable to content, or only looks it.** The method's spine is
  that the engineer decides at the decisions that bear weight and the agent generates the rest.
  That claim is not about code. What is about code is the five hinges, and whether an article has
  an equivalent is not obvious either way.

Related:

- *Waytide for content and web* — the idea this waits on, and the feature realizing it
- *The install takes a package set on the command line* — the subset remedy, recorded from the
  packaging side
- the `announce-waytide-at-session-start` rule — the unconditional read a dormant package would
  have to work against

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:13:30 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:00:05 PM PT
