#!/bin/sh
# Usage:
#
#   test/automated/install-machine-move-clash.sh
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

control_config_name=some-config
control_other_config_name=some-other-config

mkdir -p "$home/.config/waytide" "$home/.config/slasher"
echo some-config > "$home/.config/waytide/$control_config_name"
echo some-other-config > "$home/.config/slasher/$control_other_config_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# ----------------------------------------------------------------------------

old_file="$home/.config/waytide/$control_config_name"
own_file="$home/.config/slasher/$control_other_config_name"
moved_file="$home/.config/slasher/$control_config_name"

[ -f "$old_file" ] || fail "" "no longer under .config/waytide/:" "$control_config_name"
[ -f "$own_file" ] || fail "" "no longer under .config/slasher/:" "$control_other_config_name"
[ ! -e "$moved_file" ] || fail "" "appeared under .config/slasher/:" "$control_config_name"

echo "0 failed, 0 aborted"
