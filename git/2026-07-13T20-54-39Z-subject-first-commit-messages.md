# Write subject-first commit messages

Commit messages are **subject-first**: the subject of the change leads, described in **passive voice** and **indicative mood** — the message states *what changed about the code*, not what the developer did. We write about the code, not the developer; centering the developer reinforces anthropocentrism in the mindset.

Commit logs are **scanned, not read**, so the most important thing — the subject of the change — comes first. Describe the change as a fact about the code's new state, not as an imperative instruction to the reader.

- **Passive voice, indicative mood — not imperative.** "Widget reconciliation is corrected", **not** "Fix widget reconciliation". "The resolved constant is bound before comparison", not "Bind the resolved constant".
- **Omit the verb when introducing a new item.** "Widget tests", not "Widget tests are added".
- **"is corrected", not "is fixed"** — for a defect. "Widget reconciliation is corrected".
- **"is clarified"** — for a refactor / readability change. "Widget creation is clarified".
- **Rename form:** "Widget, rather than sprocket".
- **Version bump form:** "Package version is increased from 1.1.1 to 1.2.0".
- **No 50-character subject rule** — make the first line as long as it needs to be to state the subject clearly.

**Why:** the technique matches how humans consume a log — scanning, not careful reading — so leading with the subject (the changed thing) rather than a verb-first action lowers the cognitive load of reviewing history. It is the Eventide house style, and it fits this project's human-centered ethos: the reader's orientation comes first. It also composes with the existing commit-wording rule — "Task 9 is done" (state the fact) is already subject-first indicative.

**How to apply:** decide the subject of the commit first, then write the first line as a passive, indicative statement of what changed, subject leading. Use "is corrected" / "is clarified", omit the verb for new items, and let the line run as long as it needs to. Do not write imperative-mood, verb-first subjects ("Fix…", "Add…", "Introduce…", "Return…"). Related: the commit-says-task-is-done-not-mark-done rule (`agent/rules/git/2026-06-29T18-55-35Z-commit-says-task-is-done-not-mark-done.md`), the no-Claude-coauthor rule, and the run-suite-before-commit rule — all in `agent/rules/git/`, where the other commit conventions live.
