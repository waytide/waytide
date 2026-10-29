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
if [ -n "$1" ] && [ "$1" != "--package" ]; then
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

# A vocabulary or a local rule with a Compressed section is printed as its title and that section:
# its full text, History, Related list, and footer are left out. Without one, it is printed whole.
print_compressed() {
  [ -f "$1" ] || return 0
  grep -qx '## Compressed' "$1" || { print_file "$1"; return 0; }
  [ "$first" -eq 1 ] || echo
  first=0
  echo "===== FILE: $1 ====="
  echo
  awk '
    NR == 1 { print; print ""; next }
    $0 == "## Compressed" { inside = 1; next }
    inside && ($0 ~ /^## (Compression|History)$/ || $0 ~ /^Related:/ || $0 == "---") { exit }
    inside { line[++n] = $0 }
    END {
      first = 1; while (first <= n && line[first] == "") first++
      while (n >= first && line[n] == "") n--
      for (i = first; i <= n; i++) print line[i]
    }
  ' "$1"
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

# Given --package and a package's name, print that package alone, as the full read prints it when
# it is active: its pre-loaded rules, its on-demand triggers, and its vocabulary.
if [ "$1" = "--package" ]; then
  [ -n "$2" ] && [ -d "$system/$2" ] || { echo "No package named $2" >&2; exit 1; }
  print_file "$system/$2/rules-pre-loaded.md"
  print_index "$system/$2/rules-on-demand.md"
  print_compressed "$system/$2/vocabulary.md"
  exit 0
fi

# The packages the project's latest package set deactivates, one name per line. A project with no
# declaration has none.
declaration=$(ls "$local"/*-package-set.md 2>/dev/null | sort | tail -1)
deactivated=
if [ -n "$declaration" ]; then
  deactivated=$(sed -n 's|^[[:space:]]*-\{0,1\}[[:space:]]*\*\*Inactive:\*\*[[:space:]]*\(.*\)$|\1|p' "$declaration" |
    head -1 | tr ',' '\n' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' | grep -v '^none$' || true)
fi

# A deactivated package's rules are not printed. Its name is, with the command that loads it.
print_deactivated() {
  [ "$first" -eq 1 ] || echo
  first=0
  echo "===== DEACTIVATED: $1 ====="
  echo
  echo "- Its rules are not printed. If the engineer reactivates it, run: $system/foundation/load-rules.sh --package ${1##*/}"
}

for package in "$system/foundation" $(ls -d "$system"/*/ | sed 's|/$||' | grep -v "^$system/foundation$" | sort); do
  if printf '%s\n' "$deactivated" | grep -qx "${package##*/}"; then
    print_deactivated "$package"
    continue
  fi
  print_file "$package/rules-pre-loaded.md"
  print_index "$package/rules-on-demand.md"
  print_compressed "$package/vocabulary.md"
done

for rule in $(ls "$local"/rules/*.md 2>/dev/null | sort); do
  print_compressed "$rule"
done

print_compressed "$local/vocabulary.md"

# Oldest first across writers: sorted by the entry's file name, which leads with its datetime.
for entry in $(ls "$local"/journal/*/*.md 2>/dev/null | awk -F/ '{ print $NF "\t" $0 }' | sort | cut -f2); do
  print_file "$entry"
done
