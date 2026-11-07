# Implementation: how does the installer come to move the machine folders? Either way, the five other installer tests also run with a temporary HOME, so the suite never moves your real folders. — Direct, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Implementation: how does the installer come to move the machine folders? Either way, the five other installer tests also run with a temporary HOME, so the suite never moves your real folders.

The options:

- **Direct** — Write it now, called right after the project-folder move. It honors the XDG settings, falls back to HOME, and touches nothing where both names exist.
- **Red, green, refactor** — First write an implementation that lets the test fail and run it, then make it pass, then refactor.

The engineer's answer: **Direct**
