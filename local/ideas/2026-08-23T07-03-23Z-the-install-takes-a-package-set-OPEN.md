# The install takes a package set on the command line

- **State:** Open
- **Tags:** [aspiration]

**Why this state:** the defect is named and the replacement is a sketch. What the argument list
means — a replacement for the default set, an addition to it, or a set that resolves dependencies
transitively — is undecided, and it decides the rest. It is promoted to `Active` once that is
settled.

## Premise

**As the engineer stated it:** the Ruby tool package and installation approach isn't sustainable.
At some point I might want to install a custom set that is input at the install command line.

## What is not sustainable about the present arrangement

**A tool package declares the whole system as its dependency.** `tools/ruby-lang`'s
`install-dependencies.sh` installs the other seven, and its `install.sh` fetches the composite's
`install-all.sh` and runs it before adding itself. That was settled on 2026-08-21 and it works for
one tool package.

**It does not compose.** A project that is Ruby and also uses a second tool would run the Ruby
installer, which installs the seven and Ruby, and then a second tool installer, which fetches and
runs the composite's installer **again** before adding its own package. Each tool package claims
the whole set, so two of them claim it twice.

**The dependency is not really a dependency.** Prescriptive Ruby style does not need `journal` or
`versioning` to be applicable. What `tools/ruby-lang → everything` expresses is a **distribution**
convenience wearing a dependency's clothes. The idea *The Ruby package leaves the default
distribution* distinguished the two, and the feature that built it collapsed them deliberately.
This is that collapse coming due.

**Every tool package needs an installer of its own.** `install.sh` in `tools/ruby-lang` exists
only to reach a bare directory. A second tool package needs the same file, and a third needs it
again — the same script, differing in one repository name.

**A subset is unreachable.** Today a project takes seven packages or eight. There is no way to ask
for `foundation`, `language`, and `git` and nothing else.

## The sketch

```
curl -O https://raw.githubusercontent.com/waytide/waytide/master/install-all.sh

sh install-all.sh                                    the default set
sh install-all.sh foundation language git            a chosen set
sh install-all.sh tools/ruby-lang                    a tool package, and what it needs
```

**`refresh-packages.sh` already works this way**, and the argument form would match it: *Name
packages to refresh only those* — `refresh-packages.sh testing git`. So the shape is established
in the system rather than invented here.

**If it lands, a tool package needs no installer of its own.** A project curls the composite's
installer and names what it wants. `tools/ruby-lang`'s `install.sh` becomes
`sh install-all.sh tools/ruby-lang`, and the file is removed rather than copied into every future
tool package. `install-dependencies.sh` then declares what the package actually needs rather than
everything.

## What is not settled

- **What the argument list means.** A replacement for the default set, an addition to it, or a
  request that resolves dependencies transitively — `install-all.sh testing` pulling `foundation`
  and `language` because `testing` includes them.
- **How a package is named on the command line.** `tools/ruby-lang` is the installed path,
  `tools-ruby-lang` is what the flattening would give, and `waytide-ruby` is the repository. The
  `**Repository:**` declaration made those three differ.
- **How the installer learns about a package it does not ship.** `install-all.sh` hardcodes its
  list, and a tool package authored outside the composite is not in it. Naming one on the command
  line means the installer resolving a repository from a name it has never seen.
- **Whether the default set stays a list in the script.** If a set can be named, the default is
  one named set among others, and where that name is written is open.
- **What becomes of `install-dependencies.sh`.** A package that declares its real dependencies and
  an installer that resolves them may be the same mechanism twice.

Related:

- *The Ruby package leaves the default distribution* — where distribution and package were
  distinguished, before the feature collapsed them
- *Waytide for content and web* — the second tool package, which is what makes the composition
  problem concrete rather than hypothetical
- the `tools/ruby-lang` package — the one worked case, and the shape this would replace

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:03:23 AM PT
