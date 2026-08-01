# A citation is not a dependency — the criterion is availability, and the system already practices it

**Status:** a working hypothesis under discovery, produced by the test-output-display
investigation while settling where Ruby-specific material belongs. It is promoted once the
criterion is ratified as a rule and the one borderline case below is decided. Nothing is
changed by it as it stands — under this reading no package's declared dependencies are wrong.

**The survey.** Every package but one references packages it does not declare:

| Package | Declares | Also references |
|---|---|---|
| `foundation` | nothing — the base | `code/ruby`, `design-by-efferent`, `git`, `language`, `plan`, `testing` |
| `language` | `foundation` | `design-by-efferent`, `testing` |
| `testing` | `foundation`, `language` | `code/ruby` |
| `design-by-efferent` | `foundation`, `language`, `testing` | — |
| `git` | nothing — standalone | `design-by-efferent`, `language` |
| `plan` | nothing — standalone | `foundation`, `git` |
| `code/ruby` | `foundation`, `language` | `testing` |

Eleven `foundation` rules cite another package, among them agent-features-convention,
agent-rules-convention, agent-file-names-use-iso8601-utc-prefix, and
announce-waytide-at-session-start.

**The reading that a citation is a dependency collapses.** It would make `foundation` depend
on `design-by-efferent`, which declares a dependency on `foundation` — a cycle — and would
make the base package depend on all six packages built on it. Only `design-by-efferent`, which
happens to sit at the bottom of nothing, would be unaffected. So the question is not open in
the way it appeared: one of the two answers is not available.

**The criterion is availability, and it is already in the system's own words.**
`agent-features-convention` is at once a `foundation` rule citing `design-by-efferent`'s
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

**Under this criterion no declaration currently in the system is wrong.** `git`'s standalone
claim survives its four references, because the claim is about what must be installed, not
about what its prose may name. The same holds for `plan`, and for `foundation` citing
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
it is discoverable only by reading `agent-features-convention`'s aside. As a rule it belongs in
`foundation`, which owns the package system, and it would give both the test and the two
worked examples above — the model citation that degrades, and the refused dependency that
would have inverted the graph.

---

Authored by Scott Bellware on Fri Jul 31 2026 at 8:13:25 PM PT
