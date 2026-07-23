# Record a rule's author in the file

Record the **author** — the contributor — and a **datetime stamp** in each rule file, so a rule's authorship and timing are traceable. Especially valuable for a project with multiple contributors, where the traceability of rules — who authored a new rule, and who changed an established one — is essential to the engineering process.

**The datetime stamp is human-readable local time**, formatted like `Mon Jan 1 2026 at 3 PM PT` — day-of-week, month, day, year, then the time with AM/PM and a timezone abbreviation. It uses **local time inside the file**, deliberately unlike the ISO-8601-UTC filename prefix (which is machine-sortable and UTC): the in-file stamp is provenance for a human reader, so it is written to be read.

**To settle on initiation:**
- **What** is recorded — the author (a name/handle) and the human-readable local datetime, for the original rule and/or for each change.
- **Where and how** — the rules are frontmatter-free markdown, so likely an inline attribution line rather than YAML frontmatter; reconcile with the `agent-rules-convention` format.
- **Why in-file rather than git history** — a package is installed into a consuming project by `git subtree`, which does **not** carry the composite repo's per-file history into that project. So `git blame`/`log` in a consuming project cannot show who authored a rule; an in-file record travels with the file. Confirm this is the motivation.

**Why:** in a multi-contributor project, who authored or changed a rule is part of the engineering process — rules are the durable conventions, and their provenance matters for review, accountability, and understanding intent.

**Gated on:** nothing specific — settle the format when initiated.
