# An /unattended command carries out a request on the agent's own

- **State:** Active
- **Tags:** [idea]

**A command, `/unattended <request>`, would have the agent carry out the request on its own, deciding what it would otherwise put to the engineer.** Today the engineer says so in words, as in *Do #10 on your own, solo*, or chooses Unattended when a feature or an experiment starts.

**Not yet settled:** the command's spelling, `/unattended` or `/unatended` as first typed; which questions it skips, and whether a commit on `master` or a push still waits for the engineer; whether it starts a feature, or works where the working tree already is; and whether it presents a plan first, as unattended work in a feature does.

## Settled

- **2026-11-07** — The command is spelled `/unattended`.
- **2026-11-07** — It skips every question the agent would put, except that a commit on `master` and a push still wait for the engineer.
- **2026-11-07** — The request decides where the work is done: where it names a feature or an item to start, as a feature; otherwise where the working tree is.
- **2026-11-07** — It shows a plan first, through the selection interface, and waits for Accept.
- **2026-11-07** — It sits second in the command domain table, below `/slasher help`, and under PROCESS in the help.

## History

As the engineer first stated it: "An \"/unatended\" command that executes the request autonomously"

---

Authored by Scott Bellware on Sat Nov 7 2026 at 12:54:40 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:14:17 AM PT
Changed by Scott Bellware on Sat Nov 7 2026 at 1:17:25 AM PT
