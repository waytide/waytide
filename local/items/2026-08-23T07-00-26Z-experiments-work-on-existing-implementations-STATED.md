# An experiment works on an existing implementation and a feature is a new one — a prediction, not a rule

- **State:** Stated
- **Tags:** [observation]

**As the engineer stated it:** a way to think of experiments and features is that experiments work on existing implementations, and features are new implementations. This isn't a rule, though. It's a prediction.

## What the convention already settles, which this does not touch

**The distinction is the question against the intent.** An `[experiment]` is built to a question and a `[feature]` to an intent, and the implementations-convention says *that one difference accounts for every other*. Everything the two kinds do differently follows from it — the forecast, the verdict, the merge gate, the affirmation, the current-branch option, the drift watch.

**So the prediction is a tell rather than a test.** Where it and the question-against-intent distinction point different ways, the convention governs. What the prediction offers is a way to notice which one you are in before the question is framed.

## What the seventeen records show

**It holds for most of them.** `rules-files-flattening` reorganized rule files that existed. `ooda-terminology` tested words against a method already in use. `ste` and `ete` conformed prose already written. `intuitive-mode` tested a variant on the mode mechanism a feature had built twelve hours earlier. On the other side, `deferred-queue-at-startup`, `versioning-package`, `consuming-project-orchestrator`, and `ooda-mode` each brought something into being.

**Two run the other way, one in each direction.**

- **`diary` is an experiment that created a package that did not exist.** Its question is *Is a diary a good fit for Waytide?* Nothing was there to work on. What existed was Waytide, which is the thing the question was about rather than the thing the work modified.
- **`work-sessions-rename` is a feature whose whole intent was to change something that existed** — *rename `local/sessions/` to `local/work-sessions/`*. Nothing new was implemented.

**The two counter-cases turn on what "works on an existing implementation" means**, and the prediction admits two readings. One is that the **subject** already exists, which `diary` satisfies and `work-sessions-rename` does not. The other is that the **artifact produced** already exists, which `work-sessions-rename` satisfies and `diary` does not. Neither reading takes both.

## What is not settled

- **Which reading the prediction takes**, if either.
- **Whether it is worth stating anywhere.** A tell that is right most of the time and silent about its exceptions can send someone to the wrong kind, and the question-against-intent test costs nothing to apply directly.
- **Whether the exceptions are the interesting part.** `diary` asked whether a new thing belonged in the system at all, which is a question a feature cannot carry. That may be the sharper version of the same intuition.

Related:

- the implementations-convention — the question against the intent, and the tags that carry it
- the implementation-lifecycle rule — the six clauses that differ by kind, each following from that one difference

---

Authored by Scott Bellware on Sun Aug 23 2026 at 12:00:26 AM PT
