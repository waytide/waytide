# A script to update a Waytide installation from upstream

Refreshing an installed Waytide is manual and per-package. Each package's README gives one
command:

```
git subtree pull --prefix waytide/framework/foundation https://github.com/waytide/foundation.git master --squash
```

A project with seven packages installed runs seven of those, each carrying a prefix path
and a URL that have to match. Nothing lists what is installed, nothing reports what
changed, and a package left out of the sweep stays stale silently — the session-start
notice counts the packages present, not how current they are.

`foundation` already carries `install.sh`, and the dependent packages carry
`install-dependencies.sh`, so an update script fits a shape the framework has. It belongs
in `foundation` and ships to consuming projects — unlike `report-direct-commits.sh`, which
is composite-only because a consuming project never publishes.

What it would do:

- **Discover what is installed** rather than take a list — a directory under
  `waytide/framework/` carrying a `README.md` is a package, the same test `session-start.sh`
  and `statusline.sh` use. `code/ruby` is nested and publishes to the flat repository name
  `code-ruby`, so the directory-to-repository mapping replaces `/` with `-`, as
  `report-direct-commits.sh` already does.
- **Pull each one**, with `--squash`, as the READMEs prescribe.

What has to be settled:

- **What it reports.** A pull changes **binding rules** — files read at the start of every
  session, which govern how the agent works. A refresh that silently alters them is a
  change of behavior nobody saw. Whether the script reports which packages moved, and what
  changed in them, is the substance of this question, not a nicety.
- **What it does with a package a project has edited in place.** `CONTRIBUTING.md` calls
  editing an installed package a fallback, not a routine path, but it happens — and a pull
  onto edited content conflicts. Stop the whole run, skip that package and continue, or
  report and let the developer choose.
- **Whether it warns before pulling.** The same edited-in-place condition is detectable
  beforehand. Reporting it first would be the consuming-project counterpart of
  `report-direct-commits.sh`, which exists because a divergence that surfaces only when an
  operation fails has already cost something.
- **Whether it updates one package or all.** Taking package names as arguments and
  defaulting to all is the obvious shape, but a refresh of one package while its
  dependencies stay behind is a state worth thinking about before allowing it.
- **What it does about the bootstrap.** `install.sh` places a root `AGENTS.md` and a
  `.claude/settings.json`. Neither is a package, so neither is refreshed by a subtree pull,
  and both can fall behind the framework they activate. Whether updating is this script's
  job or a separate concern is open.

**Gated on:** nothing in flight blocks it. It is a piece of work, not a question — though
the five points above are settled before it is written, since each changes what the script
is.

**Why:** the rules are only authoritative if they are current, and today keeping them
current is a manual sweep whose omissions are invisible. The framework already automates
the two things it considers load-bearing — announcing that it loaded, and reporting work
left open — and refreshing what it loaded is the same kind of concern left undone.

**How to apply:** settle the five points, then add the script to `framework/foundation/`
alongside `install.sh`, discovering installed packages rather than listing them, and
reference it from each package README's refresh section in place of the bare command.
Delete this file when it is carried out, and log that it was done. Related: the foundation
`install.sh` (the install counterpart), the `install-dependencies.sh` scripts each
dependent package carries, `report-direct-commits.sh` in the composite (the divergence
check this would mirror downstream), the announce-waytide-at-session-start rule (the
package discovery this reuses), and `CONTRIBUTING.md` (the push-back fallback that creates
the edited-in-place case).

---

Authored by Scott Bellware on Mon Jul 27 2026 at 1:42:14 PM PT
