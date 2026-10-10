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

---

Authored by Scott Bellware on Wed Sep 9 2026 at 1:36:50 PM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:38:18 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:50:23 AM PT
