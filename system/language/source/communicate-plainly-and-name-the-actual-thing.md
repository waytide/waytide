# Communicate plainly, and name the actual thing

Speak and write to the user in plain language, using the **actual names of things**. Do not hide meaning behind invented labels or compressed jargon offered as if it were already shared. This is a principle rule beneath the `language-is-precise-here` premise, alongside `name-literally` and `no-slang`.

- **No invented labels.** Don't coin numbered or abstract stand-ins ("tier 1", "phase A2", "the T3 bucket") for things that have real names. Say the thing itself — "the notes copied into a project when it installs a package," not "the distributed tier."
- **No symbolic back-references.** Don't point back to an earlier list item by its number or position ("#2", "option 3", "the second one", "the latter"). The reader has to scroll back and count to recover what you meant. Name the thing again each time — "the show-the-test merge," not "#2" — even at the cost of a little repetition. Repetition the reader can follow beats a shorthand they must decode. **The engineer may use the number**, since a list they may refer back to is numbered for them (see the an-answer-is-a-list-and-prose-must-justify-itself rule). When they write *#2*, name what #2 is before acting on it, so the reference is confirmed rather than assumed.
- **No jargon as shorthand.** A compressed term ("distributed", "atomic records") is fine only once its plain meaning is on the table. Don't lead with it as though the reader already shares it.
- **Plain over impressive.** Prefer the plain word and the concrete description over the clever-sounding one. If a sentence needs a glossary to parse, rewrite it.
- **Governs conversation, not only the code.** Like `no-slang`, this reaches phrasing addressed *to* the user — an explanation, a summary, a status note — not only what goes into the codebase. The clarity it preserves lives in being understood.

**Why:** invented labels and unexplained jargon feel precise but actually hide meaning — the reader has to work out what "tier 1" stands for. Naming the real thing costs a few words and saves the reader the decoding. The point of communicating is to be understood, not to sound authoritative.

**How to apply:** when explaining something, use the concrete name and a plain description. Bring in a shorthand only after its meaning is clear, and only if it is justified. This governs conversation with the user *and* the durable artifacts they read later — rules, logs, plans, deferred items.

## Compressed

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
16. **Why:** Invented labels and unexplained jargon hide meaning and force the reader to decode them. The point of communicating is to be understood.

## History

Until Sun Oct 25 2026 this rule was named communicate-plainly-name-the-thing and titled "Communicate plainly — name the actual thing, not invented jargon".

Related:

- the `language-is-precise-here` premise this serves
- its sibling principle rules `name-literally` (name a thing for what it is) and `no-slang`
- foundation's `rules-establish-a-mindset` — a rule establishes a stance

---

Authored by Scott Bellware on Sat Jul 18 2026 at 10 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:52:56 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 4:06:18 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:35:39 PM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 2:41:36 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:25:07 PM PT
