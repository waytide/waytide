# Feature — An /unattended command carries out a request on the agent's own

**Tags:** [feature]

## Intent

**As the engineer stated it:** "Srtart #11", where #11 is the item `2026-11-07T08-54-40Z-an-unattended-command-carries-out-a-request-on-the-agents-own`, and starting it means starting a feature.

**A command, `/unattended <request>`, has the agent carry out the request on its own, deciding what it would otherwise put to the engineer.** The item is the source of truth for what is settled.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/unattended-command`
- **Base:** BASE, from `master`
- **Working location:** branch and worktree, chosen at the start. The worktree is `../slasher-feature-worktree-unattended-command`, and the main working tree stays on `master`.
- **Participation:** attended, chosen at the start.
- **Verdict:** it concludes without an engineer's verdict, selected at the start.

## Confirmations

- **2026-11-07** — The working location is branch and worktree, selected by the engineer at the start.
- **2026-11-07** — The feature concludes without an engineer's verdict, selected by the engineer at the start.
- **2026-11-07** — Participation: Attended, selected by the engineer. Agent's confidence 45%, risk of redo 55%, It'll work 80%, Your approval 45%. The warning was shown, and Attended was recommended.

---

Authored by Scott Bellware on Sat Nov 7 2026 at 1:14:17 AM PT
