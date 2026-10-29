# An answer is a list, and prose must justify itself

Source: system/language/source/an-answer-is-a-list-and-prose-must-justify-itself.md

1. An answer to the engineer is a list.
2. Prose is not forbidden, but it is not the default.
3. Prose is written only where a condition below applies. The agent must name the condition that applies.
4. Where no condition applies, the answer is a list.

## What justifies prose

1. Only one condition justifies prose: the answer is a sentence or two.
2. Such an answer takes no list. Examples: *Yes*, *The suite passes*, *Correct — the rule says so and I did not follow it*.
3. No other condition justifies prose.
4. An explanation the engineer asked for does not justify prose. It is answered in a list.
5. Connected or dependent reasoning does not justify prose. It is answered in a numbered list.

## A list item states a fact. It does not narrate

1. Each list item states what is true. It does not describe the work.
2. A list whose items are narration fails this rule, even when the list form is correct.
3. Do not describe a decision as a decision. Examples: *the judgment is left as a judgment on purpose*, *this was recorded as a new entry rather than by rewriting the old one*, *the option was declined*.
4. Do not explain why something is as it is, unless asked. Examples: *so a later reader knows what tightening would mean*, *which is what keeps the record honest*, *for the same reason the other rule gives*.
5. Do not characterize the work or its result. Examples: *the miss is instructive*, *worth noting*, *this is the substantive part*, *cleanly*, *correctly*.
6. Do not report the agent's process. Examples: *I checked*, *verified rather than assumed*, *rather than trusting the composite's copy*.
7. State the fact that is left once those are removed. Example: *The rule names two stricter forms: the line on every list answer, or above a length threshold. Neither is adopted.*
8. Test each list item by asking whether it could be false. Remove it if it could not.
9. *The check is green*, *nine of thirteen scripts lack it*, and *the branch is deleted* are facts. *This keeps the record honest* is narration.
10. Reasoning belongs in rules, records, and commit messages. It does not belong in an answer unless asked for.
11. Reasoning the engineer wants is asked for through the expansion line.

## Dependent reasoning takes an ordered list, not prose

1. An unordered list is only for list items that are parallel and independent.
2. Number reasoning whose steps rest on each other: `1.`, `2.`, `3.`.
3. Number a list whose entries the engineer may refer back to, such as options, findings, candidates, or things to decide.
4. Those numbers are handles, such as *#2*. They imply no order.
5. In all other cases, leave the list unordered.

## After a list answer, the engineer is offered an expansion

1. Where an expansion would add something, end the answer with this line:

```
For more detail than bullet points, ask for an expanded answer.
```

2. Write it as a line on its own, not as a selection prompt.
3. Include it only where the agent compressed material out of the answer.
4. Leave it out of an answer that says all it has.
5. It offers more depth on the answer given, not a next topic. Do not end any answer with an offer of a next topic, or of what else might be done.
6. It names the form being given up, "more detail than bullet points". "More detail" alone does not do this.
7. Whether to include the line is the agent's own judgment.
8. Do not make the judgment stricter until there is proof that it needs to be.
9. Two stricter forms are not adopted: appending the line to every list answer, or appending it above a length threshold.
10. Either stricter form may be adopted if the judgment proves unreliable in use.

# Communicate plainly, and name the actual thing

Source: system/language/source/communicate-plainly-and-name-the-actual-thing.md

1. Speak and write to the user in plain language, using the actual names of things.
2. Do not hide meaning behind invented labels or compressed jargon offered as if already shared.
3. Do not coin numbered or abstract stand-ins ("tier 1", "phase A2", "the T3 bucket") for things that have real names.
4. Say the thing itself — "the notes copied into a project when it installs a package," not "the distributed tier."
5. Do not point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter").
6. Name the thing again each time — "the show-the-test merge," not "#2" — even at the cost of some repetition.
7. The engineer may refer to a list item by its number. Number a list the engineer may refer back to.
8. When the engineer writes a number such as *#2*, name what it refers to before acting on it, so the reference is confirmed.
9. Use a compressed term ("distributed", "atomic records") only once its plain meaning has been stated.
10. Do not lead with a compressed term as though the reader already shares it.
11. Bring in a shorthand only if it is justified.
12. Prefer the plain word and the concrete description over the clever-sounding one.
13. If a sentence needs a glossary to parse, rewrite it.
14. This rule governs phrasing addressed to the user, such as an explanation, a summary, or a status note.
15. It also governs the codebase and the durable artifacts the user reads later: rules, logs, plans, and deferred items.

