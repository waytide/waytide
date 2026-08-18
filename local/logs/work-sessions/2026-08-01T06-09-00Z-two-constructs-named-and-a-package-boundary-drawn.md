# Session — Two constructs named, a package boundary drawn, and every package published (Fri Jul 31 2026 23:09)

The continuation of the work recorded in
`2026-07-30T21-29-55Z-the-notice-closes-on-its-command.md`, which closed with the precondition
registered as a deferred item. What followed carried that item out and went further than it:
**precondition** and **exceptional path** were settled as terms and written as rules, a
deferred investigation was removed, restored, and then carried out, and settling it produced a
rule nobody set out to write — what makes a reference to another package a **dependency**
rather than a **citation**. The session ended with all five changed packages published.

*This is the communicable record — the guided tour. It is not the source of truth. The durable
records are the rules under `system/`, the decision log under `local/log/`, the observations
under `local/observations/`, and the deferred queue under `local/deferred/`; this narrative
points to them and preserves the reasoning between them.*

## 1. The status line, which was never broken

The status line was reported missing. Everything in the repository checked out — the script
exists, is executable, and renders `waytide · master :: Waytide` correctly;
`.claude/settings.json` declares it; `WAYTIDE_QUIET` is unset; no competing status line is
configured.

The cause is outside the repository. `~/.claude.json` records `hasTrustDialogAccepted: false`
for this project, and the harness carries an explicit path for it — *"Status line command
skipped: workspace trust not accepted."* A project-supplied status line is gated on that
acceptance, which is the developer's to give.

One thing did not fit and was reported rather than smoothed over: the `SessionStart` hook from
the same file **did** run. Hooks and the status line are not gated identically, and only the
status line's gate is observable from here.

I also reported the script missing before finding this, which was my own error — the shell had
drifted into `local/deferred/` from an earlier listing, so the relative path resolved nowhere.

## 2. The precondition, twice

**The first pass.** The deferred item asked what a precondition is and how its condition is
expressed. Rather than reason from the rules alone, the question went to real code: **1,009
bare assertions sit in files that also contain `test` blocks, across 485 files** in the
Eventide projects. A further 321 are the older style where the file has no `test` block and
the bare assertion *is* the test — a different thing, left alone. This was documenting
established practice, not inventing a convention.

Two decisions were put through the selection UI and settled:

- **The predicate reads inline**, with no explaining variable — making a precondition the
  stated exception to test-block-is-assertion-only. The rule gives the reason rather than
  merely the exception: a precondition has one operand, so nothing is buried in a nested
  expression, and a bound name would only restate the predicate.
- **It sits immediately before what it qualifies** — the actuation for a condition about the
  controls, the test for a condition about a derived value. One principle, both observed
  positions.

**The second pass reframed it, and the reframing was the better one.** The rule as first
written made the criterion *"the test could pass without exercising what it names"* — a
special case. The general purpose is **documenting the factors that decide the outcome** where
the test script does not express them, and **the controls are the chief case**: a control is
named rather than described, so `Controls::Account::Sequence.example` says nothing about which
positions that account has processed, and the fact that decides the outcome lives in another
file. The vacuous-pass case was demoted to a consequence.

That reframing also supplied a justification the first pass lacked. A precondition **documents
by asserting**, so the clarification is *checked*. A `comment` would state the same factor and
never be verified, drifting from the control while still reading as true. That is why the
inline-predicate choice was right on its own merits and not merely as taste — and the rule now
says outright not to write one as a comment.

The rule was renamed to say what it says:
`precondition-documents-deciding-factors-and-reads-inline.md`.

## 3. Exceptional paths

A rule was supplied for the `testing` package: a feature's normal path and each of its
exceptional paths are separate test files, because an exceptional path cannot share the normal
path's single actuation — the actuation sits inside an `assert_raises`, produces no result to
observe, and leaves the normal path's outcomes unestablished.

The supplied text had a clause cut mid-sentence and an unmatched parenthesis in its naming
paragraph. Rather than paper over it, the gap was flagged and completed from the rule's own
How-to-apply line, which supplied the intent.

**Then the term itself was corrected: *exceptional* path, not *exception* path.** This closed a
drift raised when the rule was added — the `language` vocabulary settles **normal path** and
names the raising cases *"error cases" / "exceptional cases"*, and "exception path" was a third
form. The rule and its filename were conformed, and the vocabulary's normal-path row now names
the path form and rules out "exception path" explicitly, so the next rule reaching for a
counterpart to "normal path" finds it settled. Bare "exception" was kept where it names the
raised error rather than the path.

