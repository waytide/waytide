# Consider a git worktree for experiments

An experiment currently runs on its own branch in the **one working tree** (the
experiment-runs-on-its-own-branch rule): starting or resuming an experiment means
`git switch`-ing the working tree to the experiment branch, and concluding means
switching back to the upstream branch. Whether a **git worktree** — a second working
directory checked out to the experiment branch, alongside the main one — is the better
home for an experiment is an open question worth settling deliberately.

What a worktree would change:

- **The main working tree stays on the upstream branch throughout.** The experiment
  lives in its own directory, so main-sequence work and the experiment can be open at
  once without switching — which directly addresses the **main-sequence drift** the
  current rule only asks the agent to *watch for*. The two lines of work are physically
  separated rather than time-shared on one checkout.
- **Concluding no longer means switching back.** The "leave the user on the upstream
  branch on every conclusion" instruction becomes moot for the main tree — it never
  left the upstream branch — and cleanup is removing the worktree rather than switching
  and deleting a branch.
- **Suspension is cheaper.** A suspended experiment's worktree can simply be left in
  place, checked out to its branch, instead of the branch sitting dormant while the one
  checkout is used for other work.

What has to be weighed against it:

- **A worktree is more setup and more state on disk** — a whole second checkout, plus
  its own path to track and clean up. For a short single-branch experiment that resolves
  quickly, `git switch` may be the lighter tool.
- **The `experiment/<subject>` branch naming, the base-in-the-record convention, and the
  merge gate are unaffected** — a worktree is a different *checkout* of the same branch,
  not a different branching model. So this is a change to *where the experiment is
  worked*, not to the experiment lifecycle.
- **Tooling and path assumptions.** Anything that assumes the experiment is worked in the
  repo root — test runners, relative paths, the agent's own working-directory assumptions
  — has to hold in a worktree directory too.

**Gated on:** nothing in flight blocks it; it is a methodology question, not a task. The
worktree-versus-single-tree decision is settled before the experiment-runs-on-its-own-branch
rule is changed, and no experiment is migrated to a worktree until then.

**Why:** the experiment lifecycle is a load-bearing part of the framework, and how an
experiment is physically worked shapes whether main-sequence drift is *prevented* or
merely *watched for*. If a worktree is the better home, the rule should say so; if the
single-tree switch is right for the short experiments that are the default, that should be
settled and recorded rather than left as an unexamined default.

**How to apply:** settle the question first — decide whether an experiment is worked in a
git worktree, in the single working tree via `git switch`, or either-as-appropriate, and
record the decision in `waytide/log/`. Only then conform the experiment-runs-on-its-own-branch
rule and the agent-experiments-convention to it. Delete this file when it is carried out,
and log that it was done. Related: the experiment-runs-on-its-own-branch rule (the current
single-tree, own-branch lifecycle) and the agent-experiments-convention.

---

Authored by Scott Bellware on Fri Jul 24 2026 at 8 AM PT
