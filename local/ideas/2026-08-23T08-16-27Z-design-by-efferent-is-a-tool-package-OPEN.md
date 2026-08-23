# Design By Efferent is a `tools/` package

- **State:** Open
- **Tags:** [aspiration]

**Why this state:** the direction is stated and it puts pressure on what `tools/` means. DBE is a
**method** rather than a tool, and the grouping's admission question was already the open one. It
is promoted to `Active` once it is decided whether the grouping admits it, and under what name.

## Premise

**As the engineer stated it:** the DBE package should be a `tool/`.

## What it would settle immediately

**A content project would not install it**, which is the question parked hours earlier in *A
content project does not start with Design By Efferent active*. That idea named two remedies — not
installed, and not active — and said the second has no mechanism at all. This makes the first one
natural: a tool package is outside the default distribution, so a project takes it or does not.

**The local rule written today becomes unnecessary.** *Design By Efferent does not govern content
work* is an interim, standing in for a mechanism that does not exist. If DBE leaves the default
distribution, nothing has to say it does not govern — it is simply not there.

## What it costs the grouping

**`tools/` groups by the tool a project uses, and DBE is not a tool.** It is a design method.
`ruby-lang` is a language, and the `tool/` idea already listed a language, a test framework, a
package manager, and a build system as the readings a tool might take. A method is none of them.

**The property that actually motivates the move is different from the one the name states.** What
DBE and `tools/ruby-lang` share is that they are **specific to something not every project uses**.
That is not the same as being a tool, and the grouping is named for the second.

**So either the grouping means something wider than its name says, or DBE wants a different
one.** That is the admission question the `tool/` idea left for the second member to settle, and it
arrives here rather than with the content package.

## `testing` has the same property

**Controls-based test conventions are as code-specific as DBE is.** A content project has no
suite, no controls, and no assertion form. If the reason to move DBE out is that a content project
has no use for it, the same reason reaches `testing`.

**And DBE includes `testing`**, so a project taking `tools/design-by-efferent` gets it either way.
What changes is what a project that takes neither ends up with.

## What is not settled

- **Whether `tools/` admits a method**, or whether the grouping needs a different name for what it
  actually collects.
- **What the package is called there.** `tools/design-by-efferent`, `tools/dbe`, or something the
  grouping's answer suggests.
- **Whether `testing` moves too**, and whether the two move together or separately.
- **What becomes of `logs/loops/`**, which design-by-efferent contributes. `foundation`'s
  logs-directory rule names it as a citation rather than a dependency, so a project without DBE is
  already fine — but the README's directory map assumes it.
- **The cost of the move itself.** A package changing its path does not fast-forward on publish,
  which `CONTRIBUTING.md` states and which the Ruby move paid.

Related:

- *The grouping is `tool/`, not a language* — the admission question this arrives at
- *A content project does not start with Design By Efferent active* — the parked question this
  would answer
- *Waytide for content and web* — the feature underway, and the reason this came up
- the `tools/ruby-lang` package — the one worked precedent for a package leaving the default set

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:16:27 AM PT
