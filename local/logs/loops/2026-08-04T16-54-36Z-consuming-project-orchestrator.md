# Loop record — The consuming-project orchestrator

The design of a composite-level script that reaches the projects with Waytide installed, closing the composite → components → consumers pipe at its one unverified hop. The feature's lifecycle record is `waytide/local/features/2026-08-04T16-54-36Z-consuming-project-orchestrator.md`.

**The settled shape is the design record**, `waytide/local/design/2026-08-04T17-27-34Z-the-consuming-project-orchestrator.md`, written on 2026-08-04 once the direction stopped moving. **Read that for what is being built.** This record is how each decision was reached, in order — including the framing the work was initiated under and the two decisions that were superseded, which is why the current shape cannot be read off it without discarding parts of it.

**Mode: attended.** Chosen at initiation on 2026-08-04 beside the working location. The loop stops at every hinge and the developer deliberates each one, so every cycle below carries the options put at the gate and the decision that resolved it.

## Cycle 1 — what the registry holds

**Hinge.** What the orchestrator reads from `~/.config/waytide/` decides what it can find, what it can be wrong about, and what has to be maintained by hand. The deferred item left it open with the argument on each side: a list drifts, which is the same argument that keeps consumers out of the repository, but a scan cannot see another volume and cannot distinguish a live consumer from an abandoned clone.

**Options.** A scan root; an explicit list; a root plus exceptions.

**Decision / chat.** The developer declined the option set, observing that a scan root could hold specific repository directories too. That is correct and it collapses the distinction the options rested on: if each registry path is tested with the published discriminator — a git repository whose root holds `waytide/system/` — and then descended, a path that *is* a consuming project is found at depth zero. Naming a container and naming a project are the same mechanism at different depths, not two shapes of registry. The three options were one thing presented as three, and the option set had asked the developer to decide something the script would never have to know.

**Settled:** the registry is **one list of walked paths**, and **the walk tests each path itself before descending** — which is the whole of what makes a named project directory work.

## Cycle 2 — how a project that should not be reached is kept out

**Hinge.** An abandoned clone or a mid-run pull sitting under a broad path still gets found, and something has to decide it is not reached. With discovery uniform, this is what exclusion was standing in for in cycle 1.

**Options.** Selection at survey time, the deferred item having already settled that refresh happens on selection rather than automatically, so a clone is found, shown, and not selected; narrower paths, avoiding the clone by naming its siblings instead of the containing directory; an exclusion list.

**Decision / chat.** The developer declined the option set and asked what the schema is when there are both included and excluded directories. The question settles the hinge by presupposing it — exclusions are present — and moves the deliberation to the data, which is the right order: the cost of an exclusion mechanism is mostly the cost of its representation, and the option set had asked for a judgment about that cost without showing it.

**Settled:** the registry carries **excluded paths as well as included ones**.

## Cycle 3 — the registry's schema

**Hinge.** The registry's format is read by a POSIX `sh` script, so the schema decides the parser, and the parser is what a wrong choice is expensive in.

**Options.** Labeled lines in one file, in the recognizable-content form the system already uses for mechanically-read content; two plain files, one path per line, meaning carried by the filename; one file with a leading dash marking a skipped path. Each was shown holding both kinds of entry, with the parsing idiom it implies. **JSON and YAML were left off the candidates** on the ground that every script in the tooling is `#!/bin/sh` with no structured-data parsing anywhere, so either would introduce the system's first `jq`-class dependency.

**Decision / chat.** Labeled lines were selected, and then superseded in the same exchange by a direct instruction: **YAML, with an `included` root element and an `excluded` root element**. The instruction settles the format.

```yaml
included:
  - ~/projects
  - ~/work/some-client-repo

excluded:
  - ~/projects/old-clone
```

**What the choice carries, recorded rather than re-argued.** POSIX `sh` has no YAML parser, so the script either hand-parses a restricted subset — the two known root elements, flat sequences of plain scalars, nothing else — or takes the tooling's first parsing dependency.

**This cycle's outcome did not stand.** The developer reopened the format in cycle 4, and JSON is what settled. The cycle is kept as written because it happened: the labeled-lines selection and the YAML instruction were both real, and a record that showed only the final answer would hide that the format was decided twice.

## Cycle 4 — YAML or JSON

**Hinge.** Reopened by the developer directly, as a question rather than a selection: should the registry be YAML or JSON. The format decides the parser, and the parser is where a wrong choice is paid for.

**Options.** YAML and JSON, both genuine.

