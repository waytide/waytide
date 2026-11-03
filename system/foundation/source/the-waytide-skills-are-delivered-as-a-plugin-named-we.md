# The Waytide skills are delivered as a plugin named we

**Trigger:** When writing a Waytide skill, or installing, refreshing, or activating the packages that carry skills

**The Waytide skills reach a project as one skills-directory plugin, named `we`.** It sits at `.claude/skills/we/` in the project, with a `.claude-plugin/plugin.json` whose `name` is `we`. A skill is typed `/we:<command>`, and `/<command>` where no other command on the machine claims the name.

**Each package carries its own skills**, under `skills/` in the package: `skills/<command>/SKILL.md`, one directory per root command or alias. A skill belongs to the package whose rules it hands its act to.

**The plugin directory is assembled from the active packages' skills.** `install.sh` and `refresh-packages.sh` copy each active package's `skills/` into `.claude/skills/we/`, and leave out a deactivated package's. A package activated or deactivated takes its skills with it at the next assembly.

**The plugin directory is committed with the project**, as `.claude/settings.json` is, so every engineer who clones the project has the skills. It is assembled rather than edited: a change to a skill is made in its package, and reaches the plugin at the next install or refresh.

**A skill's body stays thin.** It reads the words typed, loads the rule that governs the act with `load-rules.sh`, and follows it, per the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-always-takes-help rule.

**Why:** a plugin gives the skills one namespace, so a clash with another plugin's command is kept apart. Carrying each skill in its package means a deactivated package's commands go with its rules, and the assembled directory means a project needs nothing beyond the packages to have them.

**How to apply:** write a skill in its package's `skills/<command>/SKILL.md`, thin, handing its act to a rule. Assemble `.claude/skills/we/` from the active packages' skills at install and refresh, with `plugin.json` naming `we`, and commit it. Edit no skill in the assembled directory.

## Compressed

1. The skills reach a project as one skills-directory plugin, `.claude/skills/we/`, whose `.claude-plugin/plugin.json` names it `we`. A skill is typed `/we:<command>`, or `/<command>` where no other command claims the name.
2. Each package carries its own skills, as `skills/<command>/SKILL.md`, one directory per root command or alias. A skill belongs to the package whose rule it hands its act to.
3. `install.sh` and `refresh-packages.sh` assemble `.claude/skills/we/` from the active packages' skills, leaving out a deactivated package's.
4. Commit the assembled directory, as `.claude/settings.json` is committed. Change a skill in its package, never in the assembled directory.
5. A skill's body stays thin: it only reads the words typed, loads the rule governing the act with `load-rules.sh`, and follows it.

## Compression

- 2026-11-02, compressed: checked: 18 directives, 16 kept, 2 less precise, 0 lost, 1 repair; re-checked: 18 directives, 16 kept, 2 less precise, 0 lost. Left less precise: the reason the assembled directory is committed, and when a changed skill reaches the plugin, which follows from the assembly point

Related:

- the a-command-takes-its-subcommand-first-asks-when-it-has-none-and-always-takes-help rule — the thin skill
- the a-project-declares-which-installed-packages-are-active rule — the active packages

---

Authored by Scott Bellware on Mon Nov 2 2026 at 9:02:21 PM PT
