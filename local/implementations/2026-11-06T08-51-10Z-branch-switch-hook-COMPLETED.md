# Feature — Branch-switch hook

**Tags:** [feature]

## Intent

**As the engineer stated it:** "The branch switching rule isn't activating", and the block should be automatic.

**A hook in the Slasher plugin detects every branch switch and tells the agent to print the branch-switch block at once.** The hook runs after each shell command and compares the branch with the one it last saw. A hook cannot know why the switch was made, so the agent still prints the block, with the reason. The announce-a-branch-switch-in-a-bordered-block rule changes to say what prompts the block.

## State

- **State:** Completed

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** none. The feature is built on `master`.
- **Base:** `e680c211`, on `master`
- **Working location:** the current branch, chosen at the start.
- **Participation:** attended at the start, then unattended from the actuation hinge on, at the engineer's instruction.
- **Verdict:** none. The feature concludes Completed when the hook is built and in place.

## The work

- `system/git/branch-switch.sh` records the branch before each shell command and compares it after. Where the branch changed, it tells the agent, as additional context, to print the block now with the two branches and the reason. It keeps one record for each tool use under `TMPDIR`, and it never stops a command.
- The plugin runs it through `hooks/branch-switch`, a wrapper in foundation's `plugin/`, on `PreToolUse` and `PostToolUse` for the shell tool. The wrapper does nothing where the git package is not installed or is deactivated, and runs the script in the directory the command ran in.
- The announce-a-branch-switch-in-a-bordered-block rule says the hook reports the switch, the agent prints the block at once and fills the reason, and a switch the hook does not report still takes the block. The plugin rule names the hook among the plugin's hooks. The git README says so.
- Two tests: `test/automated/branch-switch.sh`, where the command switched the branch, and `test/automated/branch-switch-unchanged.sh`, where it did not. The second passed before any code was written for it, so it is coverage. The engineer kept it.

## Confirmations

- **2026-11-06** — The design is that the hook tells the agent to print the block, selected by the engineer over the hook printing the block itself.
- **2026-11-06** — The working location is the current branch, `master`, selected by the engineer at the start.
- **2026-11-06** — The participation is attended, selected by the engineer at the start.
- **2026-11-06** — The feature reaches no verdict, selected by the engineer at the start.
- **2026-11-06** — The work proceeds unattended from the first actuation hinge on, at the engineer's instruction: "Proceed unattended from here".
- **2026-11-06** — The coverage test, `test/automated/branch-switch-unchanged.sh`, is kept, selected by the engineer.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 12:51:10 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:54:42 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:22:55 AM PT
