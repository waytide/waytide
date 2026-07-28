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

- **A run of reads before anything else.** Every `.md` file under `system/` — 86 at the time
  of writing — read before the first tool call that touches the request, `system/foundation/`
  first, since the instruction names it first. The failing shape is this session's opening:
  straight to `git status` and `rm`, with the reads arriving far later.
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
  `~/.claude/projects/<project>/<session-id>.jsonl`, which records every tool call in order.
  The ordering of the reads against the first `Edit`/`Write`/mutating `Bash` is there and
  needs no cooperation from the agent.

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

**Gated on:** a **second** cold session in this repository, opened with a trivial request and
observed for whether the rules are read before the first action. The first cold session
settled the channel and left compliance unsettled, so the gate is now compliance alone.
Nothing else blocks the publish; the runbook in `CONTRIBUTING.md` applies unchanged and the
split will fast-forward.

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
