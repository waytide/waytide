# A project works in formal or creative mode, chosen at its initiation

A Waytide project works in one of two **modes**, chosen when the project is initiated and held
for its life. The mode decides what the project's two planning artifacts are **called** and
**where they live**:

| Mode | The settled-direction artifact | The sequencing artifact |
|---|---|---|
| **formal** (the default) | a **design**, in `waytide/local/design/` | a **plan**, in `waytide/local/plans/` |
| **creative** | an **aspiration**, in `waytide/local/aspiration/` | an **intention**, in `waytide/local/intention/` |

The pairing is on a near/far axis: a design and an aspiration both answer *what are we going
toward*; a plan and an intention both answer *what are we going to do*.

## The conventions are the same in both modes

**The mode changes the vocabulary and the directory. It changes no obligation.** An aspiration is
written exactly as a design is — the same spine, the same dated **Settled** resolutions, the same
**Out of Scope / Deferred** tail. An intention is written exactly as a plan is, with the same
elements in the same order and the same behavior-stated checkbox tasks. An intention is
**superseded** by a later intention precisely as a plan is, and its tasks are completed or not
completed exactly as a plan's are.

So there are no separate conventions and no separate document formats. The design-convention,
plans-convention, design-document-format, and plan-document-format rules govern both modes, and
each names both directories.

**Why a mode that changes no obligation is worth having.** Because a word is not a label applied
to a thought after the fact — it is the thought's working surface, and choosing a word chooses a
concept. That is the `language` package's premise, and the rules-install-a-mindset rule states
the same thing from the other side: a large share of what a rule does is install a **stance**,
and vocabulary is the most direct lever on a mental model. A developer writing an *aspiration*
is doing something different from a developer writing a *design*, and the difference is in them
rather than in the document. This mode is that lever, applied at the scale of a whole project
rather than a single term.

**What this deliberately gives up.** The idea began with a stronger claim — that an intention
needs no supersession, and that an aspiration is not measured by completion the way a plan is.
Identical conventions abandon that claim. The modes are a vocabulary and a location, and the
machinery beneath them is one machinery.

## The choice is the agent's to put, and it is put at initiation

**Through the selection interface**, per the design-by-efferent
present-every-prompt-through-askuserquestion rule, with **formal as the default**.

**`install.sh` cannot do this**, and neither can any other script. The selection interface is an
agent-side tool and the installer is a POSIX `sh` script run from a shell; a script has no way to
reach it. The mode is therefore something the **agent** establishes, not a step in an
installation. Nor is it the concern of a tool that reaches existing projects — those are already
initiated.

## The mode is recorded as a local rule named for it

The chosen mode is written into `waytide/local/rules/` as a rule named **`formal-mode`** or
**`creative-mode`**, carrying the ISO-8601-UTC filename prefix every local rule takes (see the
file-names rule) — `2026-08-05T06-30-25Z-creative-mode.md`. It states that the project operates
under that mode and which conventions are therefore active.

**It is a local rule rather than a setting** because that is what it is: a binding convention of
the project, read unconditionally at the start of every session along with every other rule. No
new mechanism carries it, and nothing has to be taught to read it.

**The filename alone carries the mode**, which is what lets both checks below work without the
file being opened.

- **A rule is written whichever mode is chosen.** Formal is the default, not the silent case.
- **An absent mode rule means the question has never been asked** — not that the project is
  formal. The agent asks, once, and writes the rule.
- **The mode is not inferred from which directories exist.** That reasoning is circular: the
  first aspiration cannot be placed until the mode is known, the directory exists only once
  something is in it, and git does not track an empty directory.

## The planning directories corroborate the rule

**A project's directories are evidence, and they are checked against the mode rule.**
`waytide/local/aspiration/` or `waytide/local/intention/` present in a project with no
`creative-mode` rule is a **contradiction**, not a formal project. So is a `creative-mode` rule in
a project where only `design/` and `plans/` hold anything.

**A contradiction is surfaced and never resolved by assumption.** The agent says what it found and
asks; it does not pick a mode and proceed.

**The failure this exists to prevent** is a creative project whose mode rule is accidentally
deleted. Without the check, its absence would read as formal, and the agent would write designs
and plans into `design/` and `plans/` while `aspiration/` and `intention/` held the project's
actual planning artifacts — the project's planning split across two vocabularies, working
incorrectly, with nothing announcing it.

## The mode does not change after initiation

A project's mode is settled when the project is initiated and is not switched later. What would
be involved in changing it — what becomes of artifacts written under the other mode, and whether
the two can coexist — is deliberately unaddressed rather than answered badly.

**Why:** the two modes exist because the words a project plans in are load-bearing, and a project
that can drift between them gets the cost of both vocabularies and the benefit of neither.
Recording the mode as an ordinary local rule keeps it where binding conventions already live and
adds no mechanism to the system. Writing the rule in both modes is what makes an absent rule
mean something precise, and corroborating it against the directories is what keeps a deleted rule
from silently reverting a project to a mode it is not in — the same stance the rest of the system
takes toward ambiguous input, which is to refuse it rather than to guess.

**How to apply:** at a project's initiation, put **formal or creative** to the developer through
the selection interface, with formal as the default, and write the chosen mode into
`waytide/local/rules/` as a `formal-mode` or `creative-mode` rule with its datetime prefix. Where
no mode rule is present, ask — the absence is a question never asked, not a default. Check the
planning directories against the rule and surface any contradiction rather than assuming a mode.
Work the directories the mode names, applying the same conventions and document formats in
either. Do not switch a project's mode after initiation. Related: the design-convention and
plans-convention (the directories, both named in each), the design-document-format and
plan-document-format rules (the shapes, identical in both modes), the rules-convention (where a
local rule lives and what it looks like), the file-names rule (the datetime prefix), the
`language` package's language-is-precise-here rule and this package's rules-install-a-mindset rule
(why a vocabulary change is a real change), and the design-by-efferent
present-every-prompt-through-askuserquestion rule (why the choice is put through the selection
interface).

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:30:25 PM PT
