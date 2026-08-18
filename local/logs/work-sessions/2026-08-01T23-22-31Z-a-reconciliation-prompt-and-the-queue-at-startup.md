# Session — A reconciliation prompt, its first use, and the deferred queue printed at startup (Sat Aug 1 2026 16:22)

Continues `2026-08-01T06-09-00Z-two-constructs-named-and-a-package-boundary-drawn.md`, which
closed on the package-boundary work. What followed had one shape throughout: **a mechanism was
added, then immediately used on the thing that motivated it, and the use found something the
reasoning had not.** A design-reconciliation prompt was written into the session-record
convention and its first firing found three divergences in the one design on file. A deferred
item about stranded references was settled, and the only broken reference in the repository
turned out to be one this session had created. A feature then built the deferred queue's
startup print, and its first rendered output was rejected on sight.

*This is the communicable record — the guided tour. It is not the source of truth. The durable
records are the rules under `system/`, the decision log under `local/log/`, the observations
under `local/observations/`, and the deferred queue under `local/deferred/`.*

## 1. Design goes stale because deferred items absorb it

The developer observed that the design of a system is not kept current as work goes on, and
that design and plan are both preempted by entries into the deferred queue.

The repository bore it out: **1 design and 1 plan, both dated 2026-07-27 and both for the same
feature, against 9 deferred items, 5 observations, 202 log entries, and 6 session records.**
Design and plan had been used once, together, and not since.

The mechanism is cost. A deferred item is written at the moment of discovery, mid-task, which
is when the material is at hand; a design requires settling direction first and a plan requires
a settled design. The deferred format then does the rest — `**Gated on:**`, `**Why:**`, and
`**How to apply:**` is most of what a small design would say. The item does not defer to a
design, it **absorbs** one.

The consequence is worse than staleness: a resolved deferred item is **deleted**, so whatever
design reasoning it held is destroyed at the moment the work it described is done. Both
outcomes had occurred the previous day — the preconditions item's framing survives only in git
history, while the investigation item's findings survived because that item happened to
instruct promotion to observations, which no convention requires.

Recorded as an observation.

## 2. A design is reconciled, not regenerated

Asked whether the design could be periodically rebuilt from the other records, the way a
session record is assembled from them.

**Partly, and the difference decides it.** A session record can be a projection because it is
explicitly not a source of truth. A design *is* one — a plan realizes it and names it as its
**Source design** — so rebuilding it from the work downstream inverts that relationship.

Two parts of a design cannot be projected at all: **Out of Scope / Deferred** records
decisions *not* to do something, which no record of completed work holds; and settled-but-unbuilt
direction describes shape ahead of the code.

What is projectable is a different artifact — an as-built description from the rules — and it
already exists as the package READMEs, hand-maintained and drifting.

So: **reconcile, don't regenerate.** Read the records against the design, report divergence,
let the developer say which side is stale, since either may be.

## 3. The prompt fires when a session record is written

The remaining question was whether the moment to reconcile could be detected rather than
remembered. Three tiers: a reference that no longer resolves is definite and mechanical; volume
of change is mechanical but needs an arbitrary threshold; the divergence that matters is a
reading, not a computation.

The developer supplied the better trigger: **writing a work-session record.** It needs no
threshold, because deciding to write a record is the developer judging the work substantial.
Its inputs are already gathered, because writing the record means reading that session's log
entries, rules, and observations. And a selection-UI gate already exists there.

Two limits went into the record plainly: it is **lagging**, and it had **already fired twice**
since the design was written without occasioning any change to it. The occasion recurs; the
prompt was what was missing.

Written into `agent-work-sessions-convention` as its own section, with a matching line in
`agent-design-convention`. Published.

## 4. The prompt's first use finds three divergences

Immediately after publishing, the prompt applied to this session. The prior assertion — that
nothing this session touched the one design on file — was wrong.

- The design's **Out of Scope** still said `waytide/local/features/` and its rules did not
  exist. Both exist and are published.
- It still listed main-sequence drift as open. `feature-runs-on-its-own-branch` had dropped it,
  with a reason.
