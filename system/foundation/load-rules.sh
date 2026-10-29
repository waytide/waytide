#!/bin/sh
# Print every file the session-start read covers, each under a line naming it, in one output.
#
# Run from the project root:
#
#   waytide/system/foundation/load-rules.sh     in a consuming project
#   system/foundation/load-rules.sh             in the Waytide authoring source
#   system/foundation/load-rules.sh <rule-name> one on-demand rule, when its trigger comes up
#
# The order is fixed: foundation's pre-loaded rules, the triggers of its on-demand rules, and its
# vocabulary; then each other package's, in name order; then the project's local rules, in name
# order; then its vocabulary; then its journal entries, oldest first across every writer. A file
# that does not exist is passed over.
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

# Given a rule's name, print that on-demand rule's entry alone: its title, source, trigger, and
# compressed text.
if [ -n "$1" ]; then
  awk -v name="$1" '
    function flush() {
      if (found) { while (n > 0 && entry[n] == "") n--; for (i = 1; i <= n; i++) print entry[i]; done = 1 }
      n = 0; found = 0
    }
    /^# / { flush() }
    { entry[++n] = $0 }
    /^Source: / { k = split($2, parts, "/"); if (parts[k] == name ".md") found = 1 }
    END { flush(); if (!done) exit 1 }
  ' "$system"/*/rules-on-demand.md 2>/dev/null || { echo "No on-demand rule named $1" >&2; exit 1; }
  exit 0
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

# A package's on-demand rules are not printed. Each one's trigger is, with the command that loads
# it: the rule's name is its source file's name.
print_index() {
  [ -f "$1" ] || return 0
  [ "$first" -eq 1 ] || echo
  first=0
  echo "===== ON DEMAND: $1 ====="
  echo
  awk -v loader="$system/foundation/load-rules.sh" '
    /^Source: / { n = split($2, parts, "/"); name = parts[n]; sub(/\.md$/, "", name) }
    /^Trigger: / { trigger = substr($0, 10); print "- " trigger ", run: " loader " " name }
  ' "$1"
}

for package in "$system/foundation" $(ls -d "$system"/*/ | sed 's|/$||' | grep -v "^$system/foundation$" | sort); do
  print_file "$package/rules-pre-loaded.md"
  print_index "$package/rules-on-demand.md"
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
