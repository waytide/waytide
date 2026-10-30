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

## History

As the engineer first stated it: "Idea: a “root” command (ie: “/root”) that allows commands to target the system's root install of waytide. Or, a command in packages that sets a consuming project in the registry to be the system-level install of waytide"

---

Authored by Scott Bellware on Thu Oct 29 2026 at 11:57:47 PM PT
