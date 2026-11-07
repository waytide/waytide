#!/bin/sh
# Usage:
#
#   test/automated/install-machine-move.sh
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
control_data_name=some-data

mkdir -p "$home/.config/waytide" "$home/.local/share/waytide"
echo some-config > "$home/.config/waytide/$control_config_name"
echo some-data > "$home/.local/share/waytide/$control_data_name"

# Actuation ------------------------------------------------------------------

(cd "$project" && HOME="$home" sh "$installer" agents-md) > /dev/null

# Moves the machine's waytide folders to slasher -----------------------------

moved_config="$home/.config/slasher/$control_config_name"
moved_data="$home/.local/share/slasher/$control_data_name"
old_config_dir="$home/.config/waytide"
old_data_dir="$home/.local/share/waytide"

[ -f "$moved_config" ] || fail "Moves the machine's waytide folders to slasher" "not under .config/slasher/:" "$control_config_name"
[ -f "$moved_data" ] || fail "Moves the machine's waytide folders to slasher" "not under .local/share/slasher/:" "$control_data_name"
[ ! -e "$old_config_dir" ] || fail "Moves the machine's waytide folders to slasher" ".config/waytide/ is still present"
[ ! -e "$old_data_dir" ] || fail "Moves the machine's waytide folders to slasher" ".local/share/waytide/ is still present"

echo "0 failed, 0 aborted"
