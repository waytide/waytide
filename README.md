# Agent Norms

Reusable agent directives — the rules an AI coding agent reads at the start of a
session — organized into installable **packages**. A package is the unit of
reuse: a project adopts whole packages, never individual rules.

**This composite repository is not itself installed into a project.** It is the
authoring source; a consuming project installs the individual component packages
below (each has its own repository).

## Packages

- **[foundation](https://github.com/eventide-project/agent-norms-foundation)**. The `agent/` artifact framework: the
  `rules`/`observations`/`deferred`/`log` directories and how to work with them,
  the one-line decision-log format, and the ISO-8601-UTC filename convention.
  Everything includes it.
- **[language](https://github.com/eventide-project/agent-norms-language)**. How language is used: precisely. Words are load-bearing, so a
  word choice is a design decision. Name concepts literally, drop slang, and one
  rule per substitution.
- **[design-by-efferent](https://github.com/eventide-project/agent-norms-design-by-efferent)**. Human-in-the-loop, efferent-first design method
  (DBE): hinges and gates, the actuation-first cycle, and the method's own
  `vocabulary.md` lexicon. An updated TDD variant with accommodations for AI.
  Contributes the `loops/` artifact directory.
- **[testing](https://github.com/eventide-project/agent-norms-testing)**. Controls-based test-writing conventions: variable prefixes, test
  structure and naming, assertion form.
- **[code/ruby](https://github.com/eventide-project/agent-norms-code-ruby)**. Prescriptive Ruby style.
- **[git](https://github.com/eventide-project/agent-norms-git)**. Commit conventions.
- **[docs](https://github.com/eventide-project/agent-norms-docs)**. Documentation conventions for design docs and implementation plans.

Each package declares its dependencies in a `package.md` file with an `include:`
line. Including a package pulls in the packages it includes. The tree below nests
each package under what it builds on (indentation = "includes"):

```
foundation                       (base — everything builds on it)
└── language
    ├── testing
    │   └── design-by-efferent
    └── code/ruby

git                              (standalone — no dependencies)
docs                             (standalone — no dependencies)
```

Read top-down, a package includes every package above it in its branch:
`design-by-efferent` pulls in `testing`, `language`, and `foundation`; `testing`
and `code/ruby` pull in `language` and `foundation`; `language` pulls in
`foundation`.

## Using a package in a project

A consuming project installs a package with `git subtree`, which places the
package's files physically into the project's `agent/rules/` tree so they are
committed alongside the code and read at session start:

```
git subtree add  --prefix agent/rules/testing https://github.com/eventide-project/agent-norms-testing.git master --squash
git subtree pull --prefix agent/rules/testing https://github.com/eventide-project/agent-norms-testing.git master --squash
```

Dependency packages are not installed automatically. Consult a package's `package.md` for the packages it includes, and add those too.

### Installing all packages

To adopt the whole set, install each package:

```
git subtree add --prefix agent/rules/foundation          https://github.com/eventide-project/agent-norms-foundation.git          master --squash
git subtree add --prefix agent/rules/language            https://github.com/eventide-project/agent-norms-language.git            master --squash
git subtree add --prefix agent/rules/testing             https://github.com/eventide-project/agent-norms-testing.git             master --squash
git subtree add --prefix agent/rules/code/ruby           https://github.com/eventide-project/agent-norms-code-ruby.git           master --squash
git subtree add --prefix agent/rules/git                 https://github.com/eventide-project/agent-norms-git.git                 master --squash
git subtree add --prefix agent/rules/docs                https://github.com/eventide-project/agent-norms-docs.git                master --squash
git subtree add --prefix agent/rules/design-by-efferent  https://github.com/eventide-project/agent-norms-design-by-efferent.git  master --squash
```

Refresh any package later with the same line using `git subtree pull`.

## Project-local rules

Rules specific to a single project live under a `local/` directory that mirrors
the package categories (`local/language`, `local/testing`, `local/code/ruby`)
and is never split or pushed, so a project-specific rule cannot leak upstream.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
