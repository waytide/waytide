# Say "mediates", never "wrap" / "wrapper"

For an object that provides access to another object through itself — an accessor or mediating relationship — say it **mediates** the other. Never "wrap" or "wrapper". An object *mediates* the thing it fronts: *`X` mediates `Y`*.

**Use the bare verb "mediates", not "mediates for".** The canonical form is *`X` mediates `Y`*, not *`X` mediates for `Y`* — drop the trailing "for".

**Why:** "wrap/wrapper" reads as a generic decorator and hides the actual relationship; "mediates" names it exactly — the object stands between a user and the thing it fronts, providing access to it. Literal naming over a figure of speech (this is a case of the no-slang standard).

**How to apply:** don't write "wrap"/"wrapper" for a mediating/accessor object in names, prose, comments, or commit messages — write that it "mediates" the thing it fronts, using the bare verb (no "for"). Related: the no-slang rule and the name-literally-not-by-analogy rule.
