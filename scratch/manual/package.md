# Package — manual page

```
PACKAGE(1)                     Waytide Manual                     PACKAGE(1)

NAME
     package - manage the Waytide packages installed in this project

SYNOPSIS
     /package activate <package>
     /package deactivate <package>
     /package refresh [<package>...]
     /package install
     /package help

DESCRIPTION
     Waytide is a set of packages of rules, installed under
     waytide/system/. All of them are read at the start of each session,
     and the active ones are followed.

     Activating or deactivating a package writes a new package-set
     declaration. A deactivated package's rules stop applying at the
     next session.

SUBCOMMANDS
     activate        Make an installed package active.
     deactivate      Set an installed package aside.
     refresh         Bring installed packages up to date from their
                     repositories, and report which rules changed.
     install         Install Waytide into this project.

FILES
     waytide/system/<package>/
     waytide/local/<UTC timestamp>-<set>-package-set.md

SEE ALSO
     /projects, /release
```
