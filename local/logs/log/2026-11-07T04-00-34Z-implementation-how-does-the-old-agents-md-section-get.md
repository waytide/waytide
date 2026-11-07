# Implementation: how does the old AGENTS.md section get replaced? The test fails now, since the installer leaves the old section in place. — Direct, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Implementation: how does the old AGENTS.md section get replaced? The test fails now, since the installer leaves the old section in place.

The options:

- **Direct** — At the start of place_agents_md: where AGENTS.md names waytide/system/ under a "## Waytide" heading, keep the text above the heading and replace everything from it to the end with the new section. That's the same span the refresh compares.
- **Red, green, refactor** — First write an implementation that lets the test fail and run it, then make it pass, then refactor.

The engineer's answer: **Direct**
