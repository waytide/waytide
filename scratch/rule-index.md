# Index of the rules

Every rule Waytide holds, by package, with the name it is cited by and when it loads. **Pre-loaded** rules are printed in full at session start. **On-demand** rules load when their trigger comes up.

**112 package rules: 48 pre-loaded and 64 on-demand**, and 6 local rules, all pre-loaded.

## foundation

| # | Rule | Name | Loads | Trigger |
|---|---|---|---|---|
| 1 | A date in a record's title is written as the day, the date, and the 24-hour time | `a-date-in-a-records-title-is-written-as-the-day-the-date-and-the-24-hour-time` | on-demand | When writing a date into a working-state record's title |
| 2 | A design section documenting a package dependency is titled "Package Dependency" | `a-design-section-documenting-a-package-dependency-is-titled-package-dependency` | on-demand | When writing a section of a [design] item that documents a dependency on a package |
| 3 | A log entry is written for an implementation record, and the concluding entry depends on whether the work merged | `a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged` | on-demand | When creating an implementation record, or changing its **State:** line |
| 4 | A log entry is written for an item on creation, on each settled resolution, and on a change of state | `a-log-entry-is-written-for-an-item-on-creation-on-each-settled-resolution-and-on-a-change-of-state` | on-demand | When creating an item, adding a dated Settled resolution to it, changing its **State:** line, or closing a work session with a reconciliation |
| 5 | A log entry recording an engineer's decision is tagged `[decision]` | `a-log-entry-recording-an-engineers-decision-is-tagged-decision` | on-demand | When writing a log entry that records a decision |
| 6 | A package's vocabulary holds its terms, and the most specific one decides | `a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides` | pre-loaded |  |
| 7 | A paragraph is one line, and the reader's editor wraps it | `a-paragraph-is-one-line-and-the-readers-editor-wraps-it` | pre-loaded |  |
| 8 | When an implementation's phase starts, its goal is stated, and the phases are listed with the current one marked | `a-phase-starts-by-stating-its-goal` | on-demand | When starting a phase of an experiment or a feature |
| 9 | A printed list of records is formatted as a table or as a list of rows | `a-printed-list-of-records-is-formatted-as-a-table-or-as-a-list-of-rows` | on-demand | When the engineer asks for a list of records |
| 10 | A project declares which installed packages are active | `a-project-declares-which-installed-packages-are-active` | pre-loaded |  |
| 11 | A project does not name its downstream consumers in its own files | `a-project-does-not-name-its-downstream-consumers-in-its-own-files` | pre-loaded |  |
| 12 | A project's binding rules are recorded in its packages and its local rules directory | `a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory` | pre-loaded |  |
| 13 | A project's durable context is recorded in its committed artifacts, never in an agent memory store | `a-projects-durable-context-is-recorded-in-its-committed-artifacts-never-in-an-agent-memory-store` | pre-loaded |  |
| 14 | A record carrying a state line ends its filename with the state in upper case | `a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case` | on-demand | When creating, renaming, changing the state of, or referencing an item or implementation record |
| 15 | A record may be tagged with square-bracket tags | `a-record-may-be-categorized-with-square-bracket-tags` | on-demand | When adding a tag to a record or a list item |
| 16 | A rule's compressed text is written in its source, checked against it, and its figures recorded below the body | `a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body` | on-demand | When editing a source rule's body, or writing, revising, or checking a rule's compressed text |
| 17 | A status report prints a fixed whole-project report | `a-status-report-prints-a-fixed-whole-project-report` | on-demand | When the engineer asks for a status report, or when giving any summary of where the project stands |
| 18 | A suspension is a log entry tagged `[suspended]`, and nothing is moved | `a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved` | on-demand | When the project stops doing something, such as removing a rule, procedure, or report |
| 19 | A time value carries minutes and seconds | `a-time-value-carries-minutes-and-seconds` | pre-loaded |  |
| 20 | A vocabulary entry says what a term means, not what it was or where to read more | `a-vocabulary-entry-says-what-a-term-means-not-what-it-was-or-where-to-read-more` | on-demand | When writing or revising an entry in a vocabulary.md file |
| 21 | An implementation runs on a branch to a declared end | `an-implementation-runs-on-a-branch-to-a-declared-end` | on-demand | When starting, working within, adding a worktree to, suspending, or concluding an experiment or feature implementation |
| 22 | An item that sequences work contains no code samples | `an-item-that-sequences-work-contains-no-code-samples` | on-demand | When writing or revising an item in waytide/local/items/ that sequences work |
| 23 | An observation is a working hypothesis whose one state, Recorded, never changes | `an-observation-is-a-working-hypothesis-whose-one-state-recorded-never-changes` | on-demand | When recording, revising, or promoting an observation in waytide/local/items/ |
| 24 | Ask at once when the engineer expresses a preference | `ask-at-once-when-the-engineer-expresses-a-preference` | pre-loaded |  |
| 25 | Dated artifacts are prefixed with an ISO 8601 UTC datetime, and system rules are not | `dated-artifacts-are-prefixed-with-an-iso-8601-utc-datetime-and-system-rules-are-not` | on-demand | When creating and naming a new file under waytide/local/ or a new rule file in a package |
| 26 | Disclosure is the one reason to edit a historical record | `disclosure-is-the-one-reason-to-edit-a-historical-record` | on-demand | When about to edit a historical record (a log entry, work session record, implementation record, or completed migration record), or when the engineer says a record discloses something it should not |
| 27 | Present every prompt to the engineer through the selection UI | `present-every-prompt-to-the-engineer-through-the-selection-ui` | pre-loaded |  |
| 28 | Record a rule's authorship in a provenance footer | `record-a-rules-authorship-in-a-provenance-footer` | on-demand | When authoring a new rule file or changing an existing one |
| 29 | Rules may establish a mindset rather than a mechanic | `rules-may-establish-a-mindset-rather-than-a-mechanic` | on-demand | When writing, evaluating, placing, or reconciling conflicting rules |
| 30 | The harness announces Waytide's installation, and the agent never prints the notice | `the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice` | pre-loaded |  |
| 31 | The implementations directory holds one record per implementation | `the-implementations-directory-holds-one-record-per-implementation` | on-demand | When starting an experiment or feature, or writing or changing an implementation record |
| 32 | The items directory holds one file per item | `the-items-directory-holds-one-file-per-item` | on-demand | When creating an item, changing an item's state or content, or answering against what an item settled |
| 33 | The log holds one file per entry, with a one-line title | `the-log-holds-one-file-per-entry-with-a-one-line-title` | pre-loaded |  |
| 34 | The log records why work was abandoned, and never says undone work was done | `the-log-records-why-work-was-abandoned-and-never-says-undone-work-was-done` | on-demand | When writing a log entry, especially one recording abandoned work |
| 35 | The logs directory holds the contemporaneous, historical records | `the-logs-directory-holds-the-contemporaneous-historical-records` | on-demand | When writing a record under local/logs/ or deciding which directory a new kind of record belongs in |
| 36 | The migration directory holds the plans for moving or restructuring content | `the-migration-directory-holds-the-plans-for-moving-or-restructuring-content` | on-demand | When planning to move content across a repository boundary, to restructure, rename, or regroup a project's files, or to conform existing content to a changed norm or standard |
| 37 | The startup display prints once per session | `the-startup-display-prints-once-per-session` | on-demand | When the engineer types `load waytide`, or when changing the startup display or its script |
| 38 | The work-sessions directory holds one record per work session | `the-work-sessions-directory-holds-one-record-per-work-session` | on-demand | When a work session is closing, or the engineer asks for a work session record |
| 39 | When the work diverges from the plan, the work is definitive | `when-the-work-diverges-from-the-plan-the-work-is-definitive` | pre-loaded |  |
| 40 | Work in a downstream project is never offered, and its pending state is not reported | `work-in-a-downstream-project-is-never-offered-and-its-pending-state-is-not-reported` | pre-loaded |  |
| 41 | Working-state artifacts carry a provenance footer | `working-state-artifacts-carry-a-provenance-footer` | on-demand | When creating or changing a working-state document under waytide/ |

