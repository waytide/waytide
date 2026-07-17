# Say "normal path", never "happy path"

For the ordinary, non-error course through a method or feature — the case where inputs resolve and nothing raises — use **normal path**. Never "happy path."

**Why:** "Happy path" is imported jargon with an affective metaphor (the path is not *happy*); "normal path" is the literal description — the normal course versus the error/exceptional cases. Consistent with the name-literally-not-by-analogy rule: prefer the plain literal term over a coined metaphor.

**How to apply:** In prose, gate descriptions, test/outcome talk, commit messages, and dialogue, say "normal path" (or just "the normal case"). The error/raising cases are the "error cases" / "exceptional cases", not "sad path" either.