**Decision / chat.** The agent was asked for a judgment and gave one — **YAML**, on two grounds that share a premise, that a person writes this file and nothing else does. **Comments**: JSON has none, so the reason a path is excluded has nowhere to live and a path cannot be commented out rather than deleted, which puts the file out of step with every script in the system, all of which carry their reasoning inline. **The hand parser is easier in YAML**: indentation is significant, so a line is a whole entry and a `case` over lines is a parser, where JSON's insignificant whitespace lets a hand-editor legitimately reflow the document and defeat a line-oriented parser. The stated condition for reversing that answer was a parsing dependency being taken rather than hand-rolled, since `jq` is far more widely installed than `yq`.

**The developer chose JSON.** That is the decision.

```json
{
  "included": [
    "~/projects",
    "~/work/some-client-repo"
  ],
  "excluded": [
    "~/projects/old-clone"
  ]
}
```

**What the choice carries forward.** Two things, recorded rather than re-argued. **The reason a path is excluded has nowhere to go in the file**, so if that reason should be recoverable it lives somewhere else or is reported by the survey. And **hand-parsing versus taking `jq` is now the sharper decision it was not before**, because JSON is the one of the two whose hand parser is fragile. Neither is settled here.

## Cycle 5 — the registry file's name

**Hinge.** What the file under `~/.config/waytide/` is called. The developer opened it with *consumer-projects, or something* and asked for alternatives.

**Options.** `consuming-projects.json`, `consumer-projects.json`, `projects.json`, `registry.json`.

**Decision / chat.** The agent surfaced, rather than quietly correcting, that **"consuming project" is the term the system has already settled** — every rule, the README, `AGENTS.md`, and `refresh-packages.sh` use it — so the developer's `consumer-projects` would name the file one way while all the prose describing it said the other. Both forms were put up on that basis, with the term-drift stated as the cost of the second rather than as an objection to it.

**Settled:** `~/.config/waytide/consuming-projects.json`.

## Cycle 6 — how the registry is read

**Hinge.** Whether the script takes a parsing dependency. JSON having been chosen, this decides whether the read is correct against any valid document or only against a documented subset.

**Options.** Take `jq`; hand-parse a restricted subset; hand-parse with `jq` when present.

**Decision / chat.** The developer asked first what taking `jq` would mean — specifically whether it would install a package into a consuming project. It would not, and the answer corrected a cost the agent had stated wrongly in the option set. **The orchestrator is authoring tooling and runs on one machine**: it sits at the composite root beside `install-all.sh` and `report-direct-commits.sh`, which foundation's README is explicit that a consuming project never runs. It reads the registry on the maintainer's own machine and walks directories on that same machine. It does not run in a consuming project, is not distributed to one, and reaches no other machine — so the phrase *reaching machines that may not be set up* was wrong, and the whole footprint of `jq` would have been the maintainer's own machine. A consuming project's `refresh-packages.sh`, which the orchestrator drives, stays POSIX `sh` requiring nothing either way.

**Settled by instruction:** **no `jq`.** The script takes no parsing dependency and reads a documented restricted subset itself.

## Cycle 7 — the format, reopened by the parsing constraint

**Hinge.** With no parser available, JSON's advantage is gone. The developer raised TOML.

**Options.** TOML and JSON, each shown as the file would read.

**Decision / chat.** The developer's phrasing was *TOML instead of YAML*; the agent noted that the settled format was **JSON**, not YAML — YAML having been instructed earlier and then reopened — so the live comparison was TOML against JSON. The agent's read, given: **TOML is the better of the two once `jq` is excluded**, because JSON's entire advantage was strict parsing by a standard tool, and without one what remains is the format whose hand parser is the fragile one, its whitespace being insignificant and reflow unremarkable. TOML recovers **comments**, which closes the question the JSON decision had opened about where an excluded path's reason lives; keeps the **line as the unit**, multi-line arrays being idiomatic; and improves on YAML where YAML was weakest, since **a TOML string is always quoted** and no scalar is ambiguous — the colon-in-a-path and leading-`#` problems do not arise.

**Settled:** **TOML**, at `~/.config/waytide/consuming-projects.toml`.

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

**The residual risk, recorded.** TOML permits an inline single-line array, which would defeat a line-oriented parser exactly as reflowed JSON would. It is not the idiomatic form, but the restricted subset the parser accepts still has to be **documented and refused when violated**, rather than silently misread — a partial registry read as a whole one is the silent failure this feature exists to close.

## Cycle 8 — where the no-consumer-named principle lives

