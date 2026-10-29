# Inventory of instructions stated in substance in two or more places

Counts are approximate characters of each restatement, measured from the text as printed in read.md and on-demand.md. A bare citation by rule name is not counted. Where a restating line also cites the owner, only the restated substance is counted. Entries are ordered by the characters restated in read.md, largest first. Entries with nothing restated in read.md follow, ordered by on-demand characters. Paths are Source paths (system/.../source/...) or vocabulary paths.

Abbreviations for owners and places: `F/` = system/foundation/source/, `L/` = system/language/source/, `D/` = system/design-by-efferent/source/, `T/` = system/testing/source/, `G/` = system/git/source/, `J/` = system/journal/source/.

## 1. A vocabulary's head line: every word is approved or reserved, and the rule says what each status and a reserved entry mean
- Owner: F/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md ("Every word in a vocabulary is approved or reserved"). The owner itself requires the one line, so these copies are the sanctioned form, but each is the same ~270-character paragraph.
- system/foundation/vocabulary.md, item 3: read.md, ~270
- system/design-by-efferent/vocabulary.md, item 3: read.md, ~270
- system/journal/vocabulary.md, item 3: read.md, ~270
- system/language/vocabulary.md, item 3: read.md, ~270
- system/testing/vocabulary.md, item 3: read.md, ~270
- system/versioning/vocabulary.md, items 4-5: read.md, ~270
- local/vocabulary.md, second paragraph: read.md, ~270
- Total: read.md ~1,890; on-demand.md 0

## 2. The attended / unattended account (what each mode does, DBE in effect in both, only the stopping changes)
- Owner: D/attended-or-unattended-is-chosen-when-the-work-is-started.md
- D/advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work.md, items 6 (second part), 15, 16: read.md, ~290
- D/the-human-deliberates-the-hinges-never-the-pass-fail-bar.md, "The loop, by turn" item 8: read.md, ~175
- D/test-first-is-the-default-so-never-ask-whether-to-start-a-task-that-way.md, "What this does not cover" items 3-4: read.md, ~150
- system/design-by-efferent/vocabulary.md, `attended / unattended` entry beyond the definition (choose at start, hold, DBE in effect, cradle/efferent/solubility hold, only stopping changes): read.md, ~250
- system/design-by-efferent/vocabulary.md, substitution 7 (attended is in the loop, unattended out of it): read.md, ~130
- F/an-implementation-runs-on-a-branch-to-a-declared-end.md, "Participation" items 1-2: on-demand.md, ~135
- D/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md, "The five are named" item 6: on-demand.md, ~190
- D/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md, item 30: on-demand.md, ~150
- D/a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature.md, item 5 second sentence: on-demand.md, ~70
- Total: read.md ~995; on-demand.md ~545

## 3. The package set stanza: who prints it, its form (bold active, italic inactive, set name, count line), and when it is absent
- Owner: F/the-startup-display-prints-once-per-session.md (items 1, 5, 18-36, which state "The package set is described here")
- F/a-project-declares-which-installed-packages-are-active.md, "What is printed" items 1-7 and "When nothing is printed" items 1-3: read.md, ~730
- F/the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice.md, opening item 4: read.md, ~130
- Total: read.md ~860; on-demand.md 0

## 4. Reading the rules at session start: run the loader, read its whole output, what it prints and leaves out, and the ON DEMAND trigger mechanism
- Owner: F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Reading the rules" items 1-8
- F/the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice.md, "The read instruction" items 8-12: read.md, ~815
- Total: read.md ~815; on-demand.md 0

## 5. A vocabulary is binding, and its terms and substitutions are used in code, tests, rules, designs, commits, records, and dialogue
- Owner: F/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md, opening items 2-3
- system/foundation/vocabulary.md item 2; system/design-by-efferent/vocabulary.md item 1; system/journal/vocabulary.md item 2; system/language/vocabulary.md item 2; system/testing/vocabulary.md item 2; system/versioning/vocabulary.md item 3; local/vocabulary.md first paragraph: read.md, ~655 together (~85-120 each)
- F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Where binding rules live" item 6: read.md, ~105
- Total: read.md ~760; on-demand.md 0

## 6. What ETE is (STE dictionary and writing rules plus Waytide's reserved terms and substitutions), and `Say it in ETE` against `Say it in STE`
- Owner: L/ete/waytide-keeps-its-word-where-the-ste-word-means-something-else.md, items 1-6
- system/language/vocabulary.md, Terms items 3-4: read.md, ~400
- L/ete/waytide-prose-conforms-to-the-ste-writing-rules.md, items 5-6: read.md, ~305
- D/attended-or-unattended-is-chosen-when-the-work-is-started.md, plan item 7: on-demand.md, ~130
- Total: read.md ~705; on-demand.md ~130

