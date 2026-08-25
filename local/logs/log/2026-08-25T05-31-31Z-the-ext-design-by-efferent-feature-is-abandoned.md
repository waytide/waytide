# The ext/design-by-efferent feature is abandoned

Nothing it produced reaches `master`, by the engineer's instruction. Its branch is deleted local
and remote. This entry carries the substance, since no record of the work is on `master` to be
read.

**What the move would have done.** It would have taken `system/design-by-efferent/` to
`system/ext/design-by-efferent/` in five increments: the directory moves in the composite, the
repository decision is carried out, the package is published, `foundation` is published where
anything in it changed, and each project holding the package re-adds it at the new prefix.

**The fork nobody settled.** Whether a new `waytide/ext-design-by-efferent` receives the package,
which the flattening rule derives, or the existing `waytide/design-by-efferent` is kept by a
`**Repository:**` declaration beside the one the Ruby package carries. The first strands a
repository that keeps serving the rules as they stand. The second adds a second package whose
repository is not its path.

**Neither candidate makes the publish a fast-forward.** A `git subtree split`'s output history
depends on the prefix path, so the published history is regenerated rather than extended. That is
what made this a migration rather than a rename.

**A project holding the package would have re-added it, never `git mv`'d it.** Git records a
subtree by its prefix, written into a commit message as `git-subtree-dir`. Moving the directory
moves the files and leaves that record naming the old path, so the next pull reports
`can't squash-merge: … was never added`.

**Where the work was.** `feature/ext-design-by-efferent` at `f633590`, deleted local and remote the
same day. It is recoverable from a reflog until it is collected, and that is not a durable record —
which is why the substance is here rather than left to the SHA.
