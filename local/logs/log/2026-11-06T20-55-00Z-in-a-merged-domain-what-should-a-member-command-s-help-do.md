# In a merged domain, what should a member command's help do, such as /next help or /reserve help, now that /process help and /language help print the whole domain? — Only the domain takes help, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> In a merged domain, what should a member command's help do, such as /next help or /reserve help, now that /process help and /language help print the whole domain?

The options:

- **Prints the domain's help** — /next help prints the same NEXT help as /process help. The domain's help text is written once. Every root command still takes help, so the command rule is unchanged. /process and /language are new commands that take only help.
- **Only the domain takes help** — /next help is no longer a command. Only /process help, /log help, /package help and /language help print a domain's help. The rule that every root command takes help is amended.
- **Prints its own lines only** — /next help prints only the /next lines under the NEXT heading. /process help prints the whole domain. Each command keeps its own help text, and the domain's help is built from them.

The engineer's answer: **Only the domain takes help**
