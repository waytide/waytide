# Reducing rule files to their essential directives

- **State:** Open

**As the engineer stated it:** reduce size of files by reducing them to their essential directives. The determination of "essential" is the challenge.

## What the read costs today

The rule files and vocabularies read at session start hold 569,781 characters across 119 files, and the local rules and this project's vocabulary hold 31,083 more. The read of them on 2026-08-28 took about two and a half minutes of wall-clock.

The largest single file is the announce-waytide-at-session-start rule at 32,426 characters. Four vocabularies and two rules follow it above 12,000 each. Provenance footers account for 1,195 lines.

## What makes "essential" hard to determine

A rule file carries more than its directive, and each of the other parts is there for a stated reason:

- **The `**Why:**` passage** is what a later reader decides against when they weigh changing or removing the rule. The rules-convention requires it.
- **The account of what a rule replaced, and what that cost** — the rejected alternative, the mechanism that was decommissioned, the wording that failed. A directive alone does not stop the same alternative being reached for again.
- **The worked instance.** Several rules turn on a distinction that only a worked case makes legible — the actuation-gate rule's omitted argument, the ete rules' two worked phrases.
- **The `Related:` list**, which is how a rule is reached from a neighbouring one, the rules being referenced by name rather than by path.
- **The provenance footer**, which the record-rule-authorship-in-a-footer rule requires because `git subtree` strips per-file history from a consuming project.

So a reduction that keeps only the directive is a reduction that discards the reasoning the corpus was built to preserve. That is the difficulty the engineer named, stated as what would be given up.

## What is not yet settled

- Whether "essential" is decided per file, per part, or by a test that any rule can be run through.
- Whether the reduction is a rewrite of each file or a second, shorter artifact derived from it, with the full file kept.
- Whether the reader whose need decides is the agent at session start or the engineer revising a rule. The two want different things from the same file.
- Whether the cost being reduced is the read's duration, the context it occupies, or the reader's attention.

## When the read occurs — added 2026-10-10

**The rules are read once per session, not once per request.** The text from that read stays in the conversation context for the rest of the session.

**Each request still sends the whole context to the model, and the rule text is part of it.** Claude Code caches the unchanged opening part of the context, so processing it again on later requests is fast and costs less.

**The hook fires on every kind of session start.** `.claude/settings.json` registers the `SessionStart` hook with no matcher. Claude Code starts a session on startup, on resume, on `/clear`, and on context compaction, and each of these sends the read instruction again.

**Compaction replaces the rules with a summary.** The hook firing again is what brings the read instruction back after that.

**So the wait the engineer sees is the first read of a session**, along with any read after a clear or a compaction. That is the duration this idea would shorten. On 2026-10-10 the read covered 667,009 characters across 126 files.

## An implementation plan for a faster read — added 2026-10-10

**The plan measures first, builds the two mechanical changes next, and shrinks what is read only after the questions above are settled.** The mechanical changes are a packaged script for the read and an experiment with the `additionalContext` channel. Each step after the first is measured against the starting point.

- [ ] **The starting point is measured.** The read's size, the number of tool calls it takes, and the time from the start of the read to the first response are recorded. The size on 2026-10-10 was 667,009 characters.
- [ ] **A feature: one packaged script prints every rule, in a fixed order.** The script lives in `foundation`. It prints foundation first, then the other packages, then the local rules and the project vocabulary. The read instruction `session-start.sh` carries directs the agent to it, so the agent no longer decides how to group the reads. The announce-waytide-at-session-start rule's description of the instruction is reconciled. This is code, so Design By Efferent governs it. This repository holds only interactive tests, so the check is a session in which the tool calls are counted.
- [ ] **An experiment: the rules arrive through the `additionalContext` channel.** The question is whether `session-start.sh` can deliver the script's output to the agent before its first response, with no read at all. The forecast is written before the work, and covers the channel's size limit and whether the rules arrive in time. This step uses the script as its source, so it follows it. If it is affirmed, two rules change. The announce-waytide-at-session-start rule keeps that channel to the read instruction. The initialization-rule places its display at the head of the read's response. If it is refuted, the script stands alone as the improvement.
- [ ] **The open questions above are settled by the engineer.** They are the questions listed under *What is not yet settled*, and three more. Whether the record-rule-authorship-in-a-footer rule reaches the copy that is read, since its reason is subtree-published copies. Whether a package `README.md` counts as a rule file for the read. Which parts are given up: the footers, the README files, or the dated history clauses.
- [ ] **What is read is shrunk by the answer.** A derived version is a feature: a generator, and a check that regenerates the derived version and compares it, so the agent never follows a stale copy. The source files are left as written. Shortening the files themselves is content work, which Design By Efferent does not govern in this repository. History clauses removed from rules go to the decision log, where most of them already sit. Extending the vocabulary-entry ban on history to rules is a rule change of its own. Either way, the read instruction from the packaged-script step is pointed at the result.
- [ ] **The read is measured again** against the starting point, and the result is recorded here by dated addition.