## 4. An item removed, restored, and printed

The test-output-display investigation item was removed. It was deleted and logged as
**withdrawn** rather than carried out, because the investigation had not been done and the
queue should not imply otherwise. Its four observations were not promoted, and that was said
plainly rather than left implicit.

It was then restored. The file came back byte-identical from the commit that removed it, and
the restoration was logged **beside** the withdrawal rather than in place of it — the decision
log is append-only, and deleting the earlier entry would have erased the fact that the
withdrawal was decided at all.

## 5. The investigation, and four observations

The item's four questions were investigated by reading the named rules together. Four findings
were recorded under `local/observations/` — **a directory this repository did not have until
now** — with a log entry each. No rule was edited, because the item gates rule changes on the
findings being settled first.

Two findings were larger than the item had recorded:

- **The `git` package.** The item noted the hardcoded `ruby test/automated.rb`. Two more turned
  up: `0 failed, 0 aborted` is **TestBench's own output line**, not a general phrasing, so the
  package carried a language, a framework, *and* that framework's output; and `git` makes
  **four cross-package references** while declaring it includes none.
- **The context trees.** Not a drift but an outright contradiction. `test-tree-command` says
  produce the tree from the run, *not* the source, and gives the reasons — a dynamic
  `context <expr>` reads as a placeholder in source and its real value in a run, and a bare
  `test do` exists in source and emits no line. `test-report-format` derived from the
  declarations and so inherited **both** errors. `status-report-format` required the run but
  described its levels in source vocabulary, leaving those cases undetermined.

## 6. The separation criterion

The proposal was that anything necessarily bound to Ruby and TestBench move to the Ruby
package. The word *necessarily* was doing the work, and the two readings differed enormously —
a broad reading would relocate **13 of the 19 `testing` rule files**, emptying the package.

The criterion was then stated properly, and it is better than the one being applied: **split
when the general can be separated from the specific and the general is not anemic.** The test
is the quality of what is left behind, not whether a stack is mentioned.

Applied item by item it yields exactly two splits. Everything else stays, including the eleven
`testing` rules carrying Ruby code blocks — an example is not a separable part of a rule, it is
the rule's own exposition, and moving examples away from what they illustrate damages both.

## 7. What a dependency is

Placing the Ruby residue raised a question that had to be settled first: does citing another
package's rule create a dependency? A full survey answered it decisively.

**Six of seven packages reference packages they do not declare, and `foundation` — declaring
"nothing, the base every other package builds on" — cites all six built on top of it, across
eleven rules.** If a citation were a dependency, `foundation` would depend on
`design-by-efferent`, which declares a dependency on `foundation`. The graph cycles, so that
reading is not available.

The criterion was already **practiced and unstated**. `agent-features-convention` is at once a
`foundation` rule citing `design-by-efferent`'s loop-records rule and the rule explaining why
it must not depend on it — requiring fields in `local/loops/` *"would invert the package graph,
and would make the feature lifecycle unavailable to a project that installs `foundation`
alone."* It cites freely and refuses to require.

**Settled:** a citation is not a dependency unless the citing rule **will not work** without
the cited package. Motivation deliberately does not count — a declared dependency obliges an
install, so declaring merely helpful ones would make every install drag in the whole system.
Written as the `foundation` rule `a-citation-is-not-a-dependency`; the observation was kept as
the discovery record with its status changed to promoted.

It decided the case that raised it: a Ruby tree-script rule **works** without `testing` and
only lacks motivation, so `code/ruby` takes no dependency edge and stays at
`foundation, language`. **No declaration anywhere in the system changed** — including `git`'s
standalone claim, which survives its four citations, because the claim is about what must be
installed rather than about what a rule's prose may name.

## 8. The splits, and the trees

**The splits were executed.** `run-suite-before-commit` keeps its whole substance — the suite
run is a precondition of the commit decision — and no longer names a command or an output
string. `test-tree-command` keeps what the tree is and that it comes from the run, and no
longer mandates a script no package ships. Both residues went into one `code/ruby` rule,
`running-the-test-suite`, since both are about running a Ruby suite and reading its output.
`git` and `testing` now contain no stack specifics at all.