## An explanation is short, shows an example, and gives only what the reader needs

1. Explain in short plain sentences. State the problem in one plain sentence.
2. Show a real example value, such as `2026-10-02T14-10-05Z`, rather than describing one.
3. Say what happened in one sentence.
4. Give the choice or the next step, and stop.
5. Give only what the reader needs. Leave out where things are and why they matter, such as file names, line numbers, quotations, and background, unless the reader asks.
6. Not this: "The printed-list rule contradicts itself about what the first column holds. This is the master version, `a-record-list-is-a-table.md`… What the rule says, line 5: …"
7. This: "The list rule says the first column holds the full date and time, like `2026-10-02T14-10-05Z`. Its examples show just the date, like `2026-10-02`. To fix it, either the examples change, or the text does."

# A word is reserved in six steps

Source: system/language/source/ete/a-word-is-reserved-in-six-steps.md

1. Reserve a word by following these six steps in order, every time a word is reserved.
2. The instruction that starts the sequence is "Waytide reserves the word, X". It names the word and asks for all six steps.
3. The sequence does not have to be spelled out each time a term is settled.
4. Write the verb as `reserves`, and never `claims`.
5. A reservation is made under STE Rules 1.5, 1.6, and 1.12, which let a project add its own technical nouns and verbs.
6. Step 1: look the word up in the STE dictionary. This step is mechanical.
7. The lookup has three outcomes. The word is approved, with the one meaning it may carry.
8. Or the word is not approved, and the dictionary names the approved word that replaces it.
9. Or the word is absent from the STE dictionary.
10. Step 2: ask what the word names. Do not skip this step.
11. A word that names something in the subject field is terminology. Continue the sequence.
12. A word that qualifies, joins two statements, or does grammatical work is ordinary vocabulary. Stop and write no entry, per the ordinary-vocabulary-is-not-reserved-and-not-rewritten rule.
13. Step 3: decide noun or verb.
14. A word used both ways takes a category for each. These are two decisions, not one.
15. STE Rule 1.7 forbids a technical noun used as a verb. STE Rule 1.13 forbids a technical verb used as a noun.
16. Step 4: try an STE category first. STE Rule 1.5 gives twenty-two noun categories, and STE Rule 1.12 gives four verb categories.
17. Waytide's terms land in noun categories 7, 11, 15, and 19, and verb category 2.
18. Step 5: use an ETE category only where no STE category holds the word.
19. Do not reach step 5 until an STE category has been tried and refused.
20. The five ETE categories are declared in the ete-declares-its-own-categories rule.
21. Step 6: write the entry in the vocabulary of the package whose domain the term belongs to, per the foundation a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides.
22. The entry gives the definition, what the STE dictionary says about the word, and the category.
23. The engineer decides the term's category, because a term is a design decision.
24. Put the category to the engineer through the selection UI.
25. Bring the step 1 lookup already done, and name the candidate categories.
26. Steps 4 and 5 are judgment. Step 1 is not.
27. The phrase reserves the word and does not order a sweep.
28. A reservation settles what the word means in Waytide's prose from that point on.
29. Replacing another word with the reserved word where it already stands is a separate instruction, asked for separately.
30. Do not conform existing prose until that separate instruction is given.

# ETE declares its own categories

Source: system/language/source/ete/ete-declares-its-own-categories.md

1. STE's category lists are closed. Its word lists are open.
2. STE Rule 1.5 admits a technical noun that fits one or more of its twenty-two categories.
3. STE Rule 1.12 admits a technical verb that fits one or more of its four categories.
4. The words listed inside each STE category are only examples.
5. ETE adds five categories. Each one holds technical nouns and technical verbs.
6. The five categories are declared here and nowhere else.
7. An entry names its category and its part of speech. STE Rules 1.7 and 1.13 depend on which part of speech a word is reserved as.

## Engineering, design, process, and method

1. This category holds terms that name how engineering work is conducted, recorded, and set aside.
2. It also holds the acts that conduct that work, and the parts of a design method.
3. Examples: `hinge`, `gate`, `cradle`, `cycle`, `loop`, `actuation`, `observation`, `efferent`, `solubility`, `subtle`, `load-bearing`, `mean-bias`, `deferred`, `suspended`, `out of scope`, `responsibility`, `transfer`, `reconcile`.
4. Try STE category 7 before this one. It covers concepts, design, calculations, and methodologies.

