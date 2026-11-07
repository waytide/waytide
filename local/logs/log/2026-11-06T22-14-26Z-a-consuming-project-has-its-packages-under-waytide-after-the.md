# A consuming project has its packages under waytide/. After the rename, what do the installer and the scripts do with a project that still has waytide/ and no slasher/? — Move it, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> A consuming project has its packages under waytide/. After the rename, what do the installer and the scripts do with a project that still has waytide/ and no slasher/?

The options:

- **Move it** — The installer, or a refresh, moves waytide/ to slasher/ in that project and regenerates its AGENTS.md. The scripts read only slasher/.
- **Read both** — The scripts read slasher/ where it exists, and waytide/ where it does not. Nothing is moved until the project moves it.
- **Read only slasher/** — The scripts read only slasher/. A project still on waytide/ stops loading until it is moved by hand.

The engineer's answer: **Move it**
