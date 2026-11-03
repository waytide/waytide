# Observation — manual page

```
OBSERVATION(1)                 Waytide Manual                 OBSERVATION(1)

NAME
     observation - record a working hypothesis, and promote it to a rule

SYNOPSIS
     /observation [new]
     /observation promote
     /observation help

     /item observation, /observe

DESCRIPTION
     An observation is an item that holds thinking not yet ready to bind
     the project: a hypothesis, a definition, or a method still under
     discovery. It is read when someone looks for it, not at the start of
     every session the way a rule is.

     An observation has one state, Recorded, and it never changes. When
     the thinking moves, a later observation says so, and the earlier one
     stays as what was thought at the time.

SUBCOMMANDS
     new             Record an observation. A bare /observation does this.
     promote         Write a rule from a settled observation. The rule
                     names the observation, and the observation gains a
                     line naming the rule. Nothing else in it changes.

EXAMPLES
     /observation Most abandoned carts are left at the shipping step

FILES
     local/items/<UTC timestamp>-<name>-RECORDED.md
     local/rules/<UTC timestamp>-<name>.md     (a promoted rule)

SEE ALSO
     /item, /freewrite
```
