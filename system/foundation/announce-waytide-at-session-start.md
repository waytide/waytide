# The harness announces Waytide's installation; the agent never prints the notice

A project running Waytide announces the system's presence through **two surfaces the harness renders**, not through anything the agent says:

- **A session-start notice.** A `SessionStart` hook runs `waytide/system/foundation/session-start.sh`, which reads the package directories actually present and emits a one-line notice:

```
Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git
```

  The same notice reports **experiments and features that have not concluded**, on a
  further line each, when there are any:

```
Waytide installed at waytide/system/ — 5 packages: foundation, language, testing, design-by-efferent, git
2 experiments open: shipped-test-tree-script (suspended), gate-forecasting (no state recorded)
1 feature open: upload-retries (suspended)
```

  Each record under `waytide/local/experiments/` and `waytide/local/features/` is read for its
  canonical `**State:**` line (see the agent-experiments-convention and the
  agent-features-convention). An experiment whose state is **Affirmed**, **Refuted**,
  **Inconclusive**, **Abandoned**, or **Superseded** has concluded, as has a feature that
  is **Completed**, **Abandoned**, or **Superseded**; those are not reported. **Suspended**
  and a record carrying no state line are. When every
  experiment has concluded the second line is absent entirely, so the notice grows only
  when there is something open.

  **Why the notice carries it.** The lifecycle requires that an experiment never be left
  silently open, but nothing was enforcing that across sessions. The working directories
  under `waytide/` are not read at session start, so an open experiment goes unnoticed
  unless something names it — and an experiment worked in a **worktree** leaves no trace
  at all in the main working tree, which stays on the upstream branch, so not even the
  branch name gives it away. The configuration that best isolates an experiment is the
  one that most easily loses track of it.

- **A status line.** `waytide/system/foundation/statusline.sh` keeps the same count on screen for the whole session, alongside the working directory and git branch, so the fact stays available instead of scrolling away:

```
waytide · master - Waytide system active (7 packages)
waytide · master · uncommitted changes - Waytide system active (7 packages)
```

  The **uncommitted changes** segment appears only when the working tree has something
  not committed — a modified tracked file, a staged change, or an untracked file that is
  not ignored. All three are uncommitted, and the untracked case is the point rather than
  noise: a file left untracked is usually one that should be added or ignored. Absence is
  the clean signal, as it is for the notice's open experiments and features. It is words
  rather than a mark on the branch — `master*` is the conventional form and means nothing
  until a reader is taught it.

Both are wired by a committed `.claude/settings.json` that `install.sh` places in the consuming project.

- **The hook also carries the read instruction to the agent, on a separate channel.** The
  `SessionStart` hook emits two things, addressed to two different readers. The **notice**
  goes in `systemMessage`, which the harness renders for the developer. The **instruction to
  read the rules** goes in `hookSpecificOutput.additionalContext`, which reaches the agent's
  context and is never displayed. They are not the same text, because they are not for the
  same reader: the developer does not need an instruction addressed to the agent restated
  every session.

  The instruction states that the read is **unconditional** — that the apparent size of the
  first request is not a reason to defer it. That is the failure it answers: a session opened
  with a one-line request, the read was judged not worth it, and the session grew into rule
  edits, a session record, and two package publishes governed by rules that were never read.
  Reading on demand kept producing locally plausible results, so nothing ever announced the
  gap.

  **What it does not do is verify the read.** Nothing here can: the hook runs before the
  session and cannot observe what the agent then does. It removes one specific excuse — the
  instruction being buried in a prose file the agent may not open — and no more. The
  verification remains what it has always been, the work honoring the rules.

