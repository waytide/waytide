# The `[work-item]` tag becomes `[work]`

**An item that is a piece of work to be done is tagged `[work]`, in place of `[work-item]`.** The engineer settled the name in the item `2026-10-29T16-24-42Z-waytide-skills`. This record plans the change in this repository and in every project that installs `foundation`.

## Source and destination

- **Source:** the tag `[work-item]`, and the phrase *work item*, in four `foundation` rules and in the items that carry the tag.
- **Destination:** the tag `[work]`, in the same rules and items.
- **Repositories:** this one, the `foundation` component repository it publishes to, and each project that installs `foundation`. No consuming project is named here.

## Increments, in order

1. The four `foundation` rules name `[work]`, on the branch `feature/worktree/skills`: the-items-directory-holds-one-file-per-item, a-record-may-be-categorized-with-square-bracket-tags, a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state, and a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case.
2. The skills feature completes, and the branch merges to `master`.
3. This repository's items tagged `[work-item]` are converted to `[work]` on `master`. One item carries it: `2026-10-25T21-01-56Z-the-log-is-called-the-log`.
4. `foundation` is compiled and published from `master`, following `CONTRIBUTING.md`.
5. Each consuming project refreshes `foundation`, and its items tagged `[work-item]` are converted to `[work]`.

**How a consuming project's items are converted:** the `foundation` installer converts them, as it renamed `local/sessions/` and carries observations from `Stated` to `Recorded`. It changes `[work-item]` to `[work]` on each item's `**Tags:**` line and reports each file it changed. The engineer settled this on 2026-10-29. The installer change is code, and Design By Efferent governs it.

## What is true in between

- **Between increments 1 and 2:** `master` names `[work-item]`, and the skills branch names `[work]`. `master` is authoritative.
- **Between increments 2 and 3:** this repository's rules name `[work]`, and one of its items carries `[work-item]`, which no rule then names.
- **Between increments 4 and 5, in each consuming project:** the project's installed rules name `[work-item]` until it refreshes. After it refreshes and before its items are converted, its items carry a tag its rules no longer name.
- **Text that records history keeps the old word.** A log entry, a rule's History section, and the History of an item are not revised.

## What happened

- **2026-10-29** — Increment 1 is made on `feature/worktree/skills`, uncommitted. The compiled rules match the sources, and the automated tests pass.
- **2026-10-29** — The engineer settled that the `foundation` installer converts a consuming project's `[work-item]` tags.
- **2026-10-29** — Increment 1 is committed on `feature/worktree/skills` as `19c4e07`.

---

Authored by Scott Bellware on Thu Oct 29 2026 at 6:37:48 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 9:58:47 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:06:11 PM PT
