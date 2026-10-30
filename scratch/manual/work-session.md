# Work-session — manual page

```
WORK-SESSION(1)                Waytide Manual                WORK-SESSION(1)

NAME
     work-session - write the narrative of a stretch of work

SYNOPSIS
     /work-session new | append
     /work-session help

DESCRIPTION
     A work session record is the readable account of a stretch of work:
     what was asked and concluded at each step, in order, with the terms
     settled along the way. It points to the rules, items, log entries,
     and implementation records the work produced, which remain the
     source of truth.

     After the record is written, the engineer is asked whether the work
     changed the project's settled direction: update it, it stands, or
     nothing bears on it.

SUBCOMMANDS
     new             Write a new work session record.
     append          Add to the previous work session record.

FILES
     local/logs/work-sessions/<UTC timestamp>-<name>.md

SEE ALSO
     /log, /item
```
