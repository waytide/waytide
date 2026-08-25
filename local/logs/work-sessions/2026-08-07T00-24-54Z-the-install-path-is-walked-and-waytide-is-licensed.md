# Work Session — The install path is walked, and Waytide is licensed (Thu Aug 6 2026 17:24)

The work session began with a doubt about whether one script was self-executable. It became a walk down the install path a new project actually takes, which produced four defects in a row — none of them in the packages, all of them in how the system is obtained and started. It ended somewhere unrelated to where it started: Waytide carrying a copyright notice and a named license across all eight repositories, printed at the head of every rule read, and propagated through all three hops to every consuming project.

**This is the communicable record — the guided tour, written to be read.** It is not the source of truth. The durable records are the decision-log entries written this evening, the self-executable local rule, the `initialization-rule`, the eight `LICENSE` files, and the mode rule.

It is the third record of 2026-08-06. `2026-08-06T07-34-11Z` covers the morning and `2026-08-06T21-19-29Z` the afternoon, ending at the first publish of `foundation`.

## 1. A script that looked broken, and was not

The claim was that `install-all.sh` is not self-executable. It is: mode `100755` in git, `-rwxr-xr-x` on disk, `#!/bin/sh` at the top, like all thirteen scripts here. What produced the impression was **my own invocation** — I had run it as `sh <absolute path>` when building a test project, which is exactly what the self-executable rule forbids, and had done the same when testing another script minutes earlier. The file was never the problem.

Checking the rule against the tree turned up something else: the rule asserts that **every** script here opens with a `./name.sh` usage line, and nine of the thirteen do not.

## 2. The install procedure that did not work

Then the acquisition method was named — `curl -O` into the consuming project's root — and it settled the question and corrected me twice. The invocation I had called impossible was the right shape, since the file is fetched *into* the root it runs from. And the real defect appeared:

**`curl` carries content and not file metadata.** The executable bit is a filesystem attribute and is not in an HTTP response body, so the fetched copy is `644` whatever the committed mode. The README's two-line install therefore failed on its second line, and had been publishing a broken procedure.

**The same fact had been found once already**, on 2026-07-28, and recorded: a subtree-delivered script is invoked directly, and `install.sh` keeps its `sh` prefix *because it is fetched with curl, which does not preserve the mode*. That finding was never carried to `install-all.sh`, and the self-executable rule — written a week later — forbade the `sh` prefix without carrying the exception.

The README and the script's own header now both read `sh install-all.sh`, each stating why. The rule gained the exception, and the developer was explicit about its shape: **the bit stays set on every script without exception**, and what varies is the usage line, which follows the delivery.

## 3. Two guards, both for failures nobody had hit

Testing the corrected procedure in a genuinely fresh repository failed again, differently:

```
fatal: ambiguous argument 'HEAD': unknown revision or path not in the working tree.
fatal: working tree has modifications.  Cannot add.
```

**Both lines came from one cause, and the second is false.** `git subtree add` resolves `HEAD` to test whether the working tree is clean. In a repository initialized and never committed to, `HEAD` does not exist, the check errors, and git subtree reads the error as a dirty tree — reporting modifications that are not there and sending a developer looking for changes they have not made.

A project created moments ago is the likeliest project to be installing Waytide into. The script now makes the empty initial commit itself and says so.

**A second guard came out of the same reading.** `install-all.sh` had nothing stopping it from running in the Waytide authoring source, where its first action would create a `waytide/system/` tree *inside* the repository that authors the packages — a second installed copy beside the ones being written. `refresh-packages.sh` and `report-unrecognized-mode.sh` both refuse there; this one did not. It does now.

Neither of these had been hit before because nobody had run the documented procedure end to end.

## 4. The new-project experience, and the question it exposed

A test project was built at `~/projects/waytide-test` to see what a developer meets: the session-start notice naming seven packages, the status line, `report-unrecognized-mode.sh` correctly reporting an absent mode rule as *the mode question has not been asked here* rather than as a defect, and then the mode selection — which no script can perform, because the selection interface is agent-side and the installer is a POSIX shell script.

OODA mode was chosen, its rule written from the template, and the project removed afterward.

**What it exposed came later**, from a correction: offering to ask the mode question is wrong. An absent mode rule *is* the occasion to ask, and announcing it leaves the project uninitiated until a second instruction arrives. The rule said *ask* and did not say *without first offering to*, which is the gap that permitted it. It says so now, citing `never-ask-to-start-test-first`, which applies the same reasoning to its own settled default.