- Its central argument — that requiring lifecycle fields in `local/loops/` would make
  `foundation` "depend on a directory it does not own" — described *ownership* where the
  criterion settled the day before is *availability*. **The design had reached the
  citation-is-not-a-dependency test in 2026-07-26 and stated it in looser words.** Its
  conclusion was unchanged and better supported than its own wording claimed.

Reconciled: Out of Scope items struck and dated, the argument pointed at the settled rule,
**Settled** resolutions untouched.

## 5. Communication

Three corrections in sequence — shorter answers, more directness, then: *"Speak with less prose
and more bullet points. Communicate only the essentials. No editorializing. Be a scientist, not
a Shakespear."* An explanation was also rejected outright as literature rather than science,
and rewritten as concrete facts with file names and counts. The standing preference is recorded
outside this repository.

## 6. The exceptional-paths rule, in full

The developer supplied the complete text of a rule written the day before from a version with a
clause cut mid-sentence. The revision states the naming rule properly — an exceptional-path file
is named for the condition, and that condition is **also** promoted to a `context` inside the
file with the test named `Fails` — and removes the last bare uses of "exception". Asked whether
the new version was substantively better, the honest answer was *marginally*: one real addition,
the rest wording, nothing lost, and one cost — the inline statement duplicates the rule it
cites. Published.

## 7. Stranded references

The stranded-reference deferred item was examined against current state, and most of what it
said was out of date:

- Its **primary example was already fixed.** It said the license item carries a broken link;
  that was corrected 2026-07-27, in the form the item itself settled.
- **The one broken reference in the repository was created by this session** — a session-record
  annotation naming `precondition-qualifies-a-test-and-reads-inline.md`, a file renamed hours
  later.
- **Link checking is low-yield.** 6 `[[ ]]` occurrences in all of `local/`; 3 inside the item
  itself, 2 of those prose examples that a checker would report as false matches.

Three decisions followed, all agreed:

- **Do not correct historical records — and do not annotate them either.** The evidence is
  decisive: the only broken reference existed *because* of an annotation. An annotation is a
  live pointer added to a dead record and has to be maintained like any other.
- **No standing check; search at deletion.** Targeted, no false matches, done by whoever knows
  what the item became.
- **A removed rule is dropped from a `Related:` list, not marked.** A Related list is a set of
  live pointers; a permanent `(deleted)` entry is clutter.

A fourth followed from the broken reference itself: **reference a rule by its name, never by its
file path.** Every rule in the system already does; the one place a path was written is the one
place that broke.

Written into `agent-deferred-convention` and `agent-rules-convention`. The item was carried out
and deleted — reconciling the feature-capability plan's Task 7 note, which asserted the question
was unsettled and the link deliberately left, both false once it resolved. Published.

## 8. Slash commands

Asked whether `/deferred` would execute faster than the prose "Deferred items". **No.** A slash
command is a prompt template; the file's text is expanded into the message and the model runs
normally. The real difference is ambiguity, not latency — and the evidence was in this session,
where three phrasings of the same request produced three different formats. The gap was a
missing rule, not a missing command, and a rule travels in the package while a
`.claude/commands/` file does not.

## 9. The queue at startup

The developer initiated a feature: the deferred queue is printed at startup, immediately after
the rules are read.

**That intent chose a different surface than the deferred item assumed, and dissolved its
blocking objection.** The item held that filtering the queue required `**Gated on:**` to be
machine-readable, since a script cannot read free prose. An agent reads free prose. The item's
other objection — that a permanently-present notice line stops being read — is what keeps the
print off the hook's notice, which runs before the session and renders every time.

Six passes, recorded in the loop record. Four questions were put and answered: every item, not a
filtered set (7 of 8 items stated a gate of *nothing in flight*, so a filter would have reported
nearly all of them); the summary alongside title and date; the count stated and an empty queue
printing a line; and a new `foundation` rule of its own as the instruction's home. The fourth
question was first answered *"I don't understand"* and was restated concretely — the agent prints
this only because a rule read at session start tells it to.

A sixth pass followed the first rendered output: **a list of rows, not a rendered table.** A
table sizes its columns to the widest summary, narrowing the title and date and wrapping every
row in a terminal.

`announce-waytide-at-session-start`'s prohibition was **narrowed rather than excepted**: it
forbids the *notice*, not everything the agent prints at a session's start.

