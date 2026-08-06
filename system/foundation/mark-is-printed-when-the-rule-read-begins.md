# The mark is printed by the agent when the rule read begins

Waytide's mark is printed **once per session, at the head of the response that carries the rule
read**. The agent prints it. It is the first thing in that response, above any account of what is
being read and above every tool call the read makes.

```
     __      /
    /  \    /
   |    |  /
    \__/  /
      | =/=
     _|_/
    / |
     / \
    /   \
   /    /
===========
    | |
  __|_|__
 (o)   (o)
```

**It is the same mark in every project.** It is Waytide's, not a project's, so nothing configures
it and nothing supplies a per-project alternative. The figure above is the whole of it; it is
printed as it stands here, with no frame, no heading, and no caption.

## Why it marks the read rather than the session's start

**A mark marks a loading.** It stands for the system coming into force in this session — the rule
files being opened and taken on. That is an act the session performs, and it has a moment.

**The `SessionStart` hook cannot be at that moment.** A hook runs **before** the session, so at
the instant it emits anything, no rule file has been read and none is being read. The mark
carried the session-start notice from 2026-08-05 until 2026-08-06, and it was in the one place
that could only ever show it when nothing was loading. The notice's own wording had already
conceded this — it says **installed**, never *loaded*, precisely because installation is what a
pre-session hook can observe (see the announce-waytide-at-session-start rule). A mark for a
loading, printed above a line that carefully declines to claim one, was the mismatch.

**So the mark went to the party that does the loading.** The agent is what opens the rule files,
and it is the only thing in the session that can print at the moment they are opened.

## The mark rule is read first, and that is what supplies the figure

The agent has read nothing at the instant the mark prints, so the figure has to come from
somewhere. **This one rule file is opened ahead of every other**, and the hook's read instruction
says so outright. The rest of the read follows in the same response, under the mark.

**This is why the art lives in a rule rather than in the hook.** The hook could have carried the
figure to the agent instead, and the mark would then stand at the read's very first instant
rather than a beat into it. That was declined for two reasons. The art belongs where it is
**edited as prose** — a fenced block in a rule file, changed by anyone who can read the rule.
And carrying it through the hook keeps a hazard that this placement otherwise **removes**: the
hook's output is interpolated into a JSON string by `printf` with no escaping, so every backslash
in the figure had to be doubled, and a single missed one made the whole output unparseable and
the notice vanish with no error at all. **Nothing of the mark is interpolated into JSON any
more.** The backslashes above are literal backslashes, and an editor of the art writes what they
mean.

What is given up is exactness of the moment: the mark heads the response that carries the read
rather than preceding the first file opened. One rule file is read ahead of it. That is the cost,
and it is small against an art nobody can safely edit.

## The response that opens this file carries no prose

**Reading this file is a tool call, and it is the whole of that response.** No preamble, no
sentence saying what is about to be read, nothing. Otherwise the read opens on a line of
narration standing exactly where the mark is meant to stand, and the cost above quietly doubles:
one rule file read ahead of the mark is the accepted price, and a line of the agent's own prose
ahead of it is not.

**This rule cannot be what asks for it.** The response in question is the one that reads this
file, so at the instant the agent writes there, nothing here is in hand — the same fact that puts
the figure a beat into the read rather than at its first instant. The requirement therefore
travels on the hook's read instruction, which is the only channel that reaches the agent before
any file is opened, and which already names this file for the same reason (see the
announce-waytide-at-session-start rule). It is stated here as well so the two surfaces agree, and
because a reader of this rule asking what *the head of the response* excludes is asking about
this.

## This is not the session-start notice

The announce-waytide-at-session-start rule forbids the agent printing **the notice** — the
installation announcement the harness already emits, which an agent-printed copy would duplicate.
The mark is not that, and it is now the **second** thing the agent prints around the read, beside
the deferred queue (see the print-the-deferred-queue-after-the-rule-read rule). The three divide
cleanly:

- **The notice** is the harness's, emitted before the session, reporting what is installed.
- **The mark** is the agent's, at the head of the read.
- **The deferred queue** is the agent's, at the read's conclusion.

**The mark still prints no package count and restates nothing.** It carries no words at all,
which is what keeps it from duplicating a line the notice already renders.

**It prints once.** It heads the read, and the read happens once in a session. A mark that
recurred would become furniture, which is the failure the deferred-queue rule names in keeping
the queue out of the always-present notice.

## `WAYTIDE_QUIET` still silences it, through the instruction

The environment variable that silences the notice and the status line silences the mark too. **It
reaches the agent as a sentence in the hook's read instruction**, because the agent cannot read
the environment and no other channel would carry it.

**It silences the mark and nothing else about the read.** The rule read and the deferred queue
are unaffected, exactly as the read instruction is unaffected today: quieting a display must
never disable the mechanism that carries the rules.

**Why:** a mark announces that something is being brought into force, so it belongs at the moment
that happens rather than at the moment the session opens — and only the agent is present at the
first of those. Moving it there also puts the art where it can be edited safely, which the JSON
channel it previously travelled on could not: a doubled backslash is an editing rule nobody
remembers, and forgetting it failed silently and completely. Keeping it to one print, wordless,
at the head of the read, is what stops it becoming a permanent line that is read once and never
again. Keeping the opening response silent is what keeps the one rule file read ahead of the mark
from becoming a line of prose read ahead of it too — the concession was to the mechanism, not to
the agent's narration.

**How to apply:** print the mark above, verbatim, at the head of the response that carries the
rule read — before the account of the read and before its tool calls. Read this rule file ahead
of every other so the figure is in hand, and print nothing in the response that reads it: that
response is the tool call alone. Print it once per session and never again, print no
words with it, and print nothing where the hook's instruction says `WAYTIDE_QUIET` is set. Do not
print the session-start notice, which remains the harness's. When editing the art, write literal
backslashes — nothing here is a JSON literal. Related: the announce-waytide-at-session-start rule
(the notice this is not, and the hook that names this file and carries the no-prose requirement),
the print-the-deferred-queue-after-the-rule-read rule (the read's other bookend), and the
rules-convention (the read this heads).

---

Authored by Scott Bellware on Wed Aug 5 2026 at 10:47:28 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 11:08:06 PM PT
