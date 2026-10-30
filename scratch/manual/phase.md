# Phase — manual page

```
PHASE(1)                       Waytide Manual                       PHASE(1)

NAME
     phase - run a feature or an experiment in steps, one at a time

SYNOPSIS
     /phase, /phase current
     /phases
     /phase add <name>
     /phase start
     /phase complete | affirm | refute | inconclusive
     /phase help

DESCRIPTION
     A feature or an experiment may be split into phases. Each phase has
     a question or an intent of its own that serves the whole, and runs
     on a branch of its own. Phases run one at a time, in the order the
     record names them.

     A phase branches from its implementation's branch, and merges back
     into that branch when it concludes. It never merges anywhere else.
     The implementation merges to master only after its last phase.

     Whether a phase reaches a verdict is chosen for each phase, when it
     is added.

SUBCOMMANDS
     (none), current The current phase, its goal, and its branch.
     add <name>      Add a phase after the last.
     start           Start the next phase: create its branch, state its
                     goal, and list the phases with the current one marked.
     complete        Conclude a phase that reaches no verdict, and merge it.
     affirm          Conclude a phase as Affirmed (the engineer's
                     declaration only), and merge it.
     refute          Conclude a phase as Refuted: its proposition is not
                     realized.
     inconclusive    Conclude a phase as Inconclusive.

EXAMPLES
     A checkout feature in three phases:

         feature/checkout                      the feature
         feature/checkout.cart                 phase 1
         feature/checkout.payment              phase 2
         feature/checkout.receipt              phase 3

     /phase add receipt
     /phase start

     /phases lists the phases in order, the current one emphasized.

SEE ALSO
     /phases, /feature, /experiment
```
