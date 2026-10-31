# A rule command creates and lists rules

- **State:** Open
- **Tags:** [idea]

**`/rule` is a root command for the project's rules.**

- `/rule` creates a local rule in `local/rules/`, with the ISO-8601-UTC prefix and the matching log entry.
- `/rule system` creates a rule in a system package's `source/` directory. It is for this repository, where the packages are written, and not for a consuming project, which receives its system rules by installing packages.
- `/rule list` lists the rules.

It belongs with the item `2026-10-29T16-24-42Z-waytide-skills`.

**Not yet settled:**

- how `/rule system` is kept from a consuming project, since the skills are installed there too
- whether `/rule list` lists the local rules, the system rules, or both
- how `/rule system` chooses the package

## History

As the engineer first stated it: "New idea: “/rule” command (creates a local rule, “/rule system” for a new system rule [not for consuming projects], rule list)"

---

Authored by Scott Bellware on Sat Oct 31 2026 at 9:20:05 AM PT
