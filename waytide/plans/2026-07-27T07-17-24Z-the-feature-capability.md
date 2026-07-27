# The Feature Capability — Implementation Plan

## Goal

Give feature work the lifecycle the design settles: its own branch, a working location
chosen at initiation, a record under `waytide/features/`, four declared end states, and
recorded confirmations — with the four places the mirror to the experiment capability
deliberately breaks. When this is done, `foundation` carries a feature capability
alongside its experiment capability, and the session-start notice reports open work of
either kind.

One consequence to state plainly: these rules govern this repository as well as the
projects that install `foundation`. This repository's history is direct-to-`master`
main-sequence work, so completing this plan changes how work here proceeds, from the next
feature onward. That is the intent, not a side effect.

## Source design

`waytide/design/2026-07-27T07-09-02Z-the-feature-capability.md` — settled 2026-07-26 and
2026-07-27.

## Architecture

Five phases. The first settles a question the design left open and the rules cannot be
written around; the remaining four are ordered so nothing describes a mechanism that does
not yet exist.

- **Phase 1 — One question to answer.** Nothing gets built here. The design leaves one
  thing undecided, and the feature rule cannot be finished without it. "The feature rule
  says nothing about this" is a real answer, and the rest of the work can proceed either
  way.
- **Phase 2 — The rules.** Two new `foundation` rules, written to the rule format. Prose
  only; nothing executable, nothing to verify beyond review.
- **Phase 3 — The mechanism.** The one executable change in the plan. The session-start
  script gains a second directory to read. Verified by running it against constructed
  record states, as the experiment reporting was.
- **Phase 4 — The surfaces.** The package introduction and the documentation site, brought
  into line with the capability that now exists. Behavior-neutral to the framework itself.
- **Phase 5 — Close.** The deferred item that raised the question is carried out and
  removed from the queue.

## Tech Stack

Markdown rule and convention files, one POSIX shell script; no application code and no
automated suite in this repository.

## Process notes

- **No code in this plan.** Rule filenames, the record's exact field order, and the shape
  of the script's addition are decided during the work, not pre-baked here.
- **The rules mirror their experiment counterparts** but are written independently rather
  than copied — the four breaks in the mirror are the substance, and a copied rule would
  carry the experiment's justifications where they do not hold.
- **The script change is the only thing that can be run**, so it is the only thing
  verified: exercised against a concluded record, an unconcluded one, a record with no
  state line, and the quiet opt-out, before it is committed.
- **Every rule carries a provenance footer**; every decision made during the work gets its
  own one-line entry in `waytide/log/`.

## Commit policy

One commit per task, subject-first and stating the fact rather than the bookkeeping. Log
entries travel in the commit of the change they describe. The suite gate does not apply —
there is no suite in this repository — so each commit is reviewed rather than verified.

## Tasks

- [x] Task 1: It is decided whether the feature rule tells you to watch for other work
  starting while a feature is open. **Done 2026-07-27 — it does not.** During a feature,
  other work is normally another feature, and starting one is ordinary rather than a
  problem, so there is nothing to detect. The experiment's instruction exists because an
  experiment is a side trip that can be forgotten while the main line moves on; a feature
  has no such relationship to the work around it. Being forgotten is still a real risk for
  a feature, and the session-start notice covers it.

  The experiment rule tells you to watch for that. It can do so because an experiment is a
  side trip from ordinary work, so the two can drift apart. A feature *is* the ordinary
  work, so that reason does not carry over and the instruction cannot simply be copied.
  Deciding the feature rule says nothing about this is a real answer. Either way the
  answer and its reason are recorded, and the feature rule can then be written.
- [x] Task 2: The `waytide/features/` convention describes what a feature record holds —
  the intent, which branch it is on and what it branched from, where it is being worked,
  the line that records its state, and the confirmations — and how it relates to the loop
  record that carries the same feature's design. **Done 2026-07-27** as
  `agent-features-convention`.
- [x] Task 3: The feature lifecycle rule states how a feature begins, where it is worked,
  how its working location may change, the four states it can end in, and that its tests
  are verified before integrating with nothing gating the merge. **Done 2026-07-27** as
  `feature-runs-on-its-own-branch`, carrying Task 1's answer as an explicit statement that
  there is no instruction to watch for other work, and why.
- [ ] Task 4: The session-start notice reports features that have not concluded, alongside
  the experiments it already reports.
- [ ] Task 5: The foundation package's introduction names the feature capability and its
  artifact directory, as it names the experiment's.
- [ ] Task 6: The documentation site describes feature work — an entry in the capability
  list, and a page for the reader who wants the lifecycle in plain terms.
- [ ] Task 7: The feature-cycle deferred item is carried out, removed from the queue, and
  logged as done.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 12:17:24 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:23:45 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:26:33 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:27:13 AM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 12:28:02 AM PT
