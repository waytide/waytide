# Which questions does /unattended skip? — All but master, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Which questions does /unattended skip?

The options:

- **All but master** — Every question the agent would put, except that a commit on master and a push still wait for the engineer.
- **Everything** — Every question, including commits on master. A push still waits, since it reaches outside the machine.
- **Truly everything** — Every question, commits on master and pushes included.

The engineer's answer: **All but master**
