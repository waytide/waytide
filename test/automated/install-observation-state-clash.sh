#!/bin/sh
# Usage:
#
#   test/automated/install-observation-state-clash.sh
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
items_dir="$project/slasher/local/items"

control_stated_text() {
  cat <<'ITEM'
# Some observation

- **State:** Stated
- **Tags:** [observation]

Some text.
ITEM
}

control_recorded_text() {
  cat <<'ITEM'
# Some observation

- **State:** Recorded
- **Tags:** [observation]

Some other text.
ITEM
}

control_stated_name=2026-01-01T00-00-00Z-some-observation-STATED.md
control_recorded_name=2026-01-01T00-00-00Z-some-observation-RECORDED.md

mkdir -p "$items_dir"
control_stated_text > "$items_dir/$control_stated_name"
control_recorded_text > "$items_dir/$control_recorded_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" XDG_CONFIG_HOME= XDG_DATA_HOME= sh "$installer" agents-md) > /dev/null

# Changes neither file when both names are present --------------------------

stated=$(cat "$items_dir/$control_stated_name")
recorded=$(cat "$items_dir/$control_recorded_name")

[ "$stated" = "$(control_stated_text)" ] || fail "Changes neither file when both names are present" "stated file found:" "$stated"
[ "$recorded" = "$(control_recorded_text)" ] || fail "Changes neither file when both names are present" "recorded file found:" "$recorded"

echo "0 failed, 0 aborted"
