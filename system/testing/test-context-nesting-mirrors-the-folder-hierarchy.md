# Test context nesting mirrors the folder hierarchy

- **Solubility:** 87
- **Original rank:** 102 of 106
- **Unclarity:** 0.16

A test file's context nesting mirrors the hierarchy of its folder path. Each directory segment under `test/automated/` becomes a context, mirroring the test organization's hierarchy. The scenario contexts nest inside those, and the test blocks inside those.

A test at `test/automated/upload/rejected/empty.rb` opens `context "Upload"` → `context "Rejected"` → the outcome context — mirroring `upload/rejected/`. A test at `test/automated/upload/retried.rb` does the same: `"Upload"` → `"Retried"`.

Do **not** flatten the hierarchy into a single combined context (e.g. `"Upload Rejected"`). The leaf files within a feature folder (e.g. `rejected/empty.rb`, `rejected/refused.rb`) represent distinct cases of the same feature. They share the folder-mirrored context nesting and are distinguished by their outcome-context titles, not by an extra per-file context layer.

**Why:** the test output and the file tree then read as the same structure. Each outcome is situated under the segments of its path, and under the scenario it establishes. It also keeps the suite consistent with the existing `upload/` tests.

**How to apply:** nest the file's contexts in this order:

- one `context` per folder segment, mirroring the test organization's hierarchy
- the contexts that pertain to the scenario
- the test blocks, each with an optional context scoping a local variable or a comment

## Compression

- Solubility 95, clarity 1.00 (2026-10-24)
- Compression 0.07, change 0.52 (2026-10-24)
- 9 directives, 9 kept, 0 less precise, 0 lost (2026-10-24)

Related:

- the test-structure rule
- the test-name "Is" rule
- the `control_` test-variable prefix rule
- the a-high-level-context-names-a-behavior-never-a-method rule — what the contexts the folders produce are named for
