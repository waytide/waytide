#!/bin/sh
# Install (or refresh) the foundation package AND activate the system.
# Foundation is standalone, but it owns the bootstrap: this script places the
# project-root AGENTS.md that makes waytide/system/ and waytide/local/rules/ get read at session start,
# a CLAUDE.md that imports it (Claude Code reads CLAUDE.md, not AGENTS.md), and a
# .claude/settings.json whose SessionStart hook and status line print the session-start
# notice, and a .claude/commands/load-rules.md slash command that reads the rules on demand.
# Run from the root of the consuming project.
#
# Usage:
#   sh install.sh             install/refresh foundation, then place the bootstrap files
#   sh install.sh agents-md   place the bootstrap files only (foundation already
#                             installed; used by the composite install-all.sh so the
#                             bootstrap logic lives in one place, not two)
set -e

prefix="waytide/system/foundation"
repo="https://github.com/waytide/foundation.git"

# The bootstrap section written into the project-root AGENTS.md.
bootstrap() {
  cat <<'EOF'
## Waytide

This project's Waytide system and working conventions live under `waytide/`,
committed alongside the code and read at the start of each session.

**At the start of a session, read every rule file under `waytide/system/` and
`waytide/local/rules/`, and follow them.**

`waytide/system/` holds the installed system packages —
`waytide/system/foundation/`, `waytide/system/language/`, and so on, including
each package's `vocabulary.md` glossary (its terms are binding and can't be applied
unread). `waytide/local/rules/` holds this project's own local rules.
Read `waytide/system/foundation/` first; it defines the system. The rules
override default behavior where they conflict; explicit user instructions still win.

**The session-start notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in `.claude/settings.json` runs
`waytide/system/foundation/session-start.sh`, which reads the package directories
actually present and emits the one-line `Waytide installed at … — N packages: …`
notice; a status line carries the same count for the rest of the session. A developer
silences both by setting the `WAYTIDE_QUIET` environment variable to any non-empty
value in their own environment.

`waytide/` holds exactly two directories, splitting what came from outside from what
is this project's own. `waytide/system/` is installed and never edited in place.
`waytide/local/` is everything this project writes: `rules/` alongside the working
state — `log/`, `deferred/`, `observations/`, `design/`, `plans/`, `sessions/`,
`loops/`, `experiments/` — each worked with as its convention describes, and only
`rules/` read as binding at session start.
EOF
}

# Ensure the project-root AGENTS.md activates the system. Creates it when
# absent; when one already exists, asks before appending (never silently); does
# nothing when it's already there. Idempotent.
place_agents_md() {
  if [ -f AGENTS.md ] && grep -q 'waytide/system/' AGENTS.md; then
    echo "AGENTS.md already points at waytide/system/ — left unchanged."
  elif [ ! -f AGENTS.md ]; then
    # No root AGENTS.md yet — creating one takes nothing away, so do it directly.
    bootstrap > AGENTS.md
    echo "Created AGENTS.md with the Waytide bootstrap."
  else
    # An AGENTS.md you maintain already exists. Explain the effect, show the exact
    # text, and ask before touching it — never append silently.
    echo "You already have an AGENTS.md at the project root."
    echo
    echo "Appending the Waytide bootstrap will add a section that tells the agent,"
    echo "at the start of every session, to read every rule file under waytide/system/ and waytide/local/rules/ and follow"
    echo "it. Those rules then OVERRIDE the agent's default behavior where they conflict"
    echo "(your explicit instructions still win). Your existing AGENTS.md content is left"
    echo "exactly as it is; the section is added at the end, after a blank line."
    echo
    echo "Exact text to be appended:"
    echo "----------------------------------------------------------------------"
    bootstrap
    echo "----------------------------------------------------------------------"
    echo
    if [ ! -t 0 ]; then
      echo "Not running interactively, so AGENTS.md was NOT modified."
      echo "Re-run this in a terminal to be prompted, or paste the section above yourself."
      return 0
    fi
    printf 'Append this to your AGENTS.md now? [y/N] '
    read -r answer
    case "$answer" in
      [Yy] | [Yy][Ee][Ss])
        printf '\n' >> AGENTS.md
        bootstrap >> AGENTS.md
        echo "Appended the Waytide bootstrap to AGENTS.md."
        ;;
      *)
        echo "Left AGENTS.md unchanged. Paste the section above into it to activate the system."
        ;;
    esac
  fi
}

