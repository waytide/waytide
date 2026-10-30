# The implementations directory holds one record per implementation

**Trigger:** When starting an experiment or feature, or writing or changing an implementation record

`waytide/local/implementations/` holds **implementation records**: one file per implementation, carrying how it began, where it is being worked, and what became of it. An implementation is a bounded unit of work with a lifecycle, and the record is a persisted, dated artifact kept after it concludes.

**Two kinds, and a tag says which.** An **experiment** is tagged `[experiment]` and a **feature** is tagged `[feature]`. The tags are the ordinary square-bracket tags (see the a-record-may-be-categorized-with-square-bracket-tags rule). **They name what the work is, and no rule reads them to decide how it runs.**

**Either kind opens with a question or an intent, whichever the work has.** An experiment may be built to an intent, and a feature to a question.

**As the engineer stated it:** change features and experiments so that both can have either an intent or a question. And: an intent can also bring a forecast and verdict.

**Whether the work forecasts and reaches a verdict is chosen at the start, and that choice is what the lifecycle reads.** It is put to the engineer at the start and recorded as a confirmation, beside the working location and the participation. It does not follow from the kind, and it does not follow from whether the work opens with a question or an intent.

## The record

Open with the **Question** or the **Intent**, then the setup:

- a **`**State:**`** line
- the **upstream branch** it merges into — `master` or another topic branch
- the **implementation branch**
- its **base**
- the **working location** chosen at the start
- **whether it reaches a verdict**, chosen at the start
- a **`**Tags:**`** line carrying `[experiment]` or `[feature]`

**Work that reaches a verdict states a forecast** — what is expected to happen — **before** the work. As the work proceeds it records what actually happened against that forecast, then the findings and any post-hoc misses. The outcomes the forecast did not account for are usually the most informative.

**Work without a verdict states none of that.** There is no forecast, no comparison against one, and no findings or misses.

**Every record carries the confirmations the lifecycle required**, so the work's authority is auditable: the working-location selection at the start, the attended-or-unattended selection at the start, the verdict selection at the start, adding a worktree to work already under way, and branch deletion with worktree removal. **Work that reaches a verdict also records** the affirmation declaration, concluding a superseded one, and merging untested code.

## The state

**The state sits on a canonical `**State:**` line**, carrying one word and nothing else — `- **State:** Suspended`. It is written with the record, and changes as the record reaches another word. That line is the only authoritative statement of the state: the same words run through a record's prose freely, and nothing else in the file can be read as the state.

**`Active` is the in-progress state**, as it is for an item. A record is written when its work starts, so it carries `Active` from the moment it is written. Absence is not a state, and a record without a line is a defect.

**The state words every implementation takes:**

- **Active** — the work is in progress.
- **Abandoned** — dropped before concluding. Not merged, and the record is kept.
- **Superseded** — replaced by another implementation. The two records name the counterpart.
- **Suspended** — paused, not ended.

**The words work that reaches a verdict takes**, because each is a verdict:

- **Affirmed** — the question held, or the intent was met as forecast. The engineer declares it.
- **Refuted** — the question was disproven, or the intent was not met as forecast.
- **Inconclusive** — it ran and gave no clear verdict either way.

**The word work without a verdict takes:**

- **Completed** — integrated into the upstream branch. The ordinary conclusion.

**Work without a verdict has no verdict words, and work with one has no `Completed`.** Neither is an oversight, and neither depends on the kind.

## Runs

**Runs are optional and belong to work that reaches a verdict.** Split an implementation into runs only when its question or intent is held fixed and one factor is varied to compare. Each run is its own branch from the same base, carries its own forecast, and is titled `Run 1`, `Run 2`, and so on. A run is a deliberate variation, not a retry.

## It is the lifecycle record, not the design record

**The same work's design belongs in a loop record** under `waytide/local/logs/loops/` — each cycle's hinge, the options put to the engineer, and the decision. The two divide by concern and each names the other.

**They are separate files because of the package graph, and that is a refused dependency.** `waytide/local/logs/loops/` is contributed by `design-by-efferent`, which includes `foundation` rather than the reverse. A foundation rule requiring fields in that directory would invert the graph, and would make the implementation lifecycle unavailable to a project that installs `foundation` alone. Naming the loop record in prose is a **citation** and costs nothing.

## Format

The same frontmatter-free markdown as rules — a `# Experiment — <name>` or `# Feature — <name>` title, then prose and tables. **The kind reads in the title and is stated as data in the `**Tags:**` line**, and a record whose title says one kind and whose tag says another is a defect in the record. The filename takes the ISO-8601-UTC prefix (see the file-names rule) and the state suffix. End the file with the provenance footer, and pair it with a log entry (see the a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged rule).

