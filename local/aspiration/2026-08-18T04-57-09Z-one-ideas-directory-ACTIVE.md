# One Ideas Directory — Aspiration

- **State:** Active

## Premise

**Waytide needs one planning directory, `waytide/local/ideas/`, and every mode writes to it.** An
idea is a plan, a design, an aspiration, an intention, an orientation, or an action — whichever
the project's mode names. The mode decides what the record is **called**. It no longer decides
where the record **lives**.

**The mode may therefore change mid-stream**, which the current rule forbids. It forbids it
because a mode change today strands every existing record in a directory the new mode does not
use, and leaves the project's planning split across two vocabularies with nothing announcing it.
Remove the directory pairing and that failure has nothing to act on.

**What makes it work is that the pair is written into the record itself.** A record states which
kind it is, so a directory holding records of several kinds is readable rather than mixed.

## Background & Motivation

**The mode was fixed at the start because of where the artifacts go, not because of what they are
called.** The a-project-works-in-a-mode-chosen-at-the-start rule says a project's mode "is settled
when the project is started and is not switched later", and it declines to address what changing
it would involve — "deliberately unaddressed rather than answered badly". The two questions it
names as unanswered are what becomes of artifacts written under the other mode, and whether the
two can coexist.

**Both questions are questions about directories.** An aspiration and a design are written
identically. The rule says so in its own words: the conventions are the same in every mode, the
mode "changes the vocabulary and the directory and no obligation". So the only thing a mode change
breaks is the location, and the only thing that makes the location matter is that the mode chose
it.

**The system already carries the cost of the pairing in several places.** Six directories exist
for what is one kind of work. Rules that merely mention the artifacts must generalize to *the
direction artifact* and *the sequencing artifact* to avoid naming a mode's directory. Rules that
are about them must name every mode's. An authoring tool,
`report-planning-directories-named-in-part.sh`, exists solely to catch a file that names some of
those directories and not all of them — a defect class that cannot arise when there is one
directory.

## Vocabulary

- **idea** — a planning record, whatever its mode names it. The class the one directory holds.
- ~~the idea's kind~~ — **dropped 2026-08-18.** See Settled. There is no such attribute. An idea
  tagged `[aspiration]` is an aspiration, and nothing names the category that tag belongs to.

## What is settled and what follows from it

**One directory, `waytide/local/ideas/`.** It replaces `design/`, `plans/`, `aspiration/`,
`intention/`, `orientation/`, and `action/`.

**Every mode writes to it.** The mode is unchanged in what it does to vocabulary, and changed in
that it no longer selects a location.

**The record states its own kind.** The document-format rules already title a record
`# <Title> — Design`, `— Aspiration`, or `— Orientation`, and `— Implementation Plan`,
`— Intention`, or `— Action`. That title is a candidate for carrying the kind with no new
mechanism.

**The mode may change mid-stream.** Records written before the change keep the kind they were
written with, since a record states what it stated when it was written.

## Settled

- **2026-08-18** — Waytide has one planning directory, `waytide/local/ideas/`, and every mode
  writes to it.
- **2026-08-18** — The mode decides what a record is called and no longer decides where it lives.
- **2026-08-18** — The mode may be changed mid-stream, reversing the
  a-project-works-in-a-mode-chosen-at-the-start rule's holding that it is fixed at the start.
- **2026-08-18** — A record carries its own kind, which is what makes one directory of mixed kinds
  readable.
- **2026-08-18** — **Direction and sequencing are dropped as concepts.** The covering terms *the
  direction artifact* and *the sequencing artifact* go with them. Their stated purpose was to let a
  rule mention an artifact without naming a mode's directory, and one directory removes that
  purpose.
- **2026-08-18** — **The realizes relationship survives, because the corpus needs it.** An idea may
  name another idea as the one it realizes, and the named idea is a source of truth that is
  reconciled rather than regenerated from the work downstream. The work-sessions-convention's
  reconciliation prompt rests on that asymmetry, as does a live observation and a live record's
  `## Source design` section. What is dropped is the vocabulary and the pairing, not the
  relationship.
- **2026-08-18** — **An idea's kind is written as a tag.** An aspiration is an idea tagged
  `[aspiration]`, a design one tagged `[design]`, and so on for `[plan]`, `[intention]`,
  `[orientation]`, and `[action]`. The tag protocol is the `foundation` package's
  working-state-artifacts-take-category-tags rule, so no new mechanism is added.
- **2026-08-18** — **The same pattern reaches every lens the writer wants on an idea**, including
  `[direction]` and `[sequencing]`. This **expands** the resolution above that dropped direction
  and sequencing: what was dropped is the **structural pairing** — the paired directories, and the
  covering terms rules had to use to avoid naming one. What is available is the lens as a **tag a
  writer may apply**, deriving nothing and obliging nothing.
