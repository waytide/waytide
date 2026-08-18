# Experiment — Diary

**Tags:** [experiment]

## Question

**Is a diary a good fit for Waytide?**

**A diary here is a personal log written by the engineer**, or by more than one engineer. It is not
a record the agent writes. That is what separates it from everything `waytide/local/` holds
today.

**What Waytide keeps now, and who writes it.** The decision log holds one line per decision, written
by the agent when a decision is made. A work session record is a narrative written at a session's
close. A loop record holds a feature's hinges and the decisions made at them. An experiment record
holds a question, a forecast, and findings. Every one is the agent's work, read by the engineer.

**So the question is whether Waytide has a place for what the engineer writes for themselves.** A
diary is not a record of a decision, and it is not evidence. It is thinking, kept.

## Setup

- **State:** Affirmed
- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/diary`
- **Base:** `f0db163d9cb279a50c2d4c2c1c64ab73ce42dc7f`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Rests on:** the ETE experiment, affirmed 2026-08-13, and the foundation conventions for the
  four record kinds this one is measured against.

## Forecast

**Written before the work, and scored after.**

1. **A diary will not fit under `waytide/local/`.** Everything there is the agent's work or the
   project's working state. A personal log belongs to a person rather than to a project. *Moderate
   confidence.*
2. **The strongest case for it is recall across sessions.** An agent that reads the engineer's
   diary knows what they were thinking, which no other artifact carries. *Moderate confidence.*
3. **The strongest case against it is that the agent would read it.** A diary read by an agent
   stops being personal, and the engineer writes differently once they know. *High confidence, and
   this is the finding the experiment turns on.*
4. **Waytide already covers most of what a diary would carry**, between the decision log and the
   work session record. What is left is the part the engineer would not want read. *Moderate
   confidence.*
5. **A diary will not need a rule.** Where it is personal, a convention naming a directory is
   enough, and where it is not personal it is one of the four records already defined. *Low
   confidence.*
6. **The experiment ends inconclusive rather than affirmed or refuted**, because the answer turns on
   how one engineer works rather than on anything the corpus can settle. *Low confidence, and this
   is the prediction most likely to be wrong.*

## What actually happened

### The term is settled — 2026-08-14

**The artifact is a diary.** `log` was taken by the decision log. `journal` carries the
write-ahead sense used in filesystems and databases, where a journal is what a system writes
before it commits. `personal journal` and `personal log` each need a qualifier to hold them
apart from the agent's records.

**The engineer chose `diary` over the agent's recommendation of `personal journal`.** The
agent's argument against it was that British business English uses *diary* for an appointment
calendar. That points forward in time, where this record points back. That argument was a
recollection the agent could not check against a source, which is why it did not carry.

The experiment, the record, and the branch were renamed to match.

### The package is built — 2026-08-14

**A `diary` package was written, and four decisions settled what it holds.** Each went through
the selection UI. The record of them is here because two of them run against the forecast, and
the forecast is what this experiment is scored on.

- **The agent reads the diary at session start.** After the rules and the vocabularies, oldest
  entry first, and it says nothing about having read it.
- **It lives at `waytide/local/diary/`, committed with the project.** A second engineer on the
  project reads it, which is what makes it a record rather than a private note.
- **An entry is read and never followed.** It sets no rule and no term, and it is never cited
  back as grounds for something the agent did.
- **One file is one entry**, with the ISO-8601-UTC datetime prefix every dated artifact takes.
  A day usually holds one entry and can hold several.

**The engineer clarified the unit before the fourth decision.** A day is the usual unit, and a
day can hold more than one entry. The choice put to them was whether a day's entries sit in one
file or in one file each. One file each was chosen, so the diary departs from no naming rule.

**Two forecast items are already contradicted.** Item 1 predicted a diary would not fit under
`waytide/local/`, and it was placed there. Item 3 predicted the experiment turns on the agent
reading it, and the agent reads it.

Item 3 is not refuted by the choice. It named a cost, and the cost stands: an engineer who
knows every entry is read writes differently. What the package does is bound that cost rather
than avoid it. The a-diary-entry-is-read-and-never-followed rule is what holds an entry to
being read, so nothing an entry says can change what the agent does.

**Whether that bound holds is what is left to find out.** It is a claim about how the engineer
writes once the diary is in use, and no reading of the corpus settles it.

### The package required two changes in foundation — 2026-08-14

**A diary is read at session start and does not bind, and foundation asserted that nothing of
that kind exists.** Its rules-convention said `waytide/local/vocabulary.md` "is the one thing
there that is" read at session start. The session-start hook's instruction said "Read only
those two beside the packages".

**Both were narrowed rather than made to name the diary.** The first now says "the one thing
there that binds". The second now says "unless an installed package's own rule directs another
read". Foundation stays package-agnostic, and each sentence is true whether or not `diary` is
installed.

The generated `AGENTS.md` in foundation's install.sh already said "read as binding" and needed
nothing. That is the one of the three that was written narrowly to begin with.

### The entry format arrived from another project — 2026-08-14

**A working diary already existed elsewhere, and its rules were imported.** They are the datetime
line under the title, the square-bracket category tags, the summary dropped where it repeats the
body, the body dropped where it repeats the title, the ask for a time the writer did not give, the
commit message's parenthetical date, and the materialized timeline index. Each took a provenance
footer on arrival.

**Two of the imported rules were not about a diary at all.** One forbade an agent memory store.
One forbade a stored work recap. Each governed the whole project rather than the diary, so neither
belonged in this package.

### The reader is a writer, not an engineer — 2026-08-14

**The package says `writer` where the rest of Waytide says `engineer`.** The two name the same
person in a different relation. Every relation `engineer` carries is a relation to the **work** —
at the loop, at a hinge, as the reader the terminology is conveyed to. A diary entry stands in
relation to the **entry**, and what makes it trustworthy is that the person who thought it is the
person who wrote it. The term narrows `engineer` and does not contradict it.

### A project holds more than one diary — 2026-08-14

**Entries live in `waytide/local/diary/<username>/`, and the read is the active writer's alone.**
An entry carries that writer's thinking across their own sessions, and it is written knowing their
own agent reads it. A wider audience is not the one it was written for.

**So the package needed an identity contract, which the question did not anticipate.** A username
is the primary key, resolved through `DIARY_WRITER`, then a project-local `.current-user`, then
`~/.config/waytide/user`, then a loud failure. A display name is presentation, optional, and never
computed from a username. A project's `writers.toml` overrides it and declares nobody.

### An entry is stamped in the writer's local time — 2026-08-14

**This is the one place the package departs from foundation's file-names rule**, which normalizes
every dated artifact to UTC. That rule's reason is that a project's contributors are globally
distributed and the artifacts are the project's. A diary entry is not the project's. An entry
written at 23:40 on a Tuesday reads as that Tuesday, and normalizing it would move some entries
onto a date the writer did not live through.

## Findings

**A diary fits, and what it holds was carried by nothing else.** The four records Waytide already
keeps report what happened. The diary reports what the writer thinks about it. That gap is the
finding, and it is the one the forecast most badly misjudged.

**The cost forecast item 3 named is real and is bounded rather than avoided.** A writer who knows
every entry is read writes differently. The a-diary-entry-is-read-and-never-followed rule holds an
entry to being read, so nothing an entry says can change what the agent does. Whether the bound
holds in use is not settled by this experiment, and no reading of the corpus settles it.

**The package is fourteen rules rather than the convention the forecast expected.** Naming a
directory was not enough. The read, the force an entry carries, who writes it, who the writer is,
how the entry is shaped, and how the index is maintained each needed stating.

## The forecast, scored

| # | Forecast | Outcome |
|---|---|---|
| 1 | A diary will not fit under `waytide/local/` | **Wrong.** It is placed there and committed with the project |
| 2 | The strongest case for it is recall across sessions | **Held.** It is the reason the-diary-is-read-at-session-start gives |
| 3 | The strongest case against it is that the agent would read it | **Held as a cost**, and it did not decide the outcome. The cost is bounded by a rule rather than avoided |
| 4 | Waytide already covers most of what a diary would carry | **Wrong.** What the writer thinks about the work was carried by nothing |
| 5 | A diary will not need a rule | **Wrong.** The package holds fourteen |
| 6 | The experiment ends inconclusive | **Wrong.** Affirmed, declared by the engineer on 2026-08-14 |

**Four of six wrong, and the two that held were the ones about costs rather than about fit.** The
forecast reasoned from where a diary belongs in the existing arrangement. Every item that did so
failed. The items that named what a diary would cost a writer were both correct, and neither
decided the question.

## Misses

**The outcomes the forecast did not account for**, which are the informative ones:

- **The package forced two changes in `foundation`.** Two of its sentences asserted that nothing
  read at session start fails to bind. Each was narrowed rather than made to name the diary.
- **Identity was not anticipated at all.** The question assumed one engineer. A project holding
  several writers needed a resolution chain, a username as primary key, a machine-level user file,
  and a per-project display-name override.
- **`engineer` was the wrong word, and finding that took the whole package.** The term was used
  throughout the first draft and reserved as `writer` afterward.
- **The experiment produced two `foundation` rules about agent memory.** They arrived as imported
  diary rules and governed the project rather than the diary. One became
  project-context-lives-in-the-committed-artifacts. The other was suspended, and its one uncovered
  sentence folded into the decision-log-convention. A third rule,
  ask-at-once-when-a-preference-is-expressed, was written because the first is unsound without it.

**That last one is the sharpest.** An experiment about a personal record ended by settling where a
project's durable context lives. The path ran through an imported rule that nobody had asked
whether the package should hold.

## Confirmations

- **Working location** — branch only, at the start.
- **Participation** — attended, at the start.
- **Affirmation** — declared by the engineer on 2026-08-14: *"Conclude the diary experiment. It is
  affirmed. Merge it to master and remove the branch, both local and remote."*
- **Branch deletion** — instructed in the same words, local and remote. No worktree was created,
  so none was removed.
- **Merging untested code** — not required. The experiment produced rule files and no code, and
  this repository has no test suite.

**The experiment's log needed no copy into `waytide/local/log/`.** Every decision was written
there as it was made, from the experiment's start through its conclusion.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 12:46:09 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:12:38 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 2:31:00 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 12:46:07 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:09:20 AM PT