**Why:** an experiment and a feature share one lifecycle. What differs between two implementations is whether the work is judged against a forecast, and that is a decision about this piece of work rather than about its kind. Recording it at the start lets the lifecycle read it, while the kind keeps naming what the work is.

**How to apply:** record every implementation here, tagged `[experiment]` or `[feature]`. Open with the question or the intent, then the branch topology, the working location, and whether it reaches a verdict. Forecast before the work where it reaches a verdict, and record what happened against the forecast.

Write the state line as `Active` when the record is written, and update it as the state changes. Record each confirmation the lifecycle requires.

## Compressed

1. `waytide/local/implementations/` holds implementation records, one file per implementation.
2. A record carries how the implementation began, where it is being worked, and what became of it.
3. An implementation is a bounded unit of work with a lifecycle.
4. The record is a persisted, dated artifact, kept after the implementation concludes.
5. An experiment is tagged `[experiment]`, and a feature is tagged `[feature]`. These are ordinary square-bracket tags (see the a-record-may-be-categorized-with-square-bracket-tags rule).
6. The tags name what the work is. No rule reads them to decide how the work runs.
7. Either kind opens with a question or an intent, whichever the work has.
8. Whether the work forecasts and reaches a verdict is chosen at the start. Put it to the engineer, and record it as a confirmation beside the working location and the participation.
9. The lifecycle reads that choice. It does not follow from the kind, or from whether the work opens with a question or an intent.

## The record

1. Open with the **Question** or the **Intent**.
2. Then give the setup: a `**State:**` line, the upstream branch it merges into, the implementation branch, its base, the working location chosen at the start, and whether it reaches a verdict.
3. The upstream branch is `master` or another topic branch.
4. The setup also includes a `**Tags:**` line carrying `[experiment]` or `[feature]`.
5. Work that reaches a verdict states a forecast of what is expected to happen, before the work.
6. As the work proceeds, it records what actually happened against the forecast.
7. It then records the findings and any post-hoc misses, including outcomes the forecast did not account for.
8. Work without a verdict states no forecast, no comparison against one, and no findings or misses.
9. Every record carries the confirmations the lifecycle required, so the work's authority is auditable.
10. Every record carries these: the working-location selection, the attended-or-unattended selection, and the verdict selection, each at the start.
11. Every record also carries these: adding a worktree to work already under way, and branch deletion with worktree removal.
12. Work that reaches a verdict also records the affirmation declaration, concluding a superseded implementation, and merging untested code.

## The state

1. The state sits on a canonical `**State:**` line carrying one word and nothing else, for example `- **State:** Suspended`.
2. Write the line with the record, as `Active`, and change it as the record reaches another word.
3. That line is the only authoritative statement of the state.
4. The state words may appear freely in the record's prose. Nothing else in the file is read as the state.
5. `Active` is the in-progress state, as it is for an item.
6. A record without a line is a defect. Absence is not a state.
7. Do not invent a state word.
8. A record is written when its work starts, so it carries `Active` from the moment it is written.
9. The filename carries the state suffix, `-ACTIVE` while the work is in progress (see the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule).
10. The state words every implementation takes are these.
    - **Active**: the work is in progress.
    - **Abandoned**: dropped before concluding. It is not merged, and the record is kept.
    - **Superseded**: replaced by another implementation. Each of the two records names its counterpart.
    - **Suspended**: paused, not ended.
11. The words only work that reaches a verdict takes are these.
    - **Affirmed**: the question held, or the intent was met as forecast. The engineer declares it.
    - **Refuted**: the question was disproven, or the intent was not met as forecast.
    - **Inconclusive**: it ran and gave no clear verdict either way.
12. The word only work without a verdict takes is this.
    - **Completed**: integrated into the upstream branch. It is the ordinary conclusion.
13. Work without a verdict takes no verdict word, and work with one takes no `Completed`, whatever the kind.

## Runs

1. Runs are optional.
2. Only work that reaches a verdict has runs.
3. Split an implementation into runs only when its question or intent is held fixed and one factor is varied to compare.
4. Each run is its own branch from the same base.
5. Each run carries its own forecast.
6. Runs are titled `Run 1`, `Run 2`, and so on.
7. A run is a deliberate variation, not a retry.

## It is the lifecycle record, not the design record

