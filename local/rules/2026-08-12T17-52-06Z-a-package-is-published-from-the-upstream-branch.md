# A package is published from the upstream branch

**Publishing follows a merge to the upstream branch.** It is not a step that follows a commit. A
component repository receives a `git subtree split` of this composite's history. A publish puts that
content in front of every project that installs the package.

**So an experiment never publishes and a feature never publishes.** Neither has merged.

**The exception is rare and it is confirmed.** Where an experiment's own question is about
publishing, put the exception through the selection UI and record it as a confirmation in the
experiment record. Nothing else licenses a publish from a topic branch.

**Waytide carries no version numbers**, and this rule does not ask for one. The `versioning`
package's the-next-version-is-chosen-by-the-engineer rule governs a consuming project that versions
its packages. It does not govern this project, which versions nothing.

**Why:** an experiment can be refuted, and its branch is deleted on confirmation. A feature can be
abandoned. A publish is neither reversible nor confirmable after the fact, since a component
repository's `master` is what a consuming project pulls.

Publishing from a topic branch would put work in front of consumers that has reached no verdict and
has not merged. The merge is the point where the work becomes the main line, so it is the point a
publish may follow.

**How to apply:** merge the work to its upstream branch first. Then publish the affected packages,
following `CONTRIBUTING.md`. Do not publish from an experiment branch or a feature branch.

Related:

- `CONTRIBUTING.md` — the publish procedure itself
- the foundation experiment-lifecycle and feature-lifecycle rules — the merges a publish comes after
- the versioning package's the-next-version-is-chosen-by-the-engineer rule — which governs a
  consuming project that versions its packages, and not this one

---

Authored by Scott Bellware on Wed Aug 12 2026 at 10:52:06 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 6:14:22 AM PT