**The trees were conformed to the run.** `test-tree-command` already had the reasons and they
hold, so `test-report-format` and `status-report-format` were changed to derive the tree from
the run's output. One thing was deliberately *not* changed: the rest of the test report stays
source analysis — classifying by subject, structural style, and assertion kind means reading
the files — and the rule now says so, so it is not read as a blanket conversion.

**The fourth question was disregarded** on instruction. Its observation is kept, unpursued. The
deferred item was then deleted and logged as carried out, with the log naming the disregarded
question so the record does not overstate what was settled.

## 9. Published

All five changed packages were published, each checked for direct commits first and each a
fast-forward with no force: `testing` (`39b2218..7f4b62d`, six commits), `foundation`
(`4f8a875..1329ba3`), `language` (`89a5a4e..fc2bc60`), `git` (`860e420..baf46f2`), and
`code-ruby` (`200bcc4..12f2b40`). The direct-commit check was clean again afterward.

## Takeaways

- **A convention worth writing is usually already being practiced.** Preconditions existed
  1,009 times before any rule named them; the citation-versus-dependency criterion was being
  followed by every package declaration and stated in none. Both rules describe practice rather
  than impose it, and both were checked against the real artifacts before being written.
- **The reframing of the precondition was the substantive move.** Purpose — documenting the
  factors that decide an outcome — is general where "the test might pass vacuously" is one
  case. It also explained why the construct is an assertion: documentation that is checked
  cannot drift from what it documents.
- **A package's claim about itself is about installation, not vocabulary.** That is what lets
  `git` be standalone and cite four packages, and it is the distinction that stopped a
  correct-looking cleanup from cycling the package graph.
- **Separate the general from the specific only when the general survives it.** The test is
  whether what remains is anemic, which keeps a criterion about stacks from gutting a package
  whose rules merely show code.
- **Append, never rewrite, the record.** The withdrawn deferred item, its restoration, and the
  superseded term all stayed in the log as written.

## Glossary

- **precondition** — a bare `assert` or `refute` that is not a test, written to document a
  factor that decides the test's outcome where the script does not express it, most often a
  property of a control. It documents by asserting, so the clarification is checked. It
  qualifies the test rather than protecting behavior: a failed precondition makes the result
  *meaningless*, not wrong.
- **exceptional path** — the course through a raising case, the counterpart to the **normal
  path**. Never "exception path"; the raising cases themselves remain "error cases" /
  "exceptional cases".
- **citation** — a rule naming another package's rule for orientation, contrast, or fuller
  treatment. It creates no dependency and is declared nowhere.
- **dependency** — a relation where the citing rule **will not work** without the cited
  package. It is declared in the package README and installed by `install-dependencies.sh`.
  Motivation does not make one.
- **anemic** — of the general part left behind after a specific part is separated out: too
  thin to stand as a rule on its own. The test for whether a general/specific split should be
  made at all.

## Where the durable records live

- **New rules** — `system/testing/precondition-documents-deciding-factors-and-reads-inline.md`,
  `system/testing/normal-path-and-exceptional-paths-are-separate-files.md`,
  `system/foundation/a-citation-is-not-a-dependency.md`,
  `system/code/ruby/running-the-test-suite.md`.
- **Changed rules** — `system/testing/test-block-is-assertion-only.md` (the stated exception),
  `system/testing/test-report-format.md` and `system/foundation/status-report-format.md` (trees
  from the run), `system/git/run-suite-before-commit.md` and
  `system/testing/test-tree-command.md` (stack specifics removed),
  `system/language/vocabulary.md` (the exceptional-path term), `system/testing/vocabulary.md`
  (the precondition term).
- **Observations** — `local/observations/`, created this session: the `git` standalone claim,
  the unshipped tree script, the unbounded verbose output (kept, unpursued), the context-tree
  disagreement, and the citation-versus-dependency record, now marked promoted.
- **The log** — every decision above, including the withdrawal and restoration of the deferred
  item, and the five publishes.
- **The deferred queue** — nine items; the test-output investigation was carried out and
  deleted, and preconditions before it.

## A closing note

The session's most useful rule was not on anyone's list. The citation-versus-dependency
criterion came up only because a small relocation needed to know whether one line in a README
should change, and answering it properly meant surveying every package — which showed the
question had one available answer, the system had been following it all along, and nothing
needed to change. The tidy-up that prompted it turned out to be two files.

---

Authored by Scott Bellware on Fri Jul 31 2026 at 11:09:00 PM PT
