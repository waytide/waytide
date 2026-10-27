# A package's vocabulary holds its terms, and the most specific one decides

A package's `vocabulary.md` holds the terms that package defines and the word substitutions it enforces. It is binding. Use its terms and its substitutions in code, tests, rules, designs, commits, records, and dialogue.

**A package gets a vocabulary only when it has a specialized vocabulary for its domain.** A package whose subject is written in ordinary words has none. The absence is correct rather than missing. `git` and `ext/ruby-lang` have none. Six packages do.

## What a vocabulary holds

- **Terms** — the concepts the package defines. `solubility`, `efferent`, `hinge`, `precondition`. A term is a glossary entry, and it says what the concept is.
- **Substitutions** — a word not to write, and the word to write instead. `conform` rather than "sweep". `verified` rather than "green".
- **Discontinuations** — a word removed from use with nothing in its place. `discriminator` went because the concept went, not because another word replaced it.

**A substitution and a discontinuation are different acts.** A substitution names two words. A discontinuation names one. Do not file one under the other's heading.

**A term Waytide did not coin is still a term.** `load-bearing` comes from structural engineering, `cradle` from a physical object, and `preserve` from the vocabulary of design. Each is a term, because the vocabulary says what it means. Where the word was taken rather than coined, the entry says so in its own prose. That is an **origin** and not a kind of entry.

## Which vocabulary decides

**Four levels hold terms, and a word can appear in more than one.** They decide in this order, from the one that decides first:

1. **The STE dictionary**, and Waytide's reserved terms where the approved word means something else. The `language` package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule states this level and its exception.
2. **The `language` package's vocabulary** — the terms and substitutions that belong to no domain.
3. **An individual package's vocabulary** — the terms and substitutions of one domain.
4. **The project's own vocabulary**, in `waytide/local/vocabulary.md`, which a project writes for itself.

**The more specific decides.** A domain knows its own words, and a general vocabulary cannot anticipate what a domain needs. A project knows its own work, and Waytide cannot anticipate that either.

## A project's own vocabulary is `waytide/local/vocabulary.md`

**One file, beside `rules/`, named for what it is.** It holds the terms and substitutions a project settles for itself, in the same shape a package's `vocabulary.md` has. It takes **no datetime prefix**. It is a structural file rather than a dated decision, exactly as a package's `vocabulary.md` is. See the file-names rule.

**It is read at session start**, with `waytide/system/` and `waytide/local/rules/`. That is what makes it binding. It is also the reason the file sits where it does rather than in a working directory. `session-start.sh` names it in the read instruction, and the `AGENTS.md` bootstrap names it too.

**It is optional, and its absence is not a defect** — the same standing a package's `vocabulary.md` has. Most projects never write one.

**It is not a rule, and it does not live in `rules/`.** A rule states an obligation and takes the datetime prefix, because it is a dated decision in the project's history. A vocabulary accretes and is named for what it is. Putting it inside `rules/` would make the one directory hold two kinds of file under two naming conventions. Keeping it beside `rules/` avoids that.

**Most of the time the levels do not meet.** The `language` vocabulary holds the substitutions that belong to no domain, and it says so. A domain-specific substitution belongs in its own package. So two vocabularies rarely name the same word, and the order settles the case where they do.

## Specialization is not conflict

**A package can narrow a general term rather than contradict it.** `language` defines `actuation` as the invocation of a unit from its use site. `design-by-efferent` keeps that meaning and adds that the actuation is written before any implementation. The narrower entry does not displace the general one. It rests on it.

**Say which is happening.** Where a package narrows a term, its entry names the general term it narrows. Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason. A reader must not have to work out which case an entry is.

**Why:** several vocabularies bind the same prose. A reader who finds a word in two of them cannot choose without a stated order. The cost is not hypothetical. `actuation` is defined in `language` and in `design-by-efferent`, and which one governs rests today on a sentence one of them happens to carry. Naming the order once removes that from every future case.

**How to apply:** put a term in the vocabulary of the package whose domain it belongs to. Put a domain-less term or substitution in `language`.

A **project** settles a term for itself. Put it in `waytide/local/vocabulary.md`, with no datetime prefix. Write no such file until there is a term to write.

Give a package a vocabulary only when its domain has specialized words. When a word appears in two vocabularies, the more specific one decides. The entry says whether it narrows the general term or replaces it. Keep substitutions and discontinuations under separate headings.

## Compressed

