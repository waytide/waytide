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
- **No consuming project is named in Waytide's own files**, neither `system/` nor `local/`. A
  package knowing its consumers inverts the dependency direction, and a maintained list of them
  is the drifting corpus this system argues against. That principle is the reason the registry
  is outside the repository rather than in `local/`.
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

- **Surveys, read-only by default** — per project: which packages are installed, which are
  behind the composite's published heads, whether the tree is clean, whether it is level with
  its remote.
- **Refreshes on selection**, not automatically — running each project's own
  `refresh-packages.sh`, writing that project's decision-log entry, committing, and pushing.
  Each project is a separate repository, so each push is confirmed rather than swept.
- **Drives the existing tooling** rather than reimplementing it.

## What is not settled

- **Whether the registry holds a scan root, an explicit list, or a root plus exceptions.** The
  argument for a root is that a list drifts, which is the same argument that keeps consumers
  out of the repository; the argument for exceptions is that a scan cannot see another volume
  and cannot distinguish a live consumer from an abandoned clone or a pull-proof mid-run.
- **Its file format and name** under `~/.config/waytide/`.
- **Whether the no-consumers-recorded principle becomes a foundation rule, an observation, or
  stays a log entry.** Put to the developer on 2026-08-04 and not answered.
- **What happens to the places that already name consuming projects** — the Constant example
  design calls `constant` and `env-var` "two consuming projects", and the plan-fold migration
  record carries all three with filesystem paths. Put to the developer on 2026-08-04 and not
  answered. Migration records name repositories that content actually crossed into, which may
  be a different case from a standing claim about the set.

**Why:** a package change is not finished when the component repositories are pushed — it is
finished when the projects reading those rules have them. Nothing detects a consumer left on
stale rules, the way `report-direct-commits.sh` detects a component repository that has
drifted, so the failure is silent.

**How to apply:** when this is taken up, build the script at the composite root, read the
registry from `~/.config/waytide/`, and settle the open questions above before writing the
discovery logic — the registry's shape decides most of the script.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 9:36:34 AM PT
