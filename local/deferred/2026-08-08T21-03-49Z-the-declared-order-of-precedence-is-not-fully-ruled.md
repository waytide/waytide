# The declared order of precedence among Waytide's vocabularies is not fully ruled

Waytide holds five `vocabulary.md` files. **The developer declared the order they decide in on
2026-08-08.** It is settled. Two of its six levels are now carried by a rule, and four are not:

1. STE technical nouns and technical verbs
2. STE approved alternatives — what Waytide's tables call substitutions
3. The `language` package's terms
4. The `language` package's substitutions
5. An individual package's terms
6. An individual package's substitutions

**Levels 1 and 2 are ruled.** The `language` package's
waytide-keeps-its-word-where-the-ste-word-means-something-else rule states that the STE dictionary
decides first, and that Waytide keeps its own word where the approved word means something else.

**Levels 3 through 6 are not.** No rule says that the `language` vocabulary yields to a package
vocabulary, or that a package vocabulary yields to a project's own `waytide/local/rules/`.

- **Waits for:** nothing.

**The order is now ruled, on 2026-08-09.** `foundation`'s vocabulary-convention rule carries levels
3 through 6, and states that the more specific vocabulary decides. It also carries the criterion
that decides which packages have a vocabulary at all.

**The conflation was corrected in `design-by-efferent` on 2026-08-09.** It gained a
`## Substitutions` table holding the seven, and its `## Discontinued terms` keeps the two that name
no replacement.

**One case is on `master` and cannot be corrected from here.** `language`'s `cut` entry calls a
two-sense substitution a discontinuation. That entry was written on `master` after this branch was
created, so this branch does not hold it. Correct it when this branch merges.

**What remains open is one thing.** Four vocabularies still have nowhere to record a true
discontinuation, because they carry a `## Substitutions` section or nothing. None of them has a
discontinuation to record today, so the gap is not urgent.

## What exists now

| Package | `## Terms` | `## Substitutions` | Other |
|---|---|---|---|
| `language` | 3 | 18 rows, and a `### Finer distinctions` section | — |
| `foundation` | 7 | 1 row, and a `### Finer distinctions` section | — |
| `design-by-efferent` | 18 | none | `## Discontinued terms (do not use)`, 9 entries |
| `testing` | 2 | 2 rows | — |
| `versioning` | 1 | none | — |
| `code` | — | — | no `vocabulary.md` |
| `git` | — | — | no `vocabulary.md` |

**The two STE levels are not represented at all.** `ASD-STE100` appears nowhere under
`waytide/system/`. The specification's text and the comparison against it are on an experiment
branch and in the vocabulary deferred item dated 2026-08-08.

## What stands in for the four unruled levels

- **Per-term prose cross-references.** The `language` vocabulary's `actuation` entry reads *A
  general term; `design-by-efferent` specializes it*, and its `efferent` entry says the same.
  Three hand-written sentences do, for three terms, what one rule would do for all of them.
- **One parenthesis about placement.** The `language` substitutions preamble reads *Domain-specific
  swaps live in their own package's vocabulary*. That says where a new row goes. It does not say
  which row wins.
- **One claim of precedence, scoped inside a package.** The `design-by-efferent` vocabulary reads
  *This is the canonical glossary; the deeper docs defer to it* — its own rules, not other
  packages.
- **One claim of reach without precedence.** The `foundation` vocabulary reads *These are the terms
  every other package and every project uses*.

## The second defect: substitution and discontinuation are conflated

**They are two acts, not one.** A **substitution** names a word not to write and the word to write
instead. A **discontinuation** removes a word from use with nothing in its place.

**`design-by-efferent` files seven substitutions under `## Discontinued terms (do not use)`.**
`intrinsic` to **subtle**, `asymmetric` to **load-bearing**, `non-hinge` to **mechanical**, `pass`
to **cycle**, `suspending DBE` to **unattended**, `gate` as a verb to **wait**, and
`gating cadence` to **the human's participation**. Each names a replacement, so each is a
substitution.

