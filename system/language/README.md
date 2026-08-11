# Waytide — language

How language is used: precisely. A word is not a label applied to a thought after the fact. It is the thought's working surface, so choosing a word chooses a concept. The words are load-bearing, and they are chosen deliberately.

**The premise**

- **language-is-precise-here**. Words are load-bearing, not decoration. A word choice is a design decision. Precision is not formality: the most precise word is very often the plainest one. Everything below follows from this.

**The four disciplines that make it achievable**

- **name-literally-not-by-analogy**. Name a concept by describing what it literally is. No analogies, opaque codes, or academic jargon.
- **no-slang**. Use literal, non-figurative terms in prose and in conversation, not only in the code.
- **communicate-plainly-name-the-thing**. In explanation and conversation, use plain words and the real names of things. No invented labels ("tier 1") or compressed jargon offered as if already shared.
- **expand-abbreviations-on-first-use**. Spell out an abbreviation the first time it appears (full term, abbreviation in parentheses). Don't use unexplained shorthand.
- **an-answer-is-a-list-and-prose-must-justify-itself**. An answer to the engineer is a list, and each item states a fact rather than narrating — no describing a choice, no unasked-for reason, no characterizing the work. Prose is written only where the answer is a sentence or two. Reasoning whose steps depend on each other takes a numbered list rather than prose, since an unordered list asserts its items are parallel. Where an expansion would add something, the answer ends by offering one.

**Its vocabulary** — the terms the package defines and the substitutions it enforces — lives in `vocabulary.md`:

- **terms** — `solubility` (how readily a unit dissolves into use — the design-quality criterion, and a methodological principle with its own rule), and the general design-vocabulary terms `efferent` (the use-site perspective) and `actuation` (the invocation of a unit), which `design-by-efferent` specializes.
- **the substitutions**. The general, domain-less word swaps — the literal term in place of each slang or figure (happy path → normal path, wrap → mediates, caller → efferent, the call → actuation. The rest), a table with notes for the few that need them. Domain-specific swaps live with their domain (`verified`/`prevent` in `testing`, and the hinge/cradle/loop lexicon in `design-by-efferent`).

Every package keeps its terminology this way — its terms and substitutions in its own `vocabulary.md`, the model `design-by-efferent` established. A package with no terminology of its own keeps no `vocabulary.md`. The file is written where a package has terms whose ordinary meaning misleads or words it swaps, not to complete a set. The *principles* that govern word choice stay as the rules above.

Includes `foundation`.

```
language  →  foundation
```

## Installing into a project

Install with `git subtree`. It puts the files in your project's `waytide/system/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/system/language https://github.com/waytide/language.git master --squash
git subtree pull --prefix waytide/system/language https://github.com/waytide/language.git master --squash
```

It includes `foundation` — install that too, or run `waytide/system/language/install-dependencies.sh` from your project root.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/system/language https://github.com/waytide/language.git master --squash
```


## License

Waytide is licensed under the **Eventide Common Interest License**. It is source-available and free to use. It is not open source in the strict sense, since it does not permit modification. The license text is forthcoming and will be published in `LICENSE`.
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:57:57 PM PT
