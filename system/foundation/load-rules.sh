#!/bin/sh
# Print every file the session-start read covers, each under a line naming it, in one output.
#
# Run from the project root:
#
#   waytide/system/foundation/load-rules.sh     in a consuming project
#   system/foundation/load-rules.sh             in the Waytide authoring source
#
# The order is fixed: foundation's rules file and vocabulary, then each other package's, in name
# order; then the project's local rules, in name order; then its vocabulary; then its journal
# entries, oldest first across every writer. A file that does not exist is passed over.
set -e

# Locate the system and the project's own directory: waytide/ in a consuming project, the root
# in the Waytide authoring source. Checked in that order — a consuming project may have a
# system/ directory of its own.
if [ -d waytide/system ]; then
  system=waytide/system
  local=waytide/local
else
  system=system
  local=local
fi

first=1

print_file() {
  [ -f "$1" ] || return 0
  [ "$first" -eq 1 ] || echo
  first=0
  echo "===== FILE: $1 ====="
  echo
  cat "$1"
}

for package in "$system/foundation" $(ls -d "$system"/*/ | sed 's|/$||' | grep -v "^$system/foundation$" | sort); do
  print_file "$package/rules-pre-loaded.md"
  print_file "$package/vocabulary.md"
done

for rule in $(ls "$local"/rules/*.md 2>/dev/null | sort); do
  print_file "$rule"
done

print_file "$local/vocabulary.md"

# Oldest first across writers: sorted by the entry's file name, which leads with its datetime.
for entry in $(ls "$local"/journal/*/*.md 2>/dev/null | awk -F/ '{ print $NF "\t" $0 }' | sort | cut -f2); do
  print_file "$entry"
done
