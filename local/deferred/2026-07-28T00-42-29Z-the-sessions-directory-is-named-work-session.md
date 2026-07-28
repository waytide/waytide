# The `sessions/` directory is renamed `work-session/`

`waytide/local/sessions/` holds session records. The directory should be named for what
a session *is* in this system — a **work session** — rather than for the bare word
`session`, which names an interval of anything and is the weakest available reading of
the thing. The convention rule already opens by defining the contents as "the narrative
record of a work session"; the directory name does not carry that.

**The singular is part of the proposal, not an oversight.** The name is `work-session/`,
not `work-sessions/`, and it stands apart from every sibling — `log/`, `deferred/`,
`design/`, `plans/`, `experiments/`, `features/`, `observations/`. Whether the sibling
plural should win, or whether the singular names the kind of thing each file is and the
siblings are what is inconsistent, is the question the resolution has to settle. It is
not settled here.

**What the rename touches**, beyond moving the directory and its four records:
`system/foundation/agent-sessions-convention.md` (its title line, its opening
definition, and the filename itself, which carries `sessions` in it),
`system/foundation/agent-rules-convention.md`, `system/foundation/README.md`,
`system/foundation/install.sh`, and this repository's `AGENTS.md`. A consuming project
that already has `waytide/local/sessions/` is not reached by a rule change, so the
resolution has to decide whether anything migrates an installed project's directory or
whether the old name is simply left where it stands.

**Gated on:** nothing in flight — registered while appending a session record, which the
rename would have disrupted mid-write. Actionable whenever the naming question above is
taken up.

**Why:** the directory name is read every time a record is filed or found, and `sessions`
names an interval rather than the unit of work the records are about. The name-literally
principle asks for the thing's own name, and the convention rule already uses it in prose
while the directory does not.

**How to apply:** settle the singular-versus-plural question first, since it decides the
name; then rename the directory, update the five references above and the convention
rule's own filename, and decide what if anything is done for an installed project.
Resolve by deleting this file and logging that it was carried out.

---

Authored by Scott Bellware on Mon Jul 27 2026 at 5:42:29 PM PT