The same correction retired *put it to you* in favour of **ask**.

## 5. A copyright notice, then a license

A copyright notice was added to what prints at the head of the rule read, and its placement was settled by trial: first beneath the figure, then above it, then with a wider gap.

Then the license. A requirements sheet from 2026-07-19 already specified the **Eventide Common Interest License** in plain language, and the work of writing it had left this queue on 2026-08-03 to a project under Eventide. What remained was Waytide's: where the file goes.

**The mechanical finding that shaped it:** a file at the composite root reaches no component repository, because `git subtree split` carries only what sits under the package prefix. So "the root of the composite and the root of each component" is **eight copies** — one here, and one inside each package directory, which is also what carries the license into every consuming project. That is what the requirements sheet asks for when it says to keep the license with the files.

**A contradiction was created deliberately and then resolved.** The printed line was chosen to name the license as in force while the `LICENSE` files said the work was not yet licensed. I flagged it; the decision was to make the files match the line. All sixteen — eight licenses and eight READMEs — now say Waytide is licensed under the Eventide Common Interest License, source-available and free to use, with the text forthcoming.

## 6. The gap that could not be seen

The separation between the notice and the figure was specified as two blank lines, then three. The developer then reported seeing one.

**The count was unobservable.** The agent's output is rendered as markdown, and markdown collapses any run of blank lines between blocks into a single paragraph break. Three were emitted; one survived. A rule specifying a count that renders identically to any other count is a rule nothing can comply with or violate.

The rule now specifies one blank line and records why a wider gap is not available, naming both ways it could have been forced — the notice inside the figure's fence, or invisible separator characters — and why neither is worth its cost.

## 7. A mode is committed

The last change: choosing a mode now requires committing the mode rule and writing a decision-log entry. Both obligations already existed — `rules-convention` requires a log entry for every new local rule, `decision-log-convention` requires log entries committed with their change — but neither is stated in the rule an agent reads at the moment a mode is chosen. **A rule that says only *write the file* is followed exactly that far.**

## 8. Propagation

All seven packages were published, each guarded for fast-forward before its push, and all four consuming projects refreshed and pushed. This was the first refresh in which every package moved, and the first in which the license reached a project that installs Waytide.

## Takeaways

- **Four defects sat in the install path and none in the packages.** The rules had been published, refreshed, and checked for weeks while the procedure for obtaining the system did not work. The part nobody re-runs is the part nobody tests.
- **A fact found once does not stay found.** That `curl` strips the executable bit was recorded on 2026-07-28 and applied to one script; the second script and the rule written afterward both missed it. Recording a finding is not the same as carrying it.
- **The complaint was wrong and the instinct behind it was right.** The script was self-executable; the procedure was broken. Taking the literal claim at face value would have closed the question after one `git ls-files -s`.
- **A specification that cannot be observed is not a specification.** Three blank lines and one render identically, so the rule asked for something no reader could check.
- **A rule is followed exactly as far as it is written.** Twice today an obligation existed elsewhere in the system and was not honored because it was absent from the rule actually read at the moment of the act.

## Glossary

- **the authoring-source guard** — a refusal at the head of a script that detects it is running in the Waytide authoring source rather than in a project that installed Waytide, and stops. `refresh-packages.sh`, `report-unrecognized-mode.sh`, and now `install-all.sh` carry one.
- **delivery** — how a script reaches the machine that runs it: `git clone`, `git subtree`, or `curl`. The first two carry the file's mode; the third cannot. The self-executable rule's usage line follows the delivery, while the committed bit does not vary.

## Where the durable records live

- **Scripts** — `install-all.sh` (the `sh` prefix, the authoring-source guard, the initial commit), and `system/foundation/install.sh` (the `bootstrap` subcommand).
- **Rules** — the self-executable local rule (the `curl` exception), `initialization-rule` (the copyright and license lines, and the single blank line with its reason), and `a-project-works-in-a-mode-chosen-at-initiation` (the prompt displayed at once, *ask* over *put*, and the commit with its log entry).
- **License** — `LICENSE` at this repository's root and in each of the seven package directories, and the license section of all eight READMEs.
- **Decision log** — the entries under 2026-08-06 evening and 2026-08-07, covering each of the above.

## A closing note

The work session started from a claim that was false and ended having fixed four things, none of which were the claim. The doubt was worth more than its accuracy: it pointed at the install path, which is the one part of this system that a developer meets before any rule is read and that nobody had walked since the parts of it were written separately.

---

Authored by Scott Bellware on Thu Aug 6 2026 at 5:24:54 PM PT
