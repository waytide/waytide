# Language — Vocabulary

The language package's vocabulary: the terms it defines and the word substitutions it enforces. Binding — use these terms and swaps in code, tests, rules, designs, commits, and prose.

**Every word here is one of three things**, and this holds for the terms below and for the **Say**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning.
- **Reserved** by Waytide as a technical noun or a technical verb, under STE Rules 1.5 through 1.13
  in category 19, Computer science, information and communication technology. This is the case for
  a word this project coined, and for a word the STE dictionary disputes. STE Rule 1.8 requires a
  technical noun to be approved in the subject field, and this file is that approval.
- **Approved with a meaning Waytide does not use**, which STE Rule 1.3 forbids.

**A word with no STE note is absent from the STE dictionary and is reserved.** See the `language`
package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

The *principles* that govern word choice stay as rules — `name-literally-not-by-analogy`, `no-slang`, `communicate-plainly-name-the-thing`, `language-is-precise-here`. This file holds the settled lexicon those principles produce.

## Terms

- **solubility** — how readily a unit dissolves into use, judged from the use site; the design-quality a unit is judged against, and the quality the name-literally test serves. It is a **load-bearing methodological principle, not merely a term** — its full treatment is the standalone `solubility` rule; it is glossed here only as the vocabulary reference.
- **efferent** — the use-site perspective: designing a unit from the outside in, from the standpoint of what uses it — the view that conducts outward from the unit toward its use. A general design-vocabulary term; `design-by-efferent` is the method built on designing from this view, and specializes the term in its own vocabulary.
- **Simplified Technical English Vector (STEve)** — Waytide's implementation of ASD-STE100 Simplified Technical English: the STE dictionary and the STE writing rules, with Waytide's reserved terms and its substitutions, in the precedence the `ste/` rules state. **`Say it in Steve` is the instruction to write that way**, and it differs from `say it in STE`, which asks for the raw standard — that one forbids `efferent`, `cradle`, `hinge`, and every other term Waytide reserved. Both spellings, `STEve` and `Steve`, name the same thing. The rules are in `waytide/system/language/ste/`.
- **actuation** — the invocation of a unit, from its use site; the first efferent reference to it. A general term; `design-by-efferent` specializes it — there the actuation is written before any implementation, and is the first gate. **STE: not approved. The STE dictionary gives OPERATION, which names the running of a thing rather than its invocation from a use site.**

## Words from the design vocabulary

Words Waytide takes from the established vocabulary of **structural design and software design**,
because the extant term already says the thing exactly. **Waytide does not define these.** It uses
them in their own sense, and reserves them where the STE dictionary disputes them.

**This is what the language-is-precise-here rule asks for.** That rule holds that the precise word
is the one that already means exactly this, and that it is as often an established technical term
as a plain one. A word here is one of those, kept rather than coined.

- **preserve** — to keep something that already exists, rather than putting it there or serving it.
  A rule preserves a mindset. Clarity is preserved. **STE: not approved.** The STE dictionary gives
  PRESERVATION, a technical noun for a maintenance procedure, which does not carry this.

**A term Waytide defines belongs above, not here.** `load-bearing` comes from structural
engineering and `cradle` from a physical object, and `design-by-efferent` defines both, so both are
terms. The line is whether Waytide says what the word means.

## Substitutions

General, domain-less word substitutions — the literal term in place of a slang, imported-jargon, or figurative one, and the unambiguous term in place of one that leaves a reader to guess which system it belongs to. When the impulse is a word in the **Don't say** column, write the **Say** term. (Domain-specific swaps live in their own package's vocabulary — `verified`/`prevent` in `testing`.)

