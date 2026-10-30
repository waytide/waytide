# Work Session — The rules are read at a third of the cost (Oct 21–29, 2026)

This work session began as a question: can Waytide's rules be made much cheaper to read at the start of a session, with sessions behaving the same? It became fifteen phases of the rule-reduction experiment. It ended with the experiment affirmed and merged into `master`, and the session-start read at about 170,000 characters, against about 547,000 when it began.

**This is the guided tour, not the record of truth.** The durable records it points to are authoritative: above all the experiment's record, `local/implementations/2026-10-22T04-51-25Z-rule-reduction`, which holds every finding, forecast, and figure.

## 1. The goal

**The engineer asked for a smaller read that keeps the rules' effect.** Every session starts by reading the rules, and every later prompt carries them. A smaller read costs less time and less of the agent's context. It counts only if the agent still does what the rules require, so the test of every change is that sessions behave the same.

**Each phase stated its forecast before its work**: what it expected to find, and how confident it was. After the work, each forecast was recorded as held or missed. The forecasts are in the experiment record's Forecast section.

## 2. Compression, and the measures it made

**Each rule got a short form**: numbered instructions in plain sentences, without the reasons, in a `## Compressed` section below the rule's full text. The full text stays the authority.

**Five figures measure a short form against its full text**, recorded in the rule's own `## Compression` section, one line per event:

1. **Size rank:** the rule's rank by length among all the rules, from 0 for the smallest to 1 for the largest.
2. **Clarity score:** 1 minus the rule's unclarity. Unclarity is the mean of six ranks among all the rules: average sentence length, share of sentences over 25 words, and history words, asides, citations, and negations per sentence.
3. **Solubility:** the size rank and the unclarity together, on a scale of 0 to 100. Higher is easier to take in.
4. **Change:** the share of the full text's words that the short form removes, adds, or replaces.
5. **Compression:** the share of the full text's characters that the short form removes.

Each rank compares the rule with all the rules as they stood at one fixed point in time, so a figure measured on one day compares with one measured on another.

**Three measures test whether the short form keeps the rule's meaning:**

1. **The directive check.** One fresh agent lists every instruction in the full text. A second fresh agent judges each one against the short form: kept, less precise, or lost. Neither agent wrote the short form.
2. **The predictability simulation.** Agents answer the same scenarios with the full rule or with its short form, and the answers are compared. On the first five rules, one answer in 150 differed.
3. **The session comparison.** Agents given one version of the rules or another answer the same requests. A separate agent scores every answer against a pass condition, without knowing which version produced it. This settled, for one, that a rule's *Why* points could go: 56 of 75 passed with them, and 58 of 75 without.

**The directive check became the gate.** A short form stands only after it passes. Each lost instruction, and each materially less precise one, is repaired with the smallest wording that restores it, and the short form is checked again. The method is now a rule: a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body.

**The phase also recorded ten findings** about where the rules cost more than they needed to. Later phases took most of them up.

## 3. One read, in one command

**Each package's rules were compiled into one file, and a loader prints the whole read in one command**: `system/foundation/load-rules.sh`. The read took 19.9 seconds and 7 tool calls, against 44.8 seconds and 18 calls before. Here the read itself became something measured: its size in characters, its time, and its tool calls.

## 4. Triggers

**About half the rules load only when their act comes up.** These are the **on-demand** rules. At session start, the loader lists each one's **trigger**, a line naming the act, with the command that loads it. The rest are **pre-loaded**, printed in full at session start. The read fell 39%.

**A confirming test ran in real sessions**, in Claude Code itself, on requests written by an agent that had not seen the triggers. Every session loaded its rule before acting, 50 of 50. From here on, a change that touches the harness was tested in real sessions, each in its own copy of the repository, and each transcript was checked for whether the agent loaded what it needed.

## 5. Reading again after compaction

**When Claude Code shortens a long conversation into a summary, the hook now tells the agent to read the rules again.** Before the change, 3 of 20 sessions read them again. After it, 20 of 20 did.

## 6. The phases that followed

1. **Title display** was abandoned. Claude Code has no place to show a list of rule titles without it scrolling.
2. **Active packages only:** a package that a project turns off is listed, with the command that loads it, instead of read. It can be turned back on during a session.
3. **Local compression:** the vocabularies and the project's own rules got short forms. The read fell another 22%.
4. **Hook delivery:** the hook can give the agent about 10,000 characters directly, too little to carry the rules, so the read stays.
5. **Single statement:** an instruction written out in several rules is now stated once, in its origin, the rule it belongs to. Where a difference showed in the first run, the requests were run again, and the difference was chance.
6. **Live references:** rules cited by old names, and one stale path, were corrected.
7. **Record obligations:** the four steps of a record's state change were each found worth keeping, so nothing changed.
8. **Prompt turns:** the `Explain` option was removed from questions. A question with one real answer offers it and its negative.
9. **Local vocabulary:** the project's one word choice, *superseded* for *overtaken*, moved into the `foundation` vocabulary.
10. **Journal time question:** with `Explain` gone, the question for an entry's time came out right in every test.
11. **Master rule compression:** the rule that a response is clarified twice, added on `master` during the experiment, got its short form.

## 7. The conclusion and the merge

**The engineer concluded the experiment as affirmed on Oct 29, 2026.** Before the merge, `master`'s own 110 commits from the same time were carried into the experiment's layout, and each short form the merge changed was checked again. `master` then moved forward to the experiment's branch, and the branches and worktree were deleted.

**Afterward, the size rank became a figure of its own**, recorded beside the others, and the figures took the order size rank, clarity score, solubility, change, compression.

## Takeaways

- The session-start read is about a third of what it was, and sessions behave the same.
- A short form stands only after a fresh agent finds it keeps its full text's instructions.
- A change that could alter behavior is tested in blind-scored sessions, and in real sessions where the harness is involved.
- Each forecast is stated before the work, and recorded as held or missed after it.

## Glossary

- **short form** — a rule's compressed text: its instructions without the reasons.
- **pre-loaded** — a rule printed in full at session start.
- **on-demand** — a rule loaded only when its trigger comes up.
- **trigger** — the line naming the act that loads an on-demand rule.
- **origin** — the rule an instruction belongs to, which states it in full.
- **size rank, clarity score, solubility, change, compression** — the five figures of a short form, as section 2 defines them.

## Where the durable records live

- **The experiment's record:** `local/implementations/2026-10-22T04-51-25Z-rule-reduction`, with its appendices.
- **The compression rule:** a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body.
- **The loader and the hook:** `system/foundation/load-rules.sh` and `system/foundation/session-start.sh`.
- **The log:** `local/logs/log/`, the entries from 2026-10-22 to 2026-10-30, with each of the engineer's decisions tagged `[decision]`.

---

Authored by Scott Bellware on Thu Oct 29 2026 at 6:50:58 PM PT
