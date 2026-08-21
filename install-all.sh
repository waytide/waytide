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

# The origin the packages are fetched from. Override it to work over HTTPS where no SSH
# key is registered:
#
#   WAYTIDE_ORIGIN=https://github.com/waytide <this script>
#
origin=${WAYTIDE_ORIGIN:-git@github.com:waytide}

# Waytide is installed with `git subtree`, so there has to be a repository to install into.
# Rather than refusing outright, offer to make one — a developer running this in a directory
# they mean to be a project is one `git init` away from what the script needs, and that is a
# likelier reading than their having run it somewhere by mistake.
#
# It is offered rather than done. Creating a repository in a directory is not this script's to
# assume: the directory may be inside another project, or meant to stay untracked, and an
# unasked-for `.git` is a thing a developer then has to notice and undo.
if [ ! -d .git ] && ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "This is not a git repository, and Waytide is installed with git subtree."
  echo
  echo "Directory: $(pwd)"
  echo

  # No prompt where nobody can answer one. Refusing is the safe outcome, and saying which
  # command would fix it costs nothing.
  if [ ! -t 0 ]; then
    echo "Not running interactively, so nothing was created and nothing was installed." >&2
    echo "Run \`git init\` here first, then run this again." >&2
    exit 1
  fi

  # The default is yes. A developer reaching this prompt fetched the script, chose a
  # directory, and ran it — the intention is not in doubt, and `git init` creates a
  # directory and destroys nothing. Defaulting it to no would also sit oddly beside the
  # empty initial commit this script makes with no prompt at all, which writes to a
  # developer's repository and is the more intrusive of the two.
  #
  # What the prompt is actually for is the wrong directory, and the path printed above is
  # what catches that. The question remains so there is somewhere to say no.
  printf 'Initialize a git repository here and install into it? [Y/n] '
  read -r answer
  case "$answer" in
    [Nn] | [Nn][Oo])
      echo "Nothing was created and nothing was installed."
      exit 1
      ;;
    *)
      git init --quiet
      echo "Initialized a git repository."
      ;;
  esac
fi

# The authoring source holds the packages at system/, with no waytide/ wrapper; a consuming
# project holds them at waytide/system/. Installing here would add a second, installed copy of
# every package beside the ones being written, and place a consuming project's bootstrap over
# this repository's own. The same refusal is in refresh-packages.sh.
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
  repo="$origin/$2.git"

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
add journal             journal

# Activate the system: place the project-root AGENTS.md. Foundation is
# installed above, so run its AGENTS.md-only mode (it won't re-add itself).
# The bootstrap logic lives only in waytide/system/foundation/install.sh — not duplicated here.
waytide/system/foundation/install.sh agents-md
