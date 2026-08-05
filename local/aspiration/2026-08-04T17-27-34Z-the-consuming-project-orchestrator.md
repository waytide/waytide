# The consuming-project orchestrator — Aspiration

## Summary

`read-consuming-projects.sh`, a committed script at the composite root that **discovers the
consuming projects on the maintainer's machine** and reports them. It reads a per-machine registry outside the repository,
walks the paths it names, identifies consuming projects by the discriminator the system already
publishes, and emits the **actionable set** — the projects that are not excluded.

It detects nothing about a project's condition, takes no action on one, and requires nothing
installed. What is done with a discovered project is directed by the user.

## Background & Motivation

A package change moves through three hops: **composite → component repositories → consuming
projects**. Two of them are checked. `report-direct-commits.sh` reports component repositories
carrying commits that did not come from the composite. Nothing addresses the last hop, so a
project left on stale rules is a silent condition — and rules are read at the start of every
session and govern how the agent works, which makes staleness there a change of behavior nobody
sees.

On 2026-08-04 that hop was walked by hand after a package was folded and every consuming project
needed reaching. This design is what removes the hand-walking.

**Why discovery rather than a survey.** The work was framed initially as a read-only survey of
each project's condition — what is installed, what is behind, whether the tree is clean — with a
refresh offered on selection. That framing was set aside deliberately (see **Settled**,
2026-08-04): status detection duplicates what `refresh-packages.sh` already establishes for
certain by pulling, and a preview measured from anywhere other than the published heads can
disagree with the action it previews. What remains that nothing else provides is the list itself.

## Vocabulary

- **consuming project** — a project that has installed the Waytide packages. The system's
  settled term; *consumer project* is not used.
- **the actionable set** — the consuming projects that are **not excluded**. It is what *all
  consuming projects* means, and it is exactly what discovery emits. An excluded path is not
  reported, not flagged, and not counted.
- **discovery** — resolving the registry into the actionable set. The whole of what this tool
  does.

## The registry

**It lives at `~/.config/waytide/consuming-projects.toml`** — outside the repository entirely.
That placement is not convenience: the `a-project-does-not-name-its-consumers` rule forbids a
project's files naming the projects that consume it, and holding the list per-machine satisfies
it without depending on a `.gitignore` staying correct. The list is what it actually is — one
developer's machine — rather than a fact about the project.

**Its content is one list of walked paths, and a list of exclusions.**

```toml
# Each included path is walked. A path that
# is itself a consuming project is found at
# depth zero.

included = [
  "~/projects",
  "~/work/some-client-repo",
]

# Abandoned clone, kept for its history.
excluded = [
  "~/projects/old-clone",
]
```

**A path naming a project and a path naming a directory of projects are the same thing.** The
walk tests each path itself before descending, so a path that *is* a consuming project is found
at depth zero and a path that contains them is walked. The script never has to know which kind it
was given, and the registry has no notion of entry kinds.

**TOML, parsed by the script itself.** The script takes **no parsing dependency** — no `jq`, no
equivalent. It reads a **documented restricted subset**: the two array keys, multi-line arrays of
quoted strings, one per line. TOML permits an inline single-line array, which a line-oriented
parser cannot read, so the parser **refuses input outside the subset and says so** rather than
proceeding — a partial registry read as a whole one is the silent failure this whole design
exists to close.

TOML is chosen over the alternatives on two properties. It carries **comments**, so an excluded
path states its own reason and can be commented out rather than deleted. And **its strings are
always quoted**, so no scalar is ambiguous — a path holding a colon or a leading `#` needs no
special handling, which is where YAML would have been weak and where JSON's advantage evaporated
once no parser was to be installed.

## Discovery

**The discriminator is already published and is reused rather than re-invented.** A consuming
project is a git repository whose root holds `waytide/system/`; the authoring source is excluded
by holding `system/foundation` with no wrapper. `refresh-packages.sh` tests exactly this, so
there is one definition in the system rather than two that can drift apart.

**The output is the actionable set** — the discovered projects with the excluded paths removed.
Nothing else is emitted: no condition, no comparison, no ranking, no recommendation.

