# Does Slasher start honoring the XDG folder settings as part of this rename? — Yes, everywhere, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Does Slasher start honoring the XDG folder settings as part of this rename?

The options:

- **Not now** — Keep $HOME/.config and $HOME/.local/share. The installer test fakes HOME.
- **Yes, everywhere** — Every script and rule that reads these folders honors XDG_CONFIG_HOME and XDG_DATA_HOME, falling back to the defaults. The feature widens to cover it.

The engineer's answer: **Yes, everywhere**
