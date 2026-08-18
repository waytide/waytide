# The three context-tree rules disagree on whether the tree comes from the source or from a run

- **State:** Open
- **Tags:** [observation]

**Why this state:** a working hypothesis under discovery, produced by the test-output-display investigation. It records a contradiction between three rules currently in force; it settles nothing. It is promoted once it is decided which derivation is correct and the other rules are conformed to it.

Three rules produce a context tree from the same suite, and each says something different
about where the tree comes from.

- **`test-tree-command` (`testing`) — the run, explicitly not the source.** *"**Produce it from
  the run's output, not the source.** The tree is built by running the suite (with narration
  output suppressed), capturing the output, and parsing *that*."* It gives a reason: *"Because
  it comes from the run, a dynamic `context <expr> do` shows its **expanded real value**, not
  the source placeholder; a bare unnamed `test do` produces no line, so its enclosing context
  becomes the leaf."*
- **`status-report-format` (`foundation`) — a run, described in source terms.** *"Confirm the
  suite count and the two-level context tree by **running the suite** rather than asserting
  them; the two levels are the first two nesting depths of `context "…"` declarations,
  excluding comment and assertion lines."* It requires the run and then identifies the levels
  by what the source declares.
- **`test-report-format` (`testing`) — the source.** *"read the automated suite and render the
  sections from current state … **derive the hierarchy from the first two nesting depths of the
  `context "…"` declarations**."* It never instructs a run at all; its standing instruction is
  *"Re-derive everything from the current files — read the tests."*

**The disagreement is not cosmetic, and `test-tree-command` already says why.** Its two stated
cases are exactly where source and run diverge: a dynamic `context <expr> do` reads as a
placeholder in the source and as its expanded value in a run, and a bare unnamed `test do`
appears in the source and produces no line in a run. A tree derived from declarations is
therefore **wrong in those cases** — it prints the placeholder and counts a leaf that the run
does not emit. `test-report-format` derives from declarations, so it inherits both errors;
`status-report-format` requires the run but describes its levels in the vocabulary of
declarations, so what it does in those cases is undetermined.

**The rules point at each other while disagreeing.** `test-report-format` defers to the
foundation rule for the rendering — *"See the status-report rule (in `foundation`) for the
rendering"* — and names `test-tree` as a companion; `status-report-format` names both testing
commands in its Related line. Three cross-referencing rules present as one convention and are
not one.

**A second, separate question sits underneath.** `status-report-format` lives in `foundation`
and is *"convention-aware of the testing package"*, degrading when a project has not adopted
those conventions. `foundation` includes no package, and `testing` includes `foundation`, so a
foundation rule that knows about `testing` points against the package graph. The conditional
degradation is what keeps that tolerable rather than broken — but it is the same inversion the
features-convention refused elsewhere, on the ground that *"a foundation rule requiring
fields in that directory would invert the package graph."* Whether this instance is acceptable
where that one was not is its own question.

---

Authored by Scott Bellware on Thu Jul 30 2026 at 7:03:39 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:21:39 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:25:14 PM PT
