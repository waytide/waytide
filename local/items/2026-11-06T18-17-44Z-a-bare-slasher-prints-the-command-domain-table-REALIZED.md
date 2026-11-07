# A bare `/slasher` prints the command domain table

- **State:** Realized
- **Tags:** [idea]

**`/slasher` typed with nothing after it would print the command domain table.** That is the table of one row per command domain, each naming its first root command and its description, which prints when the rules load. Today a bare `/slasher` prints nothing, and `/slasher help` prints the full help.

**Not yet settled:** whether the table is printed from the rule that holds it or from the help, and whether anything is printed with it.

**Settled 2026-11-06:** the table is printed from the rule that holds it, the the-command-domain-table-prints-when-the-rules-have-loaded rule, and nothing is printed with it. The engineer directed the change: "A bare "/slasher" command prints the command table that prints at startup".

## History

As the engineer first stated it: "A bare "/shasher" prints the table of command domains"

---

Authored by Scott Bellware on Fri Nov 6 2026 at 10:17:44 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:36:16 PM PT