- **2026-08-18** — **A kind tag is a reserved tag, and the tags rule must say so.** That rule
  currently holds that nothing is derived from a tag and that tags carry no fixed set of positions.
  A tag that decides what an artifact *is* is both of those things, so the rule gains a distinction
  between a **reserved tag**, whose meaning a rule settles, and a **freeform tag**, which stays
  what it was.
- **2026-08-18** — **The word *lens* is dropped**, set aside as a likely dead end the day it was
  proposed. The resolution above stands without it: a tag may carry any perspective a writer wants
  on an idea, including `[direction]` and `[sequencing]`. Read *every lens the writer wants* there
  as *every perspective the writer wants*. The observation that proposed the word is kept as the
  discovery record.
- **2026-08-18** — **A design is an idea, and an idea is a design.** The identity is full. There
  is one class of planning record, and the kind names are tags on it rather than classes of their
  own. A record is not *a design that lives among ideas* — it is an idea, tagged.
- **2026-08-18** — **The kind tags are an open set.** An idea can be a **specification**, tagged
  `[specification]`, which is a seventh beyond the six the modes name. A project coins a kind as it
  needs one, exactly as it coins any other tag.
- **2026-08-18** — **Sequencing and hierarchy, where either applies, are expressed as tags.** A tag
  says what role an idea plays. Where one idea is to be read against another in particular, the
  record says so in its own prose. No schema field carries a pointer between records, and the
  `Source design` section is prose of that kind rather than a field.
- **2026-08-18** — **The design-convention's reasoning is kept as conceptual.** That a settled idea
  is **reconciled and never regenerated** from the work downstream of it, and that it is a source
  of truth another idea points back at, remain true of ideas. They stop being claims about a class
  called *design* and become claims about how any two ideas stand to each other.

- **2026-08-18** — **`kind` is not an attribute in an idea's schema.** Not a field, and not a
  named category of tag either. An idea tagged `[aspiration]` is an aspiration. Calling
  `[aspiration]` *a kind tag* would make `kind` a schema concept by the back door, which is what
  writing the tag rather than a field was for. The resolutions above stand with the word removed:
  read *an idea's kind is written as a tag* as *an idea is tagged*, and *the kind tags are an open
  set* as *the tags are an open set*.
  - **`**Kind:**` in the suspended-convention is untouched.** It is a suspended thing's attribute,
    naming what the thing was so a restore knows what it is restoring. It is not an idea's.

## Out of Scope / Deferred

- ~~Whether the direction and sequencing distinction survives.~~ **Resolved 2026-08-18** — see
  Settled. The concepts are dropped and the realizes relationship is kept. **How that relationship
  is written** in a record remains open: whether the kind alone carries it, or a further line
  does.
- ~~How the kind is written.~~ **Resolved 2026-08-18** — as a tag. See Settled. **Whether the
  document-format titles still carry the kind** is open: `# <Title> — Aspiration` and the tag now
  say the same thing, and one of them may be redundant.
- **What a mid-stream mode change does to existing records.** They keep the kind they were written
  with, and whether anything marks the change in each record — or only in the log and the new mode
  rule — is open.
- **What replaces the mode rule's corroboration check.** The rule currently checks the planning
  directories against the mode rule and surfaces a contradiction. With one directory there is
  nothing to check, and whether a check on the records' kinds replaces it is not settled.
- **What becomes of `report-planning-directories-named-in-part.sh`.** Its defect class cannot
  arise under one directory.
- ~~Whether the covering terms survive.~~ **Resolved 2026-08-18** — they do not. See Settled.
  **What the `direction-and-sequencing-artifacts-take-a-log-entry` rule is renamed to** is open,
  since its name carries the dropped concepts.
- ~~How the realizes relationship is written.~~ **Resolved 2026-08-18** — the role is a tag, and
  the pointer to a particular record is the record's own prose. The objection that a tag cannot
  carry a pointer was answered by not requiring the schema to carry one.
- ~~Whether the kind tags are a closed set.~~ **Resolved 2026-08-18** — open. `[specification]`
  is a seventh, named as an example rather than as a completion of the set. **What a kind outside
  the six means for the mode** is still open: the modes name six kinds in three pairs, and a
  seventh belongs to no pair.
- **What becomes of the four planning rules.** `design-convention`, `plans-convention`,
  `design-document-format`, and `plan-document-format` are four rules about two classes that are
  no longer classes. They likely collapse into one convention and one document format for an idea,
  carrying the conceptual content named above. That is implementation and is not settled here.
- **The migration of this project's own records**, and of every consuming project's.
- **Whether `ideas` is the settled name.** It is the word this aspiration is written in.

---

Authored by Scott Bellware on Mon Aug 17 2026 at 9:57:09 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:01:44 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:15:53 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:18:23 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:26:37 PM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 10:39:52 PM PT