## design-by-efferent

| # | Rule | Name | Loads | Trigger |
|---|---|---|---|---|
| 1 | A loop record holds the cycles through the loop, one file per feature | `a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature` | on-demand | When writing a loop record for a feature under waytide/local/logs/loops/ |
| 2 | A test of behavior that already exists is coverage, not design | `a-test-of-behavior-that-already-exists-is-coverage-not-design` | on-demand | When an implementation hinge finds that the existing code already satisfies the test |
| 3 | Advance one outcome at a time, and stop at every gate in attended work | `advance-one-outcome-at-a-time-and-stop-at-every-gate-in-attended-work` | pre-loaded |  |
| 4 | After any implementation hinge, show the test output for the current feature | `after-any-implementation-hinge-show-the-test-output-for-the-current-feature` | on-demand | When an implementation is accepted at the implementation hinge |
| 5 | At the implementation hinge, the engineer chooses a direct implementation or red-green-refactor | `at-the-implementation-hinge-the-engineer-chooses-a-direct-implementation-or-red-green-refactor` | on-demand | When reaching the implementation hinge of an outcome |
| 6 | Attended or unattended is chosen when the work is started | `attended-or-unattended-is-chosen-when-the-work-is-started` | on-demand | When starting a feature or an experiment |
| 7 | DBE is a design tool, not a testing ritual | `dbe-is-a-design-tool-not-a-testing-ritual` | pre-loaded |  |
| 8 | Each hinge displays the actuation as its anchor, and the contexts once | `each-hinge-displays-the-actuation-as-its-anchor-and-the-contexts-once` | on-demand | When presenting a hinge to the engineer |
| 9 | TDD designs behavior, coverage prevents regression, and neither breaks an implementation | `tdd-designs-behavior-coverage-prevents-regression-and-neither-breaks-an-implementation` | pre-loaded |  |
| 10 | Test-first is the default, so never ask whether to start a task that way | `test-first-is-the-default-so-never-ask-whether-to-start-a-task-that-way` | pre-loaded |  |
| 11 | The actuation gate offers candidate actuations as options | `the-actuation-gate-offers-candidate-actuations-as-options` | on-demand | When presenting the actuation hinge of an outcome |
| 12 | The design of a test waits at the hinges, coverage included | `the-design-of-a-test-waits-at-the-hinges-coverage-included` | on-demand | When writing a test to cover behavior that already exists |
| 13 | The first DBE gate is the actuation and an unnamed assert | `the-first-dbe-gate-is-the-actuation-and-an-unnamed-assert` | on-demand | When starting a feature by writing its first test file |
| 14 | The hinge cycle is actuation, observation, controls, implementation, and naming | `the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming` | on-demand | When starting the DBE loop on an outcome, before the first hinge |
| 15 | The human deliberates the hinges, never the pass/fail bar | `the-human-deliberates-the-hinges-never-the-pass-fail-bar` | pre-loaded |  |

