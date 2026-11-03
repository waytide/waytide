# Test — manual page

```
TEST(1)                        Waytide Manual                        TEST(1)

NAME
     test - run the project's tests, and report on them

SYNOPSIS
     /test
     /test interactive [<test>]
     /test report
     /test tree
     /test help

     /test-report, /test-tree

DESCRIPTION
     A project's tests sit under test/automated/, test/interactive/, or
     both. Automated tests are run and judged by a machine, and they are
     the suite that must pass before a commit. Interactive tests need a
     person in the run, and run only when the engineer asks.

     How the suite is run is the project's own concern: /test runs
     whatever command the project's language and test framework use.

     A report of a run says which tests ran. Where interactive tests
     exist and were not run, it says so.

SUBCOMMANDS
     (none)          Run the automated suite.
     interactive     Run an interactive test, or ask which one.
     report          Classify the suite: its styles, subjects, structure,
                     and assertion kinds, read from the test files.
                     (/test-report)
     tree            Run the suite and print its whole context tree once,
                     with repeated headings merged.  (/test-tree)

EXAMPLES
     /test
     /test interactive payment-declined

FILES
     test/automated/
     test/interactive/

SEE ALSO
     /status-report
```