1. A package's `vocabulary.md` holds the terms that package defines and the word substitutions it enforces.
2. It is binding.
3. Use its terms and substitutions in code, tests, rules, designs, commits, records, and dialogue.
4. Give a package a vocabulary only when its domain has specialized words.
5. A package whose subject is written in ordinary words has no vocabulary. The absence is correct, not missing.
6. `git` and `ext/ruby-lang` have none. Six packages do.
7. Put a term in the vocabulary of the package whose domain it belongs to.
8. Put a domain-less term or substitution in `language`. Put a domain-specific substitution in its own package's vocabulary.

## What a vocabulary holds

1. **Terms** are the concepts the package defines, such as `solubility`, `efferent`, `hinge`, `precondition`.
2. A term is a glossary entry, and it says what the concept is.
3. **Substitutions** name a word not to write, and the word to write instead. Examples: `conform` rather than "sweep", `verified` rather than "green".
4. **Discontinuations** name a word removed from use with nothing in its place. `discriminator` went because the concept went.
5. A substitution names two words. A discontinuation names one.
6. Keep substitutions and discontinuations under separate headings. Do not file one under the other's heading.
7. A word Waytide did not coin is still a term, and is entered as one. Examples: `load-bearing`, `cradle`, `preserve`.
8. Where a word was taken rather than coined, the entry says so in its own prose.
9. That statement is an **origin**, not a kind of entry.

## Which vocabulary decides

1. Four levels hold terms, and a word can appear in more than one.
2. They decide in this order, from the one that decides first:
   1. **The STE dictionary**, and Waytide's reserved terms where the approved word means something else. The `language` package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule states this level and its exception.
   2. **The `language` package's vocabulary**: the terms and substitutions that belong to no domain. The `language` vocabulary says so itself.
   3. **An individual package's vocabulary**: the terms and substitutions of one domain.
   4. **The project's own vocabulary**, in `waytide/local/vocabulary.md`, which a project writes for itself.
3. When a word appears in two vocabularies, the more specific one decides.

## A project's own vocabulary is `waytide/local/vocabulary.md`

1. It is one file, beside `rules/`, holding the terms and substitutions a project settles for itself.
2. It has the same shape as a package's `vocabulary.md`.
3. It takes no datetime prefix. It is a structural file, not a dated decision. See the file-names rule.
4. It is read at session start, with `waytide/system/` and `waytide/local/rules/`. That read makes it binding.
5. `session-start.sh` names it in the read instruction. The `AGENTS.md` bootstrap names it too.
6. It is optional, and its absence is not a defect.
7. Write no such file until there is a term to write.
8. It is not a rule. Do not put it in `rules/`.

## Specialization is not conflict

1. A package can narrow a general term rather than contradict it. The narrower entry rests on the general one and does not displace it.
2. Example: `language` defines `actuation` as the invocation of a unit from its use site. `design-by-efferent` adds that the actuation is written before any implementation.
3. Where a package narrows a term, its entry names the general term it narrows.
4. Where a package keeps a word the `language` vocabulary substitutes away, its entry says so and gives the reason.
5. A reader must not have to work out which case an entry is. The entry says whether it narrows or replaces the general term.
6. **Why:** several vocabularies bind the same prose. A reader who finds a word in two of them cannot choose without a stated order.

## History

A fourth kind held such words from 2026-08-10 until 2026-08-14. It had one entry, and that entry carried a definition, which was the test that was to have kept it out. See the suspended words-from-the-design-vocabulary section.

**What it cost to place it there.** The read instruction previously named `waytide/local/rules/` and said *read only that one directory beside the packages*. So a binding file anywhere else under `waytide/local/` would have gone unread. Placing the vocabulary beside `rules/` therefore reached `session-start.sh`, the announce-waytide-at-session-start rule, the rules-convention, the file-names rule, and the bootstrap `install.sh` generates. That cost was taken deliberately, for the reason above: the alternative put a glossary in the rules directory and named it like a decision.

Until Sun Oct 25 2026 this rule was named vocabulary-convention and titled "`vocabulary.md` — what a package's vocabulary is, which package has one, and which one decides".

Related:

- the `language` package's `vocabulary.md` and its waytide-keeps-its-word-where-the-ste-word-means-something-else rule — the level above this one
- its language-is-used-precisely-here-and-words-are-load-bearing rule — the premise every vocabulary follows from
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory
- the file-names rule — why the project's file takes no prefix
- the the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule — the read instruction that names it

---

Authored by Scott Bellware on Sun Aug 9 2026 at 2:19:00 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:56:40 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:24:07 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:52:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 1:47:50 PM PT
Changed by Scott Bellware on Fri Aug 21 2026 at 8:40:26 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:12:05 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Thu Oct 15 2026 at 1:17:16 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:32 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:53 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