**Out of scope.** Not reading deactivated packages, and reading on demand, are both left out. Each reverses a decision the a-project-declares-its-package-set rule and the announce-waytide-at-session-start rule already settled. Claude Code's fast mode is a setting the engineer turns on, not work to build.

## A package structure with source and derived rules — added 2026-10-10

**This describes the derived-artifact answer to the second open question, and does not settle it.** The full rule is the source, the authority, and the only file edited. A derived version is generated from it inside the package directory and committed, so it travels to a consuming project by `git subtree` as the rules do today. The session-start read reads the derived versions. Nothing outside the package directories moves.

### The layout of one package

- **The package root holds the derived rule files**, one per rule, each under the rule's own name.
- **A subdirectory holds the source rule files**, one per rule, under the same names. Its name is not settled, and `source/` is the working candidate.
- **`vocabulary.md` stays at the root and is read as it is.** It has no derived version, since its entries already carry no history and no pointers.
- **`README.md` stays at the root and is neither source nor derived.** The read leaves it out, which also settles whether a README counts as a rule file.

### Why it is shaped this way

- **The derived files sit at the package root under the rule's own name.** A rule is referenced by name, so keeping the name keeps every reference resolvable, and the read's path stays where it is.
- **The full rules move into a subdirectory.** The split is visible in a directory listing, and a reader wanting the reasoning knows where it is.
- **Everything stays inside the package directory.** `git subtree split` publishes a package directory and nothing else. A derived set kept anywhere else would never reach a consuming project.
- **The derived files are committed rather than generated in the consuming project.** Generating them there would put a generator in every project and a staleness problem in each. Committing them means a consuming project receives finished files.

### What each carries

- **The source** carries the directive, the `**Why:**` passage, the worked instances, the account of what the rule replaced, the `Related:` list, and the provenance footer. The record-rule-authorship-in-a-footer rule still requires the footer, because subtree strips per-file history.
- **The derived file** carries what the session-start read needs and nothing else. Exactly what that is remains this idea's open question. At the least, it drops the footer and the dated history clauses.

### How the two are kept in line

1. A source file is edited, and a derived file never is. The derived file is a projection in the `foundation` vocabulary's sense: regenerated, never maintained.
2. A generator in this composite writes the derived files. It is an authoring tool, so it sits unpackaged at the root beside `report-direct-commits.sh`.
3. A check regenerates every derived file and compares the result with what is committed. A difference means a derived file is stale. The check runs before a commit.
4. Where the two disagree, the source decides. The derived file is corrected by regenerating it, never by editing it.

### What else changes

- **The read instruction `session-start.sh` carries** names the package roots and leaves out the source subdirectory and `README.md`. That is narrower than *every rule file*, and the announce-waytide-at-session-start rule's account of the read changes with it.
- **The rules-convention** gains the source and derived distinction: where each sits, which is edited, and which is read.
- **A project's own local rules** take a decision. Either they are read whole, or the consuming project needs the generator too. Reading them whole ships no tooling. Local rules are few: four here, at 31,083 characters.
- **The packaged script for the read**, in the plan above, concatenates the derived files rather than the full rules. The two savings add together.
- **The package-set declaration** is unaffected. A deactivated package is still read, and the derived files are what is read.

### Alternatives to the layout

- **Derived files in a subdirectory, with the full rules left at the root.** The source stays where every reader finds it today, and the read's path changes in every consuming project.
- **One derived file per package rather than one per rule.** It reduces the number of files read. It gives up the one-rule-per-file shape that lets a rule be named and found by its file.

---

Authored by Scott Bellware on Wed Sep 9 2026 at 1:36:50 PM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:38:18 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:50:23 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:52:32 AM PT
