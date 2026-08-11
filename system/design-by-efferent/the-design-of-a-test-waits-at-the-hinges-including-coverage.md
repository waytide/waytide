# The design of a *test* waits at the hinges — they apply to coverage too, with the implementation hinge degenerate

The five hinges (actuation, observation, controls, implementation, naming) are where
**design decisions** wait, and *designing a test* is itself a design act — independent of
whether behavior is being designed (DBE) or existing behavior is being covered
(testing). So the hinges are in play when writing coverage, not only when designing.

When adding coverage for behavior that already exists, all five are in play:

- **Actuation** — confirm the actuation's shape.
- **Controls** — a real decision: how to construct the situation the test needs
  (e.g. an inherited-only constant via an `include` relationship).
- **Observation** — a real decision: what to read about the behavior's effect, and how.
- **Naming** — the outcome contexts, settled at the close.
- **Implementation** — in play but **degenerate**: there is no new code to write
  and no red to drive. It reduces to running the test against the existing
  implementation and confirming it passes. **Solubility is still judged** — if the
  test reads awkwardly against clean code, the fix goes to the **test** (its
  control / actuation / observation), never to the implementation.

**Why:** the hinges are the mechanism for handing each design decision to the human
at its gate. A coverage test has genuine design decisions — especially its controls
and observations — so it earns the same wait. What separates coverage from design is
**not** the absence of hinges: it is that no behavior is being designed and no red
is driven (see the companion rule — TDD designs, coverage prevents. Never break an
implementation to introduce a test).

**How to apply:** design a coverage test through the hinges as usual. Actuation, controls, observation, naming. With a wait at each for the human. Treat the
implementation hinge as a confirmation step (run, show verified), sending any
awkwardness back to the test, not the implementation.

Related:

- the hinge-cycle rule
- the what-each-hinge-displays rule
- the companion "TDD designs
- coverage prevents" rule

---

Authored by Scott Bellware on Wed Jul 1 2026 at 6 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:49:34 PM PT
