# The projects that predate the mode are migrated to an explicit mode rule

Every project that existed before the project-mode feature has no mode rule, and under that
feature an absent rule means **the question has never been asked** rather than that the project
is formal. So each of them will be prompted, once, the first time an agent opens it after
`foundation` carries the rule. This item is that work, done deliberately instead.

- **Gated on:** nothing. **The gate cleared on 2026-08-05:** the project-mode feature concluded
  and `foundation` was published (`fd20473..8948242`). This is actionable now, and was left in
  the queue by choice.

- **Priority:** 1

## The ordering constraint

**A refresh is what brings a project the rule, and a project with the rule and no mode rule of
its own prompts on its next session.** Publishing alone changes nothing in any project — it makes
the rule available, not present. So the constraint is narrower than first stated: **do not refresh
the four consuming projects before this migration runs**, or each will raise the mode question on
its own, one at a time, at whatever moment it is next opened.

## The mode is creative, which changes what this work is

**Directed 2026-08-05: every project operates in creative mode.** The item was written on the
assumption that all of them were formal in fact and the migration would write a `formal-mode` rule
and change nothing else. That is no longer what this is.

**Creative means the existing artifacts are in the wrong directories.** A `creative-mode` rule in
a project whose only populated planning directories are `design/` and `plans/` is exactly the
**contradiction** the `a-project-works-in-formal-or-creative-mode` rule defines. So this migration
**moves content**; it does not merely add a file. As of 2026-08-05 the four consuming projects
hold, between them, eight documents under `design/` and two under `plans/`, and this repository
holds five and one.

**One boundary holds regardless.** A design is a **live, forward-looking** artifact and may be
moved and reconciled. The **log entries and work session records** that reference `local/design/`
paths are **historical records** and are left as written — they will point at paths that have
moved, and a reader who follows a dead path in an old record uses git, per the
deferred-convention.

## What is not settled

- **Whether this repository is included.** The direction named *the four consuming projects* and
  then *all projects*. Waytide itself holds five designs and a plan. Whether the authoring source
  runs the mode it asks its consumers to run, or stays formal because its designs are about the
  system rather than made with it, is unanswered.
- **Whether the moved documents are retitled.** A document in `aspiration/` titled `— Design`
  defeats the vocabulary the mode exists for; retitling edits every moved file and adds a
  provenance line to each. Not decided.
- **Whether it is a migration record.** The migration-convention governs transitions of content
  **across a repository boundary**. This one both crosses boundaries and moves content within each
  project, which is a stronger case for a migration record than the item first made.
- **Whether the four are done in one pass or each on its own.** Each is a separate repository with
  its own commit and its own push.
- **What `useful-objects-new` implies for the others.** It is not the empty project it was when it
  was created: between 2026-08-04 18:09 and 2026-08-05 05:44 it accumulated three designs,
  seventeen log entries, and a work session record across six commits. Migrating it moves real
  work, and it is the newest of the four.

**Why:** the feature deliberately makes an absent mode rule mean *never asked*, which is what
keeps a deleted rule from silently reverting a project. The cost of that choice is that every
pre-existing project inherits the question, and letting it surface project by project at random
moments wastes the explicitness the design was after. Doing it as one deliberate pass is the same
work, gathered. With the mode now creative rather than formal, the pass also carries the content,
which is the larger half of it.

**How to apply:** settle the questions above first — they decide the size of the work. Then, for
each project in the registry, write the `creative-mode` rule, move `local/design/` to
`local/aspiration/` and `local/plans/` to `local/intention/`, leave the historical records
pointing where they point, log it in that project, and commit and push. Do not refresh a project
before migrating it. Related: the `a-project-works-in-formal-or-creative-mode` rule (what is being migrated to),
the migration-convention (whose applicability is one of the open questions above), and the
`a-project-does-not-name-its-consumers` rule (why no project is named here).

---

Authored by Scott Bellware on Wed Aug 5 2026 at 12:25:00 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:28:50 AM PT
