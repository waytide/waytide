# When both folders exist, where does the test check that the installer left them alone? — ~/.config only, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> When both folders exist, where does the test check that the installer left them alone?

The options:

- **~/.config only** — In ~/.config: the waytide file is still in waytide/, the slasher file is still in slasher/, and the waytide file wasn't copied into slasher/.
- **Both places** — The same three checks in ~/.config and again in ~/.local/share.

The engineer's answer: **~/.config only**
