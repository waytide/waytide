# Package — manual page

```
PACKAGE(1)                     Slasher Manual                     PACKAGE(1)

NAME
     package - manage the Slasher packages installed in this project

SYNOPSIS
     /package activate <package>
     /package deactivate <package>
     /package refresh [<package>...]
     /package install
     /package help

DESCRIPTION
     Slasher is a set of packages of rules, installed under
     slasher/system/. All of them are read at the start of each session,
     and the active ones are followed.

     Activating or deactivating a package writes a new package-set
     declaration. A deactivated package's rules stop applying at the
     next session.

SUBCOMMANDS
     activate        Make an installed package active.
     deactivate      Set an installed package aside.
     refresh         Bring installed packages up to date from their
                     repositories, and report which rules changed.
     install         Install Slasher into this project.

FILES
     slasher/system/<package>/
     slasher/local/<UTC timestamp>-<set>-package-set.md

SEE ALSO
     /projects, /release
```
