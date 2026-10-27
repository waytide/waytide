# A package's vocabulary holds its terms, and the most specific one decides

A package's `vocabulary.md` holds the terms that package defines and the word substitutions it enforces. It is binding. Use its terms and its substitutions in code, tests, rules, designs, commits, records, and dialogue.

**A package gets a vocabulary only when it has a specialized vocabulary for its domain.** A package whose subject is written in ordinary words has none. The absence is correct rather than missing. `git` and `ext/ruby-lang` have none. Six packages do.

## What a vocabulary holds

- **Terms** — the concepts the package defines. `solubility`, `efferent`, `hinge`, `precondition`. A term is a glossary entry, and it says what the concept is.
- **Substitutions** — a word not to write, and the word to write instead. `conform` rather than "sweep". `verified` rather than "green".
- **Discontinuations** — a word removed from use with nothing in its place. `discriminator` went because the concept went, not because another word replaced it.

**A substitution and a discontinuation are different acts.** A substitution names two words. A discontinuation names one. Do not file one under the other's heading.

**A term Waytide did not coin is still a term.** `load-bearing` comes from structural engineering, `cradle` from a physical object, and `preserve` from the vocabulary of design. Each is a term, because the vocabulary says what it means. Where the word was taken rather than coined, the entry says so in its own prose. That is an **origin** and not a kind of entry.

## Every word in a vocabulary is approved or reserved

**Every word in a vocabulary is one of two things.** This holds for its terms, and for the **Use** column of any substitutions table in it.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required, and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An ETE category is reserved under the ete-declares-its-own-categories rule. STE Rule 1.8 requires a technical noun to be approved in the subject field, and the vocabulary that holds it is that approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it with a meaning Waytide does not use. The last of the three is governed by the ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**The sequence for reserving a word is the a-word-is-reserved-in-six-steps rule**, in the `language` package's `ete/` directory.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note names a term absent from the STE dictionary, and reserves it. A definition exists to name a term, and a term names something in the subject field. A **substitution's Use word** with no STE note is **ordinary vocabulary**, which is not reserved and not rewritten. See the `language` package's ordinary-vocabulary-is-not-reserved-and-not-rewritten rule, and its waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

**A vocabulary states this by citing this rule, not by repeating it.** One line at its head says that every word in it is approved or reserved, and points here.

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

Related:

- the `language` package's `vocabulary.md` and its waytide-keeps-its-word-where-the-ste-word-means-something-else rule — the level above this one
- its language-is-used-precisely-here-and-words-are-load-bearing rule — the premise every vocabulary follows from
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory
- the file-names rule — why the project's file takes no prefix
- the the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule — the read instruction that names it
