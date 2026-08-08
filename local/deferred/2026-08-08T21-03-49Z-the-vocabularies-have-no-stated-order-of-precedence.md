# Waytide's vocabularies have no stated order of precedence, and the STE baseline has no place in them

Waytide holds five `vocabulary.md` files. **No rule says which one wins when two of them disagree
about a word.** The developer stated the order on 2026-08-08, and it is written down nowhere:

1. STE technical nouns and technical verbs
2. STE approved alternatives — what Waytide's tables call substitutions
3. The `language` package's terms
4. The `language` package's substitutions
5. An individual package's terms
6. An individual package's substitutions

- **Gated on:** nothing, for levels 3 through 6. The order among Waytide's own vocabularies is a
  question about Waytide and can be settled now. **Levels 1 and 2 are gated on the Simplified
  Technical English experiment reaching a verdict**, since putting STE at the head of the order
  presumes the specification is adopted, which is what that experiment tests.

## What exists now

| Package | `## Terms` | `## Substitutions` | Other |
|---|---|---|---|
| `language` | 3 | 18 rows, and a `### Finer distinctions` section | — |
| `foundation` | 7 | 1 row, and a `### Finer distinctions` section | — |
| `design-by-efferent` | 18 | none | `## Retired terms (do not use)`, 8 entries |
| `testing` | 2 | 2 rows | — |
| `versioning` | 1 | none | — |
| `code` | — | — | no `vocabulary.md` |
| `git` | — | — | no `vocabulary.md` |

**The two STE levels are not represented at all.** `ASD-STE100` appears nowhere under
`waytide/system/`. The specification's text and the comparison against it are on an experiment
branch and in the vocabulary deferred item dated 2026-08-08.

## What stands in for the missing precedence rule

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

## Three defects that are separate from the ordering

- **No vocabulary marks part of speech.** Every `## Terms` section is one flat list of terms. The
  noun-against-verb distinction that STE Rules 1.5 through 1.13 turn on has no representation in
  any of the five files, and levels 1, 3, and 5 of the order above are stated in terms of it.
- **One thing has three headings.** `## Substitutions` in three packages, `## Retired terms (do not
  use)` in `design-by-efferent`, and nothing in `versioning`. A retired term and a substitution are
  the same shape: a word not to write, and the word to write instead.
- **Two packages have no vocabulary at all.** `code` and `git` have no `vocabulary.md`. Whether
  each needs one is a question this would answer, since the packages-carry-a-vocabulary claim is
  not made anywhere and the absence is not marked as deliberate.

## What STE calls these things

Worth knowing before naming Waytide's, since level 2 of the order is STE's mechanism:

| Waytide | STE |
|---|---|
| the **Say** column | **approved alternatives**, or **alternatives** — the dictionary's column 2 header |
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

**How to apply:** settle the order among Waytide's own vocabularies first, since nothing gates it,
and record it where a reader looking at any one vocabulary will find it rather than in a rule that
only one of them cites. Decide whether a package vocabulary marks part of speech, which levels 1,
3, and 5 of the order need. Decide whether a retired term and a substitution are one thing under
one heading. Decide whether `code` and `git` want vocabularies or whether their absence is
deliberate and should say so. Hold levels 1 and 2 until the Simplified Technical English experiment
reaches a verdict. Related: the vocabulary deferred item dated 2026-08-08 (which carries the terms
this would order), the project-specific-approved-words deferred item (which carries the STE
provision the top two levels rest on), the `language` package's `language-is-precise-here` rule
(the premise the vocabularies follow from), and the rules-convention.

---

Authored by Scott Bellware on Sat Aug 8 2026 at 2:03:49 PM PT
