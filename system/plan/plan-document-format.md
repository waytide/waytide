# How an implementation plan reads

An implementation plan (`waytide/local/plans/*.md`) is titled `# <Title> — Implementation Plan` and reads in a settled order. The sections, in order:

- **Goal** — one paragraph: what the plan achieves.
- **Source design** — a pointer to the `waytide/local/design/` doc the plan realizes (omit only when there is no separate design).
- **Superseded plans** — the plans this one supersedes, named, with what carries over from each as history. Plural: a plan may supersede a series that came before it. **Superseded** rather than *replaced* because it states the authority — a superseded plan is not merely earlier, it no longer governs.
- **Architecture** — the phases and how they group the tasks; characterize each phase (e.g. an atomic behavior-neutral conversion versus a test-first build).
- **Process notes** — how the tasks are worked (test-first, controls usage, and that **code is not specified in the plan** — see plans-no-code-samples).
- **Tasks** — each a single checkbox (`- [ ] Task N: <name>`) stating intended **behavior**, not code; completed tasks may carry inline notes recording reworks, drops, and supersessions.

**Two sections were removed on 2026-08-03, and the reason is the same for both: neither belonged to a plan.** **Commit policy** restated which of the `git` package's conventions applied, which is a second place to keep true and the package's own concern — the rule said as much while asking for the section anyway. **Tech Stack** was one line answering a question a project answers once, not per plan.

**Why:** a plan is scanned by a worker executing it task by task, so a predictable section order and behavior-stated tasks let them find the next increment and its intent without re-reading. Stating behavior rather than code keeps the interactive, incremental control over generation that the plans-no-code-samples rule protects.

**How to apply:** when writing a plan, follow the section order above and state each task as a behavior with a single checkbox. Point **Source design** at the design being realized, and keep code out of the document. Do not restate the commit conventions or the project's stack; the first is the `git` package's and the second does not vary by plan. Related: the foundation plans-convention (what the directory is), plans-no-code-samples, and the `git` commit rules.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 10:30:52 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 10:35:20 PM PT
