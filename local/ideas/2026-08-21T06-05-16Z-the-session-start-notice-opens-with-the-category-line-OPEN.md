# The session-start notice opens with `Waytide: Human-Agent Relations`

- **State:** Open
- **Tags:** [aspiration]

**Why this state:** the proposal is stated and one argument against it is the system's own. It is
promoted once it is decided whether a line that never changes belongs on a surface that renders
every session. It proposes a change to the announce-waytide-at-session-start rule and to
`session-start.sh`, and neither is made here.

## Premise

**As the engineer stated it:** the start-up notice starts with `Waytide: Human-Agent Relations`.

**That is the category line settled on 2026-08-20**, standing beside the description in *A
Generalized Description of Waytide*. It is what the root `README.md` leads with today.

## What the notice reads now

`session-start.sh` builds it in two parts:

```
Waytide installed at waytide/system/ — 8 packages: foundation, language, …

Waytide's rules are loaded before your first instruction will be processed. Loading the rules will take a few moments.

To load them now, type: load waytide.
```

**Its shape is a report, a blank line, and an ask.** The report is the install line plus any open
experiment and feature lines. The ask is the close. The
announce-waytide-at-session-start rule fixes each part, including where the blank lines fall and
why.

**A category line is a third kind of thing.** It reports nothing and asks nothing. It says what the
system is.

## What argues for it

- **The notice is where a person first meets Waytide in a session**, and the install line tells
  them a system is present without telling them what it is for.
- **The register matches.** The notice is plain text with no markdown, and the line carries no
  markup, no quotation mark, and no backslash. It is safe on the JSON channel that has twice
  swallowed the notice silently.
- **The mark's reason for leaving does not reach it.** The mark was moved to the rule read because
  it stands for the system being brought into force, and a hook runs before the session. A
  category line makes no claim about loading, so the timing objection does not apply to it.

## What argues against it, and it is this system's own argument

**A line that never changes is read once and then stops being read.** The
announce-waytide-at-session-start rule states it about a permanent segment, and the
print-the-deferred-queue-after-the-rule-read rule states it again as the reason the queue is
printed after the read rather than carried in the notice: *the failure of a permanent line is that
it stops being read*.

**The install line is permanent too, and it survives that objection because its content moves.**
The package count and list change, and the open-implementation lines appear and disappear. A
category line has no such variation.

**The status line already carries the standing fact.** `waytide · master :: Waytide` renders every
turn, and the rule says what it is for: the standing fact that the system is in force. A second
permanent statement of identity is a second thing that stops being read.

**`Waytide` would open two consecutive lines.** The install line already begins with the word.

## What is not settled

- **Whether it is added at all**, against the permanent-line argument above.
- **Whether it replaces something rather than adding.** The install line's leading `Waytide` is
  the candidate, since a category line above it already names the system.
- **Whether the status line changes with it**, or keeps its one-word segment.
- **Whether a blank line follows it**, which would make the notice four parts rather than three.

Related:

- the announce-waytide-at-session-start rule — the notice's shape, why it carries no mark, and the
  permanent-line argument
- the print-the-deferred-queue-after-the-rule-read rule — where that argument is stated again
- the initialization-rule — the agent-printed head of the read, which is closed to additions
- *A Generalized Description of Waytide* — where the category line is settled

---

Authored by Scott Bellware on Thu Aug 20 2026 at 11:05:16 PM PT
