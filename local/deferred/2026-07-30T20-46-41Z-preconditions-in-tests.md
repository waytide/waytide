# Preconditions in tests

A **precondition** is a bare `assert` or `refute` that is not a named test. It sits in a
context alongside the controls and the actuation rather than inside a `test` block, and it
establishes that the situation the test needs actually holds before the outcome is
observed. It is nevertheless a **condition that can be expressed so that a reader
understands it** — which is the part that needs settling, because a bare assertion carries
no name and nothing on screen says what it establishes.

Nothing in the `testing` package reaches this today. The rules govern assertions **inside**
a `test` block — the test-block-is-assertion-only rule fixes what may appear there and
requires every operand to be an explaining variable declared in the enclosing context, and
the context-only-for-local-instrumentation rule decides when a context encloses a test.
An assertion that is deliberately **not** a test falls outside all of them, so a
precondition currently reads as a stray or misplaced test to anyone who encounters one.

What has to be settled:

- **What a precondition is, stated exactly.** It qualifies the test rather than protecting
  behavior: a failed precondition means the test's result is **meaningless**, not that the
  unit is wrong. That distinction is what separates it from a test and from coverage, and
  it is what a rule has to make legible.
- **How it is expressed so the reader understands it.** This is the substance. A test
  carries its name on the `test` block; a precondition has nowhere equivalent to put one.
  Whether the condition is carried by an explaining variable whose name states it, by a
  `comment` or `detail` line, or by some other means is open, and the choice is what
  decides whether preconditions read as intelligible or as noise.
- **Where it sits.** A precondition about the controls belongs before the actuation, since
  it qualifies the inputs; whether one can also follow the actuation, and what it would
  mean there, is not settled.
- **Which package it belongs to.** It is a test-writing convention, so `testing` — it holds
  independently of whether the test was designed through the hinges.

**Gated on:** nothing in flight. The convention is settled before any rule is written, and
the expression question above is settled first, since the rest follows from it.

**Why:** preconditions already occur in test code and no rule accounts for them, so each one
is written from scratch and read as an anomaly. Naming the construct and fixing how its
condition is expressed makes the difference between a test and a precondition visible at
the point a reader meets one — which is the whole of what a precondition is for, since an
unreadable one qualifies nothing.

**How to apply:** settle what a precondition is and how its condition is expressed, write
the rule in the `testing` package, then delete this file and log that it was carried out.
Related: the test-block-is-assertion-only rule (what may appear inside a `test` block, and
the explaining-variable requirement a precondition may borrow), the
context-only-for-local-instrumentation rule (the other place a context holds something
beside a test), the tdd-test-structure rule (the control → actuate → observe shape a
precondition sits within), the controls-not-factories-fixtures-arrange rule (the setup a
precondition ordinarily qualifies), and the do-not-test-the-platform rule (the boundary a
precondition must not be confused with — it protects nothing).

---

Authored by Scott Bellware on Thu Jul 30 2026 at 1:46:41 PM PT