Completed, integrated with `--no-ff`, branch deleted on confirmation, both confirmations
recorded. Published.

## 10. Removing "agent" from the rule names

Registered as a deferred item. Nine `foundation` rules carry the prefix and no other package
uses it. The cost is not the rename but the citations — `agent-rules-convention` in 13 files,
`agent-features-convention` in 9, two others in 8 each — every one of which breaks, because the
conventions settled this session require citing rules **by name**.

## Takeaways

- **A mechanism's first use is its real test.** The reconciliation prompt found three
  divergences in a design its author had just asserted was untouched.
- **The design had already reasoned its way to a rule written a day later.** It stated the
  availability criterion in looser words in 2026-07-26; the session that generalized it did not
  notice it was there.
- **Annotation is not a middle option between correcting and leaving.** It is a live pointer on
  a dead record, and the only broken reference in the repository was one.
- **The surface decides the constraints.** Printing the queue by agent rather than by script
  removed a requirement the deferred item had held as blocking.
- **Stated intent can settle a hinge before it is put.** The startup-print surface was fixed by
  the feature's one-sentence intent; the hinge was recorded as *not gated* rather than
  manufactured into options.

## Glossary

- **design reconciliation** — reading the records against a design and reporting divergence,
  without changing either. Distinct from regeneration, which would rebuild the design from work
  downstream of it and silently treat the implementation as correct. Prompted when a work-session
  record is written.
- **stranded reference** — a pointer to an artifact that has been deleted or renamed. Live
  artifacts carrying one are corrected at deletion; historical records are left alone.

## Where the durable records live

- **New rules** — `print-the-deferred-queue-after-the-rule-read` in `foundation`.
- **Changed rules** — `agent-work-sessions-convention` and `agent-design-convention` (the
  reconciliation prompt), `agent-deferred-convention` (the reconciliation step at deletion, and
  the queue print), `agent-rules-convention` (reference by name; removing a rule),
  `announce-waytide-at-session-start` (the narrowed prohibition), the `testing`
  normal-path-and-exceptional-paths rule (revised in full), and the `foundation` README.
- **Observations** — deferred items preempting design and plans; a design is reconciled, not
  regenerated (with the session-record proxy).
- **The feature** — `local/features/2026-08-01T23-02-15Z-deferred-queue-at-startup.md`
  (Completed) and its loop record under `local/loops/`.
- **The design** — the feature-capability design, reconciled 2026-07-31.
- **Deferred queue** — 8 items. Two carried out this session; one added.
- **Published** — `foundation` four times, `testing` once.

---

# Continued — the read instruction, the prefix, and the queue's priority (Sat Aug 1 2026 17:52)

Appended after the record above was written. The work continued through three more deferred
items and a convention change, and the shape held: **each thing settled turned out to have
been already answered, contradicted, or undercut somewhere in the system, and finding that was
the work.**

## 11. The reconciliation prompt, answered

The prompt the convention now requires fired immediately after the record above was written.
Answer: **no design bears on this session.** The one design on file covers the feature
capability; the work was the session-record and deferred conventions, the rules convention,
the notice rule, and the startup-print rule.

Worth noting as a gap in the rule rather than an omission here: **a reconciliation that finds
nothing leaves no trace that it ran.** The rule requires the prompt and says nothing about
recording the answer.

## 12. The read instruction names the project's own rules

Taken up as the next deferred item. The item's own question — whether `local/rules/` is named
unconditionally or only when it exists — was settled **unconditionally**, matching
rules-convention and the `AGENTS.md` bootstrap, which both name it without a condition. A
conditional instruction would vary its text by project, which is a second thing to keep true.

**Two things beyond the item's scope turned up in the same string.**

- **The instruction contradicted a rule published an hour earlier.** It told the agent that
  `load waytide` asks for *read the rules, say only that the read is done, and wait for the
  real request* — which **forbids** the deferred-queue print that
  print-the-deferred-queue-after-the-rule-read requires. The instruction now names the print as
  what follows the read.
- **The working directories are now named as excluded.** The item flagged the risk that naming
  `local/` rather than `local/rules/` would reverse a settled distinction. The instruction now
  says outright that `log`, `deferred`, `design`, `plans`, `work-sessions`, `experiments`, and
  `loops` are not read as binding rules.

