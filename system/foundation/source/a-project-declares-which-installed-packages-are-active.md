# A project declares which installed packages are active

- **Solubility:** 20
- **Original rank:** 5 of 106
- **Unclarity:** 0.76

**A project may declare a package set, and the packages outside it are deactivated.** The declaration is a record at `waytide/local/`, named for the moment it was made and for what it names: `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`. Where more than one name is declared, the file name hyphen-joins them.

**Where no declaration exists, every installed package is active.** That is the ordinary state and it is not reported as one.

**Declaring a set writes a new record rather than editing an existing one.** The record with the latest time prefix is the one that holds, and the earlier ones are the history of what the project ran. Reverting is a declaration like any other, naming `default`.

## The record carries three lines

**The declaration is read from three plain text data attribute lines**, and a record missing the first two is not a declaration:

```
- **Package set:** content
- **Packages:** foundation, git, journal, language, versioning
- **Inactive:** design-by-efferent, testing
```

**`**Package set:**` is what the engineer declared** — a set name, a list of package names, or a mixture. A name is a package set or a package, which is the grammar `install` takes.

**`**Packages:**` is what that resolved to**, recorded at the moment of declaration rather than computed at every session start. The resolution is captured in the record for the same reason every other dated record here captures its moment: nothing outside the file has to be consulted to know what the project decided.

**`**Inactive:**` is what was installed and not active at that moment.** It is recorded rather than inferred so that the record says the whole state it was made against, and so that a reader sees what was set aside without knowing what was installed that day.

**`**Packages:**` is authoritative.** A package installed after the declaration appears in neither line, and it is inactive, because the active list is the whole of what is active. Declaring again is what takes it up.

**An include activates what it names.** Where an active package's README includes another, that one is active whether or not the declaration named it. An include states that a package does not work without another one, which is a fact about the package rather than a preference, and it is how `install` already behaves.

## Every package is still read

**A deactivated package's rules are read at session start exactly as an active package's are.** The declaration governs whether they are applied, not whether they are read. The the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule's unconditional read stands whole and is not narrowed by any declaration.

**So the read costs what it always cost.** Skipping the read of a deactivated package would save that cost and is deliberately not done: a rule that is read and withheld can be cited, weighed, and reactivated within the session, and one that was never read cannot.

**`refresh-packages.sh` refreshes a deactivated package like any other.** The set decides what is applied rather than what is on disk, and a package that is read must not be stale.

## What is printed, and where

**The active packages are printed by the agent, at the head of the response that carries the rule read.** They are not printed in the session-start notice or in the startup display. Those are `systemMessage`s the harness displays as plain text, and the agent's own text renders markdown — so the emphasis below is available in the one place and not in the others.

**Every installed package is listed and none is hidden.** The active ones are bold and the deactivated ones are italic. The set's name follows the list — `package set: content` — and a count line closes it: `(5 active of 8 installed)`. The hidden-record rule does not reach this, because nothing here is withheld.

**Where no set is declared, nothing about a set is printed.** No line saying there is none.

**A declaration of `default` prints nothing either, where nothing is deactivated.** `default` is what a project gets by asking for no set, so reporting it says what silence already says. It does print where `default` leaves a package deactivated, which happens when the project holds one `default` does not name.

## A set declared in a running session takes effect at the next one

**Declaring a set does not unload what is already read.** Every installed package's rules are in the agent's context by the time the declaration is made, and there is no unread.

**Say so when the set is declared.** State that the deactivated packages' rules stay in force for this session and that Claude has to be restarted for them to go. A mechanism whose effect is delayed and does not say so reads as a mechanism that did not work.

**Why:** a project does not need every convention the system carries. A content project has no use for a design method meant for a unit of code, and until this existed the only remedy was to not install the package or to write a local rule saying it does not apply. The first cannot be undone in a session and the second is a hand-built stand-in for a mechanism. A declaration is a recorded project decision — committed, dated, and reviewable — which is what distinguishes it from an agent's in-the-moment judgment about what to bother with.

