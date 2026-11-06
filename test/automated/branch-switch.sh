#!/bin/sh
# Usage:
#
#   test/automated/branch-switch.sh
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
git -C "$control_repository" branch some-other-branch

control_event='{"session_id": "some-session", "tool_use_id": "some-tool-use", "tool_name": "Bash"}'

# Actuation ------------------------------------------------------------------

(cd "$control_repository" && printf '%s' "$control_event" | "$script" before)
git -C "$control_repository" switch -q some-other-branch
output=$(cd "$control_repository" && printf '%s' "$control_event" | "$script" after)

context=$(printf '%s' "$output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["hookSpecificOutput"]["additionalContext"])' 2>/dev/null || true)

# Tells the agent to print the branch-switch block where the command switched the branch ---

control_context="The last command switched the branch from some-branch to some-other-branch. Before anything else, print the branch-switch block, as the announce-a-branch-switch-in-a-bordered-block rule describes, with from some-branch, to some-other-branch, and the reason for the switch."

[ "$context" = "$control_context" ] || fail "Tells the agent to print the branch-switch block where the command switched the branch" "found:" "$output"

echo "0 failed, 0 aborted"
