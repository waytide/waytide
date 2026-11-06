#!/bin/sh
# Usage:
#
#   test/automated/branch-switch-unchanged.sh
#
# Run from the repository root.
set -e

fail() {
  echo "$1"
  shift
  for line in "$@"; do echo "  $line"; done
  echo "1 failed, 0 aborted"
  exit 1
}

script=$PWD/system/git/branch-switch.sh

# Controls -------------------------------------------------------------------

# The branch recorded before a command is kept under TMPDIR, so the test keeps its own.
TMPDIR=$(mktemp -d)
export TMPDIR
trap 'rm -rf "$TMPDIR"' EXIT

control_repository=$TMPDIR/some-repository
git init -q -b some-branch "$control_repository"
git -C "$control_repository" -c user.name=some-name -c user.email=some-email commit -q --allow-empty -m some-commit

control_event='{"session_id": "some-session", "tool_use_id": "some-tool-use", "tool_name": "Bash"}'

# Actuation ------------------------------------------------------------------

(cd "$control_repository" && printf '%s' "$control_event" | "$script" before)
git -C "$control_repository" status -s > /dev/null
output=$(cd "$control_repository" && printf '%s' "$control_event" | "$script" after)

# Prints nothing where the command left the branch as it was ---

[ -z "$output" ] || fail "Prints nothing where the command left the branch as it was" "found:" "$output"

echo "0 failed, 0 aborted"
