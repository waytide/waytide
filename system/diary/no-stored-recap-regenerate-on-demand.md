# Don't store a work-recap file; regenerate recaps on demand from git history and `agent/log/`

There is no stored "where we left off" / work-recap artifact in this repo, and none should be created. When the user asks what was done recently, or a session needs to re-establish where work stands, derive the recap on the spot from git history (`git log`) and the decision log in `agent/log/`. Do not write the result to a file.

**Why:** A stored recap is a second copy of facts that git and `agent/log/` already hold, and it goes stale the moment it isn't updated. The two live sources are already committed, ordered, and trustworthy; a derived summary adds drift without adding information. Decided 2026-06-05; promoted here from the decision log so it is visible to sessions that read only `agent/rules/`.

**How to apply:** Answer "what have we been doing" by reading `git log` and `agent/log/` and summarizing in the response. Never persist that summary — not as a memory file, not as a `RECAP.md`, not in `agent/`. See [[no-repo-auto-memory]] for where durable context does belong.
