# Work Session — The third hop is found broken and gets a check (Thu Aug 6 2026 14:19)

The work session began with two questions about the names in the check built earlier the same day — what *partial planning directories* meant, and what a *triple* was. Both names turned out to be defective and were corrected. It became a survey of the consuming projects, undertaken to settle whether a deferred item was worth doing, which found every one of them carrying a mode rule named for a mode Waytide had retired the day before. It ended with those projects repaired, refreshed, and pushed; a check packaged in `foundation` so the same drift reports itself; the deferred queue empty; and all three hops — this repository, the component repositories, and the consuming projects — current with each other.

**This is the communicable record — the guided tour, written to be read.** It is not the source of truth. The durable records are the seven decision-log entries written this afternoon, the two scripts and the rule changes in `system/foundation/`, and the Settled entry in the consuming-project orchestrator aspiration. This narrative points at them.

It continues the earlier record of the same day, `2026-08-06T07-34-11Z-a-stated-convention-gets-its-detector.md`, which ends at the first publish of `foundation`.

## 1. Two names that did not survive being asked about

The developer asked what *partial planning directories* were — the phrase in the check's filename, its clean-run line, and its section in `CONTRIBUTING.md`. Answering it exposed the fault: no directory is partial. What is partial is the set of them a file names, so the adjective sat on the wrong noun and named an object that does not exist.

The developer then asked what a *triple* was — the term coined that morning for the directories one planning artifact takes across the modes. The fault there was different and worse. **The term bakes in a count**, and the count had changed from two to three on 2026-08-05, the day before the word was written. The stale sentence in this project's own `intuitive-mode` rule — *"The two modes"* — was the evidence sitting in the tree. The system already had the count-free way to say it, in the mode rule's own *every mode's directory* and *the direction artifact*; a count-bearing term had been coined beside a count-free vocabulary that was already there.

The check became `report-planning-directories-named-in-part.sh`. *Named in part* attaches to the naming rather than to the directories, carries no count, and was already the phrase in that morning's commit `237752f`. A name for the convention rather than the defect — `report-mode-directory-completeness.sh` — was considered and rejected on a specific ground: a quiet run would read as a claim that completeness holds, which the script cannot establish while it is blind to the unmarked-word form.

## 2. The duplication behind the one real blind spot

The check cannot see a planning directory written as an unmarked word in a sentence, which is how `session-start.sh` wrote them. The deferred item proposed finding such a word by counting its neighbours in a comma list. **The pattern was tested and produced six findings, none of them true** — every hit was ordinary prose listing kinds of document, because the directories are named after the documents they hold, so a list of document kinds carries the same words in the same shape as a list of directories. It is not tunable.

What replaced it was not detection. **The list of directories was written twice** — built into the instruction by `session-start.sh`, and restated by the `announce-waytide-at-session-start` rule that documents the instruction — and the two had drifted that morning. Removing the copy in the rule made the disagreement impossible rather than detectable, and added no script. The rule now carries a paragraph saying why it does not restate the list, so a later author does not helpfully restore it.

## 3. The survey

The deferred item's remaining half asked whether a consuming project's own rules should be checked, and its own text said the concern was anticipatory — no instance had been observed. Rather than reason about it, `read-consuming-projects.sh` was run.

**Every consuming project on the machine carried a mode rule whose filename ended `-creative-mode.md`.** Waytide renamed that mode to *intuitive* on 2026-08-05 and renamed the governing rule with it. Both renames reached this repository. Neither reached any project. Each file was stale three ways at once: the filename, the mode named in its binding paragraph, and the rule name it cited.

**The consequence was not cosmetic.** The mode rule states that the filename alone carries the mode, which is what lets a project's mode be read without the file being opened. A filename naming a retired mode is invisible to that, and the same rule says an absent mode rule means the mode question has never been asked. So the correct behavior on opening any of those projects was to ask the developer to choose a mode each had already chosen — and in the three projects holding aspirations, the mode rule's corroboration check would have fired and reported *planning artifacts but no mode rule*, which is a false description of what was wrong.

A second drift surfaced with it: **every project's root `AGENTS.md` was behind the packages beneath it**, because a refresh cannot reach a file belonging to no package.

## 4. Repairing four repositories

Each project's mode rule was renamed and corrected, and each was committed and pushed separately. Two mistakes were made and caught. A substitution produced *"Its direction artifact is is an aspiration"* in the first project, which was fixed before the work was repeated. Then the four commits captured only the rename — `git mv` staged it and the content edits came afterward and were never staged — so each commit's message described changes it did not contain. Nothing had been pushed, so all four were amended.

