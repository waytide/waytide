# Waytide: Human-Agent Relations

By [The Eventide Project](https://eventide-project.org)

The engineer decides. The agent generates. Where there is ambiguity, the agent gives the engineer options, including the option to take control.

Waytide offers a project five things: rules that direct the agent's behavior, work that records itself, a design method with the engineer in control at decision points, local extensibility, and the machinery that installs and activates all of it.

## Rules that direct the agent's behavior

- **Rules loaded fresh at startup.** The entire rule set is read and loaded by the agent at session start, rather than the agent only applying what it remembers.
- **Files, not memory.** Memory is written to disk, in the project's own `waytide/` directory, rather than kept in the agent's. Committed with the code, and so reviewable, diffable, and versioned like the code. An agent memory store is fed by the committed artifacts.
- **One rule per file, written in prose.** A rule is in one file and written in prose. They're readable and understandable, and easy to find and identify in your project's directories.
- **Work that records itself.** Comprehensive logging and recording of the engineer's decisions and the agent's actions.
- **Extensible locally.** local/rules/ for a project's own rules, local/vocabulary.md for its own terms, both binding and both having precedence over Waytide's own.
- **Installed as packages.** A consuming project installs packages, rather than single rules. With tools for installing and refreshing packages, and reporting on changes.

## A design method with the engineer in control at decision points

- **Design By Efferent.** The design process anchored in proof. The call written before any implementation, shaping the interface by its intended use. An updated TDD variant with accommodations for AI.
- **Gates, not ceremony.** The loop waits only where a decision is subtle and load-bearing. No pause at a red or green bar — unless you want to. Running the red, green, refactor cycle is a choice the implementation checkpoint offers, not a ritual it performs.
- **Five checkpoints:** The "hinges", in DBE parlance. The call, the way to prove the call's effects, the conditions necessary for proving it, the implementation of the feature, and any follow-up clarifications or evolutions. The agent provides reasonable assumptions and options, or the engineer takes the helm.
- **Options, never a single proposal.** Every checkpoint is a gate that presents possible solutions. A free-text escape hatch at every decision lets the engineer go their own way rather than just rubber stamp the agent.
- **Attended or unattended.** The engineer chooses whether to let the agent run free at the start of every iteration, or to check in at every hinge to allow the engineer to decide the key points. The methodology is respected either way. Only the amount of unchecked work changes.

## The work records itself

**These directories are the memory.** They sit under `waytide/local/`, they are committed with the code, and they are read at the start of a session rather than recalled.

- **ideas/** — Designs, plans, aspirations, observations, specifications. One class of record, differentiated by tags and status.
- **logs/** — The decision log (one file, one line, one decision), loop records, work session records. Written by the agent at the appropriate time.
- **implementations/** — Features and experiments, each with a branch or a working tree, a working location chosen at the start, a lifecycle, a declared end, and recorded confirmations.
- **journal/** — The engineer's periodic record, written by the engineer in their own words. The agent only reads these records. Read at session start, but not binding.
- **migration/** — Execution plans for rules and content moving to or from another repository, or to shape existing artifacts to changes to the Waytide system, or even a project's own local rules.

## Project-local rules

A project's own rules live in `waytide/local/rules/`, one per file, each named with the ISO-8601-UTC datetime prefix. Its own terms live beside them in `waytide/local/vocabulary.md`. Both are read at session start and bind exactly as an installed package does, and a project's own local rules and vocabulary overrule those in the base system.

## Domain conventions

- **Language.** Words treated as design decisions, literal naming, no slang, and Eventide Technical English (ETE) extended from the [ASD-STE100](https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf).
- **Testing.** Controls rather than fixtures, actuate once and assert each outcome, preconditions, naming.
- **Git.** Subject-first messages, test suite before the commit decision, no Claude co-author trailer, an announced branch switch.
- **Versioning.** What each digit in a version number means, and the next version decision options presented to the engineer.

## Machinery

- **Activation.** install.sh places the AGENTS.md bootstrap and .claude/settings.json. A SessionStart hook carries the read instruction and prints what is installed. A status line keeps the system's presence on screen.
- **Package sets.** A named list of packages, installable by name. A project that holds more than it wants can declare the set it runs, and the rest deactivate without being uninstalled.
- **The deferred queue.** Printed at startup, so parked work is not lost by going unread.
- **Commands.** Status report, test report, test tree, lib report, next deferred item, timeline.
- **11 scripts.** Installed with the packages or held at the authoring root.

## Install Waytide

Waytide's packages are installed using `git subtree`. Each package is its own subtree, which allows the packages to be refreshed from the source.

Install all of Waytide's packages at once with:

```
curl -O https://raw.githubusercontent.com/waytide/waytide/master/install
sh install
```

The `install` script installs and refreshes packages. It takes a list of names. A name is either the name of a package set or a package. With no arguments it installs the default set.

### Warning

Execute the install script using `sh`:

`sh install`

The script fetches the packages over SSH. Where no SSH key is registered, run it as `WAYTIDE_ORIGIN=https://github.com/waytide sh install`.

The file is committed as an executable, but `curl` transfers content and not file metadata. The copy it writes is not executable, whatever mode the original carries. Every other script here is invoked as itself, because every other script reaches a project by `git subtree`, which does preserve the mode.

### Package sets

A **package set** is a named list of packages, so a configuration that is wanted more than once is asked for by name rather than assembled again. Two exist:

- **`default`** — `foundation`, `language`, `testing`, `git`, `versioning`, `design-by-efferent`, `journal`. Everything except the tool-specific packages. This is what no arguments installs.
- **`content`** — `foundation`, `language`, `git`, `versioning`, `journal`. For a project whose product is prose or pages: articles, lessons, slide decks, a site. It leaves out `design-by-efferent`, whose five hinges are a design method for a unit of code, and `testing` with it.

```
sh install                 # the default set
sh install content         # a package set
sh install foundation git  # packages by name
sh install content journal # a set and a package together
```

A set's members are installed as ordinary packages. Nothing records which set asked for them, and a project that installed `content` is indistinguishable afterward from one that named those five packages itself.

## Running fewer packages than you installed

Installing a subset is one way to run a package set. The other is to **declare one in a project that already holds more packages than it wants active**, which uninstalls nothing. A project that installed everything and later wants five packages does not have to take three back out.

A project declares it by writing a record under `waytide/local/`, named for the moment it was made and for what it names:

```
waytide/local/2026-08-23T09-30-00Z-content-package-set.md

- **Package set:** content
- **Packages:** foundation, git, journal, language, versioning
- **Inactive:** design-by-efferent, testing
```

Multiple package set files can be recorded over time. The most recent one controls. The earlier records are the history of what the project ran previously. Where no record exists, every installed package is active.

**Every installed package is still read at session start.** The declaration governs which rules are **applied**, not which are read: a rule that is read and withheld can be cited, weighed, and reactivated within the session, and one that was never read cannot. The session-start read stays unconditional.

**A set declared during a session takes effect at the next one.** The rules are already in the agent's context by then and there is no unread, so the agent says that a restart is needed rather than letting the declaration look as though it did nothing.

The list of installed packages is printed at the start of a session, under the title — the active packages in bold and the deactivated ones in italic, with a count of how many of the installed packages are active.

## Packages

- **[foundation](https://github.com/waytide/foundation)**. The `waytide/` artifact system: the `rules/` and `vocabulary.md` that bind, and the `ideas/`, `logs/`, `implementations/`, and `migration/` directories the work is recorded in. The one-line decision-log format, the ISO-8601-UTC filename convention, the tag protocol, and the implementation lifecycle. Everything includes it.
- **[language](https://github.com/waytide/language)**. How language is used: precisely. Words are load-bearing, so a word selection is a design decision. Name concepts literally, drop slang, and keep the settled substitutions in the package's `vocabulary.md`. Carries Eventide Technical English, Waytide's implementation of ASD-STE100.
- **[design-by-efferent](https://github.com/waytide/design-by-efferent)**. Human-in-the-loop, efferent-first design method (DBE): hinges and gates, the actuation-first cycle, and the method's own `vocabulary.md` lexicon. An updated TDD variant with accommodations for AI. Contributes the `logs/loops/` artifact directory.
- **[testing](https://github.com/waytide/testing)**. Controls-based test-writing conventions: variable prefixes, test structure and naming, assertion form.
- **[git](https://github.com/waytide/git)**. Commit conventions, and the one branch operation the agent announces.
- **[versioning](https://github.com/waytide/versioning)**. What a version means and how the next one is chosen: semver, optionally prefixed by a product generation number. Not how a package is built or published.
- **[journal](https://github.com/waytide/journal)**. The engineer's periodic record, written by the engineer in their own words. The agent only reads these records. Read at session start, but not binding. Contributes the `journal/` artifact directory.

A package that has dependencies carries an `install-dependencies.sh` that installs them. A standalone package has none. Each arrow below points from a package to the packages it depends on (`→` reads "includes"):

```
design-by-efferent  →  foundation, language, testing
testing             →  foundation, language
language            →  foundation
journal             →  foundation

foundation          →  (nothing — the base every other package builds on)
git                 →  (nothing — standalone)
versioning          →  (nothing — standalone)

ext/ruby-lang       →  every package above
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

## Extensions and externals

Most of Waytide is about how the work is done, whatever a project is built with. Some of it is not. For example, programming language-specific style, the command that runs a test suite, and the mechanics of releasing a package are about **a tool a project uses**, and they are inert in a project that does not use it.

Those live in **`ext/`**, one package per subject. Such a package is not part of the default distribution — a project takes what it needs, and takes nothing from the tools it does not use.

**More are to come.** An **external** is something Waytide did not write and does not govern, and an **extension** is something that adds to Waytide. A language, a test framework, a package manager, and a build system are each one or the other, and their directories are in `ext/`.

**Such a package is authored in its own repository**, rather than here and then split out. It holds rules for something this composite has no other reason to know about.

## Origins

Waytide grew out of the design system that the Eventide Project uses in its own work. The rules were extracted from its [Constant](https://github.com/eventide-project/constant) project and generalized and consolidated into these packages.

**This composite repository is not itself installed into a project.** It is the authoring source. A consuming project installs the individual component packages, each with its own repository.

## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
