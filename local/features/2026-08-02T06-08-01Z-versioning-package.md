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

- **State:** In flight
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

## Open questions

To be settled as the package is written:

- **What each of the three semver segments means here**, stated in the project's own terms
  rather than by pointing at the semver specification.
- **Whether `versioning` declares any dependency.** Under the citation criterion it likely
  stands alone, as `git` and `plan` do.
- **What the release itself requires beyond the version** — whether the package says anything
  about when a release happens, or only about what the version becomes.
- **Whether the three-segment form is written for at all**, given no project uses it.

## Related records

- The deferred item this realizes: *Package release rules*, rank 1, carried out and deleted
  when this feature completes.
- The loop record for this feature's design, under `waytide/local/loops/`.

---

Authored by Scott Bellware on Sat Aug 1 2026 at 11:08:01 PM PT