## Evented systems and autonomous components

1. This category holds terms that name the parts of a message-based system, the components that run on their own, and what they do.
2. Examples: `projection`, `entity`, `event`, `stream`, `consumer`, `handler`, `message`, `autonomous component`.

## Agent artifacts

1. This category holds terms that name the files an agent and an engineer write and read as they work.
2. It also holds terms for what is done to those files.
3. Examples: `working-state artifact`, `implementation record`, `loop record`, `work session record`, `log entry`, `rule file`, `vocabulary`.

## Human-computer interaction (HCI)

1. This category holds terms that name how a person and a machine work together, and what each of them does.
2. Examples: `attended`, `unattended`, `free-text option`, `selection prompt`, `harness`.

## Deliberation and speech

1. This category holds words whose object is a judgment or a statement rather than a thing.
2. Examples: `ask`, `decide`, `choose`, `settle`, `state`, `present`, `observe`, `govern`, `establish`, `explain`.

## Applying the categories

1. This rule contradicts STE Rule 1.5 and STE Rule 1.12, because each of them closes its list of categories.
2. It contradicts nothing else.
3. A word admitted to an ETE category is reserved, used, and bound exactly as a word in an STE category is.
4. Try an STE category first.
5. Use an ETE category only for a word that no STE category holds.
6. Reserve words one at a time.
7. The word's vocabulary entry names its category.
8. The same entry states what the STE dictionary says about the word.
9. A word with no entry is not reserved.
10. An ETE category is not a standing permission to use the words that fit it.

# ETE fixes the meaning of a word in its category

Source: system/language/source/ete/ete-fixes-the-meaning-of-a-word-in-its-category.md

1. The STE dictionary carries no technical nouns. STE Rule 1.8 sends the reader to the company glossary for them.
2. A technical noun takes its meaning from the vocabulary that reserves it.
3. Rules 1.5 and 1.6 reach only a word the dictionary omits or refuses. So an approved word cannot be reserved as a technical noun under them.
4. STE Rule 1.3 requires an approved word to keep the dictionary's meaning and no other.
5. A word reserved in an ETE category takes the meaning its ETE entry gives it.
6. This holds whether the STE dictionary omits the word, refuses it, or approves it with a different meaning.
7. This contradicts STE Rule 1.3.
8. Mark each word reserved with a meaning different from its approved meaning in its package's vocabulary.
9. For example, `LOOP (n)` is approved as *a circular shape made in a flexible material*, and Waytide's loop is the DBE cycle.
10. This is the most expensive reservation ETE makes, and the entry carries the cost.
11. The entry quotes the approved meaning.
12. The entry states why the approved meaning does not carry Waytide's.
13. Recast the sentence instead where a different word serves.
14. STE Rule 9.1 covers the case where a word-for-word replacement will not do.
15. This reservation is the last resort, not the first.
16. An entry that does not argue against the approved meaning has not made the reservation.
17. Use the STE dictionary's approved meaning where it serves.
18. Where the approved meaning does not serve but a different word does, recast the sentence under STE Rule 9.1.
19. Reserve the word in an ETE category only where neither serves.

# Ordinary vocabulary is not reserved and not rewritten

Source: system/language/source/ete/ordinary-vocabulary-is-not-reserved-and-not-rewritten.md

1. ETE conforms its terminology to the STE dictionary. It does not conform its ordinary vocabulary.
2. This departs from STE Rule 1.1, which admits only approved words, technical nouns, and technical verbs.
3. What a word names decides which side of the line it falls on.
4. A word that names something in the subject field is terminology. It is either reserved or rewritten.
5. A word that does a sentence's grammatical work, joins two statements, or qualifies one is ordinary vocabulary.
6. Example: `branch` is terminology. `under` is not.
7. Words such as `as`, `every`, `never`, `under`, `would`, `already`, and `may` are ordinary vocabulary. They are not technical nouns or verbs in any category.
8. Do not reserve an ordinary-vocabulary word. Reserving it puts a false claim of conformance in a vocabulary. A vocabulary carries no false claim of conformance.
9. Do not rewrite prose to replace an ordinary-vocabulary word.
10. To apply this rule, ask what a refused word names.
11. Reserve the word in a category where it names something in the subject field.
12. Rewrite the prose where an approved word says the same thing.
13. Leave the word in place where it is ordinary vocabulary.
14. Record no entry for an ordinary-vocabulary word.