# Ensure a project-root CLAUDE.md imports AGENTS.md. Claude Code loads CLAUDE.md,
# not AGENTS.md, so without this the bootstrap never reaches a Claude Code session
# and the system does not load. A one-line `@AGENTS.md` import bridges the two
# without duplicating the bootstrap. Same care as place_agents_md: creates it when
# absent; when one already exists, asks before appending (never silently); does
# nothing when the import is already there. Idempotent.
place_claude_md() {
  if [ -f CLAUDE.md ] && grep -q '@AGENTS.md' CLAUDE.md; then
    echo "CLAUDE.md already imports AGENTS.md — left unchanged."
  elif [ ! -f CLAUDE.md ]; then
    # No root CLAUDE.md yet — creating one takes nothing away, so do it directly.
    printf '@AGENTS.md\n' > CLAUDE.md
    echo "Created CLAUDE.md importing AGENTS.md (Claude Code reads CLAUDE.md, not AGENTS.md)."
  else
    # A CLAUDE.md you maintain already exists. Explain the effect and ask before
    # touching it — never append silently.
    echo "You already have a CLAUDE.md at the project root."
    echo
    echo "Claude Code reads CLAUDE.md, not AGENTS.md. For the Waytide bootstrap in AGENTS.md"
    echo "to load at session start under Claude Code, CLAUDE.md needs to import it with a line"
    echo "reading: @AGENTS.md. Your existing CLAUDE.md content is left exactly as it is; the"
    echo "import is added at the end, after a blank line."
    echo
    if [ ! -t 0 ]; then
      echo "Not running interactively, so CLAUDE.md was NOT modified."
      echo "Re-run this in a terminal to be prompted, or add a line reading '@AGENTS.md' to CLAUDE.md yourself."
      return 0
    fi
    printf 'Append "@AGENTS.md" to your CLAUDE.md now? [y/N] '
    read -r answer
    case "$answer" in
      [Yy] | [Yy][Ee][Ss])
        printf '\n@AGENTS.md\n' >> CLAUDE.md
        echo "Appended '@AGENTS.md' to CLAUDE.md."
        ;;
      *)
        echo "Left CLAUDE.md unchanged. Add a line reading '@AGENTS.md' to it to load the system under Claude Code."
        ;;
    esac
  fi
}

# The .claude/settings.json content that makes the harness print the session-start notice.
settings_json() {
  cat <<'EOF'
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "waytide/system/foundation/session-start.sh"
          }
        ]
      }
    ]
  },
  "statusLine": {
    "type": "command",
    "command": "waytide/system/foundation/statusline.sh"
  }
}
EOF
}

# The .claude/commands/load-rules.md content — a slash command a developer invokes to
# have the rules read on demand.
#
# It is a THIRD channel for the read instruction, and the weakest of the three by design.
# The SessionStart hook carries the instruction to the agent unprompted; this carries it
# only when the developer types /load-rules. It exists because the wording then lives in
# one committed file instead of being retyped and re-improvised each session, and because
# an explicit developer instruction leaves the agent no judgment to make about whether a
# small-looking request warrants the read — which is the judgment that has actually failed.
# It does not replace the hook, and a project should not rely on it as the primary path.
load_rules_command() {
  cat <<'EOF'
---
description: Read every Waytide rule file before doing anything else
---

Read every rule file under `waytide/system/` and `waytide/local/rules/`, and follow them.

Start with `waytide/system/foundation/` — it defines the system. Then read the other
packages, including each package's `vocabulary.md`, whose terms are binding and cannot be
applied unread.

Complete the read before producing anything: no response to me and no change to the
repository until every rule file has been read. Reading and enumerating files are the only
things that should happen first. The size of whatever I ask next is not a reason to defer or
narrow the read — it predicts nothing about where the session goes.

Say only that the read is done, then wait for my request. Do not restate the session-start
notice or print a package count — the harness has already printed it, and the
announce-waytide-at-session-start rule forbids an agent-printed copy.
EOF
}

# Ensure .claude/commands/load-rules.md carries the read instruction as a slash command.
# Created when absent. An existing file is never overwritten — a developer may have a
# /load-rules of their own, and silently replacing it would destroy their content — so the
# shipped text is printed for them to compare instead. That also means a refresh does not
# update an already-placed command; the file is shown so the difference is visible.
# Idempotent.
place_load_rules_command() {
  if [ -f .claude/commands/load-rules.md ]; then
    if load_rules_command | cmp -s - .claude/commands/load-rules.md; then
      echo ".claude/commands/load-rules.md already matches the shipped command — left unchanged."
    else
      echo "You already have a .claude/commands/load-rules.md, and it differs from the shipped one."
      echo
      echo "It is not modified here. Compare it with the current text and merge what you want:"
      echo
      echo "----------------------------------------------------------------------"
      load_rules_command
      echo "----------------------------------------------------------------------"
    fi
  else
    mkdir -p .claude/commands
    load_rules_command > .claude/commands/load-rules.md
    echo "Created .claude/commands/load-rules.md — type /load-rules to have the rules read on demand."
  fi
}

