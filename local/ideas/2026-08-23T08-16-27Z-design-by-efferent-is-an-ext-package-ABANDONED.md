# Design By Efferent is an `ext/` package

- **State:** Abandoned
- **Tags:** [design]

**Why this state:** abandoned by the engineer's decision on 2026-08-25.

**As the engineer stated the reason:** they are undecided whether the core of Waytide should be
without Design By Efferent. The move presumes that answer, and the answer is not settled.

**The record reached `Active` before it was dropped.** The two questions that held it `Open` were
answered — the grouping admits a method, and the package is `ext/design-by-efferent` — which was
the promotion condition this record stated for itself. Those resolutions stand as written below.
What they settled was **how** the move would be made rather than **whether** it should be, and the
second question is the one that stopped it.

**A feature was started to carry it out and was abandoned with it.** Nothing it produced reached
`master`, by the engineer's instruction. The decision log entry written on 2026-08-25 carries the
substance, because no record of the work is on `master` to be read.

## Settled

- **2026-08-24 — the package is `ext/design-by-efferent`.** Not `ext/dbe`. The `language` package's
  expand-abbreviations-on-first-use rule is the standing reason a name is not compressed to its
  initials, and a directory name is met without an expansion anywhere near it.
- **2026-08-24 — `ext/` admits a method.** Placing DBE there decides it. The grouping states what a
  thing is to the project rather than what kind of thing it is, so a method qualifies on the same
  ground a language's conventions do.

## Premise

**As the engineer stated it:** the DBE package should be an `ext/` package.

## What it would settle immediately

**A content project would not install it**, which is the question parked hours earlier in *A
content project does not start with Design By Efferent active*. That idea named two remedies — not
installed, and not active — and said the second has no mechanism at all. This makes the first one
natural: an `ext/` package is outside the default distribution, so a project takes it or does not.

**The local rule written the same day becomes unnecessary.** *Design By Efferent does not govern
content work* is an interim, standing in for a mechanism that does not exist. If DBE leaves the
default distribution, nothing has to say it does not govern — it is simply not there.

## What it costs the grouping

**`ext/` names what a thing is to the project rather than what kind of thing it is.** External, or
an extension. A method satisfies that where a name meaning *tool* did not, which is why this
record's pressure on the grouping produced a rename rather than an exemption.

**The property that motivates the move is being specific to something not every project uses.**
That is what DBE and `ext/ruby-lang` share, and it is what `ext/` states.

**Whether the grouping admits a method is settled above.** The rename removed the objection that
came from the name, and placing DBE there answers what the name alone could not.

## `testing` has the same property

**Controls-based test conventions are as code-specific as DBE is.** A content project has no
suite, no controls, and no assertion form. If the reason to move DBE out is that a content project
has no use for it, the same reason reaches `testing`.

**And DBE includes `testing`**, so a project taking `ext/design-by-efferent` gets it either way.
What changes is what a project that takes neither ends up with.

## What is not settled

- **Whether `testing` moves too**, and whether the two move together or separately.
- **What becomes of `logs/loops/`**, which design-by-efferent contributes. `foundation`'s
  logs-directory rule names it as a citation rather than a dependency, so a project without DBE is
  already fine — but the README's directory map assumes it.
- **The cost of the move itself.** A package changing its path does not fast-forward on publish,
  which `CONTRIBUTING.md` states and which the Ruby move paid.

Related:

- *The grouping is `ext/`, for external and extension both* — the record that answers this one's
  pressure on the grouping, and which cites this one as the member that exposed it
- *A content project does not start with Design By Efferent active* — the parked question this
  would answer
- *Waytide for content and web* — the feature underway, and the reason this came up
- the `ext/ruby-lang` package — the one worked precedent for a package leaving the default set

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:16:27 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:12:39 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:17:55 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 10:31:30 PM PT
