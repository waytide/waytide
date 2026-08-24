# A project declares its package set, and the packages outside it deactivate

- **State:** Realized
- **Tags:** [aspiration]

**Why this state:** the two questions that held it `Open` are answered. What deactivation does is
settled, and the answer dissolves the conflict with the unconditional session-start read rather
than requiring that rule to change.

**2026-08-24 — realized.** A project declares a set in a dated record under `waytide/local/`,
`session-start.sh` reads the most recent one and carries it to the agent, and the
initialization-rule prints it after the category line. The rule is
`a-project-declares-its-package-set`, and it is proved by
`test/automated/package-set-declaration.sh`. Two projects hold a declaration: this composite
declares `default`, and the website declares `content` with three packages deactivated.

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

## Deactivation withholds rather than skips, and that dissolves the conflict

**Every installed package is still read.** A deactivated package's rules enter the session exactly
as they do today. What the declaration changes is whether they are applied. The agent knows every
rule the project holds and follows only the active ones.

**So `announce-waytide-at-session-start` needs no change.** The idea was recorded as running
against that rule's unconditional read, and it does not. The rule says the read happens; it does
not say every rule read is applied. The set governs application, and the read stays unconditional
and whole.

**The record above argued the conflict was defensible.** It reasoned that a recorded project
decision differs from the in-the-moment judgment the rule refuses. That reasoning is kept because
it is sound and may be needed if the cost of the read is ever taken up again — but it is not
needed now, because there is no conflict to defend.

**What it gives up is the read's cost.** *Not read* was the only reading that saved it, and the
initialization rule admits the cost is real — *Loading Waytide will take a few moments*. That is
paid deliberately.

## The declaration is a dated record, and the most recent one holds

**It is written at `waytide/local/{time-prefix}-{names}-package-set.md`**, where `{names}` is what
the declaration names, hyphen-joined. `2026-08-23T09-30-00Z-content-package-set.md` for the
ordinary case, `2026-08-23T11-02-14Z-foundation-git-package-set.md` where more than one is named.

**Declaring a set writes a new file rather than editing one.** The file with the latest time prefix
is what the project runs, and the earlier ones are the history of what it ran before. It is how
every other dated series here works — migration records, work sessions, log entries. Nothing
carries state and nothing is edited on a change.

**Reverting to the default is a declaration like any other**, naming `default`, which is a set like
any other.

## It names packages directly, and a name is a set or a package

**The declaration takes a list of names in the same grammar `install` takes**, so one form covers
both commands and there is nothing separate to learn. A project wanting `content` plus `testing`
says so without a name being invented for it.

**What that costs is that a project can run a configuration nobody named**, and two projects saying
different things can be running the same one. The repeatability a name buys is available and not
compelled.

**An include decides over the declaration.** `design-by-efferent` includes `testing`; a declaration
naming the first and not the second gets both. An include states that a package does not work
without another one, which is a fact about the package rather than a preference, and it is already
how `install` behaves. The notice reports what is actually active, so `testing` shows as on though
the declaration did not name it.

## The notice reports the set and every package

**The line is `package set: content`** — the words the engineer declares it in, rather than a
restatement.

**Every package is listed and none is hidden.** The active ones are emphasized and the deactivated
ones are set in a lighter weight, with a legend following: **on** in bold and *off* in italic. The
hidden-record rule does not reach this, because nothing here is being withheld.

**Emphasis is not available as markdown and ANSI is untested.** The notice is a `systemMessage`
from the hook and the harness displays it as plain text — it carried markdown asterisks until
2026-07-28 and they reached the engineer literally, which is why `session-start.sh` states that
emphasis is unavailable on this channel. ANSI escape sequences are a different mechanism and have
never been tried here. **The first increment is that test**, and only the engineer can read its
result, since the notice prints at session start.

**The count is not a question.** With every package listed there is one number, which is what is
installed, and the emphasis says which are in force.

**The status line does not carry the set**, settled separately: the notice states it once, and the
status line reports what changes within a session.

