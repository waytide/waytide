# Waytide: Human-Agent Relations

By [the Eventide Project](https://eventide-project.org)

## Waytide is an agent harness and a human ally

The engineer decides. The agent generates. Where there is ambiguity, the agent gives the engineer options.

Waytide offers a project four things: conventions that bind, directories the work records itself in, a design method with the engineer at its decision points, and the machinery that installs and activates all of it. 112 rule files and 6 vocabularies across 8 packages.

## Conventions that bind, read fresh each session

- **One rule per file, in prose, each with its reasoning and its application stated.** Read at session start and followed, overriding default agent behavior where they conflict.
- **Files, not memory.** Committed with the code. They are reviewable, diffable, and versioned. Project context lives in committed artifacts. Agent memory store is forbidden to stand in for committed artifacts.
- Extensible locally. local/rules/ for a project's own rules, local/vocabulary.md for its own terms, both binding and both having precedence over Waytide's own.
- **Installed as packages.** A project takes packages, rather than single rules. `git subtree add` installs; refresh-packages.sh pulls and reports which rule files changed.

## A design method, and the engineer at its decision points

- **Design By Efferent.** The actuation written before any implementation, so the interface is designed from the use site.
- **Gates, not ceremony.** The loop waits only where a decision is subtle and load-bearing. No pause at a red or green bar.
- **Five checkpoints:** actuation, test, setup, implementation, and final naming and polish.
- **Options, never a single proposal.** Every checkpoint is a gate that presents possible solutions. A free-text escape hatch at every decision lets the engineer go in a new direction, rather than just rubber stamping one offered by the agent.
- **Attended or unattended.** The engineer chooses whether to let the agent run free at the start of every task. The methodology is respected either way. Only the amount of unchecked work changes.

## The work records itself

- **ideas/** — Designs, plans, aspirations, observations, specifications. One class of record, differentiated by tags and status.
- **logs/** — The decision log (one file, one line, one decision), loop records, work session records. Written by the agent at the appropriate time.
- **implementations/** — Features and experiments, each with a branch or a working tree, a working location chosen at the start, a lifecycle, a declared end, and recorded confirmations.
- **journal/** — The one record the engineer writes and the agent only reads. Read at session start, binding in nothing.
- **migration/** — Execution plans for content moving to or from another repository.

## Domain conventions

- **Language.** Words treated as design decisions, literal naming, no slang, and Eventide Technical English (ETE) extended from the [ASD-STE100](https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf).
- **Testing.** Controls rather than fixtures, actuate once and assert each outcome, preconditions, naming.
- **Git.** Subject-first messages, suite before the commit decision, no Claude co-author trailer, an announced branch switch.
- **Versioning.** What each digit in a version number means, and the next version decision options presented to the engineer.

## Machinery

- **Activation.** install.sh places the AGENTS.md bootstrap and .claude/settings.json. A SessionStart hook carries the read instruction and prints what is installed. A status line keeps the system's presence on screen.
- **The deferred queue.** Printed at startup, so parked work is not lost by going unread.
- **Commands.** Status report, test report, test tree, lib report, next deferred item, timeline.
- **12 scripts.** Installed with the packages or held at the authoring root.

## Packages

- **[foundation](https://github.com/waytide/foundation)**. The `waytide/` artifact system: the
  `rules/` and `vocabulary.md` that bind, and the `ideas/`, `logs/`, `implementations/`, and
  `migration/` directories the work is recorded in. The one-line decision-log format, the
  ISO-8601-UTC filename convention, the tag protocol, and the implementation lifecycle.
  Everything includes it.
- **[language](https://github.com/waytide/language)**. How language is used: precisely. Words are load-bearing, so a
  word selection is a design decision. Name concepts literally, drop slang, and keep the
  settled substitutions in the package's `vocabulary.md`. Carries Eventide Technical English,
  Waytide's implementation of ASD-STE100.
- **[design-by-efferent](https://github.com/waytide/design-by-efferent)**. Human-in-the-loop, efferent-first design method
  (DBE): hinges and gates, the actuation-first cycle, and the method's own
  `vocabulary.md` lexicon. An updated TDD variant with accommodations for AI.
  Contributes the `logs/loops/` artifact directory.
- **[testing](https://github.com/waytide/testing)**. Controls-based test-writing conventions: variable prefixes, test
  structure and naming, assertion form.
- **[code/ruby](https://github.com/waytide/code-ruby)**. Prescriptive Ruby style.
- **[git](https://github.com/waytide/git)**. Commit conventions, and the one branch operation the
  agent announces.
- **[versioning](https://github.com/waytide/versioning)**. What a version means and how the next one is chosen:
  semver, optionally prefixed by a product generation number. Not how a package is
  built or published.
- **[journal](https://github.com/waytide/journal)**. The one record the engineer writes rather than the
  agent. Read at session start, and followed in nothing. Contributes the `journal/` artifact
  directory.

A package that has dependencies carries an `install-dependencies.sh` that installs
them. A standalone package has none. Each arrow below points from a package to the
packages it depends on (`→` reads "includes"):

```
design-by-efferent  →  foundation, language, testing
testing             →  foundation, language
code/ruby           →  foundation, language
language            →  foundation
journal             →  foundation

foundation          →  (nothing — the base every other package builds on)
git                 →  (nothing — standalone)
versioning          →  (nothing — standalone)
```

## Using a package in a project

A consuming project installs a package with `git subtree`. That places the package's files physically into the project's `waytide/system/` tree, so they are committed alongside the code and read at session start:

```
git subtree add  --prefix waytide/system/testing https://github.com/waytide/testing.git master --squash
git subtree pull --prefix waytide/system/testing https://github.com/waytide/testing.git master --squash
```

Dependency packages are not installed automatically. If the package has an `install-dependencies.sh`, run it from your project root to install them. Otherwise the package is standalone.

### Installing all packages

To adopt the whole set, install each package:

```
git subtree add --prefix waytide/system/foundation          https://github.com/waytide/foundation.git          master --squash
git subtree add --prefix waytide/system/language            https://github.com/waytide/language.git            master --squash
git subtree add --prefix waytide/system/testing             https://github.com/waytide/testing.git             master --squash
git subtree add --prefix waytide/system/code/ruby           https://github.com/waytide/code-ruby.git           master --squash
git subtree add --prefix waytide/system/git                 https://github.com/waytide/git.git                 master --squash
git subtree add --prefix waytide/system/versioning          https://github.com/waytide/versioning.git          master --squash
git subtree add --prefix waytide/system/design-by-efferent  https://github.com/waytide/design-by-efferent.git  master --squash
git subtree add --prefix waytide/system/journal             https://github.com/waytide/journal.git             master --squash
```

Refresh any package later using `git subtree pull`:

```
git subtree pull --prefix waytide/system/foundation          https://github.com/waytide/foundation.git          master --squash
git subtree pull --prefix waytide/system/language            https://github.com/waytide/language.git            master --squash
git subtree pull --prefix waytide/system/testing             https://github.com/waytide/testing.git             master --squash
git subtree pull --prefix waytide/system/code/ruby           https://github.com/waytide/code-ruby.git           master --squash
git subtree pull --prefix waytide/system/git                 https://github.com/waytide/git.git                 master --squash
git subtree pull --prefix waytide/system/versioning          https://github.com/waytide/versioning.git          master --squash
git subtree pull --prefix waytide/system/design-by-efferent  https://github.com/waytide/design-by-efferent.git  master --squash
git subtree pull --prefix waytide/system/journal             https://github.com/waytide/journal.git             master --squash
```

Or do it all at once with [`install-all.sh`](install-all.sh), which installs and refreshes every package. Fetch it and run it from your project root:

```
curl -O https://raw.githubusercontent.com/waytide/waytide/master/install-all.sh
sh install-all.sh
```

`sh install-all.sh`, not `./install-all.sh`. The file is committed executable. But `curl` transfers content and not file metadata, so the copy it writes is not executable, whatever mode the original carries. Every other script here is invoked as itself, because every other
script reaches a project by `git subtree`, which does preserve the mode.

## Project-local rules

A project's own rules live in `waytide/local/rules/`, one per file, each named with the ISO-8601-UTC datetime prefix. Its own terms live beside them in `waytide/local/vocabulary.md`. Both are read at session start and bind exactly as an installed package does, and a project's own vocabulary decides over every package's.

`waytide/local/` is never split or pushed, so a project-specific rule cannot leak upstream.

## Origins

Waytide grew out of the design practice the Eventide Project uses in its own work.
The rules were extracted from its [Constant](https://github.com/eventide-project/constant)
project and generalized and consolidated into these packages.

**This composite repository is not itself installed into a project.** It is the
authoring source. A consuming project installs the individual component packages, each with its own repository.

## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
