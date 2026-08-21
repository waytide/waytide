# Waytide: Human-Agent Relations

By [The Eventide Project](https://eventide-project.org)

## Agent harness and human ally

The engineer decides. The agent generates. Where there is ambiguity, the agent gives the engineer options, including the option to dictate the answer.

Waytide offers a project four things: conventions that bind, work that records itself, a design method with the engineer at its decision points, and the machinery that installs and activates all of it. 101 rule files and 6 vocabularies across 7 packages, plus tool-specific extensions.

## Conventions that bind, read fresh each session

- **One rule per file, in prose, each with its reasoning and its application stated.** Read at session start and followed, overriding default agent behavior where they conflict.
- **Files, not memory.** Committed with the code. They are reviewable, diffable, and versioned. Project context lives in committed artifacts. Agent memory store is forbidden to stand in for committed artifacts.
- Extensible locally. local/rules/ for a project's own rules, local/vocabulary.md for its own terms, both binding and both having precedence over Waytide's own.
- **Installed as packages.** A consuming project installs packages, rather than single rules, with tools for installing packages, refreshing them, and reporting on changes.

## A design method with the engineer at its decision points

- **Design By Efferent.** The actuation written before any implementation, so the interface is shaped from the use site. An updated TDD variant with accommodations for AI.
- **Gates, not ceremony.** The loop waits only where a decision is subtle and load-bearing. No pause at a red or green bar, unless you want to. Running the red, green, refactor cycle is a choice the implementation checkpoint offers, not a ritual it performs.
- **Five checkpoints:** actuation, test, setup, implementation, and final naming and polish.
- **Options, never a single proposal.** Every checkpoint is a gate that presents possible solutions. A free-text escape hatch at every decision lets the engineer go in their own direction, rather than just rubber stamping the agent.
- **Attended or unattended.** The engineer chooses whether to let the agent run free at the start of every task. The methodology is respected either way. Only the amount of unchecked work changes.

## The work records itself

- **ideas/** — Designs, plans, aspirations, observations, specifications. One class of record, differentiated by tags and status.
- **logs/** — The decision log (one file, one line, one decision), loop records, work session records. Written by the agent at the appropriate time.
- **implementations/** — Features and experiments, each with a branch or a working tree, a working location chosen at the start, a lifecycle, a declared end, and recorded confirmations.
- **journal/** — The one record the engineer writes and the agent only reads. Read at session start, binding in nothing.
- **migration/** — Execution plans for content moving to or from another repository.

## Project-local rules

A project's own rules live in `waytide/local/rules/`, one per file, each named with the ISO-8601-UTC datetime prefix. Its own terms live beside them in `waytide/local/vocabulary.md`. Both are read at session start and bind exactly as an installed package does, and a project's own vocabulary decides over every package's.

`waytide/local/` is never split or pushed, so a project-specific rule cannot leak upstream.

## Domain conventions

- **Language.** Words treated as design decisions, literal naming, no slang, and Eventide Technical English (ETE) extended from the [ASD-STE100](https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf).
- **Testing.** Controls rather than fixtures, actuate once and assert each outcome, preconditions, naming.
- **Git.** Subject-first messages, suite before the commit decision, no Claude co-author trailer, an announced branch switch.
- **Versioning.** What each digit in a version number means, and the next version decision options presented to the engineer.

## Machinery

- **Activation.** install.sh places the AGENTS.md bootstrap and .claude/settings.json. A SessionStart hook carries the read instruction and prints what is installed. A status line keeps the system's presence on screen.
- **The deferred queue.** Printed at startup, so parked work is not lost by going unread.
- **Commands.** Status report, test report, test tree, lib report, next deferred item, timeline.
- **11 scripts.** Installed with the packages or held at the authoring root.

## Install Waytide

Install all of Waytide's packages at once with:

```
curl -O https://raw.githubusercontent.com/waytide/waytide/master/install-all.sh
sh install-all.sh
```

Or fetch it and run it from your project root:

[`install-all.sh`](install-all.sh), which installs and refreshes every package.

### Warning

Execute the install script using `sh`:

`sh install-all.sh`

The script fetches the packages over SSH. Where no SSH key is registered, run it as `WAYTIDE_ORIGIN=https://github.com/waytide sh install-all.sh`.

The file is committed as an executable, but `curl` transfers content and not file metadata. The copy it writes is not executable, whatever mode the original carries. Every other script here is invoked as itself, because every other script reaches a project by `git subtree`, which does preserve the mode.

## Packages

- **[foundation](https://github.com/waytide/foundation)**. The `waytide/` artifact system: the `rules/` and `vocabulary.md` that bind, and the `ideas/`, `logs/`, `implementations/`, and `migration/` directories the work is recorded in. The one-line decision-log format, the ISO-8601-UTC filename convention, the tag protocol, and the implementation lifecycle. Everything includes it.
- **[language](https://github.com/waytide/language)**. How language is used: precisely. Words are load-bearing, so a word selection is a design decision. Name concepts literally, drop slang, and keep the settled substitutions in the package's `vocabulary.md`. Carries Eventide Technical English, Waytide's implementation of ASD-STE100.
- **[design-by-efferent](https://github.com/waytide/design-by-efferent)**. Human-in-the-loop, efferent-first design method (DBE): hinges and gates, the actuation-first cycle, and the method's own `vocabulary.md` lexicon. An updated TDD variant with accommodations for AI. Contributes the `logs/loops/` artifact directory.
- **[testing](https://github.com/waytide/testing)**. Controls-based test-writing conventions: variable prefixes, test structure and naming, assertion form.
- **[git](https://github.com/waytide/git)**. Commit conventions, and the one branch operation the agent announces.
- **[versioning](https://github.com/waytide/versioning)**. What a version means and how the next one is chosen: semver, optionally prefixed by a product generation number. Not how a package is built or published.
- **[journal](https://github.com/waytide/journal)**. The one record the engineer writes rather than the agent. Read at session start, and followed in nothing. Contributes the `journal/` artifact directory.
- **[tools/ruby-lang](https://github.com/waytide/tools-ruby-lang)**. Prescriptive Ruby style, the suite entry point, and gem release mechanics. **Authored in its own repository rather than here**, and its dependency is every package above, so installing it installs all of Waytide.

A package that has dependencies carries an `install-dependencies.sh` that installs them. A standalone package has none. Each arrow below points from a package to the packages it depends on (`→` reads "includes"):

```
tools/ruby-lang     →  every package below
design-by-efferent  →  foundation, language, testing
testing             →  foundation, language
language            →  foundation
journal             →  foundation

foundation          →  (nothing — the base every other package builds on)
git                 →  (nothing — standalone)
versioning          →  (nothing — standalone)
```

## Using a specific package in a project

A consuming project installs a package with `git subtree`. That places the package's files physically into the project's `waytide/system/` tree, so they are committed alongside the code and read at session start:

```
git subtree add  --prefix waytide/system/testing git@github.com:waytide/testing.git master --squash
git subtree pull --prefix waytide/system/testing git@github.com:waytide/testing.git master --squash
```

**Over HTTPS**, where no SSH key is registered, use `https://github.com/waytide/<package>.git` in place of the address above. Every Waytide script takes `WAYTIDE_ORIGIN=https://github.com/waytide` for the same reason.

Dependency packages are not installed automatically. If the package has an `install-dependencies.sh`, run it from your project root to install them. Otherwise the package is standalone.

Refresh any package later using `git subtree pull`:

```
git subtree pull \
  --prefix waytide/system/foundation \
  git@github.com:waytide/foundation.git \
  master \
  --squash
```

## Origins

Waytide grew out of the design system that the Eventide Project uses in its own work. The rules were extracted from its [Constant](https://github.com/eventide-project/constant) project and generalized and consolidated into these packages.

**This composite repository is not itself installed into a project.** It is the authoring source. A consuming project installs the individual component packages, each with its own repository.

## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