Verified by running the hook and parsing its output, since the instruction is interpolated into
a JSON string built by `printf` with no escaping — a stray quote or apostrophe would make the
whole output unparseable and the notice would vanish silently.

## 13. The `agent-` prefix is removed

The item asked whether the prefix earns its keep, naming two possible justifications. Both
failed on inspection:

- **No collisions.** All nine unprefixed names are free.
- **The grouping argument was already dead.** `decision-log-convention` is the
  artifact-directory convention for `local/log/` and has **never** carried the prefix. The nine
  were not grouping the family — the tenth member was already outside it. Removing the prefix
  makes the set consistent rather than scattering it.

Nine rules renamed. 78 file-citations corrected in live artifacts; historical records keep the
old names, per the convention settled earlier in this session. Short forms needed hand-fixing —
"the agent-rules rule" would have become "the rules rule".

**`plan` changed too**, which the pre-publish check caught rather than a person: its two format
rules cite the foundation conventions by name. `foundation` and `plan` published together.

## 14. The attended-or-unattended question

Raised as an amendment to the failing-implementation item, then **framed as a batch-size
trade**: attended is human-in-the-loop with **small-batch interruptions**; unattended is
**big-batch**, carrying commensurately **higher rework and its attendant cost**.

That framing settled two things the amendment could not settle on its own:

- **Unattended is not DBE off.** It is the same generation in one large batch with the gates
  removed. The cradle, the efferent-first actuation, and the solubility standard are unaffected
  by batch size; what changes is how much is produced before a person looks.
- **The answer is situational, which is what separates this from never-ask-to-start-test-first.**
  That rule forbids asking about test-first *because the answer is always yes*. A batch trade
  has two real sides, so this is a decision rather than a confirmed default, and the rule's
  reasoning does not reach it.

Then **separated into its own deferred item**, since the failing-implementation item is about
what a single hinge offers and this is about whether the cycle is gated at all. Both concern
what the method's gating costs, from opposite ends; each names the other.

## 15. The queue gains a priority

A priority order was given for all seven items, and then made durable rather than left in the
log — where it would not have survived to the next session's print.

Settled through the selection interface: **rank is `**Priority:** N`, contiguous 1 through N**,
with renumbering on insertion accepted as the cost of each item stating its own position; and
**an unranked item sorts last and is marked**, since registering an item mid-task is exactly
when a ranking decision is being deferred.

**The consuming-project case came from a question asked mid-work** — what happens to an
existing queue with no priority data — and it was not covered by either answer. It produced a
third rule: **where no item carries a rank, the queue prints in filename order and is marked
not at all.** That is the state of every existing queue the moment a project refreshes the
package. Marking every row unranked says nothing and reads as a defect rather than as a queue
nobody has ranked.

Two further distinctions went in: **rank is not the gate** — `**Gated on:**` says when an item
is *actionable*, priority says what to work *next* among those that are — and **the print
carries the order, not the number**, since printing a rank beside a row already in that
position states it twice.

## Takeaways from the continuation

- **Publishing a rule does not make the system consistent with it.** The read instruction
  contradicted a rule published an hour earlier, in a file nobody had reason to reopen.
- **A justification can die without anyone noticing.** The `agent-` prefix's grouping argument
  had been dead since `decision-log-convention` was written without it.
- **The mechanical check found what a person would not.** `plan` needed republishing because its
  format rules cite foundation conventions by name; nothing in the work suggested looking there.
- **A question about the general case produced the rule the specific case missed.** Neither
  settled answer covered a queue with nothing ranked, which is every consuming project on the
  day it refreshes.

## Glossary — continuation

- **attended / unattended** — whether the DBE cycle runs human-in-the-loop with small-batch
  interruptions, or in one large batch with the gates removed. A batch-size trade: attention
  spent continuously against rework paid at the end. Unattended suspends the gates, not the
  method.
- **rank** — a deferred item's position in the queue, `**Priority:** N`, contiguous from 1.
  Distinct from its **gate**, which says when it becomes actionable rather than what to work
  next.

---

Authored by Scott Bellware on Sat Aug 1 2026 at 4:22:31 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:52:08 PM PT
