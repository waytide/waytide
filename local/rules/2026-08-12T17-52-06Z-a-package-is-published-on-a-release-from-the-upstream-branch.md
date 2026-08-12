# A package is published on a release, from the upstream branch

**Publishing follows the decision to release a version.** It is not a step that follows a commit. A
component repository receives a `git subtree split` of this composite's history. A publish puts that
content in front of every project that installs the package.

**A release is made on the branch the work merged into.** So an experiment never publishes and a
feature never publishes. Neither decides a version, and neither has merged.

**The exception is rare and it is confirmed.** Where an experiment's own question is about
publishing, put the exception through the selection UI and record it as a confirmation in the
experiment record. Nothing else licenses a publish from a topic branch.

**Why:** an experiment can be refuted, and its branch is deleted on confirmation. A feature can be
abandoned. A publish is neither reversible nor confirmable after the fact, since a component
repository's `master` is what a consuming project pulls.

Publishing from a topic branch would put work in front of consumers that has reached no verdict and
has not merged. Tying the publish to the release ties it to the one decision that is already put to
the engineer, in the versioning package.

**How to apply:** merge the work to its upstream branch first. Decide the next version there,
through the selection UI, per the versioning package. Then publish the affected packages, following
`CONTRIBUTING.md`. Do not publish from an experiment branch or a feature branch.

Related:

- `CONTRIBUTING.md` — the publish procedure itself
- the versioning package's the-next-version-is-chosen-by-the-engineer rule — the decision a publish
  follows
- the foundation experiment-lifecycle and feature-lifecycle rules — the merges a release comes after

---

Authored by Scott Bellware on Wed Aug 12 2026 at 10:52:06 AM PT
