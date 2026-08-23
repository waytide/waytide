# Package set — default

- **Package set:** default
- **Packages:** design-by-efferent, foundation, git, journal, language, testing, versioning
- **Inactive:** none

## Why this set

**This is the Waytide authoring source, and it uses every package it publishes.** The rules are
written here and the work of writing them is governed by them, so nothing installed is out of
scope.

**`default` is the set every project gets with no arguments**, and declaring it changes nothing
about which rules apply here. That is the point of declaring it: the mechanism runs against a
configuration where a mistake in it cannot deactivate anything.

## It prints nothing, and that is the rule rather than an accident

**A declaration of `default` with nothing deactivated prints no stanza.** So this record changes
nothing an engineer sees, which is what a declaration of `default` is supposed to do.

**It was written to exercise the print path**, which no test reaches — a script can observe the
instruction `session-start.sh` carries and cannot observe whether a session renders it. Hours
later the engineer settled that `default` prints nothing, and this record stopped being able to
show that. **The record says so rather than being rewritten as though it had another purpose.**

**What it still proves is the read.** `session-start.sh` finds this file, parses its three lines,
and carries the set to the agent — that much is observable from a terminal and is confirmed.

**It is kept.** This project does run every package it publishes, so the declaration states a fact,
and the mechanism holding a real record in the project where it was built is worth more than a
tidy `local/`.

Related:

- the foundation a-project-declares-its-package-set rule — the mechanism, and what these three
  lines mean
- the initialization-rule — the stanza this is meant to produce

---

Authored by Scott Bellware on Sun Aug 23 2026 at 3:36:28 AM PT
