# Work Session — A stated convention gets its detector (Thu Aug 6 2026 00:34)

The work session began with the deferred queue holding one item — a check that would report a
rule naming one mode's planning directory without the others — and the item's own instruction to
settle a question before writing anything: whether a rule that is *about* the planning artifacts
can be told mechanically from one that merely *mentions* them. It became an argument that the
question did not have to be answered, because the defect the convention exists to prevent has a
shape that correctness does not have. It ended with the check written, eleven findings corrected
along with an eighth site the check cannot see, three commits, `foundation` published, and the
check's own blind spot registered as the queue's new item.

**This is the communicable record — the guided tour, written to be read.** It is not the source of
truth. The durable records are the two decision-log entries, the new deferred item, the check
script and its section in `CONTRIBUTING.md`, and the eight corrected files in
`system/foundation/`. This narrative points at them and preserves the reasoning between them.

## 1. The queue, and an item that had fallen behind

The rule read produced a queue of one: the mode-directory check, ranked 1, gated on nothing. Asked
to explain it, the account surfaced two things the item said and one it did not. It said the check
should copy `report-direct-commits.sh` — read-only, run before publishing, non-zero on a finding —
and that the *about* versus *mentions* question decided whether the check would be precise or
merely advisory. What it did not say was that it had been written when Waytide had two modes. OODA
mode had since added `orientation/` and `action/`, and the rule the item cited had been renamed
from `a-project-works-in-formal-or-intuitive-mode` to
`a-project-works-in-a-mode-chosen-at-initiation`.

A deferred item is a live, forward-looking artifact, so it is reconciled rather than left as
written. Four changes: the title said *without the others*, the directory list gained OODA's pair,
an about-rule's finding became *naming fewer than all three pairs*, and the citation took the
rule's current name. The phrase *wrong in every intuitive project* also became *every
intuitive-mode and OODA-mode project*, which the mode rule requires — *an intuitive project* reads
as a project that is easy to understand.

## 2. The question the item was gated on, and why it went away

Taking the item up meant confronting its unsettled question first. Two greps over `system/`
answered it in a way the item had not anticipated.

Twelve files named a planning directory. Five named every directory of every triple they touched
and were correct. Seven named some but not all — and **every** correct file had the same property
and every defective one lacked it. That is the finding the rest of the work rests on: the three
directories of an artifact are named together or not at all, because there is no reason to name
`plans/` and `intention/` and stop. A partial set is produced only by a defect.

So the check needs no notion of what a rule is *for*. It enforces the half of the convention where
being wrong sends a reader to a directory that does not exist, and that half is visible in the
directory names alone. The item had framed the problem as needing the classification and found
both ways of getting it bad — a maintained list is the drifting corpus this system argues against,
and inferring the class from a filename is a guess that eventually misfires. Neither is needed.

Three candidates were put through the selection interface. The developer asked for worked output
before deciding, and producing it corrected two of the agent's numbers — eleven findings rather
than seven, eighty-three advisory lines rather than about thirty-four — and **exposed a defect in
one of the options as it had been stated**. *A declared about-rule must name all six directories*
is wrong: `design-document-format` is about the direction artifact and never discusses the
sequencing one, so it names three and would have been reported for the three it correctly omits.
The declared variant is therefore not an alternative to the triple test but the triple test plus
one added strictness. Writing the example is what found that; the option as first put would have
been chosen on a false description.

**Triple completeness was chosen**, on a recommendation resting on three points: it is the only
one of the three quiet when the tree is correct, nothing is foreclosed because the declared
variant sits on top of it, and the convention it would otherwise add costs a line in five rules
and every future author's memory to catch a defect that misdirects nobody.

## 3. The check

`report-partial-planning-directories.sh` at the composite root, beside `report-direct-commits.sh`
and `read-consuming-projects.sh`. The item had left the location open and argued for the root
itself — the check reads the packages' own prose, which a consuming project has no use for — so
the argument was taken rather than re-put.

It reported eleven findings in seven files and exited 1. The clean path had never run, so it was
verified against a scratch tree holding only the five correct files: one line, exit 0. The
executable bit was set at creation, per the project's local rule, and the file opens `#!/bin/sh`.

## 4. The eighth site, and the blind spot that hid it

Reading each finding to state its remedy turned up a site the check does not see.
`session-start.sh` builds the instruction the agent receives at the start of every session, and its
text named the working directories as bare words in a comma run — *log, deferred, design, plans,
work-sessions, …*. No slashes, no backticks, so the check's pattern matched nothing.

