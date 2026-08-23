# The `tools/` grouping becomes `ext/`

The directory that groups Waytide's extensions and externals is renamed from `tools/` to `ext/`.
The rename crosses three repository boundaries, and the content it moves is one package: the Ruby
package, installed at `waytide/system/tools/ruby-lang` and moving to `waytide/system/ext/ruby-lang`.

## The parties

- **This composite, `waytide/waytide`.** It names the grouping in its prose, its scripts, and the
  package rules that give it as an example. It holds no `system/tools/` directory — the Ruby
  package left this repository on 2026-08-21.
- **`waytide/waytide-ruby`.** The Ruby package, authored directly there. Its own `install.sh`
  carries `prefix="waytide/system/tools/ruby-lang"`, which is what decides where a project
  installs it. Nothing splits into this repository from the composite.
- **Each project that holds the package.** The package sits under `waytide/system/tools/ruby-lang`
  as a `git subtree`, and a subtree pull is keyed by that prefix.

## The increments, in order

1. **The composite is renamed and merged to `master`.** Prose, scripts, and package rules say
   `ext/`. `install` accepts `ext/ruby-lang` and no longer accepts `tools/ruby-lang`. The
   distribution test expects `waytide/system/ext/`.
2. **`foundation` is published**, so a project refreshing packages receives the renamed rules.
3. **`waytide/waytide-ruby`'s `install.sh` takes the new prefix.** One line:
   `prefix="waytide/system/ext/ruby-lang"`. From this point a fresh install places the package
   under `ext/`.
4. **Each project holding the package moves its directory.** `git mv waytide/system/tools/ruby-lang
   waytide/system/ext/ruby-lang`, then remove the empty `waytide/system/tools/`, and commit. A
   later `git subtree pull` names the new prefix.

## What is true in between

- **After increment 1 and before increment 3 the suite fails.** The distribution test fetches the
  Ruby installer from that repository's `master` and asserts the installed layout. It expects `ext`
  and receives `tools`. This is the one window where a verified suite is unavailable, and it is
  closed by increment 3 rather than by changing the test back.
- **A project that has not run increment 4 keeps working.** Its installed rules are read from
  wherever they sit, and the grouping directory's name is not read by anything at session start.
  `session-start.sh` finds a package by its `README.md` at depth 2 or 3, whatever the grouping is
  called.
- **A subtree pull against the old prefix keeps working too**, until the directory moves. The
  prefix is an argument rather than a recorded property, so nothing breaks on its own.
- **A fresh install between increments 1 and 3 fails on the name.** `install` no longer accepts
  `tools/ruby-lang`, and the Ruby installer still places that path. The window is the same one the
  suite reports.

## What is not done

- **No repository is renamed.** `waytide/waytide-ruby` keeps its name, which the package declares
  rather than deriving from its path. `waytide/tools-ruby-lang` exists from the 2026-08-21
  migration and is not touched by this one.
- **A historical record keeps `tools/`.** The decision log, the completed Tool-Specific
  Distribution record, its loop record, and the 2026-08-21 migration record state what was true
  when they were written.

## What happened

- **2026-08-23 — increment 1 is built** on `feature/ext-grouping`.
- **2026-08-23 — a defect was found in increment 3's file, and it is not this migration's.**
  `waytide/waytide-ruby`'s `install.sh` fetches the composite's root installer from
  `.../waytide/master/install-all.sh`. The composite renamed that script to `install` on
  2026-08-23, and pushing `master` that day made the rename live. The fetch has returned 404
  since, and every Ruby install fails with curl exit 56. The distribution test's failure in this
  window is that defect rather than the ordering this record predicted.
- **2026-08-23 — increment 3 is written and is not pushed.** Two commits sit in a clone of
  `waytide/waytide-ruby`: the base-installer repair, and the prefix moving to
  `waytide/system/ext/ruby-lang` with the README and `install-dependencies.sh` beside it. The
  push was refused by the harness's permission classifier. Until it lands, the 404 stands and the
  distribution test cannot pass.
- **The increments ran out of order, and the record says so rather than being rewritten.** The
  repair is a live break and did not wait for its place in the sequence.
- **2026-08-23 — increment 3 is done.** `3f79edf..3852ac7` is on `waytide/waytide-ruby`'s
  `master`. The 404 is closed and a fresh install places the package at
  `waytide/system/ext/ruby-lang`. The suite is verified from this point: three files, 0 failed,
  0 aborted.
- **2026-08-23 — increment 1 is merged**, and increment 2 follows it.

---
Authored by Scott Bellware on Sun Aug 23 2026 at 1:09:22 PM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:31:50 PM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:41:07 PM PT
