# A shell script is self-executable — the executable bit is set and the file opens with a shebang

Every `.sh` file in this repository is **runnable as itself** — `./read-consuming-projects.sh`,
never `sh read-consuming-projects.sh`. Two things together make it so, and both are required:

- **The executable bit is set**, and it is set at the moment the file is created rather than
  the moment someone notices. Git records the bit in the file's mode, so the check is
  `git ls-files -s` reporting **`100755`** rather than `100644`.
- **The file opens with a shebang** naming the interpreter — `#!/bin/sh` for every script here.
  Without it the bit alone leaves the interpreter to the invoking shell.

**This reaches every shell script Waytide ships**, which is what makes it a rule about the system
rather than about one repository's tidiness. Two kinds of script are authored here and they are
covered alike:

- **The authoring tools at the root** — `install-all.sh`, `report-direct-commits.sh`,
  `read-consuming-projects.sh`, `report-planning-directories-named-in-part.sh` — run by whoever
  maintains Waytide, in this repository.
- **The scripts inside the packages**, and `foundation`'s in particular — `install.sh`,
  `refresh-packages.sh`, `session-start.sh`, `statusline.sh`, `report-unrecognized-mode.sh`. These
  are **installed into every consuming project** and run there, so a missing executable bit
  committed here arrives broken on every machine that installs the package. That is the case where
  the cost is not local, and it is the reason the rule is worth having rather than assuming.

**What it does not reach is a script a consuming project writes for itself.** This is a local rule
of this repository, so it binds what is authored here and travels no further. A consuming project
wanting the same convention adopts it as its own local rule. Whether it should instead be a
`foundation` rule, and so bind every project that installs Waytide, was put on 2026-08-06 and
declined: the scripts Waytide ships are all authored here, so the rule already covers everything
Waytide is responsible for.

**Why the bit has to be committed, not applied locally.** A `chmod +x` that is never committed
lives on one machine. Everyone else clones a file that will not run, and the failure arrives as
a permission error at the moment they most expect the script to work — with nothing to suggest
that the cause is a missing mode rather than a broken script.

**Why the two are stated together.** Each is useless alone. A shebang without the bit is a
comment; the bit without a shebang runs the file under whatever shell happens to invoke it,
which is how a script written for `sh` gets run by something else and fails somewhere in its
middle.

**A script's own documentation depends on it.** Every script in this repository opens with a
usage line written as `./name.sh`. That line is a claim about how the file is invoked, and it is
false for a script that is not executable — so the convention is not cosmetic tidiness but the
thing that keeps each script's header true.

This was already the practice when the rule was written: all ten `.sh` files in the repository
were `100755` and opened with `#!/bin/sh`. The rule records the practice rather than introducing
it, which is why nothing had to be conformed.

**Why:** a script is a command, and a command that has to be prefixed with its interpreter is
not one yet — it is a file that a reader has to know something extra about before they can use
it. Committing the bit is what makes that knowledge unnecessary for everyone who clones, rather
than something each person reconstructs. The cost is remembering `chmod +x` once, at creation.

**How to apply:** when adding a `.sh` file, open it with `#!/bin/sh` and set its executable bit
before committing it; confirm with `git ls-files -s` that the mode is `100755`. Write the usage
line in its header as `./name.sh`. When reviewing a script someone added, check the mode before
anything else — it is the one defect that will not show up until another machine runs it.
Related: the `git` package's run-suite-before-commit rule (the other thing confirmed before a
commit), and the foundation README's account of which scripts are authoring tools and which are
carried to a consuming project.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 10:34:48 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 2:50:13 PM PT
