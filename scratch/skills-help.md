# Waytide skills — help

```
WAYTIDE SKILLS

Usage: /<command> [<subcommand>] [<arguments>]
       A command typed with no subcommand asks which one is meant,
       except where a bare command has its own meaning, shown below.

ITEMS
  /item new                        Create an item (tagged [idea] if untagged)
  /item idea, /idea                Create an item tagged [idea]
  /item observation, /observation, /observe
                                   Create an observation (Recorded)
  /observation promote             Promote an observation to a rule
  /item mistake, /mistake          Create an item tagged [mistake]
  /item problem, /problem          Create an item tagged [problem]
  /item work, /work, /work-item    Create an item tagged [work]
  /item list <state>, /list <state>
                                   List items in a state
                                   <state>: any item state, or "current"
                                   (Open, Active, and Suspended)
  /item start                      Open -> Active
  /item realize                    -> Realized
  /item done                       -> Done ([work] items only)
  /item defer                      -> Deferred
  /item suspend                    -> Suspended
  /item supersede                  -> Superseded, naming the replacement
  /item abandon                    -> Abandoned
  /item lapse                      -> Lapsed (not for [work] items)
  /item reopen                     Take back Realized, Deferred, Open, or Done

  A bare /idea is /idea new. A bare /observation is /observation new.

EXPERIMENTS
  /experiment new                  Start an experiment
  /experiment new with phases      Start an experiment, asking for its phases
  /experiment status               Phases, current phase, and its goal
  /experiment affirm               -> Affirmed (engineer's declaration only)
  /experiment refute               -> Refuted
  /experiment inconclusive         -> Inconclusive
  /experiment suspend              -> Suspended
  /experiment resume               Suspended -> Active
  /experiment supersede            -> Superseded, after suspension
  /experiment abandon              -> Abandoned

FEATURES
  /feature new                     Start a feature
  /feature status                  Phases, current phase, and its goal
  /feature complete                -> Completed
  /feature suspend                 -> Suspended
  /feature resume                  Suspended -> Active
  /feature supersede               -> Superseded, after suspension
  /feature abandon                 -> Abandoned

  Either kind opens with a question or an intent, and whether it
  reaches a verdict is chosen when it starts.

JOURNAL
  /journal new, /journal entry     Write a shared journal entry
  /journal private                 Write a private journal entry
  /journal read private            Read the private journal
  /journal timeline                List entries by date
  /journal move                    Move a private entry to the shared journal

LOG
  /log                             Write a log entry
  /log summary                     Summarize the log

FREEWRITING
  /freewrite begin                 Begin freewriting
  /freewrite end                   End it, and organize what was said
  /freewrite resume                Resume a freewrite that has ended

PACKAGES
  /package activate <package>      Activate an installed package
  /package deactivate <package>    Deactivate an installed package
  /package refresh [<package>...]  Refresh installed packages
  /package install                 Install Waytide

PROJECTS
  /projects                        The machine's registry of Waytide projects

TESTS
  /test                            Run the automated suite
  /test interactive [<test>]       Run an interactive test, or ask which
  /test report, /test-report       Classify the suite
  /test tree, /test-tree           Run the suite and print its context tree

REPORTS
  /status-report                   The whole-project report

LANGUAGE
  /reserve <word>                  Reserve a word, in six steps
  /ete                             Write in Eventide Technical English
  /expand                          Expand the previous answer

PROCEDURES
  /work-session new | append       Write or append a work session record
  /release                         Choose the next version
  /publish [<package>...]          Publish packages (this repository only)
```
