# Projects — manual page

```
PROJECTS(1)                    Slasher Manual                    PROJECTS(1)

NAME
     projects - the machine's registry of Slasher projects

SYNOPSIS
     /projects
     /projects help

DESCRIPTION
     Lists the projects on this machine that use Slasher, from within any
     one of them. The list is kept in a per-machine file outside every
     repository, so no project names another in its own files.

     It reports what the registry holds. It does not change a project or
     reach the network.

FILES
     ~/.config/slasher/consuming-projects.toml

SEE ALSO
     /package
```