## 7. The literal replacements for slang words (wrap to mediates, sweep to conform, arm to scenario, cut to increment, and so on)
- Owner: system/language/vocabulary.md, Substitutions table (no-slang item 5 itself says each replacement is an entry there)
- L/no-slang.md, items 7-16: read.md, ~420
- L/ete/waytide-keeps-its-word-where-the-ste-word-means-something-else.md, item 17 (sweep discontinued for conform): read.md, ~100
- L/ete/waytide-prose-conforms-to-the-ste-writing-rules.md, worked phrase `swept`, item 1 first sentence: read.md, ~60
- Total: read.md ~580; on-demand.md 0

## 8. What solubility is (dissolves into the reader's understanding, cognitive, knowledge at a glance, minimal necessary complexity found rather than presumed)
- Owner: L/solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding.md
- system/language/vocabulary.md, `solubility` entry (excluding STE note): read.md, ~260
- system/design-by-efferent/vocabulary.md, `solubility` entry (excluding STE note): read.md, ~170
- D/dbe-is-a-design-tool-not-a-testing-ritual.md, items 11-12: read.md, ~150
- Total: read.md ~580; on-demand.md 0

## 9. What a precondition is and how it behaves (not a test, qualifies the test, prevents no regression, failure makes the result meaningless, carries no name, predicate inline, placed immediately before what it qualifies)
- Owner: T/a-precondition-documents-the-factors-that-decide-a-tests-outcome-and-its-predicate-reads-inline.md
- system/testing/vocabulary.md, `precondition` entry items 5-9: read.md, ~545
- Total: read.md ~545; on-demand.md 0

