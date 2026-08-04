# An orchestrator reaches the consuming projects, reading its registry from `~/.config/waytide/`

Build a composite-level script that surveys every project with Waytide installed and drives
each one's refresh, so that publishing a package change does not end at the component
repositories.

- **Gated on:** nothing. This is actionable now and was deferred by choice rather than by
  dependency.

**It closes the third leg of a pipe that already has two.** `report-direct-commits.sh` checks
that the component repositories are current with the composite. Nothing checks that the
consuming projects are current with the components. Composite → components → consumers, and
only the last hop is unverified — on 2026-08-04 it was walked by hand, six commands and a
filesystem search, after a package was folded and every consumer needed reaching.

## What is settled

- **The registry lives in `~/.config/waytide/`.** Outside the repository entirely, so the
  constraint below holds without depending on `.gitignore` staying correct. It is per-machine,
  which is what this configuration is.
- **No downstream consumer is named in Waytide's own files**, neither `system/` nor `local/`. A
  package knowing its consumers inverts the dependency direction, and a maintained list of them
  is the drifting corpus this system argues against. That principle is the reason the registry
  is outside the repository rather than in `local/`.
- **Two projects are exempt, and not as exceptions.** `website` is **part of Waytide at large**,
  and `constant` is **a reference project for Waytide** — the worked example the method is shown
  through. Neither is named here as a consumer; each is named because a decision was about it.
  A plain downstream consumer, named only because it installed the packages, is what the
  principle excludes.
- **The script itself is committed**, at the composite root beside `report-direct-commits.sh`
  and `install-all.sh`. It names no consumer; it reads the registry. Committed consumer-facing
  tooling is already established there.
- **The discriminator is already published.** A consuming project is a git repository whose
  root holds `waytide/system/`; the authoring source is excluded by holding `system/foundation`
  with no wrapper. `refresh-packages.sh` already tests exactly this, so the orchestrator reuses
  it rather than inventing a second definition.
- **The scan root is developer knowledge, not discoverable fact.** An agent can find every
  project that installed Waytide *within a boundary*; it cannot derive the boundary. That is
  the one thing the orchestrator must be told, and it is why the registry is a line of
  configuration rather than a list of projects.

## What it does

**Superseded on 2026-08-04**, while the feature realizing this item was being designed. What
stood here was a read-only **survey** — per project, which packages are installed, which are
behind the composite's published heads, whether the tree is clean, whether it is level with its
remote — with refresh offered on selection. The developer directed otherwise: **the tool detects
no status at all.**

- **Discovery only.** It reads the registry, walks the included paths, applies the exclusions,
  and reports the consuming projects it found. It does not fetch, does not compare against
  anything, and reports nothing about a project's condition.
- **The user directs what is taken on** — one consuming project, or all of them. The tool does
  not select, rank, or recommend.
- **Refreshing packages is not a default action.** It is one thing that may be directed, never
  what happens because a project was reached.
- **Drives the existing tooling** rather than reimplementing it, where anything is driven at all.

**All consuming projects** means the projects that are **not excluded** — the actionable set.
An excluded path is not reported, not flagged, and not counted; nothing is done to it, which is
what excluding it does. So the discovery output and *all consuming projects* are the same list.

## What is not settled

**All four were settled on 2026-08-04** by the feature realizing this item; the deliberation is
in its loop record. Kept here as written, with each answer beside it, since this item is still
in the queue and is read as current.

- **Whether the registry holds a scan root, an explicit list, or a root plus exceptions.** The
  argument for a root is that a list drifts, which is the same argument that keeps consumers
  out of the repository; the argument for exceptions is that a scan cannot see another volume
  and cannot distinguish a live consumer from an abandoned clone or a pull-proof mid-run.
  — **Settled:** the question dissolved. The three were one mechanism at different depths, so
  the registry is **one list of walked paths**, each tested with the published discriminator
  before it is descended, and it carries excluded paths as well as included ones.
- **Its file format and name** under `~/.config/waytide/`. — **Settled:**
  `~/.config/waytide/consuming-projects.toml`, **TOML**, `included` and `excluded` array keys.
  The script takes **no parsing dependency** and reads a documented restricted subset, refusing
  what falls outside it.
- **Whether the principle becomes a foundation rule, an observation, or stays a log entry.**
  Put to the developer on 2026-08-04 and not answered. — **Settled:** a **foundation rule**,
  `a-project-does-not-name-its-consumers`.
- **What happens to the historical records that name a plain consumer.** — Unchanged by the
  feature; the disclosure rule governs it, as this item already recorded.
- **What happens to the historical records that name a plain consumer.** The live case was
  corrected on 2026-08-04, and so were the historical records, which is a departure from the
  system's stance of leaving them as written. Not exposing the developer's other projects
  outranks it, and the records stayed true by dropping to a lower resolution rather than by
  being made to say something false — a transition that reached three projects still reads as
  having reached three.

**Why:** a package change is not finished when the component repositories are pushed — it is
finished when the projects reading those rules have them. Nothing detects a consumer left on
stale rules, the way `report-direct-commits.sh` detects a component repository that has
drifted, so the failure is silent.

**How to apply:** when this is taken up, build the script at the composite root, read the
registry from `~/.config/waytide/`, and settle the open questions above before writing the
discovery logic — the registry's shape decides most of the script.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 9:36:34 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 9:52:06 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:24:10 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:26:32 AM PT
