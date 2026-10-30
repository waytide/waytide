# Work Session — The rules are read at a third of the cost (Oct 21–29, 2026)

This work session began as a question: can Waytide's rules be made much cheaper to read at the start of a session, with sessions behaving the same? It became the rule-reduction experiment, run in fifteen phases. It ended with the experiment affirmed and merged into `master`, and the session-start read at about 170,000 characters, against about 547,000 when it began.

**This is the guided tour, not the record of truth.** The durable records it points to are authoritative: above all the experiment's record, `local/implementations/2026-10-22T04-51-25Z-rule-reduction`, which holds every finding, forecast, and figure, and the log, `local/logs/log/`, which holds an entry for each action below.

## 1. The goal

**The engineer asked for a smaller read that keeps the rules' effect.** Every session starts by reading the rules, and every later prompt carries them. A smaller read costs less time and less of the agent's context. It counts only if the agent still does what the rules require, so the test of every change is that sessions behave the same.

**Each phase stated its forecast before its work**: what it expected to find, and how confident it was. After the work, each forecast was recorded as held or missed.

**Key metrics at this point:**

- Session-start read: 547,780 characters in 108 rule files
- Solubility: 51
- Clarity: 0.52

## 2. The experiment is set up, and the first rules are compressed (Oct 21)

1. **The rule-reduction idea gained flattening**: restating a rule as its essential directives.
2. **An experiment was allowed to run in phases**, each on its own branch from the experiment's.
3. **The experiment's record was written**, with its question, its phases, and its forecasts.
4. **Fifteen candidate rules were measured and tabled.** Each took a **size rank**, its rank by length among all the rules, and an **unclarity**, the mean of six ranks: average sentence length, share of sentences over 25 words, and history words, asides, citations, and negations per sentence.
5. **The two were combined into solubility**, inverted to ascend in value rather than descend, and scaled to 100: higher is easier to take in. The combined score was settled as a screen for candidates, not a ranking.
6. **Two more figures were set for a compressed text**: **compression**, the share of characters it removes, and **change**, the share of words it removes, adds, or replaces.
7. **Rule #2 was compressed, and the compiler learned to print a rule's compressed text in place of its body.**
8. **A predictability simulation was designed**: fresh agents answer scenarios from the full rule or from its compressed text, and the answers are compared. It passed on #2.
9. **Rules #11, #7, #15, and #12 were compressed, and each passed its simulation.** One answer in 150 differed.

**Key metrics at this point:**

- Five rules compressed: #2, #7, #11, #12, and #15
- Compression: 0.55 (min 0.27 max 0.71)
- Change: 0.78 (min 0.56 max 0.91)
- Simulation: 149 of 150 answers the same
- Session-start read: unchanged, 547,780 characters

## 3. The method is checked, and run across the corpus (Oct 22–24)

1. **The simulation was found not to settle whether a compressed rule has the same effect**, so a **directive check** was designed: one fresh agent lists every directive in the full text, and a second judges each one against the compressed text as kept, less precise, or lost.
2. **The check ran on #15, #11, #12, #7, and #2.** It found one material weakening and two losses, and each was restored with the smallest clause.
3. **The experiment was suspended and resumed the same day.**
4. **Rules #13 and #14 were compressed and checked**, and the rewritten #2 and #12 were checked again.
5. **An unattended method for the rest of the corpus was settled**: an agent compresses each rule, fresh agents list and check its directives, losses are repaired, and repaired rules are checked again.
6. **The corpus was compressed in batches**: `git` first, then `testing`, `design-by-efferent` with `versioning`, `language` with `journal`, and `foundation`. Each batch's review list went to the engineer.
7. **Compressed texts were settled as numbered lists**, keeping their headings.

**Key metrics at this point:**

- Rules compressed: 102
- Compression: 0.31
- Change: 0.59
- Solubility: 51 → 73

## 4. The rules are cleaned up, and compression becomes a rule (Oct 25–27)

1. **Every rule's name was clarified**, so that a name says what its rule says, and each rename updated the rule's citations.
2. **Phase 1 was renamed compression**, and its ten findings about where the rules cost more than they needed to were recorded.
3. **On `master`, from those findings, history clauses moved out of the rule bodies, the vocabularies' shared preamble was stated once, restated instructions were cited instead, and two stale references were reconciled.**
4. **On `master`, the hook stopped asking for the package set where it prints nothing.**
5. **Every compressed text changed since its check was checked again.**
6. **Compression was governed by a rule**, and each rule's figures were recorded in its own file, in a `## Compression` section below the compressed text. That rule is a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body.
7. **The experiment's record took the Active state**, and findings #7 and #10 were placed in phases 2 and 3.

