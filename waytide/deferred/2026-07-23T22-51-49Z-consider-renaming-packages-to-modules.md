# Consider renaming "packages" to "modules"

Waytide's units of distribution are called **packages** — `framework/foundation/`, `framework/language/`, `framework/code/ruby/`, and the rest — each identified by carrying a `README.md`, each published to its own repository and installed by `git subtree`. Whether **module** is the more accurate term for what these actually are is an open question worth settling deliberately rather than in passing.

What has to be weighed:

- **"Package" already names an installable unit of distribution**, which is exactly how these are published and installed. That is a point in its favor, not merely inherited convention.
- **"Module" collides with strong prior meanings** — Ruby's `module`, and the module systems of JavaScript and Python. The name-literally-not-by-analogy rule weighs against a term the reader has to disambiguate from an established one, particularly in a framework whose `code/ruby` package discusses Ruby modules directly.
- **The term is load-bearing across a wide surface.** Every package `README.md`; both notice scripts (`session-start.sh` and `statusline.sh` count package directories and print the word in the notice and the status line); the notice text a developer sees at every session start; the `announce-waytide-at-session-start`, `status-report-format`, and `agent-rules-convention` rules; the `AGENTS.md` bootstrap that `install.sh` generates; `install-all.sh`; and each package's `vocabulary.md`. A partial rename would leave the two terms coexisting, which is worse than either alone.

Two places deserve particular attention if the rename happens, because there the term is not prose but behavior a reader sees: the **detection rule** — a directory carrying a `README.md` is a package — and the **printed notice wording**, which names the count on every session start.

**Gated on:** nothing currently in flight blocks it, but it is a wide terminology change touching every package README, both notice scripts, the printed notice, the install scripts, and the foundation rules that name the term — so it is not started mid-task, and the terminology decision is settled before any file is renamed.

**Why:** the terminology is the conveyable output of this work, and a word choice is a design decision. If "package" is the wrong word, every document and both notice surfaces carry the error, and the cost of correcting it grows with each new package published. If it is the right word, that should be settled and recorded rather than left standing as an unexamined default.

**How to apply:** settle the term first — decide between "package" and "module" against the name-literally-not-by-analogy test, and record the decision in `waytide/log/`. Only then conform the surface in one pass: the package READMEs, `session-start.sh`, `statusline.sh`, the notice text, `install.sh` and `install-all.sh`, the foundation rules that name the term, and the vocabulary files. Delete this file when it is carried out, and log that it was done. Related: the `language` package's language-is-precise-here and name-literally-not-by-analogy rules, foundation's agent-rules-convention and announce-waytide-at-session-start rules, and the decision-log convention.

---

Authored by Scott Bellware on Thu Jul 23 2026 at 3 PM PT