## git

| # | Rule | Name | Loads | Trigger |
|---|---|---|---|---|
| 1 | A commit message states that a task is done, never that it is marked done | `a-commit-message-states-that-a-task-is-done-never-that-it-is-marked-done` | pre-loaded |  |
| 2 | A commit message's subject stops at 50 characters and its body wraps at 72 | `a-commit-messages-subject-stops-at-50-characters-and-its-body-wraps-at-72` | on-demand | When writing a commit message |
| 3 | A commit's SHA refers to the work the commit carries | `a-commits-sha-refers-to-the-work-the-commit-carries` | on-demand | When the engineer gives a commit SHA |
| 4 | Announce a branch switch in a bordered block | `announce-a-branch-switch-in-a-bordered-block` | on-demand | When switching the working tree to another branch (including `git switch -c`) |
| 5 | Claude is not credited as a co-author of a commit | `claude-is-not-credited-as-a-co-author-of-a-commit` | on-demand | When creating a commit |
| 6 | Run the test suite after changes, before considering whether to commit | `run-the-test-suite-after-changes-before-considering-whether-to-commit` | pre-loaded |  |
| 7 | Write subject-first commit messages | `write-subject-first-commit-messages` | on-demand | When writing a commit message |

## journal

| # | Rule | Name | Loads | Trigger |
|---|---|---|---|---|
| 1 | A journal entry has a human-readable datetime line under its title | `a-journal-entry-has-a-human-readable-datetime-line-under-its-title` | on-demand | When writing a journal entry |
| 2 | A journal entry is read and never followed | `a-journal-entry-is-read-and-never-followed` | pre-loaded |  |
| 3 | A private journal is read only when the engineer commands it | `a-private-journal-is-read-only-on-command` | on-demand | When the engineer commands the private journal read (`Read private journal entries` or `Read private journal`) |
| 4 | A timeline view lists every journal entry by its datetime | `a-timeline-view-lists-every-journal-entry-by-its-datetime` | on-demand | When the writer asks for the journal timeline or a list of journal entries |
| 5 | An entry is the writer's words | `an-entry-is-the-writers-words` | pre-loaded |  |
| 6 | Journal entries are recorded in the writer's journal directory, one file per entry | `journal-entries-are-recorded-in-the-writers-journal-directory-one-file-per-entry` | on-demand | When writing a journal entry (including when the writer opens with "new entry") |
| 7 | `~/.local/share/waytide/journal/<project>/` — a private journal, kept outside the project | `private-journal-convention` | on-demand | When the writer starts a private journal entry, directs a change to one, or commands one moved to the shared journal |
| 8 | The journal is read at the start of a session, with the rules | `the-journal-is-read-at-the-start-of-a-session-with-the-rules` | pre-loaded |  |
| 9 | The journal is the record the writer keeps | `the-journal-is-the-record-the-writer-keeps` | on-demand | When writing, changing, or committing a journal entry |
| 10 | The writer's username is read from the environment, then the project, then the user's config file | `the-writers-username-is-read-from-the-environment-then-the-project-then-the-users-config-file` | on-demand | When resolving the active writer's username or display name (for a journal directory or any Waytide tool) |
| 11 | Where an entry carries no time, ask for one through the selection interface | `where-an-entry-carries-no-time-ask-for-one-through-the-selection-interface` | on-demand | When creating a journal entry for which the writer gave no time |
| 12 | Where an entry's body says the same thing as its title, keep the title alone | `where-an-entrys-body-says-the-same-thing-as-its-title-keep-the-title-alone` | on-demand | When drafting a journal entry |

