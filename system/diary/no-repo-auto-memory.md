# No per-repo auto-memory mechanism; durable context lives in `agent/rules/`, `agent/log/`, and `CLAUDE.md`

This repo does not use an automatic per-repo memory mechanism, and one should not be reintroduced. The retired `agent/memory/` directory is gone and must not be recreated. Every piece of context meant to survive a session goes to one of exactly three places:

- **`agent/rules/`** — binding rules and conventions that govern future work, one per file.
- **`agent/log/`** — the chronological record of decisions, one line per decision.
- **`CLAUDE.md`** — the repo-level agent guide describing the artifacts themselves.

Anything that fits none of those three is not durable context and should not be written down.

**Why:** Three explicit, committed, human-readable locations beat an implicit memory store that accumulates unreviewed content and drifts out of agreement with the rules. The user rejected the auto-memory approach on 2026-06-05; this rule is promoted from that decision log entry so sessions reading only `agent/rules/` see the constraint. Note that the older log entry `2026-06-05T17-47-59Z-rules-directory.md` still mentions `agent/memory/` — that reference is stale and this rule supersedes it.

**How to apply:** When something is worth remembering, classify it: a rule for future work → a new file in `agent/rules/` plus a matching one-line entry in `agent/log/`; a decision → `agent/log/`; a fact about the agent artifacts themselves → `CLAUDE.md`. Never create `agent/memory/` or any equivalent store. See [[no-stored-recap-regenerate-on-demand]].
