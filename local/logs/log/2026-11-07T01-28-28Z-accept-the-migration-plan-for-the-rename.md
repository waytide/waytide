# Accept the migration plan for the rename? — Accept, selected by the engineer

**Tags:** [decision]

The question, put through the selection interface:

> Accept the migration plan for the rename?
>
> 1. The scripts read slasher/ in place of waytide/. Tests change first.
> 2. The installer and a refresh move an old waytide/ to slasher/ and regenerate AGENTS.md. Tests change first.
> 3. The scripts read ~/.config/slasher/ and ~/.local/share/slasher/.
> 4. The rules, vocabularies, help, READMEs, and script messages say Slasher. Historical records keep Waytide.
> 5. You rename the GitHub organization and the two repositories. Then every URL and this repository's remote name github.com/slasher/.
>
> Two points stay open: whether the machine paths are moved like the project layout, and whether the plugin keeps the name Slasher.

The options:

- **Accept** — The plan stands as written, and the work starts with the scripts' project paths.
- **Revise** — Say what to change. The plan is revised and shown again.

The engineer's answer: **Accept**
