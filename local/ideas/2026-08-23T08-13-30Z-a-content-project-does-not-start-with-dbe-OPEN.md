# A content project does not start with Design By Efferent active, and may not need it installed

- **State:** Open
- **Tags:** [deferred]

**Waits for:** the content package's shape — one package or two — which the Content and Web
feature's first hinge decides. What a content project installs presumes there is something for it
to install.

**Why this state:** the engineer named it and parked it. Two remedies are stated and they are not
the same remedy, and the system has a mechanism for one of them and none for the other.

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
