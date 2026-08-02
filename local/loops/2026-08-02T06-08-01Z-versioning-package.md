# Loop record — the versioning package

The feature adds a `versioning` package holding what a version means and how the next one is
chosen. Its lifecycle record is
`waytide/local/features/2026-08-02T06-08-01Z-versioning-package.md`.

The five hinges govern designing a unit from its efferent side against a test. This feature
produces rules, so the passes below are the design decisions the work actually turned on.

## Pass 1 — Which package the rules belong to

**Hinge:** the deferred item named this as the first thing to settle, suggesting the rules
might want a package of their own.

**Options:** split between `git` and `code/ruby`; a new package for everything; all of it in
`code/ruby`.

**Decision / chat:** the developer asked what content would fall on each side of a `git` /
`code/ruby` split before choosing, and the answer settled it — the split leaves a residue that
fits neither. `git` gets the commit form, which it **already has**; `code/ruby` gets the
mechanics; and the two points the item lists first — what the version means and who chooses it
— belong to neither. The developer then stated the governing constraint: the versioning should
have **no knowledge of Ruby particulars**, even though everything released under it is a Ruby
gem. A third package.

## Pass 2 — What the scheme actually is

**Hinge:** the item said the rules must account for two schemes, three segments and four.

**Options:** none — not gated. Corrected by evidence and then by the developer.

**Decision / chat:** a survey of ten Eventide gems found **all four-segment, all generation 2**,
so the three-segment form appeared nowhere but in an example inside `git`'s subject-first rule.
The developer then supplied what the segments are: semver, more or less, with the first of four
being a **product generation number** that changes only when an entirely new product line is
declared — *a product management decision, not a technological compatibility matter as per
semver*. So it is not two schemes but one, optionally prefixed. Two consequences followed and
were surfaced rather than gated: the generation is never a release-time decision, and it is not
a technological convention at all, which is why it sits outside both `git` and `code/ruby`.

## Pass 3 — The package name

**Hinge:** what to call it. The developer asked directly, offering "package release" and
"packaging" and saying they did not know which.

**Options:** `package release`; `packaging`; `version`; `versioning`; `version numbers`.

**Decision / chat:** neither of the developer's two candidates — both name **acts** whose
substance had just moved to `code/ruby`, bundling a distributable and publishing it. What
remained was not an act but a meaning. `version` was rejected as the value rather than the
practice, and the developer supplied the decisive objection: **a reader seeing
`waytide/version` could take it for the version of Waytide rather than of the things made with
it**, where every other component repository name is a subject Waytide governs. `versioning`,
matching `testing` as a package named for a practice.

## Pass 4 — Interruption: the feature could not be initiated as the rules stood

**Hinge:** not about versioning at all. Putting the working location to the developer surfaced
that the feature lifecycle offered only two options.

**Options:** rename the feature rule; keep the name and narrow the clause; keep the name and
make the option exceptional.

**Decision / chat:** the developer specified a third working-location option — the feature
built on the current branch — for **features only, never experiments**. That contradicted the
rule's first clause and its name. Rename, and the developer extended it: if the feature rule
becomes `feature-lifecycle`, the experiment rule becomes `experiment-lifecycle`. Agreed, and
not only for symmetry — `experiment-runs-on-its-own-branch` named one of sixteen clauses in a
rule that settles the whole lifecycle, so it understated itself the same way, and always had.
The developer then specified the option's **position**: last, after the two branching options.
The reason holds — a selection's first option reads as recommended whatever the rule says about
defaults, and the current branch is the one that gives up isolation.

This feature was then initiated **on the current branch**, the first to take the option.

## Pass 5 — The draft, and four questions against real text

**Hinge:** four questions the feature record left open, put to the developer against the
drafted package rather than in the abstract.

**Options:** each question carried its own; the semver framing had three, the rest two.

**Decision / chat:** all four confirmed the draft. The semver segments stay stated **in terms of
what a user must do** — nothing, nothing but read, or change their code — rather than by
pointing at the specification, which gives the usable test that the segment is read off the
change's effect on users rather than its size. `versioning` is **standalone**, consistent with
the citation criterion: its references to `git` and `code/ruby` are citations, since the rules
apply with neither installed. The package covers **only the version**, not when a release
happens, which is a project's judgment about readiness. And the **three-segment form is kept**
though no project uses it, so a project without a product line has a form to follow and the
generation does not read as mandatory.

## Outcome

- **The package:** `system/versioning/` — `version-scheme` and
  `the-next-version-is-chosen-by-the-developer`, with a README stating what it deliberately
  does not hold and why it is not called release, packaging, or version.
- **The Ruby half:** `code/ruby/releasing-a-gem` — the gemspec's `s.version`, `gem build`,
  `gem push`, the `evt-` name form, and that a published version is permanent, which is the
  concrete form of the irreversibility `versioning` cites.
- **The composite tooling:** `install-all.sh` gains the package.
  `report-direct-commits.sh` needed no change — it discovers packages by finding READMEs.
- **Out of band:** the feature-lifecycle and experiment-lifecycle renames and the
  current-branch option, made directly on `master` before this feature was initiated.
- **Suite state:** not applicable — this repository has no automated suite.
- **Not yet done:** the `waytide/versioning` component repository does not exist, so the
  package cannot be published.

---

Authored by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
