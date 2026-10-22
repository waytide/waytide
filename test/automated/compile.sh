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
  source_without_history=$(awk '/^## (History|Compressed)$/ { history = 1 } /^(Related:|---$)/ { history = 0 } !history' "$source_rule")

  compiled_length=$(wc -l < "$compiled_rule")
  removed=$(printf '%s\n' "$source_without_history" | tail -n +$((compiled_length + 1)))

  printf '%s\n' "$source_without_history" | awk -v compiled_length="$compiled_length" 'NR <= compiled_length' | cmp -s - "$compiled_rule" || fail "Is its source rule without the footer" "not the start of its source:" "$name"
  printf '%s\n' "$removed" | grep -q '^Authored by ' || fail "Is its source rule without the footer" "footer not removed:" "$name"
  ! printf '%s\n' "$removed" | grep -v -q -E '^(---|Authored by .*|Changed by .*)?$' || fail "Is its source rule without the footer" "more than the footer removed:" "$name" "removed:" "$removed"
done

# Removes the History and Compressed sections -------------------------------

for source_rule in $source_rules; do
  compiled_rule=$(printf '%s' "$source_rule" | sed 's|/source/|/|')
  name=${source_rule#"$repository"/}

  ! grep -q -x -E '## (History|Compressed)' "$compiled_rule" || fail "Removes the History and Compressed sections" "History section not removed:" "$name"

  history=$(awk '/^## (History|Compressed)$/ { history = 1 } /^(Related:|---$)/ { history = 0 } history' "$source_rule" | grep -v '^$' || true)
  outside=$(diff "$source_rule" "$compiled_rule" | sed -n 's/^< //p' | grep -v '^$' | grep -v -E '^(---|Authored by .*|Changed by .*)$' | grep -v -x -F -e "$history" || true)

  [ -z "$outside" ] || fail "Removes the History and Compressed sections" "removed outside the History section:" "$name" "$outside"
done

# Controls — the compressed text -------------------------------------------

# Two literal rules, each read from a function rather than a heredoc inside $(…): macOS /bin/sh
# joins a line ending in a backslash to the next one there.
control_compressed_rule_text() {
  cat <<'RULE'
# Some rule

- **Solubility:** 50

Some body.

## Compressed

Some compressed text.

## History

Some history.

Related:

- some rule

---

Authored by Some One on Mon Jan 1 2026 at 1:00:00 PM PT
RULE
}

control_compressed_expected_text() {
  cat <<'RULE'
# Some rule

Some compressed text.

Related:

- some rule
RULE
}

control_uncompressed_rule_text() {
  cat <<'RULE'
# Some other rule

Some other body.

Related:

- some rule

---

Authored by Some One on Mon Jan 1 2026 at 1:00:00 PM PT
RULE
}

control_uncompressed_expected_text() {
  cat <<'RULE'
# Some other rule

Some other body.

Related:

- some rule
RULE
}

compressed_repository=$(mktemp -d)
trap 'rm -rf "$repository" "$compressed_repository"' EXIT

mkdir -p "$compressed_repository/system/some-package/source"
control_compressed_rule_text > "$compressed_repository/system/some-package/source/some-rule.md"
control_uncompressed_rule_text > "$compressed_repository/system/some-package/source/some-other-rule.md"
cp compile.sh "$compressed_repository/"

# Actuation — the compressed text -------------------------------------------

(cd "$compressed_repository" && ./compile.sh --compressed)

# Compiles the compressed text when switched --------------------------------

compressed_rule=$(cat "$compressed_repository/system/some-package/some-rule.md")
uncompressed_rule=$(cat "$compressed_repository/system/some-package/some-other-rule.md")

[ "$compressed_rule" = "$(control_compressed_expected_text)" ] || fail "Compiles the compressed text when switched" "found:" "$compressed_rule"
[ "$uncompressed_rule" = "$(control_uncompressed_expected_text)" ] || fail "Compiles the compressed text when switched" "found:" "$uncompressed_rule"

echo "0 failed, 0 aborted"
