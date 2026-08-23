# A project declares its package set, and the packages outside it deactivate

- **State:** Open
- **Tags:** [aspiration]

**Why this state:** it supplies a mechanism the system has never had — an installed package that is
not active — and it runs against the unconditional session-start read, which is load-bearing and
was made unconditional for a stated reason. It is promoted to `Active` once what deactivation does
is settled and the read question is answered.

## Premise

**As the engineer stated it:** from within a running package set, I would set it with `package
set: content`. And then the proper deactivations would happen.

## It is the second remedy, arriving with a mechanism

*A content project does not start with Design By Efferent active* named two remedies and said one
had none:

- **Not installed** — the subset case, which `install content` now does.
- **Not active** — which *Waytide has no concept of a dormant package* and which this supplies.

**The two are different acts and both are wanted.** A project starting fresh installs the set it
needs. A project that already holds every package declares the set it runs, and nothing is
uninstalled. The website is the second case today: it holds eight packages and wants five active.

## What deactivation does is the first question

**Three readings, and they cost different things.**

- **The rules are not read.** The natural reading, and the only one that saves the read itself.
  The initialization rule admits that cost — *Loading Waytide will take a few moments*.
- **The rules are read and not applied.** What the local rule of 2026-08-23 does for
  Design By Efferent by hand. Cheaper to build and it saves nothing.
- **The package is removed.** That is uninstalling, and it is the other remedy rather than this
  one.

## It runs against the unconditional read

**`announce-waytide-at-session-start` makes the read unconditional deliberately.** Its stated
reason is a session that judged the read not worth it, then went on to edit rules, write a work
session record, and publish two packages against rules never read.

**A declared set is not that failure.** What that rule refuses is an **in-the-moment judgment** by
the agent about whether to read. A package set is a **recorded project decision**, committed,
reviewable, and read before anything else. The two are different acts and only one of them is
made by whoever is in a hurry.

**That distinction has to be written into the rule**, or the change reads as the thing the rule
exists to stop.

## Where the declaration lives has no obvious home

**A project-level configuration line has nowhere to go.** `waytide/local/` holds `rules/`, the
`vocabulary.md`, and the working directories. A declaration is none of those — it is not a rule,
not a term, and not a record of work.

**The form is settled even if the place is not.** `**Package set:** content` is the plain text data
attribute line the system already reads mechanically, the same shape as `**State:**` and
`**Repository:**`.

## Settled

- **2026-08-23 — setting a package set in a running session does not unload what is already
  read, and the engineer is told so.** The rules of every installed package are in the agent's
  context by the time the set is declared, and there is no unread. The agent says that the
  omitted packages' rules stay in force for this session and that Claude has to be restarted for
  them to go.

  **It is said at the moment the set is declared**, not left for the engineer to discover when a
  deactivated rule is followed anyway. A mechanism whose effect is delayed and does not say so
  reads as a mechanism that did not work.

  **This makes two of the three readings of deactivation right at different moments.** Within the
  session the most that can happen is *read and not applied*. At the next session start the
  declaration can mean *not read*. So the two are not competing answers to one question — they are
  what deactivation means before and after a restart, and the record above treats them as rivals
  wrongly.

- **2026-08-23 — the session-start notice prints the active package set when one is available.**
  The notice reports the set the project runs, beside what it already reports. Where no set is
  declared it prints nothing about one, which is every project today and stays the ordinary case.

  **It is the harness that prints it**, not the agent. `session-start.sh` reads the directories
  present and emits the notice, and the announce-waytide-at-session-start rule reserves that line
  to the harness. So this is a change to that script.

  **It is what makes the declaration visible without being asked for.** A project decision that
  governs which rules are read, and that is not stated where the read is announced, is a
  configuration the engineer has to go and look up.

- **2026-08-23 — the status line does not carry the set.** The notice states it once at the start
  and that is where it is stated. The status line keeps what it keeps: the working directory, the
  branch, and any uncommitted, untracked, or unpushed work.

  **What the status line carries changes.** A branch is switched, work goes uncommitted and then
  is committed, and a push clears what was unpushed. The set does not change within a session —
  the resolution above says a declaration made mid-session does not take effect until a restart —
  so a line that reports it every turn reports the same value every turn.

## What is not settled

- **What deactivation does at the next session start**, now that the resolution above sequences
  the readings rather than choosing between them. Not read saves the read; read and not applied
  saves nothing and is what the local rule does by hand today.
- **Where the declaration is written**, and whether that place is a new kind of file under
  `waytide/local/`.
- **What reads it.** `session-start.sh` builds the read instruction and would have to name only the
  active packages. That the notice prints the set is settled above, and that the status line does
  not is settled with it.
- **What the notice's count counts** once a set is declared. It says `N packages` today, and
  installed and active are then two different numbers.
- **What `refresh-packages.sh` does with a deactivated package.** Refreshing what is not read is
  arguably right — it stays current for the day it is reactivated — and arguably waste.
- **Whether a package can be activated singly**, outside any set, and whether a set is the only
  granularity.
- **What happens to a package a set omits but another package includes.** `design-by-efferent`
  includes `testing`; if a set names `design-by-efferent` and not `testing`, the include decides
  or the set does.

Related:

- *A content project is a named package set* — where the set and its name were settled
- *The install takes a package set on the command line* — the first remedy, built
- *A content project does not start with Design By Efferent active* — where the missing mechanism
  was named
- the `announce-waytide-at-session-start` rule — the unconditional read this changes
- the local rule *Design By Efferent does not govern content work* — the hand-built stand-in this
  would retire

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:58:07 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:02:23 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:04:11 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:11:38 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:14:52 AM PT
