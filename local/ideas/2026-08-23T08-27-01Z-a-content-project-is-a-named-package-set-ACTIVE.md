# A content project is a named set of packages

- **State:** Active
- **Tags:** [aspiration]

**Why this state:** settled on 2026-08-23 and being built. What remains open is the membership of
the `content` set rather than the mechanism.

## Premise

**As the engineer stated it:** this particular configuration of Waytide can be used on website and
content projects. Waytide should recognize this particular set of these active packages under the
name "content project".

## Waytide has no concept of a project kind

**Nothing in the system names a set of packages.** `install-all.sh` installs one set and calls it
nothing. A package declares its own dependencies. There is no word for *the packages a kind of
project takes*, and no place one is written.

**So this introduces a concept rather than a value.** The name `content project` is the first
instance of it, and what it is an instance *of* has to be settled with it.

## The set, as the day's ideas have worked it out

**Content-neutral, so a content project takes them:** `foundation`, `language`, `git`,
`versioning`, `journal`.

**Code-specific, so a content project does not:** `testing` and `design-by-efferent`. *A content
project does not start with Design By Efferent active* named DBE, and *Design By Efferent is a
`tools/` package* found that the same reasoning reaches `testing` — a project with no suite has no
use for controls, actuation placement, or assertion form.

**Plus whatever this feature builds**, which is not yet decided: one content package, or a content
package and a Hugo one.

**The set is not settled by this idea.** It is what the reasoning has produced so far, and the
division into content-neutral and code-specific is itself one of the open questions.

## Two levels, and only one is reachable now

**Written down.** A rule or a README section states what a content project is and which packages
it takes. No mechanism, no installer change, and it can be built today. What it buys is that the
set has a name and a place — which is what "Waytide should recognize" asks for at its smallest.

**Installed by name.** `install-all.sh content` places the set. That waits on *The install takes a
package set on the command line*, which is `Open` and which named this exact question among its
own. Nothing today can install a subset at all.

**The two are not alternatives so much as an order.** The written set is what the installer would
read. Writing it first costs nothing that the mechanism would have to undo.

## Settled

- **2026-08-23 — the class is a `package set`.** `content` is a package set. The word claims
  nothing about who takes the set or why, so a set that is not a kind of project still fits.
  `profile` and `project kind` were the alternatives weighed.
- **2026-08-23 — both levels are built.** The set is written down **and** installable by name.
  They are an order rather than a choice: the written set is what the installer reads.
- **2026-08-23 — the install takes a list of names, and a name is a set or a package.**
  `install-all.sh content`, `install-all.sh foundation language git`, and
  `install-all.sh content ext/ruby-lang` are the same form. This settles *The install takes a
  package set on the command line*, which asked what the argument list means.

## What is not settled

- **Which of the two levels is meant**, and whether the written one is built by the feature now
  underway.
- **What the concept is called.** `content project` names one instance. The class it belongs to —
  a kind, a profile, a distribution, a set — has no word, and *distribution* is already spoken for
  by the Ruby work.
- **Where the set is written.** A `foundation` rule, the root README, or a file a script can read.
  The last is the only one an installer could use.
- **Whether a project declares its own kind**, somewhere in `waytide/local/`, so the agent and the
  tooling know which set the project holds.
- **Whether the division holds.** `git` and `versioning` are on the content side here, and neither
  has been examined for it.

Related:

- *The install takes a package set on the command line* — where the naming question was first left
  open, and what the second level waits on
- *A content project does not start with Design By Efferent active* — the parked question about
  what a content project omits
- *Design By Efferent is a `tools/` package* and *The grouping is `ext/`* — how the code-specific
  packages would leave the default set
- *Waytide for content and web* — the idea this sharpens, and the feature underway

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:27:01 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:35:46 AM PT
