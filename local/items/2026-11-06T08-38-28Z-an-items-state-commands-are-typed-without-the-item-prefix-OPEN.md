# An item's state commands are typed without the /item prefix

- **State:** Open
- **Tags:** [idea]

**The `/item` subcommands that change an item's state would become root commands of their own.** `/item start` would be typed `/start`, and likewise `/realize`, `/done`, `/defer`, `/suspend`, `/supersede`, `/abandon`, `/obsolete`, and `/reopen`. Each would take the item it acts on, as its `/item` form does.

**Not yet settled:**

- whether the `/item` forms stay, as the commands the new ones are aliases of
- that `/suspend`, `/supersede`, and `/abandon` also name states of a feature or an experiment, whose own commands are `/feature suspend` and the like, so a bare `/suspend` could be read as acting on either
- whether any of these names is claimed by a command of Claude Code's own, so that only `/slasher:<name>` would reach it

## Settled

- **2026-11-06** — The bare forms are aliases. `/item start` and the other `/item` state subcommands stay, and `/start`, `/realize`, and the rest are aliases of them, doing exactly what they do.

## History

As the engineer first stated it: "Idea: REmove the /item prefix from item subcommands that control state"

Then: "Actually, they should be aliases"

---

Authored by Scott Bellware on Fri Nov 6 2026 at 12:38:28 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 12:39:18 AM PT