**Key metrics at this point:**

- Session-start read, compressed: 451,614 characters, with each rule's measures still printed
- Solubility: 73

## 5. Phase 1 is tested and affirmed (Oct 27–28)

1. **The compressed read was measured smaller than `master`'s.**
2. **A session comparison was designed**: agents given one version of the rules or the other answer the same requests, and a separate agent scores each answer against a pass condition without knowing its version. It held the forecast that compressed rules behave the same.
3. **A forecast that solubility would predict ease of processing did not hold**, though the compressed rules were found easier to process.
4. **Phase 1 was affirmed, and phase 2 started.**
5. **Phase 2 was suspended to return to phase 1.** A session comparison tested whether the compressed texts need their *Why* points: 56 of 75 passed with them, and 58 of 75 without. The compressed texts were settled to carry no reasons, and *How to apply* was removed from them.
6. **Phase 1 was affirmed again, and phase 2 resumed.**

**Key metrics at this point:**

- Session-start read: 450,824 characters at the first affirmation, 17.7% smaller than 547,780
- After the reasons were removed: 396,052 characters, 27.7% smaller
- Solubility: 73
- Clarity: 0.52 → 0.80
- Sessions: 49 of 50 compressed against 48 of 50 full; 58 of 75 without the Why points against 56 of 75 with them

## 6. One read, in one command (Oct 28)

1. **The read was measured before the change**: its characters, its time, and its tool calls.
2. **The compiler wrote one rules file per package.** On its own, that did not shorten the read.
3. **A loader was written that prints every file the read covers, in one command**: `system/foundation/load-rules.sh`. The read took 19.9 seconds and 7 tool calls, against 44.8 seconds and 18 calls before.
4. **Phase 2 was affirmed**, and the rules were updated to describe one rules file per package.

**Key metrics at this point:**

- Session-start read, everything the loader prints: 377,775 characters
- Time: 44.8 seconds → 19.9 seconds
- Tool calls: 18 → 7

## 7. Triggers (Oct 28–29)

1. **Phase 3 started as additional-context**, delivering the rules through the hook, **and became triggers.**
2. **Four phases were added**: re-read-after-compaction, title-display, active-packages-only, and local-compression.
3. **The rules were sorted** into those printed at session start, the **pre-loaded** rules, and those loaded when their act comes up, the **on-demand** rules.
4. **The design was settled**: a **trigger**, a line naming the act, goes under an on-demand rule's title, and the compiler writes each package's `rules-pre-loaded.md` and `rules-on-demand.md`.
5. **The loader learned to print each on-demand rule's trigger with the command that loads it, and to load a rule by name.**
6. **The 61 triggers were written.** The read fell 39%.
7. **A session comparison scored the trigger index as well as the full read.**
8. **A confirming test ran in real sessions**, in Claude Code itself, each in its own copy of the repository, on requests written by an agent that had not seen the triggers. Every session loaded its rule before acting, 50 of 50.
9. **The triggers phase was affirmed and merged into the experiment's branch.**
10. **A printed index of every rule, for the engineer, was not pursued.**

**Key metrics at this point:**

- Session-start read: 377,775 → 229,028 characters, 39% smaller
- Pre-loaded rules: 47
- On-demand rules: 61
- Real sessions that loaded their rule before acting: 50 of 50

## 8. Compaction, packages, and local compression (Oct 29)

1. **Phase 4 measured that after compaction 3 of 20 sessions read the rules again.**
2. **An instruction given on compaction alone was tried**, and 20 of 20 sessions read them again.
3. **The hook was built to give that instruction, attended, with a test**, the harness rule was updated to describe it, and the built hook was confirmed in 10 of 10 sessions. Phase 4 was affirmed.
4. **Phase 5, title-display, was abandoned**, since a printed list scrolls and the engineer had not pursued it.
5. **Phase 6 had the loader list a deactivated package, with the command that loads it, in place of its rules**, and load a package by name. The hook and the package-set rule were updated. Sessions behaved the same, and every session loaded a reactivated package before using it. Phase 6 was affirmed.
6. **Phase 7 had the loader print the compressed section of a vocabulary or a local rule**, and the vocabularies and local rules were compressed and checked. The read fell another 22%, and sessions behaved the same. Phase 7 was affirmed.

**Key metrics at this point:**

- Session-start read: 230,433 → 180,146 characters, 22% smaller
- Vocabularies and local rules: 84,905 → 52,637 characters, 38% shorter
- Sessions reading the rules again after compaction: 3 of 20 → 20 of 20
- A project with two packages turned off: 19% smaller still