## language

| # | Rule | Name | Loads | Trigger |
|---|---|---|---|---|
| 1 | A response is clarified twice before it is sent | `a-response-is-clarified-twice-before-it-is-sent` | pre-loaded |  |
| 2 | An answer is a list, and prose must justify itself | `an-answer-is-a-list-and-prose-must-justify-itself` | pre-loaded |  |
| 3 | Communicate plainly, and name the actual thing | `communicate-plainly-and-name-the-actual-thing` | pre-loaded |  |
| 4 | A word is reserved in six steps | `a-word-is-reserved-in-six-steps` | on-demand | When asked to reserve a word (e.g. "Waytide reserves the word, X") |
| 5 | ETE declares its own categories | `ete-declares-its-own-categories` | on-demand | When reserving a word or choosing a vocabulary category for a term |
| 6 | ETE fixes the meaning of a word in its category | `ete-fixes-the-meaning-of-a-word-in-its-category` | on-demand | When reserving a word as a technical noun or verb in a package's vocabulary.md, or writing that reservation's entry |
| 7 | Ordinary vocabulary is not reserved and not rewritten | `ordinary-vocabulary-is-not-reserved-and-not-rewritten` | pre-loaded |  |
| 8 | Waytide keeps its word where the STE word means something else | `waytide-keeps-its-word-where-the-ste-word-means-something-else` | pre-loaded |  |
| 9 | Waytide prose conforms to the STE writing rules | `waytide-prose-conforms-to-the-ste-writing-rules` | pre-loaded |  |
| 10 | Expand an abbreviation on first use | `expand-an-abbreviation-on-first-use` | pre-loaded |  |
| 11 | Language is used precisely here, and words are load-bearing | `language-is-used-precisely-here-and-words-are-load-bearing` | pre-loaded |  |
| 12 | Lead with a summary, then the details | `lead-with-a-summary-then-the-details` | pre-loaded |  |
| 13 | Name concepts literally, not by analogy, code, or jargon | `name-concepts-literally-not-by-analogy-code-or-jargon` | pre-loaded |  |
| 14 | No slang | `no-slang` | pre-loaded |  |
| 15 | Solubility is how readily a unit dissolves into the reader's understanding | `solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding` | pre-loaded |  |

## testing

