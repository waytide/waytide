# The mode mechanism — decommissioned

- **Origin:** `waytide/system/foundation/`, five rules, listed under **What was decommissioned**
- **Kind:** mechanism
- **Decommissioned:** 2026-08-18T05-31-36Z
- **Reconciliations:** recorded under **What was reconciled**, below

**Decommissioning** is recording what a mechanism was and then removing it from active service.
It differs from suspending a thing: a suspended file moves with its own return address, and a
mechanism spans several files that cannot each carry the whole. This record is the return address
for all of them.

**This record is in `waytide/local/suspended/`** because that is the system's existing home for
what a project stopped doing, and its restoration is real. Whether decommissioning wants a
directory of its own is not settled, and none was created.

## What the mode mechanism was

**A Waytide project worked in one of three modes, chosen at its start and held for its life.** The
mode decided what the two planning artifacts were called and where they lived.

| Mode | The direction artifact | The sequencing artifact |
|---|---|---|
| **formal** (the default) | a **design**, in `waytide/local/design/` | a **plan**, in `waytide/local/plans/` |
| **intuitive** | an **aspiration**, in `waytide/local/aspiration/` | an **intention**, in `waytide/local/intention/` |
| **OODA** | an **orientation**, in `waytide/local/orientation/` | an **action**, in `waytide/local/action/` |

**The pairing was on a near/far axis.** A design, an aspiration, and an orientation each answered
*what are we going toward*. A plan, an intention, and an action each answered *what are we going
to do*.

**The conventions were identical in every mode.** The mode changed the vocabulary and the
directory and no obligation. That was the mechanism's central claim and, in the end, the reason it
could go: what it varied was never anything a rule depended on.

**Why it existed.** A word is not a label applied to a thought after the fact — it is the thought's
working surface, so choosing a word chooses a concept. An engineer writing an *aspiration* was
doing something different from one writing a *design*, and the difference was in them rather than
in the document. **That reasoning is not decommissioned.** It survives in the kind tags, which
carry the same words onto one class of record.

**How it was decided and kept.** The mode was put to the engineer at a project's start through the
selection interface, in fixed words stating that Waytide's behavior was unaffected. It was
recorded as a local rule named `formal-mode`, `intuitive-mode`, or `ooda-mode`, committed with a
log entry. A rule was written whichever mode was chosen, so an absent rule meant the question was
never asked rather than that the project was formal. The mode was never inferred from which
directories existed, because that reasoning is circular. The directories were checked against the
rule and a contradiction was surfaced rather than resolved by assumption. The mode did not change
after the start.

**What it cost the rest of the system.** Six directories existed for one kind of work. A rule that
merely *mentioned* one of the artifacts had to generalize to **the direction artifact** or **the
sequencing artifact**, and a rule that was *about* one had to name every mode's. Two covering terms
existed for no other reason. An authoring tool,
`report-planning-directories-named-in-part.sh`, existed solely to catch a file naming some of
those directories and not all of them.

## What was decommissioned

Five rules, moved from `waytide/system/foundation/` into this directory:

- `a-project-works-in-a-mode-chosen-at-the-start.md` — the mechanism itself
- `design-convention.md` — the direction artifact's directory and obligations
- `plans-convention.md` — the sequencing artifact's directory and obligations
- `design-document-format.md` — the direction artifact's shape
- `plan-document-format.md` — the sequencing artifact's shape

## What replaces it

**One directory, `waytide/local/ideas/`, and the kind as a tag.** A design is an idea; an idea is
a design. An aspiration is an idea tagged `[aspiration]`. The kind set is open, and
`[specification]` is a seventh beyond the six the modes named. Sequencing and hierarchy, where
either applies, are tags. The direction is settled in the one-ideas-directory aspiration, and the
convention and document format that carry it are not yet written.

**The mode may now change mid-stream**, which this mechanism forbade. Its two unanswered questions
— what becomes of artifacts written under the other mode, and whether the two can coexist — were
both questions about directories, and one directory leaves them nothing to act on.

## What must be kept, and is not this mechanism's

**A settled idea is reconciled and never regenerated** from the work downstream of it, and it is a
source of truth another idea points back at. That reasoning lived in `design-convention` and the
`work-sessions-convention` depends on it. It is kept as conceptual, about how any two ideas stand
to each other rather than about a class called *design*.

**A question that counters a settled resolution is the idea expanding**, and the agent does not
obstruct. That lived in `design-convention` too, and nothing about it was about modes.

**Dated `Settled` resolutions, an `Out of Scope / Deferred` tail, behavior-stated checkbox tasks,
and supersession.** Each lived in one of the four conventions and none of them turned on a mode.

## What was reconciled

Thirteen files cited the five rules, and each is corrected rather than left pointing at nothing:

- `system/foundation/README.md` — the four-rules section replaced by what carries over, the mode
  paragraph replaced by the one-directory account, the `report-unrecognized-mode.sh` description
  replaced, and the script inventory corrected
- `system/foundation/status-report-format.md` — reads *the project's planning records* rather than
  the sequencing artifact, naming no directory and no kind
- `system/foundation/work-sessions-convention.md` — its reconciliation section says *whichever
  settled idea the work session bears on*, and its Related list drops the two conventions
- `system/foundation/vocabulary.md` — the **out of scope** term names the decommissioned rule as
  its former home
- `system/foundation/direction-and-sequencing-artifacts-take-a-log-entry.md` — its account of the
  asymmetry it closed now says the obligation outlived the conventions it was written against
- `system/foundation/a-record-ends-with-its-state-in-upper-case.md` — names the two records that
  still carry a state line
- `system/foundation/experiments-convention.md`,
  `system/foundation/working-state-artifacts-carry-a-provenance-footer.md`,
  `system/foundation/migration-convention.md` — Related lists corrected
- `system/foundation/install.sh` — the bootstrap comment no longer explains a mode-dependent
  directory pair
- `system/design-by-efferent/attended-or-unattended-is-chosen-at-the-start.md` — *this is not a
  planning record*, without naming a mode's directories
- `install-all.sh` and `CONTRIBUTING.md` — the decommissioned scripts removed from the tooling
  inventory and the publish procedure

**Two scripts were decommissioned with the rules**, and moved here beside them:

- `report-unrecognized-mode.sh` — it read the installed mode rule for its defined mode names, and
  there is no such rule
- `report-planning-directories-named-in-part.sh` — its defect class cannot arise under one
  directory

**Not reconciled, deliberately.** This project's own `local/rules/…-intuitive-mode.md`, and the
records in `local/aspiration/` and `local/intention/`. Those are this project's working state and
their migration is the one-ideas-directory aspiration's, not this record's.

## What would bring it back

**A project that needs its planning vocabulary to be fixed by its directory rather than by a tag.**
The mechanism's own claim was that the mode changes no obligation, so a restoration would be
motivated by the discipline of the constraint rather than by anything a rule could not otherwise
express.

**Restoring it** means moving the five rules back to `waytide/system/foundation/`, removing this
record's lines, and reversing each entry under **What was reconciled**.

---

Authored by Scott Bellware on Mon Aug 17 2026 at 10:31:36 PM PT
