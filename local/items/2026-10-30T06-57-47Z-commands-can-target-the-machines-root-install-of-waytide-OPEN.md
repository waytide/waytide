# Commands can target the machine's root install of Waytide

- **State:** Open
- **Tags:** [idea]

**One Waytide install on a machine is its root install, and commands can be directed at it from within any project.** Two forms are named:

- **A `/root` command**, which a command is prefixed with to act on the root install rather than on the project the session is in.
- **A subcommand of `/package`** that marks one project in the machine's registry, `~/.config/waytide/consuming-projects.toml`, as the root install.

**Not yet settled:**

- which of the two forms, or both
- what a root install is for, and which commands act on it
- how it sits beside `/projects`, which works with the same registry

## Settled

- **2026-11-05** — It is called the **system project**, not the root install. It is a catch-all project for general-purpose work, kept apart from the special-purpose work of a project of its own.
- **2026-11-05** — A facility sets the system project, and a project can override which system project is its own.

**Amended 2026-11-05:** the system project might be hierarchical. A system project would sit at the level of a directory holding several other projects, and serve those beneath it. **Not yet settled:** whether it is hierarchical, how a project finds its system project where there are several, the facility's form, and whether the `/root` prefix and the `/package` subcommand named above still stand.

## History

As the engineer first stated it: "Idea: a “root” command (ie: “/root”) that allows commands to target the system's root install of waytide. Or, a command in packages that sets a consuming project in the registry to be the system-level install of waytide"

On 2026-11-05: "Update to that idea: It should be called the "system" project. It's use is to have a kind of catch-all project that's for general purpose work, rather than special-purpose local project stuff. The feature needs a facility to set the system project, and a given project can override what it's system project is. It might be hierarchical, as well, so a system project is at the level of a directory containing numerous other projects."

---

Authored by Scott Bellware on Thu Oct 29 2026 at 11:57:47 PM PT
Changed by Scott Bellware on Thu Nov 5 2026 at 1:57:44 PM PT
