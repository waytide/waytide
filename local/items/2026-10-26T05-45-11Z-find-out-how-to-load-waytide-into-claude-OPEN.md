# Find out how to load Waytide into Claude, rather than prepend it to the prompt

- **State:** Open
- **Tags:** [idea]

**Find out whether Waytide's rules can be loaded into Claude itself, rather than put into the conversation ahead of the engineer's request.** Today the session-start hook tells the agent to read every rule file, so the rules reach the agent as file reads at the head of the session, and the opening response waits on them. A mechanism that loads the rules as part of how Claude is configured would make them present from the start without that read.

**It bears on the rule-reduction experiment.** Its packaged-script phase shortens the read, and its additional-context phase delivers the rules through the session-start hook. This item asks the wider question: what means Claude and Claude Code offer for loading standing instructions, and which of them could carry Waytide.

**Not yet settled:**
- which mechanisms exist for loading standing instructions, and what each one carries and costs
- whether any of them takes text of the rules' size, about 547,000 characters compiled
- whether a rule loaded that way is followed as reliably as one the agent reads

## History

As the engineer first stated it: "New item: Find out how to load Waytide into Claude rather then prepend it into the prompt"

---

Authored by Scott Bellware on Sun Oct 25 2026 at 10:45:11 PM PT
