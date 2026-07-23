# Announce Waytide, and the packages present, at session start

After reading the rules at the start of a session, print a one-line notice that Waytide is loaded and which packages are present. The notice is a load signal for the developer — a cheap, visible sign that the framework was picked up and which packages the project actually installed.

The notice reads, for example:

```
Waytide loaded from waytide/framework/ — 5 packages: foundation, language, testing, design-by-efferent, git
```

- **Enumerate what is actually on disk.** List the package directories present under `waytide/framework/` (or `framework/` in the authoring source), named and counted. Do not print a fixed list — read the directory and report what is there, so the notice reflects the real install rather than a claim.
- **One line, before the first response.** Print it once, after the rules are read and **before responding to the session's first prompt** — before the reply itself, not merely before the work the prompt asks for. The session's first prompt arrives together with the bootstrap, and answering it first is the failure this rule exists to catch: reading the rules and printing the notice is the session's opening act, not preamble to be deferred until the prompt has been dealt with. Whatever the first prompt asks for, the notice precedes the answer.
- **The notice is a self-report, not proof.** It confirms the framework was read far enough to reach this instruction and that the package directories exist; it does not prove every rule was internalized. That verification comes from the work honoring the rules, not from the line. Enumerating the real directories keeps the notice grounded rather than a bare assertion.

**Opt-out:** skip the notice when the `WAYTIDE_QUIET` environment variable is set to any non-empty value. A developer sets it however they like — shell profile, `direnv`, or a personal `.claude/settings.json` `env` block. The opt-out lives in the developer's own environment, never in committed project content, so silencing the notice is a personal preference and the default-on behavior travels with the repository to every developer who checks it out.

**Why:** a framework that loads by being read at session start has one quiet failure mode — the developer has no visible sign it was picked up, or which packages this project installed. A one-line notice makes the load legible on every developer's machine, carried by the committed root `AGENTS.md` bootstrap rather than by any harness-specific configuration, so it does not depend on `.claude/` content that a project may gitignore. Enumerating the packages present makes the notice do a small amount of real work — the directory must be read to report it — instead of asserting a load it cannot prove. The ordering is stated explicitly because it is where the rule fails in practice: the session's first prompt arrives with the bootstrap and pulls hard for an immediate answer, so an instruction that only says "at session start" reads as deferrable and the notice is dropped. Fixing the notice's place relative to the first response leaves nothing to defer.

**How to apply:** at session start, before answering the first prompt, read the rules, then read the package directories under `waytide/framework/` and print a one-line `Waytide loaded from … — N packages: …` notice, unless `WAYTIDE_QUIET` is set. Only then respond to what was asked. If a session has reached its first response without the notice, print it as soon as the omission is noticed, having read the rules first. Related: the agent-rules-convention (the rule format and where the bootstrap lives), the foundation `install.sh` bootstrap that carries this instruction into a consuming project's root `AGENTS.md`, and the status-report-format rule (another convention for how the agent reports to the developer).

---

Authored by Scott Bellware on Wed Jul 22 2026 at 10 PM PT
Changed by Scott Bellware on Thu Jul 23 2026 at 2 PM PT
