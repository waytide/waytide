#!/bin/sh
# Usage:
#
#   test/automated/install-layout-move.sh
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

mkdir -p "$project/waytide/local/items"
echo some-item > "$project/waytide/local/items/$control_record_name"

mkdir -p "$project/waytide/system/foundation"
cp -R system/foundation/plugin "$project/waytide/system/foundation/"

# Actuation ------------------------------------------------------------------

(cd "$project" && sh "$installer" agents-md) > /dev/null

# ----------------------------------------------------------------------------

moved_record="$project/slasher/local/items/$control_record_name"
old_dir="$project/waytide"

[ -f "$moved_record" ] || fail "" "not under slasher/:" "$control_record_name"
[ ! -e "$old_dir" ] || fail "" "waytide/ is still present"

echo "0 failed, 0 aborted"
