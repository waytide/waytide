# Say "convey", not "thread"

When describing an argument value being passed **through layers of methods / APIs**
— e.g. `Constant.get` handing `inherit` down to the instance `#get`, which hands it
to Ruby's `const_get` — say the value is **conveyed** through the layers, not
**"threaded"**. "Thread" is slang in this context.

**Why:** "thread it through" is a metaphor (a thread pulled through a needle /
pipeline) that the reader has to map back to the plain meaning — the value is
passed along, layer to layer. "Convey" states that directly, with no mapping to
learn. Same literal-naming discipline as the other lexicon rules (green →
verified, vendor → install packages, arrange/fixture → control, arm → scenario,
cut → increment).

**How to apply:** in prose, comments, logs, and loop records, write "conveys" /
"conveyed" (or plainly "passes … through") where the impulse is "thread." Related:
the name-literally-not-by-analogy rule and the other de-slang lexicon rules.
