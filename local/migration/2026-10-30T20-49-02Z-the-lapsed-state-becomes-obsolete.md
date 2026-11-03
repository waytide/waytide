# The `Lapsed` state becomes `Obsolete`

**An item that lost its relevance as the work moved past it, with no one deciding, takes the state `Obsolete`, in place of `Lapsed`. Every item takes it, a work item included, where a work item took no `Lapsed`.** The engineer settled it on 2026-10-30. This record plans the change in this repository and in every project that installs `foundation`.

## Source and destination

- **Source:** the state word `Lapsed`, the filename suffix `-LAPSED`, and the exclusion of a work item from it, in three `foundation` rules, the `foundation` and `language` vocabularies, the `foundation` README, and the items that carry the state.
- **Destination:** the state word `Obsolete` and the suffix `-OBSOLETE`, open to every item.
- **Repositories:** this one, the `foundation` component repository it publishes to, and each project that installs `foundation`. No consuming project is named here.

## Increments, in order

1. The rules, the vocabularies, and the README name `Obsolete`, on `master`: the-items-directory-holds-one-file-per-item, a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state, and an-observation-is-a-working-hypothesis-whose-one-state-recorded-never-changes.
2. This repository's items are conformed. None carries `Lapsed`, so nothing is renamed.
3. `foundation` is compiled and published from `master`, following `CONTRIBUTING.md`.
4. Each consuming project refreshes `foundation`, and its `-LAPSED` items are converted: the `foundation` installer renames each file to end `-OBSOLETE.md` and changes its `**State:** Lapsed` line to `**State:** Obsolete`, reporting each file it changed. This is the analogous case to the `[work-item]` tag, where the engineer settled that the installer converts. The installer change is not yet built.

## What is true in between

- **Between increments 1 and 3:** this repository's rules name `Obsolete`, and the published `foundation` names `Lapsed`.
- **Between increments 3 and 4, in each consuming project:** the installed rules name `Lapsed` until the project refreshes. After it refreshes and before its items are converted, a `-LAPSED` item carries a state its rules no longer name.
- **Text that records history keeps the old word.** A log entry, a rule's History section, and the History of an item are not revised.

## What happened

- **2026-10-30** — Increment 1 is made on `master`, uncommitted. Increment 2 needs nothing.

---

Authored by Scott Bellware on Fri Oct 30 2026 at 1:49:02 PM PT
