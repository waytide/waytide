# The consuming-project orchestrator — Aspiration

## Summary

`read-consuming-projects.sh`, a committed script in the `foundation` package that **discovers the
consuming projects on the machine it runs on** and reports them. It reads a per-machine registry
outside every repository, walks the paths it names, identifies consuming projects by the
discriminator the system already publishes, and emits the **actionable set** — the projects that
are not excluded.

It detects nothing about a project's condition, takes no action on one, and requires nothing
installed. What is done with a discovered project is directed by the user.

**This paragraph read *at the composite root* and *the maintainer's machine* until 2026-08-07**,
when the script was packaged and the reason was found to be wrong — see the Settled entry for that
date. The developer who runs it is anyone with Waytide installed in more than one project, which is
why it no longer says *the maintainer's*.

## Background & Motivation

A package change moves through three hops: **composite → component repositories → consuming
projects**. `report-direct-commits.sh` reports component repositories carrying commits that did
not come from the composite. A project left on stale rules is a silent condition — rules are read
at the start of every session and govern how the agent works, which makes staleness there a change
of behavior nobody sees.

On 2026-08-04 that hop was walked by hand after a package was folded and every consuming project
needed reaching. This design is what removes the hand-walking.

**Updated 2026-08-06 — the last hop is now checked in part, and what remains unaddressed is
narrower than this section first claimed.** Two checks were placed that day, and both run **inside
a consuming project**: `foundation`'s `report-unrecognized-mode.sh` reports a mode rule naming a
mode Waytide no longer defines, and `refresh-packages.sh` compares the root `AGENTS.md` against the
bootstrap the installed installer generates. **Neither displaces this design**, for two reasons
worth stating rather than assuming:

- **A check inside a project reaches a project only when that project refreshes.** The projects
  furthest behind receive it last, which is the population it most concerns. Something has to reach
  them from outside, and reaching them begins with knowing which they are — which is what this
  design provides and nothing else does.
- **Discovery is still not detection.** These checks report a condition of a project *to that
  project*. This tool emits the actionable set and nothing about any project's condition, which the
  2026-08-04 resolution below settled and the 2026-08-06 entries below reopened and then closed
  unchanged.

What was demonstrated on 2026-08-06 is the motivation, not a counter to it: a survey run by hand
across the discovered projects found **every one** carrying a rule left behind by a rename made the
day before.

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

**`read-consuming-projects.sh` is in the `foundation` package**, at
`waytide/system/foundation/read-consuming-projects.sh`, so it reaches every project that installs
Waytide. The name is verb-first like the authoring tools it used to sit with, which state what they
do rather than what they are about.

**It sat at the composite root until 2026-08-07**, classified as an authoring tool on the grounds
that a consuming project never runs it. That classification was the wrong test and is superseded —
see the Settled entry for that date. The paragraph below is what it read while the earlier
placement held, kept because the reasoning it gives is still correct about `git subtree` and is why
the move required packaging rather than any other mechanism:

> `git subtree` can only place files inside a package directory, so a tool a consuming project runs
> must live in a package.

**Being packaged means a copy in every project, reading one registry.** Each copy reports the same
set, so a developer runs whichever is nearest rather than a particular one. That is the cost of the
placement and it is accepted: the alternative was a tool obtainable only by cloning the authoring
repository.

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
- **2026-08-06 — the no-status resolution above is reopened, and is not yet re-decided.**
  `report-planning-directories-named-in-part.sh` was written on 2026-08-06 to report a file naming some
  but not all of a mode's planning directories, and it reads `system/` — the packages' own prose.
  A consuming project's **own local rules** can carry the same defect, and the question of
  checking them is now registered in the queue. That question bears directly on this aspiration:
  a check driven **over the actionable set** would be this tool detecting a condition of each
  discovered project, which is what the 2026-08-04 resolution excluded. A check placed in
  `foundation` and run **by** a project would not be, and would leave that resolution intact.
  **Which of the two it is has not been decided**, so the earlier resolution is recorded here as
  reopened rather than superseded. Nothing about the discovery tool changes until it is settled.
- **2026-08-06 — the reopening above is closed, and the 2026-08-04 no-status resolution stands
  unchanged.** The script that checks a consuming project's rules against Waytide's current
  vocabulary is placed in the `foundation` package, so each project runs it on itself rather than
  this repository running it across the projects `read-consuming-projects.sh` discovers.
  `read-consuming-projects.sh` therefore still detects no status, still takes no action on a
  project, and still emits nothing but the actionable set. **What the placement costs is recorded
  rather than dismissed:** a script delivered inside a package reaches a project only when that
  project refreshes, so the projects furthest behind receive the check last — which is the
  population the check most concerns.

- **2026-08-07 — the script is packaged in `foundation` rather than kept at the composite root.**
  The 2026-08-04 placement classified it as an authoring tool because a consuming project never
  runs it. **That is the wrong test.** The script is **machine-scoped**: it reports the Waytide
  projects on one machine, reading a registry outside every repository. The developer who wants
  that is anyone who installed Waytide into more than one project, not only whoever maintains
  Waytide — and such a developer has no reason to clone the authoring repository, which was the
  only way to obtain it.
  - **The authoring tools run against the packages; this runs beside projects.** That is a third
    position, and the earlier classification had two slots.
  - **`install-all.sh` already occupied a third position** for a different reason: it is fetched by
    `curl` because it is needed *before* a project exists to deliver it. This one is needed
    *across* projects.
  - **What it costs is a copy per project against one registry.** Four copies today, each reporting
    the same set, so a developer runs whichever is nearest. Accepted against a tool reachable only
    by cloning the composite.
  - **Nothing about what the tool does changes.** It still detects no condition, reaches no
    network, takes no action, and names no consuming project in its own source.
  - **`foundation` is where it is for now, and its own package is the likely next position.** It is
    packaged there because `foundation` is the package every project has, which makes it the only
    one that reaches every project — not because discovery is foundational. A package of its own
    would carry it to the developers who want it and to no others, and would be the first Waytide
    package that is a **tool** rather than a set of rules. Nothing in this entry assumes the
    placement is final.

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
- **Where a consuming-project rule check lives, and whether this tool drives it.** Registered as
  a deferred item on 2026-08-06 — *what the planning-directory check does not reach*. It is out of
  scope **here** because it is undecided, not because it is unrelated: one of its two answers puts
  condition-detection inside this tool and reopens the 2026-08-04 resolution, and the other places
  the check in `foundation` and leaves this aspiration untouched.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 10:27:34 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:34:48 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:32:03 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:34:11 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 10:41:07 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 2:04:25 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 2:23:04 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:36:13 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:45:20 PM PT
