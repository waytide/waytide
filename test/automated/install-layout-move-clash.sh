#!/bin/sh
# Usage:
#
#   test/automated/install-layout-move-clash.sh
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

control_record_name=2026-01-01T00-00-00Z-some-item-OPEN.md
control_other_record_name=2026-01-01T00-00-01Z-some-other-item-OPEN.md

mkdir -p "$project/waytide/local/items" "$project/slasher/local/items"
echo some-item > "$project/waytide/local/items/$control_record_name"
echo some-other-item > "$project/slasher/local/items/$control_other_record_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# ----------------------------------------------------------------------------

old_record="$project/waytide/local/items/$control_record_name"
own_record="$project/slasher/local/items/$control_other_record_name"
moved_record="$project/slasher/local/items/$control_record_name"

[ -f "$old_record" ] || fail "" "no longer under waytide/:" "$control_record_name"
[ -f "$own_record" ] || fail "" "no longer under slasher/:" "$control_other_record_name"
[ ! -e "$moved_record" ] || fail "" "appeared under slasher/:" "$control_record_name"

echo "0 failed, 0 aborted"