**How to apply:** at session start, read the most recent `*-package-set.md` under `waytide/local/`. Read every installed package's rules as always, and follow only the active ones. Print the packages at the head of the response that carries the read, active bold and deactivated italic, then the set's name, then the count line. Where the engineer declares a set during a session, write the record, then say that a restart is needed before the deactivated rules stop applying.

## Compressed

## Declaring a set

1. A project may declare a package set.
2. The packages outside a declared set are deactivated.
3. Where no set is declared, every installed package is active, and nothing reports it.

## The record

1. A declaration is a record under `waytide/local/`.
2. Its name is the ISO-8601-UTC prefix and the declared names, hyphen-joined: `waytide/local/2026-08-23T09-30-00Z-content-package-set.md`.
3. A new declaration writes a new record.
4. A new declaration edits no existing record.
5. The record with the latest prefix holds, and the earlier ones are history.
6. Reverting is a declaration naming `default`.

## Three lines carry it

1. A record without the first two lines is not a declaration.

```
- **Package set:** content
- **Packages:** foundation, git, journal, language, versioning
- **Inactive:** design-by-efferent, testing
```

2. `**Package set:**` is what the engineer declared: a set name, package names, or both, in the grammar `install` takes.
3. `**Packages:**` is what that resolved to, recorded when declared rather than computed at session start.
4. `**Packages:**` is authoritative.
5. A package installed later is in neither line, so it stays inactive until a new declaration takes it up.
6. `**Inactive:**` is what was installed and not active then.
7. `**Inactive:**` is recorded, not inferred, so the record states the whole state it was made against.

## An include activates what it names

1. Where an active package's README includes another package, that package is active, named or not.
2. An include states a dependency, and `install` already treats it so.

## Every package is still read

1. A deactivated package's rules are read at session start like an active package's.
2. The declaration decides which rules are applied, not which are read.
3. The declaration does not narrow the unconditional read.
4. A rule that is read and withheld can be cited, weighed, and reactivated within the session.
5. `refresh-packages.sh` refreshes a deactivated package like any other, so nothing read is stale.

## What is printed

1. Print the packages at the head of the response that carries the read, because that text renders markdown.
2. The session-start notice and the startup display print none of it.
3. List every installed package, and hide none.
4. Show active packages in bold and deactivated packages in italic.
5. Follow the list with the set's name: `package set: content`.
6. Close with a count line: `(5 active of 8 installed)`.
7. The hidden-record rule does not apply, because nothing is withheld.

## When nothing is printed

1. Where no set is declared, print nothing about a set, not even a line saying so.
2. A declaration of `default` prints nothing where it deactivates nothing.
3. A declaration of `default` does print where the project holds a package that `default` does not name.

## Declaring during a session

1. A set declared during a session takes effect at the next session.
2. A declaration does not unload rules already read.
3. When the engineer declares a set, write the record.
4. Then say that the deactivated packages' rules stay in force for this session.
5. Also say that Claude must be restarted for those rules to stop applying.
6. **Why:** a project does not need every convention the system carries. Before this, the remedies were to leave a package uninstalled or to write a local rule against it. A declaration is a recorded project decision, committed, dated, and reviewable, not the agent's judgment in the moment.


## History

Until Sun Oct 25 2026 this rule was named a-project-declares-its-package-set and titled "A project declares which of its installed packages are active".

Related:

- the the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule — the unconditional read this leaves whole
- the the-startup-display-prints-once-per-session — where the printed block is defined
- the status-report-format rule — the hidden-record convention this deliberately does not use
- the plain text data attribute line, as `**State:**` and `**Repository:**` already use it

---

Authored by Scott Bellware on Sun Aug 23 2026 at 3:04:00 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:36:20 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:49:30 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 3:56:40 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 10:22:31 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:03:13 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:04:38 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:12:31 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:23:01 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 10:27:15 PM PT
Changed by Scott Bellware on Thu Oct 22 2026 at 1:06:54 PM PT
Changed by Scott Bellware on Fri Oct 23 2026 at 11:38:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:13:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:09 PM PT
