# Files in `agent/` subdirectories share one ISO 8601 UTC datetime filename prefix

Every file in a subdirectory of `agent/` — `rules/`, `log/`, `deferred/`, `observations/`, and any others a package contributes (e.g. `loops/`, `plans/`, `design/`) — is named with the **same** prefix convention: an **ISO 8601 datetime normalized to UTC**, followed by a kebab-case slug and `.md`.

**Format:** `YYYY-MM-DDTHH-MM-SSZ-<kebab-slug>.md` — date and time joined by `T`, the trailing `Z` marking UTC, and the time's colons written as hyphens for filesystem safety (e.g. `2026-07-01T20-40-00Z-some-slug.md`).

**Exemption — package-level structural files.** A package's structural files do **not** take the prefix: `README.md` (its introduction), `vocabulary.md` (its glossary, where the package has a cohesive lexicon of interlocking terms), and `install-dependencies.sh` (the script that installs the packages it includes). They are named by what they are — an intro, a glossary, an install script — not dated agent artifacts, and they are the natural repo-root files of each component repo, so a datetime prefix would be noise. A package's individual dated artifacts — its rules and its `log/` entries — always take the prefix.

**Why:** one consistent, UTC-normalized, lexically-sortable prefix across every agent artifact means files sort chronologically regardless of which directory they live in, ordering within a day is preserved, and no timezone ambiguity or drift creeps in between machines or sessions. A date-only prefix (`YYYY-MM-DD-slug`) loses within-day ordering and does not declare its timezone.

**How to apply:** name every new `agent/**` file with the full `YYYY-MM-DDTHH-MM-SSZ-` prefix, in UTC, except a package's structural files (`README.md`, `vocabulary.md`, `install-dependencies.sh`). Files that use a date-only prefix do not yet conform and should be renamed to the full UTC-datetime form in a conformance pass — using the artifact's known creation time where recoverable (e.g. from git), else `T00-00-00Z`.
