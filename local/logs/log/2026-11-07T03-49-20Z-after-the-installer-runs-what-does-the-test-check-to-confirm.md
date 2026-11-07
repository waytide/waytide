# After the installer runs, what does the test check to confirm waytide/ was moved to slasher/? — Arrived and gone, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> After the installer runs, what does the test check to confirm waytide/ was moved to slasher/?

The options:

- **Arrived and gone** — The record is inside slasher/, and the waytide/ folder no longer exists.
- **Arrived only** — The record is inside slasher/. A copy that left waytide/ behind would also pass.
- **Same text** — The record inside slasher/ has the same contents as the one put in. It doesn't check that waytide/ is gone.

The engineer's answer: **Arrived and gone**
