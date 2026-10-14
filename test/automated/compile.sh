#!/bin/sh
# Usage:
#
#   test/automated/compile.sh
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

# A control repository holding this repository's own source rules and nothing compiled from
# them, so the test reads what the actuation writes rather than what is committed.
repository=$(mktemp -d)
trap 'rm -rf "$repository"' EXIT

for source in system/*/source; do
  mkdir -p "$repository/$(dirname "$source")"
  cp -R "$source" "$repository/$source"
done
cp compile.sh "$repository/"

source_rules=$(find "$repository/system" -path '*/source/*' -name '*.md' | sort)

[ -n "$source_rules" ] || fail "Control repository" "no source rules in the control repository"

# Actuation ------------------------------------------------------------------

(cd "$repository" && ./compile.sh)

# Is its source rule without the footer ---------------------------------------

for source_rule in $source_rules; do
  compiled_rule=$(printf '%s' "$source_rule" | sed 's|/source/|/|')
  name=${source_rule#"$repository"/}

  [ -f "$compiled_rule" ] || fail "Is its source rule without the footer" "no compiled rule for:" "$name"

  # The source rule as it reads with its History section left out, which the other outcome reads.
  source_without_history=$(awk '/^## History$/ { history = 1 } /^(Related:|---$)/ { history = 0 } !history' "$source_rule")

  compiled_length=$(wc -l < "$compiled_rule")
  removed=$(printf '%s\n' "$source_without_history" | tail -n +$((compiled_length + 1)))

  printf '%s\n' "$source_without_history" | awk -v compiled_length="$compiled_length" 'NR <= compiled_length' | cmp -s - "$compiled_rule" || fail "Is its source rule without the footer" "not the start of its source:" "$name"
  printf '%s\n' "$removed" | grep -q '^Authored by ' || fail "Is its source rule without the footer" "footer not removed:" "$name"
  ! printf '%s\n' "$removed" | grep -v -q -E '^(---|Authored by .*|Changed by .*)?$' || fail "Is its source rule without the footer" "more than the footer removed:" "$name" "removed:" "$removed"
done

# Removes only the History section -------------------------------------------

for source_rule in $source_rules; do
  compiled_rule=$(printf '%s' "$source_rule" | sed 's|/source/|/|')
  name=${source_rule#"$repository"/}

  ! grep -q -x '## History' "$compiled_rule" || fail "Removes only the History section" "History section not removed:" "$name"

  history=$(awk '/^## History$/ { history = 1 } /^(Related:|---$)/ { history = 0 } history' "$source_rule" | grep -v '^$' || true)
  outside=$(diff "$source_rule" "$compiled_rule" | sed -n 's/^< //p' | grep -v '^$' | grep -v -E '^(---|Authored by .*|Changed by .*)$' | grep -v -x -F -e "$history" || true)

  [ -z "$outside" ] || fail "Removes only the History section" "removed outside the History section:" "$name" "$outside"
done

echo "0 failed, 0 aborted"
