- **Origin:** waytide/system/diary/no-stored-recap-regenerate-on-demand.md
- **Kind:** rule
- **Suspended:** 2026-08-14T18-32-29Z
- **Reconciliations:**
  - waytide/system/foundation/decision-log-convention.md — gained the one sentence this rule
    said that nothing else did, that a summary is never written to a file
  - waytide/system/diary/no-repo-auto-memory.md — cited this rule in its Related list. That
    rule was itself rewritten and moved to
    waytide/system/foundation/project-context-lives-in-the-committed-artifacts.md, and the
    citation did not survive the rewrite
  - this file's own Related list still names `no-repo-auto-memory`, which no longer exists
    under that name. A restore corrects it to the rule above

**Reason for suspension.** What it says is already said. The decision-log-convention gives the
read-time summary, and the foundation vocabulary defines **projection** as a derived artifact
that reads a record without destroying it and is regenerated rather than maintained. This rule
was a third statement of one idea, imported from another project, and it governed nothing here.

**What would bring it back.** A stored recap actually being written, or the decision-log
sentence proving too slight to prevent one.

---

# Do not store a work recap. Regenerate one on demand from the git history and the decision log

There is no stored *where we left off* recap in this project, and none is created. Where the
engineer asks what was done recently, or a session needs to re-establish where the work stands,
derive the recap on the spot from the git history and from `waytide/local/log/`. Do not write
the result to a file.

**Why:** a stored recap is a second copy of facts that git and the decision log already hold,
and it goes stale the moment it is not updated. The two live sources are committed, ordered,
and trustworthy. A derived summary adds drift and adds no information. It is a **projection**,
in the sense the foundation package's vocabulary gives that term. It reads the record without
destroying it, and it is regenerated rather than maintained.

**How to apply:** answer *what have we been doing* by reading `git log` and
`waytide/local/log/`, and summarize in the response. Never persist that summary. Not as a
memory file, not as a `RECAP.md`, and not under `waytide/local/`.

Related:

- the no-repo-auto-memory rule — where durable context does belong
- the foundation package's vocabulary — the projection term
- the foundation package's decision-log-convention — one of the two live sources

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
