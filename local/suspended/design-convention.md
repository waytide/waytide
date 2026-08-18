# `waytide/local/design/`, `aspiration/`, or `orientation/` — the docs that settle direction

`waytide/local/design/` holds **design docs**: the settled *direction* of a piece of work, written before a plan sequences the build. A design decides what the shape should be — structure, construction, API, the model — and records the resolutions that later work rests on.

**Under intuitive mode this is `waytide/local/aspiration/` and the artifact is an aspiration. Under OODA mode it is `waytide/local/orientation/` and the artifact is an orientation.** Everything in this rule holds unchanged for each — the mode changes the vocabulary and the directory, not a single obligation (see the a-project-works-in-a-mode-chosen-at-the-start rule). The rule is written in the formal mode's terms because formal is the default. Read *design* as *aspiration* or *orientation*, and `design/` as the directory your mode names.

- **Relationship to the sequencing artifact:** a design settles direction. The project's sequencing artifact **realizes** it — a plan, an intention, or an action, whichever the mode names. The design is the stable reference it points back to (its **Source design**).
- **Two kinds:** a **feature/component design** (the structure, file layout, construction, and API of a unit of work) and a **methodology design** (a way of working, argued from a premise). The two live here. They share a spine, not a fixed section list.
- **The state sits on a canonical `**State:**` line**, at the top of the record above the summary or premise, carrying one of the six state words and nothing else — `- **State:** Realized`. It is the **plain text data attribute** form the system already uses (see this package's vocabulary). **Every design carries one, from the moment it is written.** A new design is **Active**. That line is the only authoritative statement of the state, and the same words run through a design's prose freely. **The filename also ends with that word in upper case** — see the a-record-ends-with-its-state-in-upper-case rule.
- **Absence is not a state here, and it was until 2026-08-16.** The line was added only when a design reached one of the concluding words, and absence carried *settled and not yet realized*. That worked while the state was read inside the file, where a missing line is visible in the place it would sit. It stopped working when the state moved into the filename: an unsuffixed name looks like a name rather than a claim, so absence and an oversight are indistinguishable in the one view the suffix exists to serve. **A design with no state line is now a defect rather than a design in progress.**
- **The six states.** **Active** — settled direction the project is working toward, and the state every design starts in. **Realized** — the direction was built. **Deferred** — kept deliberately, with no date and nobody working toward it. **Superseded** — another design replaced it, and the two records name the counterpart. **Abandoned** — dropped without being built. **Suspended** — paused, not ended. They are derived from what becomes of a **direction**, so the experiment's verdict words have nothing to say here: a design is not proven or disproven, and the feature's *Completed* names an intent being finished rather than a direction being taken up.
- **`Active` and `Deferred` are the pair that was previously one thing.** Both name direction that has not been built. `Active` is being worked toward, and `Deferred` is deliberately not. Absence used to cover the first of those and could not express the second, which is why `Deferred` was added a day before `Active` was.
- **`Deferred` takes the word the vocabulary already fixes.** This package's vocabulary settles **deferred** as *not yet — the project still intends to do it*, against **suspended** as *no longer* and **out of scope** as *not here*. A direction held for later is the first of those exactly, so the word is reused rather than coined.
  - **A `Deferred` artifact is not a deferred item** and is not moved into `waytide/local/deferred/`. That directory is a queue of postponed **design changes**, deleted on resolution. This is settled direction staying where settled direction lives, with a line saying nobody is working toward it.
- **`Deferred` and `Active` are different claims, and the difference is intent.** `Active` means the direction is settled and the work is expected — it is waiting on the sequence, not on a decision to care. `Deferred` means the work is deliberately not being pursued and no date attaches to it. With one word for the two, a marker kept for the future reads as work that is merely late.
- **Settled resolutions:** a design records **Settled** decisions with the date they were settled, so a reader knows what is fixed versus still open. A trailing **Out of Scope / Deferred** section marks what the design deliberately leaves out.
- **Format:** the same frontmatter-free markdown as rules. The *document shape* (its sections) is the design-document-format rule. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **Log entry:** pair the artifact with a one-line `waytide/local/log/` entry on creation, on each **Settled** resolution added afterward, and on each change of the `**State:**` line — see the direction-and-sequencing-artifacts-take-a-log-entry rule, which also states what is not logged.
- **How it stays current:** a design is **reconciled** against the records, never regenerated from them — it is a source of truth that a plan points back at, so rebuilding it from the work downstream would invert that. The reconciliation is prompted when a **work session record is written**, where the records have just been read and the session is closing. The engineer decides which side is stale, since either may be. See the work-sessions-convention.

## A question that counters a settled resolution is the design expanding

**An engineer asking something that runs against what a design settled has expanded the design.**
That is what an incremental process is: direction is set from where the work stood, and the next
question is the work moving. A settled resolution records where it was pointed at a moment. It is
not a boundary the next question has to clear.

**So the agent does not obstruct.** It does not preface the answer with the conflict, refuse until
the design is amended, or treat the engineer as overruling their own document. **The record
follows the decision.**

**The agent may ask whether the design has expanded**, through the selection interface, and asking
is not obstructing. The two differ in what happens to the engineer's question:

- **A question put alongside the answer** costs a selection and leaves the work moving. It is
  worth putting where the answer would change what the design says, and where the engineer may
  want that change recorded as a resolution rather than left implicit.
- **A refusal to proceed until the design is settled** stops the work to keep a record of it.
  That inverts what the design is for.

**Update the design as a dated addition rather than a rewrite.** The superseded resolution keeps
its date and its wording. A new **Settled** entry states what changed and why, so the design reads
as a history of direction rather than as whatever direction is current. Where the earlier
reasoning is still correct about something narrower than the resolution it supported, keep it and
say what it is still right about.

**Say what changed after the fact.** Reporting an amendment is not gatekeeping. Withholding it
leaves a design that no longer describes the work.

## Realized and Deferred are the state words that are taken back

**A realized design keeps governing.** It does not conclude the way an experiment or a feature
does. It stays the stable reference the sequencing artifact points back at, and the section above
is why: a question that counters a settled resolution expands the design rather than closing it.

**So the line returns to `Active` when the design expands with direction that is not yet built.**
That is where direction being worked toward sits. It takes **Realized** again when the new
direction is built.

**`Deferred` is taken back the moment the work is taken up.** The line returns to **Active** and
reaches **Realized** from there when the direction is built. Nothing marks that a design was once
deferred, and nothing needs to — the log holds when it was set down and when it was taken up.

**The other three are not taken back.** A superseded design stays superseded, an abandoned one
abandoned. A suspended one resumes, which is a resumption rather than a reversal, and it then
carries whichever word the direction has reached.

**Two of the six are reversible, and both return to `Active` rather than to nothing.** An
experiment's verdict and a feature's conclusion each judge something finished. A direction is not
finished by being taken up once, and it is not finished by being set down either. **`Active` is
the state a reversal returns to**, which is the second job that word does and the reason a
reversal now has somewhere to land.

## The session-start notice does not read this line

**The notice reports open experiments and features, and it is not extended to designs.** It reads
each record's `**State:**` line under `waytide/local/experiments/` and `waytide/local/features/`
(see the announce-waytide-at-session-start rule). Nothing reads this one.

**A design with no line is the ordinary resting state**, not an alarm. A project accrues settled
direction faster than it builds it, and a notice line naming every unrealized design would be
present in every session for the life of the project. That is the failure the deferred queue was
kept out of the notice to avoid — a line that is always present is read once and never again.

**What the line is for is the record itself**, read when a reader asks what became of a direction.

**Why:** deciding direction and executing it are separate acts, and the direction must stay stable while the build proceeds against it. A dedicated home for designs, distinct from the plans that realize them, keeps the settled shape and its dated resolutions readable on their own. It gives every plan one authoritative source to point at.

**How to apply:** before sequencing a build, settle its direction in a design here. Date each resolution as it is settled, and mark what is out of scope. When the engineer asks something that runs against a settled resolution, answer it. The question is the design expanding, not a conflict to clear first.

Give a newly written design a `**State:**` line reading **Active**. Change it as the direction reaches **Realized**, **Deferred**, **Superseded**, **Abandoned**, or **Suspended**. Return it to **Active** where a realized design expands with direction that is not yet built, and to **Realized** when that direction is built. Return it to **Active** when deferred work is taken up. Never leave a design without a line.

Write **Deferred** for direction kept with no date and nobody working toward it, and do not move that artifact into `waytide/local/deferred/`. Do not report a design's state in the session-start notice.

Put a selection asking whether the design has expanded where the answer changes what it says. Never refuse to proceed until the design is amended. Record the change as a new dated **Settled** entry, leaving the superseded one as written. Say what changed after the fact. Point the realizing plan back at it.

In an intuitive-mode project do all of that in `waytide/local/aspiration/`, calling the artifact an aspiration. In an OODA-mode project do it in `waytide/local/orientation/`, calling it an orientation. Nothing else differs.

Related:

- the plans-convention
- the direction-and-sequencing-artifacts-take-a-log-entry rule — when this artifact pairs with a log entry, and when it does not
- the a-record-ends-with-its-state-in-upper-case rule — the upper-case suffix the state line also takes
- the experiments-convention and features-convention — the two other canonical `**State:**` lines, whose words judge a question and an intent rather than a direction
- the announce-waytide-at-session-start rule — the notice that reads those two lines and not this one
- the design-document-format and package-dependency-heading rules
- the a-project-works-in-a-mode-chosen-at-the-start rule — the mode that decides which directory this is
- the decision-log rule

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Fri Jul 31 2026 at 11:37:12 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:13:51 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:44:24 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:21:42 AM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:37:42 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:34:57 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:50:46 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 1:12:44 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 9:08:02 PM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:04:53 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:19:18 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
