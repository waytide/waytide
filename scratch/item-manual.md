# Item — manual page

```
ITEM(1)                        Waytide Manual                        ITEM(1)

NAME
     item - record the project's thinking about what the work should be

SYNOPSIS
     /item [subcommand] [arguments]
     /idea | /observation | /mistake | /problem | /work

DESCRIPTION
     An item is one file in local/items/ holding a piece of the project's
     thinking: an idea, a design, a plan, an observation, or a piece of
     work to be done. Items are where direction is settled before it is
     built, and they are kept after it is.

     Each item has a title, a state, and one or more tags. The tags say
     what kind of item it is. The state says where it stands.

     An item is never rewritten. It grows by dated additions, so it reads
     as the history of how the thinking moved.

KINDS
     [idea]          The default, for an item with no other tag.
     [observation]   A working hypothesis, not yet binding. Its state is
                     always Recorded, and it may be promoted to a rule.
     [work]          A piece of work to be done. It ends Done.
     [design], [plan], [aspiration]
                     Common kinds. The set is open.

STATES
     Open            The work has not started.
     Active          The work is in progress.
     Realized        What the item describes exists.
     Done            A piece of work is finished ([work] only).
     Deferred        Kept, with nobody working toward it.
     Suspended       Paused.
     Superseded      Replaced by another item, which it names.
     Abandoned       Dropped by decision.
     Lapsed          Left behind as the work moved on.
     Recorded        An observation's only state.

FILES
     local/items/<UTC timestamp>-<name>-<STATE>.md
             The state ends the file name in upper case, so a directory
             listing shows where each item stands.

SEE ALSO
     /item help, /log, /experiment, /feature
```
