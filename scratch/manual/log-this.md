# Log-this — manual page

```
LOG-THIS(1)                    Waytide Manual                    LOG-THIS(1)

NAME
     log-this - write a log entry for the current work

SYNOPSIS
     /log-this
     /log-this help

DESCRIPTION
     Writes a log entry for the work the conversation is on, without the
     engineer stating it. The agent states the decision or the finding in
     the entry's title, and adds a body where the reasoning will not fit.

     The entry follows the same conventions as one written with /log.

EXAMPLES
     After settling that a receipt is emailed as well as shown:

     /log-this

FILES
     local/logs/log/<UTC timestamp>-<name>.md

SEE ALSO
     /log
```
