# `waytide/log/` — one file per decision, a one-line title

Record decisions made during sessions as one file per decision in `waytide/log/`.

- **Trigger:** detect — write an entry whenever a real decision is made (the user picks among alternatives, accepts or rejects an approach, or sets a rule that will guide future work). Don't wait to be asked. When in doubt, log it; over-logging is cheaper than under-logging here.
- **Filename:** the ISO-8601-UTC prefix convention (see the agent-file-names rule), computed with `date -u +%Y-%m-%dT%H-%M-%SZ`. Contributors are globally distributed, so UTC is mandatory — never local time.
- **Content:** one line — a `# <title>` that states the decision. No body, no template. Keep the title informative enough to skim.
- **Commit:** include log entries in the same commit as the change they describe, or commit them separately with a `Log:` prefix. Don't sit on them.

**Why:** the reasoning and decisions of a project are easy to lose and expensive to reconstruct; a one-line-per-decision log, committed alongside the code, keeps a skimmable, durable record without the overhead of a template. Detecting and logging without being asked keeps the record complete rather than sampled.

**How to apply:** when a decision is made, write a titled one-line entry under `waytide/log/` with a UTC filename, and commit it with the change (or with a `Log:` prefix). Related: the agent-file-names rule (the shared filename convention), the agent-rules rule (a new rule pairs with a log entry), and the observations and deferred rules (their recording and resolution steps log too).
