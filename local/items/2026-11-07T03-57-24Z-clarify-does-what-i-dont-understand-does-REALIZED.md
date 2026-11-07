# `/clarify` does what the reply "I don't understand" does

- **State:** Realized
- **Tags:** [idea]

**`/clarify` would do what the engineer's reply "I don't understand" did in the Slasher rename feature.** There, twice, a design question put through the selection interface was not understood. Asking to clarify through the selection interface led nowhere. The reply "I don't understand" led the agent to restate the question in terms of what the test sets up and does, set out each option by what it would and would not catch, recommend one, and put the question again. That is what `/clarify` would do.

Today `/clarify` rewrites the previous answer more plainly, twice, and asks again any question the answer put. It says the same thing in fewer words. "I don't understand" asked for something else: the same question explained from what the engineer already knows.

**Not yet settled:** whether `/clarify` changes, or a second command carries this; and whether it reaches only a question put through the selection interface, or any answer.

**Settled 2026-11-06:** `/clarify` changes, and no second command carries this. It reaches any answer. Where the answer put a question, it also sets out each option, recommends one, and puts the question again. The engineer directed the change: "Change the clarify command to run "I don't understand"".

## History

As the engineer first stated it: "Have the "/clarify" command run "I don't understand""

---

Authored by Scott Bellware on Fri Nov 6 2026 at 7:57:24 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 9:26:33 PM PT
