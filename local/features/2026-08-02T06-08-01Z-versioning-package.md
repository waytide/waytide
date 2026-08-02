# Feature — The versioning package

## Intent

Add a `versioning` package holding what a version **means** and how the next one is chosen:
the scheme, what each segment signifies, which segment a given change increases, that the
leading segment of a four-segment version is a **product generation** rather than a
compatibility statement, and that the next version is put to the developer through the
selection interface rather than decided by the agent.

This realizes the deferred item *Package release rules*, which was ranked first because
`constant` cannot be released until the convention exists and `env-var` cannot install
`constant` until it is released.

## Setup

- **State:** Completed
- **Upstream branch:** `master`
- **Working location:** the current branch, `master`. Chosen at initiation on 2026-08-02
  through the selection interface — the first feature to take that option since the
  feature-lifecycle rule gained it. No branch is created, there is no base to record, and
  there will be no merge; completion is the intent being built, and abandonment would be a
  revert.

## What the package holds, and what it does not

Settled before the work began. The item asked which package the rules belong to; the answer
is a split, on the same criterion used earlier for the test runner — the general part is
substantial on its own, so it separates cleanly from the stack-specific part.

- **`versioning`** — the scheme and its meaning, and the prompt that puts the next version to
  the developer. It has **no knowledge of Ruby**, even though every package released under it
  today is a Ruby gem.
- **`git`** — the commit form, `Package version is increased from X to Y`, which is a commit
  concern and already lives in its subject-first rule. Nothing moves.
- **`code/ruby`** — the mechanics: the version lives in the gemspec's `s.version`, the gem is
  built and pushed with `gem build` and `gem push`, and the gem name takes the `evt-` prefix
  with an underscore where the directory uses a dash.

**Why not "release" or "packaging".** Both name acts whose substance is the Ruby part —
bundling a distributable and publishing it. What remains is not an act but a meaning, so the
package is named for the practice of assigning and interpreting versions.

**Why `versioning` rather than `version`.** A reader seeing `waytide/version` would take it
for the version of Waytide itself rather than of the things made with it; every other
component repository name is a subject Waytide governs. `versioning` cannot be misread that
way, and it matches `testing`, the existing package named for a practice.

## The scheme, as established

Surveyed across ten Eventide gems before writing anything:

- **Every gem uses four segments, and every one is generation 2** — `evt-constant` 2.2.0.0,
  `evt-env_var` 2.3.1.0, `evt-initializer` 2.0.0.0, `evt-clock` 2.4.0.1, `evt-settings`
  2.1.1.6, `evt-dependency` 2.2.0.0, `evt-schema` 2.5.0.0, `evt-casing` 2.0.0.1, `evt-reflect`
  2.2.0.1, `evt-virtual` 2.1.0.2.
- **It is not two schemes.** It is semver, optionally prefixed by a generation number:
  `<generation>.<major>.<minor>.<patch>`. Three segments is the unprefixed case. The deferred
  item framed these as two schemes to be accounted for separately.
- **The generation segment is not a release-time decision.** It changes only when an entirely
  new product line is declared — a product-management decision, not a technological
  compatibility matter as semver governs. So it is never among the candidate next versions at
  a release: the prompt offers patch, minor, and major, and the generation is fixed.

## Confirmations

- **2026-08-02 — working location.** The current branch, chosen through the selection
  interface at initiation.
- **2026-08-02 — no branch deletion confirmation was required.** Built on the current branch,
  so no branch was created and none had to be deleted.

## What was settled

All four open questions were put to the developer against the drafted text, and all four
confirmed it.

- **The semver segments are stated by what a user must do** — nothing, nothing but read, or
  change their code — rather than by pointing at the specification. That gives the usable test:
  the segment is read off the change's effect on users, not its size. A rewrite that leaves
  every interface intact is a patch; a single removed method is a major.
- **`versioning` is standalone.** Its references to `git` and `code/ruby` are citations under
  the settled criterion — the rules apply with neither installed — so no dependency is
  declared and it carries no `install-dependencies.sh`, as `git` and `plan` do not.
- **The package covers only the version**, not when a release happens. That is a project's
  judgment about readiness rather than a versioning convention.
- **The three-segment form is kept** though no project uses it, so a project without a product
  line has a form to follow and the generation does not read as mandatory.

## Verification

This repository has no automated suite, so `run-suite-before-commit` has nothing to run. The
package is prose. `install-all.sh` was checked to hardcode its package list and gained the new
entry; `report-direct-commits.sh` was checked and needed none, since it discovers packages by
finding READMEs.

## Conclusion

**Completed 2026-08-02.** Built on `master`, so there was no merge and no branch to delete.
The deferred item it realizes — *Package release rules*, rank 1 — was carried out and deleted,
and the queue renumbered from 6 items.

**One thing remains outside this repository:** the `waytide/versioning` component repository
does not exist, so the package is written but not published. Creating it is the developer's.

## Related records

- The deferred item this realized: *Package release rules* (deleted) — carried out 2026-08-02
  as the `versioning` package, with the Ruby mechanics in `code/ruby`'s releasing-a-gem rule
  and the commit form left where it already was in `git`.
- The loop record for this feature's design:
  `waytide/local/loops/2026-08-02T06-08-01Z-versioning-package.md`.

---

Authored by Scott Bellware on Sat Aug 1 2026 at 11:08:01 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
