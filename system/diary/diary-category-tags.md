# Experience log entries support square-bracket category tags

Experience log entries can be categorized with square-bracket tags, e.g. `[idea]`. A tag can apply to a whole entry or to an individual bullet point.

- **Bullet point:** the tag prefixes the bullet text — `- [idea] My great idea is thus`.
- **Whole entry:** the tag goes on a dedicated `**Tags:**` metadata line placed directly under the `# title` heading, before the `**Summary:**` line (if any). Multiple tags are space-separated: `**Tags:** [idea] [decision]`.

Tags are freeform and lowercase; use a kebab slug for multiword tags (`[legal-matter]`). There is no fixed controlled vocabulary — introduce tags as needed.

**Why:** Lightweight, skimmable categorization that's visible in raw-text Quick Look preview and greppable, without imposing a rigid taxonomy.

**How to apply:** When the user prefixes dictated text with a `[tag]`, preserve it verbatim. To categorize a whole entry, add a `**Tags:**` line under the title. When the user states a categorization in passing, tag accordingly.
