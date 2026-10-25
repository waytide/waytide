# A loop record holds the cycles through the loop, one file per feature

`waytide/local/logs/loops/` holds **loop records** — one file per feature documenting the cycles through the **loop** (the distributed OODA cycle — see the DBE vocabulary). The decision log captures *what* was decided, one line per decision. A loop record captures *how*. It is the deliberation history of a feature. That is the hinges the AI determined, and, in attended work, the options it put to the engineer. It is also the decisions the engineer made, or the chat that replaced them. In unattended work, it is the decisions the agent made, with its reasoning.

**Purpose:** make the *how* of a feature's design recoverable — which hinges were found, what alternatives were weighed, and why the chosen path won. It is the narrative companion to the one-line decision log, which a loop record must not displace (the log stays one line per decision).

**Format:**
- Filename per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`.
- A `# Loop record — <feature>` title and a one-paragraph summary of the feature.
- **The mode, declared at the top** — **attended** or **unattended** (see the attended-or-unattended-is-chosen-when-the-work-is-started rule). It is stated once, because it changes how every cycle below is read.
- One section per **cycle**, in order. Each cycle records:
  - **Hinge** — the subtle, load-bearing decision the AI determined.
  - **Options** — the candidates put to the engineer at the gate (or "none — no gate", explicitly, when a hinge was handled without stopping. Surfacing a skipped gate is part of the record's value).
  - **Decision / chat** — what the engineer chose, or the chat that ensued and how it resolved (record the substance of the chat, not just the outcome).
- **Under an unattended mode, a cycle carries its hinge and the decision with its reasoning. No Options or Decision / chat line** — neither happened, and writing them would be a false record of a deliberation that never occurred. This is **not** the "none — no gate" form above: that marks a **skipped** gate in an attended run, which is a defect worth surfacing, where an unattended run has no gates, by decision. The mode declaration is what tells them apart.
- An **Outcome** line: the resulting code/behavior, suite state, and commit.
- A **provenance footer** ending the file (`Authored by … / Changed by …`), like every working-state artifact — see foundation's working-state-artifacts-carry-a-provenance-footer rule.

**Live vs. backfill:** a loop record written *while* doing the work is the default. A record reconstructed **retroactively from memory** must be marked at the top as a **Backfill**. It is reconstructed after the fact rather than captured live, so it is necessarily lossier and may miss cycles or detail.

**Why:** the deliberation is the conveyable substance of this method. That is the hinges and the reasoning over the options. It evaporates if only the final code and one-line decisions survive. A per-feature narrative of the loop's cycles keeps it, teaches the method by example, and exposes where gates were skipped.

**How to apply:** when a feature's loop is worth preserving, add a file under `waytide/local/logs/loops/` in the format above. Record each cycle's hinge, options, and decision or chat. Under unattended work, record its hinge and the decision with its reasoning. Mark retroactive reconstructions as backfills. Keep the one-line decision-log entries separate and intact.

## Compressed

1. `waytide/local/logs/loops/` holds loop records: one file per feature, recording its cycles through the loop.
2. The loop is the distributed OODA cycle, as defined in the DBE vocabulary.
3. A loop record captures how a feature was decided. The decision log captures what was decided.
4. A loop record holds the hinges the AI determined and, in attended work, the options it put to the engineer.
5. It also holds the engineer's decisions, or the chat that replaced them. In unattended work, it holds the agent's decisions, with its reasoning.
6. A loop record must not displace the decision log.
7. The decision log stays one line per decision.

## Format

1. Name the file per the ISO 8601 UTC datetime prefix convention: `YYYY-MM-DDTHH-MM-SSZ-<feature-name>.md`.
2. Begin with a `# Loop record — <feature>` title and a one-paragraph summary of the feature.
3. Declare the mode at the top, as **attended** or **unattended**, per the attended-or-unattended-is-chosen-when-the-work-is-started rule.
4. State the mode once.
5. Write one section per cycle, in order.
6. Each cycle records a **Hinge**: the subtle, load-bearing decision the AI determined.
7. Each cycle records **Options**: the candidates put to the engineer at the gate.
8. When a hinge was handled without stopping, write Options explicitly as "none — no gate".
9. Each cycle records **Decision / chat**: what the engineer chose, or the chat that ensued and how it resolved.
10. Record the substance of the chat, not just its outcome.
11. Under an unattended mode, a cycle carries its hinge and the decision with its reasoning.
12. Under an unattended mode, write no Options line and no Decision / chat line.
13. The "none — no gate" form marks a skipped gate in an attended run. Do not use it in an unattended run.
14. Include an **Outcome** line: the resulting code or behavior, the suite state, and the commit.
15. End the file with a provenance footer (`Authored by … / Changed by …`), per foundation's working-state-artifacts-carry-a-provenance-footer rule.

## Live vs. backfill

1. Writing a loop record while doing the work is the default.
2. Mark a record reconstructed retroactively from memory as a **Backfill**, at the top.

## How to apply

1. When a feature's loop is worth preserving, add a file under `waytide/local/logs/loops/` in the format above.
2. Record each cycle's hinge, options, and decision or chat. Under unattended work, record its hinge and the decision with its reasoning.
3. Keep the one-line decision-log entries separate and intact.
4. **Why:** the deliberation, meaning the hinges and the reasoning over options, is lost if only code and one-line decisions survive. A per-feature narrative keeps it and exposes skipped gates.

## History

Until 2026-10-24 the opening and How to apply described every cycle as recording options and the engineer's decision or chat, without exception. The unattended exception, which came after the rule was written, was stated only in the Format section. The opening and How to apply now carry it too.

Until Sun Oct 25 2026 this rule was named loop-records and titled "Loop records — `waytide/local/logs/loops/`: one file per feature recording the cycles through the loop".

Related:

- the DBE vocabulary — loop, hinge, gate, deliberation
- the the-hinge-cycle-runs-from-actuation-to-naming rule
- foundation's file-name prefix and decision-log conventions
- `foundation`'s the-logs-directory-groups-the-running-records rule — the running records this sits among, which names this directory without requiring anything of it

---

Authored by Scott Bellware on Tue Jun 30 2026 at 12 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 12:21:11 AM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 12:22:15 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 5:06:31 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:38:25 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:46:55 AM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:19 PM PT
