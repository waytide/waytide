# The source is compiled before a package is published

**Before a package is published, run `./compile.sh` from the repository root, and commit what it changes.** A publish is a `git subtree split` of committed history. It carries the compiled rules as they were last committed, not as the source now reads, so a compile that is not committed does not reach the component repository.

**A compile that changes nothing is the ordinary case.** Every source edit should already have been compiled before it was committed. A compile that changes a file means a compiled rule was stale on `master`. That change is committed on `master` before the split, with the suite run first, as any commit is.

**The compiled rules are what a consuming project reads.** Its session-start read opens the compiled rules at each package root, and leaves out `source/`. A stale compiled rule is therefore a rule the consuming project follows in a form its source no longer says. Nothing in the consuming project can catch it, because the consuming project has no compiler.

**Why:** the compiled rules are committed, so they can fall out of step with their sources, and nothing yet reports it. Publishing is the last point at which a stale compiled rule can be caught in this repository. After it, every project that refreshes the package receives it.

**How to apply:** after the work is on `master` and before the split, run `./compile.sh`. Where `git status` then shows a changed compiled rule, run the suite and commit it on `master`. Then publish, following `CONTRIBUTING.md`.

## Compressed

## Before a publish

1. After the work is on `master` and before the `git subtree split`, run `./compile.sh` from the repository root.
2. Commit what it changes. A publish is a `git subtree split` of committed history, so it carries only committed compiled rules.
3. Where `git status` shows a changed compiled rule, that rule was stale on `master`. Run the suite, then commit it on `master` before the split.
4. Then publish, following `CONTRIBUTING.md`.

## Keeping compiled rules current

1. Compile every source edit before committing it, so a compile before a publish ordinarily changes nothing.
2. A consuming project reads the compiled rules at each package root and leaves out `source/`, and has no compiler. Do not publish a stale compiled rule.

## Compression

- 2026-10-29, compressed: 1561 → 754 characters; checked: 15 directives, 10 kept, 3 less precise, 2 lost; 2 repairs, re-checked: 16 directives, 13 kept, 2 less precise, 1 lost; what is still not kept was judged reasons or background

Related:

- the a-package-is-published-from-master rule — the publish this precedes, and when a publish may happen at all
- `CONTRIBUTING.md` — the publish procedure, which carries this step
- the foundation a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule — the source and compiled rules, and the History section the compiler leaves out

---

Authored by Scott Bellware on Wed Oct 14 2026 at 1:43:51 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
