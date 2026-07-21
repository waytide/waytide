# Waytide — language

How language is used: precisely. A word is not a label applied to a thought after the fact — it is the thought's working surface, so choosing a word chooses a concept. The words are load-bearing, and they are chosen deliberately.

**The premise**

- **language-is-precise-here**. Words are load-bearing, not decoration; a word choice is a design decision. Precision is not formality: the most precise word is very often the plainest one. Everything below follows from this.

**The four disciplines that make it achievable**

- **name-literally-not-by-analogy**. Name a concept by describing what it literally is; no analogies, opaque codes, or academic jargon.
- **no-slang**. Use literal, non-figurative terms in prose and in conversation, not only in the code.
- **communicate-plainly-name-the-thing**. In explanation and conversation, use plain words and the real names of things; no invented labels ("tier 1") or compressed jargon offered as if already shared.
- **expand-abbreviations-on-first-use**. Spell out an abbreviation the first time it appears (full term, abbreviation in parentheses); don't use unexplained shorthand.

**One general term-with-meaning**

- **solubility**. How readily a unit dissolves into use; usable and transparent from the standpoint of what uses it, as simple as it should be and no simpler. The quality the name-literally test serves, and the criterion a design is judged against. Methods that build on it (e.g. `design-by-efferent`, where it is a hinge) reference it here rather than redefining it.

**The substitutions, gathered as one lexicon**

- **word-substitutions**. The project's fixed word substitutions, each an instance of the premise — a loose word was carrying a loose concept, and the exact word took its place (happy path → normal path, wrap → mediates, dead → obsolete, and the rest). One rule: a table of the swaps with notes for the few that need them. These are general substitutions with no home domain; terms tied to a domain live with that domain (controls/verified/protect in `testing`; the efferent/actuation/hinge lexicon in `design-by-efferent`).

**This package is not a glossary.** It governs how language is used everywhere. A package with a cohesive lexicon of interlocking terms carries it as its own `vocabulary.md` — `design-by-efferent` is the one that does.

Includes `foundation`.

```
language  →  foundation
```

## Installing into a project

Install with `git subtree` — it puts the files in your project's `waytide/rules/` tree, committed alongside your code and read at session start:

```
git subtree add  --prefix waytide/rules/language https://github.com/waytide/language.git master --squash
git subtree pull --prefix waytide/rules/language https://github.com/waytide/language.git master --squash
```

It includes `foundation` — install that too, or run `sh waytide/rules/language/install-dependencies.sh` from your project root.

**Refresh from upstream** periodically to pull the latest rules:

```
git subtree pull --prefix waytide/rules/language https://github.com/waytide/language.git master --squash
```


## License

Waytide is in early development and is **not yet licensed for use** — all rights reserved. A license, the Eventide Common Interest License, is forthcoming.
