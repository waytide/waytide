# Status-report — manual page

```
STATUS-REPORT(1)               Waytide Manual               STATUS-REPORT(1)

NAME
     status-report - print a fixed report of where the whole project stands

SYNOPSIS
     /status-report
     /status-report help

DESCRIPTION
     Prints five parts, in order, read from the project's files as they
     are now:

     1. Task table      The tasks the planning items carry, with the
                        next one marked.
     2. Waiting work    Items that wait on something else to finish.
     3. Orientation     A map of the waytide/ directory and how to work
                        with it.
     4. Recent work     A few lines on the recent direction, from the log
                        and the commits.
     5. Test suite      A run of the suite, with its count, its result,
                        and its context tree two levels deep.

     A suspended record is counted rather than listed, as in
     "3 suspended items". Ask for it to see it.

SEE ALSO
     /item, /test
```
