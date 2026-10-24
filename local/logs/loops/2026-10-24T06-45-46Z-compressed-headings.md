# Loop record — Compressed headings

The fix that keeps the headings within a rule's compressed text when the compiler is switched to it. `./compile.sh --compressed` dropped every `## ` line in a Compressed section, where it meant to drop only the `## Compressed` heading. One outcome, five cycles.

**Mode: unattended.** The engineer directed it at the first hinge, to be briefed at the end. Each cycle records its hinge and what the agent decided, and why.

## Cycle 1 — Actuation

- **Hinge** — how the test runs the compiler.
- **Decision** — `(cd "$headings_repository" && ./compile.sh --compressed)`, in a control repository of its own. It was the one candidate: the use site is the compile with the switch, as the existing compressed outcome's is, and nothing else at the use site varies.

## Cycle 2 — Observation

- **Hinge** — which effect of the compile the test reads.
- **Decision** — the compiled rule's whole text against an expected text. The defect was a line missing from the output, and only the whole text shows what else changes with it. The existing compressed outcome reads the same way.

## Cycle 3 — Controls

- **Hinge** — the known input.
- **Decision** — a literal rule with a Compressed section holding `## Some section` and a line beneath it, followed by a History section, a Related list, and a footer. The expected text keeps the sub-heading and drops `## Compressed`, the History, and the footer. Its values take the "some" form.

## Cycle 4 — Implementation

- **Hinge** — the change to `compile.sh`.
- **Decision** — in `add_part`, skip the line `## Compressed` rather than every line beginning `## `. The skip existed to drop the part's own heading, and the wider pattern also dropped the headings within it. The test failed first on the dropped heading, and passes after. Every test in `test/automated/` passes. Compiled with `--compressed`, the real rules keep their headings: 7 in #14, 8 in #13, 3 in commit-message-widths.

## Cycle 5 — Naming

- **Hinge** — the outcome's name.
- **Decision** — *Keeps the headings in the compressed text*. It states the behavior, beside the existing *Compiles the compressed text when switched* and *Removes the History and Compressed sections*.

---

Authored by Scott Bellware on Fri Oct 23 2026 at 11:45:46 PM PT
