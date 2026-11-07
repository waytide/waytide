# Implementation: how does the move come about in install.sh? It runs first, before the installer adds packages or places AGENTS.md. — Direct, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Implementation: how does the move come about in install.sh? It runs first, before the installer adds packages or places AGENTS.md.

The options:

- **Direct** — Write the working implementation now. Like the installer's other moves, it touches nothing where both folders exist, and it uses plain mv.
- **Red, green, refactor** — First write an implementation that lets the test fail and run it, then make it pass, then refactor.

The engineer's answer: **Direct**
