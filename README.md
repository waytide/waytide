# Agent Norms

Reusable agent directives — the rules an AI coding agent reads at the start of a
session — organized into installable **packages**. A package is the unit of
reuse: a project adopts whole packages, never individual rules.

## Packages

- **[foundation](https://github.com/eventide-project/agent-norms-foundation)** — the `agent/` artifact framework: the
  `rules`/`observations`/`deferred`/`log` directories and how to work with them,
  the one-line decision-log format, and the ISO-8601-UTC filename convention.
  Everything includes it.
- **[language](https://github.com/eventide-project/agent-norms-language)** — how language is used: precisely. Words are load-bearing, so a
  word choice is a design decision. Name concepts literally, drop slang, and one
  rule per substitution.
- **[design-by-efferent](https://github.com/eventide-project/agent-norms-design-by-efferent)** — the human-in-the-loop, efferent-first design method
  (DBE): hinges and gates, the actuation-first cycle, and the method's own
  `vocabulary.md` lexicon. A variant of TDD with accommodations for AI.
  Contributes the `loops/` artifact directory.
- **[testing](https://github.com/eventide-project/agent-norms-testing)** — controls-based test-writing conventions: variable prefixes, test
  structure and naming, assertion form.
- **[code/ruby](https://github.com/eventide-project/agent-norms-code-ruby)** — prescriptive Ruby style.
- **[git](https://github.com/eventide-project/agent-norms-git)** — commit conventions.
- **[docs](https://github.com/eventide-project/agent-norms-docs)** — documentation conventions for design docs and implementation plans.

Each package declares its dependencies in a `package.md` file with an `include:`
line. Including a package pulls in the packages it includes.

```
foundation ──► (everything)

language ──► testing
language ──► code/ruby
language, testing ──► design-by-efferent

git   (standalone)
docs  (standalone)
```

## Using a package in a project

A consuming project installs a package with `git subtree`, which places the
package's files physically into the project's `agent/rules/` tree so they are
committed alongside the code and read at session start:

```
git subtree add  --prefix agent/rules/testing https://github.com/eventide-project/agent-norms-testing.git master --squash
git subtree pull --prefix agent/rules/testing https://github.com/eventide-project/agent-norms-testing.git master --squash
```

Consult a package's `package.md` for the packages it includes, and add those too.

## Project-local rules

Rules specific to a single project live under a `local/` directory that mirrors
the package categories (`local/language`, `local/testing`, `local/code/ruby`)
and is never split or pushed, so a project-specific rule cannot leak upstream.

---

See [CONTRIBUTING.md](CONTRIBUTING.md) for authoring the packages themselves.
