#!/bin/sh
# Usage:
#
#   test/automated/session-start.sh
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

mkdir -p "$project/system/foundation"
cp system/foundation/session-start.sh "$project/system/foundation/"
echo some-readme > "$project/system/foundation/README.md"

control_event='{"session_id": "some-session", "hook_event_name": "SessionStart", "source": "compact"}'

control_compaction_text="The context has just been compacted. The rules read at the start of this session now survive only as the compaction's summary, which does not hold them. Before your next act, whatever the next request is, run the loader again and read its whole output, as follows."

# Actuation ------------------------------------------------------------------

output=$(cd "$project" && echo "$control_event" | sh system/foundation/session-start.sh)

# On a compaction, the read instruction says the rules survive only as a summary and must be read again

case "$output" in
  *"\"additionalContext\": \"$control_compaction_text "*) ;;
  *) fail "On a compaction, the read instruction says the rules survive only as a summary and must be read again" "output:" "$output" ;;
esac

# With a package set declared, the read instruction says deactivated packages are listed, not printed

mkdir -p "$project/system/other" "$project/local"
echo some-readme > "$project/system/other/README.md"

cat > "$project/local/2026-01-01T00-00-00Z-some-set-package-set.md" <<'SET'
# Some set package set

- **Package set:** some-set
- **Packages:** foundation
- **Inactive:** other
SET

control_set_text="This project has declared a package set: some-set. The active packages are foundation, and the deactivated ones are other. The loader does not print a deactivated package's rules; its DEACTIVATED section names the command that loads it. If the engineer reactivates a deactivated package during the session, run that command and follow its rules from then on. Follow only the active packages' rules."

set_output=$(cd "$project" && sh system/foundation/session-start.sh < /dev/null)

case "$set_output" in
  *"$control_set_text"*) ;;
  *) fail "With a package set declared, the read instruction says deactivated packages are listed, not printed" "output:" "$set_output" ;;
esac

# Prints the read instruction alone, as the hook emits it -------------------------

control_instruction=$(printf '%s' "$set_output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["hookSpecificOutput"]["additionalContext"])')

instruction_output=$(cd "$project" && sh system/foundation/session-start.sh instruction < /dev/null)

[ "$instruction_output" = "$control_instruction" ] || fail "Prints the read instruction alone, as the hook emits it" "output:" "$instruction_output"

# Prints the startup display ahead of the notice, in one message -----------------

mkdir -p "$project/system/foundation/source"
cp system/foundation/startup-display.sh "$project/system/foundation/"
cp system/foundation/source/the-startup-display-prints-as-the-session-starts.md "$project/system/foundation/source/"

control_display=$(cd "$project" && system/foundation/startup-display.sh message | sed 's/^/"/; s/$/"/' | python3 -c 'import json,sys; print(json.load(sys.stdin))')

display_output=$(cd "$project" && sh system/foundation/session-start.sh < /dev/null)
display_message=$(printf '%s' "$display_output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])')

case "$display_message" in
  "$control_display

Slasher installed at "*) ;;
  *) fail "Prints the startup display ahead of the notice, in one message" "message:" "$display_message" ;;
esac

# Ends with the display's load line, after the install line --------------------------

control_load_line=$(cd "$project" && system/foundation/startup-display.sh load-line | sed 's/^/"/; s/$/"/' | python3 -c 'import json,sys; print(json.load(sys.stdin))')

control_message="$control_display

Slasher installed at system/ — 2 packages: foundation, other

$control_load_line"

[ "$display_message" = "$control_message" ] || fail "Ends with the display's load line, after the install line" "message:" "$display_message"

# Sets the open implementations apart from the install line with a blank line ------

mkdir -p "$project/local/implementations"
cat > "$project/local/implementations/2026-01-01T00-00-00Z-some-feature-ACTIVE.md" <<'RECORD'
# Feature — Some feature

- **State:** Active
RECORD

open_output=$(cd "$project" && sh system/foundation/session-start.sh < /dev/null)
open_message=$(printf '%s' "$open_output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["systemMessage"])')

case "$open_message" in
  *"Slasher installed at system/ — 2 packages: foundation, other

1 implementation open: "*) ;;
  *) fail "Sets the open implementations apart from the install line with a blank line" "message:" "$open_message" ;;
esac

# Carries the core rules after the read instruction ---------------------------------

cp system/foundation/load-rules.sh "$project/system/foundation/"
mkdir -p "$project/system/sample"
echo some-core-rule > "$project/system/foundation/core-rules"

cat > "$project/system/sample/rules-pre-loaded.md" <<'RULES'
# Some core rule

Source: system/sample/source/some-core-rule.md

1. Some "quoted" directive.
RULES

control_core_rule="# Some core rule

Source: system/sample/source/some-core-rule.md

1. Some \"quoted\" directive."
control_core_rule=$(printf '%s' "$control_core_rule" | sed 's/\\"/"/g')

core_output=$(cd "$project" && sh system/foundation/session-start.sh < /dev/null)
core_context=$(printf '%s' "$core_output" | python3 -c 'import json,sys; print(json.load(sys.stdin)["hookSpecificOutput"]["additionalContext"])' 2>/dev/null || true)

case "$core_context" in
  *"$control_core_rule"*) ;;
  *) fail "Carries the core rules after the read instruction" "context:" "$core_context" ;;
esac

# Keeps this repository's context within the hook's 10,000 characters --------------

repository_context=$(printf '{"source":"startup"}' | system/foundation/session-start.sh | python3 -c 'import json,sys; print(json.load(sys.stdin)["hookSpecificOutput"]["additionalContext"])')
repository_length=$(printf '%s' "$repository_context" | python3 -c 'import sys; print(len(sys.stdin.read()))')

[ "$repository_length" -le 10000 ] || fail "Keeps this repository's context within the hook's 10,000 characters" "length:" "$repository_length"

echo "8 passed"