## 9. The outstanding work (Oct 29)

1. **Five phases were added for the work still outstanding**: hook-delivery, single-statement, live-references, record-obligations, and prompt-turns.
2. **Phase 8 measured the hook's channel to the agent at about 10,000 characters**, too little to carry the rules. Phase 8 was affirmed.
3. **Phase 9 left the vocabularies' head line and opening lines out of their compressed texts**, after an evaluation of each line.
4. **It removed each repetition whose origin, the rule the instruction belongs to, is pre-loaded**, and kept a vocabulary entry's meaning in its compressed text. A session test passed 16 of 18 against 18 of 18; a rerun showed the difference was chance. Phase 9 was affirmed.
5. **Phase 10 corrected nine old rule names and one stale path.** Phase 10 was affirmed.
6. **Phase 11 kept every step of a record's state change**: the rename and the footer line. Phase 11 was affirmed.
7. **Phase 12 removed the `Explain` option, kept asking at once about a preference, and had a question with one real answer offer it and its negative.** Phase 12 was affirmed.
8. **Three more phases were added**: local-vocabulary, journal-time-question, and master-rule-compression.
9. **Phase 13 compressed the project vocabulary, and moved its one substitution, *superseded* for *overtaken*, to the `foundation` vocabulary.** Phase 13 was affirmed.
10. **Phase 14 found the journal's time question right in 20 of 20 sessions**, with `Explain` gone. Phase 14 was affirmed.
11. **Phase 15 compressed the clarified-twice rule added on `master`, keeping its example.** Phase 15 was affirmed.

**Key metrics at this point:**

- Session-start read: 180,146 → 170,884 characters after single statement, 167,074 after the local vocabulary, 168,292 after the last rule was compressed
- Solubility: 73.3
- Clarity: 0.82

## 10. The conclusion and the merge (Oct 29)

1. **The engineer concluded the experiment as affirmed.** Its record was renamed to end in `-AFFIRMED`.
2. **`master` was merged into the experiment's branch**, carrying `master`'s 110 commits from the same time into the experiment's layout. Each change to a renamed rule went into its new source and its compressed text, and `master`'s new rules took compressed texts.
3. **Each compressed text the merge changed was checked again**: 30 rules, with 20 repairs.
4. **`master` moved forward to the experiment's branch.**
5. **The experiment's branches and worktree were deleted**, with the engineer's confirmation.

**Key metrics at this point:**

- Session-start read on `master`: 170,400 characters, about a third of 547,780
- Rules: 111, of which 48 pre-loaded and 63 on-demand
- Re-checked after the merge: 30 rules, 822 directives, 20 repairs

## 11. After the merge (Oct 29–30)

1. **The size rank became a figure of its own**, recorded with the others.
2. **The figures took the order size rank, clarity score, solubility, change, compression.** The **clarity score** is 1 minus the unclarity.
3. **This record was written.**

**Key metrics at this point:**

- Session-start read: 170,400 characters
- Solubility: 73.3
- Clarity: 0.82

## Takeaways

- The session-start read is about a third of what it was, and sessions behave the same.
- A compressed text stands only after a fresh agent finds it keeps its full text's directives.
- A change that could alter behavior is tested in blind-scored sessions, and in real sessions where the harness is involved.
- Each forecast is stated before the work, and recorded as held or missed after it.

## Glossary

- **compressed text** — a rule restated as numbered directives, without the reasons, below its full text.
- **pre-loaded** — a rule printed in full at session start.
- **on-demand** — a rule loaded only when its trigger comes up.
- **trigger** — the line naming the act that loads an on-demand rule.
- **origin** — the rule an instruction belongs to, which states it in full.
- **directive check** — the listing of a rule's directives and the judging of each against its compressed text.
- **size rank, clarity score, solubility, change, compression** — the five figures of a compressed text, as sections 2 and 11 define them.

## Where the durable records live

- **The experiment's record:** `local/implementations/2026-10-22T04-51-25Z-rule-reduction`, with its appendices.
- **The compression rule:** a-rules-compressed-text-is-written-in-its-source-checked-against-it-and-its-figures-recorded-below-the-body.
- **The loader and the hook:** `system/foundation/load-rules.sh` and `system/foundation/session-start.sh`.
- **The log:** `local/logs/log/`, the entries from 2026-10-21 to 2026-10-30, with each of the engineer's decisions tagged `[decision]`.

---

Authored by Scott Bellware on Thu Oct 29 2026 at 6:50:58 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:01:32 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:38:04 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:43:15 PM PT
