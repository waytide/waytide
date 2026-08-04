# The plan package is folded into foundation

Execution plan for retiring the `plan` component repository and moving its four rules into
`foundation`.

- **Source:** `system/plan/` in this repository, published to `https://github.com/waytide/plan`.
- **Destination:** `system/foundation/`, published to `https://github.com/waytide/foundation`.
- **Consuming projects holding the source:** `constant` and `env-var` at
  `/Users/sbellware/projects/eventide/`, and `website` at `/Users/sbellware/projects/waytide/`,
  each with `waytide/system/plan/` installed by `git subtree`.

## Why

**The citation ran both ways.** `foundation` named the `plan` package twice — in
`design-convention` and `plans-convention` — for the *document shape* of artifacts `foundation`
itself defines. And every rule in `plan` was addressed to `waytide/local/plans/` or
`waytide/local/design/`, directories only `foundation` creates. A base package and a leaf
depending on each other is a boundary drawn in the wrong place.

**Nothing else depended on it.** No package included `plan`. It was a leaf with one dependent,
and that dependent was the package it required.

**Its standalone declaration was wrong**, by the criterion `a-citation-is-not-a-dependency`
states: a citation is a dependency where the citing rule *will not work* without the cited
package. A rule addressed to `waytide/local/design/*.md` does not work in a project that has no
such directory. This is recorded as a correction in the citation observation, since that
observation had surveyed `plan` and passed it.

**And the name was never accurate.** The package's own README conceded it: *"despite the name
'plan', it governs design documents too."* Two of its four rules were about designs. Folding it
in dissolves the naming problem rather than solving it, which is what the alternatives — renaming
it `work-plan`, or unbundling the design rules and leaving a two-rule package — would have been
doing.

## What moved

Four rules, unrenamed:

| File | Governs |
|---|---|
| `plan-document-format.md` | the plan's title, common elements, and their order |
| `plans-no-code-samples.md` | no code blocks; no premature method or file names |
| `design-document-format.md` | the design's title and spine |
| `package-dependency-heading.md` | the **Package Dependency** section title |

`system/plan/README.md` was deleted rather than moved — a package README describes a package,
and there is no longer one.

## Increments

1. **Move the four rules** into `system/foundation/` with `git mv`, and delete the package
   README. **Done 2026-08-03.**
2. **Remove the delegation.** `design-convention` and `plans-convention` said the shape "is the
   `plan` package's … rule"; they now name the sibling rule directly. **Done 2026-08-03.**
3. **Absorb the four rules into `foundation`'s README**, with a note that they were the `plan`
   package and why they are here. **Done 2026-08-03.**
4. **Drop `plan` from the project README** — the package list, the dependency graph, and both
   `git subtree` blocks — and from `install-all.sh`. **Done 2026-08-03**, and `versioning`, which
   had been missing from all four, was added in the same pass.
5. **Reconcile the live artifacts that cite it.** Two observations: the citation observation,
   whose survey passed `plan`'s standalone claim and is corrected; and the planning-spans-three-
   artifacts observation, one of whose two open questions this settles. Historical records — log
   entries, work session records, features, experiments, and the suspended phase-B runbook — are
   left as written. **Done 2026-08-03.**
6. **Publish `foundation`.** **Done 2026-08-03.**
7. **Remove `waytide/system/plan/` from `constant`, `env-var`, and `website`**, each a subtree
   removal in a repository this plan does not reach. **Done 2026-08-03.** In each: the directory
   removed and committed on its own, then `refresh-packages.sh` run so the same four rules
   returned under `waytide/system/foundation/`, then a decision-log entry recorded in that
   project and the whole pushed. Each project was clean, on `master`, and level with its remote
   before and after. The refresh carried `design-by-efferent`, `language`, and `versioning`
   forward in the same pass, which is more than this migration required and is noted in each
   project's log entry.
8. **Archive `https://github.com/waytide/plan`.** **Done 2026-08-03.** Archived rather than
   deleted: the repository is the trail for anyone who installed the package before this, and its
   final commit is reachable from `foundation`'s history. Its description was rewritten first —
   an archived repository is read-only — to *Waytide plan. Folded into Waytide foundation on
   2026-08-03 — its rules now live there.*, so a reader who arrives at the repository is told
   where the content went without having to open it.

## What is true in between

**This window did not open.** Increments 7 and 8 ran in the same sitting as the rest, so no
project stood with both copies for any appreciable time. What follows describes the state the
plan had prepared for.

**Until increment 7 runs, the three consuming projects hold both copies.** They have
`waytide/system/plan/` from the old package and, once they refresh `foundation`, the same four
rules again under `waytide/system/foundation/`. **The rules are identical**, so the duplication
is redundant rather than contradictory — a session reading both reads the same rule twice. That
is the cost of the window, and it is small.

**A project that refreshes `foundation` without removing `plan` is in a working state**, which
is why the two increments were not required to be simultaneous.

**The published `plan` repository stops receiving commits at this point.** Its `master` stands at
whatever this repository last pushed, and nothing in the composite splits to it any longer.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 11:40:35 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 11:47:02 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 11:54:41 PM PT
