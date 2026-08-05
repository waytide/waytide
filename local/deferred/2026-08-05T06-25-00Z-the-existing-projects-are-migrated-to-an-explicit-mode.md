# The projects that predate the mode are migrated to an explicit mode rule

Every project that existed before the project-mode feature has no mode rule, and under that
feature an absent rule means **the question has never been asked** rather than that the project
is formal. So each of them will be prompted, once, the first time an agent opens it after
`foundation` carries the rule. This item is that work, done deliberately instead.

- **Gated on:** the project-mode feature concluding and `foundation` being published. The rule
  has to exist before a project can be migrated to it.

- **Priority:** 1

## The ordering constraint, which is the reason this is registered rather than assumed

**The migration must reach a project before or with the refresh that brings it the rule.** If
`foundation` is refreshed into a project first, the mode prompt fires there on the next session —
one project at a time, at whatever moment each happens to be opened, which is the opposite of an
explicit migration. Publishing the feature and migrating are therefore not independent, and the
publish is what starts the clock.

## What is in scope

**This repository and the consuming projects in the registry** — five in all. They are not named
here: naming a project only because it installed the packages is what the
`a-project-does-not-name-its-consumers` rule forbids, and `~/.config/waytide/consuming-projects.toml`
is where that list lives. Two of the five could be named on other grounds, and are not, because
listing them beside the others would defeat the point.

**Every one of them is formal**, and none is changing what it does. Each holds `local/design/`
and `local/plans/` and neither creative directory, so the migration writes a `formal-mode` rule
and changes nothing else. The corroboration check the feature defines passes in each case both
before and after.

## What is not settled

- **Whether it is a migration record.** The migration-convention governs transitions of content
  **across a repository boundary**, and this change originates in the composite's rules and lands
  in five separate repositories — which is arguably that, and arguably just a refresh with a file
  added. Deciding it is part of taking this up.
- **Whether the mode is put to the developer for each project or assumed formal.** All five are
  formal in fact, so assuming is correct in outcome; asking five times about a mode none of them
  is changing is the cost the feature already accepted once, arriving again.
- **Whether the five are done in one pass or each on its own.** Each is a separate repository
  with its own commit and its own push.

**Why:** the feature deliberately makes an absent mode rule mean *never asked*, which is what
keeps a deleted rule from silently reverting a project. The cost of that choice is that every
pre-existing project inherits the question, and letting it surface project by project at random
moments wastes the explicitness the design was after. Doing it as one deliberate pass is the same
work, gathered.

**How to apply:** once the project-mode feature has concluded and `foundation` is published, read
the registry, and for each project — and this repository — write the `formal-mode` rule, log it
in that project, and commit. Reach each project before or with the refresh that brings it the
rule. Related: the `a-project-works-in-formal-or-creative-mode` rule (what is being migrated to),
the migration-convention (whose applicability is one of the open questions above), and the
`a-project-does-not-name-its-consumers` rule (why no project is named here).

---

Authored by Scott Bellware on Wed Aug 5 2026 at 12:25:00 AM PT