## 10. A project's own vocabulary, `waytide/local/vocabulary.md`: read at session start, binding, decides over every package, not a rule, may be absent, takes no prefix
- Owner: F/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md, "A project's own vocabulary" section
- F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Reading the rules" items 12-15 and 17, "Rules and work artifacts" item 6: read.md, ~430
- local/vocabulary.md, first paragraph (decides over every package's): read.md, ~100
- F/dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not.md, "What takes no prefix" item 4: on-demand.md, ~170
- Total: read.md ~530; on-demand.md ~170

## 11. Never offer to conclude, merge, or publish open work, in any form (next step, option, state summary, precondition), and report what is settled and open, then stop
- Owner: F/an-implementation-runs-on-a-branch-to-a-declared-end.md, "The agent never raises the end of an [experiment]"
- local/rules/2026-08-12T17-52-06Z-a-package-is-published-from-master.md, "The publish is never offered" items 2-5 (item 1, the publish itself, is that rule's own subject): read.md, ~430
- Total: read.md ~430; on-demand.md 0

## 12. Controls: the known inputs, helpers, values, and setup are controls; a test reads control, actuate, observe; never factories, fixtures, or arrange
- Owner: T/test-values-are-controls-never-factories-fixtures-or-arrange.md
- system/testing/vocabulary.md, `controls` entry items 1-3: read.md, ~415
- Total: read.md ~415; on-demand.md 0

## 13. The engineer may choose red/green/refactor at the implementation hinge, and a chosen cycle is not choreography
- Owner: D/at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor.md
- D/dbe-is-a-design-tool-not-a-testing-ritual.md, items 6-8: read.md, ~400
- D/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md, item 10: on-demand.md, ~210
- Total: read.md ~400; on-demand.md ~210

## 14. An error test is named Fails, and its condition is a leading `When ...` context
- Owner: T/an-error-test-is-named-fails-and-its-condition-is-a-context.md
- T/a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables.md, items 6 and 8: read.md, ~280
- T/start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion.md, item 7 (raised error named Fails) and item 11: read.md, ~120
- T/a-features-normal-path-and-its-exceptional-paths-are-separate-test-files.md, items 12-13: on-demand.md, ~150
- Total: read.md ~400; on-demand.md ~150

## 15. A suspension is a log entry tagged `[suspended]` naming what it cost and what else changed, and the thing is removed
- Owner: F/a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved.md
- F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Removing a rule" items 3-4: read.md, ~235
- system/foundation/vocabulary.md, `suspended` entry (the removal and its tagged entry): read.md, ~120
- F/a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store.md, item 10: read.md, ~40
- T/a-test-file-named-with-a-leading-underscore-is-suspended.md, "Suspended here" item 3 (what that rule governs): on-demand.md, ~90
- Total: read.md ~395; on-demand.md ~90

## 16. A historical record is not revised to suit a later convention, and disclosure is the one exception
- Owner: F/disclosure-is-the-one-reason-to-edit-a-historical-record.md
- F/a-project-does-not-name-its-downstream-consumers-in-its-own-files.md, "What it does not reach" items 5-6: read.md, ~200
- system/foundation/vocabulary.md, `reconcile` entry (leave historical records as written, except disclosure): read.md, ~100
- L/no-slang.md, items 17-18: read.md, ~90
- G/a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72.md, "The history is not rewritten" item 2: on-demand.md, ~75
- F/the-migration-directory-holds-the-plans-for-moving-or-restructuring-content.md, item 24: on-demand.md, ~70
- F/a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case.md, last section item 7: on-demand.md, ~45
- J/the-journal-is-the-record-the-writer-keeps.md, item 7: on-demand.md, ~130
- F/the-work-sessions-directory-holds-one-record-per-work-session.md, shape item 2: on-demand.md, ~90
- Total: read.md ~390; on-demand.md ~410

## 17. ETE's three departures from the standard (own categories against 1.5/1.12, fixed meaning against 1.3, ordinary vocabulary against 1.1)
- Owner: L/ete/waytide-keeps-its-word-where-the-ste-word-means-something-else.md, items 29-32
- L/ete/waytide-prose-conforms-to-the-ste-writing-rules.md, items 7-10: read.md, ~360
- Total: read.md ~360; on-demand.md 0

## 18. Which states conclude an experiment and a feature, and that an affirmed experiment is declared by the engineer while a feature has no affirmation
- Owner: F/the-implementations-directory-holds-one-record-per-implementation.md, "The state"
- F/the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice.md, notice items 6-8: read.md, ~225
- local/rules/2026-08-12T17-52-06Z-a-package-is-published-from-master.md, "When a publish happens" item 4: read.md, ~120
- F/a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged.md, items 3 and 5: on-demand.md, ~200
- Total: read.md ~345; on-demand.md ~200

## 19. The free-text option: the harness supplies it, the agent adds none of its own, it is present at every prompt, and it is how the engineer dictates or opens a chat
- Owner: F/present-every-prompt-to-the-engineer-through-the-selection-ui.md, items 5-6
- system/foundation/vocabulary.md, `free-text option` item 13 (harness provides it, agent adds none, present at every prompt): read.md, ~110
- system/design-by-efferent/vocabulary.md, "The two results" item 3: read.md, ~150
- D/advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work.md, item 11 (name passes through the options and the free-text answer): read.md, ~75
- D/the-actuation-gate-offers-candidate-actuations-as-options.md, items 3-5 and 8: on-demand.md, ~455
- D/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md, items 25 and 27: on-demand.md, ~240
- J/where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface.md, "Applying the answer" items 5-6: on-demand.md, ~200
- Total: read.md ~335; on-demand.md ~900

## 20. A journal entry's filename stamp is local time, stops at the minute, takes seconds only where the writer stated them, and carries no `Z`
- Owner: J/journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry.md, "Filename"
- F/a-time-value-carries-minutes-and-seconds.md, items 11-12: read.md, ~230
- system/journal/vocabulary.md, `journal entry` (prefix in local time, not UTC, departs from file-names rule): read.md, ~105
- J/the-journal-is-the-record-the-writer-keeps.md, "Entries" items 3 and 5-8: on-demand.md, ~400
- J/where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface.md, "Applying the answer" items 3-4: on-demand.md, ~160
- Total: read.md ~335; on-demand.md ~560

## 21. A journal entry's shape: title, datetime line, Tags only where given, Summary only where it does not repeat the body
- Owner: J/journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry.md, "Entry format" items 6-11
- J/an-entry-is-the-writers-words.md, items 10-14: read.md, ~330
- J/a-journal-entry-has-a-human-readable-datetime-line-under-its-title.md, items 15-16: on-demand.md, ~150
- J/the-journal-is-the-record-the-writer-keeps.md, "Format" items 2-5: on-demand.md, ~300
- J/where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone.md, items 2-3: on-demand.md, ~250
- Total: read.md ~330; on-demand.md ~700

## 22. The startup display: a `UserPromptSubmit` hook prints it on `load waytide` only, and the agent does not print it
- Owner: F/the-startup-display-prints-once-per-session.md, items 2-4
- F/the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice.md, "The startup display" items 1-4: read.md, ~330
- Total: read.md ~330; on-demand.md 0

## 23. Reserving a word does not order a sweep; replacing other words with it is a separate instruction
- Owner: L/ete/a-word-is-reserved-in-six-steps.md, items 27-30
- local/vocabulary.md, "No sweep follows from this" paragraph: read.md, ~330
- Total: read.md ~330; on-demand.md 0

## 24. A `test` block holds one assertion over explaining variables, with no inline value-producing call
- Owner: T/a-test-block-holds-only-the-assertion-and-its-values-are-declared-in-the-enclosing-context.md
- T/a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context.md, items 17-19 and 22: read.md, ~260
- T/a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables.md, item 1: read.md, ~60
- D/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md, items 11-13: on-demand.md, ~220
- Total: read.md ~320; on-demand.md ~220

## 25. "When the impulse is a word in the Don't use column, write the Use term"
- Owner: F/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md, "What a vocabulary holds" item 3
- system/foundation/vocabulary.md, system/design-by-efferent/vocabulary.md, system/language/vocabulary.md, system/testing/vocabulary.md, each at its Substitutions head: read.md, ~300 together
- Total: read.md ~300; on-demand.md 0

## 26. The `Superseded` state's meaning, and `moot` for what `Lapsed` names
- Owners: F/the-items-directory-holds-one-file-per-item.md (Superseded); system/language/vocabulary.md (`moot`)
- local/vocabulary.md, Finer distinctions sub-points: read.md, ~290
- Total: read.md ~290; on-demand.md 0

## 27. The turn-one test file is assembled only after the actuation, observation, and controls are accepted, never at an earlier hinge
- Owner: D/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md, items 2 and 13
- D/the-human-deliberates-the-hinges-never-the-pass-fail-bar.md, "The loop, by turn" items 5-7: read.md, ~275
- D/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md, items 27-29: on-demand.md, ~260
- Total: read.md ~275; on-demand.md ~260

## 28. Prefer an observation over a rule when the thinking has not stabilized
- Owner: F/an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes.md, "The shape" item 3
- F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Recording a new local rule" item 5: read.md, ~90
- F/ask-at-once-when-the-engineer-expresses-a-preference.md, candidates item 4: read.md, ~110
- F/a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store.md, item 7: read.md, ~70
- Total: read.md ~270; on-demand.md 0

## 29. A record's title date is `Mon Jan 1 2026 18:06` (24-hour, minutes, no seconds) and is the one exception to seconds for titles
- Owner: F/a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time.md
- F/a-time-value-carries-minutes-and-seconds.md, items 9-10: read.md, ~260
- Total: read.md ~260; on-demand.md 0

## 30. `./compile.sh` writes `rules-pre-loaded.md` with each rule's title, Source path, and compressed text, and leaves out `## History`
- Owner: F/a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body.md, items 7-8
- F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Reading the rules" item 4 and "Format" item 7: read.md, ~260
- Total: read.md ~260; on-demand.md 0

## 31. The precondition exception: the test-block rule's parts govern `test` blocks only, and a precondition reads inline
- Owner: T/a-precondition-documents-the-factors-that-decide-a-tests-outcome-and-its-predicate-reads-inline.md, items 15-19
- T/a-test-block-holds-only-the-assertion-and-its-values-are-declared-in-the-enclosing-context.md, "The three parts govern a test block, and a precondition is not one" items 1-2: read.md, ~250
- Total: read.md ~250; on-demand.md 0

## 32. The actuation: invocation of the unit from its use site, written before any implementation; STE note "not approved, gives OPERATION"
- Owner: system/language/vocabulary.md, `actuation` (system/design-by-efferent/vocabulary.md narrows it)
- system/design-by-efferent/vocabulary.md, `actuation` STE note, repeated word for word: read.md, ~130
- D/dbe-is-a-design-tool-not-a-testing-ritual.md, item 10: read.md, ~105
- D/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md, item 5: on-demand.md, ~120
- D/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md, item 3: on-demand.md, ~60
- Total: read.md ~235; on-demand.md ~180

## 33. A substitution names two words; a discontinuation names one and is not a substitution
- Owner: F/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md, "What a vocabulary holds" items 3-6
- system/foundation/vocabulary.md, Discontinuations item 1: read.md, ~90
- system/design-by-efferent/vocabulary.md, Discontinuations item 1: read.md, ~135
- F/a-vocabulary-entry-says-what-a-term-means-not-what-it-was-or-where-to-read-more.md, "Where the history goes" items 2-3: on-demand.md, ~70
- Total: read.md ~225; on-demand.md ~70

## 34. The ISO-8601-UTC filename prefix, to the second, computed in UTC
- Owner: F/dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not.md
- F/a-time-value-carries-minutes-and-seconds.md, item 5: read.md, ~130
- F/the-log-holds-one-file-per-entry-with-a-one-line-title.md, "Filename" items 2-3: read.md, ~85
- F/a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time.md, item 12: on-demand.md, ~120
- D/a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature.md, "Format" item 1: on-demand.md, ~120
- F/the-work-sessions-directory-holds-one-record-per-work-session.md, item 20: on-demand.md, ~120
- J/journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry.md, "Filename" items 12 and 14: on-demand.md, ~150
- Total: read.md ~215; on-demand.md ~510

## 35. The `Explain` option is not the free-text option, and costs one of the four option slots
- Owner: F/present-every-prompt-to-the-engineer-through-the-selection-ui.md, items 7-8 and 19
- system/foundation/vocabulary.md, `free-text option` item 14: read.md, ~200
- Total: read.md ~200; on-demand.md 0

## 36. Working-state directories are not read as binding rules at session start, and are worked with by their own conventions
- Owner: F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Rules and work artifacts" items 4-5
- J/the-journal-is-read-at-the-start-of-a-session-with-the-rules.md, items 17-18: read.md, ~135
- F/the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice.md, "The read instruction" item 13: read.md, ~55
- Total: read.md ~190; on-demand.md 0

## 37. The provenance footer: Authored line, a Changed line appended per change, oldest first, never rewritten, a running history; local time to the second
- Owner: F/record-a-rules-authorship-in-a-provenance-footer.md
- F/a-paragraph-is-one-line-and-the-readers-editor-wraps-it.md, "What still stands" item 6: read.md, ~95
- F/a-time-value-carries-minutes-and-seconds.md, item 6: read.md, ~95
- F/working-state-artifacts-carry-a-provenance-footer.md, items 6-8: on-demand.md, ~210
- F/a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time.md, item 13: on-demand.md, ~170
- Total: read.md ~190; on-demand.md ~380

## 38. A reserved word's entry names its category and states what the STE dictionary says about it
- Owner: F/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md, "Every word ... is approved or reserved" items 3-4
- L/ete/waytide-keeps-its-word-where-the-ste-word-means-something-else.md, items 11-12: read.md, ~190
- L/ete/ete-declares-its-own-categories.md, "Applying the categories" items 7-8: on-demand.md, ~90
- L/ete/a-word-is-reserved-in-six-steps.md, item 22: on-demand.md, ~95
- F/a-vocabulary-entry-says-what-a-term-means-not-what-it-was-or-where-to-read-more.md, item 3: on-demand.md, ~80
- Total: read.md ~190; on-demand.md ~265

## 39. A log entry takes no provenance footer, since its filename and commit carry author and time
- Owner: F/working-state-artifacts-carry-a-provenance-footer.md, "The one exception — the log"
- F/the-log-holds-one-file-per-entry-with-a-one-line-title.md, "Content" items 10-11: read.md, ~185
- Total: read.md ~185; on-demand.md 0

## 40. Deferred work is an ordinary item with a `**Waits for:**` line, optionally ranked by `**Priority:**`
- Owner: F/the-items-directory-holds-one-file-per-item.md, items 21-27 and 37
- system/foundation/vocabulary.md, `deferred` entry: read.md, ~150
- F/a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store.md, item 9: read.md, ~35
- F/a-status-report-prints-a-fixed-whole-project-report.md, items 8 and 21: on-demand.md, ~110
- Total: read.md ~185; on-demand.md ~110

## 41. A writer's journal is `waytide/local/journal/<username>/`, one directory per writer, the username resolved by the username rule
- Owner: J/the-journal-is-the-record-the-writer-keeps.md, opening items 1-4
- J/the-journal-is-read-at-the-start-of-a-session-with-the-rules.md, items 2-3: read.md, ~120
- system/journal/vocabulary.md, `journal` entry (the directory, the one record the agent does not write): read.md, ~60
- J/journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry.md, items 2-4: on-demand.md, ~260
- J/a-timeline-view-lists-every-journal-entry-by-its-datetime.md, items 2-3: on-demand.md, ~150
- Total: read.md ~180; on-demand.md ~410

## 42. A preference not yet settled is asked about at once rather than held
- Owner: F/ask-at-once-when-the-engineer-expresses-a-preference.md
- F/a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store.md, "What it does not reach" items 4-5: read.md, ~160
- Total: read.md ~160; on-demand.md 0

## 43. Plan and work can each be the stale side, and only the engineer can say which
- Owner: F/the-work-sessions-directory-holds-one-record-per-work-session.md, reconcile item 9
- F/when-the-work-diverges-from-the-plan-the-work-is-definitive.md, "What this does not reach" item 5: read.md, ~160
- Total: read.md ~160; on-demand.md 0

## 44. A journal entry binds nothing and nothing in it is followed
- Owner: J/a-journal-entry-is-read-and-never-followed.md
- J/the-journal-is-read-at-the-start-of-a-session-with-the-rules.md, items 6 and 23: read.md, ~70
- system/journal/vocabulary.md, `journal` entry (reads it at session start, follows nothing): read.md, ~85
- Total: read.md ~155; on-demand.md 0

## 45. Machine-scoped configuration lives under `~/.config/`, outside any repository
- Owner: F/a-project-does-not-name-its-downstream-consumers-in-its-own-files.md, "Where the operational need goes instead"
- F/a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store.md, "What it does not reach" item 3: read.md, ~150
- Total: read.md ~150; on-demand.md 0

## 46. What `efferent` means (the use-site view; the test is the first efferent reference)
- Owner: system/language/vocabulary.md, `efferent`
- system/design-by-efferent/vocabulary.md, `efferent` entry (restates rather than narrows): read.md, ~150
- Total: read.md ~150; on-demand.md 0

## 47. `gate` is a noun with no verb form (the loop waits there), and `transfer` is a verb never used as a noun
- Owners: system/design-by-efferent/vocabulary.md, `gate`; system/foundation/vocabulary.md, `transfer`
- system/design-by-efferent/vocabulary.md, `gate` entry clause on `transfer`: read.md, ~35
- system/design-by-efferent/vocabulary.md, substitution 6 (gate takes no verb form): read.md, ~70
- system/foundation/vocabulary.md, `transfer` items 10-11 (gate is the mechanism, loop waits; mirrors gate): read.md, ~45
- Total: read.md ~150; on-demand.md 0

## 48. The session-start notice reports every experiment and feature not concluded
- Owner: F/the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice.md, notice items 5-10
- F/work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported.md, "What this does not forbid" item 8: read.md, ~150
- F/an-implementation-runs-on-a-branch-to-a-declared-end.md, "Drift" items 7 and 9: on-demand.md, ~100
- Total: read.md ~150; on-demand.md ~100

## 49. A `**Tags:**` line sits under the title, separated by a blank line, in the one form every record uses
- Owner: F/a-record-may-be-categorized-with-square-bracket-tags.md
- F/the-log-holds-one-file-per-entry-with-a-one-line-title.md, "Content" item 8: read.md, ~150
- F/a-log-entry-recording-an-engineers-decision-is-tagged-decision.md, "The tag" items 1-2: on-demand.md, ~130
- F/a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved.md, "The tag" items 1-2: on-demand.md, ~230
- Total: read.md ~150; on-demand.md ~360

## 50. A test file's context nesting mirrors its folder path under `test/automated/`
- Owner: T/test-context-nesting-mirrors-the-folder-hierarchy.md
- T/a-high-level-context-names-a-behavior-never-a-method.md, "Where the root test sits" item 5: read.md, ~140
- D/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md, item 9: on-demand.md, ~110
- Total: read.md ~140; on-demand.md ~110

## 51. A new local rule goes in `waytide/local/rules/` with a log entry
- Owner: F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Recording a new local rule" items 1-2
- F/ask-at-once-when-the-engineer-expresses-a-preference.md, candidates item 3: read.md, ~80
- F/a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store.md, item 5: read.md, ~55
- Total: read.md ~135; on-demand.md 0

## 52. Tests stay unnamed until the feature's close, then are named one outcome at a time
- Owner: D/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md, items 15-19
- D/advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work.md, items 7-9: read.md, ~120
- D/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md, items 16 and 20: on-demand.md, ~170
- Total: read.md ~120; on-demand.md ~170

## 53. A work session record's title and directory
- Owner: F/the-work-sessions-directory-holds-one-record-per-work-session.md
- system/foundation/vocabulary.md, Substitutions item 3, second half (title form and directory): read.md, ~120
- Total: read.md ~120; on-demand.md 0

## 54. Reduce resolution rather than falsify when removing a disclosure
- Owner: F/disclosure-is-the-one-reason-to-edit-a-historical-record.md, "Reduce resolution rather than falsify"
- F/a-project-does-not-name-its-downstream-consumers-in-its-own-files.md, "What it does not reach" item 7: read.md, ~100
- Total: read.md ~100; on-demand.md 0

## 55. The efferent test is a cradle that holds the implementation in position without gripping it rigid
- Owner: system/design-by-efferent/vocabulary.md, `cradle`
- D/dbe-is-a-design-tool-not-a-testing-ritual.md, item 13: read.md, ~100
- Total: read.md ~100; on-demand.md 0

## 56. Ordinary vocabulary is not reserved and not rewritten, and the test is what the word names
- Owner: L/ete/ordinary-vocabulary-is-not-reserved-and-not-rewritten.md
- F/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md, "Every word" item 6 second sentence: read.md, ~100
- L/ete/a-word-is-reserved-in-six-steps.md, items 11-12: on-demand.md, ~210
- Total: read.md ~100; on-demand.md ~210

## 57. Number a list whose entries the engineer may refer back to
- Owner: L/an-answer-is-a-list-and-prose-must-justify-itself.md, "Dependent reasoning" items 3-4
- L/communicate-plainly-and-name-the-actual-thing.md, item 7: read.md, ~100
- Total: read.md ~100; on-demand.md 0

## 58. A hinge is a decision that is subtle and load-bearing
- Owner: system/design-by-efferent/vocabulary.md, `hinge`
- D/the-human-deliberates-the-hinges-never-the-pass-fail-bar.md, item 2: read.md, ~95
- Total: read.md ~95; on-demand.md 0

## 59. A domain-specific substitution lives in its own package's vocabulary
- Owner: F/a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.md, opening item 8
- system/language/vocabulary.md, Substitutions item 3: read.md, ~95
- Total: read.md ~95; on-demand.md 0

## 60. A test file actuates its concern once, at the top of the feature context
- Owner: T/a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context.md
- T/a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables.md, item 12: read.md, ~90
- T/a-features-normal-path-and-its-exceptional-paths-are-separate-test-files.md, items 4-5: on-demand.md, ~160
- Total: read.md ~90; on-demand.md ~160

## 61. A predicate method's context is its name followed by "Predicate"
- Owner: T/a-predicate-methods-test-context-is-its-name-followed-by-the-word-predicate.md
- T/a-high-level-context-names-a-behavior-never-a-method.md, "firm at the top" item 5: read.md, ~80
- Total: read.md ~80; on-demand.md 0

## 62. A journal entry is not edited; only a writer-directed change or disclosure reaches it, and the footer keeps only `Authored by`
- Owner: J/an-entry-is-the-writers-words.md, items 15-24
- system/journal/vocabulary.md, `journal entry` (write once, do not edit, a later thought is a later entry): read.md, ~70
- J/the-journal-is-the-record-the-writer-keeps.md, "Footer" items 2-6: on-demand.md, ~330
- Total: read.md ~70; on-demand.md ~330

## 63. The five hinges, in order: actuation, observation, controls, implementation, naming
- Owner: D/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md
- local/rules/2026-08-23T08-18-00Z-design-by-efferent-does-not-govern-content-work.md, "Content work" item 4: read.md, ~70
- D/the-design-of-a-test-waits-at-the-hinges-coverage-included.md, item 1: on-demand.md, ~75
- D/the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert.md, items 24-26: on-demand.md, ~200
- Total: read.md ~70; on-demand.md ~275

## 64. A test of existing behavior is coverage, not design; an uncontested test is expected there; never break an implementation to introduce a test
- Owner: D/tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation.md
- system/testing/vocabulary.md, `uncontested` item 11 (coverage, not design): read.md, ~50
- D/a-test-of-behavior-that-already-exists-is-coverage-not-design.md, items 2-3, 7-8, 10: on-demand.md, ~410
- D/the-design-of-a-test-waits-at-the-hinges-coverage-included.md, item 10: on-demand.md, ~120
- D/at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor.md, "The cycle is for the first implementation" item 2: on-demand.md, ~120
- Total: read.md ~50; on-demand.md ~650

## Restated only in on-demand.md

## 65. The two-option floor: a lone candidate is shown with `Explain` as the second option, and no candidate is searched for or manufactured to reach two
- Owner: F/present-every-prompt-to-the-engineer-through-the-selection-ui.md, items 22-26
- D/the-actuation-gate-offers-candidate-actuations-as-options.md, item 11: on-demand.md, ~170
- D/the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming.md, items 24 and 32-36: on-demand.md, ~560
- D/at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor.md, "The second candidate is real" items 1-5: on-demand.md, ~445
- Total: read.md 0; on-demand.md ~1,175

## 66. An unattended cycle in a loop record carries hinge and reasoned decision, no Options or Decision / chat line; "none — no gate" marks only a skipped attended gate
- Owner: D/a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature.md, "Format" items 3-4 and 8-13
- D/attended-or-unattended-is-chosen-when-the-work-is-started.md, items 21-27: on-demand.md, ~680
- Total: read.md 0; on-demand.md ~680

## 67. A record with a state line ends its filename with the state word in upper case
- Owner: F/a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case.md
- F/dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not.md, "Format" items 6-9: on-demand.md, ~305
- F/an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes.md, `-STATED` in two places: on-demand.md, ~50
- F/the-items-directory-holds-one-file-per-item.md, item 3: on-demand.md, ~40
- F/the-implementations-directory-holds-one-record-per-implementation.md, "The state" item 9: on-demand.md, ~170
- Total: read.md 0; on-demand.md ~565

## 68. A journal entry's commit subject is `Journal: <subject>`, truncated at the 50th character with an ellipsis, never split or reworded
- Owner: J/the-journal-is-the-record-the-writer-keeps.md, "Committing"
- G/a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72.md, "When the subject will not fit" items 7-11 and "What still governs" item 9: on-demand.md, ~550
- Total: read.md 0; on-demand.md ~550

## 69. A commit subject is the software, stated as a fact in passive voice and indicative mood, never led by a verb
- Owner: G/write-subject-first-commit-messages.md
- G/a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72.md, "What still governs" items 2-3 and 7: on-demand.md, ~185
- F/rules-may-establish-a-mindset-rather-than-a-mechanic.md, items 7-8: on-demand.md, ~250
- Total: read.md 0; on-demand.md ~435

## 70. The layout of `waytide/local/`: `logs/` (`log/`, `loops/`, `work-sessions/`) and `items/`, `implementations/`, `migration/`
- Owner: F/the-logs-directory-holds-the-contemporaneous-historical-records.md (for `logs/`), with F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Rules and work artifacts" item 3
- F/a-status-report-prints-a-fixed-whole-project-report.md, items 15-16: on-demand.md, ~230
- F/dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not.md, "What takes the prefix" items 2-3: on-demand.md, ~200
- Total: read.md 0; on-demand.md ~430

## 71. Reconcile a design against the records; never regenerate it from them
- Owner: system/foundation/vocabulary.md, `reconcile`
- F/the-items-directory-holds-one-file-per-item.md, items 56-57: on-demand.md, ~100
- F/the-work-sessions-directory-holds-one-record-per-work-session.md, reconcile items 11-12: on-demand.md, ~280
- Total: read.md 0; on-demand.md ~380

## 72. `logs/loops/` belongs to design-by-efferent, which includes foundation; foundation's naming of it is only a citation and requires nothing there
- Owner: F/the-logs-directory-holds-the-contemporaneous-historical-records.md, "The grouping crosses a package boundary"
- F/the-implementations-directory-holds-one-record-per-implementation.md, "It is the lifecycle record" items 4-6: on-demand.md, ~280
- Total: read.md 0; on-demand.md ~280

## 73. Removing a rule reconciles what cites it (Related: lists, README summary)
- Owner: F/a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory.md, "Removing a rule" items 1-2 and 5
- F/a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved.md, "What the entry carries" items 3-4: on-demand.md, ~230
- Total: read.md 0; on-demand.md ~230

## 74. The context-only-test warning, which is never given for a leading `When ...` context
- Owner: T/a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables.md, items 15-24
- T/an-error-test-is-named-fails-and-its-condition-is-a-context.md, item 8: on-demand.md, ~220
- Total: read.md 0; on-demand.md ~220

## 75. An unattended plan is a list (ordered where steps depend, bulleted where independent) in ETE: short sentences, active voice, no semicolon
- Owners: L/an-answer-is-a-list-and-prose-must-justify-itself.md (list form); L/ete/waytide-prose-conforms-to-the-ste-writing-rules.md (writing rules)
- D/attended-or-unattended-is-chosen-when-the-work-is-started.md, plan items 3-5 and 8-9: on-demand.md, ~220
- Total: read.md 0; on-demand.md ~220

## 76. The subject stops at 50 characters and the body wraps at 72; split the commit when the subject will not fit
- Owner: G/a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72.md
- G/write-subject-first-commit-messages.md, items 15-17: on-demand.md, ~200
- Total: read.md 0; on-demand.md ~200

## 77. The context hierarchy is rendered as an indented two-level tree and stops at two levels
- Owner: F/a-status-report-prints-a-fixed-whole-project-report.md, items 26-29
- T/a-test-report-classifies-the-suite-and-prints-its-context-hierarchy.md, section 6 items 1-3: on-demand.md, ~170
- Total: read.md 0; on-demand.md ~170

## 78. The confirmations an implementation record carries (working location, attended or unattended, worktree added, branch deletion)
- Owner: F/the-implementations-directory-holds-one-record-per-implementation.md, "The record" items 9-12
- F/a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged.md, "What is not logged" item 2: on-demand.md, ~160
- Total: read.md 0; on-demand.md ~160

## 79. The writer's words are cleaned up lightly: meaning and emphasis preserved, grammar and flow corrected, no fact invented
- Owner: J/an-entry-is-the-writers-words.md, items 4-7
- J/journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry.md, "Entry format" items 2-5: on-demand.md, ~150
- Total: read.md 0; on-demand.md ~150

## 80. A feature with several cases takes a folder, each file named for the case it distinguishes
- Owner: T/a-feature-with-one-case-has-one-test-file-named-for-the-feature.md
- T/a-features-normal-path-and-its-exceptional-paths-are-separate-test-files.md, items 8-9: on-demand.md, ~150
- Total: read.md 0; on-demand.md ~150

## 81. Every prompt goes through the selection UI, never as a prose question
- Owner: F/present-every-prompt-to-the-engineer-through-the-selection-ui.md, items 1-3
- F/the-work-sessions-directory-holds-one-record-per-work-session.md, item 15: on-demand.md, ~140
- Total: read.md 0; on-demand.md ~140

## 82. A projection reads records without destroying them, and is regenerated, not maintained
- Owner: system/foundation/vocabulary.md, `projection`
- J/a-timeline-view-lists-every-journal-entry-by-its-datetime.md, item 15: on-demand.md, ~140
- Total: read.md 0; on-demand.md ~140

## 83. "Is" begins a test name only for a value-equals-comparator assertion
- Owner: T/start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion.md
- T/an-error-test-is-named-fails-and-its-condition-is-a-context.md, item 7: on-demand.md, ~130
- Total: read.md 0; on-demand.md ~130

## 84. An item takes a log entry on creation and at each change of state
- Owner: F/a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state.md (which says the items rule "keeps no second copy")
- F/the-items-directory-holds-one-file-per-item.md, items 6 and 44: on-demand.md, ~115
- Total: read.md 0; on-demand.md ~115

## 85. A sentence naming what work is blocked on, including the precondition form, is an offer and is forbidden
- Owner: F/work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported.md, "A pending state named is the same offer"
- F/an-implementation-runs-on-a-branch-to-a-declared-end.md, "The agent never raises the end" item 2: on-demand.md, ~110
- (The local publish rule's precondition clause is counted under entry 11.)
- Total: read.md 0; on-demand.md ~110

## 86. Try an STE category first, and use an ETE category only where none holds the word
- Owner: L/ete/a-word-is-reserved-in-six-steps.md, items 16-19
- L/ete/ete-declares-its-own-categories.md, "Applying the categories" items 4-5: on-demand.md, ~75
- Total: read.md 0; on-demand.md ~75

## Note: repetition inside one rule (not counted in the totals)
- D/advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work.md: items 13-18 restate items 1-11 (one outcome at a time, stop at each hinge, unattended does not stop, never several test files, candidate names through the selection UI). read.md, ~500.
- F/work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported.md: item 9 and "What this does not forbid" items 6-7 state the same allowance. read.md, ~150.
- L/ete/ete-fixes-the-meaning-of-a-word-in-its-category.md: items 17-19 restate items 13-15. on-demand.md, ~200.

Total characters restated in read.md outside each instruction's owning rule: ~19,970
Total characters restated in on-demand.md outside each instruction's owning rule: ~15,540
