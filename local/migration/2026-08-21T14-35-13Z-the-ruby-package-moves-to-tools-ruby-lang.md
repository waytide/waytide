# The Ruby package moves to `tools-ruby-lang`

The Ruby rules leave this composite and are authored in `waytide/tools-ruby-lang` from then on.
`waytide/code-ruby` is retired. The composite's default distribution drops to seven packages.

## Source and destination

- **Source:** `waytide/waytide`, the composite, at `system/code/ruby/` — 12 rule files, a
  `README.md`, a `LICENSE`, and `install-dependencies.sh`.
- **Destination:** `waytide/tools-ruby-lang`, which already exists and holds `install.sh`,
  `README.md`, and a `LICENSE`.
- **Retired:** `waytide/code-ruby`, the component repository the composite has been publishing
  `system/code/ruby/` to since 2026-07-17.

## Why it crosses a boundary rather than moving inside one

**The dependency direction is `tools-ruby-lang → waytide`.** A Ruby project installs the Ruby package
and gets the rest of Waytide with it. That is the ordinary package-dependency shape, and the
existing mechanism carries it: a package with dependencies carries an `install-dependencies.sh`.

**What is unusual is only the size of the dependency.** Every other package names one, two, or
three. This one names the other seven, and it is the only package that installs the whole set.

**So the composite stops being the authoring source for one package.** `CONTRIBUTING.md` states
that all authoring happens here and that component repositories only ever receive. That stays true
of the seven that remain. It stops being true of Ruby, and the exception is stated rather than
left to be inferred.

## The increments, in order

1. **The 12 rule files, the `README.md`, and `install-dependencies.sh` are copied into
   `tools-ruby-lang`.** Nothing is removed from the composite yet.
2. **`install-dependencies.sh` is rewritten there** to install the seven rather than the two it
   names today, and to place the activation the composite's `install-all.sh` places.
3. **`install.sh` is adjusted** to take the Ruby package from `tools-ruby-lang` rather than from
   `code-ruby`.
4. **`code/ruby` is removed from the composite's `install-all.sh`.** The default distribution is
   seven packages from this point.
5. **`system/code/` is removed from the composite**, which is when the composite stops holding the
   Ruby rules at all.
6. **The composite's `README.md` and `CONTRIBUTING.md` are reconciled** — the package list, the
   dependency graph, the package count, and the `code/ruby` split example.
7. **The nine rule files and two scripts that cite `code/ruby` are read**, and any that state a
   path rather than a name are corrected.
8. **`waytide/code-ruby` is archived**, its `README.md` naming `tools-ruby-lang` in its place.

## What is true in between

- **After 1 and before 5, the rules exist in two repositories.** The composite is authoritative
  for them until 5. A change made in `tools-ruby-lang` in that window is lost when 5 runs, unless it
  is made in the composite too.
- **After 4 and before 8, a project installing the base set gets no Ruby rules**, and
  `waytide/code-ruby` still serves the copy the composite last published to it. The two are
  consistent until 5, and after 5 that repository holds content nothing authors.
- **Between 5 and 8 the retired repository is still installable.** Archiving it is what stops
  that, which is why 8 is last rather than first.
- **Nothing here changes an installed project.** A project that holds `waytide/system/code/ruby/`
  keeps what it has until it changes where it pulls from.

## What this migration does not decide

- **Whether the grouping is `code/` or `tool/`.** That question is *The grouping is `tool/`, not a
  language*, and it partly dissolves here: with `system/code/` gone from the composite, there is no
  grouping directory left to rename. What survives of it is what a second tool package would be
  called and where it would live.
- **What a second tool package looks like.** Ruby is the only one, and this migration is written
  for the one that exists rather than for a pattern.
- **Whether `install.sh` and `install-dependencies.sh` both survive.** Both are kept, and they
  answer different starting points: a bare directory, and a project that already holds the package.

## Record of what happened

**2026-08-21 — increments 1 through 7 ran. Increment 8 has not.**

- **1 and 2 ran together**, and the destination README merged with the one already there. The 12
  rule files came across unchanged: they reference each other by name rather than by path, so
  nothing in them needed correcting.
- **2 departed from the plan.** The plan said `install-dependencies.sh` would be rewritten to
  install the seven. It names none of them. Every other one names a few, and writing all seven out
  would put the package set in a second place — which is the defect this feature exists against. It
  fetches and runs the composite's installer instead, so the set is asserted once, upstream.
- **3 was already done**, by the repository rename that preceded the migration.
- **4 and 5 ran.** `install-all.sh` installs seven, and `system/code/` is removed.
- **6 and 7 ran together.** The counts, the package list, and the dependency graph in the root
  README; the two `CONTRIBUTING.md` passages, one of which now states the authored-elsewhere
  exception outright; seven rule files that named the package; and the four scripts whose comments
  used `code/ruby` as their worked example of a grouped package.
- **A repository name changed under the plan.** The record was written naming `waytide-ruby`. The
  installed location was then settled as `tools/ruby-lang`, and the repository renamed
  `tools-ruby-lang` so that `refresh-packages.sh` still derives a repository from a directory by
  flattening the path. The record was repointed before increment 1 ran.

**Increment 8 waits, and so does the publish.** `waytide/code-ruby` still holds what the composite
last published to it, and is still installable. The local rule a-package-is-published-from-master
holds the publish until this work reaches `master`, and archiving before that would strand anyone
mid-move — which is why the ordering put it last.

---

Authored by Scott Bellware on Fri Aug 21 2026 at 7:35:13 AM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:51 AM PT
