# Design By Efferent does not govern content work in this project

**Content work is not designed through the five hinges.** Writing an article, a lesson, a slide deck, a README, or the pages of a site is not run through actuation, observation, controls, implementation, and naming. No loop record is written for it, no actuation is settled before the work, and no attended-or-unattended gate is put at its start.

**What content work is:** work whose product is prose or pages rather than code. A rule file, a record, a README, and the material of a site are each content. Writing the scripts and rules that *govern* content is not — that is ordinary work on this system, and DBE governs it as it always did.

## Why a rule and not a mechanism

**Waytide has no dormant state for an installed package.** Every rule file under `waytide/system/` is read at the start of every session, and the announce-waytide-at-session-start rule makes that read unconditional deliberately. There is nothing to switch off, so a rule saying the package does not apply is what stands in for the mechanism that does not exist.

**The package is still read.** This rule stops it being applied to content work. It does not stop it loading, and it does not remove anything.

## This rule is an interim and names what would retire it

**Two ideas would make it unnecessary**, and both are now settled:

- *Design By Efferent is an `ext/` package* — if DBE leaves the default distribution, a content project does not install it, and nothing has to say it does not govern. **Abandoned 2026-08-25**, the engineer being undecided whether the core of Waytide should be without the method. **That question was settled later the same day: the core keeps the method.** So this idea will not retire the rule, and the abandonment is now a decision rather than a deferral.
- *A content project does not start with Design By Efferent active* — the parked question this rule answers by hand. **Realized 2026-08-25** by the `content` package set and the package-set declaration.

**Neither settlement retires this rule, and the reason is which project each reaches.** They settle what a **content project** installs and activates. This rule governs content work **in this repository**, where the `default` set holds design-by-efferent and it is active. The retirement condition below was written loosely, and this is what it missed.

**So this rule is kept rather than removed, which reverses what it expected of itself.** It was written as an interim standing in for a mechanism that did not exist. The mechanism now exists — a project declares a package set and what the set does not name deactivates — and this repository does not use it for the method, because the core keeps it. The rule is what holds design-by-efferent off content work here, and nothing else does.

**It is still an interim, and what would retire it has changed.** Not either of the two ideas above. It retires if this repository ever declares a set that leaves the method out, or if the core question is revisited and answered the other way.

## What it asserts about precedence, and the gap under it

**A local rule overrides a package rule in this project where the two conflict.** The rules-convention says both are read and both are followed, and it settles what happens when a rule conflicts with **default agent behavior**. It does not say what happens when a local rule conflicts with a package's.

**The vocabulary-convention settles the same question for vocabularies** — a project's own decides over every package's — and no rule does it for rules. This rule asserts the parallel for itself rather than waiting for one, and names the gap so the assertion is visible rather than assumed.

**Why:** DBE's five hinges are a design method for a unit of code. An article has no actuation, no observation of an effect, and no controls. Running the loop over prose would be the ceremony the method exists to discontinue, reached from the other side — form performed where the thing it is for is absent.

The method's spine is not code-specific: the engineer decides where a decision bears weight and the agent generates the rest. Whether that half has a content equivalent is an open question and this rule does not answer it.

**How to apply:** when the work is content, write it. Do not put the five hinges to the engineer, do not open a loop record, and do not ask attended or unattended.

Where a piece of work is both — a rule that governs content, a script that builds a site — DBE governs the code half and this rule reaches the prose. When either idea above settles, suspend this rule and log it.

Related:

- the `design-by-efferent` package's hinge-cycle and attended-or-unattended-is-chosen-at-the-start rules — what this suspends for content work
- the `foundation` announce-waytide-at-session-start rule — the unconditional read that leaves no package dormant
- the rules-convention and vocabulary-convention — the precedence this asserts and the gap it names
- the a-suspension-is-a-log-entry rule — how this rule ends

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:18:00 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:12:39 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:00:05 PM PT
