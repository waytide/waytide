# Feature — The consuming-project orchestrator

**Tags:** [feature]

## Intent

Build a composite-level script that **discovers** every project with Waytide installed, so a
package change can be carried to the projects reading those rules rather than ending at the
component repositories.

**The intent narrowed on 2026-08-04, by direction.** It began as the deferred item framed it —
a script that **surveys** each project's condition and **drives its refresh**. The developer
directed that the tool **detect no status at all**: the user says which consuming project, or
all of them, to take on, and **refreshing packages is not a default action**. What is built is
therefore discovery and nothing more. The earlier framing is kept here because the feature was
initiated under it and the loop record's first eight cycles were run under it.

It closes the third leg of a pipe that already has two. `report-direct-commits.sh` checks that
the component repositories are current with the composite. Nothing checks that the consuming
projects are current with the components. Composite → components → consumers, and only the last
hop is unverified — on 2026-08-04 it was walked by hand after a package was folded and every
consumer needed reaching.

This realizes the deferred item *An orchestrator reaches the consuming projects, reading its
registry from `~/.config/waytide/`*, which was the sole item in the queue and gated on nothing.

## Setup

- **State:** Completed
- **Tags:** [feature]
- **Upstream branch:** `master`
- **Feature branch:** `feature/consuming-project-orchestrator`
- **Base:** `f19057602d3063cde9b7876cea75928186a87685`, from `master`
- **Working location:** branch only. Chosen at initiation on 2026-08-04 through the selection
  interface. This working tree switches back to `master` at the conclusion.
- **Participation:** attended. Chosen at initiation beside the working location.
- **Loop record:** `waytide/local/loops/2026-08-04T16-54-36Z-consuming-project-orchestrator.md`
- **Design:** `waytide/local/design/2026-08-04T17-27-34Z-the-consuming-project-orchestrator.md`
  — the settled shape, written on 2026-08-04 once the direction stopped moving. It is the
  source of truth for *what is being built*; this record carries the lifecycle, and the loop
  record carries how each decision was reached.

## What the deferred item settled before this feature began

Carried forward from the item rather than re-decided:

- **The registry lives in `~/.config/waytide/`** — outside the repository entirely, so the
  no-consumer-named constraint holds without depending on `.gitignore` staying correct. It is
  per-machine, which is what this configuration is.
- **No downstream consumer is named in Waytide's own files**, neither `system/` nor `local/`. A
  package knowing its consumers inverts the dependency direction, and a maintained list of them
  is the drifting corpus this system argues against.
- **The script itself is committed**, at the composite root beside `report-direct-commits.sh`
  and `install-all.sh`. It names no consumer; it reads the registry.
- **The discriminator is already published.** A consuming project is a git repository whose root
  holds `waytide/system/`; the authoring source is excluded by holding `system/foundation` with
  no wrapper. `refresh-packages.sh` tests exactly this, so the orchestrator reuses it rather
  than inventing a second definition.
- **The scan root is developer knowledge, not discoverable fact.** An agent can find every
  project that installed Waytide *within a boundary*; it cannot derive the boundary.
- ~~**It surveys read-only by default and refreshes on selection**, driving the existing tooling
  rather than reimplementing it.~~ **Superseded 2026-08-04 by direction.** The tool detects no
  status: it discovers the consuming projects and reports them. The user directs what is taken
  on — one project or all of them — and refreshing is one thing that may be directed, never a
  default. Where anything is driven, it remains the existing tooling rather than a
  reimplementation, and each project being a separate repository still means each push is
  confirmed rather than swept.

## What this feature must settle

Open in the deferred item, and named there as wanting settlement before the discovery logic is
written, since the registry's shape decides most of the script. The deliberation is in the loop
record; what it settled is below.

- **Whether the registry holds a scan root, an explicit list, or a root plus exceptions.**
  **Settled 2026-08-04:** the question dissolved rather than being answered. The three were one
  mechanism at different depths — the registry is **one list of walked paths**, and **the walk
  tests each path itself before descending**, so a path that is a consuming project is found at
  depth zero and a path that contains them is walked. The script never has to know which kind it
  was given. It carries **excluded paths as well as included ones**.
- **The registry's file format and name** under `~/.config/waytide/`. **Settled 2026-08-04:**
  `~/.config/waytide/consuming-projects.toml`, **TOML**, with an `included` and an `excluded`
  array key. The name uses **consuming**, the term the system has already settled, rather than
  the near-synonym *consumer*. The format was decided three times — YAML by instruction, then
  JSON at a gate, then TOML once the parsing constraint below removed JSON's advantage. The loop
  record carries each; the name survived all three.
- **Whether the no-consumer-named principle becomes a foundation rule, an observation, or stays
  a log entry.** **Settled 2026-08-04:** a **foundation rule** —
  `a-project-does-not-name-its-consumers`, binding on every project that installs foundation,
  and the only one of the three options that would actually stop a consumer list being added.
  It is written generally rather than about this repository: a consumer list inverts the
  dependency direction, drifts silently, and publishes other people's projects. A project named
  because a **decision was about it** is unaffected, and a name already in a historical record
  stays the disclosure rule's concern. The foundation README gained its summary paragraph.

