# Work Session — The record types collapse into three (2026-08-18)

The work session began with a mechanical consolidation — experiments and features into one record
— and became a sweep through every working-state directory Waytide had accumulated. It ended with
three: `ideas/`, `implementations/`, and `logs/`. What separated the old directories from each
other became tags, and the tag protocol was generalized twice on the way, each time because a
prohibition turned out to have no reason under it. Along the way the `diary` package was renamed
`journal`, the suspension mechanism was retired after fifteen days and eleven unrestored items,
one move was made and reversed within the hour, and all four consuming projects were brought
across.

**This is the communicable record — the guided tour.** The durable records are the rules under
`waytide/system/`, the ideas under `waytide/local/ideas/`, and the decision log under
`waytide/local/logs/log/`, which took fifty entries today. This narrative points to them and does
not restate them.

## 1. Experiments and features become implementations

The work session opened on a direct instruction: consolidate the two into a single protocol, with
tags, and convert the existing records.

**Four rules stated one lifecycle twice.** `experiments-convention`, `experiment-lifecycle`,
`features-convention`, and `feature-lifecycle` agreed on nearly everything — a branch, a working
location chosen at the start, a declared end, recorded confirmations — and had already drifted in
their wording of the same clauses. They became `implementations-convention` and
`implementation-lifecycle`.

**One difference accounts for every other.** An `[experiment]` is built to a **question**; a
`[feature]` to an **intent**. Everything the two kinds do differently follows: an experiment
forecasts, reaches a verdict of affirmed, refuted, or inconclusive, merges through a test gate on
the engineer's affirmation, and is watched for drift. A feature has none of those because it has
no question, ends **completed**, and is the only kind that may be built on the current branch.

Sixteen records moved into `waytide/local/implementations/`, each tagged with its kind.
`session-start.sh` collapsed to one `report_open` call whose concluded words are the union of the
two kinds' — `Suspended` deliberately absent, since a suspended implementation is paused rather
than concluded and is still reported.

**The mechanical name-swap broke prose, and the breakage was the interesting part.** `rule both
require` became `rule requires`; a doubled directory path and a doubled convention name appeared
in `announce-waytide-at-session-start`; two files were left with a provenance stamp for a change
that never happened, and were reverted. The refused-dependency argument — that a `foundation` rule
requiring fields under `waytide/local/loops/` would invert the package graph — lived in
`features-convention` and had to be carried across, because `a-citation-is-not-a-dependency` cites
it as its worked example.

## 2. The deferred queue becomes a tag

Two forks were put to the engineer. Both went against the existing convention.

**A resolved item is kept, not deleted.** The old convention deleted a deferred item on
resolution, to keep the queue "exactly the outstanding work, not a history". Keeping the record and
changing its state does the same job — and retires the reconciliation search the convention
required before every deletion, since a kept record still resolves and its state line says what
became of it. That search was the largest part of the rule, and it is gone rather than moved.

**The queue is the `[deferred]` tag, not a directory.** A separate directory was never what made
it a queue: the `**Waits for:**` line, the `**Priority:**` rank, and the print at session start
are, and each is carried by the item itself. `deferred-convention` became
`deferred-queue-convention`.

**The tag is not the state.** `[deferred]` means queued; `Deferred` means parked indefinitely. An
idea may carry both. The two are named against each other in both rules, because the collision was
created by the ideas consolidation the day before and would otherwise sit unstated.

## 3. `diary` becomes `journal`

A rename with two traps in it, neither visible from the instruction.

