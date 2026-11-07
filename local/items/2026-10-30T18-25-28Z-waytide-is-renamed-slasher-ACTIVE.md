# Waytide is renamed Slasher

- **State:** Active
- **Tags:** [idea]

**The system now called Waytide takes the name Slasher.**

**Not yet settled:**

- what the name reaches: the repositories, the packages' paths, the `waytide/` directory in a consuming project, `~/.config/waytide/`, the skills namespace, and the prose
- whether the change is planned as a migration, which the migration rule makes a renamed norm across repositories

**It supersedes `2026-10-30T06-12-44Z-waytide-is-renamed-slasher`**, a duplicate of the same idea.

## Settled

- **2026-11-03** — The product's main domain is `slasher.bot`.
- **2026-11-03** — `slasher.sh` serves the installer, as in `curl -fsSL slasher.sh | sh`. Every other path on it redirects permanently to `slasher.bot`.
- **2026-11-06** — The rename reaches the prose, the project paths such as `waytide/system/` and `waytide/local/`, the machine configuration under `~/.config/waytide/` and `~/.local/share/waytide/`, and the GitHub organization and repositories.
- **2026-11-06** — Where a consuming project still has `waytide/` and no `slasher/`, the installer or a refresh moves `waytide/` to `slasher/` and regenerates its `AGENTS.md`. The scripts read only `slasher/`.
- **2026-11-06** — The GitHub organization `waytide` is renamed `slasher`, the composite repository `slasher/slasher`, and `waytide-ruby` `slasher-ruby`. The package repositories keep their names, as `slasher/foundation`.
- **2026-11-06** — The GitHub name `slasher` is taken, so the organization is renamed `slasher-bot`, not `slasher`. The composite repository is `slasher-bot/slasher`, `waytide-ruby` becomes `slasher-bot/slasher-ruby`, and the package repositories read as `slasher-bot/foundation`.
- **2026-11-06** — Where a machine has `~/.config/waytide/` or `~/.local/share/waytide/` and not the `slasher` folder beside it, the installer moves it to the new name, as it moves a project's `waytide/`.
- **2026-11-06** — Every script and rule that reads the machine folders honors `XDG_CONFIG_HOME` and `XDG_DATA_HOME`, falling back to `~/.config` and `~/.local/share` where they are not set.
- **2026-11-06** — The resolution above that the machine folders honor `XDG_CONFIG_HOME` and `XDG_DATA_HOME` is reversed. The installer and every reader use `~/.config` and `~/.local/share` only. The writer-name rule, which read `$XDG_CONFIG_HOME/waytide/user` before this feature, drops that clause in the prose increment.

## History

As the engineer first stated it: "Idea for master: Rename Waytide to Slasher"

On 2026-11-03, of `slasher.tools` and `slasher.bot`: "Slasher.bot has a cool factor that attracts geeks". Then: "Or I could register slasher.sh, and route it to slasher bot". Then: "Yes, the sh domain should be the installer"

On 2026-11-06, asked whether the organization takes a dash or one word, as in "slasherbot", the engineer selected `slasher-bot`.

On 2026-11-06, asked what would trigger the move of the machine folders, among the installer, the scripts that read them, and the session-start hook: "Yes, the installer"

On 2026-11-06, asked whether it was too late to change their mind about the XDG variables: "I don't want to support the XDG variables". Asked what happens to the writer-name rule's XDG clause: drop it.

---

Authored by Scott Bellware on Fri Oct 30 2026 at 11:25:28 AM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 11:49:57 AM PT
Changed by Scott Bellware on Tue Nov 3 2026 at 12:09:14 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:05:34 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 1:43:30 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 2:14:35 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 5:25:36 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 5:32:41 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:12:58 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:19:54 PM PT
Changed by Scott Bellware on Fri Nov 6 2026 at 8:35:40 PM PT
