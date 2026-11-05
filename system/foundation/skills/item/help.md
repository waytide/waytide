ITEMS
  /item new [<kind>]               Create an item tagged [<kind>], or [idea]
                                   with no kind. Any kind may be named.
  /item <kind>                     The same as /item new <kind>, where the
                                   kind is not also a subcommand of /item
  /item idea                       Create an item tagged [idea]
  /item work                       Create an item tagged [work]
  /item plan                       Create an item tagged [plan]
  /item design                     Create an item tagged [design]
  /item aspiration                 Create an item tagged [aspiration]
  /item goal                       Create an item tagged [goal]
  /item observation                Record an observation
  /item mistake                    Create an item tagged [mistake]
  /item problem                    Create an item tagged [problem]
  /item list <state>               List items in a state
                                   <state>: any item state, or "current"
                                   (Open and Active)
  /item current                    List current items (/item list current)

  /item start <item>               Open -> Active
  /item realize <item>             -> Realized
  /item done <item>                -> Done ([work] items only)
  /item defer <item>               -> Deferred
  /item suspend <item>             -> Suspended
  /item supersede <item>           -> Superseded, naming the replacement
  /item abandon <item>             -> Abandoned
  /item obsolete <item>            -> Obsolete
  /item reopen <item>              Take back Realized, Deferred, Open, or Done

  /item help                       Print this command's help

  A kind that is also a subcommand, such as list, is created with
  /item new list.
