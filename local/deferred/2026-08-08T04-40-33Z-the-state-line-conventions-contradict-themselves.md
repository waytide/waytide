# The experiment and feature conventions contradict themselves about when the state line is written

Both say the canonical `**State:**` line is written **at initiation**, and both say a record
**with no such line is in flight**. Those cannot both hold: a line written at initiation must carry
one of the state words, and none of them describes a record that has just been created.

- **Gated on:** nothing. Actionable now.

## The two sentences

**experiments-convention**, one bullet, four sentences apart:

> It is written when the experiment is initiated and updated as the state changes …
> A record with no such line is **in flight** — which is a true reading, not a defect, for an
> experiment still being worked.

**features-convention** carries the same pair, with four state words rather than six.

## What it produced

An experiment record was written on 2026-08-08 carrying `- **State:** In flight`, which is not
one of the six words. **The first sentence was followed and the gap was filled by invention**,
which is the failure a contradictory rule produces rather than a misreading of a clear one.

`session-start.sh` extracts the first word of the value, so the notice reported the experiment
open as `(In)`. The same value was written into the `bullet-list-answers` record at its
initiation the day before and was reported the same way until that experiment was affirmed.

## Which sentence is wrong

**The initiation clause.** Three things say so:

1. **Absence is what the machinery expects.** `session-start.sh` has an explicit branch for the
   empty value, printing `no state recorded`. It was written for a record that has no line.
2. **No state word fits a record at initiation.** The six describe how an experiment **ended**,
   plus suspension, which is a pause of something under way.
3. **The convention states the absence reading positively** — *a true reading, not a defect* —
   which is not how a rule describes a case it does not intend.

**Why:** a rule that contradicts itself is followed by picking a sentence, and which sentence gets
picked is not a property of the rule. This one was followed twice, the same way both times,
producing a value no state word matches and a session-start notice reporting an experiment as
`(In)`.

**How to apply:**

- Change the initiation clause in `experiments-convention` so the line is **added when the record
  reaches one of the state words**, not at initiation.
- Change the same clause in `features-convention`.
- State in both that **absence is the in-flight state**, so a reader does not add a line to say so.
- Leave `session-start.sh` alone; its handling is already correct.
- Leave concluded records alone; each carries a state word and none is affected.

Related: the experiments-convention and features-convention (the two rules), the
announce-waytide-at-session-start rule (the notice that reads the line), and
`system/foundation/session-start.sh` (the parser whose empty-value branch is the evidence).

---

Authored by Scott Bellware on Fri Aug 7 2026 at 9:40:33 PM PT
