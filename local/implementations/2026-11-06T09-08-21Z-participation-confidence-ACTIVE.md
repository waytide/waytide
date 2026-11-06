# Feature — Participation confidence

**Tags:** [feature]

## Intent

**As the engineer stated it:** I want to work on presenting the confidence percentage in the "Who decides?" label.

**The participation question carries the agent's confidence in doing the work unattended, as three percentages, in the question itself:** *Human in the loop*, then each figure on a line of its own with a sentence that says what it measures: overall score 60%, works 90%, voice 65%. The first is the overall score, the agent's own estimate that the work both works and is what the engineer would have done. **Works** is the agent's estimate that the work it builds works. **Voice** is its estimate that it does what the engineer would do. It carries out part of the item `2026-11-05T02-29-51Z-the-participation-question-shows-the-unattended-plan-and-a-confidence`. The attended-or-unattended-is-chosen-when-the-work-is-started rule, which fixes the question's words, changes with it.

## State

- **State:** Active

## Setup

- **Tags:** [feature]
- **Upstream branch:** `master`
- **Implementation branch:** `feature/worktree/participation-confidence`
- **Base:** `9dd22bb`, from `master`
- **Working location:** branch and worktree, chosen at the start. The worktree is `../waytide-feature-worktree-participation-confidence`, and the main working tree stays on `master`.
- **Participation:** not asked. The work is a rule's text, which is content, and the design-by-efferent-does-not-govern-content-work local rule leaves content work out of the loop.
- **Verdict:** it concludes with an engineer's verdict, selected at the start.

## Forecast

Stated before the work. With the agent's confidence in the question, the engineer chooses attended or unattended with the agent's own estimate in view. The agent can give both figures for any piece of work at the moment it asks, and the figures it gives are borne out by the work: where voice is low, the engineer would change what the agent decided alone.

## Confirmations

- **2026-11-06** — The working location is branch and worktree, selected by the engineer at the start.
- **2026-11-06** — The feature concludes with an engineer's verdict, selected by the engineer at the start.
- **2026-11-06** — The percentage appears in the question itself, after *Who decides?*, selected by the engineer.
- **2026-11-06** — The percentage is two figures, *works* and *voice*, selected by the engineer. *Voice* is the engineer's word for the agent doing what the engineer would do. It replaced *choices*, which the engineer rejected.
- **2026-11-06** — The question's opening words are *Human in the loop*, replacing *Who decides?*, as the engineer directed.
- **2026-11-06** — The question also carries a combined figure, first, as the engineer directed. It is the agent's own estimate, not computed from works and voice, selected by the engineer.
- **2026-11-06** — The first figure is called the *overall score*, replacing *combined*, as the engineer directed.
- **2026-11-06** — Each figure is on a line of its own, with a sentence that says what it measures, as the engineer directed.
- **2026-11-06** — The question carries no heading over the figures, as the engineer directed. The line *The agent's confidence in doing this work unattended:* was added and then removed.
- **2026-11-06** — *Human in the loop* carries no question mark, as the engineer directed.
- **2026-11-06** — The Attended option no longer carries *(the default)*, as the engineer directed. Attended is still the default, and the option set no longer says so.
- **2026-11-06** — When the overall score is 70% or lower, the question carries a warning and the Attended option is marked as the recommendation, as the engineer directed. This carries out the item `2026-11-05T02-38-50Z-low-confidence-in-unattended-work-recommends-attended`, made Active.
- **2026-11-06** — The warning reads *When the overall score is 70% or lower, leaving the agent unattended risks adverse outcomes.*, in the engineer's words.
- **2026-11-06** — The overall score is labeled *Agent's confidence* in the question, as the engineer directed. The warning names it the same way: *When the agent's confidence is 70% or lower, leaving the agent unattended risks adverse outcomes.*
- **2026-11-06** — The works figure is labeled *It'll work* in the question, as the engineer directed.
- **2026-11-06** — The voice figure is labeled *Your style* in the question, as the engineer directed.
- **2026-11-06** — The voice figure is labeled *Satisfactory* instead, as the engineer directed, so the label says whether the work is acceptable to the engineer.
- **2026-11-06** — The voice figure is labeled *Approval* instead of *Satisfactory*, as the engineer directed.
- **2026-11-06** — The voice figure is labeled *Your approval* instead of *Approval*, as the engineer directed.
- **2026-11-06** — The warning reads *When the agent's confidence is 70% or lower, you may have to redo work the agent does.*, in the engineer's words, replacing *leaving the agent unattended risks adverse outcomes*.
- **2026-11-06** — The question carries a *Risk of redo* line after the agent's confidence, as the engineer directed. It is 100% minus the agent's confidence, computed rather than estimated.
- **2026-11-06** — The start confirmation records the four figures the question showed, and whether the warning was shown, beside the participation selection, as the engineer directed.

---

Authored by Scott Bellware on Fri Nov 6 2026 at 1:08:21 AM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:12:13 AM PT
