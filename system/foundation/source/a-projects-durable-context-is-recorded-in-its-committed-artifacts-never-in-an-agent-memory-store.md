# A project's durable context is recorded in its committed artifacts, never in an agent memory store

**Every piece of context meant to survive a session is written into `waytide/`.** The rules bind it, the working directories hold it, and git carries it. An agent memory store is not one of those places, and nothing that belongs in one of them is held in a store instead.

**The artifacts are the ones this package already defines.** A binding convention is a rule in `waytide/local/rules/`. A decision is a one-line entry in `waytide/local/logs/log/`. Thinking that has not stabilized is an observation in `waytide/local/items/`. An item is where the project's planning goes. Postponed work is a deferred item, and what the project stopped doing is suspended. Each has its own convention, and between them they hold what a project knows about itself.

**What this forbids is a store standing in for one of them.** A note about how this project's code is arranged, what was decided last week, or which approach was rejected belongs in an artifact. Holding it anywhere else is holding it where nobody reviews it.

## What it does not reach

**A fact about the engineer rather than the project.** How they want to be answered, and what they want the agent never to offer, are not project context. They hold across every project on the machine, and the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule already sends a machine-scoped fact to per-machine configuration under `~/.config/`, outside any repository.

**A preference that has not yet been settled as a rule.** That is the record-a-preference-at-once-and-ask-about-it-at-the-tasks-end rule's concern, and it is what keeps this one from costing anything. Its words are written at once as an observation, so nothing has to be held while the question of what becomes of it waits.

**The harness's own working state.** A cache, a transcript, an index of the repository. None of it is the project's context and none of it is a substitute for an artifact.

**Why:** the premise of the whole system is in the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory. The conventions are committed alongside the code and **read fresh each session rather than recalled**. A memory store is recall. It is unreviewed, undiffable, and invisible to everyone but the agent that wrote it.

It drifts, and its drift is silent. A note written in June contradicts a rule written in August, and nothing detects it. That is the same failure the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule names about a hand-kept list, arriving through a different mechanism.

The cost of forbidding it is real and is bounded to one case. That is the preference not yet worth a rule, and the rule named above is what answers it. Without that rule this one would trade a silent store for a silent loss, which is not an improvement.

**How to apply:** write durable project context into the artifact whose convention covers it. A rule, a log entry, an observation, an item, or a suspended thing. Do not hold it in an agent memory store, and do not create one.

Where a fact is about the engineer rather than the project, it is outside this rule. Where a preference is not yet a rule, write it at once as an observation rather than holding it.

## Compressed

1. Write every piece of context meant to survive a session into `waytide/`.
2. The rules bind that context, the working directories hold it, and git carries it.
3. An agent memory store is not one of those places.
4. Do not hold in a store anything that belongs in one of those places.
5. A binding convention is a rule in `waytide/local/rules/`.
6. A decision is a one-line entry in `waytide/local/logs/log/`.
7. Thinking that has not stabilized is an observation in `waytide/local/items/`.
8. The project's planning goes in an item.
9. Postponed work is a deferred item.
10. What the project stopped doing is suspended.
11. Each artifact follows its own convention.
12. A note on how the project's code is arranged belongs in an artifact. So does what was decided last week, or which approach was rejected.
13. Do not create an agent memory store.

## What it does not reach

1. A fact about the engineer rather than the project is outside this rule.
2. How the engineer wants to be answered, and what they want never offered, are such facts.
3. A machine-scoped fact goes to per-machine configuration under `~/.config/`, outside any repository, per the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule.
4. A preference not yet settled as a rule is outside this rule.
5. Ask about such a preference at once, per the record-a-preference-at-once-and-ask-about-it-at-the-tasks-end rule, rather than holding it.
6. The harness's own working state is outside this rule. That is a cache, a transcript, or an index of the repository.
7. Harness working state is not project context and is no substitute for an artifact.
8. **Why:** conventions are committed with the code and read fresh each session, not recalled. A memory store is recall: unreviewed, undiffable, invisible to all but its writer, and it drifts silently.

## History

Until Sun Oct 25 2026 this rule was named project-context-lives-in-the-committed-artifacts and titled "A project's durable context lives in its committed artifacts, never in an agent memory store".

Until Mon Oct 26 2026 this rule was named a-projects-durable-context-lives-in-its-committed-artifacts and titled "A project's durable context lives in its committed artifacts".

Until Tue Oct 27 2026 this rule said a preference not yet a rule was asked about at once. The record-a-preference-at-once-and-ask-about-it-at-the-tasks-end rule now has its words written at once as an observation.

Related:

- the record-a-preference-at-once-and-ask-about-it-at-the-tasks-end rule — what makes forbidding the store safe
- the a-projects-binding-rules-are-recorded-in-its-packages-and-its-local-rules-directory — the read-fresh premise, and where a binding convention goes
- the the-log-holds-one-file-per-entry-with-a-one-line-title — where a decision goes
- the an-observation-is-a-working-hypothesis-whose-one-state-stated-never-changes — where thinking goes before it binds
- the a-project-does-not-name-its-downstream-consumers-in-its-own-files rule — the machine-scoped fact, and where it goes instead

---

Authored by Scott Bellware on Fri Aug 14 2026 at 9:55:45 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 10:44:17 AM PT
Changed by Scott Bellware on Fri Aug 14 2026 at 11:32:29 AM PT
Changed by Scott Bellware on Mon Aug 17 2026 at 11:16:30 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 25 2026 at 10:52:18 AM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:13:00 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:34 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:21:39 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:30 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:22:54 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 4:23:15 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 2:38:01 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 3:22:08 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:17:07 PM PT
Changed by Scott Bellware on Mon Oct 26 2026 at 6:45:53 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:33:49 PM PT
Changed by Scott Bellware on Tue Oct 27 2026 at 1:34:10 PM PT
