# A way to decline the rule read, given before the rules are read, that does not itself cause the read

The session-start hook instructs the agent to read every rule file under `waytide/system/`
before its first substantive action, and the notice tells the developer they may bring that
read forward by typing `load waytide`. There is no counterpart in the other direction: a
developer who does **not** want the rules read in this session has nothing to say that
declines it.

The difficulty is that the decline has to arrive **through the same channel the read is
triggered by**. The agent acts on its first message from the developer, and the hook's
instruction is already in its context by then, so any message at all — including a message
whose content is "do not read the rules" — is itself the occasion for the read the
instruction asks for. An agent that honors the instruction reads the rules before it has
finished considering the request that asked it not to. The decline therefore cannot be an
ordinary instruction typed into the session; it has to reach the mechanism before the agent
does.

`WAYTIDE_QUIET` is deliberately not that mechanism. It silences the two surfaces the
developer sees and, by design, leaves the read instruction firing — quieting a display must
not switch off the system's governance (see the announce-waytide-at-session-start rule). So
a decline needs its own name and its own gate, and settling what it is called and what it
switches off is most of the work.

**Priority:** 2

**Gated on:** nothing in flight; take it up when the session-start mechanism is next worked.

**Why:** the read is unconditional on purpose — the failure it answers is a session that
judged a small opening request not worth the read and then grew into rule edits and package
publishes governed by rules never read. But unconditional with no exit means a developer who
genuinely wants a session outside the system has no way to ask for one, and the only recourse
available to them is to not use the harness configuration at all. An explicit, named decline
is the honest form of what is otherwise obtained by disabling the hook.

**How to apply:** settle what the decline switches off (the read instruction alone, or the
notice with it), where it is expressed so that it reaches the hook rather than the agent — an
environment variable, a settings entry, or an argument to the hook script — and what the agent
is to say about a session it is running rule-free, since a silent decline reproduces the
original failure in a new place. Record the choice in the announce-waytide-at-session-start
rule alongside `WAYTIDE_QUIET`, whose boundary this shares. Related: the
announce-waytide-at-session-start rule and the rules-convention.

---

Authored by Scott Bellware on Tue Jul 28 2026 at 11:35:39 AM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 5:35:18 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 11:09:47 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 1:04:45 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:42:14 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:45:18 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 5:47:10 PM PT
