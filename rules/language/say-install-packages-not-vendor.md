# Say "install packages", not "vendor"

Do not use **"vendor"** (or "re-vendor", "vendored") for installing a project's
gem/package dependencies — it is slang. It is just a **simple installation of
packages**: say "install the packages," "re-install the bundle," "the installed
packages / the installed bundle."

**Why:** "vendor" is jargon borrowed from a particular tooling convention (the
`vendor/` directory idiom); the reader has to map it back to the plain meaning —
the packages are installed. "Install the packages" states it directly. Same
literal-naming discipline as the other de-slang rules (green → verified, arm →
scenario, cut → increment).

**How to apply:** in prose, commit messages, logs, and loop records, write
"install(ed) packages" / "the installed bundle" wherever the impulse is "vendor".
Related: the say-verified-not-green rule and the name-literally-not-by-analogy
rule.
