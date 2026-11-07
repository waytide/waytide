# The writer-name rule already reads $XDG_CONFIG_HOME/waytide/user when that setting is set. With XDG support removed from the installer, what happens to that part of the rule? — Drop it, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> The writer-name rule already reads $XDG_CONFIG_HOME/waytide/user when that setting is set. With XDG support removed from the installer, what happens to that part of the rule?

The options:

- **Drop it** — In the prose step, the rule reads only ~/.config/slasher/user (and %APPDATA% on Windows). Nothing in Slasher reads the XDG settings.
- **Keep it** — The rule keeps reading $XDG_CONFIG_HOME/slasher/user when it's set. The installer doesn't move that folder, so a machine with the setting moves it by hand.

The engineer's answer: **Drop it**
