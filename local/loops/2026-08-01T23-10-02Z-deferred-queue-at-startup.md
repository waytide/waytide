# Loop record — the deferred queue is printed at startup

The feature prints the deferred queue as a table immediately after the Waytide rules and the
project's own local rules are read. Its lifecycle record is
`waytide/local/features/2026-08-01T23-02-15Z-deferred-queue-at-startup.md`.

The design ran as five passes. The five hinges of the initial-implementation cycle —
actuation, observation, controls, implementation, naming — govern designing a unit from its
efferent side, and this feature produces a rule rather than code, so there is no actuation to
shape and no test to cradle it. The hinges that carried over are the ones that are decisions
about the design rather than about a test: what the thing does, and where it lives.

## Pass 1 — The surface

**Hinge:** whether the queue is carried by the session-start hook's notice or printed by the
agent after the rule read. Load-bearing: it decides whether the deferred item's blocking
objection applies at all.

**Options:** none — not gated. The developer's statement of intent settled it on arrival:
*"It happens immediately after the Waytide rules (and the project's local rule) are read."*

**Decision / chat:** the agent's print, after the read. The consequence was surfaced rather
than gated, because it followed from the intent rather than being a choice within it: the
deferred item held that reporting the queue required `**Gated on:**` to be machine-readable,
since a script cannot read free prose. An agent reads free prose, so that requirement
disappears and the deferred convention's format is untouched. The item's other objection —
that a permanently-present line stops being read — is what keeps the print off the notice.

## Pass 2 — What is printed

**Hinge:** the whole queue, or a filtered subset.

**Options:** every item; only items whose gate has cleared; only items past an age threshold.

**Decision / chat:** every item, in table form. Data put to the developer beforehand: 7 of the
8 current items state a gate of *nothing in flight*, so filtering to actionable work would
report nearly all of them and reproduce the always-present problem in a different place.

## Pass 3 — How much of each item

**Hinge:** how much of an item a row carries.

**Options:** title alone; title with its gate; title with a summary.

**Decision / chat:** the summary, in a table column. The columns were then settled by the
agent rather than gated — **Item, Date, Summary** — taking the existing deferred table in
status-report-format (name, date, kind, one-line gist) and dropping `kind`, which adds width
without aiding a scan. Stated to the developer as a decision open to correction rather than
put as an option, since it is a routine judgment inside an answer already given.

## Pass 4 — The count and the empty queue

**Hinge:** whether the print states the number of items, and what it does when there are none.

**Options:** count and empty-line, both; neither; one without the other.

**Decision / chat:** both. An empty queue prints a line saying so rather than nothing, because
silence is indistinguishable from the print having been skipped.

## Pass 5 — Where the instruction lives

**Hinge:** which rule file carries the instruction. Subtle: the rule governing session start
already states that the agent prints nothing at session start, so a careless placement makes
two rules contradict.

**Options:** the agent-deferred-convention, beside the queue's own format; a new `foundation`
rule of its own; the announce-waytide-at-session-start rule, amending its prohibition.

**Decision / chat:** a new `foundation` rule of its own. The developer first said the question
was not understood, and it was restated concretely — the agent prints this only because a rule
read at session start tells it to, so the instruction has to be written somewhere, and the
candidate homes differ in what they cost. The prohibition in announce-waytide-at-session-start
was then narrowed in place: it forbids the **notice**, not everything the agent prints at a
session's start, and it now names this rule as the different thing on a different surface.

## Outcome

- **The rule:** `print-the-deferred-queue-after-the-rule-read` in `foundation` — the table and
  its three columns, the count, the empty-queue line, and why the print is not the notice.
- **Cross-references:** the announce-waytide-at-session-start rule's prohibition is narrowed
  and names this print; the agent-deferred-convention names it as what keeps a parked item
  from going unread; the foundation README names it beside the `deferred/` directory.
- **Suite state:** not applicable — this repository has no automated suite.
- **Commit:** recorded with the feature's commits on `feature/deferred-queue-at-startup`.

---

Authored by Scott Bellware on Sat Aug 1 2026 at 4:10:02 PM PT
