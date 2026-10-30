# Publish — manual page

```
PUBLISH(1)                     Waytide Manual                     PUBLISH(1)

NAME
     publish - publish packages from this repository

SYNOPSIS
     /publish [<package>...]
     /publish help

DESCRIPTION
     Publishes packages from this repository to their own repositories,
     following CONTRIBUTING.md. It exists only in the repository where
     Waytide's packages are written.

     A publish happens only from master, and only after the work has
     concluded and merged there. It is never offered while a feature or
     an experiment is open. Before the publish, the rules are compiled,
     and anything the compile changes is committed.

FILES
     CONTRIBUTING.md

SEE ALSO
     /release, /package
```
