# Experiment — Intuitive mode

## Question

Does **intuitive** name the human-centric project mode better than **creative** does?

## Setup

- **State:** (in flight — no state line value until it concludes)
- **Upstream branch:** `master`
- **Experiment branch:** `experiment/intuitive-mode`
- **Base:** `e887bd71dd4fb4b388563e65622fbaa026bf8778`, from `master`
- **Working location:** branch only. Chosen at initiation on 2026-08-05 through the selection
  interface. This working tree switches back to `master` at the conclusion.
- **Gating cadence:** unattended. Chosen at initiation beside the working location. The loop does
  not gate; the agent determines and decides each hinge and generates through, and the developer
  reads the finished state.
- **Loop record:** `waytide/local/loops/2026-08-05T18-14-20Z-intuitive-mode.md`

## Forecast

Committed before the work.

### On the name itself

**1. The rename does not fix the pairing, because neither name is on the same axis as *formal*.**
*Formal* is about **form** — whether the work follows a prescribed shape. *Creative* is about the
**kind of work** produced. *Intuitive* is about the **source of judgment**. So `formal` / `creative`
and `formal` / `intuitive` are both category-mismatched pairs, and the true antonym of formal is
*informal*. I expect this to survive the rename untouched, and to be the most interesting thing
the experiment surfaces.

**2. The implied slight transfers exactly.** *Creative* implies the other mode is uncreative,
which is false — a project doing formal work is not less creative. *Intuitive* implies the other
mode is unintuitive, which is false in precisely the same way. I forecast no gain here.

**3. *Intuitive* collides with an established software sense**, and *creative* does not. "Intuitive"
in this field means *easy to use* — an intuitive interface. A reader meeting `intuitive mode` will
supply that sense before *proceeding by intuition*. The name-literally-not-by-analogy rule weighs
against a word whose ordinary meaning in the domain misleads, and I expect this to be the
strongest argument against the change.

**4. Against those, *intuitive* is more accurate about manner.** The mode's substance is a stance
in the developer, not a property of the output: identical obligations, different vocabulary, aimed
at how a person approaches the work. *Creative* describes what is produced; *intuitive* describes
how it is arrived at. An aspiration is closer to something intuited than to something created. So
*intuitive* is on the right axis for the **mode**, even while it is on the wrong axis for its
**pairing with formal**.

**Predicted verdict: inconclusive.** The change trades a real gain in manner-accuracy for a real
loss to the domain collision, and fixes neither the axis mismatch nor the implied slight. I expect
it to come down to whether the developer weighs manner-accuracy above the collision, which is a
judgment the experiment can inform but not settle.

### On the work

**5. The composite is the easy half.** 46 occurrences across 10 files in `system/`, plus the mode
rule's quoted template, plus this repository's own `creative-mode` local rule. Mechanical.

**6. The real cost is the five projects, and it is the migration again.** Each holds a binding
local rule whose **filename carries the mode** — `…Z-creative-mode.md`. Renaming means renaming
and rewriting that file in five repositories, one day after they were migrated into it. I forecast
this to be the largest single argument against making the change now, independent of which word is
better, and I expect it not to have been considered when the experiment was proposed.

**7. Historical records are not touched**, so the log entries and work session records saying
*creative mode* will remain, and the system will read as having renamed something mid-history —
which is correct and is what those records are for.

**8. One thing I expect to be wrong about**, stated so the miss is legible: I may be overweighting
the domain collision. *Intuitive mode* as a compound may not invoke *intuitive interface* at all,
because the noun it qualifies is a mode of working rather than a thing to be used.

## What actually happened

Recorded against the forecast, point by point.

| # | Forecast | Outcome |
|---|---|---|
| 1 | The axis mismatch survives the rename | **Held.** Untouched. |
| 2 | The implied slight transfers exactly | **Held.** |
| 3 | *Intuitive* collides with the software sense | **Held, but not where predicted** — see below |
| 4 | *Intuitive* is more accurate about manner | **Held** |
| 5 | The composite is mechanical | **Held, with a defect not forecast** — see the miss |
| 6 | The five projects are the real cost | **Held**, and it became a decision rather than a cost |
| 7 | Historical records untouched | **Held** |
| 8 | I may be overweighting the collision | **Half wrong, and the correction is the finding** |

### The finding: the collision is real, and it is in a phrase I did not forecast

Forecast 8 guessed that *intuitive mode* as a compound might not invoke *intuitive interface*,
because the noun it qualifies is a mode of working rather than a thing to be used. **That is
correct.** *A project works in formal or intuitive mode* reads cleanly, and so does *this project
works in intuitive mode*.

**But the rules do not only say *intuitive mode*. They say *an intuitive project*** — repeatedly,
in the corroboration section, the failure-mode paragraph, and both directory conventions. And *an
intuitive project* reads as **a project that is easy to understand**. The collision lands on the
noun phrase, not the compound, and it lands hardest in exactly the sentences that explain what
goes wrong.

*A creative project* had no such reading.

### The miss: the article

**Not forecast at all.** *Creative* begins with a consonant and *intuitive* with a vowel, so every
*a creative* had to become *an intuitive* — eight occurrences. A search-and-replace cannot see it,
because the word that breaks is the one **before** the word being replaced. Found by reading the
result rather than by any check.

It is the most transferable thing here: **any rename across a vowel boundary carries this, and the
tooling that performs the rename is structurally blind to it.**

### What the experiment cannot settle

Whether manner-accuracy outweighs the collision is a judgment about the word, and the experiment
was run to inform it rather than to decide it. What it adds to the judgment is that the cost is
not evenly spread: the compound is fine and the noun phrase is not, so the choice is really
between *creative* and *intuitive-with-a-convention-about-not-saying-an-intuitive-project*.

## Findings

- **The rename fixes neither structural defect.** Both names sit off the axis *formal* is on, and
  both imply a slight on the other mode. Whatever the verdict, those are unaddressed.
- **The collision is localized.** *Intuitive mode* is fine; *an intuitive project* is not.
- **A vowel-boundary rename breaks articles invisibly**, and nothing in the system would have
  caught it.
- **The five consuming projects were not touched**, so affirming this experiment starts a second
  migration of the same shape as the one run the day before.

---

Authored by Scott Bellware on Wed Aug 5 2026 at 11:14:20 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:17:55 AM PT
