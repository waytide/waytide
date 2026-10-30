# The rule-reduction experiment

**The experiment asked whether Waytide's rules can be made much cheaper to read at the start of a session, with sessions behaving the same.** They can. Between Oct 21 and Oct 29, 2026, the session-start read fell from about 547,000 characters to about 170,000, under a third of what it was. In every test, sessions behaved as they did before.

The full record, with every finding, forecast, and figure, is the experiment's record in `local/implementations/2026-10-22T04-51-25Z-rule-reduction`.

## The goal

1. **Make the read smaller.** Every session starts by reading the rules, and every later prompt carries them. A smaller read costs less time and less of the agent's context.
2. **Keep the rules' effect.** A smaller read counts only if the agent still does what the rules require. The test of a change is that sessions behave the same.

## The measures

### Measures of the text

Each rule's short form is measured against its full text. Five figures are recorded in the rule's own file, in a `## Compression` section, one line per event.

1. **Size rank:** the rule's rank by length among all the rules, from 0 for the smallest to 1 for the largest.
2. **Clarity score:** 1 minus the rule's unclarity. Unclarity is the mean of six ranks among all the rules: average sentence length, share of sentences over 25 words, and history words, asides, citations, and negations per sentence.
3. **Solubility:** the size rank and the unclarity together, on a scale of 0 to 100. Higher is easier to take in.
4. **Change:** the share of the full text's words that the short form removes, adds, or replaces.
5. **Compression:** the share of the full text's characters that the short form removes.

Each rank compares the rule with all the rules as they stood at one fixed point in time, so a figure measured on one day compares with one measured on another.

### Measures of meaning

1. **The directive check.** One fresh agent lists every instruction in the full text. A second fresh agent judges each one against the short form: kept, less precise, or lost. Neither agent wrote the short form.
2. **The predictability simulation.** Agents answer the same scenarios with the full rule or with its short form, and the answers are compared.
3. **The session comparison.** Agents given one version of the rules or another answer the same requests. A separate agent scores every answer against a pass condition, without knowing which version produced it.

### Measures of the read

1. **Size:** the characters the agent reads at session start.
2. **Time and steps:** how long the read takes, and how many tool calls it uses.
3. **Loading:** from a session's transcript, whether the agent loaded a rule when its trigger came up.

## The methodology

1. **Each phase states its forecast before its work.** A forecast says what the phase expects to find, and how confident it is. After the work, each forecast is recorded as held or missed.
2. **A short form stands only after the directive check.** Each lost instruction, and each materially less precise one, is repaired with the smallest wording that restores it. The repaired short form is checked again.
3. **The figures go into the rule's own file.** Each compression, revision, and check adds a line, and the earlier lines stay as written.
4. **Behavior is tested in sessions.** A change that could alter what an agent does is tested with requests governed by the rules it touched: three to ten runs on each side, scored blind. A request whose answer depends on a changed rule is written by an agent that did not see the change, where that is possible.
5. **Real sessions are used where the harness matters.** For the session-start hook, the loader, and compaction, each session runs in Claude Code itself, in its own copy of the repository.
6. **A failure is followed up.** Where a side fails, the requests are run again, so that a difference by chance is not taken for a real one.
7. **The engineer decides.** Each phase ends with the engineer's verdict, and every decision is recorded with a log entry tagged `[decision]`.

## The process

The experiment ran in fifteen phases, one at a time, each on its own branch.

1. **Compression.** Each rule got a short form: numbered instructions in plain sentences, without the reasons. A rule now governs how short forms are written and checked. The phase also recorded ten findings about where the rules cost more than they needed to.
2. **Packaged script.** Each package's rules were compiled into one file, and a loader prints the whole read in one command. The read took 19.9 seconds and 7 tool calls, against 44.8 seconds and 18 calls before.
3. **Triggers.** About half the rules load only when their act comes up. At session start, the loader lists each one's trigger and the command that loads it. The read fell 39%.
4. **Re-read after compaction.** When Claude Code shortens a long conversation into a summary, the hook now tells the agent to read the rules again. Before the change, 3 of 20 sessions read them again. After it, 20 of 20 did.
5. **Title display.** Abandoned. Claude Code has no place to show a list of rule titles without it scrolling.
6. **Active packages only.** A package that a project turns off is listed, with the command that loads it, instead of read. It can be turned back on during a session.
7. **Local compression.** The vocabularies and the project's own rules got short forms. The read fell another 22%.
8. **Hook delivery.** The hook can give the agent about 10,000 characters directly. That is too little to carry the rules, so the read stays.
9. **Single statement.** An instruction written out in several rules is now stated once, where it belongs.
10. **Live references.** Rules cited by old names, and one stale path, were corrected.
11. **Record obligations.** The four steps of a record's state change were each found worth keeping, so nothing changed.
12. **Prompt turns.** The `Explain` option was removed from questions. A question with one real answer offers it and its negative.
13. **Local vocabulary.** The project's one word choice, *superseded* for *overtaken*, moved into the `foundation` vocabulary.
14. **Journal time question.** With `Explain` gone, the journal's question for an entry's time came out right in every test.
15. **Master rule compression.** The rule that a response is clarified twice, added on `master` during the experiment, got its short form.

**The experiment was concluded as affirmed on Oct 29, 2026, and merged into `master`.** Before the merge, `master`'s own 110 commits from the same time were carried into the experiment's layout, and each short form the merge changed was checked again.

---

Authored by Scott Bellware on Thu Oct 29 2026 at 6:42:16 PM PT