| # | Rule | Name | Loads | Trigger |
|---|---|---|---|---|
| 1 | A context block is used for a test block only when the test's outcome needs local instrumentation or local variables | `a-context-block-is-used-for-a-test-block-only-when-the-tests-outcome-needs-local-instrumentation-or-local-variables` | pre-loaded |  |
| 2 | A control-built test value is prefixed with control_ | `a-control-built-test-value-is-prefixed-with-control` | pre-loaded |  |
| 3 | A control's string value starts with "some" | `a-controls-string-value-starts-with-some` | pre-loaded |  |
| 4 | A feature with one case has one test file, named for the feature | `a-feature-with-one-case-has-one-test-file-named-for-the-feature` | pre-loaded |  |
| 5 | A feature's normal path and its exceptional paths are separate test files | `a-features-normal-path-and-its-exceptional-paths-are-separate-test-files` | on-demand | When writing a test for a feature's exceptional (raising) path |
| 6 | A high-level context names a behavior, never a method | `a-high-level-context-names-a-behavior-never-a-method` | pre-loaded |  |
| 7 | A precondition documents the factors that decide a test's outcome, and its predicate reads inline | `a-precondition-documents-the-factors-that-decide-a-tests-outcome-and-its-predicate-reads-inline` | pre-loaded |  |
| 8 | A predicate method's test context is its name followed by the word "Predicate" | `a-predicate-methods-test-context-is-its-name-followed-by-the-word-predicate` | on-demand | When naming a test context for a ?-suffixed predicate method |
| 9 | A test actuates its concern once, and asserts each outcome in its own context | `a-test-actuates-its-concern-once-and-asserts-each-outcome-in-its-own-context` | pre-loaded |  |
| 10 | A test block holds only the assertion, and its values are declared in the enclosing context | `a-test-block-holds-only-the-assertion-and-its-values-are-declared-in-the-enclosing-context` | pre-loaded |  |
| 11 | A test file named with a leading underscore is suspended | `a-test-file-named-with-a-leading-underscore-is-suspended` | on-demand | When taking a test out of the suite, finding a failing test to set aside, or writing the code that selects a suite's test files |
| 12 | A test report classifies the suite and prints its context hierarchy | `a-test-report-classifies-the-suite-and-prints-its-context-hierarchy` | on-demand | When the user asks for a test report |
| 13 | An error test is named Fails, and its condition is a context | `an-error-test-is-named-fails-and-its-condition-is-a-context` | on-demand | When writing or naming a test that asserts an actuation raises an error or does not raise |
| 14 | Assert an error message only when it alone confirms the error | `assert-an-error-message-only-when-it-alone-confirms-the-error` | on-demand | When writing an `assert_raises` or deciding whether to assert an error's message |
| 15 | Do not test the platform | `do-not-test-the-platform` | pre-loaded |  |
| 16 | Start a test name with "Is" only for a value-equals-comparator assertion | `start-a-test-name-with-is-only-for-a-value-equals-comparator-assertion` | pre-loaded |  |
| 17 | Test context nesting mirrors the folder hierarchy | `test-context-nesting-mirrors-the-folder-hierarchy` | pre-loaded |  |
| 18 | Test values are controls, never factories, fixtures, or arrange | `test-values-are-controls-never-factories-fixtures-or-arrange` | pre-loaded |  |
| 19 | Tests are automated or interactive, and only the automated run before a commit | `tests-are-automated-or-interactive-and-only-the-automated-run-before-a-commit` | pre-loaded |  |
| 20 | The test tree command prints the suite's context tree | `the-test-tree-command-prints-the-suites-context-tree` | on-demand | When the user gives the command "test tree" |

## versioning

| # | Rule | Name | Loads | Trigger |
|---|---|---|---|---|
| 1 | A version is semver, optionally prefixed by a product generation number | `a-version-is-semver-optionally-prefixed-by-a-product-generation-number` | on-demand | When choosing, writing, or proposing a package version or cutting a release |
| 2 | The next version is put to the engineer, never decided by the agent | `the-next-version-is-put-to-the-engineer-never-decided-by-the-agent` | on-demand | When cutting a release or determining the next version of a package |

## This project's local rules

| # | Rule | File | Loads |
|---|---|---|---|
| 1 | A shell script is self-executable — the executable bit is set and the file opens with a shebang | `2026-08-04T17-34-48Z-shell-scripts-are-self-executable.md` | pre-loaded |
| 2 | A package is published from `master`, and a publish is never offered from an experiment or a feature | `2026-08-12T17-52-06Z-a-package-is-published-from-master.md` | pre-loaded |
| 3 | Design By Efferent does not govern content work in this project | `2026-08-23T08-18-00Z-design-by-efferent-does-not-govern-content-work.md` | pre-loaded |
| 4 | The `README.md` is written for the uninitiated, and it is figurative where that serves them | `2026-08-24T21-19-19Z-the-readme-is-figurative-for-the-uninitiated.md` | pre-loaded |
| 5 | The source is compiled before a package is published | `2026-10-14T20-43-51Z-the-source-is-compiled-before-a-package-is-published.md` | pre-loaded |
| 6 | A citation of another package's rule is not a dependency unless the rule will not work without it | `2026-10-15T04-08-35Z-a-citation-is-not-a-dependency.md` | pre-loaded |

---

Authored by Scott Bellware on Fri Oct 30 2026 at 1:01:41 AM PT
