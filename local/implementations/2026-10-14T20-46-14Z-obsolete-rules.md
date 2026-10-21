# Experiment — Obsolete rules

**Tags:** [experiment]

## Question

**As the engineer stated it:** Find and remove stale, obsolete, or impertinent rules, as well as rules that exist only for historical reference.

**Can the rule corpus lose its stale, obsolete, impertinent, and history-only rules, and sessions still follow what remains?** Four kinds are named:

- **Stale** — a rule whose content no longer matches the system: it describes a file, a directory, a script, or a behavior that has changed.
- **Obsolete** — a rule that governs something that no longer exists: a retired mechanism, directory, or package.
- **Impertinent** — a rule that does not bear on the work an agent does in a session, or does not belong in the package it sits in.
- **History-only** — a rule whose content is a record of how something came about, with no directive an agent acts on.

**What is removed is a whole rule.** A stale passage inside a rule that otherwise stands is a different question, and is noted where it is found rather than fixed here.

## Setup

- **Tags:** [experiment]
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/obsolete-rules`
- **Base:** `1be591d826ef3cfd9984a3a9b865aa6eaae15253`, from `master`
- **Working location:** branch only, chosen at the start.
- **Participation:** attended, chosen at the start.
- **Reads:** the 108 source rules in the seven packages, and the four local rules in `local/rules/`.

## Forecast

Committed before the work. Each item carries the agent's confidence.

1. **Few whole rules qualify — fewer than ten of the 112.** Most of what is stale sits in passages inside rules that otherwise stand, as the derived-rule-files experiment found for history. *Moderate confidence.*
2. **The candidates concentrate in `foundation`, around retired mechanisms:** the mode mechanism, the deferred queue, and the `observations/` directory, which no longer exists. *Moderate confidence.*
3. **Every rule removed is cited by at least one other rule**, in its body or its `Related:` list, so each removal needs those citations reconciled. *High confidence.*
4. **Stale and obsolete can be shown from the files** — a rule naming a directory, script, or mechanism that is not there. **Impertinent cannot**, and it is the kind that needs the engineer's judgment rule by rule. *Moderate confidence.*
5. **The compiled read shrinks by less than 10%.** *Moderate confidence.*
6. **At least one rule judged obsolete is still read by a script** — `session-start.sh`, `install.sh`, or another — so removing it would break something no test covers. *Low confidence.*

## Confirmations

| Confirmation | Decision | When |
|---|---|---|
| Working location | Branch only | Wed Oct 14 2026 at 1:46:14 PM PT |
| Participation | Attended | Wed Oct 14 2026 at 1:46:14 PM PT |
| Remove show-the-test-after-implementing | Remove | Wed Oct 14 2026 at 8:55:19 PM PT |
| rules-establish-a-mindset-purpose-over-category | Keep — not a candidate | Wed Oct 14 2026 at 9:01:00 PM PT |
| package-dependency-heading | Keep — not a candidate | Wed Oct 14 2026 at 9:04:54 PM PT |
| dbe-human-in-the-loop | Keep — not a candidate | Wed Oct 14 2026 at 9:06:08 PM PT |
| a-citation-is-not-a-dependency | Move to `local/rules/` | Wed Oct 14 2026 at 9:08:54 PM PT |
| Scope widened to stale passages, decided one at a time | Widen | Wed Oct 14 2026 at 10:25:35 PM PT |
| Passage 1 — words taken back | Correct | Wed Oct 14 2026 at 10:28:48 PM PT |
| Passage 2 — experiment and feature record | Correct | Wed Oct 14 2026 at 10:29:41 PM PT |
| Passage 3 — the only reserved tag | Correct, dropping 'the only one' | Wed Oct 14 2026 at 10:30:23 PM PT |
| Passage 4 — the ideas rule names no entry | Correct | Wed Oct 14 2026 at 10:32:07 PM PT |
| Passage 5 — state changes that take an entry | Correct | Wed Oct 14 2026 at 10:32:53 PM PT |
| Passage 6 — garbled Related line | Correct | Wed Oct 14 2026 at 10:33:23 PM PT |
| Passage 7 — the notice's open-work line | Correct | Wed Oct 14 2026 at 10:34:47 PM PT |
| Passage 8 — sixteen records on master | Correct | Wed Oct 14 2026 at 10:35:39 PM PT |
| Passage 9 — the deferred rule | Correct | Wed Oct 14 2026 at 10:38:41 PM PT |
| Passage 10 — vocabulary counts | Correct | Thu Oct 15 2026 at 1:17:16 PM PT |
| Passage 11 — the footer's time form | Correct | Thu Oct 15 2026 at 1:19:52 PM PT |
| Passage 12 — shortened rule names | Leave — not stale | Thu Oct 15 2026 at 4:45:47 PM PT |
| Passage 13 — the Word Substitutions rule | Correct | Thu Oct 15 2026 at 4:46:47 PM PT |
| Passage 14 — the assert-raises rule | Correct | Thu Oct 15 2026 at 4:49:18 PM PT |
| Passage 15 — the import-define-audit | Correct | Thu Oct 15 2026 at 10:15:17 PM PT |
| Passage 16 — a suspended rule that no longer exists | Correct | Thu Oct 15 2026 at 10:16:13 PM PT |
| Passage 17 — decision-log-format conventions | Correct | Mon Oct 19 2026 at 3:35:00 PM PT |
| Passage 18 — tools/ruby-lang | Correct | Tue Oct 20 2026 at 11:18:37 AM PT |
| Passage 19 — ~/.claude/CLAUDE.md | Correct | Tue Oct 20 2026 at 11:19:33 AM PT |
| Passage 20 — version-scheme's Ruby pointer | Correct | Tue Oct 20 2026 at 11:20:41 AM PT |
| Passage 21 — the footer rule's lists | Correct | Tue Oct 20 2026 at 11:22:01 AM PT |
| Passage 22 — deferred items in the file-names rule | Correct | Tue Oct 20 2026 at 11:23:55 AM PT |
| Passage 23 — the removed unclaimed-words check | Correct | Tue Oct 20 2026 at 11:51:09 AM PT |
| Passage 24 — word counts | Date them | Tue Oct 20 2026 at 11:55:11 AM PT |
| Passage 25 — three words reserved | Drop the count, keep one example | Tue Oct 20 2026 at 12:11:48 PM PT |
| Passage 26 — experiment and feature record in ETE | Correct | Tue Oct 20 2026 at 12:12:36 PM PT |
| Passage 27 — plans and deferred items | Leave — not stale | Tue Oct 20 2026 at 12:14:38 PM PT |
| Passage 28 — the individual substitution rules | Correct | Tue Oct 20 2026 at 12:16:02 PM PT |
| Passage 29 — the composite's test state | Correct | Tue Oct 20 2026 at 12:25:33 PM PT |
| Passage 30 — arrange | Correct | Tue Oct 20 2026 at 12:26:52 PM PT |
| Passage 31 — the solubility gate | Correct | Tue Oct 20 2026 at 12:27:37 PM PT |
| Passage 32 — the three-stop list | Correct | Tue Oct 20 2026 at 12:28:14 PM PT |
| Passage 33 — damaged text | Correct | Tue Oct 20 2026 at 12:38:31 PM PT |
| Passage 34 — split Related entries | Correct | Tue Oct 20 2026 at 12:39:25 PM PT |
| Passage 35 — folder framing | Correct | Tue Oct 20 2026 at 12:49:37 PM PT |
| Passage 36 — design doc | Correct | Tue Oct 20 2026 at 12:50:38 PM PT |
| Passage 37 — step 2 | Correct, with the unattended exception | Tue Oct 20 2026 at 8:34:03 PM PT |
| Passage 38 — the first-turn rule | Correct | Tue Oct 20 2026 at 8:35:02 PM PT |
| Passage 39 — stop and wait under unattended work | Correct, one outcome at a time in both modes | Tue Oct 20 2026 at 8:37:04 PM PT |
| Passage 40 — a misattributed argument | Correct | Tue Oct 20 2026 at 8:45:35 PM PT |

## What actually happened

### The survey — 2026-10-14

**Five agents read all 113 rules against the four kinds**, each to one brief, checking every claim that something no longer exists against the repository and listing what cites each candidate. The local rules number five, not four: the-source-is-compiled-before-a-package-is-published was added the same day.

**Five rules are candidates.**

| rule | package | kind | confidence | a live directive lost on removal |
|---|---|---|---|---|
| show-the-test-after-implementing | design-by-efferent | stale — superseded by what-each-hinge-displays and show-feature-test-output-after-implementation-hinge | moderate | none found |
| rules-establish-a-mindset-purpose-over-category | foundation | stale — framed on rule folders that no longer exist | moderate | judge a stance rule by the mindset it produces, and reconcile conflicts at the level of purpose |
| package-dependency-heading | foundation | impertinent — one heading's wording for a "design doc" no other rule uses | low to moderate | title the section "Package Dependency" |
| dbe-human-in-the-loop | design-by-efferent | stale — the two-hinge loop, superseded by hinge-cycle and in conflict with it on when the test file is shown | low | never make the human wait at a red or green bar; exit on solubility, not coverage; the division of labor |
| a-citation-is-not-a-dependency | foundation | impertinent — governs package authoring, shipped to every consuming project | low | the citation-or-dependency test, and where a dependency is declared |

**Rules holding stale passages, not candidates:** about 40, across every package. The kinds that recur:

- **The retired deferred queue,** still named in seven rules — among them project-context-lives-in-the-committed-artifacts, working-state-artifacts-carry-a-provenance-footer, status-report-format, file-names-use-iso8601-utc-prefix, decision-log-convention, and communicate-plainly-name-the-thing.
- **Citations by names that match no file:** "the file-names rule", "the decision-log rule", "the observations rule", "the folder-mirroring rule", "the Word Substitutions rule", "the assert-raises rule", "the import-define-audit", and a suspended rule that no longer exists.
- **Counts that have drifted:** vocabularies (five, where there are six), implementation records (sixteen, where there are 22), reserved words (three, where there are six), scripts (thirteen, where there are 19), and word frequencies.
- **Rules that contradict another rule:** a-suspension-is-a-log-entry's one reserved tag, an-idea-takes-a-log-entry on the ideas-convention, tests-are-automated-or-interactive on itself, tdd-test-structure's "arrange", and the two-gate loop still named in show-feature-test-output-after-implementation-hinge and one-outcome-at-a-time-name-via-options.
- **Damaged text:** tdd-designs-coverage-prevents-never-break-implementation's repeated "regression", and `Related:` lists that split one rule's name across two items.
- **A removed script still relied on:** ordinary-vocabulary-is-not-reserved-and-not-rewritten's unclaimed-words check, deleted on 2026-08-13; and the local shell-scripts-are-self-executable rule's two removed scripts.

**What the survey says of the forecast so far.** Item 1 holds: five candidates, fewer than ten. Item 2 does not: no candidate governs a retired mechanism; the retired mechanisms survive only as passages, and the candidates divide between foundation and design-by-efferent. Item 3 holds for four of the five: every candidate but package-dependency-heading is cited by another rule. Item 4 holds: the two impertinent candidates are the two the agents were least sure of.

### The candidates, decided one at a time — 2026-10-14

**show-the-test-after-implementing is removed**, by the engineer's decision. Its directive is carried whole by what-each-hinge-displays, and its "solubility gate" belongs to the two-gate loop the five hinges replaced. Four rules cited it. what-each-hinge-displays and show-feature-test-output-after-implementation-hinge now cite the remaining rule in its place, hinge-cycle drops it from `Related:`, and git's run-suite-before-commit points to what-each-hinge-displays instead. No script, README, or bootstrap named it. The compiled read loses 1,722 characters.

**rules-establish-a-mindset-purpose-over-category is kept, and is not a candidate.** Only its framing is stale: it is written around rule folders — `terminology/`, `methodology/`, `test-writing/`, `code/` — that packages replaced. Its claim and its four directives stand, and the rules-convention's bullet carries only part of them. By the experiment's own definition, a rule that stands with a stale passage is not removed. The framing is noted with the other stale passages.

**package-dependency-heading is kept, and is not a candidate.** The survey judged it impertinent, governing a kind of document Waytide no longer defines, and the agent repeated that when presenting it. The engineer asked whether a design tag did not exist. It does: a design is an idea tagged `[design]`, per the ideas-convention, and this repository holds eleven. The rule therefore governs something that exists. Its "design doc" wording is a stale passage — its sibling plans-no-code-samples was reconciled to ideas and it was not — and is noted with the others. None of the eleven `[design]` ideas yet has a package-dependency section.

**dbe-human-in-the-loop is kept, and is not a candidate.** Its directives are live in every session and stated nowhere else as plainly: never make the engineer wait at a red or green bar, never ask for a pass or fail to be confirmed, exit on solubility rather than coverage, keep turns small, and the division of labor. What is stale is its two-hinge framing, and its step 2, which has the whole test file written before the actuation is deliberated, where hinge-cycle and the first-turn rule settle the three test hinges first. Both are noted as stale passages.

**a-citation-is-not-a-dependency moves from `foundation` to a local rule of this repository**, `local/rules/2026-10-15T04-08-35Z-a-citation-is-not-a-dependency.md`, by the engineer's decision. It governs writing packages, which happens here: every package but `ext/ruby-lang` is written in this repository, and `waytide-ruby`, where that one is written, installs no Waytide. As a local rule it is read in every session here and shipped nowhere. A `foundation` rule cannot cite it, since the citation would point at nothing in another project, so logs-directory and implementations-convention keep their reasoning in their own words without the reference, a-project-does-not-name-its-consumers drops it from `Related:`, and the foundation README loses its paragraph on it. The moved rule keeps its footer and gains a paragraph saying why it is local. A project that installs `foundation` reads 3,992 characters less; this repository's read is unchanged, since it reads its local rules.

### The outcome — 2026-10-14

**One rule removed, one moved, three kept.** Of the five candidates, show-the-test-after-implementing was removed and a-citation-is-not-a-dependency moved to `local/rules/`. rules-establish-a-mindset-purpose-over-category, package-dependency-heading, and dbe-human-in-the-loop are kept as not candidates: each still carries a live directive, and what was stale in each is a passage. The engineer asked, of package-dependency-heading, whether a design tag did not exist; it does, and the survey's judgment of that rule as governing a retired kind of document was wrong.

**On the forecast, so far:**

- **Item 1 holds:** fewer than ten whole rules qualified — five candidates, and two acted on.
- **Item 2 is refuted:** no candidate governed a retired mechanism.
- **Item 3 holds:** every rule acted on was cited by others — four citations for the removed rule, three and the README for the moved one.
- **Item 4 holds:** whether a rule was impertinent was the engineer's judgment each time, and the survey's impertinence calls were the two it was least sure of.
- **Item 5 holds:** the compiled read shrinks by 1,722 characters here, and by 5,714 in a project that installs the packages.
- **Item 6 is refuted:** no candidate was read by a script.

**The larger finding is the stale passages.** About 40 rules carry one, against two whole rules acted on. They are listed in the survey section above.

### The deferred-queue passages, read again — 2026-10-14

**The survey overstated them.** The engineer asked whether the deferred queue is not now handled by the ideas. It is: the foundation vocabulary keeps *deferred* for an ordinary idea carrying a `**Waits for:**` line. The survey counted every use of the word as a reference to the retired queue. Read in its present meaning, the seven divide three ways.

- **Accurate as written:** project-context-lives-in-the-committed-artifacts ("Postponed work is a deferred item"), status-report-format (deferred items are not reported from memory), and communicate-plainly-name-the-thing.
- **Redundant in form:** working-state-artifacts-carry-a-provenance-footer and file-names-use-iso8601-utc-prefix list deferred items beside ideas as though they were a separate artifact. The entry duplicates one already present and directs nothing wrong.
- **Stale:** decision-log-convention's `Related:` names "the observations and deferred rules", and no deferred rule exists.
- **History, not a reference:** commit-message-widths' illustration of a commit naming "four separate deferred items".

The survey section above is left as written; this corrects it.

### The question is widened to passages — 2026-10-14

**The engineer judged the whole-rule limit too literal.** The limit was the agent's, written into the question when the record was created; the engineer's words asked for stale, obsolete, impertinent, and history-only rules, and the stale content found sits almost entirely in passages. The experiment now covers the stale passages the survey found.

**They are decided one at a time, by the engineer, without reviewing diffs.** Each is put with what it is, why it matters, what changes, and what effect the change has.

### The passages, decided one at a time — 2026-10-14

**1. a-record-ends-with-its-state-in-upper-case — corrected.** It named Realized and Deferred as the words taken back and renamed a reopened idea to `ACTIVE`. The ideas-convention takes back Realized, Deferred, and Open, returning the idea to Active or to Open. The rule now follows it: the file is renamed to the state the idea returns to.

**2. a-record-ends-with-its-state-in-upper-case — corrected.** It named "an experiment record, a feature record", two kinds merged into the implementation record. It now says an implementation record, whether an experiment or a feature, in its three places.

**3. a-suspension-is-a-log-entry — corrected.** It called `[suspended]` the only reserved tag, where the implementations-convention reserves `[experiment]` and `[feature]` and the observations rule makes `[observation]` decide what a record is. It now says only that `[suspended]` is a reserved tag.

**4. an-idea-takes-a-log-entry — corrected.** It said the ideas-convention names no log entry, which was why this rule was written. The ideas-convention now names it and points here. The sentence and its bold lead now say so.

**5. an-idea-takes-a-log-entry — corrected.** Its list of state changes that take an entry left out Open and Suspended, and named only Realized and Deferred as taken back. It now lists every state word the ideas-convention defines, and Realized, Deferred, and Open as the words taken back.

**6. an-idea-takes-a-log-entry — corrected.** A `Related:` line ended with words left from an earlier edit, "state words they carried". They are removed.

**7. announce-waytide-at-session-start — corrected.** Its example notice showed an experiments line and a features line, from before the two became one kind of record. The script prints one line, "N implementations open: …". The example and the sentences around it now show that line.

**8. implementation-records-take-a-log-entry — corrected.** It said every one of the project's sixteen implementation records was on `master`. There are 22, and this experiment's record has been on its branch alone. The sentence is dropped; the paragraph keeps its point that the rule does not rely on that practice. The survey's other finding in this group, that the announce-waytide-at-session-start rule says the status line reports the system active, was checked and is accurate: it describes what the segment means, not text it prints.

**9. decision-log-convention — corrected.** Its `Related:` list named "the observations and deferred rules", and the deferred rule went with the queue on 2026-08-25. The entry now names the observations-convention, and a new entry names the an-idea-takes-a-log-entry rule, which covers deferred work now that it is an idea.

**10. vocabulary-convention — corrected.** It said five packages carry a vocabulary, where six do: design-by-efferent, foundation, journal, language, testing, and versioning. It said "Five hold terms" above a list of four levels. And its `**Why:**` said five vocabularies bind the same prose. The first is now six, the second four levels, and the third "several", so it does not drift again.

**11. record-title-date-format — corrected.** Explaining how a title's date differs from the footer's, it showed the footer at hour resolution, `at 11 AM PT`, and told the writer to keep the footer's `at <hour> <zone>` form. Footers have carried minutes and seconds since 2026-08-10. The three mentions now show the footer's time to the second. Nothing about a title's date changes.

**12. Shortened rule names in citations — left, as not stale.** The survey counted citations such as "the file-names rule" and "the first-turn rule" as names that match no file. Each is the start or an evident part of the rule's file name, the form the corpus uses throughout, and leads to the right rule. Citations naming a rule that does not exist at all are taken separately.

**13. control-prefix-test-vars and test-name-is-prefix — corrected.** Both pointed to "the 'sent to' entry in the Word Substitutions rule". No such rule exists: substitutions are a table in the `language` vocabulary, and "sent to" is a row of it. Both now name the `language` vocabulary.

**14. context-only-for-local-instrumentation — corrected.** It cited "the assert-raises rule", a name no rule has. The rule meant is error-test-named-fails-condition-is-context, which promotes an error test's condition to a `When …` context. The citation now names it.

**15. assert-error-message-only-as-sole-discriminator — corrected.** Its `**Why:**` cited "the import-define-audit", a review in the `constant` project that no Waytide rule or record holds. The reference is dropped and the line it stood for is stated directly.

**16. timeline-view — corrected.** It pointed to "the suspended new-entry-trigger-rebuilds-timeline-index rule". That rule left with the suspension directory on 2026-08-18, and nothing holds it. The pointer is dropped; the account of the stored index it was attached to stays, as the reason for the rule.

**17. commit-says-task-is-done-not-mark-done — corrected.** Its `Related:` list named "the decision-log-format conventions", which no rule is. It now names the decision-log-convention.

**18. run-suite-before-commit — corrected.** It pointed a Ruby project to the `tools/ruby-lang` package twice. The grouping became `ext/` on 2026-08-23, and every other rule says `ext/ruby-lang`. Both mentions now do.

**19. no-claude-coauthor — corrected.** It said the instruction was "also recorded in `~/.claude/CLAUDE.md`". That file does not exist on the engineer's machine, and a package rule naming one person's home-directory file makes the same claim on every machine it is installed on. The parenthesis is dropped.

**20. version-scheme — corrected.** Its `Related:` entry reached the Ruby package through that package's running-the-test-suite rule, which says nothing about versions. The package's releasing-a-gem rule is the one that places the version, in the gemspec's `s.version`. The entry now names it. That rule also covers building and pushing a gem, which both reads in the README adherence sessions drafted for `versioning` without finding it.

**21. working-state-artifacts-carry-a-provenance-footer — corrected.** Its two lists of the records that carry a footer named experiments, designs, plans, observations, and deferred items as separate kinds. Experiments and features are one implementation record, and features were missing; designs, plans, observations, and deferred work are all ideas, and ideas were not named. Both lists now name implementation records and ideas.

**22. file-names-use-iso8601-utc-prefix — corrected.** It compared a local rule to "the project's log and deferred items". Deferred items have not been files of their own since 2026-08-25; deferred work is an idea. The comparison now names the log and ideas.

**23. ordinary-vocabulary-is-not-reserved-and-not-rewritten — corrected.** A paragraph said the divergence from STE stays visible because the unclaimed-words check reports every refused word. The check, `report-unreserved-words.sh`, was removed on 2026-08-13. The paragraph is dropped; the rule's own statement that it contradicts STE Rule 1.1 is what keeps the divergence visible.

**24. ordinary-vocabulary-is-not-reserved-and-not-rewritten — corrected.** Its opening counted, as a present fact, how often the rule files use seven words STE refuses — `as` 411 times, `every` 221. The counts have drifted with every edit since. They are now stated as of when the rule was written, which stays true.

**25. ete-fixes-the-meaning-of-a-word-in-its-category — corrected.** It said three words are reserved this way — loop, mechanical, and level. The vocabularies reserve seven: those three, and cycle, local, increment, and send. The engineer asked whether the rule needs a count at all, since a count must be corrected each time the list grows. It does not: the count and the list are dropped, loop stays as the one example, and the vocabularies are the list. Its `**Why:**` said "these three words" and now says "such a word". The survey's further claim, that no vocabulary marks `level`, was wrong; the design-by-efferent vocabulary does.

**26. ete-declares-its-own-categories — corrected.** Its examples of agent-artifact terms named `experiment record` and `feature record`, which became the one implementation record. The examples now name `implementation record`.

**27. communicate-plainly-name-the-thing — left, as not stale.** The agent proposed replacing "plans, deferred items" in its list of durable artifacts, calling both retired kinds of file. The engineer asked what was wrong with plans. Nothing: a plan is an idea tagged `[plan]`, and deferred work is an idea carrying a `**Waits for:**` line, so the list names real things in words a reader knows. The second reading of the deferred-queue passages had already judged it accurate.

**28. no-slang — corrected.** It said each slang replacement is its own rule, and twice pointed to "the individual substitution rules". None exists: each replacement is a row of the `language` vocabulary's table. All three now point there.

**29. tests-are-automated-or-interactive — corrected.** Its example put this repository in the no-automated-suite state "as of 2026-08-24", then said its first automated test arrived on 2026-10-10. It holds two automated tests now. The example reads as past, from 2026-08-24 to 2026-10-10, and its three tests are named interactive, since they are no longer all the tests there are.

**30. tdd-test-structure and dbe-first-turn-test-file — corrected.** Both used "arrange" for a test's setup, which the testing package's controls-not-factories-fixtures-arrange rule forbids in favor of the control of the test. tdd-test-structure's bold lead now reads "Set up the controls and actuate once", and the three instructions say "State the inputs". Two other uses of "arranged" mean organized rather than test setup, and are left.

**31. show-feature-test-output-after-implementation-hinge — corrected.** Its last step was "hand over the solubility gate", a gate of the two-gate loop. The five hinges judge solubility at the implementation hinge, on the implementation and its output. The step now says the engineer judges solubility on what is shown.

**32. one-outcome-at-a-time-name-via-options — corrected.** It listed an outcome's stops as "actuation, solubility, naming", the two-gate loop's list, which leaves out the observation and controls hinges. It now points to the hinge-cycle rule's five rather than listing them, so the two cannot drift apart. Its "stop and wait" makes no exception for unattended work; that is a conflict between rules rather than a stale passage, and is noted, not decided.

**33. tdd-designs-coverage-prevents-never-break-implementation — corrected.** A word substitution had left three phrases garbled: "preventing a regression in existing behavior against regression", "regression regression prevention", and "the a regression". The doubled words are removed. The rule's meaning is unchanged.

**34. Four Related lists — corrected.** In the-design-of-a-test-waits-at-the-hinges-including-coverage, dbe-as-design-tool, assert-error-message-only-as-sole-discriminator, and do-not-test-the-platform, the coverage rule's name had been split at its comma into two list items, "TDD designs" and "coverage prevents", naming two rules that do not exist. Each is one item again, naming tdd-designs-coverage-prevents-never-break-implementation.

**35. rules-establish-a-mindset-purpose-over-category, and the rules-convention's summary of it — corrected.** Both were written around rule folders — `terminology/`, `methodology/`, `test-writing/`, `code/` — that packages replaced, and the rule placed the commit rule under `methodology/`. Every mention of a folder now names a package, and the commit rule sits in the `git` package. The claim and the four directives are unchanged.

**36. package-dependency-heading — corrected.** It governed "a design doc", the wording from before designs became ideas, which its sibling plans-no-code-samples had already left behind. It now names a design as an idea tagged `[design]`. The heading it requires is unchanged.

**37. dbe-human-in-the-loop — corrected, on the engineer's direction.** Its step 2 had the agent write the whole test file in turn one and the human then deliberate the actuation, where hinge-cycle and the first-turn rule settle the actuation, the observation, and the controls one at a time and assemble the file after. The engineer stated the rule: the whole test file is never produced at an early hinge unless the engineer opted for unattended work. Step 2 now says so, and names the attended-or-unattended rule for the exception.

**38. dbe-first-turn-test-file — corrected.** Its opening said the first turn produces the test file and stops at the first gate, and its `**How to apply:**` said to write only the test file, both reading as the file before the hinges. Its own later sentence said to settle the three test hinges first. The opening and `**How to apply:**` now say the file is assembled once the three are accepted, and the exception the engineer stated for passage 37, unattended work, is written in.

**39. one-outcome-at-a-time-name-via-options — corrected.** Its "stop and wait" made no exception for unattended work, the conflict noted at passage 32. It now says the agent does not stop under unattended work, and that one outcome at a time and never several test files at once hold in both modes.

**40. hinge-cycle — corrected.** It attributed the argument that a line repeated unchanged stops being read to the announce-waytide-at-session-start rule. That rule does not make it; the initialization-rule does. The citation now names the initialization-rule.

---

Authored by Scott Bellware on Wed Oct 14 2026 at 1:46:14 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:49:11 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 8:55:19 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:01:00 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:04:54 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:06:08 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:08:54 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:19:34 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:25:35 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:28:48 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:29:41 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:30:23 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:32:07 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:32:53 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:33:23 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:34:47 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:35:39 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 10:38:41 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 1:17:16 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 1:19:52 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 4:45:47 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 4:46:47 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 4:49:18 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 10:15:17 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 10:16:13 PM PT
Changed by Scott Bellware on Mon Oct 19 2026 at 3:35:00 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:18:37 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:19:33 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:20:41 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:22:01 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:23:55 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:51:09 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 11:55:11 AM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:11:48 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:12:36 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:14:38 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:16:02 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:25:33 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:26:52 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:27:37 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:28:14 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:38:31 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:39:25 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:49:37 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:50:38 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:34:03 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:35:02 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:37:04 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 8:45:35 PM PT
