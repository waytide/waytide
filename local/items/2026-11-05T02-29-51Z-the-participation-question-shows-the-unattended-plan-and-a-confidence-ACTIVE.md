# The participation question shows the unattended plan and a confidence

- **State:** Active
- **Tags:** [idea]

**When the agent asks whether the work runs attended or unattended, it would first show how it would proceed unattended, and how confident it is in doing so, as a percentage.** The engineer would then choose with the plan and the agent's own estimate in view, rather than choosing blind.

What the agent would show:

- the plan it would follow unattended, as the attended-or-unattended-is-chosen-when-the-work-is-started rule already requires before unattended work begins
- the decisions it would make on its own in that plan, such as names, wording, and where an alias delegates
- a confidence percentage for doing the work unattended, with what lowers it

**Not yet settled:** what the percentage measures and how the agent arrives at it, and whether it is given for the work as a whole or for each decision. The rule fixes the question's words, "Who decides?", and its two options, so showing the plan and the percentage changes that rule.

## History

As the engineer first stated it: "Idea: When prompting the participation, show the user how the agent would proceed unattended, and a confidence percentage"

It came after the engineer asked how confident the agent was in doing the `/item` skills unattended, and the agent answered with what it would decide on its own.

---

Authored by Scott Bellware on Wed Nov 4 2026 at 6:29:51 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:08:36 AM PT
