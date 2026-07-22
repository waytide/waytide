# Word Substitutions

These are the project's fixed word substitutions — each replaces a slang, imported-jargon, or figurative word with the literal one. They are instances of two principles: name literally, not by analogy, and no slang. When the impulse is a word in the left column, write the right.

| Don't say | Say | What it names |
|---|---|---|
| "happy path" | **normal path** | the ordinary, non-error course through a method or feature; the raising cases are "error cases" / "exceptional cases", never "sad path" |
| "sweep" | **conform** (or *reconcile* / *propagate* where more exact) | bringing code or prose into line with a convention |
| "thread" | **convey** (or plainly "pass … through") | a value passed through layers of methods / APIs |
| "cut" | **increment** | a bounded slice of scope delivered as a step |
| "vendor" | **install packages** / "the installed bundle" | a plain installation of gem/package dependencies |
| "arm" | **scenario** | one variant or case a method or feature handles |
| "does that land?" | a direct question — **"is that right?"**, "does that work?" | a plain question, not dressed up |
| "what it costs" | **impact** | the effect or consequences of a change, named neutrally rather than presumed a cost |
| "wrap" / "wrapper" | **mediates** | an object that provides access to another through itself — see below |
| "dead" | **obsolete** (or a more exact word) | something no longer in force or in use — see below |
| "initialized with" / "passed to" | **sent to** | a value passed into a method or initializer — see below |

### Finer distinctions

- **mediates.** The canonical form is the bare verb — *`X` mediates `Y`*, not *`X` mediates for `Y`*. "wrap"/"wrapper" reads as a generic decorator and hides the relationship; "mediates" names it exactly — the object stands between a user and the thing it fronts, providing access to it.
- **obsolete** is the fallback, not the goal — reach for the exact word when there is one: a reference whose target moved is **unresolvable**; a rule no longer in force is **retired** or **superseded**; a branch that can only go one way **has nothing to decide**; an assignment that never happens **never fires**. "dead" over-dramatizes — nothing died, and the drama distorts judgment, making routine tidying read as urgent repair.
- **sent to** frames a call as sending a message with arguments — an argument is *sent to* the method that receives it. "initialized with" and "passed to" are looser, more mechanism-flavored phrasings for the same thing.

**Why:** each entry trades a metaphor, an imported convention, or an over-dramatized figure for the plain term the reader needs no mapping to decode. They share one rationale, so they are one concept: a lexicon. Gathering them as a single legible table — rather than a file apiece — makes the whole set scannable and keeps the project's vocabulary decisions in one place.

**How to apply:** when the impulse is a left-column word — in names, prose, comments, commit messages, logs, loop records, and dialogue — write the right-column term. When a new substitution is settled, add a row here rather than a new file.

Related: the name-literally-not-by-analogy rule and the no-slang rule (the two principles these instance). The test-domain and commit-domain substitutions stay in their own packages — `say-verified-not-green`, `say-protect-not-guard`, `controls-not-factories` in `testing`, and `commit-says-task-is-done` in `git`.
