# Waytide announcement — draft

The message announcing Waytide to the Eventide community, written for Slack. **A first version was
posted on 2026-08-22.** What is below is the current draft, revised since.

**It sits directly in `local/` for now.** No convention covers content — `local/` holds ideas,
implementations, logs, migration, the journal, the rules, and the vocabulary, and an announcement
is none of them. That gap is what *Waytide for content and web* names, and this file moves when
that idea settles where content lives.

**It takes the ISO-8601-UTC datetime prefix**, like every other dated artifact under `local/`. A
draft is a dated thing rather than a structural one — a later draft is a later file, and the two sort
in the order they were written. That is what separates it from `local/vocabulary.md`, which
accretes and is named for what it is.

## The draft

The markup is Slack's — `*bold*`, `_italic_`, and fenced blocks — rather than the markdown the rest
of this repository uses.

```
*Announcing Waytide: The Eventide Project's agent harness*

The engineer decides. The agent generates. Where there is ambiguity, the agent gives the engineer options.

https://github.com/waytide/waytide/blob/master/README.md

Waytide is a project's working conventions, written as files an AI coding agent reads at the start of every session. Memory is written to disk, in the project's own waytide/ directory, rather than kept in the agent's — committed with the code, reviewable and diffable, and read fresh each session rather than recalled.

It came out of the design practice the Eventide Project uses in its own work, extracted from Constant and generalized into installable packages.

• *Conventions that bind* — one rule per file, in prose, each carrying its reasoning
• *The work records itself* — decisions, ideas, and implementations accumulate beside the code
• *Design By Efferent* — the call written before any implementation, so the interface is shaped from the use site
• *Gates, not ceremony* — the loop stops only where a decision is subtle and load-bearing
• *Five checkpoints* — the call, the way to prove the call's effects, the conditions necessary to prove it, the implementation of it, and following clarifications and evolutions. The agent provides reasonable assumptions and options, or the engineer takes the helm

A Ruby project gets all of it in one command:

    curl -O https://raw.githubusercontent.com/waytide/waytide-ruby/master/install.sh
    sh install.sh

https://github.com/waytide/waytide
```

**The install commands are indented above rather than fenced**, because a fence inside a fence does
not survive. In Slack they take a fenced block, so that `sh install.sh` reads as something to copy
rather than as prose.

## What is deliberately absent

**The license.** Waytide is source-available under the Eventide Common Interest License, free to
use, and it does not permit modification. The engineer left that out of the posted version after it
was raised. It is recorded here because it is the one fact a reader cannot recover quickly from the
links — the `LICENSE` file says the terms are still to come, so someone cloning the repository has
no way to learn that modification is refused until they read it.

**The package count and the rule-file count.** Both are true today and both move. A number in a
Slack post does not get corrected.

**`tools/ruby-lang`.** The path is an implementation detail at this altitude, and `waytide-ruby` is
what someone would search for.

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:33:17 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 12:37:33 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 12:47:14 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 12:48:11 AM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 12:50:22 AM PT
