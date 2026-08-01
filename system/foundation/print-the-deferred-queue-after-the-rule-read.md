# Print the deferred queue as a table, immediately after the rules are read

When the rules under `waytide/system/` and `waytide/local/rules/` have been read at the start
of a session, **print the deferred queue** before waiting for the developer's first real
request. It is the last thing the read produces.

**The form is a table**, one row per item under `waytide/local/deferred/`:

| Item | Date | Summary |
|---|---|---|
| The deferred queue is surfaced at session start | 2026-07-28 | The notice reports open experiments and features and says nothing about this queue. |
| Package release rules | 2026-07-28 | Nothing settles how a release is made — version schemes, the prompt, the commit message. |

- **Item** is the item's title, as its `# <title>` line states it.
- **Date** is the date from the ISO-8601-UTC filename prefix.
- **Summary** is one line saying what the item is about, read from the item.

**State the count.** The table is preceded or followed by the number of items, so the size of
the queue is a fact the developer is given rather than one they count.

**An empty queue prints a line saying so.** It does not print an empty table and does not
print nothing. A queue that has been emptied is worth stating once; silence there would be
indistinguishable from the print having been skipped.

**This is not the session-start notice, and it is not an exception to the rule forbidding
one.** The announce-waytide-at-session-start rule prohibits the agent printing a **notice** —
the installation announcement the harness already emits, which an agent-printed copy would
duplicate. This is a different thing on a different surface:

- **The notice is emitted by a hook, which runs before the session.** It cannot report
  anything the session then does, and it renders every session regardless of context. A queue
  segment there would be present always, and a line that is always present is read once and
  never again.
- **This print happens after the read, inside the response that concludes it.** It is bounded
  to that one moment, it does not recur, and nothing about it competes with the notice.

**The agent reads the items, so nothing has to be machine-readable.** A script parsing
`waytide/local/deferred/` would need the `**Gated on:**` line in a fixed form to say anything
about what is actionable. The agent reads the prose, so the deferred convention's format is
unaffected by this rule.

**Why:** the deferred queue is where work goes so it is not lost, and it was the one working
directory nothing reported. The working directories are not read at session start, the
session-start notice covers only experiments and features that have not concluded, and the
`next-deferred-item` command reaches the queue only when someone thinks to ask — so an item
was surfaced only by deliberate looking. Printing it at the moment the rules are read costs
one table, once, at the point the developer is deciding what the session is for, which is
exactly when the queue is worth seeing. Putting it after the read rather than in the notice
is what keeps it from becoming furniture: the notice would carry it every session in the same
place, and the failure of a permanent line is that it stops being read.

**How to apply:** after reading the rule files at the start of a session, read
`waytide/local/deferred/` and print one table row per item — title, date from the filename
prefix, and a one-line summary — with the count stated. Where the queue is empty, print a
line saying so. Then wait for the developer's request. Do not print a Waytide installation
notice, which remains the harness's and is prohibited to the agent. Related: the
agent-deferred-convention (the queue's format and its resolution step), the
next-deferred-item-command rule (the on-demand way into the queue), the status-report-format
rule (whose deferred table carries a `kind` column this one omits, being a fuller report),
the agent-rules-convention (the read this follows), and the announce-waytide-at-session-start
rule (the notice this is not).

---

Authored by Scott Bellware on Sat Aug 1 2026 at 4:10:02 PM PT
