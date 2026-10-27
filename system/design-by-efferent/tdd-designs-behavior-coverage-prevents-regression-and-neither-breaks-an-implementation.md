# TDD designs behavior, coverage prevents regression, and neither breaks an implementation

Tests serve two different purposes in two different processes, and conflating them causes unnatural changes:

- **TDD is a design activity.** The failing-test-then-implement cycle is an instrument for *designing* behavior — tests used as **proofs for design**. The red is what drives the implementation into existence. This is the genus DBE belongs to, and the reason the methodology's name says *Design*.
- **Adding test coverage is a separate activity** — **preventing a regression in existing behavior**. It happens *past* the point TDD is concerned with: the behavior is already designed and correct. Here tests are **regression prevention**, not design proofs. It is a testing / final-inspection process, not TDD.

**When adding coverage, a test that passes when first run is inevitable and correct.** The behavior already exists, so the test passes immediately. That *is the point* — a regression in that behavior is now prevented. It is the nature of coverage, not a defect to engineer around, and the stance that such a test is coverage rather than design is a DBE concern that does not apply here.

**Never break, mutate, or otherwise invalidate a working implementation to introduce a test.** Do not do it to "see it go red first." That inverts the relationship, making correct code fail a ritual. It forces unnatural changes to shipped code, and muddies the distinction between designing with tests and preventing regression with tests. There is no red to manufacture when covering behavior that already exists.

**Why:** TDD's red→green belongs to design. Force-fitting it onto a coverage / final-inspection process is a category error. Keeping the two distinct keeps design honest and coverage honest. Design tests are proofs, and coverage tests are regression prevention. It also stops shipped implementations from being deformed to satisfy a misplaced ritual.

**How to apply:** when the behavior already exists and you are adding coverage, write the test and run it. Accept that it is verified, and leave the implementation untouched. Reserve the failing-test-first cycle for design, where a test drives new behavior into existence.

## Compression

- Solubility 85, clarity 0.86 (2026-10-24)
- Compression 0.36, change 0.64 (2026-10-24)
- 13 directives, 13 kept, 0 less precise, 0 lost (2026-10-27)

Related:

- the companion rule "the design of a test waits at the hinges" — they still apply when writing coverage
- the at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor rule — which offers a *contained* red as a candidate while designing new behavior
- the DBE-as-design-tool rule
- the a-test-of-behavior-that-already-exists-is-coverage-not-design rule
- the the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming rule
