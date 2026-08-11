# A shell script is self-executable — the executable bit is set and the file opens with a shebang

Every `.sh` file in this repository is **runnable as itself** — `./report-direct-commits.sh`,
never `sh report-direct-commits.sh`. Two things together make it so, and each is required:
the bit and the shebang, below. **One script is documented with an `sh` prefix even so**, because
the copy a engineer runs is not the file this repository holds. The delivery section states when
that applies and why the bit is set on it regardless.

- **The executable bit is set**, and it is set at the moment the file is created rather than
  the moment someone notices. Git records the bit in the file's mode, so the check is
  `git ls-files -s` reporting **`100755`** rather than `100644`.
- **The file opens with a shebang** naming the interpreter — `#!/bin/sh` for every script here.
  Without it the bit alone leaves the interpreter to the invoking shell.

**This reaches every shell script Waytide ships**, which is what makes it a rule about the system
rather than about one repository's tidiness. Two kinds of script are authored here and they are
covered alike:

- **The tools at the root** — `report-direct-commits.sh` and
  `report-planning-directories-named-in-part.sh` are authoring tools, run by whoever maintains
  Waytide, in this repository. **`install-all.sh` sits beside them and is not one**: a consuming
  project fetches it, which is what makes it the one script here a engineer runs from somewhere
  other than a clone of this repository. That is the whole reason the delivery section below
  exists.
- **The scripts inside the packages**, and `foundation`'s in particular — `install.sh`,
  `refresh-packages.sh`, `session-start.sh`, `statusline.sh`, `report-unrecognized-mode.sh`, and
  `read-consuming-projects.sh`. These
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
comment. The bit without a shebang runs the file under whatever shell happens to invoke it,
which is how a script written for `sh` gets run by something else and fails somewhere in its
middle.

**A script's own documentation depends on it.** Every script in this repository opens with a
**usage line** — the command a engineer types, in the script's own header. That line is a claim
about how the file is invoked, and it is false for a script that is not executable, so the
convention is not cosmetic tidiness but the thing that keeps each script's header true.

## The usage line names the command. The command follows where the script is run from

**`./name.sh` is not the universal form, and this rule asserted that it was until 2026-08-06.**
Throughout this section `name.sh` stands for the script's own name, which the rule left
unexplained and a reader had no way to tell from a filename.

Three forms are in use, and which one is correct is not a matter of taste:

- **`./name.sh`** — for a script that sits in the directory the command is typed in. Two scripts
  take this form, the two authoring tools at this repository's root.
- **The path form** — the script's location written from the directory the command is typed in,
  as in `waytide/system/foundation/refresh-packages.sh`. A packaged script is run from a
  consuming project's **root** and lives several directories below it, so `./name.sh` there names
  a file that is not present and the command fails. Ten scripts take this form.
- **`sh name.sh`** — the `curl` case above, and the only form that names an interpreter.

**`./` is not what makes a script self-executing, which is what the rule had confused.** The
executable bit and the shebang are, and they are what the two requirements at the top of this rule
ask for. The `./` prefix contributes nothing to it: it exists to tell the shell that the argument
is a **path** rather than a name to look up on `PATH`, and any string containing a slash already
says that. So `waytide/system/foundation/refresh-packages.sh` is exactly as self-executing as
`./report-direct-commits.sh` — neither names an interpreter, and `./` is simply what a path looks
like when the file is in the current directory.

**A script nobody types carries an Invocation block instead.** `session-start.sh` and
`statusline.sh` are wired into `.claude/settings.json` by `install.sh` and run by the harness, so
a usage line would name a command no engineer issues. Each records its invocation anyway, and
says why: a script whose invocation is not written down is one nobody can reproduce when the
wiring breaks.

## The bit is always set. The usage line follows how the script is delivered

**Every `.sh` file here carries the bit, without exception.** A script fetched with `curl` is
committed `100755` exactly like the rest, and nothing below relaxes that. What varies is only the
**usage line**, and it varies because the bit does not survive every delivery.

- **`git clone` and `git subtree` carry the file's mode.** A script that reaches a engineer either
  way arrives executable and is invoked as itself, naming no interpreter — as `./name.sh` or in the
  path form, whichever the section above gives it. Twelve of the thirteen scripts here are in this
  case — only the `curl`-fetched one is not.
- **`curl` carries content and not file metadata.** An HTTP response body is bytes. The mode is a
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

**The general form:** the bit is a property of the file and is always set. The usage line is a
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
before committing it. Confirm with `git ls-files -s` that the mode is `100755`. Set the bit on
every script, including one fetched with `curl`. Give it a usage line in its header naming the
command that runs it, written from the directory that command is typed in — `./name.sh` for a
script at this repository's root, the path form for a script inside a package, and `sh name.sh`
only for one delivered by `curl`, there and wherever its install is documented. Where the script
is run by the harness rather than by a person, record its invocation and say what runs it. When
reviewing a script someone added, check the mode before anything else — it is the one defect that
will not show up until another machine runs it.
Related: the `git` package's run-suite-before-commit rule (the other thing confirmed before a
commit), and the foundation README's account of which scripts are authoring tools and which are
carried to a consuming project.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 10:34:48 AM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 2:50:13 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 3:00:44 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 5:48:30 PM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 1:35:11 PM PT
Changed by Scott Bellware on Sun Aug 9 2026 at 6:06:52 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
