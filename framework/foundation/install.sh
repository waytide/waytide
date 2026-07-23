#!/bin/sh
# Install (or refresh) the foundation package AND activate the framework.
# Foundation is standalone, but it owns the bootstrap: this script places the
# project-root AGENTS.md that makes waytide/framework/ and waytide/rules/ get read at session start.
# Run from the root of the consuming project.
#
# Usage:
#   sh install.sh             install/refresh foundation, then place the root AGENTS.md
#   sh install.sh agents-md   place the root AGENTS.md only (foundation already
#                             installed; used by the composite install-all.sh so the
#                             bootstrap logic lives in one place, not two)
set -e

prefix="waytide/framework/foundation"
repo="https://github.com/waytide/foundation.git"

# The bootstrap section written into the project-root AGENTS.md.
bootstrap() {
  cat <<'EOF'
## Waytide

This project's Waytide framework and working conventions live under `waytide/`,
committed alongside the code and read at the start of each session.

**At the start of a session, read every rule file under `waytide/framework/` and
`waytide/rules/`, and follow them.** `waytide/framework/` holds the installed
framework packages — `waytide/framework/foundation/`, `waytide/framework/language/`,
and so on, including each package's `vocabulary.md` glossary (its terms are binding
and can't be applied unread). `waytide/rules/` holds this project's own local rules.
Read `waytide/framework/foundation/` first; it defines the framework. The rules
override default behavior where they conflict; explicit user instructions still win.

**After reading the rules, print a one-line notice that Waytide is loaded and which
packages are present** — for example:
`Waytide loaded from waytide/framework/ — 5 packages: foundation, language, testing,
design-by-efferent, git`. List the package directories actually present under
`waytide/framework/`, named and counted. Skip the notice when the `WAYTIDE_QUIET`
environment variable is set to any non-empty value; a developer can set it in their
shell, `direnv`, or a personal `.claude/settings.json` `env` block to silence it.

The other directories under `waytide/` hold the project's working state, kept
separate from the rules — `log/`, `deferred/`, `observations/`, `design/`,
`plans/`, `sessions/`, `loops/`, `experiments/` — and are worked with as their
conventions describe, not read as binding rules at session start.
EOF
}

# Ensure the project-root AGENTS.md activates the framework. Creates it when
# absent; when one already exists, asks before appending (never silently); does
# nothing when it's already there. Idempotent.
place_agents_md() {
  if [ -f AGENTS.md ] && grep -q 'waytide/framework/' AGENTS.md; then
    echo "AGENTS.md already points at waytide/framework/ — left unchanged."
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
    echo "at the start of every session, to read every rule file under waytide/framework/ and waytide/rules/ and follow"
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
        echo "Left AGENTS.md unchanged. Paste the section above into it to activate the framework."
        ;;
    esac
  fi
}

# 1. Install (or refresh) the foundation rules — skipped in agents-md-only mode.
if [ "$1" != "agents-md" ]; then
  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi
  git subtree pull --prefix "$prefix" "$repo" master --squash
fi

# 2. Ensure the project-root AGENTS.md activates the framework.
place_agents_md
