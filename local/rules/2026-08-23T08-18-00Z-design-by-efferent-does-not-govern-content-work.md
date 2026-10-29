# Design By Efferent does not govern content work in this project

**Content work is not designed through the five hinges.** Writing an article, a lesson, a slide deck, a README, or the pages of a site is not run through actuation, observation, controls, implementation, and naming. No loop record is written for it, no actuation is settled before the work, and no attended-or-unattended gate is put at its start.

**What content work is:** work whose product is prose or pages rather than code. A rule file, a record, a README, and the material of a site are each content. Writing the scripts and rules that *govern* content is not — that is ordinary work on this system, and DBE governs it as it always did.

## Why a rule and not a mechanism

**A project can switch a package off by declaring a set that leaves it out**, per the a-project-declares-which-installed-packages-are-active rule. This repository keeps design-by-efferent active, since the core keeps the method, so this rule is what holds it off content work here.

**The package is still read.** This rule stops it being applied to content work. It does not stop it loading, and it does not remove anything.

## This rule is an interim and names what would retire it

**Two items would make it unnecessary**, and both are now settled:

- *Design By Efferent is an `ext/` package* — if DBE leaves the default distribution, a content project does not install it, and nothing has to say it does not govern. **Abandoned 2026-08-25**, the engineer being undecided whether the core of Waytide should be without the method. **That question was settled later the same day: the core keeps the method.** So this item will not retire the rule, and the abandonment is now a decision rather than a deferral.
- *A content project does not start with Design By Efferent active* — the parked question this rule answers with a rule rather than a mechanism. **Realized 2026-08-25** by the `content` package set and the package-set declaration.

**Neither settlement retires this rule, and the reason is which project each reaches.** They settle what a **content project** installs and activates. This rule governs content work **in this repository**, where the `default` set holds design-by-efferent and it is active. The retirement condition below was written loosely, and this is what it missed.

**So this rule is kept rather than removed, which reverses what it expected of itself.** It was written as an interim standing in for a mechanism that did not exist. The mechanism now exists — a project declares a package set and what the set does not name deactivates — and this repository does not use it for the method, because the core keeps it. The rule is what holds design-by-efferent off content work here, and nothing else does.

**It is still an interim, and what would retire it has changed.** Not either of the two items above. It retires if this repository ever declares a set that leaves the method out, or if the core question is revisited and answered the other way.

## What it asserts about precedence, and the gap under it

**A local rule overrides a package rule in this project where the two conflict.** The a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule says both are read and both are followed, and it settles what happens when a rule conflicts with **default agent behavior**. It does not say what happens when a local rule conflicts with a package's.

**The a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule settles the same question for vocabularies** — a project's own decides over every package's — and no rule does it for rules. This rule asserts the parallel for itself rather than waiting for one, and names the gap so the assertion is visible rather than assumed.

**Why:** DBE's five hinges are a design method for a unit of code. An article has no actuation, no observation of an effect, and no controls. Running the loop over prose would be the ceremony the method exists to discontinue, reached from the other side — form performed where the thing it is for is absent.

The method's spine is not code-specific: the engineer decides where a decision bears weight and the agent generates the rest. Whether that half has a content equivalent is an open question and this rule does not answer it.

**How to apply:** when the work is content, write it. Do not put the five hinges to the engineer, do not open a loop record, and do not ask attended or unattended.

Where a piece of work is both — a rule that governs content, a script that builds a site — DBE governs the code half and this rule reaches the prose. Suspend this rule and log it if this repository declares a set that leaves the method out, or if the core question is answered the other way.

## Compressed

## Content work

1. Content work is work whose product is prose or pages rather than code. An article, a lesson, a slide deck, a rule file, a record, a README, and the material of a site are each content.
2. Writing the scripts and rules that govern content is not content work. Design By Efferent governs it.
3. When the work is content, write it.
4. Do not run content work through the five hinges: actuation, observation, controls, implementation, and naming.
5. Do not put the five hinges to the engineer, do not open a loop record, settle no actuation before the work, and do not ask attended or unattended.
6. Where a piece of work is both, such as a rule that governs content or a script that builds a site, Design By Efferent governs the code half and this rule reaches the prose.

## The package stays active

1. This repository keeps design-by-efferent active. This rule is what holds it off content work here.
2. The package is still read. This rule stops it being applied to content work, and it does not stop it loading or remove anything.

## Precedence

1. In this project, a local rule overrides a package rule where the two conflict. No rule settles this for rules in general; this rule asserts it for itself.

## Retiring the rule

1. This rule is an interim. The core question is settled: the core keeps the method.
2. Suspend it and log it if this repository declares a set that leaves the method out, or if the core question is answered the other way, so that the core is without the method.

## Compression

- 2026-10-29, compressed: 4800 → 1512 characters; checked: 28 directives, 18 kept, 4 less precise, 6 lost; 3 repairs, re-checked: 23 directives, 18 kept, 2 less precise, 3 lost; what is still not kept was judged reasons or background

Related:

- the `design-by-efferent` package's the-hinge-cycle-is-actuation-observation-controls-implementation-and-naming and attended-or-unattended-is-chosen-when-the-work-is-started rules — what this suspends for content work
- the `foundation` the-harness-announces-waytides-installation-and-the-agent-never-prints-the-notice rule — the unconditional read that leaves no package dormant
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory rule and the a-packages-vocabulary-holds-its-terms-and-the-most-specific-one-decides rule — the precedence this asserts and the gap it names
- the a-suspension-is-a-log-entry-tagged-suspended-and-nothing-is-moved rule — how this rule ends

---

Authored by Scott Bellware on Sun Aug 23 2026 at 1:18:00 AM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 5:12:39 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:00:05 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 9:53:26 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 2:57:52 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:14:05 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:20:33 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:17 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:36 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:45:31 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:06:51 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 2:19:36 PM PT
Changed by Scott Bellware on Thu Oct 29 2026 at 11:02:45 AM PT