# Waytide keeps its word where the STE word means something else

Source: system/language/source/ete/waytide-keeps-its-word-where-the-ste-word-means-something-else.md

1. Waytide writes its prose in ASD-STE100 Simplified Technical English, which has an approved dictionary and 53 writing rules.
2. STE Rules 1.5 through 1.13 let a project add its own technical nouns and technical verbs.
3. The rules in this directory are Eventide Technical English, or ETE, which is Waytide's implementation of the standard.
4. ETE is the STE dictionary and writing rules, with Waytide's reserved terms and its substitutions, in the sequence this rule states.
5. `Say it in ETE` asks for ETE.
6. `Say it in STE` asks for the raw standard, without `efferent`, `cradle`, `hinge`, or any other term Waytide reserved.
7. The STE dictionary decides first.
8. For a word the STE dictionary does not approve, it names an approved alternative.
9. Use the alternative where it carries the meaning: `initiate` becomes `start`, `impact` becomes `effect`, and `protect` becomes `prevent`.
10. Keep Waytide's word where the approved word means something else.
11. Reserve that word as a technical noun or a technical verb, in a category its entry names, in the package's `vocabulary.md`.
12. Record what the STE dictionary says about the reserved word.
13. Where the approved word carries a different meaning, the ete-fixes-the-meaning-of-a-word-in-its-category rule governs.
14. A word the dictionary does not list is not a defect.
15. STE Rule 1.1 permits an unlisted word as a technical noun or a technical verb, as with `efferent`, `cradle`, and `solubility`.
16. The worked instance is `sweep`: the STE dictionary replaces `sweep (v)` with `SCAN`.
17. The `language` vocabulary discontinues `sweep` for `conform`: to bring code or prose into line with a convention.
18. Neither `SCAN` nor `AGREE`, which the dictionary gives for `conform`, carries that meaning, so `conform` is reserved and wins.
19. A substitution replaces a word Waytide rejects.
20. A reservation keeps a word STE rejects.
21. A substitution and a reservation are different acts, and `conform` is both.
22. An absent word and a word that is not approved differ.
23. An absent word is a gap: the standard never considered it, as with most terms Waytide coined.
24. A word that is not approved is a disagreement: the standard considered it and named something else.
25. A reservation of a word that is not approved rejects the standard's decision.
26. So the record says which case a reserved term is in.
27. `reserve` is absent.
28. `discontinue` is not approved, and the dictionary gives `STOP`.
29. Three rules beside this one carry ETE's departures from the standard.
30. The ete-declares-its-own-categories rule adds five categories of Waytide's own, against STE Rules 1.5 and 1.12.
31. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take its entry's meaning, against STE Rule 1.3.
32. The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves ordinary words alone, against STE Rule 1.1.

# Waytide prose conforms to the STE writing rules

Source: system/language/source/ete/waytide-prose-conforms-to-the-ste-writing-rules.md

1. ASD-STE100 holds 53 writing rules in nine sections.
2. These rules bind Waytide's prose, its rules, its records, its commit messages, and the agent's answers.
3. This rule holds the STE rules Waytide breaks most.
4. When another STE rule is found broken in use, add it to the table. Record beside it the phrase that broke it.
5. This rule is part of Eventide Technical English, or ETE. ETE is Waytide's implementation of the standard.
6. The waytide-keeps-its-word-where-the-ste-word-means-something-else rule states what ETE is and the order its two parts decide in. Waytide's vocabulary decides first, and the standard second.
7. Three rules carry ETE's departures from the standard. Each names the STE rule it contradicts.
8. The ete-declares-its-own-categories rule adds five categories of Waytide's own.
9. The ete-fixes-the-meaning-of-a-word-in-its-category rule lets a reserved word take the meaning its entry gives.
10. The ordinary-vocabulary-is-not-reserved-and-not-rewritten rule leaves the ordinary words alone.
11. Check a phrase against Waytide's vocabulary first.
12. Then check it against the STE dictionary.
13. Then check it against the writing rules below.

## The writing rules

