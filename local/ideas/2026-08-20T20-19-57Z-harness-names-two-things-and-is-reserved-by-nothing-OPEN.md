# `harness` names two things in the same domain, and no vocabulary reserves it

- **State:** Open
- **Tags:** [observation]

**Why this state:** a working hypothesis under discovery, surfaced while examining whether
*agent harness* describes Waytide. It records a term collision and a missing vocabulary entry,
each of which the `language` rules would ordinarily catch. It proposes no change. It is promoted
once it is decided whether `harness` takes an entry, in which vocabulary, and whether the
self-description sense is abandoned outright or distinguished.

## The two referents

**Waytide's rules use `harness` for the thing that **runs** the agent** — Claude Code, or another
program that reads `.claude/settings.json`. That is 28 occurrences in 10 files:

| File | Occurrences |
|---|---|
| `foundation/announce-waytide-at-session-start` | 11 |
| `foundation/print-the-deferred-queue-after-the-rule-read` | 3 |
| `foundation/downstream-work-is-never-offered` | 2 |
| `journal/ask-for-entry-time-or-omit-it` | 2 |
| `foundation/project-context-lives-in-the-committed-artifacts` | 1 |
| `foundation/present-every-prompt-through-askuserquestion` | 1 |
| `foundation/README` | 1 |
| `foundation/vocabulary` | 1 |
| `design-by-efferent/dbe-as-design-tool` | 1 |
| `language/ete/ete-declares-its-own-categories` | 1 |

The usage is consistent and load-bearing: *the two surfaces the harness renders*, *the harness
fails to parse the output*, *the harness's own working state*, *the harness renders the built-in
free-text answer last*, *harnesses that read `.claude/settings.json`*.

**Waytide's self-description used the same word for Waytide itself.** The 2026-08-03 decision log
records *"Waytide is an agent harness and an engineer ally"*, its reason being that *harness*
states the binding mechanism on the agent. A second entry the same day records the revision to *an
agent harness and a human ally*.

**So one word named the program the agent runs inside and the packages that program's agent
reads.** The `language-is-precise-here` rule states the cost: *a term that means one thing here
and another there is worse than either*.

## The collision was already present when the phrase was settled

`announce-waytide-at-session-start` was authored 2026-07-22 and used `harness` for the running
program from the start. The tagline was settled 2026-08-03. Nothing raised the conflict at either
moment.

**It was left behind rather than resolved.** On 2026-08-04 the tagline moved to *Waytide:
Human-Agent Relations*, for reasons about the allusion rather than about this word. The
self-description sense stopped being used and was never withdrawn.

**The log entries stand as written.** They are historical records, and
`disclosure-is-the-one-reason-to-edit-a-historical-record` reaches nothing here.

## `harness` is used as a term and is reserved by nothing

**The `ete-declares-its-own-categories` rule names it as an example**, among `attended`,
`unattended`, `free-text option`, and `selection prompt`, under human-computer interaction. That
rule then says outright: *A word with no entry is not reserved, and the category is not a standing
permission.*

**No vocabulary carries an entry for it.** The single hit in `foundation/vocabulary.md` is the
word being *used* inside the `free-text option` entry's prose.

**Two of the five examples got entries and three did not.** `attended` and `unattended` are
defined in the `design-by-efferent` vocabulary. `free-text option` is defined in `foundation`'s,
and its entry says so explicitly — *a category is not a standing permission, so the term above is
what reserves the word*. `harness` and `selection prompt` have none.

**So the same sentence that is cited as reserving `free-text option` is doing no work for
`harness`**, and the rule says as much in its own words.

## The word has been refused twice for a Waytide-internal referent

`dbe-as-design-tool` weighs `harness` for the efferent test and refuses it: *The efferent test
then acts as a jig or a harness. More precisely it is a **cradle**.* The ground is that a cradle
must not grip rigid.

The 2026-08-03 reasoning inverted that ground — gripping rigid is what the rules do to the agent —
and reached the opposite answer for a different referent. **Both refusals and the one acceptance
concern what the word should name inside Waytide.** Its external sense has never been examined.

## What is not settled

- **Whether `harness` takes a vocabulary entry**, fixing the running-program sense, and which
  vocabulary holds it. `foundation` uses it most, and the ete rule files it under
  human-computer interaction.
- **Whether the self-description sense is abandoned or distinguished.** Abandoning costs
  nothing today, since nothing live uses it.
- **Whether `selection prompt` is the same defect**, and whether other words are used as terms
  in the rules with no entry anywhere. Only the two named here were counted.
- **Whether a check is worth having** that reports a word used as a term without an entry. The
  `ordinary-vocabulary-is-not-reserved-and-not-rewritten` rule states that no check can sort
  terminology from ordinary vocabulary, so such a report would be read rather than enforced.

---

Authored by Scott Bellware on Thu Aug 20 2026 at 1:19:57 PM PT
