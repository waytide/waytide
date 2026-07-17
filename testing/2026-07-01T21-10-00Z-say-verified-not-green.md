# Say "verified", not "green"

Do not describe passing tests as **"green"** — it is slang. Say **"verified"**
instead. The standard report form is **"Verified: N tests"** (e.g. "Verified: 75
tests").

**The rule governs the *report*, not the red/green cycle.** Where "green" names a
state in the cycle rather than a claim that the behavior is confirmed, it stands:
**green-on-arrival** (a test that arrives already passing, so no red drives it, so
it designs nothing) and the **red/green loop** keep their names. The red/green
frame is what makes those names mean anything, and "verified-on-arrival" would
say less, not more.

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
"verified" wherever the impulse is "green" — as a report that tests pass. Applies
going forward; existing records are not retroactively swept. Related: the
name-literally-not-by-analogy rule and the other de-slang rules in `vocabulary`,
and the DBE vocabulary.
