# STE is the baseline, and a Waytide term overrides it where the alternative loses the meaning

Waytide writes its prose in ASD-STE100 Simplified Technical English. The standard gives an
approved dictionary and 53 writing rules. It also permits a project to add its own technical
nouns and technical verbs. STE Rules 1.5 through 1.13 govern that.

**This rule states the order.** The dictionary decides first. A Waytide term decides where the
dictionary's alternative loses the meaning.

## The override

The dictionary marks a word as approved or as not approved, or it does not list the word at all.
For a word that is not approved, the dictionary names an approved alternative.

- **Use the alternative** where it carries the meaning. `initiate` becomes `start`, `impact`
  becomes `effect`, and `protect` becomes `prevent`.
- **Keep the Waytide term** where the alternative loses the meaning. Reserve the term as a
  technical noun or a technical verb. Record it in the package's `vocabulary.md`.
- **A word the dictionary does not list is not a defect.** STE Rule 1.1 permits an absent word as
  a technical noun or a technical verb. `efferent`, `cradle`, and `solubility` are all absent.

**The worked instance is `sweep`.** The dictionary replaces `sweep (v)` with `SCAN`, as in
`MAKE A SCAN OF THE …`. The `language` vocabulary discontinues `sweep` for **`conform`**. Neither
`SCAN` nor `AGREE`, which the dictionary gives for `conform`, carries the meaning. The meaning is
to bring code or prose into line with a convention. So `conform` is reserved and it wins.

## An absent word and a word that is not approved cost different things

**Absent is a gap.** The standard never considered the word. This is the ordinary case for a term
Waytide coined for a concept the standard has no word for.

**Not approved is a disagreement.** The standard considered the word and named something else. An
override there rejects a stated decision, so the record says which case a reserved term is in.

`reserve` is absent. `discontinue` is not approved, and the dictionary gives `STOP`.

## A substitution is not an override

The two are different acts. A **substitution** replaces a word Waytide rejects. An **override**
keeps a word STE rejects. `conform` is both, which is why it reads as one thing.

**Why:** the standard and Waytide's vocabulary disagree in a small number of places. Each
disagreement is settled the same way every time it is met, unless a rule settles it once. The
dictionary is right about the ordinary word. It is not right about a term Waytide coined for a
concept the standard never addressed. Naming which decides, and when, keeps a writer from choosing
a worse word out of deference.

**How to apply:** write to the dictionary. Where the dictionary names an alternative, use it. Where
the alternative loses the meaning, keep Waytide's term. Reserve it in the package's
`vocabulary.md`, with its part of speech and its dictionary status.

Related: the waytide-prose-conforms-to-the-ste-writing-rules rule in this directory. The
`language` package's `vocabulary.md` and its language-is-precise-here rule. The specification at
`waytide/local/reference/`, which is the authority this rule defers to.

---

Authored by Scott Bellware on Sat Aug 8 2026 at 8:11:28 PM PT
