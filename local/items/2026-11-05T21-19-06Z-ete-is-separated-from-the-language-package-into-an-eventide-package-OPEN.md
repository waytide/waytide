# ETE is separated from the language package into an Eventide package

- **State:** Open
- **Tags:** [idea]

**Eventide Technical English, ETE, would leave the `language` package and become a package of its own, named for Eventide.** ETE's rules sit today in the `language` package's `ete/` directory: the rules that reserve a word in six steps, declare ETE's own categories, fix a word's meaning in its category, leave ordinary vocabulary alone, keep Waytide's word where the STE word means something else, and conform Waytide's prose to the STE writing rules.

Separated, ETE could be installed, activated, or deactivated apart from the rest of `language`, as any package can.

**Not yet settled:** the package's name; whether the `/reserve` and `/ete` commands move with it; which vocabulary entries go with it, such as the entry for ETE itself; whether `language` comes to depend on it, since many of its rules cite ETE; and the migration this would need, since a move between packages changes where installed rules sit in a consuming project.

## History

As the engineer first stated it: "Idea: Separate the ETE from the language package and package it in an Eventide package"

---

Authored by Scott Bellware on Thu Nov 5 2026 at 1:19:06 PM PT
