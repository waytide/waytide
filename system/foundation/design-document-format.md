# How a design doc reads — and an aspiration, which reads the same

A design doc (`waytide/local/design/*.md`) is titled `# <Title> — Design` and shares a spine, not a fixed section list

**Under a project's creative mode the document is an aspiration**, in `waytide/local/aspiration/`, titled `# <Title> — Aspiration`. **Its shape is this shape, entirely** — the same spine, the same dated **Settled** resolutions, the same **Out of Scope / Deferred** tail. The mode changes what the document is called and where it lives, and nothing about how it reads (see the a-project-works-in-formal-or-creative-mode rule). Only the title word and the directory differ below — the substance differs between a **feature/component** design and a **methodology** design, but the frame is common:

- **Summary** or **Premise** — the design in brief, or the premise a methodology argues from.
- **Background & Motivation** — what prompted the design and the problem it resolves.
- **Vocabulary** — the terms the design relies on, defined, when it introduces or leans on non-obvious ones.
- **Substantive sections** — the body: for a component design, named or numbered sections for structure/file layout, construction, and API; for a methodology design, the way of working argued in sequence. A section documenting a package dependency is titled **Package Dependency** (see that rule).
- **Settled** — resolutions with the **date** they were settled, so fixed decisions are distinguished from open ones.
- **Out of Scope / Deferred** — what the design deliberately leaves out.

**Why:** a design is the stable reference a plan realizes and a reader returns to, so a common frame — summary, motivation, substance, dated resolutions, explicit exclusions — lets a reader locate the settled shape and know what is fixed versus open without reconstructing it. Dating the settled resolutions makes the design's own history legible.

**How to apply:** when writing a design, open with a summary or premise and the motivation, define the vocabulary it introduces, develop the substance in named or numbered sections, and close with dated **Settled** resolutions and an **Out of Scope / Deferred** section. A design may show interface shape — signatures, structure, the model — but not implementation bodies; the how emerges in the build. Write an aspiration exactly the same way, titled `— Aspiration`. Related: the foundation design-convention (what the directory is), the a-project-works-in-formal-or-creative-mode rule (which of the two directories a project uses), and the package-dependency-heading rule.

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
