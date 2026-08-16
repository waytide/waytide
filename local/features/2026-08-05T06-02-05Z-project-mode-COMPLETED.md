# Feature — The project mode: formal or creative

## Intent

Give a Waytide project a **mode**, chosen at its initiation through the selection interface and
held for the project's life:

- **Formal** — the artifacts are a **design** and a **plan**, in `waytide/local/design/` and
  `waytide/local/plans/`. **This is the default.**
- **Creative** — the artifacts are an **aspiration** and an **intention**, in
  `waytide/local/aspiration/` and `waytide/local/intention/`.

The pairing is on a near/far axis: design and aspiration answer *what are we going toward*, plan
and intention answer *what are we going to do*. The human-centric terms are looser than their
process-centric counterparts, and that is the point rather than an imprecision.

## Setup

- **State:** Completed
- **Upstream branch:** `master`
- **Feature branch:** `feature/project-mode`
- **Base:** `04f6b94b72e4ee762f55ecd698f6cfb2714b2f62`, from `master`
- **Working location:** branch only. Chosen at initiation on 2026-08-04 through the selection
  interface. This working tree switches back to `master` at the conclusion.
- **Participation:** attended. Chosen at initiation beside the working location.
- **Source observation:**
  `waytide/local/observations/2026-08-05T05-52-00Z-design-and-planning-are-process-centric-aspiration-and-intention-are-human-centric.md`
  — the discovery record. Several of its open questions were settled by the direction that
  initiated this feature; the observation is kept as written and notes what was settled.

## What the direction settled

Given as a direct instruction on 2026-08-04, answering three of the observation's open questions:

- **It is two modes, not one mode with looser obligations.** The observation named this the
  decisive question.
- **Separate directories** — `waytide/local/aspiration/` and `waytide/local/intention/` — rather
  than the same two directories worked differently. The observation named this the more expensive
  of the two answers.
- **Formal is the default.**
- **`waytide/local/migration/` is out of scope**, disregarded for now. The observation had noted
  that the third planning artifact has no obvious human-centric corollary.

## The structural finding that shapes the build

**`install.sh` cannot issue the prompt.** `AskUserQuestion` is an agent-side tool and `install.sh`
is a POSIX `sh` script run from a shell; a script has no way to reach the selection interface. So
the mode cannot be established by the installer, and it cannot be established by
`read-consuming-projects.sh` either — that tool is discovery only and reaches projects that
already exist.

**The mode is therefore a rule the agent follows**, not a step in a script. What the installer
might do is leave a trace that no mode has been chosen; what the agent does is prompt, record the
choice, and thereafter work the directories the mode names.

## What this feature must settle

- **Where the mode is recorded, and what reads it.** The load-bearing decision. The mode governs
  which directories are used for the project's life, so it has to be legible at the start of
  every session. Candidates include a recognizable-content line in a file under
  `waytide/local/`, a local rule, and inferring the mode from which directories are present.
- **When "project initiation" is**, for an agent. A project with Waytide installed and no mode
  recorded is the obvious reading, but that makes the prompt fire in an existing project on the
  first session after the rule ships. **Settled 2026-08-05:** an absent mode rule means the
  question has never been asked, so the agent asks — and the projects that **predate** the mode
  are taken out of scope here and migrated explicitly as a separate effort, registered as the
  deferred item *The projects that predate the mode are migrated to an explicit mode rule*. That
  item carries the ordering constraint: the migration must reach a project **before or with** the
  refresh that brings it the rule, or the prompt fires there on its own.
- **What happens to the existing conventions.** `design-convention`, `plans-convention`,
  `design-document-format`, and `plan-document-format` name their directories throughout, and
  the four rules are `foundation`'s. Whether the creative mode gets its own conventions, or the
  existing ones are generalized, is not settled.
- **Whether the mode can change after initiation**, and what becomes of artifacts already
  written under the other mode.
- **What the session-start notice says about the mode**, if anything.

## What is already true and needs no work

**Formal being the default means every existing project is already formal.** The four consuming
projects in the registry and this repository all hold `local/design/` and `local/plans/`, and
nothing about them changes. No migration of existing artifacts is implied by this feature.

## Confirmations

- **2026-08-04 — working location.** Branch only, chosen through the selection interface at
  initiation.
- **2026-08-04 — the human's level of participation.** Attended, chosen through the selection interface at
  initiation beside the working location.
- **2026-08-05 — branch deletion.** Confirmed through the selection interface after the merge.
  Local only and never pushed, so no remote branch was deleted, and the feature having been
  worked branch-only there was no worktree to remove first.

## Verification

**This repository has no automated suite**, and this feature is prose — five rules and a README —
so there is nothing to run and nothing that could be run. What was checked before concluding, and
it is a consistency check rather than a test:

- **Every rule named in a `Related:` line exists.** Eleven references across `foundation`,
  `language`, and `design-by-efferent`, each resolved to a file.
- **Each of the four planning conventions names the creative directories and cites the mode
  rule.** Confirmed by reading, not asserted.
- **The `foundation` README carries the mode** in its summary and in its work-artifact directory
  list.

**What is not verified, and cannot be here:** that the rule produces the intended behavior. A rule
is verified by the work honoring it, as the announce-waytide-at-session-start rule says of its
own claim. The first real test is the migration of the projects that predate the mode, and the
first project initiated after that.

## Conclusion

**Completed 2026-08-05.** The intent is built and integrated into `master`. Worked branch-only, so
the working tree returned to `master` at the conclusion. No gate applied at the merge, per the
lifecycle, and there was no affirmation step — a feature has no finding to promote into the
decision log.

**What it produced.** The `a-project-works-in-formal-or-creative-mode` rule in `foundation`,
carrying the mode table, the mode rule's template quoted verbatim, the always-written and
corroborate behavior, the notice's exclusion, and that the mode does not change. The four
planning conventions each naming both directories. The `foundation` README. The source
observation reconciled to record that its own central argument was abandoned.

**What it deliberately did not resolve**, each recorded where it belongs rather than answered
badly: whether a project's mode can be changed after initiation; where `waytide/local/migration/`
falls, which has no creative corollary; what a mixed project would do; and why a given project
chose its mode, which the template's determinism means is recorded nowhere at all.

**The clock this starts.** Publishing `foundation` is what makes the mode rule reach a project,
and an absent mode rule prompts. So the deferred migration item must reach each project **before
or with** the refresh that carries the rule. The publish and the migration are not independent,
and this feature concluding does not by itself change anything in any project.

## Related records

- The source observation, named above, which stays as the discovery record.
- The observation beside it, *planning spans three artifacts across two packages*, which reaches
  the same artifacts from another direction and whose open question about naming the planning
  **activity** is affected by there being two modes of it.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:02:05 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:19:48 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:21:45 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:22:53 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:20:44 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:57:58 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
