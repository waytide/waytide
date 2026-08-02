# Package release rules

Waytide has no rule governing how a package is released — the version is increased and the
release is committed by whatever the session works out at the time. Write the rules that
settle it, covering three points already stated:

- **Both version schemes.** A version may carry **three** segments (`1.2.0`) or **four**
  (`1.2.0.1`). The rules account for each, so a release of a four-segment version is not
  forced through a three-segment reading of what the next version is.
- **The selection UI prompts for the options.** Which version the release takes is put to the
  developer through `AskUserQuestion`, one option per candidate next version, never as a
  prose question and never decided by the agent — as the present-every-prompt rule already
  requires of every prompt.
- **The standard commit message, always.** The release commit is worded in the settled form
  the `git` package's subject-first rule already gives: `Package version is increased from
  1.1.1 to 1.2.0` — the current version and the next one both named, so the log line carries
  the transition without a reader reaching for the package specification.

**Priority:** 3

**Gated on:** nothing in flight; taken up when the current session-start work is finished.
Which package the rules live in is the first thing to settle — the version scheme and the
release are not a `git` concern and not a `foundation` one, so this may want a package of its
own.

**Why:** a release is a recurring act with a known shape and an irreversible result, and
right now nothing fixes that shape — the segment to increase is judged ad hoc, the four-segment
scheme is the case most likely to be read wrongly, and the commit message is re-derived each
time. Fixing the three points above makes a release repeatable and puts the one judgment it
contains — which version comes next — in front of the developer rather than in the agent's
hands.

**How to apply:** settle which package the rules belong to, write them covering the two
version schemes, the selection-UI prompt for the next version, and the standard commit
message, then log it. Related: the `git` subject-first-commit-messages rule (the commit
message's form, including its package-version case), the design-by-efferent
present-every-prompt-through-askuserquestion rule (the prompt), and `CONTRIBUTING.md` (the
publish runbook a release sits alongside).

---

Authored by Scott Bellware on Tue Jul 28 2026 at 11:23:01 AM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:35:18 PM PT
