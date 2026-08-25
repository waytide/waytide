# Work Session — A preamble forbidden, and an empty directory offered a repository (Fri Aug 7 2026 10:48)

A short work session with three changes, the first two about what happens before a developer has done anything. The first forbids the agent explaining a prompt before showing it. The second gives `install-all.sh` something to do when the directory it is run in is not a repository yet, rather than refusing. Between them it ran the documented install end to end against the published packages and cleared the scratch it had accumulated. **The third was appended after this record was first written** — a line naming the wait at the head of the rule read, which nothing had named.

**This is the communicable record — the guided tour, written to be read.** It is not the source of truth. The durable records are the decision-log entries under 2026-08-07, `a-project-works-in-a-mode-chosen-at-initiation`, `initialization-rule`, and `install-all.sh`.

It is the fifth record in this stretch of work, following `2026-08-06T07-34-11Z`, `2026-08-06T21-19-29Z`, `2026-08-07T00-24-54Z`, and `2026-08-07T02-54-05Z`.

## 1. The preamble that was not covered

The mode rule already said to display the selection prompt at once **rather than reporting the absence and offering to ask**. That forbade one failure. It did not forbid the other, which is what happened: reporting the absence, citing the rule, and *then* showing the prompt in the same response.

**The second failure is subtler and easier to defend to oneself.** Nothing is blocked — the prompt arrives, the developer can answer. What it costs is that they read an explanation of why they are being asked before reaching the question. The rule now states it plainly: a prompt states what it needs, and a preamble in front of it is the agent reasoning where the developer wanted a choice.

**The shape already existed in the system**, which is the part worth carrying forward. The announce-waytide-at-session-start rule requires the response that opens the initialization rule to carry the tool call and nothing else, for the same reason — a line of the agent's narration standing where the thing itself should be. The mode rule now cites it.

## 2. An empty directory

`install-all.sh` refused when run outside a git repository. Waytide is installed with `git subtree`, so a repository is genuinely required — but a developer running the script in a directory they mean to be a project is one `git init` away from what it needs, and that reading is likelier than their having run it somewhere by mistake.

It now offers. The prompt prints the directory first, since the wrong directory is the case the question exists for.

**It offers rather than does, and the reason is recorded in the script.** Creating a repository is not the script's to assume: the directory may sit inside another project or be meant to stay untracked, and an unasked-for `.git` is something a developer then has to notice and undo.

## 3. Whether the default should be yes

The prompt began as `[y/N]`, on the house pattern `install.sh` uses before appending to an `AGENTS.md`. The developer questioned it: the intention is already expressed by the time the prompt appears.

That is right, and there is a stronger reason that had gone unnoticed. **The script already makes an empty initial commit with no prompt at all**, announcing it afterward. Writing a commit into a developer's repository is a larger intrusion than creating a `.git` directory in an empty one, so defaulting the smaller act to *no* while doing the larger one silently is incoherent. The house pattern that suggested `[y/N]` is a different case — appending to a file the developer maintains, where the risk is their own content, and no such content exists here.

The default is now yes, and the case arms were inverted with it so the code matches the label rather than leaving the old logic behind a changed prompt.

**Testing it needed a pseudo-terminal.** Piping an answer makes stdin a pipe rather than a terminal, which takes the non-interactive path and tests neither answer — the first attempt did exactly that and appeared to pass. Driven through a pty, all three answers behave: a bare Return and `y` initialize and proceed, `n` creates nothing and exits 1.

## 4. The install, end to end

The documented two commands were run in an empty directory against the published `master`, and this time the raw CDN was serving the current file rather than a stale one.

All three guards fired in order — not a repository, no commits, not the authoring source — and the install produced seven packages, the three bootstrap files, and **seven `LICENSE` files**, which is the first time a fresh install has carried the license. Both checks behaved correctly in a project seconds old: the mode check reported the absent mode rule as a true state rather than a defect, and the bootstrap comparison reported a match.

The scratch left by two days of installer testing — fifteen directories and six harnesses — was cleared, each confirmed to have no remote first.

## 5. The wait nobody had named

**Appended after this record was first written**, covering the work that followed it in the same stretch.

A third line joined what prints at the head of the rule read, between the license notice and the block: `Loading Waytide will take a few moments.` Everything printed there heads the response that then opens every rule file in every installed package — a wait a developer sits through — and nothing had named it. Of the three things printed there, it is the only one about the moment rather than about the work.

**It repeats the session-start notice's caveat, and that was examined rather than assumed.** Duplication has cost this system twice in three days: the directory list written into both `session-start.sh` and the rule describing it, and the license claim in sixteen files. The difference here is the reader's position. The notice says the same thing **before** the developer types `load waytide`, where it is one of two facts they weigh in deciding to type it. This line is read **after** they have, while the wait is happening. The first informs a decision; the second explains a pause, and removing either leaves that position uncovered.

**Adding a third item broke two paragraphs that described two.** One spoke of a single gap where there are now two; the other said the blank line falls before the block when it now falls before the loading line. Both were corrected in the same edit — the kind of stale sentence that survives because the change that invalidated it looked additive.

## Takeaways

- **A rule that forbids one shape of a failure does not forbid the other.** *Report and offer* was named and prohibited; *report and then ask* was not, and it is the one that survives review, because nothing about it looks like a refusal to act.
- **The stronger argument for a change is often not the one that prompted it.** The default was questioned on expressed intention, which holds; what settles it is that the script already does a more intrusive thing without asking at all.
- **A test that cannot fail is not a test.** Piping an answer to a prompt exercises the branch that runs when there is no prompt.
- **Consistency inside a script is a design constraint.** Two adjacent decisions — prompt for `git init`, do not prompt for a commit — cannot both be right on the same reasoning.
- **Not all duplication is the same defect.** One fact stated twice to one reader is drift waiting to happen; one fact stated to a reader in two different positions is coverage. The test is who is reading and when, not how many copies exist.
- **An addition invalidates the sentences that counted.** Going from two printed items to three broke two paragraphs that had described two, neither of which the addition touched.

## Glossary

No new terms settled. One distinction was sharpened and is now in the mode rule: **announcing and stopping** leaves a project uninitiated until a second instruction arrives, while **announcing and then asking** blocks nothing and still makes a developer read an explanation before reaching the question. Both are forbidden; only the first is obvious.

## Where the durable records live

- **Rules** — `a-project-works-in-a-mode-chosen-at-initiation`, whose mode-prompt section now requires the response to carry the prompt and nothing else, and `initialization-rule`, which gained the loading line.
- **Scripts** — `install-all.sh`, for the repository offer and its default.
- **Decision log** — the entries under 2026-08-07 covering all three changes.

## A closing note

Both changes are about the moment before a developer has done anything — an empty directory, or a project whose mode has never been chosen. Neither was reachable by the checks built over the previous two days, which read files that exist. What is absent has no file to check, and both defects were found by someone walking the path rather than by anything running.

---

Authored by Scott Bellware on Fri Aug 7 2026 at 10:48:24 AM PT
Changed by Scott Bellware on Fri Aug 7 2026 at 11:11:02 AM PT
