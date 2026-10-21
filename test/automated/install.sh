#!/bin/sh
# Usage:
#
#   test/automated/install.sh
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

# Each text is read from a function rather than a heredoc inside $(…): macOS /bin/sh joins a line
# ending in a backslash to the next one there.
control_no_kind_text() {
  cat <<'ITEM'
# Some item

- **State:** Open

Some text.
ITEM
}

control_no_kind_expected_text() {
  cat <<'ITEM'
# Some item

- **State:** Open
- **Tags:** [idea]

Some text.
ITEM
}

control_other_tag_text() {
  cat <<'ITEM'
# Some other item

- **State:** Open
- **Tags:** [deferred]

Some text.
ITEM
}

control_other_tag_expected_text() {
  cat <<'ITEM'
# Some other item

- **State:** Open
- **Tags:** [idea] [deferred]

Some text.
ITEM
}

control_design_text() {
  cat <<'ITEM'
# Some design

- **State:** Active
- **Tags:** [design]

Some text.
ITEM
}

control_no_kind_name=2026-01-01T00-00-00Z-some-item-OPEN.md
control_other_tag_name=2026-01-01T00-00-01Z-some-other-item-OPEN.md
control_design_name=2026-01-01T00-00-02Z-some-design-ACTIVE.md

mkdir -p "$project/waytide/local/ideas"
control_no_kind_text > "$project/waytide/local/ideas/$control_no_kind_name"
control_other_tag_text > "$project/waytide/local/ideas/$control_other_tag_name"
control_design_text > "$project/waytide/local/ideas/$control_design_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && sh "$installer" agents-md) > /dev/null

# Moves ideas to items ------------------------------------------------------

item="$project/waytide/local/items/$control_no_kind_name"
ideas_dir="$project/waytide/local/ideas"

[ -f "$item" ] || fail "Moves ideas to items" "not in items/:" "$control_no_kind_name"
[ ! -e "$ideas_dir" ] || fail "Moves ideas to items" "ideas/ is still present"

# Tags an item without a kind as an idea ----------------------------------

no_kind_item=$(cat "$project/waytide/local/items/$control_no_kind_name")
other_tag_item=$(cat "$project/waytide/local/items/$control_other_tag_name")
design_item=$(cat "$project/waytide/local/items/$control_design_name")

[ "$no_kind_item" = "$(control_no_kind_expected_text)" ] || fail "Tags an item without a kind as an idea" "found:" "$no_kind_item"
[ "$other_tag_item" = "$(control_other_tag_expected_text)" ] || fail "Tags an item without a kind as an idea" "found:" "$other_tag_item"
[ "$design_item" = "$(control_design_text)" ] || fail "Tags an item without a kind as an idea" "found:" "$design_item"

echo "0 failed, 0 aborted"
