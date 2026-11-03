# An example is not drawn from Waytide itself

**An example in help text, documentation, or an explanation is drawn from some other project, never from Waytide's own work.** A branch named for a Waytide feature, or a record from this repository, explains the system by pointing at the system. A reader then has to tell the thing being described from the example describing it.

**As the engineer stated it:** avoid using Waytide's own scenarios for examples. Self-referential examples are confusing.

**Every example is drawn from one ordinary software project: a checkout, with a cart, a payment, and a receipt.** It is understood without knowing anything about Waytide, and one project used everywhere means the reader learns it once.

**As the engineer stated it:** use the checkout, etc example for all examples.

**What this does not reach.** A record of Waytide's own work names that work, because it is the record's subject and not an example. A log entry, an item, or an implementation record about Waytide is not an example of anything.

**Why:** an example is there to show the reader a general thing through a particular one. When the particular is Waytide's own, the reader meets the system twice in one sentence, once as what is explained and once as what explains it, and cannot tell which is which.

**How to apply:** when writing an example, take it from the checkout project: its cart, its payment, its receipt. Do not name a Waytide feature, branch, package, rule, or record as the example.

## Compressed

1. An example shows the reader a general thing through a particular one.
2. Draw an example in help text, documentation, or an explanation from some other project, never from Waytide's own work.
3. Draw every example from one ordinary software project, understood without knowing anything about Waytide: a checkout, with a cart, a payment, and a receipt.
4. Do not name a Waytide feature, branch, package, rule, or record as an example.
5. A record of Waytide's own work, such as a log entry, an item, or an implementation record, names that work as its subject. That is not an example, and this rule does not reach it.

## History

Until Fri Oct 30 2026 this rule offered an upload with retries beside the checkout. The engineer settled that every example uses the checkout.

---

Authored by Scott Bellware on Fri Oct 30 2026 at 1:10:03 PM PT
Changed by Scott Bellware on Fri Oct 30 2026 at 1:17:48 PM PT
