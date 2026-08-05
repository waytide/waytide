# The system still names the formal directories in five rules that have no notion of mode

The project-mode feature made **four** rules mode-aware — design-convention, plans-convention,
design-document-format, and plan-document-format. It did not reach everything that names
`waytide/local/design/` or `waytide/local/plans/`, and the migration of five projects to creative
mode on 2026-08-05 is what surfaced the rest.

- **Gated on:** nothing. Actionable now.

- **Priority:** 1

## What still names the formal directories

~~**`install.sh` is the one with teeth.**~~ **Corrected 2026-08-05.** It generated the
project-root `AGENTS.md` with a working-directory list naming `design/` and `plans/` and no notion
of mode, so a creative project regenerating its bootstrap — which `refresh-packages.sh` tells a
developer to do when foundation's bootstrap changes — would have the formal directories written
back into it, silently, as part of a routine refresh.

**The generated list now names no planning directory at all**, saying *and the project's planning
directories* instead. The installer cannot know the mode: it is chosen by the agent at the
project's initiation, which is **after** an install has run, so at first install there is nothing
to detect. The list was illustrative already — it omits `migration/` and `suspended/` — and its
claim is that these are working state rather than rules, which survives without naming every one.
A comment above `bootstrap()` records why, so the pair is not helpfully added back.

**The five projects' own `AGENTS.md` files are left as they are**, naming `aspiration/` and
`intention/` from the migration's hand-correction. They are more informative than what the
generator now emits and no longer at risk from it — a regeneration would replace them with the
mode-neutral wording, which is true rather than wrong.

**Five rules name them in prose**, each for its own reason and not all of them wrong:

- **status-report-format** — reads "the active plan's tasks" from `waytide/local/plans/`. A
  creative project's status report would look in a directory it does not have. This one is a
  defect.
- **work-sessions-convention** — names the durable records a work session record points at,
  `waytide/local/plans/` among them. Same defect, smaller.
- **plans-no-code-samples** — governs `waytide/local/plans/*.md`. Its rule is about plans as
  documents, so it should reach intentions too.
- **migration-convention** — contrasts itself with a `waytide/local/plans/` plan. Arguably fine:
  it is drawing a distinction against the formal artifact by name.
- **the foundation README** — names both modes already in its summary, and names the formal
  directories in its work-artifact list, where it now also names the creative pair. Probably
  correct as it stands.

## What is not settled

- **Whether the installer takes a mode argument, or generates mode-neutral text.** A generated
  bootstrap that named both pairs would be true in either mode and would need no argument, which
  is the cheaper answer if it reads acceptably.
- **How far the mode-awareness obligation reaches.** The project-mode feature accepted that
  naming both directories in five places rather than one was the cost of a reader seeing the truth
  in any single rule. Every rule that names a planning directory inherits that, and this item is
  the first instalment of the bill.

**Why:** the migration proved the feature works and simultaneously proved it was not finished —
five projects now run a mode that six pieces of the system do not know about. The installer is the
one that can silently undo work, so it is the reason this is ranked rather than merely noted.

**How to apply:** the installer is corrected. For what remains, decide, for each of the five rules, whether it is naming the formal
artifact deliberately or failing to account for the creative one. Related: the
`a-project-works-in-formal-or-creative-mode` rule (what these need to account for), and the four
planning conventions that were made mode-aware (the pattern to follow).

---

Authored by Scott Bellware on Wed Aug 5 2026 at 12:40:00 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:49:21 AM PT
