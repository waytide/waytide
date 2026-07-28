# The status line shows commits that are not pushed

The status line reports an uncommitted working tree. It says nothing about commits that
are committed but not pushed, which is the next state along the same axis — work that
exists only in this working copy and would be lost with it.

```
waytide · master · uncommitted changes - Waytide system active (7 packages)
```

The uncommitted-changes segment was added on the reasoning that a segment appears only
when it has something to say, and that the untracked case is the point of the indicator
rather than a cost it carries. Unpushed commits are the same argument one step on: nothing
announces them, and the count is only noticed when someone thinks to ask.

**What the resolution has to settle:**

- **The wording.** `uncommitted changes` is words rather than a mark, on the grounds that
  `master*` carries no meaning until a reader is taught it. Whatever names this state has
  to meet the same bar — and it has to be distinguishable from `uncommitted changes` at a
  glance, since both can be present at once.
- **Whether it carries a count.** The uncommitted segment deliberately carries none: the
  line already has one, and a number that changes with every edit is noise. A commit count
  changes far less often, which is an argument the other way, and "how far ahead" is more
  of what a reader wants than "whether at all". This is the open question, not a settled
  parallel.
- **No upstream configured.** `git rev-list @{upstream}..HEAD` fails outright when a branch
  has no upstream. That is not the same state as being up to date and should not be
  reported as though it were — a branch that was never going to be pushed is ordinary, and
  a branch whose upstream is missing by accident is worth seeing. Which of those the
  segment claims is part of the design.
- **Cost.** The segment must not reach the network. `@{upstream}..HEAD` reads the
  remote-tracking ref, which is local and stale by design — it reflects the last fetch, not
  the remote. The status line runs on every render, so fetching is out of the question, and
  the item should say plainly that what is reported is the last known remote state.

**The occasion.** A session ran with four commits unpushed while `waytide/foundation` was
published twice from them, leaving the component repository ahead of what the composite's
own remote carried. The unpushed count was surfaced each time only because it was asked
for by hand.

**Gated on:** nothing in flight. Actionable whenever it is taken up.

**Why:** the status line's purpose is to keep a fact available instead of leaving it to be
asked for, and "this work exists in one place only" is a fact of the same kind as "this
work is not committed". The stale-tracking-ref caveat is what makes it a design question
rather than a two-line change.

**How to apply:** settle the wording, the count, and what is shown when no upstream is
configured; then add the segment to `system/foundation/statusline.sh` beside the
uncommitted-changes one, reading only local refs. Update
`system/foundation/announce-waytide-at-session-start.md`, which documents what the line
shows. Resolve by deleting this file and logging that it was carried out.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 9:50:23 PM PT
