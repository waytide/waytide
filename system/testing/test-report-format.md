# "Test report" classifies the suite and prints the two-level context hierarchy

When the user asks for a **test report**, classify the automated suite along the lenses below, then print the context hierarchy two levels deep. **Re-derive everything from the current files** — read the tests and recompute membership and counts. Do not report stale buckets from memory. The lenses are the frame. The specific buckets are whatever the current suite yields.

Produce these sections, in order:

1. **Generations / styles** — the suite may have **coexisting conventions**, an older style alongside a newer one. Split the files by which they follow, and name the cleanest mechanical tell. One such tell is actuation placement, captured in the controls against performed inside the test block. If the suite is uniform, say so and skip.

2. **By subject under test** — group by the unit each test targets. Give the file count per group.

3. **By structural style**:
   - single-outcome leaf — one capability, one assertion
   - multi-outcome with fan-out — a loop generating one sub-context per case
   - multi-outcome flat — sibling outcomes, no loop

4. **By assertion kind** — affirmative `assert`, refutation `refute`, error-raising `assert_raises`. Note the error classes in play.

5. **Other factors** — topology pairs (e.g. top-level vs nested for the same method), normal-path vs error outcomes, and controls usage.

6. **Context hierarchy, two levels deep** — each distinct top-level context with its distinct second-level contexts nested beneath, rendered as an indented tree (`├─`/`└─`). See the status-report rule (in `foundation`) for the rendering. Stop at two levels.

**This section, like the others, is read from the test files, not from a suite run.** The hierarchy is the `context "…"` declarations as written. A dynamic `context <expr> do` shows as its expression, and a bare unnamed `test do` adds no context line. A report on what a run produced is the test-tree command's, not this one's.

Keep each section tight.

**Why:** a suite has a discoverable structure worth surfacing on demand. Fixing the report's shape makes it repeatable and steers reading to the test files rather than recollection.

**How to apply:** on a test-report request, read the automated suite and render every section from the current files, the hierarchy included. Confirm membership by reading the files (actuation placement, assertion kind, loop fan-out) rather than asserting it. Do not run the suite for this report.

Companion to the `lib-report` command in `ext/ruby-lang`, and to the `test-tree` command. That one produces the tree of a run at full depth, and states why it comes from a run. Neither report is written to a file.