## What the tool does not do

Each of these is a deliberate exclusion rather than an omission:

- **It detects no status.** Not what is installed, not what is behind, not whether a tree is
  clean or level with its remote.
- **It reaches no network.** Nothing follows from the above that requires one.
- **It takes no action on a project.** **Refreshing packages is not a default action** — it is
  one thing the user may direct, never what happens because a project was reached.
- **It selects nothing.** The user directs which consuming project, or all of them, is taken on.
- **It names no consuming project in its own source.** It reads the registry; the script is
  committed and the list is not.

## Where it lives, and what that costs

**`read-consuming-projects.sh`, at the composite root, beside `install-all.sh` and
`report-direct-commits.sh`** — the authoring tools, which foundation's README is explicit that a
consuming project never runs. The name is verb-first like its two siblings, which state what
they do rather than what they are about. `git subtree`
can only place files inside a package directory, so a tool a consuming project runs must live in
a package; this one is not that, and belongs unpackaged at the root.

The consequence worth stating: **it runs on one machine.** It walks directories on the
maintainer's own machine and reads that machine's registry. It does not run *in* a consuming
project, is not distributed to one, and reaches no other machine. A second maintainer gets the
script from the repository and writes their own registry.

## Settled

- **2026-08-04 — the registry is one list of walked paths, each tested before it is descended.**
  The earlier framing offered a scan root, an explicit list, and a root plus exceptions as three
  alternatives; they are one mechanism at different depths, and the distinction was dissolved
  rather than decided.
- **2026-08-04 — the registry carries excluded paths as well as included ones.**
- **2026-08-04 — the registry is `~/.config/waytide/consuming-projects.toml`, in TOML**, with
  `included` and `excluded` array keys. The name uses *consuming*, the system's settled term.
  The format was decided three times — YAML by instruction, then JSON, then TOML — and the name
  survived all three.
- **2026-08-04 — the script takes no parsing dependency**, reading a documented restricted subset
  and refusing what falls outside it.
- **2026-08-04 — the tool detects no status, and refreshing packages is not a default action.**
  This supersedes the survey-and-refresh framing the work was initiated under.
- **2026-08-04 — *all consuming projects* means the actionable set**, so the discovery output and
  that phrase are the same list.
- **2026-08-04 — the no-consumer-named principle is a binding rule**, `foundation`'s
  `a-project-does-not-name-its-consumers`, rather than an observation or a log entry.
- **2026-08-04 — the script is `read-consuming-projects.sh`**, verb-first like its two siblings
  at the composite root.
- **2026-08-04 — nothing found and everything excluded are reported as different states.** They
  have different remedies — the first sends the developer to the included paths, the second to
  the exclusions — so one message covering both would misdirect in half the cases.
- **2026-08-04 — an excluded path removes the project at it and every project beneath it**, so
  excluding a directory excludes what it contains rather than only itself.
- **2026-08-04 — the registry path is overridable through `WAYTIDE_REGISTRY`**, so the script
  can be exercised against a registry written for a test without touching the developer's own.
  This follows `refresh-packages.sh`'s `WAYTIDE_ORIGIN`, which exists for the same reason.

## Out of Scope / Deferred

- **Anything done with a discovered project.** Refreshing, committing, and pushing in a consuming
  project are directed acts, and where they happen they drive the existing tooling — a project's
  own `refresh-packages.sh` — rather than a reimplementation here. Each project is a separate
  repository, so each push is confirmed rather than swept.
- **Reporting what was excluded.** Discovery emits the actionable set, and an excluded path is
  absent from it. Whether a diagnostic exists for checking that a registry says what its author
  meant is not settled and is not part of the default output.
- **Verifying that a consuming project is current.** Deliberately not this tool's concern; a
  refresh establishes it authoritatively by pulling, and reports each package that moved and the
  rule files that changed in it.
- **A registry written by anything but a person.** The format choices assume hand-editing
  throughout. Nothing generates or updates this file.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 10:27:34 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:34:48 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:32:03 AM PT
