# A command takes its subcommand first, asks when it has none, and always takes help

**Trigger:** When running or writing a Waytide slash command

**A Waytide command is typed as `/<command> [<subcommand>] [<arguments>]`.** The first word after the command's name is its subcommand, and the words after that are the subcommand's arguments. `/item list current` runs the `list` subcommand of `/item`, with `current` as its argument.

**A command typed with no subcommand asks which one is meant**, through the selection interface, unless the command's help gives the bare command a meaning of its own. A bare `/journal` writes a journal entry, and a bare `/item` asks. Where a command has more than four subcommands, the question groups them, and asks again within the group selected.

**An alias does exactly what the command it names does.** `/idea` is an alias of `/item idea`, and `/idea A coupon field on the cart page` does what `/item idea A coupon field on the cart page` does. The arguments typed after an alias pass to the command it names unchanged.

**Every root command takes `help`, which prints that command's part of the help text.** `help` is always the subcommand and never an argument. `/reserve help` prints the reserve command's help, and does not reserve the word "help".

**A subcommand that is not one of the command's own is not guessed at.** The command says that the word is not one of its subcommands, and asks which one is meant, as a bare command does.

**What the command does is not stated here.** Each subcommand runs the rule that governs its act, and that rule says what the act is. This rule says only how a command is typed and how the words typed are read.

**Why:** a skill is kept thin when it only reads the words typed and hands the act to the rule that governs it. Reading the words the same way in every command means an engineer learns the shape once. Fixing `help` as a subcommand settles the one word every command shares, so no command's arguments can take it.

**How to apply:** read the first word after a command's name as its subcommand, and the rest as its arguments. With no subcommand, ask through the selection interface, unless the bare command has a meaning of its own. Run an alias as the command it names, passing its arguments unchanged. Read `help` as the subcommand wherever it is typed first. Ask, rather than guess, when a subcommand is not the command's own.

## Compressed

1. A Waytide command is typed `/<command> [<subcommand>] [<arguments>]`. The first word after the name is the subcommand, and the rest are its arguments, as in `/item list current`. Every command reads its words this way.
2. With no subcommand, the command asks which one is meant, through the selection interface, unless its help gives the bare command a meaning of its own, as a bare `/journal` writes an entry.
3. Where a command has more than four subcommands, the question groups them, and asks again within the group selected.
4. An alias does exactly what the command it names does, as `/idea` does `/item idea`. Its arguments pass to that command unchanged.
5. Every root command takes `help`, which prints that command's part of the help text.
6. `help` is always the subcommand, never an argument. `/reserve help` prints help, and does not reserve the word "help".
7. A subcommand that is not the command's own is not guessed at. The command says so, and asks which one is meant, through the selection interface.
8. A command's skill only reads the words typed, and hands the act to the rule that governs it. That rule says what the act is. This rule does not, and governs only how a command is typed and how its words are read.

## Compression

- 2026-11-02, compressed: checked: 20 directives, 16 kept, 3 less precise, 1 lost, 4 repairs; re-checked: 20 directives, 20 kept, 0 less precise, 0 lost

Related:

- the present-every-prompt-to-the-engineer-through-the-selection-ui rule — the question a bare command asks

---

Authored by Scott Bellware on Mon Nov 2 2026 at 6:27:47 PM PT
