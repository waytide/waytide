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
control_display_text() {
  cat <<'DISPLAY'

Waytide: Human-in-the-Loop Harness

Copyright © 2026 Scott Bellware
Eventide Common Interest License

Loading Waytide will take a few moments.

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

control_display=$(control_display_text)

# Actuation ------------------------------------------------------------------

output=$(printf '{"prompt":"load waytide"}' | system/foundation/startup-display.sh)

# Is the the-startup-display-prints-as-the-session-starts's display, as plain text ---------------------------

display=$(printf '%s' "$output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])')

[ "$display" = "$control_display" ] || fail "Is the the-startup-display-prints-as-the-session-starts's display, as plain text" "found:" "$display"

# Prints the display on /load, the skill of load waytide -------------------------

load_output=$(printf '{"prompt":"/load"}' | system/foundation/startup-display.sh)
load_display=$(printf '%s' "$load_output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])' 2>/dev/null || true)

[ "$load_display" = "$control_display" ] || fail "Prints the display on /load, the skill of load waytide" "found:" "$load_output"

# Prints the display on /slasher:load ---------------------------------------------

namespaced_output=$(printf '{"prompt":"/slasher:load"}' | system/foundation/startup-display.sh)
namespaced_display=$(printf '%s' "$namespaced_output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])' 2>/dev/null || true)

[ "$namespaced_display" = "$control_display" ] || fail "Prints the display on /slasher:load" "found:" "$namespaced_output"

# Prints the display alone, as the hook's message carries it -----------------------

message=$(system/foundation/startup-display.sh message)
message_display=$(printf '"%s"' "$message" | python3 -c 'import json,sys; print(json.load(sys.stdin))' 2>/dev/null || true)

[ "$message_display" = "$control_display" ] || fail "Prints the display alone, as the hook's message carries it" "found:" "$message"

echo "0 failed, 0 aborted"
