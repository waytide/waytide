ITEMS
  /item new [<kind>]               Create an item tagged [<kind>], or [idea]
                                   with no kind. Any kind may be named.
  /item <kind>                     An alias of /item new <kind>, where the
                                   kind is not also a subcommand of /item
  /item idea, /idea                Create an item tagged [idea]
  /item work, /work, /work-item    Create an item tagged [work]
  /item plan, /plan                Create an item tagged [plan]
  /item design, /design            Create an item tagged [design]
  /item aspiration, /aspiration    Create an item tagged [aspiration]
  /item goal, /goal                Create an item tagged [goal]
  /item observation, /observation, /observe
                                   Record an observation
  /item mistake, /mistake          Create an item tagged [mistake]
  /item problem, /problem          Create an item tagged [problem]
  /item list <state>, /list <state>
                                   List items in a state
                                   <state>: any item state, or "current"
                                   (Open and Active)
  /item current, /current-items    List current items (/item list current)

  /item start                      Open -> Active
  /item realize                    -> Realized
  /item done                       -> Done ([work] items only)
  /item defer                      -> Deferred
  /item suspend                    -> Suspended
  /item supersede                  -> Superseded, naming the replacement
  /item abandon                    -> Abandoned
  /item obsolete                   -> Obsolete
  /item reopen                     Take back Realized, Deferred, Open, or Done

  /item help                       Print this command's help

  /observation promote             Promote an observation to a rule
  /observation help                Print this command's help

  A bare /idea is /idea new. A bare /observation is /observation new.
  A kind that is also a subcommand, such as list, is created with
  /item new list.
