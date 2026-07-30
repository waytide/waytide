# Feature — work-sessions rename

**Intent:** rename `local/sessions/` to `local/work-sessions/`, so the directory is named
for what a session *is* in this system — a work session — rather than for the bare word
`session`, which names an interval of anything. The convention rule already opens by
defining its contents as "the narrative record of a work session"; the directory name does
not carry that. Resolves the deferred item
`2026-07-28T00-42-29Z-the-sessions-directory-is-named-work-session.md`.

## Setup

- **Upstream branch:** `master`
- **Feature branch:** `feature/work-sessions-rename`
- **Base:** `0001f32f7a039078fd525ebf97a6a8dc1d1fb5a5` (`master`)
- **Working location:** branch only — this working tree is switched to
  `feature/work-sessions-rename` and switches back to `master` at the conclusion.
- **Loop record:** `local/loops/2026-07-30T17-29-31Z-work-sessions-rename.md`

No `**State:**` line is carried while the feature is in flight; one is written when it
concludes. The session-start notice reports it as open until then.

## The plural is settled

The deferred item proposed the **singular** `work-session/` and explicitly left the
singular-versus-plural question open, naming it the thing the resolution had to settle
first. The instruction that initiated this feature named `work-sessions/` — the plural —
which settles it: the directory takes the plural, in line with every sibling (`log/`,
`deferred/`, `design/`, `plans/`, `experiments/`, `features/`).

## Scope

Beyond moving the directory and its four records, the rename reaches:

- `system/foundation/agent-sessions-convention.md` — its title line, its opening
  definition, and its own filename, which carries `sessions`.
- `system/foundation/agent-rules-convention.md`
- `system/foundation/README.md`
- `system/foundation/install.sh`
- this repository's `AGENTS.md`

Whether anything migrates the directory in a project that has already installed Waytide —
a rule change does not reach it — was open at initiation and is settled below.

## Confirmations

- **Working location, at initiation** — put through the selection UI on
  Thu Jul 30 2026 at 9:58:10 AM PT; **branch only** was chosen.
- **The convention rule's filename follows the directory** — put through the selection UI
  on Thu Jul 30 2026 at 10:20:00 AM PT; **rename the file** was chosen.
- **An installed project's directory** — put through the selection UI on
  Thu Jul 30 2026 at 10:20:00 AM PT; **`install.sh` renames it** was chosen.

---

Authored by Scott Bellware on Thu Jul 30 2026 at 9:58:10 AM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:31:04 AM PT
