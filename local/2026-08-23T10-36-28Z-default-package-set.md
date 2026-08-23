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

## What it is for

**It exercises the print path, which nothing else does.** The declaration record, the read of it by
`session-start.sh`, the instruction carried to the agent, and the stanza printed at the head of
the load are a path no test reaches — a script can observe the instruction and cannot observe
whether a session renders it.

**So this record is the control.** A session opening on it prints
`(7 active of 7 installed)` above the copyright, or it does not, and the answer is in front of
the engineer either way.

**It is kept rather than removed once read.** A project that declares its set is the ordinary
state the mechanism is built for, and this project declaring the set it actually runs is true
rather than a fixture.

Related:

- the foundation a-project-declares-its-package-set rule — the mechanism, and what these three
  lines mean
- the initialization-rule — the stanza this is meant to produce

---

Authored by Scott Bellware on Sun Aug 23 2026 at 3:36:28 AM PT
