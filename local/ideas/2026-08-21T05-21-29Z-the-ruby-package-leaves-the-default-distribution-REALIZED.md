# The Ruby package leaves the default distribution, and a `waytide-ruby` distribution installs it with the rest

- **State:** Realized
- **Tags:** [design]

**Why this state:** what the idea describes exists. The engineer declared it implemented on
2026-08-24.

## Settled

- **2026-08-24 — the idea is realized.** The Ruby package left the composite on 2026-08-21 through
  the Tool-Specific Distribution feature, and the record was not updated at the time.
- **2026-08-24 — `waytide-ruby` is a repository of its own**, which was the third of the three
  candidates. The package is authored there directly rather than split out of this composite, and
  it installs at `waytide/system/ext/ruby-lang/` under a `**Repository:**` declaration, since the
  flattening rule would give a different name.
- **2026-08-24 — it composes rather than duplicates.** Its dependency is every package this
  composite holds, which is what makes installing it enough for a Ruby project. No second copy of
  the default list was written.
- **2026-08-24 — the grouping is `ext/` rather than `code/` or `tools/`**, renamed after this
  record was written. The paths below say `code/` because that is what they said at the time.

## Premise

**As the engineer stated it:** remove the Ruby package from the default distribution, and ship it
via a `waytide-ruby` package that installs it, and the rest of Waytide.

## Background & Motivation

**`code/ruby` is the only package that names a language, and it is installed by default.**
`install-all.sh` hardcodes eight `add` lines and `code/ruby` is one of them. A project that is not
Ruby receives prescriptive Ruby style — `build` against `new`, no prepositions in method names, the
positional-default spacing — and every rule of it is inert.

**The cost is not only the inert files.** They are read at session start with everything else, and
the rules-convention's read is unconditional. So a non-Ruby project pays the read on every session
for rules that cannot apply.

**Nothing else in the system assumes eight.** The session-start notice enumerates the package
directories actually present. `refresh-packages.sh` discovers what is installed.
`report-direct-commits.sh` finds packages by their `README.md`. **`install-all.sh` is the only
place the set is asserted rather than read**, which CONTRIBUTING already notes when it says that
script needs changing when a package is added and the direct-commit check does not.

**The shape generalizes past Ruby.** `code/` is a grouping directory rather than a package, and
`code/ruby` is its only member today. A second language would raise the same question, so what is
settled here decides that case too.

## What is unsettled

- **What a distribution is.** Waytide has packages and it has one installer. It has no named
  concept for *the set a project gets by default*. This introduces one, and where it is defined —
  a rule, a script, or only a README — is open.
- **What `waytide-ruby` is.** Every Waytide package is a directory of rule files under `system/`
  with a `README.md`. A package whose whole content is *install these others* has no rules, which
  no convention describes. The candidates are a package with no rules, a script beside
  `install-all.sh`, or a repository of its own that carries only an installer.
- **Whether it composes or duplicates.** `install-all.sh` installs the set. A `waytide-ruby` that
  installs `code/ruby` **and the rest** either invokes that script or restates its list. The second
  is a second place the set is asserted, which is the defect this idea is partly about.
- **The naming.** Component repositories are named for their package, and `code/` flattens to
  `code-`, giving `waytide/code-ruby`. `waytide-ruby` is a different naming space — a repository
  named for a distribution rather than for a package. Whether the two conventions can sit in one
  org without confusing a reader is not settled.
- **Whether `install-dependencies.sh` already covers part of it.** `code/ruby` declares
  `foundation` and `language`, so its dependency script installs those two. It does not install
  `testing`, `git`, `versioning`, `design-by-efferent`, or `journal`, so it is not the mechanism
  this asks for — but it is the existing mechanism nearest to it.

## What it reaches

- **`install-all.sh`** — the hardcoded list, and its own description of what it installs.
- **The root `README.md`** — the *112 rule files and 6 vocabularies across 8 packages* line, the
  package list, and the Install Waytide section.
- **`CONTRIBUTING.md`** — the publish procedure, if a distribution repository is added to the set
  that is split and pushed.
- **`system/code/ruby/README.md`** — its install instructions, if a project reaches it a new way.

**No rule names `code/ruby` as required by anything.** The `git` run-suite-before-commit rule and
the `testing` test-tree-command rule each cite it for the Ruby specifics and each is written to
work without it. That is the a-citation-is-not-a-dependency rule's model citation shape, so
removing Ruby from the default breaks no rule.

## Out of Scope / Deferred

- **What a second language package would be called**, and whether each language gets a
  distribution of its own. The shape settled here decides it, and it is not decided here.
- **Whether the default set should shrink further.** Ruby is the only language-named package, and
  whether any other package is equally optional is a separate question.

Related:

- the `git` package declares itself standalone and is not — the sibling record about package
  boundaries and language-specificity. Its first complaint is superseded: the stack-specific
  naming it reports in `run-suite-before-commit` was moved to `code/ruby`, and its second is
  answered by the a-citation-is-not-a-dependency rule.
- the a-citation-is-not-a-dependency rule — why no rule breaks when Ruby leaves the default
- `CONTRIBUTING.md` — the publish procedure a distribution repository would join

---

Authored by Scott Bellware on Thu Aug 20 2026 at 10:21:29 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:19:07 PM PT
