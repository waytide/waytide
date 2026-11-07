# Does the test run the installer with both XDG settings pointing into a temporary pretend home? — Both XDG settings, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Does the test run the installer with both XDG settings pointing into a temporary pretend home?

The options:

- **Both XDG settings** — The test sets XDG_CONFIG_HOME and XDG_DATA_HOME, and the installer moves the old folders it finds there.
- **Not that** — Say what the run should be instead.

The engineer's answer: **Both XDG settings**