| Say | Don't say | What it names |
|---|---|---|
| **normal path** | "happy path" | the ordinary, non-error course through a method or feature; the raising cases are "error cases" / "exceptional cases", and the course through one is the **exceptional path** — never "sad path", and never "exception path" |
| **conform** (or *reconcile* / *propagate* where more exact) | "sweep" | bringing code or prose into line with a convention. **STE: not approved.** The STE dictionary gives AGREE, which does not carry it |
| **convey** (or plainly "pass … through") | "thread" | a value passed through layers of methods / APIs. **STE: not approved.** The STE dictionary gives MOVE |
| **increment** | "cut" | a bounded slice of scope delivered as a step |
| **install packages** / "the installed bundle" | "vendor" | a plain installation of gem/package dependencies |
| **scenario** | "arm" | one variant or case a method or feature handles |
| a direct question — **"is that right?"**, "does that work?" | "does that land?" | a plain question, not dressed up — and see below for "land" in other uses |
| **effect** | "what it costs" | the result or consequences of a change, named neutrally rather than presumed a cost |
| **examine** | "decode" | working through or inspecting something to understand it |
| **start** | "pick up" | beginning work on something — a task, a deferred item, or other queued work |
| **dash-separated, lower-case** | "kebab-case" | a name written in lower-case with its words joined by dashes |
| **name** | "slug" | the descriptive part of a filename |
| **discontinue** | "retire" | taking a word or a rule out of use. **STE: not approved.** The STE dictionary gives STOP, whose approved meanings are both terminal, and a discontinued word did not end |
| **engineer** | "developer" | the person the work is done with and for — at the loop, at a hinge, and as the reader the terminology is conveyed to |
| **mediates** | "wrap" / "wrapper" | an object that provides access to another through itself — see below |
| **obsolete** (or a more exact word) | "dead" | something no longer in force or in use — see below |
| **sent to** | "initialized with" / "passed to" | a value passed into a method or initializer — see below |
| **efferent** | "caller" (caller-side, caller-first, caller's-eye) | the use-site perspective — designing a unit from the outside in |
| **actuation** | "the call" (the call shape, the call site) | the invocation of a unit — the first efferent reference — see below |
| **activate** / **deactivate** | "switch on" / "switch off" | bringing a system or mechanism into force, or taking it out of force — see below |
| **the standard's name, then the part** — *STE Rule 1.7*, *the STE dictionary* | "Rule 1.7", "the dictionary" | a reference to any part of an external standard — see below |

### Finer distinctions

- **mediates.** The canonical form is the bare verb — *`X` mediates `Y`*, not *`X` mediates for `Y`*. "wrap"/"wrapper" reads as a generic decorator and hides the relationship; "mediates" names it exactly — the object stands between a user and the thing it fronts, providing access to it.
- **obsolete** is the fallback, not the goal — reach for the exact word when there is one: a reference whose target moved is **unresolvable**; a rule no longer in force is **discontinued** or **superseded**; a branch that can only go one way **has nothing to decide**; an assignment that never happens **never fires**. "dead" over-dramatizes — nothing died, and the drama distorts judgment, making routine tidying read as urgent repair.
- **sent to** frames a call as sending a message with arguments — an argument is *sent to* the method that receives it. "initialized with" and "passed to" are looser, mechanism-flavored phrasings for the same thing.
- **actuation** governs the invocation *noun*. "To call a method" in the pure-mechanism sense, and "call it X" meaning to *name* it, are different uses — not covered. Use "actuation shape" for its shape, and "use site" for where it is invoked.
- **activate** names what actually happens — a system is brought into force. "Switch on" borrows a light switch, and the borrowed image is wrong in the way that matters: a switch is binary, instantaneous, and reversible by the same gesture, where activating a system is a set of arrangements that can be partly in place. The same holds for **deactivate** over "switch off". This is not a preference for the longer word — "activate" is the extant term for the act, and the figure displaced it.
- **A reference to part of an external standard names that standard.** Waytide has rules of its
  own, so a bare *Rule 1.7* leaves a reader to work out which system it belongs to, and the
  numbering gives them nothing to work it out from. **The same holds for the standard's
  dictionary**, because every `vocabulary.md` in Waytide is an approved-word dictionary for its
  package, so *the dictionary* names four things at once. Write the standard's name first —
  **STE Rule 1.7**, **STE Rules 1.5 through 1.13**, **the STE dictionary** — in prose, records,
  commits, and dialogue alike. This is a rule about ambiguity rather than about a figure of
  speech: neither word is wrong, and the reference is still incomplete without the name. A Waytide
  rule needs no such prefix, being referred to by its name.

- **land** is a figure in more than one use. As a question — "does that land?" — say a direct question ("is that right?"), per the row above. As an effect taking hold or a change being deployed — "what landed", "the change landed", "it landed on master" — say **what changed**, **what was affected**, or **took effect**.

**Applying it:** when the impulse is a **Don't say** word — in names, prose, comments, commit messages, logs, loop records, and dialogue — write the **Say** term. When a new substitution is settled, add a row here.

---

Authored by Scott Bellware on Wed Jul 22 2026 at 3 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 7 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 5:04:19 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:59:32 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:08:29 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 8:06:54 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 10:50:31 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 2:01:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 4:53:01 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:56:40 PM PT
