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

control_record_name=2026-01-01T00-00-00Z-some-item-OPEN.md
mkdir -p "$project/waytide/local/ideas"
printf '# Some item\n' > "$project/waytide/local/ideas/$control_record_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && sh "$installer" agents-md) > /dev/null

# Moves ideas to items ------------------------------------------------------

item="$project/waytide/local/items/$control_record_name"
ideas_dir="$project/waytide/local/ideas"

[ -f "$item" ] || fail "Moves ideas to items" "not in items/:" "$control_record_name"
[ ! -e "$ideas_dir" ] || fail "Moves ideas to items" "ideas/ is still present"

echo "0 failed, 0 aborted"
