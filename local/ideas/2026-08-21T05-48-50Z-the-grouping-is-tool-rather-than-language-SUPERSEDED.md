# The grouping is `tool/`, not a language

- **State:** Superseded
- **Tags:** [design]

**Why this state:** the axis is proposed and the extent is not settled. What `tool` covers, whether the existing `code/` directory is renamed to it, and what becomes of the published `code-ruby` repository are each open. It is promoted to `Active` once those are decided.

**2026-08-23 — superseded by *The grouping is `ext/`, for external and extension both*.** The engineer settled `ext/`. What this idea left open was the extent — what counts as a tool — and the later idea answers it by naming the grouping for what it admits rather than for what its members are. The wording above is what was thought on 2026-08-20 and is not rewritten.

## Premise

**As the engineer stated it:** it should be `tool/ruby`, not `language/ruby`.

**The path today is `code/ruby`.** There is no `language/ruby`. `code/` is a grouping directory and not a package, and `language` is a separate package governing how prose is written. So the proposal reads as **`code/` → `tool/`**, and the axis it names is **tool** rather than **language**.

## What the axis change claims

**Ruby is a tool, and the thing grouped is not a language.** `code/ruby` holds prescriptive Ruby style, and it also holds `running-the-test-suite`, which names TestBench's output line, and `releasing-a-gem`, which names RubyGems. Neither is about the Ruby language. They are about the tools a Ruby project uses.

**So `code/` was already the wrong name too**, and by the same reasoning. It names the artifact the rules act on rather than what distinguishes one member of the group from another.

**The `rules-establish-a-mindset-purpose-over-category` rule bears on this.** It says a folder names *the surface a rule acts on, not the purpose it serves*. `code/` names a surface. `tool/` names what varies between members, which is what a grouping directory is for.

## What it reaches

- **The directory** — `system/code/ruby/` becomes `system/tool/ruby/`.
- **The component repository name.** The flattening rule gives `code/ruby` → `code-ruby`, so `tool/ruby` gives `tool-ruby`. `waytide/code-ruby` is published and installed under that name.
- **The publish, and this is the expensive part.** `CONTRIBUTING.md` states that a `git subtree split`'s output history depends on the prefix path, so **a package whose path moves does not fast-forward**. The path change is a force-reset, handled the way the `vocabulary`→`language` rename was. That is the same class of operation the four earlier composite renames each took.
- **`install-all.sh`**, whose `add code/ruby code-ruby` line carries both names.
- **The root `README.md`** and `system/code/ruby/README.md`.
- **The Tool-Specific Distribution feature**, in progress on `feature/tool-specific-distribution`. **2026-08-21 — it was started as Language-Specific Distribution and renamed the same day**, on this idea's axis. So the feature carries the axis while the grouping directory does not yet.

## Its relationship to the distribution idea

**The two are independent and they meet at a name.** *The Ruby package leaves the default distribution* settles which packages a project gets. This one settles what the grouping directory is called and what the axis is. Either could be built without the other.

**Where they meet is what the distribution is called.** A distribution built on a **language** axis is `waytide-ruby` because Ruby is a language. On a **tool** axis it is `waytide-ruby` because Ruby is a tool. The repository name is unchanged either way, and what changes is what a second member of the group would be.

## What is not settled

- **What `tool` covers.** A language, a test framework, a package manager, a build system, and an editor are each a tool by some reading. A grouping whose name admits everything groups nothing.
- **Whether `code/` is renamed or `tool/` is added beside it.** A rename is one force-reset. Two groupings is two things to place a new package into.
- **Whether the published `code-ruby` repository is renamed, redirected, or left.** A consuming project installed it under that name, and a rename reaches every one of them.
- ~~**Whether the feature in progress is renamed**, or concluded under its current subject and the axis change taken separately.~~ **2026-08-21 — settled. It was renamed**, so the axis is adopted in a feature's name before it is adopted in a directory. What the three remaining questions decide is whether the directory follows.

Related:

- *The Ruby package leaves the default distribution* — the idea this meets at a name
- the `rules-establish-a-mindset-purpose-over-category` rule — a folder names the surface rather than the purpose
- `CONTRIBUTING.md` — the path-change publish, and the four composite renames that each took one
- the file-names rule — the dash-separated lower-case naming a directory takes

---

Authored by Scott Bellware on Thu Aug 20 2026 at 10:48:50 PM PT
Changed by Scott Bellware on Thu Aug 20 2026 at 11:00:46 PM PT
Changed by Scott Bellware on Sun Aug 23 2026 at 1:14:38 PM PT
