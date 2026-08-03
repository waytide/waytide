# Session — Two directories are recognized, and the first thing is set aside (Sun Aug 2 2026 22:31)

Continues `2026-08-03T03-06-02Z-the-queue-empties-into-designs.md`, which closed on the deferred
queue emptying. This stretch added **two artifact directories to the system** —
`local/migration/` and `local/suspended/` — and then used the second one immediately, on a
document the first one had just exposed as anomalous. Each step produced the next: recognizing
migration surfaced a live procedure sitting in a historical record, which needed somewhere to go
that did not exist, which became the suspension convention, whose first use was that document.

*This is the communicable record — the guided tour. It is not the source of truth. The durable
records are the rules under `system/`, the decision log under `local/log/`, and the designs and
observations under `local/`.*

## 1. `local/migration/` is recognized

The directory had existed here since July and was **defined by no rule** — this repository's
`AGENTS.md` said so outright. The instruction was that every consuming project should have the
understanding that it is where execution plans for **transitions of content across a repository
boundary** are written.

**Checked before writing, and the answer was no.** Neither of the two consuming projects —
`constant` and `env-var` — has the directory; no package mentions it; and `install.sh` never
names it in the `AGENTS.md` it generates. The understanding existed in exactly one hand-written
file that does not travel. So the rule was not documenting a practice, it was **creating one**.

Written as `foundation/migration-convention`, with the distinction that decides it: a
`plans/` plan sequences a build **inside** this repository, and a migration plan sequences work
that **crosses out of it** — the increments land in two repositories, and the plan is not
finished when this repository's part is. And the record is **kept** after the content has gone,
because when content leaves, the trail of where it went leaves with it unless something in the
repository it left holds that trail.

## 2. The runbook the new rule exposed

Recognizing the directory made one of its files anomalous. The **Phase B runbook** — the record
of the one-time first distribution of the packages to their component repositories — is what
`CONTRIBUTING.md` pointed at for the routine publish procedure. A live procedure sitting in what
the new convention frames as a record of completed transitions.

Examining it turned up more than misplacement:

- **Its package map is wrong** — it lists `docs`, which no longer exists, and omits `plan` and
  `versioning`. Following it would publish the wrong set.
- **Its live half is already duplicated.** `CONTRIBUTING.md` carries the publish primitive, and
  that is what every publish this session followed — including `versioning`'s first-ever
  publish — without the runbook being opened once.

So the project had stopped using it. What it needed was somewhere to be set aside that was not
deletion, and no such place existed.

## 3. `local/suspended/` — an undo queue

The instruction: a place where concerns with obsolete bureaucracy can be set aside and
**unsuspended** if desired. The system already had the word — **Suspended** is a settled state
for experiments and features, "paused, not ended" — so the directory took it rather than coining
one.

**The Command Pattern framing was the developer's, and it shaped the rule.** Each suspended
thing carries what it takes to **reverse its own suspension**, not merely a copy of itself. That
made explicit something that would otherwise have been missed: **setting something aside is
never one file moving.** Removing a rule also means dropping it from the Related lists that cite
it and from the package README, so those edits are part of the command. A restore that does not
reverse them puts the thing back in place and uncited. Hence `**Reconciliations:**`.

The rule scope is anything the project stopped doing, and it lives in `foundation`, so every
consuming project has it.

## 4. Frontmatter, twice corrected

The return address was first written as YAML frontmatter, and the rule framed it as **"the one
artifact in the system that carries frontmatter, and the departure is deliberate"** — arguing at
length that the other conventions' frontmatter-free markdown was a description rather than a
prohibition.

**"Frontmatter is allowed. Humans can be trusted with a number of things."** The framing was
over-justified: a format choice had been written up as a transgression needing defense. Rewritten
to state the permission and the reason once each.

**Then reconsidered on the mechanism.** A recognizable-content protocol "like `Referrer:`" would
serve as well — and the system already **has** one and parses it: the canonical `**State:**` line
that `session-start.sh` reads with sed, and `**Gated on:**` and `**Priority:**` in the deferred
queue. So the return address became `**Origin:**`, `**Kind:**`, `**Suspended:**`, and
`**Reconciliations:**`. Frontmatter remains allowed; it is not used because there was no reason
to introduce a second form where the existing one fits.

## 5. The first suspension

**The new-repo case was lifted out first.** `versioning`'s first publish this session had needed
it, `CONTRIBUTING.md` did not cover it, and it recurs whenever a package is added — so it went
into `CONTRIBUTING.md`, carrying two facts this session established: `report-direct-commits.sh`
handles a repository before its first publish on its own, and `install-all.sh` does not, because
its package list is hardcoded where the check discovers packages by finding READMEs.

**Then both files moved** to `local/suspended/` with their return address and four
reconciliations — the two `CONTRIBUTING.md` pointers removed, the new-repo case lifted out, and
the migration README's entry marked. The resumption note says what would bring them back
(another repository rename or a mass re-publish after a path change, of which they are the only
record) and says explicitly that the new-repo case is **not** a reason, since it was lifted out
first.

## Takeaways

- **Recognizing a directory is not the same as documenting one.** Checking found that no
  consuming project had the understanding and nothing carried it — so the rule created the
  practice rather than describing it, which is worth knowing before writing one.
- **A new convention exposes what does not fit it.** The migration rule made the runbook's
  placement visible; examining that found a stale package map nobody had noticed.
- **The Command Pattern framing found a real gap.** "Each suspended thing carries what it takes
  to reverse itself" produced `**Reconciliations:**`, which a simpler "move the file" rule would
  have left out — and without which a restore silently half-works.
- **A format choice is not a transgression.** The frontmatter section was written as a defense
  and needed to be a permission and a reason.
- **The system's own protocol was already there.** The `**State:**` line has been parsed
  mechanically since July; reaching for frontmatter meant not noticing it.

## Glossary

- **suspended** (of a convention) — set aside rather than deleted, with the return address needed
  to restore it. The same sense the word already carries for an experiment or feature: paused,
  not ended.
- **return address** — the `**Origin:**`, `**Kind:**`, `**Suspended:**`, and
  `**Reconciliations:**` lines a suspended file carries, which are what make the suspension
  reversible.
- **reconciliations** — the edits a suspension required beyond moving the file, recorded so a
  restore can reverse them.

## Where the durable records live

- **New rules** — `migration-convention` and `suspended-convention`, both in `foundation`.
- **Changed rules** — `rules-convention` (the working-directory list, and preferring suspension
  to removal), `announce-waytide-at-session-start` and `session-start.sh` (the read instruction's
  directory list), the foundation README.
- **`CONTRIBUTING.md`** — gained a new package's first publish; lost its two pointers at the
  suspended files.
- **`local/suspended/`** — the Phase B runbook and checklist, the first two entries.
- **`local/migration/`** — 11 files, its README reconciled.
- **The deferred queue** — still empty.

---

Authored by Scott Bellware on Sun Aug 2 2026 at 10:31:33 PM PT
