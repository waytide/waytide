# Feature — manual page

```
FEATURE(1)                     Waytide Manual                     FEATURE(1)

NAME
     feature - build a piece of the main line, on a branch, to a declared end

SYNOPSIS
     /feature new [with phases]
     /feature status
     /feature complete | suspend | resume | supersede | abandon

DESCRIPTION
     A feature is a piece of work with a start and a declared end, added
     to the project's main line: something the project means to have. A
     feature gets a branch of its own, and is
     built there, apart from master, until it completes and merges. The
     one exception is a feature the engineer chooses to build on the
     current branch, which creates no branch at all. Its
     record in local/implementations/ carries how it began, where it is
     being worked, and what became of it.

     A feature opens with an intent, what is to be built, or with a
     question, if the work is to settle one. When it starts, the engineer
     chooses whether it forecasts and reaches a verdict. Most features do
     not: they are built, verified, and completed.

     A feature is never left silently open. It ends in a declared state,
     or it is suspended.

STARTING
     /feature new asks three things:

     Working location
             Branch only, a branch with a worktree, or the current branch.
     Participation
             Attended: the agent stops at each design decision for the
             engineer. Unattended: the agent decides and works through.
     Verdict
             Whether the feature forecasts and reaches a verdict.

     /feature new with phases also asks for its phases.

BRANCHES
     A feature without phases has one branch, merged into its upstream
     branch, usually master, when the feature completes:

         feature/cart-totals
         feature/worktree/cart-totals          (with a worktree)

     A feature with phases has its own branch and one branch per phase.
     Each phase branches from the feature's branch, and is merged back
     into the feature's branch when the phase concludes. A phase is never
     merged anywhere else. The feature's branch merges into its upstream
     branch only after its last phase:

         feature/checkout                      the feature
         feature/checkout.cart                 phase 1
         feature/checkout.payment              phase 2
         feature/checkout.receipt              phase 3

             checkout.cart     --merge--> checkout
             checkout.payment  --merge--> checkout
             checkout.receipt  --merge--> checkout
             checkout          --merge--> master

     A phase's name joins the feature's branch with a dot, because git
     cannot hold a branch beneath another branch's name.

PHASES
     Phases run one at a time, in the order the record names. Each phase
     has an intent of its own that serves the feature's, and starts from
     the feature's branch as the phases before it left it. A phase starts
     by stating its goal and listing the phases with the current one
     marked. /feature status prints the same.

STATES
     Active          The work is in progress.
     Completed       Merged into its upstream branch (no verdict).
     Affirmed, Refuted, Inconclusive
                     Its verdict, where it was chosen to reach one.
     Suspended       Paused, with its branch kept.
     Superseded      Replaced by another implementation, which it names.
     Abandoned       Dropped. Its record is kept, and nothing merges.

FILES
     local/implementations/<UTC timestamp>-<name>-<STATE>.md

SEE ALSO
     /experiment, /phases, /item, /log
```
