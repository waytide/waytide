# When a project has both folders, what does the test check to confirm the installer left them alone? — Both untouched, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> When a project has both folders, what does the test check to confirm the installer left them alone?

The options:

- **Both untouched** — Each record is still in its own folder, and the waytide/ record wasn't copied into slasher/.
- **Old one kept** — Only that the waytide/ record is still in waytide/.

The engineer's answer: **Both untouched**
