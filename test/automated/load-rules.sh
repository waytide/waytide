#!/bin/sh
# Usage:
#
#   test/automated/load-rules.sh
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

mkdir -p "$project/system/foundation" "$project/system/sample" "$project/local/rules" "$project/local/journal/some-writer"
cp system/foundation/load-rules.sh "$project/system/foundation/"

echo some-foundation-rules > "$project/system/foundation/rules-pre-loaded.md"
echo some-foundation-vocabulary > "$project/system/foundation/vocabulary.md"
echo some-sample-rules > "$project/system/sample/rules-pre-loaded.md"

cat > "$project/system/sample/rules-on-demand.md" <<'RULES'
# Some rule c

Source: system/sample/source/c-rule.md

Trigger: When some-act

1. some-directive-c
RULES
echo some-local-rule > "$project/local/rules/some-rule.md"
echo some-local-vocabulary > "$project/local/vocabulary.md"
echo some-entry > "$project/local/journal/some-writer/2026-01-01T00-00-some-entry.md"

control_output() {
  cat <<'OUTPUT'
===== FILE: system/foundation/rules-pre-loaded.md =====

some-foundation-rules

===== FILE: system/foundation/vocabulary.md =====

some-foundation-vocabulary

===== FILE: system/sample/rules-pre-loaded.md =====

some-sample-rules

===== ON DEMAND: system/sample/rules-on-demand.md =====

- When some-act, run: system/foundation/load-rules.sh c-rule

===== FILE: local/rules/some-rule.md =====

some-local-rule

===== FILE: local/vocabulary.md =====

some-local-vocabulary

===== FILE: local/journal/some-writer/2026-01-01T00-00-some-entry.md =====

some-entry
OUTPUT
}

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && system/foundation/load-rules.sh)

# Prints every file the session reads, in order ---------------------------------

[ "$output" = "$(control_output)" ] || fail "Prints every file the session reads, in order" "output:" "$output"

# Prints the named on-demand rule ------------------------------------------------

control_rule_entry() {
  cat <<'RULE'
# Some rule c

Source: system/sample/source/c-rule.md

Trigger: When some-act

1. some-directive-c
RULE
}

rule_output=$(cd "$project" && system/foundation/load-rules.sh c-rule)

[ "$rule_output" = "$(control_rule_entry)" ] || fail "Prints the named on-demand rule" "output:" "$rule_output"

echo "2 passed"
