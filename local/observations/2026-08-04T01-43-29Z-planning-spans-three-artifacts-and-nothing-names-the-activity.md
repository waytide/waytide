# Planning spans three artifacts across two packages, and nothing names the activity they share

**Status:** a working hypothesis under discovery, surfaced by asking whether "implementation
plan" covers all of planning. It records a structure the system has and does not describe. It
proposes no change — the three may be correctly separate. It is promoted once it is decided
whether the activity wants a name, and whether the `plan` package's boundary is right.

**The question that surfaced it:** does "implementation plan" cover all the elements of
planning? It does not, on two counts.

## There are at least two kinds of plan, named differently and governed separately

| Artifact | Directory | Package | What it sequences |
|---|---|---|---|
| **design** | `local/design/` | `plan` | nothing — it settles direction |
| **implementation plan** | `local/plans/` | `plan` | a build **inside** this repository |
| **migration record** | `local/migration/` | `foundation` | content **crossing out of** the repository |

The migration convention calls its artifacts *"execution plans for transitions of content across
a repository boundary"*. That is planning, and it is not an implementation plan. It lives in a
different directory, under a different package, with a different name and a different format.

**Nothing places the three beside each other.** The `plan` package does not mention
`migration-convention` at all. The migration convention does cite the plans and design
conventions — so the cross-reference runs one way, from the newer rule to the older ones, and
the `plan` package does not know the third artifact exists.

## The name understates its own document

An implementation plan's eight sections are **Goal, Source design, Supersedes, Architecture,
Tech Stack, Process notes, Commit policy, Tasks**.

Only **Tasks** is implementation. Architecture is structural, Process notes and Commit policy
govern how the work is conducted, Goal states what it achieves, and Source design points at the
direction it realizes. The name covers one section of eight.

That is not the same defect as "session record" was. *Session* was **ambiguous** — the reader
could supply a shell session or a parliamentary one. *Implementation plan* is unambiguous and
**narrow**: it names a real thing and understates what the document holds.

## What is not established

- **Whether the activity wants a name.** Design, implementation plan, and migration record are
  three artifacts that plan three different things. They may be correctly separate, in which case
  a covering term would be a word that earns nothing — the failure this system names most often.
- **Whether the `plan` package's boundary is right.** It governs the design and the
  implementation plan, and its README already concedes its name understates it: *"despite the
  name 'plan', it governs design documents too."* The migration record sits outside it, in
  `foundation`, because `foundation` owns the artifact directories. Whether that is a principled
  boundary or an accident of which rule was written when is unexamined.
- **Whether prose should say "implementation plan"** where it says "plan" — 10 uses against 115.
  That is the same shortening corrected in the work-session rules, and it is the smallest of the
  three questions.

**The reason to be careful.** The obvious move is to invent a covering term and place the three
under it. But the three differ in what they produce and when they are written, and a name that
spans them would have to be vague enough to fit all three — which is how a word that explains
nothing gets into a vocabulary that exists to prevent exactly that.

---

Authored by Scott Bellware on Mon Aug 3 2026 at 6:43:29 PM PT
