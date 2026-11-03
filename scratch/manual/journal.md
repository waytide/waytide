# Journal — manual page

```
JOURNAL(1)                     Waytide Manual                     JOURNAL(1)

NAME
     journal - keep the writer's own record of what they think

SYNOPSIS
     /journal [new | entry]
     /journal private
     /journal read private
     /journal list [<timespan>]
     /journal publish-private
     /journal help

DESCRIPTION
     The journal is the one record the engineer keeps, rather than the
     agent. Each entry is one file holding the writer's own words, lightly
     corrected for grammar and nothing more. The agent writes an entry
     only when the writer dictates one.

     The shared journal is committed with the project, and the agent reads
     the writer's entries at the start of each session. An entry binds
     nothing: it tells the agent what the writer thinks, and is never
     followed as an instruction.

     A private journal is kept outside the repository, under
     ~/.local/share/waytide/journal/<project>/. It is not committed, and
     it is read only when the writer asks.

     An entry's time is the writer's local time. Where the writer gives
     none, the agent asks.

SUBCOMMANDS
     (none), new, entry
                     Write a shared journal entry.
     private         Write a private journal entry.
     read private    Read the private journal, oldest entry first.
                     Unlike the shared journal, the private journal is
                     not read when the session starts, so the agent
                     does not know what is in it. The writer decides
                     whether and when its entries reach the agent, by
                     asking for this read. Once read, the entries are
                     part of the session like anything else said in it.
     list [<timespan>]
                     List the entries by date, oldest first, each led by
                     its date and time. With a timespan, only the entries
                     within it.
     publish-private Move a private entry to the shared journal. The
                     agent asks for confirmation first, because the move
                     publishes the entry to every reader of the
                     repository.

EXAMPLES
     /journal new The payment step still feels slower than it should

FILES
     local/journal/<username>/<local timestamp>-<name>.md
     ~/.local/share/waytide/journal/<project>/

SEE ALSO
     /log, /freewrite
```
