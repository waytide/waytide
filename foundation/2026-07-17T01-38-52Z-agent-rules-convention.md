# `agent/rules/` — binding project rules, one per file

`agent/rules/` holds the project's **binding** rules — naming conventions, terminology, plan-writing norms, commit conventions, and the like — one rule per file.

- **Read every file in `agent/rules/` at the start of a session and follow them.** They override default behavior where they conflict; explicit user instructions still win.
- **A rule's purpose may cut across its category.** Folder names name the *surface* a rule acts on, not the purpose it serves; judge a stance-installing rule by the mindset it installs, not by surface conformance. See the rules-install-a-mindset rule.
- **Format:** frontmatter-free markdown — a `# <title>` stating the rule, the rule in prose, then short `**Why:**` and `**How to apply:**` lines. The filename follows the ISO-8601-UTC prefix convention (see the agent-file-names rule).
- **Recording a new rule:** when the user states a rule, or a decision sets a rule for future work, add it here as a new file, and add a matching one-line entry to `agent/log/`.

**Why:** the rules are the project's durable, in-repo conventions, committed alongside the code and read fresh each session rather than recalled — so they stay authoritative and current. One rule per file keeps each convention individually readable, referenceable, and revisable.

**How to apply:** read the whole folder at session start and hold to it. When a new binding convention is set, write it here in the format above and log it. Prefer an observation over a rule when the thinking hasn't stabilized (see the observations rule). Related: the agent-file-names rule, the rules-install-a-mindset rule, and the decision-log rule.
