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
DISPLAY
}

control_load_line="Waytide's rules will load on the first prompt, or enter: /load"

control_loading_text() {
  cat <<'DISPLAY'

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

Slasher is pre-loading its rules...
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

# Prints the figure and the loading line on a session's first prompt ---------------

loading=$(printf '%s' "$output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])' 2>/dev/null || true)

[ "$loading" = "$control_loading" ] || fail "Prints the figure and the loading line on a session's first prompt" "found:" "$output"

# Prints nothing on a later prompt in the same session -------------------------------

later_output=$(printf '%s' "$control_event" | system/foundation/startup-display.sh)

[ -z "$later_output" ] || fail "Prints nothing on a later prompt in the same session" "found:" "$later_output"

# Prints the session-start part alone, as the session-start message carries it ------

message=$(system/foundation/startup-display.sh message)
start=$(printf '"%s"' "$message" | python3 -c 'import json,sys; print(json.load(sys.stdin))' 2>/dev/null || true)

[ "$start" = "$control_start" ] || fail "Prints the session-start part alone, as the session-start message carries it" "found:" "$message"

# Prints the load line alone, for session-start.sh to put last ------------------------

load_line=$(system/foundation/startup-display.sh load-line)
load_line_text=$(printf '"%s"' "$load_line" | python3 -c 'import json,sys; print(json.load(sys.stdin))' 2>/dev/null || true)

[ "$load_line_text" = "$control_load_line" ] || fail "Prints the load line alone, for session-start.sh to put last" "found:" "$load_line"

echo "0 failed, 0 aborted"
