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
Waytide: Human-Agent Relations

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

# Is the initialization-rule's display, as plain text ---------------------------

display=$(printf '%s' "$output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])')

[ "$display" = "$control_display" ] || fail "Is the initialization-rule's display, as plain text" "found:" "$display"

echo "0 failed, 0 aborted"