**The prefix arithmetic broke.** `Diary: ` is seven characters and `Journal: ` is nine, so all
three truncation samples in the convention were two characters over the fifty-character cap. They
were recomputed. The rule's quotations of the *old* commit form — `Diary entry: <subject> (Tue Jun
16 2026)`, thirteen characters of prefix — were restored to the words it actually read. The first
sample quotes the writer's real entry title, so it still says `diary support`; changing it would
have fabricated a quote.

**The naming argument inverted.** The vocabulary's substitution row and the package README existed
to argue *against* `journal` — the write-ahead sense from filesystems and databases. That case is
now answered rather than deleted: what settles the reading is the directory the word sits in, since
`waytide/local/journal/<username>/` names a person and no write-ahead log is kept per user.

Historical records kept the word they were written with. The `[suspended]` records under
`local/suspended/` did not: their `**Origin:**` paths are return addresses a restore depends on,
which made them live pointers rather than historical prose.

## 4. The running records group under `logs/`

The engineer's observation: several record types are logs, and there is only one `log` directory.

`log/`, `loops/`, and `work-sessions/` moved under `waytide/local/logs/`. **What makes a record
belong there is that it accrues chronologically and is never revised** — a reader reaches it by
date, and nothing in it states what is currently true. That is the distinction the flat layout hid:
`ideas/` and `implementations/` state what *is*; these state what *happened*.

`log` kept its name inside `logs/`. Every rule that says *write a log entry* means that directory,
and a rename would reach all of them for nothing.

**The grouping crosses a package boundary without inverting it.** `logs/loops/` is contributed by
`design-by-efferent`, which includes `foundation`. Foundation naming the parent directory requires
nothing of what sits inside, so it is a citation.

## 5. The suspension mechanism is retired

The engineer asked what `suspended/` was for, and the answer exposed the drift: of eleven items,
three had never been in use — which the convention's own closing line forbids — and one was a
decommissioning record with `**Bodies:** not kept`, which nothing could restore.

**The queue ran fifteen days and restored nothing.** It was built for a reversal that never
happened, and its cost was paid on every suspension. `a-suspension-is-a-log-entry` replaced it,
keeping the part that was doing real work: the entry names what was stopped, **why**, and **what
else changed** — the `Related:` lists dropped, the README summary removed. The removed text is in
git, reachable by path from `master`'s history, like every other removed file here.

## 6. The tag protocol is generalized, twice

**First, the log's exemption was removed.** The rule barred a `**Tags:**` line on a decision log
entry because it would break the one-line shape. Granted the title-line placement, what was left
was a prohibition with no reason under it. `working-state-artifacts-take-category-tags` became
`a-record-takes-category-tags`: every record of every kind, no exclusions.

**Then the second form was discontinued.** The title-leading placement written that morning was
superseded within the day. It bought a line on a tagged log entry and cost every reader and every
search two shapes to know, with the tag out of the field the rest of the system reads it from.
Thirteen entries converted — nine carrying `[suspended]`, and four more carrying an ad-hoc `[STE]`
title prefix from 2026-08-08 that predated the tag protocol entirely and had arrived at the same
shape independently.

**The provenance footer's exemption survived both, and stopped following the tag's.** A footer is
lines a one-line entry has nowhere to put; a tag is not. The two rules had cited each other as
precedent, and that pairing was false once the tag had a placement that fits.

## 7. The STE reference files are unwrapped

The PDF extraction had left a hard newline at the end of every line, defeating the editor's own
wrapping. 564 were removed.

**The first attempt under-joined badly**, because it took each file's longest line as *the* wrap
width. The source is a proportional font, so character counts vary by block — the preamble wraps
near 85 and the body near 100. Measuring the width within each contiguous prose run raised 209
joins to 564.

Only flush prose was touched: the dictionary is 97% columnar tables drawn with spaces, and joining
an indented line would destroy the table. Verified by comparing each file with all whitespace
stripped, before against after — a join adds one space or nothing, so an identical despaced stream
proves no word was lost, reordered, or altered.

## 8. `migration/` moves under `logs/`, and moves back

The engineer asked for it, and it was done. An hour later: *I think it was a mistake.*

It was. The move had required writing a paragraph arguing that a migration record "has to cross
over" — that the definition does not fit it and it qualifies anyway. **An exception written for one
member of a set is the tell that the membership is wrong.** A migration record is one document
rather than entries that accrue, it is revised while the migration runs, and it is prospective. The
other three are retrospective accounts.

Being *kept* after the content has gone is what made it look like a running record. That makes it
durable, not chronological, and durability is not what the directory is for. The failed move is
kept in `logs-directory` as a dated worked case, because it is the sharpest test of what the
directory is.

## 9. Publishing, and the consuming projects

`waytide/diary` was renamed `waytide/journal` on the engineer's confirmation; the old URL
redirects. Its publish could not fast-forward — a `subtree split`'s history depends on the prefix
path, and the prefix had moved — so it took the force-reset that `CONTRIBUTING.md` names for
exactly that case, verified first against `system/journal/`.

All four consuming projects were refreshed and their local records migrated: running records under
`logs/`, experiments and features into `implementations/` with tags and state suffixes, deferred
items into `ideas/` tagged `[deferred]`, `system/diary/` removed and `system/journal/` added
fresh — the prefix change again forbidding a pull. Every component repository now matches its
composite split, and `report-direct-commits.sh` confirms no component has drifted.

## Takeaways

- **A prohibition that survives its reason is the thing to look for.** Both tag generalizations and
  the deferred-deletion rule were the same shape: a constraint whose justification had stopped
  applying, still being enforced.
- **An exception written for one member of a set means the membership is wrong**, not that the set
  needs an exception. The migration move is the worked case.
- **A mechanical rename breaks prose, and the breakage is where the reasoning is.** Every collapse
  today left sentences that had been true of two things and were false of one.
- **What separates two records is usually a word**, and a word is carried by a tag rather than by a
  directory and a rule set.
- **A convention's cost is paid on every use and its benefit only on the exception.** The
  suspension queue never reached its exception in fifteen days.

## Glossary

- **implementation** — a bounded unit of work with a lifecycle, recorded in
  `waytide/local/implementations/`. Two kinds, distinguished by a reserved tag: an `[experiment]`
  is built to a question, a `[feature]` to an intent.
- **running record** — a record that accrues chronologically and is never revised, reached by date.
  The three under `waytide/local/logs/`: the decision log, the loop records, the work session
  records. A migration record is not one, and the distinction is stated in both rules.
- **the deferred queue** — every idea tagged `[deferred]`. A tag rather than a directory, since the
  wait, the rank, and the print at session start are carried by the item itself.
- **suspension** — stopping something the project *did*, recorded as a log entry tagged
  `[suspended]` naming what was stopped, why, and what else changed. Distinct from the `Suspended`
  **state**, which marks something the project only *wanted* and keeps it in place.
- **journal** — the record the writer keeps, in `waytide/local/journal/<username>/`. Named `diary`
  from 2026-08-14 to 2026-08-18.
- **reserved tag** — a tag whose meaning a rule settles and from which something follows.
  `[experiment]`, `[feature]`, `[deferred]`, and `[suspended]` are the set.

## Where the durable records live

- **Rules added** — `implementations-convention`, `implementation-lifecycle`,
  `implementation-records-take-a-log-entry`, `deferred-queue-convention`, `logs-directory`,
  `a-suspension-is-a-log-entry`, `a-record-takes-category-tags` (renamed).
- **Rules removed** — `experiments-convention`, `experiment-lifecycle`, `features-convention`,
  `feature-lifecycle`, `deferred-convention`, `suspended-convention`.
- **Decision log** — `waytide/local/logs/log/`, fifty entries dated 2026-08-18.
- **Records converted** — sixteen implementations, one deferred idea, thirteen tagged log entries.
- **Journal** — two entries by the writer, 2026-08-17 and 2026-08-18.
- **Published** — `foundation`, `language`, `git`, `design-by-efferent`, `journal`.

## A closing note

The work session did its best work when it stopped to ask why a rule said what it said. Three
times the answer was that the reason had lapsed and the rule had not. The one instruction carried
out without that question — moving `migration/` — is the one that had to be reversed, and the
paragraph written to justify it was the evidence it was wrong.

---

Authored by Scott Bellware on Tue Aug 18 2026 at 5:26:42 PM PT
