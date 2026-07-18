# Agent Norms — git

Commit conventions for a project's git history.

The rules in this package govern how commits are made and worded:

- **No Claude co-author trailer** — commits appear as authored by the user
  only; omit any `Co-Authored-By: Claude …` attribution.
- **Run the suite before considering a commit** — a passing test suite is a
  precondition of the commit decision, not a step taken after deciding to
  commit, so history stays verified at every commit.
- **Commit messages state the fact, not the bookkeeping** — write "Task 9 is
  done", never "mark Task 9 done".
- **Subject-first commit messages** — the subject of the change leads, in
  passive voice and indicative mood ("Widget reconciliation is corrected"), so
  a scanned log surfaces what changed first.

This is a standalone package: it includes no other packages.

## Installing into a project

Install with `git subtree` — the files land in your project's `agent/rules/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix agent/rules/git https://github.com/eventide-project/agent-norms-git.git master --squash
git subtree pull --prefix agent/rules/git https://github.com/eventide-project/agent-norms-git.git master --squash
```

It has no dependencies.
