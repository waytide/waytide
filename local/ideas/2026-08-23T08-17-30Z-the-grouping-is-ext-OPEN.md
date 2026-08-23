# The grouping is `ext/`, for external and extension both

- **State:** Open
- **Tags:** [aspiration]

**Why this state:** the name answers the admission question that two earlier ideas left open, and
it costs a third rename of the same directory and an abbreviation where the system has used whole
words. It is promoted to `Active` once those are weighed.

## Premise

**As the engineer stated it:** `tool/` should be called `ext/`. It stands for external as well as
extension.

## It answers the question the name `tools/` could not

**`tools/` is named for a tool and collects something else.** *Design By Efferent is a `tools/`
package*, recorded minutes earlier, states the problem: DBE is a **method** rather than a tool, and
the property it shares with `ruby-lang` is that each is **specific to something not every project
uses**. The grouping was named for the wrong half.

**`ext/` names that property directly, twice over.**

- **Extension** — it extends the base rather than being part of it. That admits a method, a
  language, a test framework, and a build system without stretching, because none of them has to
  be a tool.
- **External** — it is authored outside the composite. `tools/ruby-lang` is, and the
  `CONTRIBUTING.md` exception written for it says so.

**The two meanings point the same way, which is not the same as ambiguity.** A word that names two
unrelated things is the defect `language-is-precise-here` warns about. Here one name covers two
facts that hold of the same set, and either reading sends a reader to the right place.

**So the admission question may dissolve rather than be answered.** *The grouping is `tool/`, not a
language* asked what counts as a tool and said the second member would settle it. Under this name
the question is what counts as an extension, and a method plainly does.

## What it costs

**It is the third rename of this directory.** `code/` until 2026-08-21, then `tool/` for minutes,
then `tools/`, now `ext/`. The first was argued and the rest have been quick.

**`ext` is an abbreviation where the system has used whole words.** `rules/`, `ideas/`, `logs/`,
`implementations/`, `migration/`, `journal/`, and `system/` are all words. The
`expand-abbreviations-on-first-use` rule bars an abbreviation the reader may not know without
spelling it out, and this one abbreviates two words at once with neither spelled out. A directory
name is not prose, so that rule does not govern it — but the reason behind it reaches this.

**A path change is not free.** `tools/ruby-lang` is installed in four projects and its prefix is
written into `waytide-ruby`'s `install.sh`, its `install-dependencies.sh`, and its README. The
`**Repository:**` declaration means a path change no longer forces a repository rename, which it
would have before today.

**STE:** `EXTENSION (n)` is approved, meaning *the action when* something is extended, and
`EXTERNAL (adj)` is approved, meaning *of, or on, the outer side*. Neither approved meaning is the
one intended here, and `ext` is absent from the dictionary as an abbreviation.

## What is not settled

- **Whether the abbreviation is accepted**, against a corpus of whole-word directory names.
- **Whether both meanings are stated anywhere**, or whether the name is left to carry them
  silently. A name that means two things and says so once is different from one that means two
  things and never says which.
- **Whether the rename happens now or waits.** DBE has not moved, so `ext/` would hold one member
  and a second is being built.
- **What a consuming project does.** Four hold `waytide/system/tools/ruby-lang/` today.

Related:

- *The grouping is `tool/`, not a language* — the rename this supersedes, and the question it left
- *Design By Efferent is a `tools/` package* — the member that exposed the naming problem
- *Waytide for content and web* — the second member, being built now
- the `expand-abbreviations-on-first-use` rule — the reason an abbreviation is weighed rather than
  taken

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:17:30 AM PT
