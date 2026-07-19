# Waytide

**By [the Eventide Project](https://eventide-project.org).**

Reusable agent directives — the rules an AI coding agent reads at the start of a
session — organized into installable **packages**. A package is the unit of
reuse: a project adopts whole packages, never individual rules.

Waytide grew out of the design practice the Eventide Project uses in its own work.
The rules were extracted from its [Constant](https://github.com/eventide-project/constant)
project and generalized and consolidated into these packages.

**This composite repository is not itself installed into a project.** It is the
authoring source; a consuming project installs the individual component packages
below (each has its own repository).

## Packages

- **[foundation](https://github.com/waytide/foundation)**. The `agent/` artifact framework: the
  `rules`/`observations`/`deferred`/`log` directories and how to work with them,
  the one-line decision-log format, and the ISO-8601-UTC filename convention.
  Everything includes it.
- **[language](https://github.com/waytide/language)**. How language is used: precisely. Words are load-bearing, so a
  word choice is a design decision. Name concepts literally, drop slang, and one
  rule per substitution.
- **[design-by-efferent](https://github.com/waytide/design-by-efferent)**. Human-in-the-loop, efferent-first design method
  (DBE): hinges and gates, the actuation-first cycle, and the method's own
  `vocabulary.md` lexicon. An updated TDD variant with accommodations for AI.
  Contributes the `loops/` artifact directory.
- **[testing](https://github.com/waytide/testing)**. Controls-based test-writing conventions: variable prefixes, test
  structure and naming, assertion form.
- **[code/ruby](https://github.com/waytide/code-ruby)**. Prescriptive Ruby style.
- **[git](https://github.com/waytide/git)**. Commit conventions.
- **[plan](https://github.com/waytide/plan)**. How plans and design documents are written. Despite the name, it covers design docs as well as plans.

A package that has dependencies carries an `install-dependencies.sh` that installs
them; a standalone package has none. Each arrow below points from a package to the
packages it depends on (`→` reads "includes"):

```
design-by-efferent  →  foundation, language, testing
testing             →  foundation, language
code/ruby           →  foundation, language
language            →  foundation

foundation          →  (nothing — the base every other package builds on)
git                 →  (nothing — standalone)
plan                →  (nothing — standalone)
```

## Using a package in a project

A consuming project installs a package with `git subtree`, which places the
package's files physically into the project's `agent/rules/` tree so they are
committed alongside the code and read at session start:

```
git subtree add  --prefix agent/rules/testing https://github.com/waytide/testing.git master --squash
git subtree pull --prefix agent/rules/testing https://github.com/waytide/testing.git master --squash
```

Dependency packages are not installed automatically. If the package has an `install-dependencies.sh`, run it from your project root to install them; otherwise the package is standalone.

### Installing all packages

To adopt the whole set, install each package:

```
git subtree add --prefix agent/rules/foundation          https://github.com/waytide/foundation.git          master --squash
git subtree add --prefix agent/rules/language            https://github.com/waytide/language.git            master --squash
git subtree add --prefix agent/rules/testing             https://github.com/waytide/testing.git             master --squash
git subtree add --prefix agent/rules/code/ruby           https://github.com/waytide/code-ruby.git           master --squash
git subtree add --prefix agent/rules/git                 https://github.com/waytide/git.git                 master --squash
git subtree add --prefix agent/rules/plan                https://github.com/waytide/plan.git                master --squash
git subtree add --prefix agent/rules/design-by-efferent  https://github.com/waytide/design-by-efferent.git  master --squash
```

Refresh any package later using `git subtree pull`:

```
git subtree pull --prefix agent/rules/foundation          https://github.com/waytide/foundation.git          master --squash
git subtree pull --prefix agent/rules/language            https://github.com/waytide/language.git            master --squash
git subtree pull --prefix agent/rules/testing             https://github.com/waytide/testing.git             master --squash
git subtree pull --prefix agent/rules/code/ruby           https://github.com/waytide/code-ruby.git           master --squash
git subtree pull --prefix agent/rules/git                 https://github.com/waytide/git.git                 master --squash
git subtree pull --prefix agent/rules/plan                https://github.com/waytide/plan.git                master --squash
git subtree pull --prefix agent/rules/design-by-efferent  https://github.com/waytide/design-by-efferent.git  master --squash
```

Or do it all at once with [`install-all.sh`](install-all.sh), which installs and refreshes every package. Fetch it and run it from your project root:

```
curl -O https://raw.githubusercontent.com/waytide/waytide/master/install-all.sh
sh install-all.sh
```

## Project-local rules

Rules specific to a single project live under a `local/` directory that mirrors
the package categories (`local/language`, `local/testing`, `local/code/ruby`)
and is never split or pushed, so a project-specific rule cannot leak upstream.

## License

Waytide is in early development and is **not yet licensed for use** — all rights
reserved. A license, the Eventide Common Interest License, is forthcoming.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
