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