| The rule | What it requires |
|---|---|
| STE Rule 1.3 | Use an approved word only with its approved meaning. The ete-fixes-the-meaning-of-a-word-in-its-category rule overrides this for a word reserved in an ETE category |
| STE Rule 3.6 | Use the active voice. In descriptive writing the passive is permitted only where the agent is unknown |
| STE Rule 4.2 | Do not omit words. Its own words: *Each sentence must have all its parts* |
| STE Rule 8.1 | Do not use the semicolon. The standard's reason is that a semicolon lets you write very long sentences |
| STE Rules 5.1 and 6.3 | A procedural sentence takes 20 words or fewer. A descriptive sentence takes 25 or fewer |
| STE Rule 6.6 | A descriptive paragraph takes six sentences or fewer |

## Two worked phrases

1. The agent wrote each of these phrases. Each broke Waytide's vocabulary before it broke the standard.

### `swept across 20 files`

1. **`swept`**: the `language` vocabulary discontinues `sweep` for `conform`. The STE dictionary replaces `sweep (v)` with `SCAN`, which does not carry the meaning either.
2. **`across`**: `ACROSS (prep)` is approved only as *from one side to the other*. STE Rule 1.3 forbids other meanings. Where `across` would mean *throughout*, write `in`, as in `in 20 files`.
3. **`was swept`**: this is the passive with a known agent, against STE Rule 3.6.
4. **The semicolon** in the sentence that held it is against STE Rule 8.1.

Before: `` `gate` is a technical noun; its verb form is `wait`, swept across 20 files. ``

After: `` `gate` is a technical noun. Its verb form is `wait`. Twenty files conform to this. ``

### `The two checks green`

1. **`green`**: the `testing` vocabulary substitutes `verified`. The word is also absent from the STE dictionary.
2. **`The two`**: `the two (adj)` is not approved. The STE dictionary gives `THE TWO (TN)`, as in `ATTACH THE TWO ENDS`.
3. **No verb**: this is against STE Rule 4.2.

Before: `The two checks green`

After: `The two checks are verified.` Or, to say what happened rather than name a state: `The two checks found no defect.`

4. **`checks` survives.** `CHECK (n)` is approved, as in `DO A CHECK OF THE …`.
5. Only `check (v)` is not approved. The STE dictionary gives `MAKE SURE` for it.

# Expand an abbreviation on first use

Source: system/language/source/expand-an-abbreviation-on-first-use.md

1. Do not use an abbreviation the reader may not already know without spelling it out.
2. The first time an abbreviation appears, write the full term with the abbreviation in parentheses: "human-in-the-loop design (HITL)".
3. This applies in a document and in conversation with the user alike.
4. After the first use, the short form is fine within the same document or exchange.
5. When in doubt, prefer the full term.
6. Use an abbreviation only when it is more recognizable than what it stands for, for example "AI", "URL", "HTTP".
7. Skip the expansion only for abbreviations more widely known than their expansions.
8. If the expansion is clearer than the short form, use the expansion alone.
9. Project abbreviations count too. A name coined inside the project, such as DBE for design-by-efferent, must be defined where it is introduced.
10. Use a project abbreviation freely only after its definition, such as the design-by-efferent vocabulary.

# Language is used precisely here, and words are load-bearing

Source: system/language/source/language-is-used-precisely-here-and-words-are-load-bearing.md

1. Use language very precisely. Words are load-bearing, not decoration.
2. Choose words deliberately, hold to them, and change them only on purpose.
3. Choosing a word chooses the concept that the work is then done with.
4. Name concepts literally, and drop slang. These are the two disciplines that make this precision achievable.
5. Precision is not formality, and it is not plainness either.
6. The precise word is the one that already means exactly this.
7. Do not bury the extant technical term under a vaguer everyday word or a colloquialism. Examples: "wrap" over "mediates," "green" over "verified," and "happy path" over "normal path."
8. Recover the established term the everyday word has displaced.
9. Do not use dramatic jargon, meaning an impressive or academic term reached for to signal sophistication. Do not use a metaphor whose baggage the reader cannot unsee. Do not use an overdramatic word that distorts judgment. Do not use a loose synonym that merges two concepts the design keeps apart.
10. Lean neither toward the plain nor toward the technical.
11. Hold the term that says the thing exactly. It is as often an established technical term as a plain one.
12. Treat the selection of a word as a design decision, with the same deliberation as any other.
13. When two words are available, choose the one that *is* the thing, not the one that sounds better.
14. When a word is wrong, change it. When a word is changed, change it everywhere the concept appears.
15. Do not let a term mean one thing in one place and another thing elsewhere.
16. When a precise word is missing, name the concept literally rather than reaching for the nearest metaphor.
17. Expect this to feel like more effort than it is worth. Then an imprecise word costs a day.

