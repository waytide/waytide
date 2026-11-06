# Feature — Process question log

**Tags:** [feature]

## Intent

**As the engineer stated it:** Every time that a process question is put to the user with AskUserQuestion, it should be logged, along with the user's answer.

**Each process question put through the selection interface is logged, with the engineer's answer, by a hook.** The agent marks a process question by setting the selection's `metadata.source` to `decision`. A `PostToolUse` hook on `AskUserQuestion` writes a log entry for each marked question, and ignores the rest. A mechanical question, such as whether to commit or push, is the opposite of a process question. It carries no marker and is not logged.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/process-question-log`
- **Base:** `47291ea`, from `master`
- **Working location:** branch and worktree, chosen at the start. The worktree is `../waytide-feature-worktree-process-question-log`, and the main working tree stays on `master`.
- **Participation:** unattended, chosen at the start.
- **Verdict:** it concludes without an engineer's verdict, selected at the start.

## Confirmations

- **2026-11-06** — The working location is branch and worktree, selected by the engineer at the start.
- **2026-11-06** — The feature concludes without an engineer's verdict, selected by the engineer at the start.
- **2026-11-06** — Participation: Unattended, selected by the engineer. Agent's confidence 70%, risk of redo 30%, It'll work 85%, Your approval 75%. The warning was shown, and Attended was recommended.
- **2026-11-06** — The marker is `metadata.source` set to `decision`, selected by the engineer. A mechanical question is the opposite of a process question, as the engineer stated.
- **2026-11-06** — The plan is accepted, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 2:13:43 AM PT
