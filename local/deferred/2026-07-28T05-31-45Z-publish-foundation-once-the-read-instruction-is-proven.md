# Foundation is published once the session-start read instruction is proven to reach the agent

Commit `d679df5` adds the read instruction to `system/foundation/session-start.sh`, carried
on `hookSpecificOutput.additionalContext` rather than in the `systemMessage` notice. It is
committed in the composite and **deliberately not published** to `waytide/foundation`.

**What is unverified.** The script's output is valid JSON and carries both fields — that was
confirmed by parsing the actual output, along with the `WAYTIDE_QUIET` path and the
no-system-installed path. What could not be confirmed from inside a running session is that
the harness **consumes** `hookSpecificOutput.additionalContext` for a `SessionStart` hook. If
the field name or its shape is wrong, the instruction silently does nothing — which is the
same failure it was written to correct. The `systemMessage` channel is proven, because the
notice renders; this one is not.

**The observation that settles it.** The next session in this repository. If the channel
works, the agent reads every rule file under `system/` before its first substantive action,
unprompted. If the session opens with the agent acting first and reading later — or reading
only when a task appears to call for it — the channel is not reaching it, and the instruction
belongs in the notice instead, at the cost of showing the developer text addressed to the
agent.

**What to watch for, precisely:**

- **The criterion — settled 2026-07-28.** Every rule file under `system/` is read,
  `system/foundation/` first since the instruction names it first, and **the read completes
  before the agent produces anything — no response to the developer and no change to the
  repository. Reading and enumerating are free.** One line, one thing measured: before the
  read is done, the agent may only gather.

  Two earlier criteria were tried in this item and both are retired. **"Read before the
  first tool call that touches the request"** counts the wrong unit — tool calls are an
  artifact of how work gets batched, not of whether the agent deferred. It fails a `pwd`
  bundled into the enumeration call, which is no deferral at all, and passes the same
  command issued a moment apart. A test whose result turns on bundling measures bundling.
  **"Reads before the first `Edit`/`Write`/mutating `Bash`"** is worse: it misses the exact
  failure this item recorded. The first cold session mutated nothing — it read two files to
  answer a question, answered it, and deferred the rule read — so that criterion would have
  scored it a pass.

  The replacement is binary, visible in the transcript without cooperation from the agent,
  ungameable by bundling, and catches both recorded failure shapes — the session that
  answered first, and a session going straight to `git status` and `rm` — because each
  produced something before reading. It draws the line where the harm is: an answer the
  developer acts on, or a change the repository keeps, arrived at under rules never read.
  No file count is stated, because the count drifts as packages change and the criterion
  must not.
- **Open with a trivial request.** The test means nothing otherwise. A request to audit a
  package would have the agent read those files for task reasons and prove nothing about the
  instruction. The strongest opening is one that gives every excuse to skip the read — the
  session that produced this item opened with "remove the untracked file named noise".
- **Ask what arrived, before giving a task.** *What instruction did you receive about reading
  the rules, and where did it come from?* Context injected by a hook and a recalled memory
  arrive distinguishably, so the answer identifies the channel even if the agent then behaves
  correctly for some other reason. The hook's text is identifiable: it names the install path
  and says the apparent size of the first request is not a reason to defer.
- **The evidence is in the transcript**, at
  `~/.claude/projects/<project>/<session-id>.jsonl`, which records every tool call and every
  response in order, and needs no cooperation from the agent. It is where the criterion above
  is checked; it states no test of its own.

**A competing mechanism was removed so this tests one thing.** An agent memory instructing
the same read was written in the same session and deleted before the test, on the developer's
decision. It would have produced a passing session whether or not the channel worked — and
since a consuming project has no such memory, a confounded pass would have shipped a hook
that does nothing for anyone else. That is the failure this whole item exists to prevent, so
the memory had to go rather than the test being weakened.

**Publishing an unverified harness integration is what this avoids.** A consuming project
that pulled it would carry a hook that looks correct, reports nothing wrong, and does
nothing — and the projects least able to notice are the ones the instruction most needs to
reach.

**What the test produced (Mon Jul 27 2026 22:57 PT).** The session opened with the third
watch item — *what instruction did you receive about reading the rules, and where did it come
from?* — and the two halves of the result diverge.

