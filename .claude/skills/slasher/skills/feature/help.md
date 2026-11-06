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
