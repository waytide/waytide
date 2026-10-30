# Waytide skills — help

```
WAYTIDE SKILLS

Usage: /<command> [<subcommand>] [<arguments>]
       A command typed with no subcommand asks which one is meant,
       except where a bare command has its own meaning, shown below.

ITEMS
  /item new                        Create an item (tagged [idea] if untagged)
  /item idea, /idea                Create an item tagged [idea]
  /item work, /work, /work-item    Create an item tagged [work]
  /item observation, /observation, /observe
                                   Record an observation
  /item mistake, /mistake          Create an item tagged [mistake]
  /item problem, /problem          Create an item tagged [problem]
  /item list <state>, /list <state>
                                   List items in a state
                                   <state>: any item state, or "current"
                                   (Open, Active, and Suspended)
  /current-items                   List current items (/item list current)

  /item start                      Open -> Active
  /item realize                    -> Realized
  /item done                       -> Done ([work] items only)
  /item defer                      -> Deferred
  /item suspend                    -> Suspended
  /item supersede                  -> Superseded, naming the replacement
  /item abandon                    -> Abandoned
  /item obsolete                   -> Obsolete
  /item reopen                     Take back Realized, Deferred, Open, or Done

  /item help                       Print this command's help

  /observation promote             Promote an observation to a rule
  /observation help                Print this command's help

  A bare /idea is /idea new. A bare /observation is /observation new.

FEATURES
  /feature new                     Start a feature
  /feature new with phases        Start a feature, asking for its phases
  /feature status                  Phases, current phase, and its goal
  /feature complete                -> Completed
  /feature suspend                 -> Suspended
  /feature resume                  Suspended -> Active
  /feature supersede               -> Superseded, after suspension
  /feature abandon                 -> Abandoned
  /feature help                    Print this command's help

  Either kind opens with a question or an intent, and whether it
  reaches a verdict is chosen when it starts.

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
  /experiment help                 Print this command's help

PHASE
  /phase, /phase current                   The current phase, its goal, and its branch
  /phases                          List the phases, the current one emphasized
  /phase add <name>                Add a phase after the last
  /phase start                     Start the next phase
  /phase complete                  -> Completed, merged into the implementation
  /phase affirm                    -> Affirmed (engineer's declaration only)
  /phase refute                    -> Refuted (the phase's proposition is not realized)
  /phase inconclusive              -> Inconclusive

  /phase help                      Print this command's help

  Whether a phase reaches a verdict is chosen for each phase,
  when it is added.

LOG
  /log                             Write a log entry
  /log-this                        Write a log entry for the current work
  /log summary                     Summarize the log
  /log help                        Print this command's help
  /work-session new | append       Write or append a work session record
  /work-session help               Print this command's help

JOURNAL
  /journal, /journal new, /journal entry     Write a shared journal entry
  /journal private                 Write a private journal entry
  /journal read private            Read the private journal
  /journal timeline                List entries by date
  /journal publish-private                    Move a private entry to the shared journal (requires conformation)
  /journal help                    Print this command's help

FREEWRITING
  /freewrite begin                 Begin freewriting
  /freewrite end                   End it, and organize what was said
  /freewrite resume                Resume a freewrite that has ended
  /freewrite idea                  Freewrite and record it in an idea item
  /freewrite observation           Freewrite and record it in an observation item
  /freewrite mistake               Freewrite and record it in a mistake item
  /freewrite help                  Print this command's help

TESTS
  /test                            Run the automated suite
  /test interactive [<test>]       Run an interactive test, or ask which
  /test report, /test-report       Classify the suite
  /test tree, /test-tree           Run the suite and print its context tree
  /test help                       Print this command's help

PROJECTS
  /projects                        The machine's registry of Waytide projects
  /projects help                   Print this command's help

PROCEDURES
  /release                         Choose the next version
  /release help                    Print this command's help
  /publish [<package>...]          Publish packages (this repository only)
  /publish help                    Print this command's help

REPORTS
  /status-report                   The whole-project report
  /status-report help              Print this command's help

PACKAGES
  /package activate <package>      Activate an installed package
  /package deactivate <package>    Deactivate an installed package
  /package refresh [<package>...]  Refresh installed packages
  /package install                 Install Waytide
  /package help                    Print this command's help

LANGUAGE
  /reserve <word>                  Reserve a word, in six steps
  /reserve help                    Print this command's help
  /ete                             Write in Eventide Technical English
  /ete help                        Print this command's help
  /expand                          Expand the previous answer
  /expand help                     Print this command's help
  /clarify                         Clarify the previous answer, then clarify it again for good measure
  /clarify help                    Print this command's help
```