This is the sharpest thing the work session produced. **The check's blind spot hid the site with
the widest reach in the system** — not a rule someone might follow, but the instruction every
session actually delivers. It was found by reading, which is exactly what the check exists to stop
depending on. And it cannot be closed the obvious way: matching a bare `design` fires on every
ordinary use of the word.

## 5. The corrections

Six rules merely mention one of the planning artifacts and now name no mode's directory, taking
the covering terms the mode rule supplies — *the direction artifact*, *the sequencing artifact*,
*the project's planning directories*. `install.sh` was the one site that **completes** rather than
generalizes: its comment is about the mode variation itself, so it gained OODA's pair, because
generalizing would cost the comment the enumeration it exists to give. `session-start.sh` moved
with `announce-waytide-at-session-start`, which documents the instruction it builds — correcting
one alone would have put a rule and the script it describes into disagreement.

The verification available was not a test suite; this repository has none. What stood in was the
check itself, a parse of the hook script's JSON output, and `sh -n` on `install.sh` — the two
scripts whose failure mode is silent. The announce rule is explicit that malformed hook output
makes the notice disappear with no error at all, so parsing it was the point rather than
diligence.

## 6. Committing, resolving, publishing

Three commits, so the tool, its first use, and the item's resolution read separately. Nothing
cited the deferred item, so there was nothing to reconcile before deleting it; `git rm -f`
discarded the reconciliation made in section 1, which never reached the history.

Two questions the item raised were not answered by the work, and were registered as a new deferred
item rather than lost with the file: whether the check should carry a neighbour-count pattern for
the plain-prose list form, and whether a consuming project's local rules want a check — a
different test, since a consuming project works in one mode and its question is whether a rule
names a directory that project does not have.

`foundation` was then published. Both pre-publish checks passed, the fast-forward guard held
before any push, and one commit split out — the corrections — since the other two touched only the
repository root and `local/`, neither of which is inside the package.

## Takeaways

- **A convention's defect often has a shape its correct instances do not.** Where it does, a check
  can find the defect without understanding the convention. That is what made the classification
  question unnecessary rather than answered.
- **Producing the worked output is what tested the options.** It corrected two numbers and killed
  a description that would otherwise have been chosen on false terms. An option set is a claim
  about consequences, and the consequences were not known until they were derived.
- **A partial check invites the belief that the class of defect is handled.** That is the more
  expensive half of its incompleteness, and it is why the blind spot went into the queue rather
  than into a comment.
- **The site with the widest reach was the one the check could not see.** Detection built around
  one written form will miss the same content in another, and the missed form is not more obscure
  for being harder to match.

## Glossary

- **mode triple** — the three directories one planning artifact takes across the three modes:
  `design/`, `aspiration/`, `orientation/` for the direction artifact, and `plans/`, `intention/`,
  `action/` for the sequencing one. Settled here as the unit the check reasons over.
- **a triple named in part** — the defect the check reports: a file naming one or two members of a
  triple. Correct files name three or none.
- **triple completeness** — the check's basis, chosen over classifying rules by purpose.

## Where the durable records live

- **The check** — `report-partial-planning-directories.sh` at the composite root, and its section
  in `CONTRIBUTING.md` under *Publishing a package*.
- **Decision log** — `2026-08-06T07-15-53Z-partial-planning-directory-check-reports-an-incomplete-mode-triple.md`
  (the basis, and why the gating question was unnecessary) and
  `2026-08-06T07-25-26Z-the-planning-directory-check-is-built-and-its-deferred-item-is-resolved.md`
  (the item carried out).
- **The queue** — `2026-08-06T07-25-25Z-what-the-planning-directory-check-does-not-reach.md`, the
  plain-prose form and the consuming-project question.
- **The corrections** — eight files under `system/foundation/`, in commit `8e958f8`, published to
  `waytide/foundation` as `50a7ae1`.

## A closing note

The work session's shape was set by an item that told the work to settle a question first. It was
right to insist, and wrong about which question — settling it consisted of discovering it did not
need an answer. The deferred item's real contribution was the insistence, not the framing, which
is an argument for registering an item while the material is at hand even when the thinking about
it is not yet finished.

---

Authored by Scott Bellware on Thu Aug 6 2026 at 12:34:11 AM PT
