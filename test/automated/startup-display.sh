#!/bin/sh
# Usage:
#
#   test/automated/startup-display.sh
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

# Read from a function rather than a heredoc inside $(…): macOS /bin/sh joins a line ending in a
# backslash to the next one there, and three lines of the figure end in one.
control_start_text() {
  cat <<'DISPLAY'

Waytide: Human-in-the-Loop Harness

Copyright © 2026 Scott Bellware
Eventide Common Interest License

Waytide's rules will load on the first prompt, or enter: /load
DISPLAY
}

control_loading_text() {
  cat <<'DISPLAY'

Loading will take a moment

     __      /
    /  \    /
   |    |  /
    \__/  /
      | =/=
     _|_/
    / |
     / \
    /   \
   /    /
===========
    | |
  __|_|__
 (o)   (o)
DISPLAY
}

control_start=$(control_start_text)
control_loading=$(control_loading_text)

# The marker that records a session's first prompt is kept under TMPDIR, so the test keeps its own.
TMPDIR=$(mktemp -d)
export TMPDIR
trap 'rm -rf "$TMPDIR"' EXIT

control_event='{"session_id": "some-session", "hook_event_name": "UserPromptSubmit", "prompt": "some prompt"}'

# Actuation ------------------------------------------------------------------

output=$(printf '%s' "$control_event" | system/foundation/startup-display.sh)

# Prints the loading line and the figure on a session's first prompt ---------------

loading=$(printf '%s' "$output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])' 2>/dev/null || true)

[ "$loading" = "$control_loading" ] || fail "Prints the loading line and the figure on a session's first prompt" "found:" "$output"

# Prints nothing on a later prompt in the same session -------------------------------

later_output=$(printf '%s' "$control_event" | system/foundation/startup-display.sh)

[ -z "$later_output" ] || fail "Prints nothing on a later prompt in the same session" "found:" "$later_output"

# Prints the session-start part alone, as the session-start message carries it ------

message=$(system/foundation/startup-display.sh message)
start=$(printf '"%s"' "$message" | python3 -c 'import json,sys; print(json.load(sys.stdin))' 2>/dev/null || true)

[ "$start" = "$control_start" ] || fail "Prints the session-start part alone, as the session-start message carries it" "found:" "$message"

echo "0 failed, 0 aborted"