## `refresh-packages.sh` is unchanged

**Every installed package is refreshed, deactivated or not.** The set decides what is applied, not
what is on disk. A deactivated package is read, so leaving it stale means reading stale rules, and
it is current on the day the set changes. The script needs no knowledge of sets at all.

## Settled

- **2026-08-23 — setting a package set in a running session does not unload what is already
  read, and the engineer is told so.** The rules of every installed package are in the agent's
  context by the time the set is declared, and there is no unread. The agent says that the
  omitted packages' rules stay in force for this session and that Claude has to be restarted for
  them to go.

  **It is said at the moment the set is declared**, not left for the engineer to discover when a
  deactivated rule is followed anyway. A mechanism whose effect is delayed and does not say so
  reads as a mechanism that did not work.

- **2026-08-23 — the session-start notice prints the active package set when one is available.**
  The notice reports the set the project runs, beside what it already reports. Where no set is
  declared it prints nothing about one, which is every project today and stays the ordinary case.
  It is the harness that prints it, and the announce-waytide-at-session-start rule reserves that
  line to the harness, so it is a change to `session-start.sh`.

- **2026-08-23 — the status line does not carry the set.** The notice states it once at the start.
  What the status line carries changes within a session — a branch, uncommitted work, an unpushed
  commit — and the set does not.

- **2026-08-23 — deactivation means read and not applied.** Put through the selection interface
  against *not read at all* and *not read except vocabularies*. It is the reading that keeps the
  unconditional read whole and gives up the saving.

- **2026-08-23 — the declaration is a dated record at `waytide/local/`, and the most recent one
  holds.** The path form is the engineer's, and *most recent* was put through the selection
  interface against a `**State:**` and a suspension, and against one file that is replaced.

- **2026-08-23 — the file name hyphen-joins the names.** Put through the selection interface
  against no names in the file name and against a name-or-nothing conditional.

- **2026-08-23 — the notice says `package set: content`, lists every package, and emphasizes the
  active ones with a legend.** The engineer's wording and form. Markdown is unavailable on the
  channel, so the emphasis is attempted with ANSI escapes and tested first.

- **2026-08-23 — the declaration names packages directly, and a name is a set or a package.** Put
  through the selection interface against a set being the only granularity and against a set with
  named exceptions. It is the grammar `install` already takes.

- **2026-08-23 — an include activates what it names.** Put through the selection interface against
  the set deciding and against the declaration being refused.

- **2026-08-23 — `refresh-packages.sh` refreshes a deactivated package like any other.** Put
  through the selection interface against refreshing and reporting it as off, and against skipping
  it.

## What is not settled

- **Whether ANSI escapes render.** The first thing built, and the answer decides whether the
  emphasis stands or a plain-text distinction replaces it.
- **Whether a deactivated package's vocabulary still binds.** A rule is followed or withheld, and
  a term is different: it fixes what a word means in records already written, including records
  written while the package was active. Withholding a rule and withholding a term may not be the
  same act.
- **Whether `foundation` can be omitted.** Every set defined so far includes it, and it defines the
  system. Whether that is enforced or merely observed is not decided.
- **How the read instruction expresses it.** `session-start.sh` builds the instruction the agent
  acts on, and it now has to name which packages are read and not applied.
- **What retires the local rule.** *Design By Efferent does not govern content work* stands in for
  this mechanism by hand and says it expects to be suspended. Whether this mechanism is what
  suspends it depends on whether deactivating the package is the same thing as that rule's
  narrower claim, which reaches content work only.

Related:

- *A content project is a named package set* — where the set and its name were settled
- *The install takes a package set on the command line* — the first remedy, built
- *A content project does not start with Design By Efferent active* — where the missing mechanism
  was named
- the `announce-waytide-at-session-start` rule — the unconditional read this leaves whole
- the local rule *Design By Efferent does not govern content work* — the hand-built stand-in this
  would retire

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:58:07 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:02:23 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:04:11 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:11:38 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:14:52 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 2:34:07 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 12:51:37 PM PT
