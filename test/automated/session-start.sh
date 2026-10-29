#!/bin/sh
# Usage:
#
#   test/automated/session-start.sh
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

# Controls -------------------------------------------------------------------

project=$(mktemp -d)
trap 'rm -rf "$project"' EXIT

mkdir -p "$project/system/foundation"
cp system/foundation/session-start.sh "$project/system/foundation/"
echo some-readme > "$project/system/foundation/README.md"

control_event='{"session_id": "some-session", "hook_event_name": "SessionStart", "source": "compact"}'

control_compaction_text="The context has just been compacted. The rules read at the start of this session now survive only as the compaction's summary, which does not hold them. Before your next act, whatever the next request is, run the loader again and read its whole output, as follows."

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && echo "$control_event" | sh system/foundation/session-start.sh)

# On a compaction, the read instruction says the rules survive only as a summary and must be read again

case "$output" in
  *"\"additionalContext\": \"$control_compaction_text "*) ;;
  *) fail "On a compaction, the read instruction says the rules survive only as a summary and must be read again" "output:" "$output" ;;
esac

echo "1 passed"
