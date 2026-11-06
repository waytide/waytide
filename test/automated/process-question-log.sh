#!/bin/sh
# Usage:
#
#   test/automated/process-question-log.sh
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

script=$PWD/system/foundation/process-question-log.sh

# Controls -------------------------------------------------------------------

control_directory=$(mktemp -d)
trap 'rm -rf "$control_directory"' EXIT

marked_log=$control_directory/marked
unmarked_log=$control_directory/unmarked
mkdir "$marked_log" "$unmarked_log"

control_question='{"question": "Some question?", "header": "Some header", "multiSelect": false, "options": [{"label": "Some option", "description": "Some description."}, {"label": "Some other option", "description": "Some other description."}]}'
control_other_question='{"question": "Some other question?\n\nSome detail.", "header": "Some other", "multiSelect": false, "options": [{"label": "Some option", "description": "Some description."}]}'

control_marked_event=$(cat <<EOF
{"session_id": "some-session", "hook_event_name": "PostToolUse", "tool_name": "AskUserQuestion",
 "tool_input": {"questions": [$control_question, $control_other_question], "metadata": {"source": "decision"}},
 "tool_response": {"questions": [$control_question, $control_other_question],
   "answers": {"Some question?": "Some other option", "Some other question?\n\nSome detail.": "Some option"},
   "annotations": {"Some question?": {"notes": "Some note."}}}}
EOF
)

control_unmarked_event=$(cat <<EOF
{"session_id": "some-session", "hook_event_name": "PostToolUse", "tool_name": "AskUserQuestion",
 "tool_input": {"questions": [$control_question]},
 "tool_response": {"questions": [$control_question], "answers": {"Some question?": "Some option"}, "annotations": {}}}
EOF
)

# Actuation ------------------------------------------------------------------

printf '%s' "$control_marked_event" | "$script" "$marked_log"
printf '%s' "$control_unmarked_event" | "$script" "$unmarked_log"

# Writes one log entry for each question of a process question --------------

count=$(ls "$marked_log" | wc -l | tr -d ' ')
[ "$count" = 2 ] || fail "Writes one log entry for each question of a process question" "found $count entries:" "$(ls "$marked_log")"

entry=$(ls "$marked_log"/*-some-question.md 2>/dev/null | head -1)
[ -n "$entry" ] || fail "Names the entry for its question" "found:" "$(ls "$marked_log")"

# Titles the entry with the question and the engineer's answer ---------------

title=$(head -1 "$entry")
[ "$title" = "# Some question? — Some other option, selected by the engineer" ] || fail "Titles the entry with the question and the engineer's answer" "found:" "$title"

# Tags the entry as the engineer's decision ----------------------------------

grep -qx '\*\*Tags:\*\* \[decision\]' "$entry" || fail "Tags the entry as the engineer's decision" "found:" "$(cat "$entry")"

# Records the options and the engineer's notes -------------------------------

grep -qx -- '- \*\*Some option\*\* — Some description\.' "$entry" || fail "Records the options" "found:" "$(cat "$entry")"
grep -qx "The engineer's notes: Some note\." "$entry" || fail "Records the engineer's notes" "found:" "$(cat "$entry")"

# Titles a question of several lines by its first line ----------------------

other_entry=$(ls "$marked_log"/*-some-other-question.md 2>/dev/null | head -1)
[ -n "$other_entry" ] || fail "Names the entry for the first line of its question" "found:" "$(ls "$marked_log")"
other_title=$(head -1 "$other_entry")
[ "$other_title" = "# Some other question? — Some option, selected by the engineer" ] || fail "Titles a question of several lines by its first line" "found:" "$other_title"

# Writes nothing for a mechanical question -----------------------------------

count=$(ls "$unmarked_log" | wc -l | tr -d ' ')
[ "$count" = 0 ] || fail "Writes nothing for a mechanical question" "found $count entries:" "$(ls "$unmarked_log")"

echo "0 failed, 0 aborted"