# Lead with a summary, then the details

Source: system/language/source/lead-with-a-summary-then-the-details.md

1. Open a response with a short summary: the conclusion, decision, or state.
2. Put the supporting detail below the summary.
3. Order the response so the reader can tell what must be read from what may be read. Put the must-read before the may-read.
4. The summary carries the essential. The details are for whoever wants them.
5. Be economical, and do not pad. Length is not thoroughness.
6. Cut words that carry no information. Say what informs the reader, and stop.
7. Prefer a short answer that can be expanded on request over a long one that pre-empts every question.

# Name concepts literally, not by analogy, code, or jargon

Source: system/language/source/name-concepts-literally-not-by-analogy-code-or-jargon.md

1. Name a concept by describing literally what it is.
2. Reject any name that makes the reader memorize an arbitrary mapping back to the actual idea.
3. Reject real-world analogies and metaphors, e.g. "the menu problem," "menu trap."
4. A metaphor is itself jargon, because the reader must learn and carry its mapping.
5. A vivid metaphor still fails.
6. Reject opaque codes, e.g. "A1 / A2." A code carries no meaning and needs a lookup key.
7. Reject academic jargon, e.g. "irreducible," "intrinsic," "recall / precision," "anchoring."
8. Test every candidate name by asking: *can the reader understand it without being taught a mapping?*
9. A name fails if the reader must memorize "X stands for Y."
10. A literal description ("unreachable options") passes.
11. Default to plain description over a fresh metaphor or coined term.
12. When a short handle is genuinely needed, use the most literal short handle available.
13. Keep a coined handle that is precise, in active use, and defined plainly elsewhere, such as *hinge* and *cradle*.
14. Do not mint new metaphors by default.

# No slang

Source: system/language/source/no-slang.md

1. Names, prose, comments, and commit messages use literal, non-slang terms.
2. Conversation with the user uses literal, non-slang terms too.
3. The standard governs phrasing addressed to the human, not only what goes into the codebase.
4. Do not use a figurative or slang term when a literal one states the thing directly.
5. Each discontinued figurative term has a literal replacement, and each replacement is an entry in the `language` vocabulary.
6. Use the literal replacement, as its entry in the `language` vocabulary defines it.
7. Replace **wrap / wrapper** with **mediates**.
8. Replace **sweep** with **conform**.
9. Replace **"does that land?"** with plain phrasing, such as "is that right?".
10. Replace **arm** with **scenario**.
11. Replace **cut** with **increment**.
12. Replace **in flight** with **in progress**.
13. Replace **owed** with **required**.
14. Replace **choice** with **selection** for what is picked at a prompt.
15. Replace **choice** with **decision** for the matter settled.
16. Replace **earns its keep / earns its place** with **justified / justifiable**.
17. A historical record that quotes a decision keeps the original word.
18. Only live, forward-looking prose conforms.
19. This rule governs phrasing in prose and conversation. The name-concepts-literally-not-by-analogy-code-or-jargon rule governs naming a concept.

# Solubility is how readily a unit dissolves into the reader's understanding

Source: system/language/source/solubility-is-how-readily-a-unit-dissolves-into-the-readers-understanding.md

1. "Solubility" is the design-quality term for how readily a unit dissolves smoothly into the reader's cognition and understanding.
2. Solubility is cognitive.
3. The ideal is immediate comprehension with minimal interpretive work, which is knowledge at a glance.
4. A soluble unit is as simple as it should be and no simpler.
5. It has maximum simplicity and minimal necessary complexity, found rather than presumed.
6. The word names a general quality of a design.
7. Solubility is judged by the reader, not by the writer who made the unit.
8. A unit understood only after the reader reconstructs the writer's reasoning is not soluble, however tidy it reads to the writer.
9. Say "soluble" or "solubility" for this quality.
10. It is not a synonym for "simple", "clean", or "elegant".
11. A unit can be simple and still cost the reader interpretive work.
12. "Clean" and "elegant" describe how the code reads to someone who already understands it.
13. Use "solubility" wherever the concern is how readily a unit is understood: in prose, rules, designs, commits, and dialogue.
14. Judge it from the reader by asking what interpretive work the unit costs them. Aim design work at solubility, and use it as the criterion when a design is judged.
