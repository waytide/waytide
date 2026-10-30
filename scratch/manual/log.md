# Log — manual page

```
LOG(1)                         Waytide Manual                         LOG(1)

NAME
     log - record a decision, one file per entry

SYNOPSIS
     /log
     /log summary
     /log help

DESCRIPTION
     The log is the project's record of what was decided and when. Each
     entry is one file in local/logs/log/, with a one-line title stating
     the decision. Most entries are the title alone. An entry takes a
     body only where its reasoning will not fit the title, such as the
     reason work was stopped.

     An entry recording a decision the engineer made is tagged
     [decision]. The log is never consolidated or rewritten, and it never
     says that something was done when it was not.

     Log entries are committed with the change they describe.

SUBCOMMANDS
     (none)          Write a log entry.
     summary         Summarize the log, in the response. The summary is
                     never written to a file.

EXAMPLES
     /log The cart keeps its contents for 30 days

FILES
     local/logs/log/<UTC timestamp>-<name>.md

SEE ALSO
     /log-this, /work-session, /item
```
