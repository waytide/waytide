# Freewrite — manual page

```
FREEWRITE(1)                   Waytide Manual                   FREEWRITE(1)

NAME
     freewrite - say points as they come, and organize them afterward

SYNOPSIS
     /freewrite begin | end | resume
     /freewrite idea | observation | mistake
     /freewrite help

DESCRIPTION
     Freewriting is saying points as they occur, unsorted and unedited,
     and shaping them afterward. Between begin and end, each point the
     engineer says is written down as it arrives, in their own words.

     At end, the agent reframes the points into an organized version and
     asks whether they become a new idea or are added to a recent item
     the conversation is about.

     The points are kept in a file outside the repository, with the
     engineer's original words and the organized version together. That
     file is not committed and is not logged. Once the item is written,
     the file is renamed to match it.

SUBCOMMANDS
     begin           Begin freewriting.
     end             End it, organize the points, and write them to an item.
     resume          Reopen a freewrite that has ended. New points are
                     added after the earlier ones, and the organized
                     version is written again at the next end.
     idea            Freewrite into a new idea item.
     observation     Freewrite into a new observation.
     mistake         Freewrite into a new mistake item.

EXAMPLES
     /freewrite begin
     guest checkout without an account
     the receipt should list the coupon
     save the cart across devices
     /freewrite end

FILES
     ~/.local/share/waytide/collections/<project>/<UTC timestamp>[-<name>].md

SEE ALSO
     /item, /observation, /journal
```
