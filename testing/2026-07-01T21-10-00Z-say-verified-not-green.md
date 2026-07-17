# Say "verified", not "green"

Do not describe passing tests as **"green"** — it is slang. Say **"verified"**
instead. The standard report form is **"Verified: N tests"** (e.g. "Verified: 75
tests"). The compound "green-on-arrival" likewise becomes **"verified-on-arrival"**.

**Do not say "The suite is verified at 75."** The word "suite" is technically
correct, but that phrasing is technobabble — it reads as jargon rather than plain
report. Prefer the direct **"Verified: 75 tests."**

**Why:** "green" is an oblique, tooling-flavored metaphor — the color of a passing
CI indicator — that the reader has to map back to the actual meaning: the tests
pass, the behavior is confirmed. "Verified" states that meaning directly, with no
mapping to memorize. This is the same literal-naming discipline as the other
de-slang rules (arm → scenario, cut → increment) and the
name-literally-not-by-analogy rule.

**How to apply:** in prose, commit messages, logs, and loop records, write
"verified" wherever the impulse is "green." Applies going forward; existing
records are not retroactively swept. Related: the name-literally-not-by-analogy
rule and the lexicon rules.