## How the registry is read

**Settled 2026-08-04, by instruction: no parsing dependency.** The script takes no `jq` and no
equivalent; it reads a **documented restricted subset** of TOML itself — the two array keys,
multi-line arrays of quoted strings, one per line — and **refuses what falls outside that subset
rather than misreading it**. TOML permits an inline single-line array, which would defeat a
line-oriented parser, so the refusal is the part that matters: a partial registry read as a
whole one is precisely the silent failure this feature exists to close.

**A cost stated wrongly, and corrected.** The `jq` option was first put with the cost that a
machine without it would get an error "on a script whose whole purpose is reaching machines that
may not be set up". That was wrong. The orchestrator is **authoring tooling on one machine**: it
sits at the composite root beside `install-all.sh` and `report-direct-commits.sh`, which a
consuming project never runs, and it walks directories on the maintainer's own machine rather
than reaching other machines. Nothing would have been installed into any consuming project, and
a consuming project's `refresh-packages.sh` stays POSIX `sh` requiring nothing either way. The
instruction stands on its own grounds; the correction is recorded because the option set argued
from a false one.

**What TOML closed.** JSON's lack of comments had opened a question about where an excluded
path's reason lives. TOML has comments, so the reason lives beside the path it explains, and a
path can be commented out rather than deleted.

## Confirmations

- **2026-08-04 — working location.** Branch only, chosen through the selection interface at
  initiation.
- **2026-08-04 — the human's level of participation.** Attended, chosen through the selection interface at
  initiation beside the working location.
- **2026-08-04 — the registry's format, first decision.** JSON, chosen through the selection
  interface against the agent's stated recommendation of YAML.
- **2026-08-04 — the registry file's name.** `consuming-projects`, chosen through the selection
  interface. The extension followed the format and changed with it.
- **2026-08-04 — no parsing dependency.** Given as a direct instruction: the script does not take
  `jq`.
- **2026-08-04 — the registry's format, settled.** TOML, chosen through the selection interface
  once the no-dependency instruction removed what JSON had been chosen for. Here the agent's
  recommendation and the developer's choice agreed.
- **2026-08-04 — the principle's home.** A foundation rule, chosen through the selection
  interface over an observation and over leaving it a log entry.
- **2026-08-04 — no status detection, and no default refresh.** Given as a direct instruction,
  in answer to a hinge the agent had put on what *behind* should be measured against. It
  supersedes the deferred item's survey-and-refresh framing and narrows the tool to discovery.
- **2026-08-04 — branch deletion.** Confirmed through the selection interface after the merge.
  The branch was local only and never pushed, so no remote branch was deleted, and no worktree
  had to be removed first — the feature was worked branch-only.

## Verification

**This repository has no automated suite**, so `run-suite-before-commit` had nothing to run —
the same state the `versioning` feature recorded. What stands in its place is the manual
exercise run before the script was committed, and it is not a suite:

- **Discovery**, against a fixture — projects found at depth zero and nested; an excluded clone
  absent; a `waytide/system/` directory that is not a git repository not reported; an
  authoring-source lookalike not reported; this repository itself not reported when named
  directly; a leading `~` expanded; a missing included path skipped with a note.
- **Refusal**, five paths — no registry, an inline array, an unclosed array, an unquoted path,
  an unknown key. Each names the line that caused it and exits non-zero.
- **The real registry** — three consuming projects on this machine, all found.

The exercise found one defect, corrected before the commit: nothing-found and
everything-excluded reported the same message, which would have sent the developer to the
included paths when the exclusions were the cause.

**What is not protected.** The script has no regression protection. Adding it needs a test
harness this repository does not have, and that is left open rather than pretended away.

## Conclusion

**Completed 2026-08-04.** The intent is built and integrated into `master`. Worked branch-only,
so the working tree returned to `master` at the conclusion.

**No gate applied at the merge**, per the feature lifecycle: a feature is verified before
integrating, and the merged result is a combination neither branch ran. There was no affirmation
step, a feature having no finding to promote into the decision log.

**What the feature leaves behind it**, and what is deliberately not part of it: `foundation`
changed twice here — the `a-project-does-not-name-its-consumers` rule and its README paragraph —
so the package wants publishing to its component repository and then carrying to the consuming
projects. That is the loop this tool exists to close, and it will be its first use for its actual
purpose. It is a publish, not a feature, so it is not folded into this record.

## Related records

- The deferred item this realizes: *An orchestrator reaches the consuming projects, reading its
  registry from `~/.config/waytide/`* **(deleted)** — carried out 2026-08-04 as
  `read-consuming-projects.sh` at the composite root, reading
  `~/.config/waytide/consuming-projects.toml` and printing the actionable set. Its survey and
  refresh framing was superseded during the work: the tool detects no status, and refreshing is
  not a default action. The queue is now empty.
- The loop record for this feature's design:
  `waytide/local/loops/2026-08-04T16-54-36Z-consuming-project-orchestrator.md`.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 9:54:36 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:08:31 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:14:35 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:16:51 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:24:10 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:27:34 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:34:48 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:43:25 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:46:32 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:20:44 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:09:20 AM PT
