# Run the test suite after changes, before considering whether to commit

After making any code change, run the full test suite (`ruby test/automated.rb`) and confirm it is green **before** considering whether to commit. The suite run is a precondition of the commit decision, not a step taken after deciding to commit. A red or incomplete suite means there is nothing to weigh — don't reach the question of committing until the suite passes.

**Why:** Committing is the point of no easy return; the suite is the cheapest guard against committing a regression, and running it *before* deliberating commit keeps a failing change from ever becoming a commit candidate. It also keeps the recorded history green at every commit. This is verification, not ceremony (consistent with the human-in-the-loop TDD rule's framing of the test run as confirmation) — the bar gates the *commit*, not the human's attention.

**How to apply:** Edit → `ruby test/automated.rb` → confirm `0 failed, 0 aborted` → only then consider committing. If anything is red or aborted, fix it (or stop) before the commit question arises. For a single-file change you may run the one file first for speed, but run the full suite before commit. Related: the human-in-the-loop TDD rule and the show-the-test-after-implementing rule.
