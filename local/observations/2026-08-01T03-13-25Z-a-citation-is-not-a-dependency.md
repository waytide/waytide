# A citation is not a dependency — the criterion is availability, and the system already practices it

**Status:** **promoted** on Fri Jul 31 2026 — this is now the discovery record, not a working
hypothesis. The criterion was ratified as the `foundation` rule
`a-citation-is-not-a-dependency`: a citation is not a dependency unless the citing rule will
not work without the cited package. The borderline below was decided with it — a `code/ruby`
tree-script rule **works** without `testing` and merely lacks motivation, so it is a citation
and `code/ruby` takes no dependency edge. No package's declared dependencies changed.

**The survey.** Every package but one references packages it does not declare:

| Package | Declares | Also references |
|---|---|---|
| `foundation` | nothing — the base | `code/ruby`, `design-by-efferent`, `git`, `language`, `plan`, `testing` |
| `language` | `foundation` | `design-by-efferent`, `testing` |
| `testing` | `foundation`, `language` | `code/ruby` |
| `design-by-efferent` | `foundation`, `language`, `testing` | — |
| `git` | nothing — standalone | `design-by-efferent`, `language` |
| `code/ruby` | `foundation`, `language` | `testing` |

Eleven `foundation` rules cite another package, among them features-convention,
rules-convention, file-names-use-iso8601-utc-prefix, and
announce-waytide-at-session-start.

**The reading that a citation is a dependency collapses.** It would make `foundation` depend
on `design-by-efferent`, which declares a dependency on `foundation` — a cycle — and would
make the base package depend on all six packages built on it. Only `design-by-efferent`, which
happens to sit at the bottom of nothing, would be unaffected. So the question is not open in
the way it appeared: one of the two answers is not available.

**The criterion is availability, and it is already in the system's own words.**
`features-convention` is at once a `foundation` rule citing `design-by-efferent`'s
loop-records rule and the rule explaining why it must not depend on it — requiring fields in
`waytide/local/loops/` "would invert the package graph, and would make the feature lifecycle
**unavailable** to a project that installs `foundation` alone." It cites freely and refuses to
require. So:

- A **dependency** exists where the rule **cannot be applied at all** without the other
  package's content. It is declared, and `install-dependencies.sh` installs it.
- A **citation** is where the rule stands and applies on its own, naming a sibling for
  orientation, contrast, or a fuller treatment of something it touches. It is not declared and
  nothing installs it.

`status-report-format` is the model citation: it names `testing` and is written for its
absence — "If the project has not adopted the testing conventions, degrade this section."

**Corrected 2026-08-03 — one declaration was wrong, and the package is gone.** The survey read
`plan`'s standalone claim as surviving its references to `foundation`. It did not: every rule in
that package was addressed to `waytide/local/plans/` or `waytide/local/design/`, directories only
`foundation` creates, so the rules would not work in a project without it. That is the criterion
this observation states, applied to the one case the observation itself got wrong — the survey
checked whether a reference was *merely* naming, and did not check whether the referring rule had
anything to govern without the referent. **`plan` was folded into `foundation` on 2026-08-03**,
and its row is dropped from the table above; the row read
*`plan` | nothing — standalone | `foundation`, `git`*.

**Under this criterion no declaration now in the system is wrong.** `git`'s standalone
claim survives its four references, because the claim is about what must be installed, not
about what its prose may name. The same holds for `versioning`, and for `foundation` citing
everything. What was recorded as a defect in the sibling observation on `git` is, on this
reading, only the runner — a project without Ruby genuinely cannot apply
`run-suite-before-commit` as written — and not the cross-references.

**The borderline case, which is what prompted this.** A `code/ruby` rule carrying the
TestBench tree script would cite `testing`'s test-tree command. The script still runs without
`testing` installed, so by a literal availability test it is a citation. But elsewhere the
cited package's absence leaves **one clause** inert, where here it leaves the rule's **entire
motivation** absent: the script exists to implement a command that would not be defined. So
the open question is narrow and precise — **does "unmotivated" count as "unavailable"?** A
criterion that answers only about applicability says citation; one that asks whether the rule
still has a reason to exist says dependency.

**What ratifying this would require.** The criterion is currently practiced and unstated, so
it is discoverable only by reading `features-convention`'s aside. As a rule it belongs in
`foundation`, which owns the package system, and it would give both the test and the two
worked examples above — the model citation that degrades, and the refused dependency that
would have inverted the graph.

**How it was settled.** The criterion was ratified as stated, with the test fixed at whether
the rule **works** rather than whether it is motivated — which decided the borderline against a
dependency edge. The rule is `system/foundation/a-citation-is-not-a-dependency.md`; it carries
the test, the two worked examples above, and the graph-cycle argument for why the alternative
reading is unavailable.

---

Authored by Scott Bellware on Fri Jul 31 2026 at 8:13:25 PM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 10:42:45 PM PT
