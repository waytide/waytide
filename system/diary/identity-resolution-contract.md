# The writer's identity is resolved through a fixed cross-tool contract: an override chain ending at one shared, platform-resolved global file

This is the binding contract every one of the writer's tools follows to determine **who is writing now**. Each tool names its own variable at the first level, and the diary's is `DIARY_WRITER`. The two levels below it are common to all of them. An identity set once on a machine then resolves the same person in each. What this rule fixes is the chain rather than any one tool's variable, so a tool built independently of this one agrees with it.

## What identity is

**A writer has a username, and may have a display name.** The username is a filesystem-safe id, such as `scott-bellware`, and it is the primary key. The display name, such as `Scott Bellware`, is presentation. It is optional, and a writer with none shows as their username, verbatim.

A display name is never computed from a username. The capitalization and the word boundaries are not recoverable, as `o-brien`, `van-der-berg`, and `mcdonald` each show. So the fallback is the username itself rather than a prettified form of it. Identity never comes from git.

## Resolution order (first match wins)

1. **`DIARY_WRITER` environment variable** — ephemeral/per-process override (CI, one-offs like `DIARY_WRITER=jane-doe <cmd>`).
2. **Project-local `.current-user`** — a gitignored file in the project root. It overrides the global default for this one checkout, and is rarely needed.
3. **Global shared identity file** — the normal case. It is set once per machine and read by *all* the writer's tools, one shared file rather than one per tool.
4. **Error** — if none resolve, fail loudly (e.g. "no identity configured; set ~/.config/identity/user or DIARY_WRITER"). Never guess.

## Global file location (platform-resolved)

The tail is always `identity/user`; only the base directory varies:

- If `$XDG_CONFIG_HOME` is set → `$XDG_CONFIG_HOME/identity/user` (forces one location on any OS).
- Else by platform:
  - **Linux** → `~/.config/identity/user`
  - **macOS** → `~/.config/identity/user` (CLI convention; keeps Linux + macOS identical — chosen over `~/Library/Application Support`)
  - **Windows** → `%APPDATA%\identity\user`

Tools agree on this **resolution rule**, not a raw path string. `identity` is the shared namespace because the file holds identity, reusable beyond logging.

## File format (both the global file and the project-local `.current-user`)

The username only, on one line. Trim surrounding whitespace and a trailing newline on read, and allow `#` comment lines. One reader handles both files. The file carries no display name or other data — that would duplicate `writers.toml` and risk drift.

## Per-project registry

Each project is its own space of writers, and commits a `writers.toml`, in TOML, giving each writer's display name. It lives at `waytide/local/diary/writers.toml`, beside the per-writer directories the diary is kept in.

**It is a lookup rather than a gate.** The resolution chain *selects* a username, and `writers.toml` supplies a display name for it where it holds one. It refuses nothing. A username absent from the file is ordinary, and that writer shows as their username.

**The file is optional.** A project without one works, and every writer in it shows as their username. A writer adds themselves once, as a committed, shared fact, where they want a display name.

**The shape is one TOML table per username.** The table header is the username, so TOML itself refuses a duplicate. That is the only check the file gets, now that nothing validates.

```toml
# The writers who want a display name. A writer absent from
# this file shows as their username.

[scott-bellware]
display-name = "Scott Bellware"

[jane-doe]
display-name = "Jane Doe"
```

**A writer's table carries that writer's own settings** in any further key. The contract reads `display-name` and ignores the rest, so a tool keeps its own settings there without a change to this rule.

**What this costs is stated plainly.** Nothing refuses an unknown username, so a mistyped `DIARY_WRITER` resolves to a writer who does not exist. A diary directory is then created for them rather than refused. The chain's fourth level still fails loudly where no username resolves at all, and that is a different failure.

**Why:** the writer runs many tools across many projects and is always the same person. So identity belongs at the machine level, set once, with project-level and process-level overrides for the exceptions. A logical path contract rather than a literal one keeps the single shared file working on Linux, macOS, and Windows.

**How to apply:** when implementing identity in any of the writer's tools, resolve the active username through the chain above. Take the display name from the project's `writers.toml` where it holds one for that username, and fall back to the username itself where it does not. Never read git for identity. Never invent a username, and never compute a display name from one. Fail loudly where no username resolves.

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:49:47 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:56:08 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:56:57 AM PT