**Two of its nine entries are discontinuations.** `discriminator`, where the concept was dropped
rather than renamed, and `capability-independent`, where the instruction is to state the thing
plainly. Neither has a replacement term.

**`language` makes the same conflation, on `master`.** Its `Finer distinctions` says `cut` is
figurative in two senses and both are discontinued. Both senses have replacements — `increment`,
and `created` or `branched from` — so both are substitutions. That entry is not on this branch.

**Four vocabularies have nowhere to put a discontinuation.** `foundation`, `language`, `testing`,
and `versioning` carry a `## Substitutions` section or nothing. A word Waytide stops using with
nothing in its place has no home in any of them.

## What is not a defect, settled on 2026-08-09

- **A vocabulary need not mark part of speech.** The declaration of Waytide's reserved terms under
  STE Rules 1.5 through 1.13 needs the field, and the STE Spec experiment record carries it there
  on all 36 terms. A package vocabulary is a working glossary whose terms are unambiguous in use.
- **A package without a vocabulary is not missing one.** **A package gets a vocabulary only when it
  has a specialized vocabulary for its domain.** `code`, `code/ruby`, and `git` do not, so they
  have none. This criterion is stated here and is carried by no rule.
- **A term needs no status field, and an entry needs no worked example.** Both are STE's shape
  rather than Waytide's. STE marks status and gives a right and a wrong sentence on every entry
  because it holds 2,180 entries in one alphabetical run, for writers constructing sentences in a
  second language. A Waytide vocabulary holds three to nineteen entries in named sections, for
  engineers reading rules that carry their own examples.

## What STE calls these things

Worth knowing before naming Waytide's, since level 2 of the order is STE's mechanism:

| Waytide | STE |
|---|---|
| the **Say** column | **approved alternatives**, or **alternatives** — the STE dictionary's column 2 header |
| the **Don't say** column | **a word that is not approved** — the specification writes this 46 times and `unapproved` never |
| the act the table instructs | **word-for-word replacement** — the subject index, and STE Rules 1.2 and 9.1 |
| a **retired term** | no counterpart. STE has no retirement concept, and its dictionary carries one status axis and no history |

**STE Rule 9.1 names a case Waytide's tables do not have:** *Use a different sentence construction
to write a sentence when a word-for-word replacement is not sufficient.* Every row in every Waytide
substitutions table assumes the swap works.

## A seventh level the stated order does not name

`waytide/local/rules/` is binding and belongs to one project, so a consuming project can add
vocabulary below every package. It holds one rule and no vocabulary today. Where it sits in the
order is undecided.

**Why:** a vocabulary that does not say what it defers to is a vocabulary that cannot be applied
when two of them disagree, and five of them exist. The cost is not hypothetical: `actuation` is
defined in both `language` and `design-by-efferent`, and which definition governs is settled today
by a sentence one of them happens to carry. Adding STE at the head makes the question unavoidable,
because a standard with 729 approved words will disagree with a package vocabulary somewhere.

**How to apply:** write levels 3 through 6 into a rule, and put it where a reader looking at any
one vocabulary will find it rather than in a rule that only one of them cites. Correct the `cut` entry in `language` when this branch merges,
since that entry is on `master`. Decide where a true discontinuation goes in a vocabulary that has
only a substitutions table. Write down the
criterion that decides whether a package has a vocabulary at all. Related: the vocabulary deferred item dated 2026-08-08 (which carries the terms
this would order), the project-specific-approved-words deferred item (which carries the STE
provision the top two levels rest on), the `language` package's `language-is-precise-here` rule
(the premise the vocabularies follow from), and the rules-convention.

---

Authored by Scott Bellware on Sat Aug 8 2026 at 2:03:49 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 10:50:31 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 1:52:23 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 2:09:43 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 4:53:01 PM PT
