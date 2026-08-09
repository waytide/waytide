# `vocabulary.md` — what a package's vocabulary is, which package has one, and which one decides

A package's `vocabulary.md` holds the terms that package defines and the word substitutions it
enforces. It is binding. Use its terms and its substitutions in code, tests, rules, designs,
commits, records, and dialogue.

**A package gets a vocabulary only when it has a specialized vocabulary for its domain.** A
package whose subject is written in ordinary words has none. The absence is correct rather than
missing. `git`, `code`, and `code/ruby` have none. Five packages do.

## What a vocabulary holds

- **Terms** — the concepts the package defines. `solubility`, `efferent`, `hinge`, `precondition`.
  A term is a glossary entry, and it says what the concept is.
- **Substitutions** — a word not to write, and the word to write instead. `conform` rather than
  "sweep". `verified` rather than "green".
- **Discontinuations** — a word removed from use with nothing in its place. `discriminator` went
  because the concept went, not because another word replaced it.

**A substitution and a discontinuation are different acts.** A substitution names two words. A
discontinuation names one. Do not file one under the other's heading.

## Which vocabulary decides

**Five hold terms, and a word can appear in more than one.** They decide in this order, from the
one that decides first:

1. **The STE dictionary**, and Waytide's reserved terms where the approved word means something
   else. The `language` package's waytide-keeps-its-word-where-the-ste-word-means-something-else
   rule states this level and its exception.
2. **The `language` package's vocabulary** — the terms and substitutions that belong to no domain.
3. **An individual package's vocabulary** — the terms and substitutions of one domain.
4. **The project's own rules**, in `waytide/local/rules/`, which a project writes for itself.

**The more specific decides.** A domain knows its own words, and a general vocabulary cannot
anticipate what a domain needs. A project knows its own work, and Waytide cannot anticipate that
either.

**Most of the time the levels do not meet.** The `language` vocabulary holds the substitutions that
belong to no domain, and it says so. A domain-specific substitution belongs in its own package. So
two vocabularies rarely name the same word, and the order settles the case where they do.

## Specialization is not conflict

**A package can narrow a general term rather than contradict it.** `language` defines `actuation`
as the invocation of a unit from its use site. `design-by-efferent` keeps that meaning and adds
that the actuation is written before any implementation. The narrower entry does not displace the
general one. It rests on it.

**Say which is happening.** Where a package narrows a term, its entry names the general term it
narrows. Where a package keeps a word the `language` vocabulary substitutes away, its entry says so
and gives the reason. A reader must not have to work out which case an entry is.

**Why:** five vocabularies bind the same prose. A reader who finds a word in two of them cannot
choose without a stated order. The cost is not hypothetical. `actuation` is defined in
`language` and in `design-by-efferent`, and which one governs rests today on a sentence one of them
happens to carry. Naming the order once removes that from every future case.

**How to apply:** put a term in the vocabulary of the package whose domain it belongs to. Put a
domain-less term or substitution in `language`. Give a package a vocabulary only when its domain
has specialized words. When a word appears in two vocabularies, the more specific one decides, and
the entry says whether it narrows the general term or replaces it. Keep substitutions and
discontinuations under separate headings. Related: the `language` package's `vocabulary.md` and its
waytide-keeps-its-word-where-the-ste-word-means-something-else rule (the level above this one), its
language-is-precise-here rule (the premise every vocabulary follows from), and the rules-convention.

---

Authored by Scott Bellware on Sun Aug 9 2026 at 2:19:00 PM PT