**Hinge.** The principle was decided for one situation and recorded only in the log. Whether it becomes binding decides whether anything would actually stop the next consumer list being added.

**Options.** Stays a log entry; an observation; a foundation rule.

**Decision / chat.** The option set stated the cost of the rule plainly — that the system would carry it on the evidence of one situation, and every project installing `foundation` would read a rule about a problem the composite has and they do not — and stated that it is nonetheless the only one of the three with any force, a log entry and an observation both binding nothing. The developer chose **a foundation rule**.

**Settled:** `a-project-does-not-name-its-consumers`, in `system/foundation/`. It is **written generally rather than about this repository**: a consumer list inverts the dependency direction, drifts silently, and publishes other people's projects to everyone who reads the file — three reasons each sufficient alone. Two things it deliberately does not reach: a project named because **a decision was about it** (Waytide's `website`, part of Waytide at large, and `constant`, the worked example), and **a name already in a historical record**, which stays the disclosure rule's concern. It closes by naming the substitute, so it forbids something that has an available answer: per-machine configuration under `~/.config/`, read by a committed tool that names no consumer. The foundation README gained a summary paragraph for it.

## Cycle 9 — what the tool does at all

**Hinge.** The deferred item had settled that the tool **surveys read-only by default** and **refreshes on selection**. The agent put a hinge on what the survey's *behind* would be measured against — the composite's working tree, its committed history, or the component repositories' heads.

**Options.** Three comparison points, then, when the developer asked what *behind* was for, a narrower pair: the survey fetches and reports it, or the refresh establishes it.

**Decision / chat.** The developer's question — *when will an understanding of behind matter, and is it about keeping the packages updated in the consuming project* — was answered yes, and the answer surfaced that **`refresh-packages.sh` already establishes it authoritatively**: a refresh is a `git subtree pull` from the component repositories, which brings a project forward if it is behind, does nothing if it is not, and already reports each package that moved and the rule files that changed. So a surveyed *behind* is a preview of the refresh, and only a measure taken from the component heads could agree with it.

**The developer then removed the premise.** By direction: **do not detect the status of a consuming project at all.** The user directs the agent to take on one consuming project or all of them, and **refreshing packages is not a default action**.

**Settled — what the tool is.** **Discovery, and nothing else.** It reads the registry, walks the included paths, applies the exclusions, and reports the consuming projects it found. It does not fetch, does not compare against anything, and reports nothing about a project's condition. What is taken on is directed by the user; refreshing is one thing that may be directed, never what happens because a project was reached.

**What this dropped:** the read-only per-project survey, refresh-on-selection, and the comparison hinge entirely. **What survived intact:** every registry decision from cycles 1 through 7 — discovery is what they were for.

**What `all consuming projects` means.** The projects that are **not excluded** — the actionable set. An excluded path is not reported, not flagged, and not counted; nothing is done to it, which is what excluding it does. So **the discovery output and *all consuming projects* are the same list**. The agent had written this up as the exclusions gaining significance under the new shape; the developer corrected it to what it is, the plain meaning of the word, which is the more useful statement because it settles the output rather than observing something about it.

The deferred item's **What it does** section was superseded and its four open questions were answered in place, since it is still in the queue and read as current.

## State

**The feature completed on 2026-08-04.** The loop ran nine cycles, all attended, and the script was built and integrated into `master`. Nothing below is open.

Every question the feature opened with is settled.

**The registry** is one list of walked paths, each tested before it is descended; it carries excluded paths as well as included ones; it is **TOML** with `included` and `excluded` array keys, at `~/.config/waytide/consuming-projects.toml`; and the script **takes no parsing dependency**, reading a documented restricted subset and refusing what falls outside it.

**The principle** is now the foundation rule `a-project-does-not-name-its-consumers`.

**The tool** is discovery only — no status detection, no default refresh, what is taken on directed by the user. It is `read-consuming-projects.sh`, at the composite root.

**What the loop is worth noting for.** Three of the nine cycles resolved by the developer **rejecting the option set rather than choosing from it** — the registry's shape, the exclusion mechanism, and the comparison the survey would have rested on. In each the options were built on a distinction that did not survive being questioned: two of them were one mechanism presented as several, and the third asked for a judgment about a cost without showing what the cost was. The built-in escape carried every one of those, which is the case the gates' second result names — the best answer being one the agent could not produce.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 9:54:36 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:02:00 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:08:31 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:14:35 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:16:51 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:24:10 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:26:32 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:27:34 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:43:25 AM PT