1. The same work's design belongs in a loop record under `waytide/local/logs/loops/`.
2. A loop record holds each cycle's hinge, the options put to the engineer, and the decision.
3. The implementation record and the loop record divide by concern. Each names the other.
4. Keep them as separate files. `waytide/local/logs/loops/` belongs to `design-by-efferent`, which includes `foundation`, not the reverse.
5. A foundation rule must not require fields in that directory. That dependency is refused.
6. Naming the loop record in prose is a citation and is permitted. It is the only reference permitted.

## Format

1. Use the same frontmatter-free markdown as rules: a title, then prose and tables.
2. The title is `# Experiment — <name>` or `# Feature — <name>`.
3. The kind reads in the title and is stated as data in the `**Tags:**` line.
4. A record whose title and tag name different kinds is defective.
5. The filename takes the ISO-8601-UTC prefix (see the file-names rule).
6. The filename also takes the state suffix.
7. End the file with the provenance footer.
8. Pair the record with a log entry (see the a-log-entry-is-written-for-an-implementation-record-and-the-concluding-entry-depends-on-whether-the-work-merged rule).

## Compression

- 2026-10-24, compressed: compression 0.12, change 0.48, solubility 22 → 46, clarity 0.32 → 0.78, 54 directives, 54 kept, 0 less precise, 0 lost, after 1 repair, re-checked kept
- 2026-10-25, revised: points 7 and 10 take the new wording, that Suspended is a state; not checked
- 2026-10-27, re-checked: 58 directives, 58 kept, 0 less precise, 0 lost
- 2026-10-27, revised: Active is the in-progress state; checked: 46 directives, 46 kept, 0 less precise, 0 lost
- 2026-10-27, revised: `[experiment]` and `[feature]` are no longer called reserved tags, a term the engineer settled; not checked
- 2026-10-28, revised: How to apply removed, each directive only it carried moved to the section it belongs to, solubility 46 → 46, clarity 0.78 → 0.79; checked: 55 directives, 54 kept, 1 less precise, 0 lost, 1 repair, re-checked kept
- 2026-10-28, revised: Why points removed, solubility 46 → 46, clarity 0.79 → 0.79; checked: 41 directives, 41 kept, 0 less precise, 0 lost
- 2026-10-29, revised: either kind opens with a question or an intent, and the verdict is chosen at the start; checked: 52 directives, 52 kept, 0 less precise, 0 lost

## History

Until Thu Oct 29 2026 an experiment was built to a question and a feature to an intent, and that one difference decided the forecast, the verdict, the state words, and runs. The engineer settled that either kind opens with a question or an intent, that whether it forecasts and reaches a verdict is chosen at the start, and that the tags stay as names no rule reads.

Until 2026-10-25 Abandoned, Superseded, and Suspended were listed as "the concluding words both kinds take", though Suspended is defined as paused, not ended, and the filename took its state suffix "once the record concludes". That left open whether a suspended record takes the suffix, which the a-record-ends-with-its-state-in-upper-case rule gives to any record carrying a state line. The engineer settled that Suspended is a state and not a conclusion, and that the suffix follows the state line.

Until Sun Oct 25 2026 this rule was named implementations-convention and titled "`waytide/local/implementations/` — the record of an implementation's lifecycle".

Until Mon Oct 26 2026 this rule was named the-implementations-directory-records-each-implementations-lifecycle and titled "The implementations directory records each implementation's lifecycle".

Until 2026-10-26 the absence of a state line was an implementation's in-progress state. The line was added when the record reached a word, and an open record took no filename suffix. The engineer settled that implementations take the Active state, as items do, which makes the in-progress state a word on the line and in the filename.

Until Tue Oct 27 2026 this rule called `[experiment]` and `[feature]` reserved tags. The engineer settled that a tag means what a rule about it says, with no reserved category.

Related:

- the an-implementation-runs-on-a-branch-to-a-declared-end rule — the lifecycle this records
- the a-record-may-be-categorized-with-square-bracket-tags rule — how a tag is written
- the a-record-carrying-a-state-line-ends-its-filename-with-the-state-in-upper-case rule — the filename suffix the state line gives
- the the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule — the notice that reports an open implementation
- the design-by-efferent a-loop-record-holds-the-cycles-through-the-loop-one-file-per-feature rule — the design record for the same work, which names this one
- the the-items-directory-holds-one-file-per-item rule — the other record that carries a state, and whose in-progress state is also Active

---

Authored by Scott Bellware on Tue Aug 18 2026 at 9:02:44 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:47:19 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 9:08:35 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 2:38:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:37 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:13 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:53 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:58 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:03 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:14 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:02:18 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:03:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 5:55:37 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:29:24 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:28:06 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 3:18:10 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 9:42:16 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 10:38:42 PM PT
