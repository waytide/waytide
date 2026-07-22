# Working-state files in `waytide/` take an ISO 8601 UTC datetime prefix; rule files do not

The **working-state** artifacts under `waytide/` — the decision log (`log/`), `deferred/`, `observations/`, and the work-artifact directories the project contributes (`plans/`, `design/`, `experiments/`, `loops/`) — are named with an **ISO 8601 datetime normalized to UTC**, followed by a kebab-case slug and `.md`. They are dated events, and the prefix orders them chronologically.

**Rule files do not take the prefix.** A rule in `waytide/rules/…` is named by a plain kebab-case slug alone — `subject-first-commit-messages.md`, not `2026-…-subject-first-commit-messages.md`. A rule is a durable convention identified by *what it says*, not by when it was written; a datetime on it is noise and buries the rule's name. (This is the norm established by the rules-files-flattening experiment; before it, rules carried the prefix.)

**Format** (working-state artifacts): `YYYY-MM-DDTHH-MM-SSZ-<kebab-slug>.md` — date and time joined by `T`, the trailing `Z` marking UTC, and the time's colons written as hyphens for filesystem safety (e.g. `2026-07-01T20-40-00Z-some-slug.md`).

**Package files are all unprefixed.** A package (`waytide/rules/<package>/`) carries only unprefixed files: its rule files (kebab slugs), and its structural files — `README.md` (its introduction), `vocabulary.md` (its terminology reference), and `install-dependencies.sh` (its dependency installer). None take a datetime prefix; a package ships no dated working-state artifacts (its development decisions are recorded in Waytide's own `waytide/log/`, not distributed).

**Why:** the working-state artifacts are a chronological record — a log of decisions, a queue of deferrals, dated experiments — so one consistent, UTC-normalized, lexically-sortable prefix orders them regardless of directory, preserves within-day ordering, and avoids timezone drift between machines. Rules are not a chronology; they are the current, durable set of conventions, so each is named for what it says.

**How to apply:** name every new working-state `waytide/` artifact (`log/`, `deferred/`, `observations/`, `plans/`, `design/`, `experiments/`, `loops/`) with the full `YYYY-MM-DDTHH-MM-SSZ-` UTC prefix. Name a rule, and a package's structural files, by a plain kebab-case slug — no prefix.
