# The session-start read instruction names `local/rules/` as well as `system/`

The read instruction the `SessionStart` hook carries to the agent names only the installed
packages. `system/foundation/session-start.sh` builds it as *read every rule file under
`<system>/` and follow them — `<system>/foundation/` first … then the other packages,
including each package `vocabulary.md`*. A project's **own local rules** are never
mentioned, so an agent acting on the instruction alone reads `waytide/system/` and stops.

**The binding rule already says otherwise, which is what makes this a gap rather than a
question.** `agent-rules-convention` reads: *Read every rule file under both
`waytide/system/` and `waytide/local/rules/` at the start of a session and follow them.*
The instruction the hook carries is narrower than the rule it exists to get followed.

**The `AGENTS.md` bootstrap does not have the gap.** `system/foundation/install.sh`
generates a consuming project's root `AGENTS.md` naming both directories, and its
explanatory text does the same. So the two surfaces that carry the read to the agent
disagree — and the hook is the one the announce rule calls the primary path, the file
route being the one it was written to stop depending on. Where the bootstrap is not read,
the local rules go unread with it.

**This repository's own `AGENTS.md` names only `system/`**, which is true of it today —
there is no `local/rules/` here — but it is the composite's hand-maintained file and would
be wrong the moment one is added.

**What the resolution has to settle:**

- **Whether the instruction names `local/rules/` unconditionally or only when it exists.**
  The script already locates the project's own working state — the `own` variable, for the
  open-experiments and open-features segments — so either is reachable. Naming a directory
  that is not there invites an agent to report a failed read; omitting it silently is the
  failure being corrected.
- **How the instruction keeps `local/rules/` distinct from the rest of `local/`.** The
  working directories beside it — `log/`, `deferred/`, `design/`, `plans/`,
  `work-sessions/`, `experiments/` — are explicitly *not* read as binding at session start. An instruction
  that says `local/` rather than `local/rules/` would reverse a settled distinction.
- **Whether `announce-waytide-at-session-start` needs more than its quoted instruction
  updated.** The rule describes the instruction's content in several places and the
  no-quotation-marks constraint on the `printf`-built JSON still governs any new wording.

**Gated on:** nothing in flight. Actionable whenever it is taken up.

**Why:** the hook exists because a read instruction buried in a prose file was not
reliably acted on — and the instruction that replaced it carries less than the rule
requires. A project's own rules are the ones no package can supply and no refresh can
restore, and they are the half currently going unnamed at the moment the read is asked
for.

**How to apply:** decide the conditional-versus-unconditional question, then extend the
`instruction` string in `system/foundation/session-start.sh` to name `local/rules/`
alongside the packages, keeping the working directories out of it and the string free of
double quotes. Update `announce-waytide-at-session-start` where it states what the
instruction says, and this repository's `AGENTS.md` if the composite is to describe the
full read rather than only what it has. Resolve by deleting this file and logging that it
was carried out.

---

Authored by Scott Bellware on Tue Jul 28 2026 at 1:29:38 AM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:27:32 AM PT
