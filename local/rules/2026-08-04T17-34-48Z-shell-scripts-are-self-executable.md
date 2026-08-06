# A shell script is self-executable — the executable bit is set and the file opens with a shebang

Every `.sh` file in this repository is **runnable as itself** — `./read-consuming-projects.sh`,
never `sh read-consuming-projects.sh`. Two things together make it so, and both are required:
the bit and the shebang, below. **One script is documented with an `sh` prefix even so**, because
the copy a developer runs is not the file this repository holds; the delivery section states when
that applies and why the bit is set on it regardless.

- **The executable bit is set**, and it is set at the moment the file is created rather than
  the moment someone notices. Git records the bit in the file's mode, so the check is
  `git ls-files -s` reporting **`100755`** rather than `100644`.
- **The file opens with a shebang** naming the interpreter — `#!/bin/sh` for every script here.
  Without it the bit alone leaves the interpreter to the invoking shell.

**This reaches every shell script Waytide ships**, which is what makes it a rule about the system
rather than about one repository's tidiness. Two kinds of script are authored here and they are
covered alike:

- **The tools at the root** — `report-direct-commits.sh`, `read-consuming-projects.sh`, and
  `report-planning-directories-named-in-part.sh` are authoring tools, run by whoever maintains
  Waytide, in this repository. **`install-all.sh` sits beside them and is not one**: a consuming
  project fetches it, which is what makes it the one script here a developer runs from somewhere
  other than a clone of this repository. That is the whole reason the delivery section below
  exists.
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

## The bit is always set; the usage line follows how the script is delivered

**Every `.sh` file here carries the bit, without exception.** A script fetched with `curl` is
committed `100755` exactly like the rest, and nothing below relaxes that. What varies is only the
**usage line**, and it varies because the bit does not survive every delivery.

- **`git clone` and `git subtree` carry the file's mode.** A script that reaches a developer either
  way arrives executable, so its usage line reads `./name.sh` and it is invoked as itself. Twelve
  of the thirteen scripts here are in this case.
- **`curl` carries content and not file metadata.** An HTTP response body is bytes; the mode is a
  filesystem attribute and is not in it, so `curl` writes a new file at the default permissions and
  the copy is **never** executable, whatever the original's mode. A script delivered this way takes
  a usage line of **`sh name.sh`**, in its own header and everywhere its install is documented.

**`install-all.sh` is the only script in that second case**, being the one a project fetches before
it has anything installed to deliver it. Its usage line is `sh install-all.sh`, and the root
`README.md` matches.

**Why the bit stays set on a script nobody can receive it from.** Two reasons. It is correct in
this repository, where the file is cloned like any other and is run as itself by whoever maintains
Waytide. And the delivery is not permanent — a script fetched by `curl` today may be delivered by
some other means later, and a file that had been left `644` because one path stripped the bit would
then arrive broken by a path that would have carried it.

**The general form:** the bit is a property of the file and is always set; the usage line is a
claim about a particular reader's copy and follows the delivery. The two only appear to conflict
where one reader's copy is not the file.

**This exception was found the hard way.** The README documented `curl -O …` followed by
`./install-all.sh`, which fails with a permission error, so the published install procedure did not
work. The same fact had been recorded for `install.sh` on 2026-07-28 and was never carried to
`install-all.sh` or into this rule.

This was already the practice when the rule was written: all ten `.sh` files in the repository
were `100755` and opened with `#!/bin/sh`. The rule records the practice rather than introducing
it, which is why nothing had to be conformed.

**Why:** a script is a command, and a command that has to be prefixed with its interpreter is
not one yet — it is a file that a reader has to know something extra about before they can use
it. Committing the bit is what makes that knowledge unnecessary for everyone who clones, rather
than something each person reconstructs. The cost is remembering `chmod +x` once, at creation.

**How to apply:** when adding a `.sh` file, open it with `#!/bin/sh` and set its executable bit
before committing it; confirm with `git ls-files -s` that the mode is `100755`. Set the bit on
every script, including one fetched with `curl`. Write the usage line in its header as
`./name.sh`, unless the script is delivered by `curl` — then write `sh name.sh` there and wherever
its install is documented, since that copy cannot be executable. When reviewing a script someone
added, check the mode before anything else — it is the one defect that will not show up until
another machine runs it.
Related: the `git` package's run-suite-before-commit rule (the other thing confirmed before a
commit), and the foundation README's account of which scripts are authoring tools and which are
carried to a consuming project.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 10:34:48 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 2:50:13 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 3:00:44 PM PT
