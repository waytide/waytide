#!/bin/sh
# Usage:
#
#   test/automated/install-observation-state.sh
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
installer="$(pwd)/system/foundation/install.sh"
items_dir="$project/waytide/local/items"

# Each text is read from a function rather than a heredoc inside $(…): macOS /bin/sh joins a line
# ending in a backslash to the next one there.
control_observation_text() {
  cat <<'ITEM'
# Some observation

- **State:** Stated
- **Tags:** [observation]

Some text.
ITEM
}

control_observation_expected_text() {
  cat <<'ITEM'
# Some observation

- **State:** Recorded
- **Tags:** [observation]

Some text.
ITEM
}

control_other_item_text() {
  cat <<'ITEM'
# Some other item

- **State:** Open
- **Tags:** [idea]

Some text.
ITEM
}

control_observation_name=2026-01-01T00-00-00Z-some-observation-STATED.md
control_observation_recorded_name=2026-01-01T00-00-00Z-some-observation-RECORDED.md
control_other_item_name=2026-01-01T00-00-01Z-some-other-item-OPEN.md

mkdir -p "$items_dir"
control_observation_text > "$items_dir/$control_observation_name"
control_other_item_text > "$items_dir/$control_other_item_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && sh "$installer" agents-md) > /dev/null

# Renames a stated observation to recorded ----------------------------------

recorded_observation="$items_dir/$control_observation_recorded_name"
stated_observation="$items_dir/$control_observation_name"

[ -f "$recorded_observation" ] || fail "Renames a stated observation to recorded" "not present:" "$control_observation_recorded_name"
[ ! -e "$stated_observation" ] || fail "Renames a stated observation to recorded" "still present:" "$control_observation_name"

# Changes the state line to recorded ----------------------------------------

observation=$(cat "$recorded_observation")

[ "$observation" = "$(control_observation_expected_text)" ] || fail "Changes the state line to recorded" "found:" "$observation"

# Leaves an item that is not an observation unchanged -----------------------

other_item=$(cat "$items_dir/$control_other_item_name")

[ "$other_item" = "$(control_other_item_text)" ] || fail "Leaves an item that is not an observation unchanged" "found:" "$other_item"

echo "0 failed, 0 aborted"
