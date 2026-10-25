# Binding rules live in `waytide/system/` (installed) and `waytide/local/rules/` (the project's own)

The project's **binding** rules are read at the start of every session and followed. Those are naming conventions, terminology, plan-writing norms, commit conventions, and the like. They live in two directories, separated by source:

- **`waytide/system/`** — the **installed system packages**, each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …). These are installed with `git subtree` and refreshed by pulling. A package's `vocabulary.md` glossary is part of its rules — the terms are binding and can't be applied unread.
- **`waytide/local/rules/`** — the project's **own local rules**, one per file. The project's own conventions, not installed from a package.

- **Read every rule file under `waytide/system/` and `waytide/local/rules/` at the start of a session and follow them, except each package's `source/` directory and `README.md`.** A package's `source/` holds the full rules its compiled rules are compiled from, and is where a rule is edited. The compiled rules at the package root are what is read. They override default behavior where they conflict. Explicit user instructions still win. Read `waytide/system/foundation/` first — it defines the system.
- **One file beside `rules/` is read with them and binds: `waytide/local/vocabulary.md`**, the project's own vocabulary. It is binding and its terms cannot be applied unread, exactly as a package's `vocabulary.md` is, and its terms decide over every package's. It is not a rule and does not live in `rules/`. The vocabulary-convention rule settles where it sits and why. Like `rules/`, it may not exist, and its absence is ordinary.
- **Rules are kept separate from work artifacts.** `waytide/local/rules/` holds only rules. `waytide/system/` holds the packages' rules and what packages them: each package's `README.md`, `source/`, and `LICENSE`, its `vocabulary.md` where it has one, and its scripts. Neither holds any of the project's working state. The project's working state lives beside `rules/` under `waytide/local/` — `logs/` (holding `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, `migration/` — worked with as their own conventions describe, not read as binding rules at session start. `waytide/local/vocabulary.md` sits beside them and is not working state: it is read at session start, and it is the one thing there that binds.
- **A rule's purpose is not confined to its category.** A rule's package names the *surface* it acts on, not the purpose it serves. Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance. See the rules-establish-a-mindset rule.
- **Format:** frontmatter-free markdown — a `# <title>` stating the rule, the rule in prose, then short `**Why:**` and `**How to apply:**` lines. A **system package** rule is named by a dash-separated, lower-case name. A project's **own local rule** in `waytide/local/rules/` takes the ISO-8601-UTC datetime prefix (see the file-names rule).
- **A rule's history goes in a `## History` section, placed before `Related:`.** History is what the rule used to say, when it changed, what it was named, and where it sat. The compiler leaves the section out of the compiled rule, so the session-start read does not carry it, and the full rule in `source/` keeps it. Reasoning the directive depends on is not history, even where it tells what failed before: it stays in the body, where the `**Why:**` passage is.
- **A paragraph leads with its claim in bold.** The sentences after it support that claim. Where the support runs past six sentences, the next paragraph carries no bold lead. The absence is what marks it as continuation rather than a new claim. The six-sentence limit is STE Rule 6.6 (see the language package's waytide-prose-conforms-to-the-ste-writing-rules rule).
- **Recording a new local rule:** when the user states a rule, or a decision sets a rule for future work, add it as a new file in `waytide/local/rules/`, and add a matching one-line entry to `waytide/local/logs/log/`. (A rule that belongs to a system package is edited in that package and re-published, not added here.)
- **Reference a rule by its name, never by its file path.** Write "the tdd-test-structure rule", not `waytide/system/testing/tdd-test-structure.md`. A rule is renamed when its name stops saying what it says, and the filename changes with it — a path recorded elsewhere then points at nothing, while the rule is still the same rule and still findable by name. Every rule in the system already refers to its siblings this way. The one place a path was written instead is the one place that broke.
- **Removing a rule:** search for what cites it and reconcile the live artifacts that do, then remove it and log the removal. **Where the rule is being stopped rather than superseded, tag its log entry `[suspended]`** and name in that entry what it cost and what else changed. See the a-suspension-is-a-log-entry rule. A removed rule is **dropped** from a `Related:` list rather than marked — a Related list is a set of live pointers, and a permanent `(deleted)` entry there is clutter that every later reader must step over. The log entry is the durable trace. A rule removal is the only case that strands a citation, since an item is never deleted — its state changes and the record is kept.

**Why:** the rules are the project's durable, in-repo conventions. They are committed alongside the code and read fresh each session rather than recalled, so they stay authoritative and current. One rule per file keeps each convention individually readable, referenceable, and revisable. The installed packages are in `waytide/system/`, and the project's own rules are in `waytide/local/rules/`. Separating the two keeps installed content distinct from the project's own work, so refreshing a package never touches a local rule.

**How to apply:** read the rule files under `waytide/system/` and `waytide/local/rules/` at session start. Read `waytide/local/vocabulary.md` too, where the project has one. Hold to them.

When a new binding convention is set, write it in `waytide/local/rules/` in the format above and log it. When the project settles a term or a substitution of its own, write it in `waytide/local/vocabulary.md`. Do not write it as a rule. Prefer an observation over a rule when the thinking hasn't stabilized (see the observations rule).

## Compressed

## Where binding rules live

1. The project's binding rules are read at the start of every session and followed.
2. Binding rules include naming conventions, terminology, plan-writing norms, commit conventions, and the like.
3. Binding rules live in two directories, separated by source.
4. **`waytide/system/`** holds the installed system packages, each in its own subdirectory (`waytide/system/foundation/`, `waytide/system/language/`, …).
5. Packages are installed with `git subtree` and refreshed by pulling.
6. A package's `vocabulary.md` glossary is part of its rules. Its terms are binding and cannot be applied unread.
7. **`waytide/local/rules/`** holds the project's own local rules, one per file. Every rule, system or local, is kept one per file.
8. Local rules are the project's own conventions, not installed from a package.

## Reading the rules

1. Read every rule file under `waytide/system/` and `waytide/local/rules/` at the start of a session, and follow them.
2. Do not read a package's `source/` directory or its `README.md`.
3. A package's `source/` holds the full rules that its compiled rules are compiled from.
4. Edit a rule in `source/`.
5. The compiled rules at the package root are what is read.
6. The rules override default behavior where they conflict.
7. Explicit user instructions still win over the rules.
8. Read `waytide/system/foundation/` first. It defines the system.
9. Read `waytide/local/vocabulary.md` with the rules. It binds.
10. Its terms cannot be applied unread, exactly as a package's `vocabulary.md`.
11. Its terms decide over every package's terms.
12. It is not a rule and does not live in `rules/`.
13. The vocabulary-convention rule settles where it sits and why.
14. It may not exist, and neither may `rules/`. Either absence is ordinary.

## Rules and work artifacts

1. Rules are kept separate from work artifacts.
2. `waytide/local/rules/` holds only rules. `waytide/system/` holds the packages' rules and what packages them: each package's `README.md`, `source/`, and `LICENSE`, its `vocabulary.md` where it has one, and its scripts. Neither holds any of the project's working state.
3. The project's working state lives beside `rules/` under `waytide/local/`: `logs/` (holding `log/`, `loops/`, and `work-sessions/`), `items/`, `implementations/`, `migration/`.
4. Work with working state as its own conventions describe.
5. Do not read working state as binding rules at session start.
6. `waytide/local/vocabulary.md` sits beside working state but is not working state. It is read at session start and is the one thing there that binds.

## Purpose of a rule

1. A rule's package names the surface it acts on, not the purpose it serves. A rule's purpose is not confined to its category.
2. Judge a rule that establishes a stance by the mindset it establishes, not by surface conformance. See the rules-establish-a-mindset rule.

## Format

1. A rule is frontmatter-free markdown.
2. It has a `# <title>` stating the rule, then the rule in prose, then short `**Why:**` and `**How to apply:**` lines.
3. Name a system package rule with a dash-separated, lower-case name.
4. Give a project's own local rule in `waytide/local/rules/` the ISO-8601-UTC datetime prefix in its file name. See the file-names rule.
5. Put a rule's history in a `## History` section, placed before `Related:`.
6. History is what the rule used to say, when it changed, what it was named, and where it sat.
7. The compiler leaves `## History` out of the compiled rule. The full rule in `source/` keeps it.
8. Reasoning the directive depends on is not history, even where it tells what failed before. Keep it in the body, where the `**Why:**` passage is.
9. A paragraph leads with its claim in bold. The sentences after it support that claim.
10. Where the support runs past six sentences, the next paragraph carries no bold lead. The absence marks it as continuation, not a new claim.
11. The six-sentence limit is STE Rule 6.6. See the language package's waytide-prose-conforms-to-the-ste-writing-rules rule.

## Recording a new local rule

1. When the user states a rule, or a decision sets a rule for future work, add it as a new file in `waytide/local/rules/`.
2. Add a matching one-line entry to `waytide/local/logs/log/`.
3. Edit a rule that belongs to a system package in that package and re-publish it. Do not add it to `waytide/local/rules/`.
4. When the project settles a term or a substitution of its own, write it in `waytide/local/vocabulary.md`. Do not write it as a rule.
5. Prefer an observation over a rule when the thinking has not stabilized. See the observations rule.

## Referencing a rule

1. Reference a rule by its name, never by its file path.
2. Write "the tdd-test-structure rule", not `waytide/system/testing/tdd-test-structure.md`.
3. Rename a rule when its name stops saying what it says. Its filename changes with it, so a recorded path then points at nothing.

## Removing a rule

1. Search for what cites the rule, and reconcile the live artifacts that cite it.
2. Then remove the rule and log the removal.
3. Where the rule is stopped rather than superseded, tag its log entry `[suspended]`.
4. In a `[suspended]` entry, name what the rule cost and what else changed. See the a-suspension-is-a-log-entry rule.
5. Drop a removed rule from every `Related:` list. Do not mark it, such as with `(deleted)`.
6. The log entry is the durable trace of the removal. An item is never deleted. Its state changes and its record is kept.
7. **Why:** the rules are the project's durable, in-repo conventions, committed with the code and read fresh each session, so they stay authoritative and current. One rule per file keeps each convention readable, referenceable, and revisable. Separating installed packages from local rules means refreshing a package never touches a local rule.

## History

Until 2026-10-25 the rule said `waytide/system/` and `waytide/local/rules/` "hold only rules", while each package under `waytide/system/` also holds its `README.md`, its `source/` directory, a license, and scripts. The engineer settled that `waytide/system/` holds the rules and what packages them, and that neither directory holds working state.

Related:

- the file-names rule
- the vocabulary-convention — the project's own vocabulary and where it sits
- the rules-establish-a-mindset rule
- the decision-log rule

---

Authored by Scott Bellware on Thu Jul 16 2026 at 6 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:07:00 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:30:44 PM PT
Changed by Scott Bellware on Mon Jul 27 2026 at 2:35:51 PM PT
Changed by Scott Bellware on Thu Jul 30 2026 at 10:27:32 AM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 3:48:36 PM PT
Changed by Scott Bellware on Sat Aug 1 2026 at 4:34:12 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:13:27 PM PT
Changed by Scott Bellware on Sun Aug 2 2026 at 8:23:08 PM PT
Changed by Scott Bellware on Thu Aug 6 2026 at 12:21:42 AM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 1:24:07 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 6:14:48 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 9:29:23 PM PT
Changed by Scott Bellware on Mon Aug 10 2026 at 10:54:59 PM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 12:34:07 AM PT
Changed by Scott Bellware on Tue Aug 11 2026 at 2:41:09 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 9:24:07 AM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 1:41:52 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 2:11:33 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:22:08 PM PT
Changed by Scott Bellware on Tue Aug 18 2026 at 4:41:26 PM PT
Changed by Scott Bellware on Mon Aug 24 2026 at 11:14:28 PM PT
Changed by Scott Bellware on Mon Oct 12 2026 at 1:00:17 PM PT
Changed by Scott Bellware on Wed Oct 14 2026 at 1:11:55 PM PT
Changed by Scott Bellware on Tue Oct 20 2026 at 12:49:37 PM PT
Changed by Scott Bellware on Wed Oct 21 2026 at 9:37:27 AM PT
Changed by Scott Bellware on Sat Oct 24 2026 at 3:50:22 PM PT
Changed by Scott Bellware on Sun Oct 25 2026 at 3:50:44 PM PT
