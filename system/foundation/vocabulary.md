# Foundation — Vocabulary

The foundation package's vocabulary: the terms it defines and the word substitutions it
enforces. These are the terms every other package and every project uses, because foundation
defines the artifacts the rest of the system writes into. Binding — use these terms and swaps in
rules, artifacts, prose, and dialogue.

**Every word here is one of two things.** This holds for the terms below, and for the **Say**
column of any substitutions table in this file.

- **Approved** in the STE dictionary, and used with its approved meaning. Nothing further is owed,
  and the entry fixes the word against a neighbouring one rather than asking for permission.
- **Reserved** as a technical noun or a technical verb, **in a category the entry names**. An STE
  noun category is reserved under STE Rule 1.5 where the dictionary omits the word, and under STE
  Rule 1.6 where it lists and refuses it. An STE verb category is reserved under STE Rule 1.12. An
  ETE category is reserved under the ete-declares-a-noun-category-and-a-verb-category rule. STE
  Rule 1.8 requires a technical noun to be approved in the subject field, and this file is that
  approval.

**A reserved word's entry states what the STE dictionary says about it.** The word is absent from
the dictionary. Or the dictionary refuses it and gives an alternative. Or the dictionary approves it
with a meaning Waytide does not use. The last of the three is governed by the
ete-fixes-the-meaning-of-a-word-in-its-category rule, and it is the most expensive of them.

**A word with no STE note is absent from the STE dictionary and is reserved.** See the `language`
package's waytide-keeps-its-word-where-the-ste-word-means-something-else rule.

## Terms

### The three ways of saying "not now"

**These are the terms most easily confused, and they are confused because nothing has stated
them beside each other.** They differ in *what is set aside*, *where it goes*, and *what brings
it back*.

- **deferred** — a **design change** identified mid-task and postponed until the current task
  finishes. It goes into `waytide/local/deferred/` as a **queue, not a record**: an item is
  worked and then its file is **deleted**, leaving a decision-log entry as the durable trace. A
  deferred item is *waiting its turn* — the project still intends to do it. It carries a
  `**Waits for:**` line saying what must finish first, and may carry a `**Priority:**` rank. Its
  rule is the deferred-convention.
- **suspended** — something the project **stopped doing** and set aside rather than deleted: a
  rule that became ceremony, a procedure nobody runs. The thing **itself moves** into
  `waytide/local/suspended/`, intact, carrying its **return address** so the suspension can be
  reversed. A suspended thing is *not waiting its turn* — the project has stopped, and the
  resumption note states what would change that. Its rule is the suspended-convention.
- **out of scope** — what a **design deliberately excludes**. It is neither queued nor set
  aside. It is a boundary the design draws around itself, recorded in its trailing **Out of
  Scope / Deferred** section so a reader knows the omission was chosen rather than overlooked.
  Its rule is the design-convention.

The distinguishing question: **deferred** is *not yet*, **suspended** is *no longer*, **out of
scope** is *not here*.

### The rest

- **projection** — a **derived** artifact that reads a record **without destroying it**. A
  summary generated at read-time is a projection of the decision log. A work session record is a
  projection of the records it is reconstituted from. The term exists to name the alternative to
  consolidation: where the impulse is to merge, rewrite, or tidy a record into something more
  readable, a projection gives the readability and leaves the record as written. A projection is
  regenerated, never maintained — which is why the record it derives from is **not back-edited**
  to suit it.
- **reconcile** — to correct the **live, forward-looking** artifacts that cite something which
  has changed, moved, or been deleted. Reconciling is directed at what points *at* a thing, not
  at the thing itself, and it is confined to artifacts read as current: an observation, a
  design, a plan, another deferred item. **Historical records are left as written**, the one exception being a record that discloses what should not have been disclosed. See the disclosure rule. A design is
  reconciled **against** the records rather than **regenerated from** them: it is a source of
  truth a plan points back at, so rebuilding it from downstream work would invert the direction
  of authority.
- **working-state artifact** — a file holding the project's **own work** rather than an
  installed rule. It is everything under `waytide/local/` except `rules/`: log entries, deferred
  items, observations, designs, plans, work session records, loop records, feature records,
  experiments, migration records, and suspended things. The class exists because a single set of
  obligations falls on all of them: the ISO-8601-UTC filename prefix, and the
  `Authored by … / Changed by …` provenance footer.
- **recognizable-content line** — a **bold label, a colon, and a value**, optionally as a list
  item — `- **Priority:** 3`, `**State:** active`, `**Origin:** waytide/system/…`. It is the
  system's one protocol for content that is read **mechanically** as well as by a person:
  `session-start.sh` parses these lines. One form in the system rather than a new one per
  directory. Frontmatter is permitted and would serve equally. It is not used where this form
  already fits.
- **transfer** — a **technical verb**: to move responsibility for the next act from one party to
  the other. The agent **transfers responsibility to the engineer** at a hinge, and the engineer
  **transfers responsibility to the agent** once they make the decision. It names the point a
  collaborative workflow changes hands, which is not the mechanism that carries it — a `gate` is
  the mechanism, and the loop `waits` there. **STE: not approved. The STE dictionary gives
  `MOVE (v)`**, which says nothing about who is answerable next. Reserved under STE Rule 1.12 in
  category 19.
  - **It is never written as a noun.** STE Rule 1.13 forbids a technical verb used as one, so
    there is no *the transfer of responsibility*. Write the verb — *responsibility transfers to
    the engineer*. This is the `gate` case in mirror image: that word is a noun and takes no verb
    form, and this one is a verb and takes no noun form.
- **responsibility** — what transfers: answerability for the next act in the work. **STE: absent**,
  and reserved as a technical noun under STE Rule 1.5 in category 19.

## Substitutions

Foundation-domain word substitutions. When the impulse is a word in the **Don't say** column,
write the **Say** term.

| Say | Don't say | What it names |
|---|---|---|
| **work session record** | "session record" | the record of a stretch of work — see below |

## Discontinuations

A word taken out of use with **nothing in its place**. This is not a substitution — a substitution
names two words, and each of these names one.

- **handoff** — the point where the work passed between the engineer and the agent. It is
  discontinued because `transfer` covers it and is a **verb**, so no word-for-word replacement
  exists: the sentence is rewritten rather than patched. *The naming gate offers the same handoff
  as the actuation gate* becomes *the naming gate transfers responsibility the same way the
  actuation gate does*. This is the case STE Rule 9.1 names: use a different sentence
  construction where a word-for-word replacement is not sufficient. It is the first one
  Waytide has recorded.

### Finer distinctions

- **work session record** — always carrying **work**. Bare *session* is ambiguous. A reader can supply a shell session, a therapy session, or a
  parliamentary one, and the shell reading is the one an engineer reaches first. The qualifier says which sense is meant. This holds in the prompt that offers to write one, and in prose about either. The record's own title is `# Work Session — <name> (<date>)`, and the directory name is `waytide/local/work-sessions/`.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 11:31:19 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:12:44 AM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:21:56 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:23:03 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 5:50:23 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:03:20 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 8:18:59 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:56:35 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 7:22:16 AM PT
Changed by Scott Bellware on Wed Aug 12 2026 at 9:24:38 AM PT
