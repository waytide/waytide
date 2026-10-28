#!/bin/sh
# Usage:
#
#   test/automated/package-rules-file.sh
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

repository=$(mktemp -d)
trap 'rm -rf "$repository"' EXIT

mkdir -p "$repository/system/sample/source"
cp compile.sh "$repository/"

control_rule() {
  cat <<RULE
# Some rule $1

some-body-$1

## Compressed

1. some-directive-$1

---

Authored by some-author on some-date
RULE
}

control_rule a > "$repository/system/sample/source/a-rule.md"
control_rule b > "$repository/system/sample/source/b-rule.md"

control_rules_file() {
  cat <<'RULES'
# Some rule a

Source: system/sample/source/a-rule.md

1. some-directive-a

# Some rule b

Source: system/sample/source/b-rule.md

1. some-directive-b
RULES
}

# Actuation ------------------------------------------------------------------

(cd "$repository" && ./compile.sh)

# Writes each rule's title, source, and compressed text --------------------------

rules_file="$repository/system/sample/rules.md"

[ -f "$rules_file" ] || fail "Writes each rule's title, source, and compressed text" "no rules file:" "system/sample/rules.md"

control_rules_file | cmp -s - "$rules_file" || fail "Writes each rule's title, source, and compressed text" "rules file:" "$(cat "$rules_file")"

echo "1 passed"
