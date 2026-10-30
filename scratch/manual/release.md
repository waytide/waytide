# Release — manual page

```
RELEASE(1)                     Waytide Manual                     RELEASE(1)

NAME
     release - choose the next version of a package

SYNOPSIS
     /release
     /release help

DESCRIPTION
     Puts the next version to the engineer as a choice of three: patch,
     minor, or major. Each option shows the version it would produce and
     what it claims about the change for the people using the package.
     The agent never chooses the version itself.

     A version is semantic versioning, optionally led by a product
     generation number. The generation marks a new product line. It is
     declared separately, and is never part of a release.

EXAMPLES
     For a payments library at 2.3.1:

         Patch  -> 2.3.2   behavior corrected, interface unchanged
         Minor  -> 2.4.0   capability added, existing use unaffected
         Major  -> 3.0.0   existing use may not survive

SEE ALSO
     /publish
```
