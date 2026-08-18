# `waytide/local/plans/`, `intention/`, or `action/` — the docs that sequence a settled direction

`waytide/local/plans/` holds **implementation plans**: the sequenced, task-by-task build of a settled direction. A plan turns a design into an ordered set of increments a worker executes one at a time.

**Under intuitive mode this is `waytide/local/intention/` and the artifact is an intention. Under OODA mode it is `waytide/local/action/` and the artifact is an action.** Everything in this rule holds unchanged for each, including supersession and the checkbox tasks. The mode changes the vocabulary and the directory, and not a single obligation.

See the a-project-works-in-a-mode-chosen-at-the-start rule. The rule is written in the formal mode's terms because formal is the default. Read *plan* as *intention* or *action*, and `plans/` as the directory your mode names.

- **Relationship to design:** a plan **realizes** an `waytide/local/design/` doc — it names its **Source design** and sequences the build the design settled. Under intuitive mode an intention realizes an aspiration, in `waytide/local/aspiration/`. Under OODA mode an action realizes an orientation, in `waytide/local/orientation/`. Design settles *direction*. The plan settles *order*. A plan may exist without a separate design doc for small work, but when a design exists the plan points back to it.
- **The state sits on a canonical `**State:**` line**, at the top of the record above the goals, carrying one of the six state words and nothing else — `- **State:** Implemented`. It is the **plain text data attribute** form the system already uses (see this package's vocabulary). **Every plan carries one, from the moment it is written.** A new plan is **Active**. Absence was the in-progress state until 2026-08-16, and it stopped working when the state moved into the filename, where a missing suffix is indistinguishable from an oversight. A plan with no state line is now a defect. **The filename also ends with that word in upper case** — see the a-record-ends-with-its-state-in-upper-case rule.
- **The six states.** **Active** — sequenced work the project is working on, and the state every plan starts in. **Implemented** — the sequenced work was built. **Deferred** — kept deliberately, with no date and nobody working toward it. **Superseded** — a later plan replaced it. **Abandoned** — dropped before the sequence was built. **Suspended** — paused, not ended. They mirror the direction artifact's six, with **Implemented** standing where **Realized** does. A direction is *realized* by being taken up, and a sequence is *implemented* by being built.
- **`Deferred` carries the vocabulary's own word** — *not yet, the project still intends to do it* — and is taken back when the work is taken up, returning the record to absence. A `Deferred` plan is **not** a deferred item and is not moved into `waytide/local/deferred/`. See the design-convention rule, which settles the word for both artifacts.
- **The line does not restate the checkboxes.** The tasks say which increments are done. The line says what became of the plan, which the tasks cannot express: a plan may be **Abandoned** or **Superseded** with tasks still unchecked, and every task checked is not the same claim as the plan having concluded.
- **Implemented is not taken back**, where **Deferred** is. This is where the sequencing artifact departs from the direction artifact. A design that expands loses its **Realized** line, because a countering question expands it (see the design-convention rule). A plan does not expand — it is **superseded** rather than rewritten, per the supersession below. So new work is a later plan, and the implemented one stays implemented.
- **Supersession:** a later plan may **supersede** one or more earlier ones, reshaping their pending tasks around a new direction while keeping each earlier plan's **completed tasks as history** (the superseded tasks are marked, not deleted). The later plan names them in its **Superseded plans** section — plural, since a plan may supersede a series that came before it. A superseded plan takes **Superseded** on its state line, and the section and the line are not the same statement: the section is the **later** plan naming what it replaced, and the line is the **earlier** plan's own state.
- **Tasks:** each task is a single checkbox (`- [ ] Task N: <name>`) stating the intended **behavior**, not code. Completed tasks carry post-hoc notes inline — reworks, green-on-arrival drops, supersessions — so the plan doubles as a build record.
- **Format:** the same frontmatter-free markdown as rules. The *document shape* (its sections) is the plan-document-format rule. The filename follows the ISO-8601-UTC prefix convention (see the file-names rule).
- **Provenance footer:** end the file with the `Authored by … / Changed by …` footer, like every working-state artifact — see the working-state-artifacts-carry-a-provenance-footer rule.
- **Log entry:** pair the artifact with a one-line `waytide/local/log/` entry on creation, on supersession, and on each change of the `**State:**` line — see the direction-and-sequencing-artifacts-take-a-log-entry rule. **A completed task takes none**, being execution against direction already settled rather than a decision.

**Why:** design and execution are distinct concerns — one decides what the shape should be, the other decides the order it gets built in. Keeping plans in their own directory, each pointing at the design it realizes, keeps the settled direction stable while the incremental build proceeds against it. It preserves the build history without cluttering the design.

**How to apply:** when a settled design is ready to build, add a plan here. It names its source design, and sequences the work as behavior-stated tasks. Supersede rather than rewrite when direction changes, keeping completed tasks as history.

Give a new plan a `**State:**` line reading **Active**. Change it as the plan reaches **Implemented**, **Deferred**, **Superseded**, **Abandoned**, or **Suspended**. Do not take **Implemented** back — a plan that would expand is superseded by a later one instead. Return **Deferred** to **Active** when the work is taken up. Never leave a plan without a line. Do not report a plan's state in the session-start notice.

In an intuitive-mode project do all of that in `waytide/local/intention/`. Call the artifact an intention, and point it at its source aspiration. In an OODA-mode project do it in `waytide/local/action/`, calling it an action and pointing it at its source orientation. Nothing else differs.

Related:

- the design-convention — the direction artifact's four states, whose **Realized** this mirrors, and the one state word in the system that is taken back
- the direction-and-sequencing-artifacts-take-a-log-entry rule — when this artifact pairs with a log entry, and why a completed task does not
- the a-record-ends-with-its-state-in-upper-case rule — the upper-case suffix the state line also takes
- the experiments-convention and features-convention — the other canonical `**State:**` lines
- the plan-document-format and plans-no-code-samples rules
- the a-project-works-in-a-mode-chosen-at-the-start rule — the mode that decides which directory this is
- the decision-log rule

---

Authored by Scott Bellware on Sat Jul 18 2026 at 5 PM PT
Changed by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Mon Aug 3 2026 at 10:35:20 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:16:34 AM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:13:51 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:32:50 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 9:44:24 PM PT
Changed by Scott Bellware on Sat Aug 8 2026 at 2:32:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:53:55 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 11:41:53 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 12:32:17 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:04:53 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:19:18 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:44:25 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 2:54:58 AM PT
Changed by Scott Bellware on Sun Aug 16 2026 at 3:03:12 AM PT
