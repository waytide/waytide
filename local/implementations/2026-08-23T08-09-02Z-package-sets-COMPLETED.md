# Feature — Package Sets

## Intent

**A project runs a named set of Waytide packages rather than all of them.** A set is a named list, written down, installable by that name, and declarable by a project that already holds more packages than it wants active. `content` is the first set.

- **State:** Completed
- **Tags:** [feature]

**It was started as *Content and Web* and renamed on 2026-08-23.** See below. The record keeps its original time prefix, which is when the work started, and its history rather than being written as though it had always been this.

## Setup

- **Upstream branch:** `master`
- **Implementation branch:** `feature/package-sets`, named `feature/content-and-web` until the rename
- **Base:** `fd0f126f9056c7ce75e1e8d6f2d125954cf67a82`, from `master`
- **Working location:** branch only. This working tree switches back to `master` at the conclusion.

**No forecast is stated.** A feature is built to an intent rather than to a question, so there is nothing to predict and nothing to compare a prediction against. See the implementations-convention.

## Confirmations

- **2026-08-23 — Working location: branch only.** Put through the selection interface at the start, with branch and worktree and the current branch offered beside it. The engineer selected branch only.
- **2026-08-23 — Participation: attended.** Put through the selection interface at the same gate, in the words the attended-or-unattended-is-chosen-at-the-start rule fixes. The engineer selected attended, which is the default. The loop waits at every hinge.
- **2026-08-23 — Renamed from *Content and Web* to *Package Sets*.** The engineer's instruction, following their own observation that the feature had been more about package sets than about the content package set.

## What it was started as, and why it is not that

**It was started to give Waytide conventions for content** — often aimed at the web, and possibly education materials, slide decks, and articles, with Hugo and Hextra as the first attempt. That intent produced two commits and then stopped.

**What diverted it is in the record.** *A content project is a named package set* was recorded as a way of **describing** the configuration a content project wants. Building that description turned out to need a mechanism the system did not have, and the mechanism took the feature.

**The proportion is what settled the rename.** Of the branch's first seventeen commits, eleven are the package set mechanism, two are content-specific, two belong to neither and rode along on the checked-out branch, and one is the feature's own setup. Nothing touches Hugo, Hextra, or what a content package holds.

**So *Waytide for content and web* is not realized here and returns to awaiting a feature.** The local rule putting content work outside Design By Efferent stays, having been written for this project rather than for this feature.

## What this realizes

- *A content project is a named package set* — the set as a concept, and `content` as the first
- *The install takes a package set on the command line* — `install` taking a list of names
- *A project declares its package set* — the declaration, and deactivation without uninstalling

## What is built

- **`install` takes a list of names**, a name being a package set or a package, with `default` a set like any other rather than a code branch. Proved by `test/automated/package-sets.sh`.
- **A project declares which installed packages are active**, by the a-project-declares-its-package-set rule. `session-start.sh` reads the most recent declaration and carries it to the agent, and the initialization-rule prints it after the category line. Proved by `test/automated/package-set-declaration.sh`.

**The ANSI test was built and removed unrun.** The listing was to have gone in the hook's notice, which is plain text, so whether ANSI escapes render there had to be established before the form could be settled. The engineer then placed the listing in the startup content the agent prints, which renders markdown, and the question stopped being asked. It is `ef7d1e1`, and what it proved before it went is that the JSON encoding is sound.

## What Design By Efferent did not do here

**The five hinges were not put and no loop record was opened.** The local rule *Design By Efferent does not govern content work* was written at the start and the feature was taken to be content work.

**Under the rename that reading no longer holds.** The rule's own text says that writing the scripts and rules which *govern* content is not content work, and that where a piece of work is both, DBE governs the code half. A feature whose product is a shell script, a rule file, and two test suites is the code half. **This is recorded rather than corrected**: the work is done and the decisions were put to the engineer through the selection interface at every fork, which is the substance the hinges exist to produce.

## What is not built

- **A project that declares a set.** The mechanism is complete and nothing uses it. The website is the intended first case: eight packages installed, five wanted active.
- **A set defined anywhere but `install`.** The declaration records its own resolution, so nothing else needs the definition — but a set that exists only inside the installer is not written down in the sense *A content project is a named package set* asked for.

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:09:02 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:36:15 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:22:10 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:58:40 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:52:47 AM PT
