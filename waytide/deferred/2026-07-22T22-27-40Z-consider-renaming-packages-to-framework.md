# Consider renaming the `waytide/packages/` directory to `waytide/framework/`

The install-target directory was renamed from `waytide/rules/` to `waytide/packages/`
(it holds the installed framework packages). Consider whether `waytide/framework/`
reads better — the installed content *is* the framework, and "framework" names it by
what it is rather than by its packaging.

**Weigh:** "packages" names the unit (each subdirectory is a package); "framework"
names the whole (the installed framework). Either separates installed content from
the project's own `waytide/rules/`.

**Scope if taken:** the same set of files the packages rename touched — `install-all.sh`,
`foundation/install.sh` (prefix + the AGENTS.md bootstrap it writes), every package
README's install instructions, `install-dependencies.sh` in each package, and the
rules that describe the path (`agent-rules-convention`, `agent-file-names`,
`agent-observations-convention`, `status-report-format`, the root README, CONTRIBUTING).

**Gated on:** nothing urgent — a naming reconsideration to settle before the layout
is widely depended on.
