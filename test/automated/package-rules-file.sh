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

cat > "$repository/system/sample/source/c-rule.md" <<'RULE'
# Some rule c

**Trigger:** When some-act

some-body-c

## Compressed

1. some-directive-c

---

Authored by some-author on some-date
RULE

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

control_triggered_file() {
  cat <<'RULES'
# Some rule c

Source: system/sample/source/c-rule.md

Trigger: When some-act

1. some-directive-c
RULES
}

# Actuation ------------------------------------------------------------------

(cd "$repository" && ./compile.sh)

# Writes each rule's title, source, and compressed text --------------------------

rules_file="$repository/system/sample/rules-pre-loaded.md"

[ -f "$rules_file" ] || fail "Writes each rule's title, source, and compressed text" "no rules file:" "system/sample/rules-pre-loaded.md"

control_rules_file | cmp -s - "$rules_file" || fail "Writes each rule's title, source, and compressed text" "rules file:" "$(cat "$rules_file")"

# Writes each triggered rule to rules-on-demand.md, with its trigger ----------------------

triggered_file="$repository/system/sample/rules-on-demand.md"

[ -f "$triggered_file" ] || fail "Writes each triggered rule to rules-on-demand.md, with its trigger" "no triggered file:" "system/sample/rules-on-demand.md"

control_triggered_file | cmp -s - "$triggered_file" || fail "Writes each triggered rule to rules-on-demand.md, with its trigger" "triggered file:" "$(cat "$triggered_file")"

echo "2 passed"
