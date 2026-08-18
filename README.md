# Waytide

**By [the Eventide Project](https://eventide-project.org).**

Reusable agent directives — the rules an AI coding agent reads at the start of a
session — organized into installable **packages**. A package is the unit of
reuse: a project adopts whole packages, never individual rules.

Waytide grew out of the design practice the Eventide Project uses in its own work.
The rules were extracted from its [Constant](https://github.com/eventide-project/constant)
project and generalized and consolidated into these packages.

**This composite repository is not itself installed into a project.** It is the
authoring source. A consuming project installs the individual component packages
below (each has its own repository).

## Packages

- **[foundation](https://github.com/waytide/foundation)**. The `waytide/` artifact system: the
  `rules`/`observations`/`deferred`/`log` directories and how to work with them,
  the one-line decision-log format, the ISO-8601-UTC filename convention, and how
  plans and designs read. Everything includes it.
- **[language](https://github.com/waytide/language)**. How language is used: precisely. Words are load-bearing, so a
  word selection is a design decision. Name concepts literally, drop slang, and one
  rule per substitution.
- **[design-by-efferent](https://github.com/waytide/design-by-efferent)**. Human-in-the-loop, efferent-first design method
  (DBE): hinges and gates, the actuation-first cycle, and the method's own
  `vocabulary.md` lexicon. An updated TDD variant with accommodations for AI.
  Contributes the `logs/loops/` artifact directory.
- **[testing](https://github.com/waytide/testing)**. Controls-based test-writing conventions: variable prefixes, test
  structure and naming, assertion form.
- **[code/ruby](https://github.com/waytide/code-ruby)**. Prescriptive Ruby style.
- **[git](https://github.com/waytide/git)**. Commit conventions.
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
git subtree add --prefix waytide/system/journal            https://github.com/waytide/journal.git            master --squash
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
git subtree pull --prefix waytide/system/journal            https://github.com/waytide/journal.git            master --squash
```

Or do it all at once with [`install-all.sh`](install-all.sh), which installs and refreshes every package. Fetch it and run it from your project root:

```
curl -O https://raw.githubusercontent.com/waytide/waytide/master/install-all.sh
sh install-all.sh
```

`sh install-all.sh`, not `./install-all.sh`. The file is committed executable. But `curl` transfers content and not file metadata, so the copy it writes is not executable, whatever mode the original carries. Every other script here is invoked as itself, because every other
script reaches a project by `git subtree`, which does preserve the mode.

## Project-local rules

Rules specific to a single project live under a `local/` directory that mirrors the package categories, such as `local/language`, `local/testing`, and `local/code/ruby`. It is never split or pushed, so a project-specific rule cannot leak upstream.

## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
