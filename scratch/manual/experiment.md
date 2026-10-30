# Experiment — manual page

```
EXPERIMENT(1)                  Waytide Manual                  EXPERIMENT(1)

NAME
     experiment - try something on a branch, apart from master, to a
     declared end

SYNOPSIS
     /experiment new [with phases]
     /experiment status
     /experiment affirm | refute | inconclusive
     /experiment suspend | resume | supersede | abandon
     /experiment help

DESCRIPTION
     An experiment is a piece of work with a start and a declared end,
     tried out on a branch of its own so that it can be dropped without
     touching master. Its record in local/implementations/ carries how it
     began, where it is being worked, and what became of it.

     An experiment opens with a question, what it is to find out, or with
     an intent, what it is to build. When it starts, the engineer chooses
     whether it forecasts and reaches a verdict. Most experiments do: the
     forecast is written before the work, and the result is set against
     it.

     The agent never offers to end an experiment. Only the engineer
     declares it affirmed, refuted, or inconclusive.

STARTING
     /experiment new asks three things:

     Working location
             Branch only, or a branch with a worktree.
     Participation
             Attended: the agent stops at each design decision for the
             engineer. Unattended: the agent decides and works through.
     Verdict
             Whether the experiment forecasts and reaches a verdict.

     /experiment new with phases also asks for its phases.

BRANCHES
         experiment/free-shipping-threshold
         experiment/worktree/free-shipping-threshold   (with a worktree)
         experiment/free-shipping-threshold.cart       (a phase)

     An experiment that reaches a verdict merges into master only when it
     is affirmed, and after the tests pass.

STATES
     Active          The work is in progress.
     Affirmed        The question held. The engineer declares it.
     Refuted         The question was disproven. Nothing merges.
     Inconclusive    No clear verdict either way. Nothing merges.
     Completed       Merged, where no verdict was chosen.
     Suspended       Paused, with its branch kept.
     Superseded      Replaced by another implementation, which it names.
     Abandoned       Dropped. Its record is kept, and nothing merges.

EXAMPLES
     /experiment new
             Question: does a free-shipping threshold raise the average
             cart total?

FILES
     local/implementations/<UTC timestamp>-<name>-<STATE>.md

SEE ALSO
     /feature, /phase, /item, /log
```
