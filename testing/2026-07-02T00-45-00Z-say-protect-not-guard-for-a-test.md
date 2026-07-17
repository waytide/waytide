# Say "protect", not "guard", for what a test does

Do not use **"guard"** for a test that catches a regression — say the test
**protects** against it (protects the behavior / the delegation / the seam).
"Guard" is overloaded with **guard clause** — the early-return control-flow
construct — a distinct and more common meaning in code, so using "guard" for a
test blurs the two.

**Why:** a reader who sees "guard" reaches first for the guard-clause sense
(`return unless …`). Naming a test's protective role "guard" forces them to
disambiguate from that far more common code construct. "Protect" states the role
directly and unambiguously. ("Guard clause" itself stays — it is the right name
for the code pattern; this rule is only about not reusing "guard" for a test.)

**How to apply:** in prose, comments, logs, and loop records, write that a test
**protects** (e.g. "a test that protects the delegation seam"), never that it
"guards." Keep "guard clause" for the early-return construct. Related: the
name-literally-not-by-analogy rule, the other de-slang rules in `vocabulary`,
and the DBE vocabulary.
