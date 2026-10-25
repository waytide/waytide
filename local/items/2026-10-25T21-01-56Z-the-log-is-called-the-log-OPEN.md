# The log is called the log, not the decision log

- **State:** Open
- **Tags:** [work-item]

**The record under `waytide/local/logs/log/` is named "the log" wherever a rule or document names it, and no longer "the decision log".** Its entries record more than decisions. An item recorded, a batch compressed, and a rule suspended each take an entry, and none of them is a decision. The engineer's own decisions are now marked within the log by the `[decision]` tag, so "decision log" names the whole log after one tag in it.

**The directory already carries the plain name.** The logs-directory rule keeps it as `log/`, and bars renaming it to `decisions`.

**The work:**
- rename the term in every live rule, vocabulary, and document that uses it, about 40 files across the packages and this repository
- decide whether the decision-log-convention rule is renamed, and to what, and reconcile the citations of it
- leave historical records as they were written, since a rename does not reach a historical record

## History

As the engineer first stated it: "Work item: It's just a log, rather than a decision log"

---

Authored by Scott Bellware on Sun Oct 25 2026 at 2:01:56 PM PT
