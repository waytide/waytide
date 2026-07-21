# Flatten the rules files

Flatten the rules files. Raised 2026-07-20, mid-way through the component-repo
publish, so it is parked rather than acted on.

**Hard constraint (2026-07-21):** do **nothing** to change the on-disk
representation of the rules files — no moving, merging, renaming, or restructuring
on disk — **unless and until the user directs it**. Any flattening is understood to
change how the rules are represented or worked with in some other way first; the
physical file layout is not to be touched without an explicit instruction to do so.
Treat a change to the on-disk layout as its own separately-authorized step, never a
side effect of picking this item up.

**Scope to confirm on pickup:** the exact flattening intended is not yet settled.
Most likely it means collapsing the per-package nesting under `rules/` so the rule
files no longer sit inside a package subdirectory (`rules/foundation/…`,
`rules/testing/…`) but flat under `rules/` — but it could instead mean flattening
within a package, or something narrower. Clarify with the user which before
touching anything, because the choice interacts with the package boundary that the
`git subtree split` publish depends on (each component repo is one package's slice;
a flat `rules/` with no per-package directory would remove the split prefix the
publish keys on).

**Gated on:** the in-flight release (updating the composite and publishing the
seven component repos) finishing first, and on settling the scope question above.

**Why:** the lead is worth keeping so the flattening idea isn't lost, but acting on
it now would cut across an active publish and change the very directory structure
that publish is regenerating. A parked item keeps it without derailing the release.

**How to apply:** once the release is done, confirm with the user exactly what
"flatten" covers. Do not touch the on-disk layout on your own initiative — hold to
the hard constraint above and change the physical representation only on an explicit
instruction. When such an instruction comes and it removes the per-package
directory, redesign the publish (split prefixes, `install-all.sh`, CONTRIBUTING) in
the same change, since those all key on `rules/<package>`. Related: the
agent-rules-convention, the just-completed grouping of packages under `rules/`, and
the CONTRIBUTING publish workflow.
