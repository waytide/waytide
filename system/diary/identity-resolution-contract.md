# Active-user identity is resolved through a fixed cross-tool contract: an override chain ending at one shared, platform-resolved global file

This is the binding contract every logging tool (across all the user's repos and applications) follows to determine **who is logging right now**. It is a forward-looking architecture rule for the planned multi-user generalization ([[multiuser-means-many-users-one-repo]]); record-keeping here freezes the contract so independently built tools agree.

## What identity is

A user has a **slug** (filesystem-safe id, e.g. `scott-bellware`) and a **display name** (e.g. `Scott Bellware`). The slug is the primary key; the display name is presentation. Neither is derived from the other at runtime — both are stored explicitly. Identity never comes from git ([[per-user-logs-under-slug-directory]]).

## Resolution order (first match wins)

1. **`LOG_USER` environment variable** — ephemeral/per-process override (CI, one-offs like `LOG_USER=jane-doe <cmd>`).
2. **Repo-local `.current-user`** — gitignored file in the repo root; overrides the global default for this one checkout. Rarely needed.
3. **Global shared identity file** — the normal case; set once per machine, read by *all* the user's logging tools (one shared file, not one per tool).
4. **Error** — if none resolve, fail loudly (e.g. "no identity configured; set ~/.config/identity/user or LOG_USER"). Never guess.

## Global file location (platform-resolved)

The tail is always `identity/user`; only the base directory varies:

- If `$XDG_CONFIG_HOME` is set → `$XDG_CONFIG_HOME/identity/user` (forces one location on any OS).
- Else by platform:
  - **Linux** → `~/.config/identity/user`
  - **macOS** → `~/.config/identity/user` (CLI convention; keeps Linux + macOS identical — chosen over `~/Library/Application Support`)
  - **Windows** → `%APPDATA%\identity\user`

Tools agree on this **resolution rule**, not a raw path string. `identity` is the shared namespace because the file holds identity, reusable beyond logging.

## File format (both the global file and repo-local `.current-user`)

The slug only, on one line. Trim surrounding whitespace and a trailing newline on read; allow `#` comment lines. One reader handles both files. The file carries no display name or other data — that would duplicate the registry and risk drift.

## Per-repo registry

Each repo is its own multi-user space and commits a `registry.json` mapping slug → display name (and any per-user settings). The resolution chain *selects* a slug; the repo's `registry.json` *validates* it and supplies the display name. Joining a new repo means adding yourself to that repo's `registry.json` once (a committed, shared fact).

**Why:** The user will run many logging tools across many repos but is always the same person; identity therefore belongs at the user/machine level, set once, with repo- and process-level overrides for exceptions. A logical (not literal) path contract keeps the single shared file working across Linux/macOS/Windows.

**How to apply:** When implementing identity in any logging tool, resolve the active slug via the chain above, validate it against the repo's `registry.json`, and use `registry.json` for the display name. Never read git for identity; never invent a default; fail loudly when unresolved.
