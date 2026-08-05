# `waytide/local/design/` (or `waytide/local/aspiration/`) — the docs that settle direction

`waytide/local/design/` holds **design docs**: the settled *direction* of a piece of work, written before a plan sequences the build. A design decides what the shape should be — structure, construction, API, the model — and records the resolutions that later work rests on.

**Under a project's intuitive mode this is `waytide/local/aspiration/`, and the artifact is an aspiration.** Everything in this rule holds unchanged for it — the mode changes the vocabulary and the directory, not a single obligation (see the a-project-works-in-formal-or-intuitive-mode rule). The rule is written in the formal mode's terms because formal is the default; read *design* as *aspiration* and `design/` as `aspiration/` in an intuitive project.

- **Relationship to plans:** a design settles direction; an `waytide/local/plans/` plan **realizes** it (an intention, in `waytide/local/intention/`, under intuitive mode). The design is the stable reference the plan points back to (its **Source design**).
- **Two kinds:** a **feature/component design** (the structure, file layout, construction, and API of a unit of work) and a **methodology design** (a way of working, argued from a premise). Both live here; they share a spine, not a fixed section list.
- **Settled resolutions:** a design records **Settled** decisions with the date they were settled, so a reader knows what is fixed versus still open. A trailing **Out of Scope / Deferred** section marks what the design deliberately leaves out.
- **Format:** the same frontmatter-free markdown as rules; the *document shape* (its sections) is the design-document-format rule. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **How it stays current:** a design is **reconciled** against the records, never regenerated from them — it is a source of truth that a plan points back at, so rebuilding it from the work downstream would invert that. The reconciliation is prompted when a **work session record is written**, where the records have just been read and the session is closing; the developer decides which side is stale, since either may be. See the work-sessions-convention.

**Why:** deciding direction and executing it are separate acts, and the direction must stay stable while the build proceeds against it. A dedicated home for designs — distinct from the plans that realize them — keeps the settled shape and its dated resolutions readable on their own, and gives every plan one authoritative source to point at.

**How to apply:** before sequencing a build, settle its direction in a design here, dating each resolution as it is settled and marking what is out of scope. Point the realizing plan back at it. In an intuitive-mode project do all of that in `waytide/local/aspiration/`, calling the artifact an aspiration; nothing else differs. Related: the plans-convention, the design-document-format and package-dependency-heading rules, the a-project-works-in-formal-or-intuitive-mode rule (the mode that decides which directory this is), and the decision-log rule.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 11:37:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