The packages were then refreshed in all four, and each `AGENTS.md` regenerated with `install.sh agents-md`. The bootstrap regeneration corrected a real defect beyond tidiness: the older text told an agent to read every package's `vocabulary.md` with no qualifier, and two packages have none.

## 5. The check, and where it lives

**Placed in `foundation`, so each project runs it on itself.** The argument that decided it: the stale rule governs inside the project, at the start of every session there, and the file is the project's own — no refresh may rewrite it, so only that project's developer can correct it. The cost was recorded rather than dismissed: a package reaches a project only when that project refreshes, so the projects furthest behind receive the check last, and those are the population it most concerns.

That choice closed the consuming-project orchestrator aspiration's 2026-08-04 resolution that discovery detects no condition of any project — which had been recorded as reopened that morning pending exactly this decision. The resolution stands unchanged.

**The two tests were packaged differently, on the ground that their remedies differ.** A stale mode rule ends with the developer editing their own rule; a stale bootstrap ends with a command that fixes it mechanically. So `report-unrecognized-mode.sh` is a new script, and the bootstrap comparison was folded into `refresh-packages.sh`, replacing the reminder it used to print — a reminder that every project had ignored. `install.sh` gained a `bootstrap` subcommand so the bootstrap text has one source rather than being parsed out of the installer.

**The first version of the bootstrap comparison had a defect, found by testing rather than by reading.** It reported a stale `AGENTS.md` as matching whenever the comparison produced no text, and it invoked an installer that, being older than the subcommand it was asked for, would have started installing. Both were corrected: an unmade comparison now reports itself as unmade, and an installer that cannot answer is never invoked.

## 6. Closing the loop

The deferred item was carried out and deleted, leaving the queue empty. `foundation` was published, the four projects refreshed onto it and pushed. Both new checks were then exercised in all four and report clean.

One property of the refresh surfaced on the way: **a change to `refresh-packages.sh` does not take effect on the refresh that delivers it.** The running script is the project's old copy, so the new bootstrap comparison only fired on a second run. Any future change to that script is one refresh behind.

## Takeaways

- **Asking what a name means is a design review.** Two names introduced that morning did not survive the question. One attached an adjective to the wrong noun; the other encoded a count that had changed the day before it was coined.
- **A term that carries a number will outlive the number.** The system's own vocabulary avoids counts, and the avoidance is deliberate — the mode rule generalizes for exactly this reason.
- **Running the tool beats reasoning about whether the tool is needed.** The deferred item said the concern was anticipatory. One command and one grep found the defect in every project, and found a different defect than the one anticipated.
- **Prevention beat detection twice.** Removing the duplicated directory list made one failure impossible; the proposed detector for the same failure was untunable.
- **A check that cannot make its comparison must not report agreement.** The first bootstrap comparison did, and would have reported the drift as absent in exactly the projects that had it.

## Glossary

- **the third hop** — the last leg of a package change: this repository, then the component repositories, then the consuming projects. The first two have checks; the third had none.
- **unmarked** — a directory name written as an ordinary word in a sentence, with no path slashes and no backticks to mark it as a directory. Preferred over *plain word*.
- **named in part** — a file naming some but not all of one planning artifact's directories. Replaces the rejected *partial planning directories* and the rejected coinage *triple*.

## Where the durable records live

- **Scripts** — `system/foundation/report-unrecognized-mode.sh` (new), the bootstrap comparison in `system/foundation/refresh-packages.sh`, the `bootstrap` subcommand in `system/foundation/install.sh`, and `report-planning-directories-named-in-part.sh` at the repository root under its corrected name.
- **Rules** — `announce-waytide-at-session-start` no longer restates the working-directory list; `a-project-works-in-a-mode-chosen-at-initiation` fixes the wording of the mode prompt; `system/foundation/README.md` documents both new checks.
- **Decision log** — seven entries under 2026-08-06 afternoon, covering the rename and the dropped coinage, the rejected neighbour-count pattern, the single-source directory list, the stale mode rules found across the projects, the bootstrap drift a refresh cannot reach, the placement of the check in `foundation`, and the item being carried out.
- **Aspiration** — the Settled section of `local/aspiration/2026-08-04T17-27-34Z-the-consuming-project-orchestrator.md`, where the no-status resolution is reopened and then closed on the same day.

## A closing note

The deferred item was wrong about its own subject and right to exist. It anticipated a defect that was in no project and missed the one that was in all of them, and the only reason the real defect was found is that someone opened the item and went looking for evidence before building what it asked for. An item's value here was the occasion it created, not the specification it carried.

---

Authored by Scott Bellware on Thu Aug 6 2026 at 2:19:29 PM PT
