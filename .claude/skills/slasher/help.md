WAYTIDE SKILLS

Usage: /<command> [<subcommand>] [<arguments>]
       A command typed with no subcommand asks which one is meant,
       except where a bare command has its own meaning, shown below.

ITEMS
  Items hold the project's thinking: ideas, plans, designs, observations, and
  work to be done, each with a state.

  /item new [<kind>]               Create an item tagged [<kind>], or [idea]
                                   with no kind. Any kind may be named.
  /item <kind>                     An alias of /item new <kind>, where the
                                   kind is not also a subcommand of /item
  /item idea, /idea                Create an item tagged [idea]
  /item work, /work, /work-item    Create an item tagged [work]
  /item plan, /plan                Create an item tagged [plan]
  /item design, /design            Create an item tagged [design]
  /item aspiration, /aspiration    Create an item tagged [aspiration]
  /item goal, /goal                Create an item tagged [goal]
  /item observation, /observation, /observe
                                   Record an observation
  /item mistake, /mistake          Create an item tagged [mistake]
  /item problem, /problem          Create an item tagged [problem]
  /item list <state>, /list <state>
                                   List items in a state
                                   <state>: any item state, or "current"
                                   (Open and Active)
  /item current                    List current items (/item list current)

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

  /observation help                Print this command's help

  A bare /idea is /idea new. A bare /observation is /observation new.
  A kind that is also a subcommand, such as list, is created with
  /item new list.

FEATURES
  A feature builds something the project needs, on its own branch or worktree,
  to a declared end. Features and experiments are both kinds of implementations.

  /feature new                     Start a feature
  /feature new with phases         Start a feature, asking for its phases
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
  An experiment tests a question on its own branch or worktree, to a declared
  end. Features and experiments are both kinds of implementations.

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
  Phases split a feature or an experiment into steps, run one at a time, each on
  its own sub branch.

  /phase, /phase current           The current phase, its goal, and its branch
  /phase add <name>                Add a phase after the last
  /phase start                     Start the next phase
  /phase complete                  -> Completed, merged into the implementation
  /phase affirm                    -> Affirmed (engineer's declaration only)
  /phase refute                    -> Refuted (the phase's proposition is
                                   not realized)
  /phase inconclusive              -> Inconclusive

  /phase help                      Print this command's help

  Whether a phase reaches a verdict is chosen for each phase,
  when it is added.

PHASES
  Phases split a feature or an experiment into steps, run one at a time, each on
  its own sub branch.

  /phases                          List the phases, the current one emphasized
  /phases help                     Print this command's help

NEXT
  These commands move the work under way along: take its next step, or say what
  was done and what's next.

  /current [<n>]                   The current items, or the n most recent,
                                   then the current features and experiments

  /next                            Proceed to the next step in the current
                                   multi-step process
  /next?                           The next step in the current multi-step
                                   process

  /work-status                     What was recently done, and what's next

  /sup? is an alias of /work-status, with the same
  subcommands.

  /process help                    Print this command's help

LOG
  The log records what was decided and when, and a work session record tells the
  story of a stretch of work.

  /log [<message>]                 Write a log entry
  /log summary                     Summarize the log

  /log-this                        Write a log entry for the current work

  /work-session new | append       Write or append a work session record

  /log help                        Print this command's help

JOURNAL
  The journal is the writer's own record of what they think, either stored with
  the project or kept in a private journal.

  /journal, /journal new, /journal entry
                                   Write an entry in the project journal
  /journal private                 Write a private journal entry
  /journal read private            Read the private journal
  /journal list [<timespan>]       List entries by date, all or within
                                   a timespan
  /journal publish-private         Move a private entry to the project journal
                                   (requires confirmation)
  /journal help                    Print this command's help

BRAINSTORMING
  Brainstorming records points as they are said, freeform in no order, and
  organizes them when the writer is done.

  /brainstorm, /brainstorm begin   Begin brainstorming
  /brainstorm end                  End it, and organize what was said
  /brainstorm suspend              Suspend the brainstorm
  /brainstorm resume               Resume a brainstorm that has ended or is
                                   suspended
  /brainstorm <kind>               Brainstorm and record it in an item of
                                   that kind
                                   <kind>: idea, work, plan, design,
                                   aspiration, goal, observation, mistake,
                                   or problem
  /brainstorm help                 Print this command's help

TESTS
  These commands run the project's tests and report on them.

  /test                            Run the automated suite
  /test interactive [<test>]       Run an interactive test, or ask which
  /test report, /test-report       Classify the suite
  /test tree, /test-tree           Run the suite and print its context tree
  /test help                       Print this command's help

PROJECTS
  This command lists the Waytide projects registered on this machine. The list
  helps move ideas, new patterns, and corrections into other projects.

  /projects                        The machine's registry of Waytide projects
  /projects help                   Print this command's help

RELEASE
  This command presents the candidates for a package's next version, for the
  engineer to choose.

  /release                         Choose the next version
  /release help                    Print this command's help

PACKAGES
  These commands manage the installed packages: which are active, refreshing
  them, and installing Waytide.

  /package activate <package>      Activate an installed package
  /package deactivate <package>    Deactivate an installed package
  /package refresh [<package>...]  Refresh installed packages
  /package install                 Install Waytide

  /package-set                     Show the active package set
  /package-set <set or packages>   Declare the package set

  /package help                    Print this command's help

LANGUAGE
  These commands work on language: reserving a word, ETE, Waytide's
  implementation of STE and its extensions, and clarifying language, often the
  agent's.

  /clarify                         Clarify the previous answer, then clarify
                                   it again for good measure

  /expand                          Expand the previous answer

  /reserve <word>                  Reserve a word, in six steps

  /ete [<text>]                    Say the previous answer, or the text, in
                                   Eventide Technical English

  /language help                   Print this command's help

LOAD
  This command loads the rules now, without waiting for the first prompt.

  /load                            Load the rules now
  /load help                       Print this command's help