*The channel works.* `hookSpecificOutput.additionalContext` reached the agent's context
verbatim, as its own turn ahead of the developer's message, and was identifiable as the hook's
text: it named the install path and stated that the apparent size of the first request is not
a reason to defer. The specific unverified thing — whether the harness consumes that field for
a `SessionStart` hook — is confirmed. The `systemMessage` notice did **not** reach the agent,
which is correct; that channel renders for the developer.

*The instruction did not produce the read.* No rule file was read before the first action. The
agent read `session-start.sh` and `.claude/settings.json` to answer the question, answered it,
and deferred the rule read on exactly the reasoning the instruction names — the request looked
small and meta, so the read was judged not to apply to it. It then offered the read as
something to approve, which is the same deferral in another form. The full read of all 83 rule
files under `system/` happened only after the developer asked whether the rules should have
been read. (The count above says 86 at the time of writing; it is 83 now, worth reconciling
separately.)

*The item's two branches do not cover this.* Moving the instruction to the `systemMessage`
notice was the remedy for a channel that silently does nothing, and that failure is disproven.
The same words on the developer's channel would not have changed the agent's judgment. What
failed is compliance, which the hook's own comment already disclaims any power to verify. So
the publish does not follow from this observation mechanically — it turns on whether a proven
channel carrying an instruction the agent then deferred is worth shipping.

**What the second cold session produced (Tue Jul 28 2026 00:28 PT) — and why it does not
settle the gate.** The session opened with "What is the current working directory" — trivial,
and not the disqualifying opening, since it did not ask what instruction had arrived. The
deleted memory stayed deleted, so nothing else instructed the read. Every rule file under
`system/` was read, `system/foundation/` first, before the first response and before any
change. Under the criterion settled above, that is a pass.

**It is nonetheless a confounded observation, and the confound is the criterion itself.** The
criterion was written *during* that session, after the behavior it judges, by the agent whose
behavior it judges. The session's first tool call bundled `pwd` — the answer to the request —
with the enumeration of the rule files, which failed the criterion then in force and passes
the one that replaced it. The replacement is defensible on its own terms and was argued from
the first session's failure rather than from this one's convenience. That does not make it
uncontaminated: a test rewritten after seeing the result is weaker evidence than one fixed in
advance, and this item deleted a competing memory precisely to avoid accepting a pass that
looked clean for the wrong reason. The consistent conclusion is to hold.

**The foil request makes the third observation ordinary rather than contrived — 2026-07-28.**
The notice now closes by asking the developer to type `begin`, a message with no content of
its own (see the announce-waytide-at-session-start rule). Because the agent never sees the
notice, `begin` is the whole of what reaches it, and the instruction to read comes only from
the hook — so a read that follows is attributable to the hook alone. That removes the
difficulty the earlier wording created: a notice naming the read outright, or a `/load-rules`
command, would have had the developer supply the instruction, and every session would have
had to be run *against* the mechanism to observe it. The third observation is now just a
session opened normally.

**Gated on:** a **third** cold session in this repository, opened with the foil request or any
other trivial request, and observed against the criterion settled above — which is now fixed **in advance** of the
session that will be judged by it, which is what the second observation lacked. The first
cold session settled the channel; the second produced a pass under a criterion written after
the fact. The gate remains compliance alone. Nothing else blocks the publish; the runbook in
`CONTRIBUTING.md` applies unchanged and the split will fast-forward.

**Why:** the change exists to close a silent failure, so shipping it while it might itself
fail silently would reproduce the fault at one remove. Holding costs nothing — the commit is
in the composite and the publish is one runbook away.

**How to apply:** open the next session here with a trivial request and note whether the rules
were read before the first action.

- **Read before the first action** — publish foundation by the `CONTRIBUTING.md` runbook and
  resolve this item.
- **Deferred again** — the instruction reaches the agent and does not compel it, which is a
  fact about the wording rather than the channel. Revise the instruction's text in
  `session-start.sh` and test again; do not move it to the `systemMessage` notice, which the
  first session disproved as the remedy.

Resolve by deleting this file and logging that it was carried out.

**Do not read the first session's answer as a second data point.** Once a session has been
asked what instruction it received, that session's later behavior proves nothing about the
instruction — the question itself put the rules in front of the agent. Only a session's
**opening** counts, and each session supplies one observation.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 10:31:45 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 10:41:26 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 10:57:25 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 10:59:56 PM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 12:28:30 AM PT
Changed by Scott Bellware on Tue Jul 28 2026 at 1:04:39 AM PT