# Warn when git is configured to ignore the committed .claude/ files. They are meant to
# travel with the project, and they only do that if committed — so an ignored file works
# for whoever ran the install and reaches nobody else. Projects commonly ignore the whole
# .claude/ directory, in which case the install would otherwise report success while the
# notice and the command silently stay on one machine. A file that is already committed is
# unaffected by an ignore rule, so a tracked file draws no warning. Outside a git
# repository, check-ignore fails and nothing is printed.
warn_ignored_claude_files() {
  ignored=
  for claude_file in .claude/settings.json .claude/commands/load-rules.md; do
    [ -f "$claude_file" ] || continue
    git check-ignore -q "$claude_file" 2>/dev/null || continue
    git ls-files --error-unmatch "$claude_file" >/dev/null 2>&1 && continue
    ignored="${ignored}${ignored:+ }${claude_file}"
  done

  if [ -z "$ignored" ]; then
    return
  fi

  echo
  echo "WARNING: git is set to ignore these files:"
  echo
  for claude_file in $ignored; do
    echo "    $claude_file"
  done
  echo
  echo "They are in place and work for you, but git will not commit them, so they will"
  echo "not reach anyone else who checks this project out."
  echo
  echo "If your .gitignore excludes the whole .claude/ directory, a negation alone will"
  echo "not rescue them — git cannot re-include anything inside an excluded directory."
  echo "Replace the '.claude/' line with these three:"
  echo
  echo "    .claude/*"
  echo "    !.claude/settings.json"
  echo "    !.claude/commands/"
  echo
  echo "That keeps your personal .claude/settings.local.json ignored."
  echo
  echo "Or leave the ignore rule alone and commit them explicitly:"
  echo
  for claude_file in $ignored; do
    echo "    git add -f $claude_file"
  done
}

# Ensure .claude/settings.json carries the SessionStart hook and status line that
# print the session-start notice. Unlike AGENTS.md and CLAUDE.md, this file cannot be safely
# appended to — merging JSON needs a JSON tool that may not be installed, and a
# corrupted settings.json silently disables every setting in it. So an existing file
# is never modified: the exact block is printed for the developer to merge. Note
# that adopting the status line replaces whatever status line they had configured.
# Idempotent.
place_settings_json() {
  if [ -f .claude/settings.json ] && grep -q 'foundation/session-start.sh' .claude/settings.json; then
    echo ".claude/settings.json already runs the Waytide session-start notice — left unchanged."
  elif [ ! -f .claude/settings.json ]; then
    # No settings file yet — creating one takes nothing away, so do it directly.
    mkdir -p .claude
    settings_json > .claude/settings.json
    echo "Created .claude/settings.json with the Waytide session-start notice (SessionStart hook and status line)."
    echo "Commit it so the notice travels to everyone who checks the project out."
  else
    echo "You already have a .claude/settings.json."
    echo
    echo "It is not modified here: JSON cannot be safely appended to, and a malformed"
    echo "settings.json silently disables every setting in it. Merge these two keys into"
    echo "your file yourself — 'hooks' prints the session-start notice, and"
    echo "'statusLine' keeps the package count on screen. Note that setting 'statusLine'"
    echo "REPLACES any status line you have already configured; leave that key out if you"
    echo "would rather keep yours."
    echo
    echo "----------------------------------------------------------------------"
    settings_json
    echo "----------------------------------------------------------------------"
  fi
}

# 1. Install (or refresh) the foundation rules — skipped in agents-md-only mode.
if [ "$1" != "agents-md" ]; then
  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi
  git subtree pull --prefix "$prefix" "$repo" master --squash
fi

# 2. Ensure the project-root AGENTS.md activates the system, that CLAUDE.md
#    imports it so the bootstrap also reaches Claude Code sessions, that
#    .claude/settings.json prints the session-start notice, and that
#    .claude/commands/load-rules.md offers the read on demand.
#
#    The ignore check runs last, once, over every .claude/ file placed above —
#    they share one .gitignore failure and one correction, so warning per file
#    would repeat the same remedy.
place_agents_md
place_claude_md
place_settings_json
place_load_rules_command
warn_ignored_claude_files
