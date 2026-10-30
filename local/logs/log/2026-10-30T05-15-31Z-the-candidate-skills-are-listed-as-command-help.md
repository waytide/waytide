# The candidate skills are listed as command help, for the slash-commands phase of the skills feature

The commands are candidates from the Waytide skills item. None is built.

```
Usage: /<command> [<subcommand>] [<arguments>]
       A command typed with no subcommand asks which one is meant.

ITEMS
  /item new | idea | mistake | problem | work
  /item list <state>              <state>: any item state, or "current"
                                  (Open, Active, and Suspended)
  /item start | realize | done | defer | suspend | supersede | abandon
        | lapse | reopen          done for [work] items; lapse not for them
  /work-item                      Same as /item work
  /list <state>                   Same as /item list <state>

OBSERVATIONS
  /observation new | record       /observe is the same as /observation new
  /observation promote            Promote an observation to a rule

EXPERIMENTS
  /experiment new | new with phases | status | affirm | refute
        | inconclusive | suspend | resume | supersede | abandon

FEATURES
  /feature new | status | complete | suspend | resume | supersede | abandon

JOURNAL
  /journal new | entry | private | read private | timeline | move

LOG
  /log                            Write a log entry
  /log summary                    Summarize the log

COLLECTING
  /collect begin | end | resume   /sketch is the same as /collect

PACKAGES
  /package activate <package> | deactivate <package>
        | refresh [<package>...] | install | projects

REPORTS
  /status-report | /test-report | /test-tree

LANGUAGE
  /reserve <word> | /ete | /expand

PROCEDURES
  /work-session new | append
  /release
  /publish [<package>...]         This repository only
```