- **The agent does not print a notice.** Not at session start, not before the first response, not at all. The harness has already printed it, and an agent-printed copy would only duplicate it.
- **Enumerate what is actually on disk.** The scripts list the package directories under `waytide/system/` (or `system/` in the authoring source). A directory carrying a `README.md` is a package — which is what distinguishes `code/ruby` (a package) from `code/` (a grouping directory). Nothing prints a fixed list; the notice reflects the real install because the directories must be read to produce it.
- **What the notice claims is narrow, and its wording says so.** It reports that the system is **installed** and its configuration is live. It says nothing about whether the rules were read or internalized — the agent is not its author, so it cannot vouch for the agent. That verification comes from the work honoring the rules, as it always did. **Carrying the read instruction does not widen this claim.** Instructing and vouching are different acts: the hook tells the agent to read the rules, and still reports nothing about whether it did.
- **The notice says "installed", never "loaded".** The two words claim different things, and only one of them is observable at the moment the notice prints. A hook runs **before** the session, so no rule file has been read yet — the notice and the read instruction are emitted in the same output, which means the notice is printed at the very moment the reading is still being asked for. "Loaded" means brought into a runtime, read in; that is precisely the fact the hook cannot establish. The notice earlier used it anyway, so the rule's narrow claim and the script's wording disagreed, and the wide reading was the one a developer actually saw. Nothing about the timing can be fixed — no message emitted before a session can report on what the session then does — so the correction is the verb, not the mechanism. The same holds for the term: this is the **session-start notice**, not "the load notice", and the status line reports the system **active**, which is a claim about the configuration rather than the agent.
- **A project that ignores `.claude/` is warned.** The notice travels only if
`.claude/settings.json` is committed, so `install.sh` checks whether git is set to
ignore that path and — when it is, and the file is not already tracked — prints how to
correct it. Without the check the install reports success while the notice stays on one
machine: it works for whoever ran the install and reaches nobody else on the team. Git
cannot re-include a file inside an excluded directory, so a negation added under a
`.claude/` rule does nothing; the rule has to become `.claude/*` plus
`!.claude/settings.json`, which keeps each developer's personal
`.claude/settings.local.json` ignored.
- **Adopting the status line replaces the developer's own.** A project-level `statusLine` overrides whatever the developer configured for themselves. That is why the script also renders the directory and branch, and why `install.sh` never merges into an existing `.claude/settings.json` — it prints the block and leaves the choice with the developer.

**Opt-out:** set the `WAYTIDE_QUIET` environment variable to any non-empty value and both surfaces go quiet. **It does not silence the read instruction**, which is not a surface — the developer never sees it. Quieting a display must not disable the mechanism that carries the rules to the agent, or a personal preference would silently switch off the system's governance, which is the class of failure the hook exists to answer. A developer sets it however they like — shell profile, `direnv`, or a personal `.claude/settings.json` `env` block. The opt-out lives in the developer's own environment, never in committed project content, so silencing is a personal preference and the default-on behavior travels with the repository to everyone who checks it out.

**What this costs:** the mechanism is specific to harnesses that read `.claude/settings.json`. Under any other harness there is no notice until equivalent glue is written for it — the system still loads through the `AGENTS.md` bootstrap, but silently. A harness setting that disables all hooks silences it too, and a newly placed `.claude/settings.json` may not take effect until the harness reloads its configuration.

**Why:** the notice was previously printed by the agent, on an instruction carried in the `AGENTS.md` bootstrap, and it failed in two ways at once. It was **unreliable** — it depended on the agent obeying a line buried in a long prose file, and when it did not fire, nothing revealed that. And it was **badly placed** — a line of plain text inside a reply, which either cluttered the response or was scrolled past, so it could be emitted correctly and still go unseen. Both failures have one source: the party being announced was also the announcer. Moving the notice to the harness removes the dependence on agent compliance and puts the message outside the response body, where it neither competes with an answer nor hides inside one. The ordering problem — whether the notice precedes the first response — disappears with it, because a hook runs before the session rather than inside it.

**How to apply:** wire the notice through `.claude/settings.json`, pointing the `SessionStart` hook and `statusLine` at the two foundation scripts; `install.sh` does this for a consuming project. Never print a session-start notice as an agent. Keep the scripts reading the real directories rather than asserting a list, and keep the notice claiming **installation** rather than a load — the word has to stay inside what a pre-session hook can observe. Keep the notice and the read instruction on their separate channels — `systemMessage` for the developer, `hookSpecificOutput.additionalContext` for the agent — and keep the instruction firing when `WAYTIDE_QUIET` is set. Related: the agent-rules-convention (the rule format and where the bootstrap lives), the foundation `install.sh` that places the bootstrap files, and the status-report-format rule (the on-demand report that answers in detail what is installed).

---

Authored by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Thu Jul 23 2026 at 2 PM PT
Changed by Scott Bellware on Thu Jul 23 2026 at 3 PM PT
Changed by Scott Bellware on Sun Jul 26 2026 at 10:12:41 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:29:18 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 5:10:17 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 10:29:09 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 11:53:12 PM PT
