# Waytide — Vocabulary

This project's own vocabulary: the terms it settles for itself and the word substitutions it
enforces. Binding — use these terms and swaps in rules, artifacts, prose, and dialogue. **Its terms
and substitutions decide over every package's**, per the `foundation` vocabulary-convention.

**Every word here is one of two things.** This holds for the terms below, and for the **Use**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is required,
  and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE
  noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE
  Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An
  ETE category is reserved under the ete-declares-its-own-categories rule. STE
  Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that
  approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from
the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it
with a meaning Waytide does not use. The last of the three is governed by the
ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**Silence means different things in the two kinds of entry.** A **definition** with no STE note
names a term absent from the STE dictionary, and reserves it. A **substitution's Use word** with no
STE note is **ordinary vocabulary**, which is not reserved and not rewritten. See the `language`
package's ordinary-vocabulary-is-not-reserved-and-not-rewritten rule.

## Substitutions

| Use | Don't use | Meaning |
|---|---|---|
| **superseded** | "overtaken" | a record, a claim, or a rule that a later one has replaced or left behind — see below |

### Finer distinctions

- **superseded** — `overtake` and `supersede` are each **absent from the STE dictionary**, so
  neither is refused and the selection between them is Waytide's own. `overtaken` was the corpus's
  phrasing, in the `foundation` deferred-queue-convention's *a reference inside an item that time
  has overtaken*, which the observations-convention quotes. **The Use word is ordinary vocabulary
  here**, as `cost`, `required`, and `justified` are in the `language` vocabulary, so it is not
  reserved and it takes no ETE category.
  - **It overlaps the `Superseded` state word, deliberately and at a cost.** The ideas-convention
    and the implementations-convention give that state a narrower meaning — *another idea replaced
    it, and the two name each other* — which requires a named counterpart. The substitution's sense
    is wider and needs no counterpart. So a reader who meets `superseded` in prose cannot tell from
    the word alone whether a `**State:**` line is being reported. **The state line is the only
    authoritative statement of a state**, which is what keeps the overlap from being ambiguous in
    the place it would matter.
  - **The `language` vocabulary's `moot` is not displaced.** It remains the adjective for the
    condition the state word `Lapsed` names — *no longer bearing on anything, because
    circumstances moved rather than because a judgment was reached*. `superseded` says a later
    thing replaced this one. `moot` says nothing bears on it now. Reach for `moot` where no
    replacement exists.

**No sweep follows from this.** Recording a substitution settles what is written from now on. The
`language` package's a-word-is-reserved-in-six-steps rule states it: *Replacing some other word
with it, wherever that other word already stands, is a separate instruction and is asked for
separately.* The two package rules that write `overtaken` are unchanged.

---

Authored by Scott Bellware on Thu Aug 20 2026 at 10:29:14 PM PT
