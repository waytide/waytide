#!/bin/sh
# Usage:
#
#   test/automated/install-layout-move-agents-md.sh
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
home=$(mktemp -d)
trap 'rm -rf "$project" "$home"' EXIT
installer="$(pwd)/system/foundation/install.sh"

control_old_section() {
  cat <<'SECTION'
## Waytide

Read every rule file under `waytide/system/`.
SECTION
}

mkdir -p "$project/waytide/local"
control_old_section > "$project/AGENTS.md"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# ----------------------------------------------------------------------------

! grep -q 'waytide/system/' "$project/AGENTS.md" || fail "" "still names waytide/system/"
grep -q 'slasher/system/' "$project/AGENTS.md" || fail "" "does not name slasher/system/"

echo "0 failed, 0 aborted"
