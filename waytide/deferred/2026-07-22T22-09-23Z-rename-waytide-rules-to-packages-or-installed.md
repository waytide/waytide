# Rename the install-target `waytide/rules/` to `waytide/packages/` or `waytide/installed/`

In a consuming project, the installed framework packages land in `waytide/rules/`. That name says "rules" when the directory really holds **installed packages** — and the same directory currently also holds the project's own loose local rules, mixing installed content with the user's own work. Renaming it to name what it *is* — the installed packages — separates the two by name and clarifies the layout.

**Options to choose between:** `waytide/packages/` or `waytide/installed/`.

**Scope when picked up (touches many places):**
- `install-all.sh` (the `add` function's `prefix="waytide/rules/$1"`).
- Every package README's install instructions (`git subtree add --prefix waytide/rules/<package>`).
- `foundation/install.sh` — its `prefix` and the AGENTS.md bootstrap text it writes.
- Rules that describe the path: `agent-rules-convention`, `agent-file-names`, `status-report-format`, and others that mention `waytide/rules/`.
- Decide, in the same change, where a project's **own local rules and its own vocabulary/substitutions** live — the installed-vs-own separation this rename is part of (possibly their own directory rather than loose in the install target).

**Gated on:** completing the current rules-files-flattening experiment conclusion (push + republish) first; this is a separate consumer-path concern that does not block it.

**Why:** naming the directory for what it holds (installed packages) rather than "rules" makes the installed content distinct from the user's own work at a glance, and sets up cleanly separating a project's own rules from the packages it installs.
