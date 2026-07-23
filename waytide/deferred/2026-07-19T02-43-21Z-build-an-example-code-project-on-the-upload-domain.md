# Build an example code project on the Upload domain

The `Upload` domain used throughout the `testing` and `code/ruby` rules — `Upload` (a useful object: dependency, `build` factory, `call` actuator) and its value object `Upload::Result` (with the `Success` / `Rejected` family) — is **not** invented for the rules. It comes from an existing example project:

- **Source project:** `dependencies-and-substitutes` — local at `/Users/sbellware/projects/eventide/dependencies-and-substitutes`, hosted at <https://github.com/eventide-examples/dependencies-and-substitutes> (the `eventide-examples` org). The `Upload` class appears as an evolving `demos/*.rb` series (dependency / substitute / mimic concepts). The in-rule snippets were drawn from it.

So a real project already carries the `Upload` domain; today it lives there as **demos**, and inside the norms only as **scattered rule illustrations**.

**Decided (2026-07-19):** the example project **starts fresh** and **builds up the `Upload` solution following DBE** — it is not an extension of `dependencies-and-substitutes` and not a static drop of finished code. The whole point is to *exercise the method*: the solution is originated hinge-by-hinge, test-first, with the design/plan/loop/experiment artifacts accumulating as the build proceeds. `dependencies-and-substitutes` is the **reference** for what the `Upload` solution looks like (the target domain), not the codebase that gets extended.

**Shape:**
- A fresh, buildable Ruby project built up **via DBE**, following the `code/ruby` style and the `testing` conventions (controls, "Is" naming, context nesting, etc.) as the solution emerges.
- Its own `waytide/` tree exercising the foundation / DBE / docs conventions **in the act of building** — rules installed via subtree, and real `design/`, `plans/`, `loops/` (and possibly `experiments/`) artifacts produced as the `Upload` solution is originated, so the conventions are shown *in use*, not just described.
- Serves double duty as a live proving ground for the packages (a real consumer, not just the throwaway pull-proofs).

**Open questions (decide when initiated):**
- Scope / stopping point — how much of the `Upload` solution to build up (a single feature to first green, or the fuller domain through several DBE cycles)?
- Home — its own repo (which org — `eventide-examples` alongside `dependencies-and-substitutes`, or elsewhere)?
- Whether the scattered in-rule `Upload` snippets should then point at the example project as the canonical source of the domain.

**Gated on:** not blocking any in-flight work; deferred as a future initiative. Independent of the parked `constant` work.

**Why:** the norms are currently taught rule-by-rule; a single coherent example project would show how they compose, and would give the packages a real consumer that surfaces integration gaps the isolated pull-proofs can't.

**Use the existing implementation as source material.** `dependencies-and-substitutes` and its `demos/` `Upload` series are the **source material** the fresh build draws on — read them for the target domain, the useful-object shape, and the dependency/substitute concepts, then *originate* the solution via DBE rather than copying the code across. It informs the destination; it is not the starting codebase.

**How to apply:** when initiated, study `dependencies-and-substitutes` (its `demos/` `Upload` series) as source material, settle the scope and home questions above, then build a fresh `Upload` project up **via DBE** — test-first, hinge-by-hinge — under the `code/ruby` and `testing` conventions, installing the packages into its `waytide/rules/` tree and producing real `design`/`plans`/`loops` artifacts as it grows. Decide whether the in-rule snippets should reference it. Related: the source project `dependencies-and-substitutes` (`eventide-examples` org), the `code/ruby` and `testing` rules that already use the `Upload` domain, and the agent-plans / agent-design / agent-experiments conventions the project would exercise.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 7 PM PT
