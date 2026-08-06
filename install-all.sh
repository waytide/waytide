#!/bin/sh
# Install (or refresh) every Waytide package into a consuming project, then
# activate the system by placing the project-root AGENTS.md, a CLAUDE.md that
# imports it (Claude Code reads CLAUDE.md, not AGENTS.md), and a .claude/settings.json
# whose SessionStart hook and status line print the session-start notice.
# Fetch it into the root of the consuming project and run it from there:
#
#   curl -O https://raw.githubusercontent.com/waytide/waytide/master/install-all.sh
#   sh install-all.sh
#
# `sh install-all.sh`, not `./install-all.sh`, and this is the one script here written that
# way. It is committed executable like every other, but it is also the only one delivered by
# `curl`, which transfers content and not file metadata — so the copy a developer runs is
# never executable, whatever mode the original carries. Every other script reaches a project
# inside a package by `git subtree`, which preserves the mode, and is invoked as itself.
set -e

if [ ! -d .git ] && ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "Run this from the root of a git repository — Waytide is installed with git subtree." >&2
  exit 1
fi

# The authoring source holds the packages at system/, with no waytide/ wrapper; a consuming
# project holds them at waytide/system/. Installing here would add a second, installed copy of
# every package beside the ones being written, and place a consuming project's bootstrap over
# this repository's own. The same refusal is in refresh-packages.sh and report-unrecognized-mode.sh.
if [ -d system/foundation ] && [ ! -d waytide/system ]; then
  echo "This is the Waytide authoring source, where the packages are written rather than" >&2
  echo "installed. Installing here would put a second copy of every package under waytide/," >&2
  echo "beside the ones at system/, and overwrite this repository's own bootstrap." >&2
  exit 1
fi

# `git subtree add` resolves HEAD to check the working tree is clean, so a repository that has
# been initialized and never committed to fails twice over: `git rev-parse HEAD` reports an
# ambiguous argument, and git subtree reads that failure as a dirty tree and says so — which is
# false and sends the developer looking for changes that are not there.
#
# A project created moments ago is the likeliest project to be installing Waytide into, so the
# commit is made here rather than demanded. It is empty, it is announced, and it is the history's
# first commit — nothing of the developer's is swept into it, because there is nothing yet.
if ! git rev-parse HEAD >/dev/null 2>&1; then
  git commit --quiet --allow-empty -m "Repository is initialized"
  echo "This repository had no commits. An empty initial commit was made, because git subtree"
  echo "cannot add to a repository without one."
fi

add() {
  prefix="waytide/system/$1"
  repo="https://github.com/waytide/$2.git"

  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi

  git subtree pull --prefix "$prefix" "$repo" master --squash
}

add foundation          foundation
add language            language
add testing             testing
add code/ruby           code-ruby
add git                 git
add versioning          versioning
add design-by-efferent  design-by-efferent

# Activate the system: place the project-root AGENTS.md. Foundation is
# installed above, so run its AGENTS.md-only mode (it won't re-add itself).
# The bootstrap logic lives only in waytide/system/foundation/install.sh — not duplicated here.
waytide/system/foundation/install.sh agents-md
