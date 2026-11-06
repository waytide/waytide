# Clarify rewrites the previous answer twice

**Trigger:** When the engineer asks for an answer to be clarified, as with `/clarify`

**`/clarify` rewrites the agent's previous answer more plainly, and then rewrites that once more.** The engineer sees the second rewrite only.

**As the engineer stated it:** clarify the previous answer, then clarify it again for good measure.

**Each rewrite follows the a-response-is-clarified-twice-before-it-is-sent rule.** The point comes first, in a sentence or two of plain words. Only the few facts the engineer needs to understand the answer and decide stay in. Figures, file names, method detail, and caveats are left out unless the answer turns on them.

**It runs twice because the second pass often gives the more humane and soluble answer.** The first pass clears out what the answer did not need. The second is written for the person reading it, so that it is understood at once, with little work.

**A clarified answer says the same thing as the answer it replaces.** It adds no new claim, drops no decision the engineer was asked to make, and changes no fact. Where the previous answer asked a question through the selection interface, the clarified answer asks it again.

**Why:** an answer that was not understood the first time is usually too long or too detailed, not wrong. Rewriting it twice reaches the plain answer more often than once does, and the engineer asks for it with one word.

**How to apply:** on `/clarify`, rewrite the previous answer by the clarified-twice rule, then rewrite the result the same way, and show only the second. Keep every claim, fact, and decision the previous answer carried, and ask again any question it asked.

## Compressed

1. `/clarify` rewrites the previous answer more plainly, then rewrites that once more. Show only the second rewrite.
2. Each rewrite follows the a-response-is-clarified-twice-before-it-is-sent rule: the point first, in a sentence or two of plain words, then only the few facts the engineer needs to understand the answer and decide. Leave out figures, file names, method detail, and caveats unless the answer turns on them.
3. The first pass clears out what the answer did not need. The second is written for the person reading it, to be understood at once, with little work.
4. The clarified answer says the same thing: no new claim, no decision dropped, no fact changed. Where the previous answer asked a question through the selection interface, ask it again through the selection interface.

## Compression

- 2026-11-02, compressed: checked: 15 directives, 11 kept, 4 less precise, 0 lost, 4 repairs; re-checked: 15 directives, 14 kept, 1 less precise, 0 lost. Left less precise: "no decision dropped" without "the engineer was asked to make", which reads broader and keeps every decision

Related:

- the a-response-is-clarified-twice-before-it-is-sent rule — what each rewrite does

---

Authored by Scott Bellware on Mon Nov 2 2026 at 8:55:23 PM PT
