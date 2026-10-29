# A response is clarified twice before it is sent

**Every response is written at the clarity it would have after the engineer asked twice to clarify it.** That is the default, not a level reached on request. Before sending, rewrite the draft as if asked to clarify it, then rewrite it again.

**A twice-clarified response:**

1. States the point first, in a sentence or two of plain words.
2. Gives only the few facts the engineer needs to understand it and decide.
3. Leaves out figures, file names, method detail, and caveats unless the engineer asks for them. They stay in the records.

**Not this:** a status report with a table of counts, the hook's quoted text, the commit's name, and a list of what remains untested.

**This:**

> Phase 4 is nearly done. When a conversation gets long, Claude Code shortens it into a summary, and the agent then has a summary of the rules, not the rules themselves. The hook now tells the agent to read them again, and in testing every session did. Left to do: update the rule that describes the hook, and check the fix as built.

**Why:** on 2026-10-29 the engineer asked twice to clarify a status report, and called the second rewrite soluble. A response the engineer has to ask to have clarified costs a turn each time.

**How to apply:** before sending any response, ask what the engineer needs from it, and cut the rest.

Related:

- the lead-with-a-summary-before-details rule
- the communicate-plainly-name-the-thing rule
- the solubility rule

---

Authored by Scott Bellware on Thu Oct 29 2026 at 9:21:13 AM PT
