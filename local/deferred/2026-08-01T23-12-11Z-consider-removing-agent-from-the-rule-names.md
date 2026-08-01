# Consider removing "agent" from the rule names

Nine `foundation` rules carry an `agent-` prefix: `agent-deferred-convention`,
`agent-design-convention`, `agent-experiments-convention`, `agent-features-convention`,
`agent-file-names-use-iso8601-utc-prefix`, `agent-observations-convention`,
`agent-plans-convention`, `agent-rules-convention`, `agent-work-sessions-convention`. They are
the only rules in the system with it; no other package uses the prefix at all.

**The question is whether the word carries anything.** A rule's name states what the rule
says, and each of these names is already complete without it — `deferred-convention` names the
deferred convention, `plans-convention` names the plans convention. "Agent" appears to be a
holdover from when the system was framed as a set of instructions *to an agent*, rather than
as a project's conventions that an agent and a developer both work under. The artifacts these
rules govern are the **project's**, not the agent's: the log, the deferred queue, the plans,
the design docs and session records are written by both parties and read by both.

**What the prefix may still be doing, and this has to be checked rather than assumed:**

- **Grouping.** The nine sort together in a directory listing, and they are in fact a related
  set — the artifact-directory conventions. Removing the prefix scatters them alphabetically
  through `foundation/`. Whether that grouping is worth a word in every name is the trade.
- **Disambiguation.** `rules-convention` sits beside `rules-install-a-mindset-purpose-over-category`;
  `file-names-use-iso8601-utc-prefix` has no collision. Check each name for a collision before
  assuming there is none.

**The cost is not the rename.** It is the references. Each name is cited across the system and
the project's own records — `agent-rules-convention` in 13 files, `agent-features-convention`
in 9, `agent-deferred-convention` and `agent-experiments-convention` in 8 each, and so on. The
`a-citation-is-not-a-dependency` and reference-by-name conventions mean those citations are by
**name**, so every one of them breaks on a rename, in exactly the way the stranded-reference
work just addressed. The live artifacts are corrected; the historical records are left alone
and will carry the old names permanently, which is correct and should be expected rather than
treated as damage.

**Gated on:** nothing in flight. It is a naming question, and settling whether the prefix earns
its keep comes before any file is moved.

**Why:** the naming rules hold that a name states what the thing is, literally, with nothing
that does not carry meaning — and `name-literally-not-by-analogy` judges a name by whether the
reader needs anything explained to them. "Agent" in these names describes who was imagined
reading the rule rather than what the rule governs, which is the kind of word those rules
retire elsewhere. If it is doing no work, nine rules are carrying a word that costs a reader
attention on every encounter and misdescribes whose artifacts these are.

**How to apply:** decide first whether the prefix carries meaning — checking the grouping and
collision questions above — and only then rename. If renaming, correct the citations in the
live artifacts, leave the historical records as written, and log the decision. A rename of
`foundation` rules requires republishing the package. Delete this file when it is carried out,
and log that it was done. Related: the `language` package's name-literally-not-by-analogy and
communicate-plainly-name-the-thing rules (the naming standard this is measured against), the
agent-rules-convention (the rule format, and the instruction to reference a rule by name rather
than by path), the agent-deferred-convention (the reconciliation a rename would require), and
the agent-file-names-use-iso8601-utc-prefix rule (which settles that a system rule is named by
what it says, with no prefix of any other kind).

---

Authored by Scott Bellware on Sat Aug 1 2026 at 4:12:11 PM PT
